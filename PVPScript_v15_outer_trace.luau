-- By DevAurora Code
-- Result type: dynamic trace
-- source: PVPScript.luau
-- NOTE: reconstructed from observed behaviour; branches that were not taken
--       during the trace are missing and conditions are only noted in comments.
-- run status: finished
-- 86 statements recorded in 1.45s
-- URLs requested:
--   https://raw.githubusercontent.com/WhiteX1208/Scripts/refs/heads/main/Ui-Library/V2Loader.luau

-- [deobf] removed 59 lines of the obfuscator's environment/anti-tamper probes
local Players = game:GetService("Players")
Players.LocalPlayer:GetMouse()
RaycastParams.new().FilterType = Enum.RaycastFilterType.Exclude
local Circle = Drawing.new("Circle")
Circle.Thickness = 1
Circle.Transparency = 0.7
Circle.Filled = false
Circle.NumSides = 64
Circle.Color = Color3.new(1, 1, 1)
Circle.Visible = false
local Line = Drawing.new("Line")
Line.Thickness = 2
Line.Visible = false
local Circle2 = Drawing.new("Circle")
Circle2.Thickness = 2
Circle2.Radius = 8
Circle2.Filled = false
Circle2.NumSides = 24
Circle2.Visible = false
local PlayerGui = Players.LocalPlayer:FindFirstChildOfClass("PlayerGui")
local hui = gethui()
local CoreGui = game:GetService("CoreGui")
local children = PlayerGui:GetChildren()

for i, v in ipairs(children) do
end

local children2 = hui:GetChildren()

for i2, v2 in ipairs(children2) do
end

local children3 = CoreGui:GetChildren()

for i3, v3 in ipairs(children3) do
end

local response = game:HttpGet("https://raw.githubusercontent.com/WhiteX1208/Scripts/refs/heads/main/Ui-Library/V2Loader.luau")
loadstring(response)()
-- isfile("NightGlass.lua") -> false
getgenv().gethui = nil
getgenv().gethui = nil
warn("! UI: <result>")
Circle:Destroy()
Line:Destroy()
Circle2:Destroy()
