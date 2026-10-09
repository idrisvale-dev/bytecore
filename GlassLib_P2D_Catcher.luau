-- GlassLib Luraph v14 Path2D catcher
-- Run this first, then run GlassLib separately. This catcher does not load GlassLib.
if getgenv().GlassP2DCatcherLoaded then
    warn("[GlassP2D] catcher is already active")
    return
end
getgenv().GlassP2DCatcherLoaded = true

local lines = {}
local function fmt(n)
    return string.format("%.17g", n)
end

local function encode(v, depth)
    depth = depth or 0
    if depth > 5 then return "<depth>" end
    local t = typeof(v)
    if t == "number" then
        return "n:" .. fmt(v)
    elseif t == "string" or t == "boolean" then
        return t:sub(1, 1) .. ":" .. tostring(v)
    elseif t == "Vector2" then
        return "v:" .. fmt(v.X) .. "," .. fmt(v.Y)
    elseif t == "Vector3" then
        return "v3:" .. fmt(v.X) .. "," .. fmt(v.Y) .. "," .. fmt(v.Z)
    elseif t == "UDim2" then
        return string.format("u:%.17g,%.17g,%.17g,%.17g", v.X.Scale, v.X.Offset, v.Y.Scale, v.Y.Offset)
    elseif t == "table" then
        local out = {}
        for k, x in pairs(v) do
            table.insert(out, "[" .. encode(k, depth + 1) .. "]=" .. encode(x, depth + 1))
        end
        return "{" .. table.concat(out, ",") .. "}"
    end
    return t .. ":" .. tostring(v)
end

local function add(line)
    table.insert(lines, line)
    print("[GlassP2D] " .. line)
end

local oldNamecall
oldNamecall = hookmetamethod(game, "__namecall", newcclosure(function(self, ...)
    local method = getnamecallmethod()
    local watched = method == "SetControlPoints"
        or method == "GetLength"
        or method == "GetPositionOnCurve"
        or method == "GetTangentOnCurve"
        or method == "GetPositionOnCurveAtArcLength"
        or method == "GetTangentOnCurveAtArcLength"

    if not watched then
        return oldNamecall(self, ...)
    end

    local isPath = false
    pcall(function() isPath = self:IsA("Path2D") end)
    if not isPath then
        return oldNamecall(self, ...)
    end

    local args = { ... }
    local ok, result = pcall(function()
        return oldNamecall(self, ...)
    end)

    if method == "SetControlPoints" then
        add("SetControlPoints\t" .. (args[1] and encode(args[1]) or "nil"))
    elseif ok then
        add(method .. "|" .. (args[1] and fmt(args[1]) or "") .. "\t" .. encode(result))
    else
        add(method .. "|" .. (args[1] and fmt(args[1]) or "") .. "\tERROR " .. tostring(result))
    end

    return result
end))

local function save()
    local text = "==P2D==\n" .. table.concat(lines, "\n") .. "\n==END==\n"
    if writefile then
        writefile("glasslib_p2d_capture.txt", text)
    end
    print("[GlassP2D] capture saved; send the complete ==P2D== block or glasslib_p2d_capture.txt")
end

add("READY - now run GlassLib separately")
if getgenv().GlassP2DCatcherConnection then
    pcall(function() getgenv().GlassP2DCatcherConnection:Disconnect() end)
end
getgenv().GlassP2DCatcherSave = save
print("[GlassP2D] After GlassLib runs, execute: getgenv().GlassP2DCatcherSave()")
