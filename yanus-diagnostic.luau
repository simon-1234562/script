-- yanus hub: bounded, read-only inspection of NPCs and quest UI.
-- Does not move, attack, fire remotes, hook functions, or send network requests.
-- Prints JSON and optionally saves it inside the executor workspace.
local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local player = Players.LocalPlayer
local report = { version = 2, placeId = game.PlaceId, npcCandidates = {}, npcNames = {}, questUI = {}, movement = {} }
local function position(part)
    if not part then return nil end
    local p = part.Position
    return { x = p.X, y = p.Y, z = p.Z }
end
local function textItem(item)
    return item:IsA("TextLabel") or item:IsA("TextButton") or item:IsA("TextBox")
end
local function relativePath(item, root)
    local names = {}
    while item and item ~= root do table.insert(names, 1, item.Name); item = item.Parent end
    return table.concat(names, "/")
end
local char = player.Character
report.playerPosition = position(char and char:FindFirstChild("HumanoidRootPart"))
local npcs = workspace:FindFirstChild("NPCs")
report.npcContainerFound = npcs ~= nil
if npcs then
    local queue, index, inspected = {npcs}, 1, 0
    while index <= #queue and inspected < 2500 do
        local item = queue[index]; index += 1; inspected += 1
        if item:IsA("Model") then
            local hum = item:FindFirstChildOfClass("Humanoid")
            local name = (item.Name .. " " .. (hum and hum.DisplayName or "")):lower()
            if #report.npcNames < 60 then report.npcNames[#report.npcNames+1] = item.Name end
            if name:find("noah", 1, true) or name:find("desert", 1, true) then
                local part = item:FindFirstChild("HumanoidRootPart") or item.PrimaryPart or item:FindFirstChildWhichIsA("BasePart")
                report.npcCandidates[#report.npcCandidates+1] = {
                    name = item.Name, displayName = hum and hum.DisplayName or nil,
                    path = relativePath(item, workspace), position = position(part),
                    promptFound = item:FindFirstChildWhichIsA("ProximityPrompt", true) ~= nil,
                }
            end
        end
        for _, child in ipairs(item:GetChildren()) do
            if #queue < 3000 then queue[#queue+1] = child end
        end
        if inspected % 100 == 0 then task.wait() end
    end
    report.npcScanCount = inspected
    report.npcScanTruncated = index <= #queue
end
local gui = player:FindFirstChild("PlayerGui")
report.guiRoots = {}
if gui then
    for _, root in ipairs(gui:GetChildren()) do
        if #report.guiRoots < 60 then report.guiRoots[#report.guiRoots+1] = root.Name end
    end
    -- Normal Quest is always first. DailyQuests is intentionally excluded.
    local roots = {}
    local normal = gui:FindFirstChild("Quest")
    if normal then roots[#roots+1] = normal end
    for _, root in ipairs(gui:GetChildren()) do
        local name = root.Name:lower()
        if root ~= normal and root.Name ~= "DailyQuests" and name:find("quest",1,true) then roots[#roots+1] = root end
    end
    report.normalQuestFound = normal ~= nil
    for _, root in ipairs(roots) do
        local nodes, index, count = {root}, 1, 0
        while index <= #nodes and count < 160 do
            local item = nodes[index]; index += 1; count += 1
            local data = {path = relativePath(item, gui), class = item.ClassName}
            if item:IsA("GuiObject") then data.visible = item.Visible end
            if item:IsA("ScreenGui") then data.enabled = item.Enabled end
            if textItem(item) then data.text = item.Text:sub(1,160) end
            report.questUI[#report.questUI+1] = data
            for _, child in ipairs(item:GetChildren()) do if #nodes < 400 then nodes[#nodes+1] = child end end
        end
    end
end
local env = type(getgenv) == "function" and getgenv() or {}
report.movement.npcTweenEnabled = env.TweenToNPC == true
report.movement.selectedNPC = type(env.SelectedNPC) == "string" and env.SelectedNPC or nil
report.movement.autoQuestBusy = env.AutoQuestBusy == true
report.movement.autoQuestStatus = type(env.__TensenAutoQuest) == "table" and env.__TensenAutoQuest.Status or nil
report.movement.globalCFrameHelper = type(env.TweenToCFrame)
report.movement.globalMobHelper = type(env.TweenToMob2)
report.movement.sharedCFrameHelper = type(env.__F2Tween) == "table" and type(env.__F2Tween.TweenToCFrame) or "missing"
local state = env.__TensenTweenState
if type(state) == "table" then
    report.movement.tweenEnabled = state.Enabled == true
    report.movement.isMobTween = state.IsMobTween == true
end
local encoded = HttpService:JSONEncode(report)
print("[yanus diagnostic] " .. encoded)
if type(writefile) == "function" then
    local ok = pcall(writefile, "yanus-diagnostic-v2.json", encoded)
    print(ok and "[yanus diagnostic] Saved yanus-diagnostic-v2.json in the executor workspace" or "[yanus diagnostic] Could not save; copy the JSON above")
end
