-- Stops this hub's NPC farming and releases only its known movement objects.
local g = getgenv()
local q = g.__TensenAutoQuest
if q and type(q.Set) == "function" then pcall(q.Set, false) end
if q and q.Toggle and type(q.Toggle.Set) == "function" then pcall(function() q.Toggle:Set(false) end) end
g.TweenToNPC = false
g.autofarm = false
g.AutoQuestBusy = false
local state = g.__TensenTweenState
if type(state) == "table" then
    if type(state.Stop) == "function" then pcall(state.Stop) end
    state.Enabled = false
    state.Gen = (tonumber(state.Gen) or 0) + 1
    if state.Conn then pcall(function() state.Conn:Disconnect() end); state.Conn = nil end
    for _, key in ipairs({"Gyro", "Vel"}) do
        if state[key] then pcall(function() state[key]:Destroy() end); state[key] = nil end
    end
    state.IsMobTween, state.Attached, state.Stop = nil, false, nil
end
g.NoclipOverride, g.WaterOverride, g.ForceNoClipReal = false, false, false
local player = game:GetService("Players").LocalPlayer
local char = player.Character
local hum = char and char:FindFirstChildOfClass("Humanoid")
local root = char and char:FindFirstChild("HumanoidRootPart")
if root then
    for _, child in ipairs(root:GetChildren()) do
        if child.Name == "KD_TweenGyro" or child.Name == "KD_CFrameGyro"
            or child.Name == "KD_TweenVel" or child.Name == "KD_CFrameVel" then child:Destroy() end
    end
    root.AssemblyLinearVelocity = Vector3.zero
    root.AssemblyAngularVelocity = Vector3.zero
end
if hum then hum.PlatformStand = false; hum.AutoRotate = true end
local ui = g.TensenUILib
if ui and type(ui.SetFlag) == "function" then
    pcall(function() ui:SetFlag("TweenToNPCToggle", false) end)
    pcall(function() ui:SetFlag("AutoFarmToggle", false) end)
end
warn("[yanus] NPC farming stopped and movement released")
