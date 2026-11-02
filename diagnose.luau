-- Diagnostic only: fetch and compile the rolled-back hub, NEVER execute it.
-- Run once in a fresh session. Copy the [Tensen diagnostic] messages.
local function mark(message)
    warn("[Tensen diagnostic] " .. message)
end
mark("1 START")
if type(loadstring) ~= "function" then
    mark("STOP: loadstring is unavailable")
    return
end
local url = "https://raw.githubusercontent.com/simon-1234562/script/dfc0ebd468006f881f9774d90bdbdc2da6761150/Tensen-GPO-local.luau"
local fetched, source = pcall(function()
    return game:HttpGet(url)
end)
if not fetched or type(source) ~= "string" or #source == 0 then
    mark("STOP: download failed: " .. tostring(source))
    return
end
mark("2 DOWNLOADED " .. tostring(#source) .. " bytes")
mark("3 COMPILING (hub will not be executed)")
task.wait(0.2)
local ok, compiled, compileError = pcall(loadstring, source, "=TensenCompileDiagnostic")
source = nil
if not ok then
    mark("STOP: compiler raised an error: " .. tostring(compiled))
    return
end
if type(compiled) ~= "function" then
    mark("STOP: compiler returned no function: " .. tostring(compileError))
    return
end
compiled = nil
mark("4 COMPILE OK; HUB WAS NOT EXECUTED")
