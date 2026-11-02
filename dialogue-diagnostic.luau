-- yanus hub: inspect the currently open dialogue without clicking it.
-- Copies the JSON report to your clipboard when supported.
local player = game:GetService("Players").LocalPlayer
local gui = player:FindFirstChild("PlayerGui")
assert(gui, "PlayerGui is not loaded")
local env = type(getgenv) == "function" and getgenv() or {}
local report = {
    version = 1, build = env.__YanusBuild or "missing",
    status = env.__TensenAutoQuest and env.__TensenAutoQuest.Status or "missing",
    clickHelper = env.__TensenAutoQuest and type(env.__TensenAutoQuest.ClickChoice) or "missing",
    getconnections = type(getconnections), candidates = {}, dialogueTree = {}, screens = {},
}
local function normal(text)
    return tostring(text or ""):lower():gsub("<[^>]*>", ""):gsub("[^%w]", "")
end
local function path(item)
    local names = {}
    while item and item ~= gui do table.insert(names,1,item.Name); item=item.Parent end
    return table.concat(names,"/")
end
local function shown(item)
    while item and item ~= gui do
        if item:IsA("GuiObject") and not item.Visible then return false end
        if item:IsA("ScreenGui") and not item.Enabled then return false end
        item=item.Parent
    end
    return item == gui
end
local function describe(item, includeEvents)
    local data = { path=path(item), class=item.ClassName, visible=shown(item) }
    if item:IsA("GuiObject") then
        data.position={x=item.AbsolutePosition.X,y=item.AbsolutePosition.Y}
        data.size={x=item.AbsoluteSize.X,y=item.AbsoluteSize.Y}
        data.active=item.Active
        data.zIndex=item.ZIndex
    end
    if item:IsA("ScreenGui") then
        data.enabled=item.Enabled
        data.ignoreGuiInset=item.IgnoreGuiInset
    end
    if item:IsA("TextLabel") or item:IsA("TextButton") or item:IsA("TextBox") then
        data.text=item.Text:sub(1,200)
        pcall(function()data.contentText=item.ContentText:sub(1,200)end)
    end
    if includeEvents and type(getconnections)=="function" then
        data.events={}
        for _,name in ipairs({"MouseButton1Click","Activated","InputBegan","MouseButton1Down","MouseButton1Up"}) do
            local ok,result=pcall(function()return getconnections(item[name])end)
            if ok and type(result)=="table" then data.events[name]=#result end
        end
    end
    return data
end
local ok,inset=pcall(function()return game:GetService("GuiService"):GetGuiInset()end)
if ok and inset then report.inset={x=inset.X,y=inset.Y}end
local roots={}
local dialogue=gui:FindFirstChild("Dialogue")
if dialogue then roots[#roots+1]=dialogue end
for _,root in ipairs(gui:GetChildren()) do
    if root:IsA("ScreenGui") then report.screens[#report.screens+1]={name=root.Name,enabled=root.Enabled,ignoreGuiInset=root.IgnoreGuiInset}end
    if root~=dialogue and (not root:IsA("ScreenGui") or root.Enabled) then roots[#roots+1]=root end
end
local total=0
for _,root in ipairs(roots) do
    local queue,index={root},1
    while index<=#queue and total<16000 and index<=4000 do
        local item=queue[index];index+=1;total+=1
        if root==dialogue and #report.dialogueTree<180 and item:IsA("GuiObject") then
            report.dialogueTree[#report.dialogueTree+1]=describe(item,false)
        end
        if (item:IsA("TextLabel") or item:IsA("TextButton") or item:IsA("TextBox")) and shown(item) then
            local text=normal(item.Text)
            if text:find("howcanihelp",1,true) or text:find("alright",1,true) then
                if #report.candidates<12 then
                    local candidate={node=describe(item,true),ancestors={}}
                    local ancestor=item.Parent
                    for i=1,6 do
                        if not ancestor or ancestor==gui then break end
                        candidate.ancestors[#candidate.ancestors+1]=describe(ancestor,true)
                        ancestor=ancestor.Parent
                    end
                    report.candidates[#report.candidates+1]=candidate
                end
            end
        end
        for _,child in ipairs(item:GetChildren())do if #queue<4500 then queue[#queue+1]=child end end
        if total%100==0 then task.wait()end
    end
    if total>=16000 then report.truncated=true;break end
end
report.inspected=total
local encoded=game:GetService("HttpService"):JSONEncode(report)
print("[yanus dialogue diagnostic] "..encoded)
if type(writefile)=="function" then pcall(writefile,"yanus-dialogue-report.json",encoded)end
if type(setclipboard)=="function" then
    local copied=pcall(setclipboard,encoded)
    print(copied and "[yanus] Dialogue report copied to clipboard. Paste it in the chat." or "[yanus] Clipboard failed; use yanus-dialogue-report.json")
else
    print("[yanus] Use yanus-dialogue-report.json or copy the console JSON")
end
