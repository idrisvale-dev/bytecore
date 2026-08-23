local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Lighting = game:GetService("Lighting")
local HS = game:GetService("HttpService")
local player = Players.LocalPlayer
local _gethui = typeof(gethui) == "function" and gethui or nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local DISCORD_PRIMARY = "https://discord.gg/8rz6u37Pac"
local DISCORD_SECONDARY = "https://discord.gg/cVgDPuxE"
local DISCORD_INLINE = "discord.gg/8rz6u37Pac  •  discord.gg/cVgDPuxE"
local DISCORD_STACKED = DISCORD_PRIMARY .. "\n" .. DISCORD_SECONDARY
local BRAND = "Snow.VS"

local BrighterAnimalsData = nil
do
    pcall(function()
        local datas = ReplicatedStorage:FindFirstChild("Datas")
        local animalsModule = datas and datas:FindFirstChild("Animals")
        if animalsModule then
            BrighterAnimalsData = require(animalsModule)
        end
    end)
end

local function protectGui(gui)
    if not gui then return end
    pcall(function()
        if typeof(protect_gui) == "function" then
            protect_gui(gui)
        elseif syn and syn.protect_gui then
            syn.protect_gui(gui)
        elseif typeof(hide_in_gcoregui) == "function" then
            hide_in_gcoregui(gui)
        end
    end)
end

local function parentGui(gui)
    if not gui then return end
    protectGui(gui)
    local ok = false
    if _gethui then
        ok = pcall(function() gui.Parent = _gethui() end)
    end
    if not ok or not gui.Parent then
        ok = pcall(function() gui.Parent = game:GetService("CoreGui") end)
    end
    if not gui.Parent then
        pcall(function()
            local plr = Players.LocalPlayer
            if plr then
                gui.Parent = plr:WaitForChild("PlayerGui")
            end
        end)
    end
end

local _isfile = (typeof(isfile) == "function" and isfile)
    or (syn and syn.isfile)
    or (getgenv and getgenv().isfile)
    or function(p)
        local ok, data = pcall(function() return readfile(p) end)
        return ok and data ~= nil
    end
local _readfile = (typeof(readfile) == "function" and readfile)
    or (syn and syn.readfile)
    or (getgenv and getgenv().readfile)
    or function() return nil end
local _writefile = (typeof(writefile) == "function" and writefile)
    or (syn and syn.writefile)
    or (getgenv and getgenv().writefile)
    or function() end
isfile, readfile, writefile = _isfile, _readfile, _writefile

local function destroyOldGui(name)
    if not name then return end
    pcall(function()
        if _gethui then
            local h = _gethui()
            local o = h and h:FindFirstChild(name)
            if o then o:Destroy() end
        end
    end)
    pcall(function()
        local cg = game:GetService("CoreGui")
        local o = cg:FindFirstChild(name)
        if o then o:Destroy() end
    end)
    pcall(function()
        local plr = Players.LocalPlayer
        if plr then
            local pg = plr:FindFirstChild("PlayerGui")
            if pg then
                local o = pg:FindFirstChild(name)
                if o then o:Destroy() end
            end
        end
    end)
end

local SNOW_THEME = {
    BG = Color3.fromRGB(0, 0, 0),
    BG2 = Color3.fromRGB(12, 12, 12),
    ROW_BG = Color3.fromRGB(20, 20, 20),
    ROW_BORDER = Color3.fromRGB(78, 78, 78),
    WHITE = Color3.fromRGB(255, 255, 255),
    GRAY = Color3.fromRGB(170, 170, 170),
    INP = Color3.fromRGB(7, 7, 7),
    ACCENT = Color3.fromRGB(255, 255, 255),
    ACCENT2 = Color3.fromRGB(210, 210, 210),
    ACCENT3 = Color3.fromRGB(42, 42, 42),
    OFF = Color3.fromRGB(18, 18, 18),
    SECT = Color3.fromRGB(210, 210, 210),
    MOB_ON = Color3.fromRGB(255, 255, 255),
    MOB_OFF = Color3.fromRGB(12, 12, 12),
    MOB_BORDER_OFF = Color3.fromRGB(78, 78, 78),
    MOB_TEXT_OFF = Color3.fromRGB(180, 180, 180),
    MOB_TEXT_ON = Color3.fromRGB(0, 0, 0),
    STEAL_BG = Color3.fromRGB(8, 8, 8),
    STEAL_FILL = Color3.fromRGB(255, 255, 255),
    STEAL_ACCENT = Color3.fromRGB(255, 255, 255),
    PARTICLE = Color3.fromRGB(255, 255, 255),
}
getTheme = function() return SNOW_THEME end

local CANDY_SKY_TAG = "MoveeSkyTheme"
local currentSkyTheme = "Night"
local CANDY_SKY_PRESETS = {
    ["Off"] = { kind = "off" },
    ["Night"] = {
        clock = 22,
        brightness = 2,
        ambient = { 110, 100, 130 },
        outAmb = { 120, 110, 140 },
        sky = { stars = 4000, moon = 18, sun = 0, moonTex = true },
        atm = { dens = 0.45, color = { 120, 60, 180 }, decay = { 60, 20, 100 }, glare = 0.5, haze = 1.2 },
    },
    ["Aurora"] = {
        clock = 14,
        brightness = 3,
        ambient = { 150, 120, 150 },
        outAmb = { 160, 130, 150 },
        atm = { dens = 0.55, color = { 255, 80, 200 }, decay = { 255, 20, 150 }, glare = 2.5, haze = 3 },
        clouds = { cover = 0.7, dens = 0.7, color = { 255, 240, 250 } },
    },
    ["Sunset"] = {
        clock = 17.2,
        brightness = 2.5,
        ambient = { 170, 120, 100 },
        outAmb = { 180, 130, 110 },
        sky = { stars = 0, sun = 25, moon = 0 },
        atm = { dens = 0.5, color = { 255, 130, 60 }, decay = { 255, 80, 30 }, glare = 2, haze = 2.5 },
        clouds = { cover = 0.55, dens = 0.55, color = { 255, 200, 140 } },
    },
    ["Galaxy"] = {
        clock = 0,
        brightness = 1.5,
        ambient = { 70, 60, 100 },
        outAmb = { 80, 70, 110 },
        sky = { stars = 10000, moon = 30, sun = 0 },
        atm = { dens = 0.15, color = { 40, 20, 80 }, decay = { 20, 10, 50 }, glare = 0.3, haze = 0.5 },
    },
    ["Cyber"] = {
        clock = 21,
        brightness = 2.2,
        ambient = { 90, 130, 170 },
        outAmb = { 100, 140, 180 },
        sky = { stars = 2000, moon = 12 },
        atm = { dens = 0.4, color = { 0, 200, 255 }, decay = { 150, 0, 255 }, glare = 2, haze = 2 },
        clouds = { cover = 0.4, dens = 0.6, color = { 100, 200, 255 } },
    },
    ["Sakura"] = {
        clock = 11,
        brightness = 3.5,
        ambient = { 170, 150, 160 },
        outAmb = { 180, 160, 170 },
        sky = { sun = 8 },
        atm = { dens = 0.3, color = { 255, 200, 220 }, decay = { 255, 170, 200 }, glare = 1, haze = 1.5 },
        clouds = { cover = 0.6, dens = 0.4, color = { 255, 250, 252 } },
    },
    ["Pink Night"] = {
        clock = 23,
        brightness = 2.2,
        ambient = { 120, 60, 110 },
        outAmb = { 140, 70, 120 },
        sky = { stars = 5000, moon = 22, sun = 0, moonTex = true },
        atm = { dens = 0.5, color = { 255, 80, 180 }, decay = { 140, 30, 100 }, glare = 0.7, haze = 1.4 },
        clouds = { cover = 0.3, dens = 0.5, color = { 180, 90, 150 } },
    },
    ["Blood Moon"] = {
        clock = 22.5,
        brightness = 1.6,
        ambient = { 130, 40, 40 },
        outAmb = { 150, 50, 50 },
        sky = { stars = 1500, moon = 28, sun = 0, moonTex = true },
        atm = { dens = 0.6, color = { 220, 30, 30 }, decay = { 120, 10, 10 }, glare = 1.4, haze = 2 },
        clouds = { cover = 0.5, dens = 0.7, color = { 120, 30, 30 } },
    },
    ["Emerald Dawn"] = {
        clock = 6.5,
        brightness = 2.8,
        ambient = { 130, 170, 140 },
        outAmb = { 140, 180, 150 },
        sky = { sun = 18, moon = 0, stars = 0 },
        atm = { dens = 0.4, color = { 80, 200, 140 }, decay = { 40, 150, 90 }, glare = 1.8, haze = 2.2 },
        clouds = { cover = 0.5, dens = 0.5, color = { 200, 255, 220 } },
    },
    ["Volcanic"] = {
        clock = 19,
        brightness = 2,
        ambient = { 180, 80, 40 },
        outAmb = { 200, 90, 50 },
        sky = { stars = 200, sun = 12, moon = 0 },
        atm = { dens = 0.75, color = { 255, 60, 0 }, decay = { 180, 20, 0 }, glare = 3, haze = 3.5 },
        clouds = { cover = 0.8, dens = 0.9, color = { 120, 40, 20 } },
    },
    ["Arctic"] = {
        clock = 9,
        brightness = 3.2,
        ambient = { 200, 220, 235 },
        outAmb = { 210, 230, 245 },
        sky = { sun = 10, stars = 0, moon = 0 },
        atm = { dens = 0.3, color = { 180, 220, 255 }, decay = { 140, 200, 240 }, glare = 1.5, haze = 1.8 },
        clouds = { cover = 0.7, dens = 0.6, color = { 250, 253, 255 } },
    },
    ["Midnight Ocean"] = {
        clock = 1.5,
        brightness = 1.7,
        ambient = { 60, 90, 130 },
        outAmb = { 70, 100, 140 },
        sky = { stars = 6000, moon = 24, sun = 0, moonTex = true },
        atm = { dens = 0.5, color = { 20, 60, 140 }, decay = { 10, 30, 90 }, glare = 0.6, haze = 1.5 },
    },
    ["Vaporwave"] = {
        clock = 19.5,
        brightness = 2.4,
        ambient = { 180, 120, 200 },
        outAmb = { 190, 130, 210 },
        sky = { stars = 1000, moon = 14 },
        atm = { dens = 0.45, color = { 255, 100, 220 }, decay = { 120, 60, 255 }, glare = 2.2, haze = 2.4 },
        clouds = { cover = 0.5, dens = 0.55, color = { 200, 150, 255 } },
    },
    ["Toxic"] = {
        clock = 13,
        brightness = 2.5,
        ambient = { 140, 180, 80 },
        outAmb = { 150, 190, 90 },
        atm = { dens = 0.55, color = { 100, 220, 40 }, decay = { 60, 150, 20 }, glare = 1.8, haze = 2.6 },
        clouds = { cover = 0.65, dens = 0.7, color = { 180, 255, 120 } },
    },
    ["Solar Eclipse"] = {
        clock = 12,
        brightness = 0.9,
        ambient = { 50, 40, 60 },
        outAmb = { 60, 50, 70 },
        sky = { stars = 3500, sun = 22, moon = 0 },
        atm = { dens = 0.5, color = { 255, 140, 40 }, decay = { 30, 20, 40 }, glare = 2.8, haze = 1.8 },
    },
    ["Hellscape"] = {
        clock = 18,
        brightness = 1.8,
        ambient = { 200, 60, 30 },
        outAmb = { 220, 70, 40 },
        sky = { stars = 100, sun = 30, moon = 0 },
        atm = { dens = 0.85, color = { 255, 30, 0 }, decay = { 120, 0, 0 }, glare = 3.5, haze = 4 },
        clouds = { cover = 0.95, dens = 0.95, color = { 80, 20, 10 } },
    },
    ["Heaven"] = {
        clock = 12,
        brightness = 4,
        ambient = { 240, 235, 210 },
        outAmb = { 250, 245, 220 },
        sky = { sun = 16, moon = 0, stars = 0 },
        atm = { dens = 0.25, color = { 255, 250, 220 }, decay = { 255, 240, 200 }, glare = 3, haze = 1.5 },
        clouds = { cover = 0.85, dens = 0.5, color = { 255, 255, 255 } },
    },
    ["Storm"] = {
        clock = 15,
        brightness = 1.4,
        ambient = { 90, 90, 110 },
        outAmb = { 100, 100, 120 },
        sky = { stars = 0, sun = 6, moon = 0 },
        atm = { dens = 0.65, color = { 80, 90, 120 }, decay = { 40, 50, 80 }, glare = 0.5, haze = 3 },
        clouds = { cover = 0.95, dens = 0.95, color = { 60, 65, 80 } },
    },
    ["Sunrise"] = {
        clock = 6.2,
        brightness = 2.8,
        ambient = { 220, 180, 130 },
        outAmb = { 230, 190, 140 },
        sky = { sun = 22, stars = 0, moon = 0 },
        atm = { dens = 0.45, color = { 255, 180, 100 }, decay = { 255, 140, 80 }, glare = 2.4, haze = 2.2 },
        clouds = { cover = 0.4, dens = 0.4, color = { 255, 220, 180 } },
    },
    ["Deep Space"] = {
        clock = 0,
        brightness = 1,
        ambient = { 30, 25, 50 },
        outAmb = { 40, 35, 60 },
        sky = { stars = 15000, moon = 0, sun = 0 },
        atm = { dens = 0.08, color = { 15, 5, 40 }, decay = { 5, 0, 20 }, glare = 0.2, haze = 0.3 },
    },
    ["Lavender Dream"] = {
        clock = 18.5,
        brightness = 2.6,
        ambient = { 180, 160, 220 },
        outAmb = { 190, 170, 230 },
        sky = { stars = 800, moon = 16, sun = 0 },
        atm = { dens = 0.4, color = { 200, 160, 255 }, decay = { 160, 120, 220 }, glare = 1.4, haze = 1.8 },
        clouds = { cover = 0.55, dens = 0.5, color = { 220, 200, 255 } },
    },
    ["Inferno"] = {
        clock = 17.5,
        brightness = 2.2,
        ambient = { 220, 100, 40 },
        outAmb = { 235, 110, 50 },
        sky = { sun = 26, moon = 0, stars = 0 },
        atm = { dens = 0.6, color = { 255, 90, 20 }, decay = { 200, 40, 0 }, glare = 3, haze = 3.2 },
        clouds = { cover = 0.7, dens = 0.7, color = { 200, 80, 40 } },
    },
    ["Mint Sky"] = {
        clock = 10,
        brightness = 3.2,
        ambient = { 180, 230, 210 },
        outAmb = { 190, 240, 220 },
        sky = { sun = 10 },
        atm = { dens = 0.32, color = { 150, 255, 210 }, decay = { 100, 220, 180 }, glare = 1.6, haze = 1.6 },
        clouds = { cover = 0.55, dens = 0.45, color = { 240, 255, 250 } },
    },
}
local SkyOrder = {
    "Off",
    "Night",
    "Aurora",
    "Sunset",
    "Galaxy",
    "Cyber",
    "Sakura",
    "Pink Night",
    "Blood Moon",
    "Emerald Dawn",
    "Volcanic",
    "Arctic",
    "Midnight Ocean",
    "Vaporwave",
    "Toxic",
    "Solar Eclipse",
    "Hellscape",
    "Heaven",
    "Storm",
    "Sunrise",
    "Deep Space",
    "Lavender Dream",
    "Inferno",
    "Mint Sky",
}
local function candyColor(rgb) return Color3.fromRGB(rgb[1], rgb[2], rgb[3]) end
local function CandyApplyCustomSky(mode)
    for _, child in ipairs(Lighting:GetChildren()) do
        if child:GetAttribute(CANDY_SKY_TAG) then
            pcall(function() child:Destroy() end)
        end
    end
    local terrain = workspace:FindFirstChildOfClass("Terrain")
    if terrain then
        for _, child in ipairs(terrain:GetChildren()) do
            if child:GetAttribute(CANDY_SKY_TAG) then
                pcall(function() child:Destroy() end)
            end
        end
    end
    local preset = CANDY_SKY_PRESETS[mode]
    if not preset or preset.kind == "off" then
        Lighting.ClockTime = 14
        Lighting.Brightness = 2
        Lighting.OutdoorAmbient = Color3.fromRGB(127, 127, 127)
        Lighting.Ambient = Color3.fromRGB(127, 127, 127)
        Lighting.FogEnd = 100000
        Lighting.GlobalShadows = true
        return
    end
    Lighting.FogStart = 0
    Lighting.FogEnd = 100000
    Lighting.FogColor = Color3.fromRGB(200, 200, 200)
    Lighting.ColorShift_Top = Color3.fromRGB(0, 0, 0)
    Lighting.ColorShift_Bottom = Color3.fromRGB(0, 0, 0)
    Lighting.GlobalShadows = true
    Lighting.ClockTime = preset.clock or 14
    Lighting.Brightness = preset.brightness or 2
    if preset.outAmb then Lighting.OutdoorAmbient = candyColor(preset.outAmb) end
    if preset.ambient then Lighting.Ambient = candyColor(preset.ambient) end
    if preset.sky then
        local skyInst = Instance.new("Sky")
        skyInst:SetAttribute(CANDY_SKY_TAG, true)
        if preset.sky.stars then skyInst.StarCount = preset.sky.stars end
        if preset.sky.moon then skyInst.MoonAngularSize = preset.sky.moon end
        if preset.sky.sun then skyInst.SunAngularSize = preset.sky.sun end
        if preset.sky.moonTex then skyInst.MoonTextureId = "rbxasset://sky/moon.jpg" end
        skyInst.Parent = Lighting
    end
    if preset.atm then
        local atm = Instance.new("Atmosphere")
        atm:SetAttribute(CANDY_SKY_TAG, true)
        atm.Density = preset.atm.dens or 0.3
        atm.Color = candyColor(preset.atm.color)
        atm.Decay = candyColor(preset.atm.decay)
        atm.Glare = preset.atm.glare or 1
        atm.Haze = preset.atm.haze or 1
        atm.Parent = Lighting
    end
    if preset.clouds and terrain then
        local clouds = Instance.new("Clouds")
        clouds:SetAttribute(CANDY_SKY_TAG, true)
        clouds.Cover = preset.clouds.cover or 0.5
        clouds.Density = preset.clouds.dens or 0.5
        clouds.Color = candyColor(preset.clouds.color)
        clouds.Parent = terrain
    end
end

currentGuiTheme = "SNOW.VS"
GUI_THEME_ORDER = { "SNOW.VS" }
GUI_THEMES = { ["SNOW.VS"] = SNOW_THEME }

local TS = TweenService
local LP = Players.LocalPlayer
local NS, CS = 60, 30
local LAGGER_SPEED = 15
local LAGGER_CARRY_SPEED = 24.5
carrySpeedActive = false
laggerModeEnabled = false
laggerCarryActive = false
autoCarryEnabled = false
setAutoCarryVisual = nil
antiRagdollEnabled = true
infJumpEnabled = false
medusaCounterEnabled, batCounterEnabled, unwalkEnabled = false, false, false
medusaResetEnabled = false
medusaDebounce, medusaLastUsed, dropActive = false, 0, false
autoLeftEnabled, autoRightEnabled = false, false
local autoPlayEnabled = false
local autoPlaySetVisual = nil
autoLeftSetVisual, autoRightSetVisual = nil, nil
speedLabel = nil
autoBatEnabled = false
aimbotV2Enabled = false
autoSwingEnabled = true
autoMoveSwingEnabled = false
autoMoveSwingInterval = 0.3
_alSwingDebounce = false
_arSwingDebounce = false
autoBatSetVisual = nil
headlessEnabled, korbloxEnabled = false, false
headlessSetVisual, korbloxSetVisual = nil, nil
antiSummerBaseEnabled, antiSummerBaseConn = false, nil
_antiSummerCleaned = {}
resetAutoBatMotion = nil
setBatCounterVisual = nil
startBatCounter, stopBatCounter = nil, nil
antiLagEnabled, removeAccessoriesEnabled, antiLagDescConn = false, false, nil
unwalkSavedAnimate, _anyKeyListening = false, nil
autoTPEnabled, autoTPHeight, autoTPConn, setAutoTPVisual = false, 20, nil, nil
desyncEnabled, desyncConn, setDesyncVisual, desyncVisualizer, desyncFrozenCFrame, desyncCurrentAngle = false, nil, nil, nil, nil, 0
cursedResetRemote = nil
CURSED_RESET_GUID = "f888ee6e-c86d-46e1-93d7-0639d6635d42"
guiTransparencyEnabled, mobileButtonsEnabled, mobileButtonsLocked = false, true, false
mobileButtonsSize = 98
guiScaleValue = (UIS.TouchEnabled and 0.63 or 1)
mainGuiScaleRef = nil
circleButtonsEnabled = false
stealBarFrame = nil
progressFill = nil
setStealStatusText = nil
mobBtnRefs = {}
mobGuiRef = nil
fovValue = 80
fovOptions = { 80, 120, 180 }
fovIndex = 1
laggerModePillRef = nil
carryModePillRef = nil
autoSwitchSpeedEnabled = false
mobBtnTransparencyEnabled = false
perButtonDragEnabled = true
antiKickEnabled = false
antiKickSetVisual = nil
brainrotDetected = false
activeBatBillboard = nil
activeMedusaBillboard = nil
ragdollGuiEnabled = false
introEnabled = true
introMusicEnabled = true
selectedIntroMusic = 1
persistentRagdollGui = nil
uiLocked = false
infJumpMode = "manual"
holdInfJumpConn = nil
DROP_ASCEND_DURATION = 0.2
DROP_ASCEND_SPEED = 150
autoPlaySide = "left"
MOB_POS_FILE = "tameless_btnpos.json"
GUI_POS_FILE = "tameless_guipos.json"
forceDefaultBtnPos = false
activeMobDrag = nil

local function loadBtnPositions()
    local data = {}
    pcall(function()
        local raw = readfile(MOB_POS_FILE)
        if raw and #raw > 2 then
            local decoded = HS:JSONDecode(raw)
            if type(decoded) == "table" then
                data = decoded
            end
        end
    end)
    if not data or next(data) == nil then
        pcall(function()
            local raw = readfile("Tameless.json")
            if raw then
                local cfg = HS:JSONDecode(raw)
                if type(cfg) == "table" and type(cfg.btnPositions) == "table" and next(cfg.btnPositions) ~= nil then
                    data = cfg.btnPositions
                end
            end
        end)
    end
    return data or {}
end

local function saveBtnPositions()
    if not mobGuiRef then return end
    local out = {}
    for _, child in ipairs(mobGuiRef:GetDescendants()) do
        if child:IsA("Frame") and child:GetAttribute("BtnKey") then
            local key = child:GetAttribute("BtnKey")
            out[key] = { xs = 0, xo = child.Position.X.Offset, ys = 0, yo = child.Position.Y.Offset }
        end
    end
    if next(out) == nil then return end
    if writefile then
        pcall(function()
            writefile(MOB_POS_FILE, HS:JSONEncode(out))
        end)
    end
    if writefile and isfile and isfile("Tameless.json") then
        pcall(function()
            local cfg = HS:JSONDecode(readfile("Tameless.json"))
            if type(cfg) == "table" then
                cfg.btnPositions = out
                writefile("Tameless.json", HS:JSONEncode(cfg))
            end
        end)
    end
end

task.spawn(function()
    while true do
        task.wait(2)
        pcall(saveBtnPositions)
    end
end)

local function loadGuiPositions()
    local data = {}
    pcall(function()
        local raw = readfile(GUI_POS_FILE)
        if raw and #raw > 2 then
            local decoded = HS:JSONDecode(raw)
            if type(decoded) == "table" then
                data = decoded
            end
        end
    end)
    if not data or next(data) == nil then
        pcall(function()
            local raw = readfile("Tameless.json")
            if raw then
                local cfg = HS:JSONDecode(raw)
                if type(cfg) == "table" and type(cfg.guiPositions) == "table" and next(cfg.guiPositions) ~= nil then
                    data = cfg.guiPositions
                end
            end
        end)
    end
    if not data or next(data) == nil then
        pcall(function()
            local raw = readfile("TamelessConfig.json")
            if raw then
                local cfg = HS:JSONDecode(raw)
                if type(cfg) == "table" and type(cfg.guiPositions) == "table" and next(cfg.guiPositions) ~= nil then
                    data = cfg.guiPositions
                end
            end
        end)
    end
    return data or {}
end

local function mergeGuiPosition(key, xs, xo, ys, yo)
    if not key then return end
    local data = loadGuiPositions()
    local prev = data[key] or {}
    local xsN = tonumber(xs)
    local xoN = tonumber(xo)
    local ysN = tonumber(ys)
    local yoN = tonumber(yo)
    data[key] = {
        xs = xsN ~= nil and xsN or (prev.xs or 0),
        xo = xoN ~= nil and xoN or (prev.xo or 0),
        ys = ysN ~= nil and ysN or (prev.ys or 0),
        yo = yoN ~= nil and yoN or (prev.yo or 0),
    }
    if writefile then
        pcall(function()
            writefile(GUI_POS_FILE, HS:JSONEncode(data))
        end)
    end
    if writefile and isfile and isfile("Tameless.json") then
        pcall(function()
            local cfg = HS:JSONDecode(readfile("Tameless.json"))
            if type(cfg) == "table" then
                cfg.guiPositions = data
                writefile("Tameless.json", HS:JSONEncode(cfg))
            end
        end)
    end
    if writefile and isfile and isfile("TamelessConfig.json") then
        pcall(function()
            local cfg = HS:JSONDecode(readfile("TamelessConfig.json"))
            if type(cfg) == "table" then
                cfg.guiPositions = data
                writefile("TamelessConfig.json", HS:JSONEncode(cfg))
            end
        end)
    end
end

local function saveGuiPositions()
    if stealBarFrame then
        local p = stealBarFrame.Position
        mergeGuiPosition("_stealBar", p.X.Scale, p.X.Offset, p.Y.Scale, p.Y.Offset)
    end
    if mainGuiRef then
        local outer = mainGuiRef:FindFirstChild("OuterBorder")
        if outer then
            local p = outer.Position
            mergeGuiPosition("_hub", p.X.Scale, p.X.Offset, p.Y.Scale, p.Y.Offset)
        end
    end
end

task.spawn(function()
    while true do
        task.wait(3)
        pcall(saveGuiPositions)
    end
end)

refreshSpeedModeLabel, saveConfig = nil, nil
startUnwalk, stopUnwalk, setupMedusa, stopMedusaCounter = nil, nil, nil, nil
startAntiRagdoll, stopAntiRagdoll, startAutoLeft, stopAutoLeft, startAutoRight, stopAutoRight = nil, nil, nil, nil, nil, nil
startAutoTP, stopAutoTP, enableAntiLag, disableAntiLag = nil, nil, nil, nil
startBatAimbot, stopBatAimbot, queueAutoBatStart, runDrop, runTPFloor, cursedInstaReset = nil, nil, nil, nil, nil, nil
startAutoSteal, stopAutoSteal, enableAntiKick, disableAntiKick, toggleCarryMode, toggleLaggerMode, toggleLaggerCarryMode = nil, nil, nil, nil, nil, nil, nil
setNormalSpeed = nil
setNormalCarry = nil
setLaggerNormal = nil
setLaggerCarry = nil
local antiRagdollConn = nil
setCarryModeVisual = nil
setLaggerModeVisual = nil

local function addShimmerToLabel(lbl, color1, color2)
    local gr = Instance.new("UIGradient", lbl)
    gr.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, color1 or Color3.fromRGB(30, 144, 255)),
        ColorSequenceKeypoint.new(0.5, color2 or Color3.fromRGB(255, 255, 255)),
        ColorSequenceKeypoint.new(1, color1 or Color3.fromRGB(30, 144, 255)),
    })
    gr.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.3, 0),
        NumberSequenceKeypoint.new(0.5, 0, 0),
        NumberSequenceKeypoint.new(1, 0.3, 0),
    })
    return gr
end

fovConn = nil
local function applyFOV()
    if fovConn then
        fovConn:Disconnect()
    end
    fovConn = RunService.RenderStepped:Connect(function()
        local cam = workspace.CurrentCamera
        if cam then
            cam.FieldOfView = fovValue
        end
    end)
end
applyFOV()

do
    local timerBillboard = nil
    local timerLabel = nil
    local timerActive = false
    local timerConn = nil
    local ragdollCheckConn = nil
    local lastRagdollState = false

    local function createTimerBillboard()
        if timerBillboard then timerBillboard:Destroy() end
        local char = LP.Character
        if not char then return end
        local head = char:FindFirstChild("Head")
        if not head then return end
        timerBillboard = Instance.new("BillboardGui")
        timerBillboard.Name = "TamelessRagdollTimer"
        timerBillboard.Size = UDim2.new(0, 120, 0, 50)
        timerBillboard.StudsOffset = Vector3.new(0, 5.8, 0)
        timerBillboard.AlwaysOnTop = true
        timerBillboard.MaxDistance = 100
        timerBillboard.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        timerBillboard.Parent = head
        local bgFrame = Instance.new("Frame")
        bgFrame.Size = UDim2.new(1, 0, 1, 0)
        bgFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        bgFrame.BackgroundTransparency = 0.4
        bgFrame.BorderSizePixel = 0
        bgFrame.Parent = timerBillboard
        Instance.new("UICorner", bgFrame).CornerRadius = UDim.new(0, 10)
        local stroke = Instance.new("UIStroke", bgFrame)
        stroke.Color = Color3.fromRGB(30, 144, 255)
        stroke.Thickness = 2
        stroke.Transparency = 0.3
        timerLabel = Instance.new("TextLabel")
        timerLabel.Size = UDim2.new(1, 0, 1, 0)
        timerLabel.BackgroundTransparency = 1
        timerLabel.Text = "3.00"
        timerLabel.TextColor3 = Color3.fromRGB(30, 144, 255)
        timerLabel.Font = Enum.Font.GothamBlack
        timerLabel.TextSize = 28
        timerLabel.TextScaled = true
        timerLabel.ZIndex = 2
        timerLabel.Parent = bgFrame
        timerBillboard.Enabled = false
    end

    local function updateTimerDisplay(time, isReady)
        if not timerLabel or not timerBillboard then return end
        if isReady then
            timerLabel.Text = "READY TO STEAL!"
            timerLabel.TextColor3 = Color3.fromRGB(30, 144, 255)
            timerLabel.TextSize = 18
            timerLabel.TextScaled = false
            local bg = timerLabel.Parent
            if bg then
                local stroke = bg:FindFirstChildOfClass("UIStroke")
                if stroke then
                    stroke.Color = Color3.fromRGB(30, 144, 255)
                    stroke.Thickness = 3
                    stroke.Transparency = 0
                end
                bg.BackgroundTransparency = 0.2
                bg.BackgroundColor3 = Color3.fromRGB(0, 30, 60)
            end
        else
            timerLabel.Text = string.format("%.2f", time)
            timerLabel.TextColor3 = Color3.fromRGB(30, 144, 255)
            timerLabel.TextSize = 28
            timerLabel.TextScaled = true
            local bg = timerLabel.Parent
            if bg then
                local stroke = bg:FindFirstChildOfClass("UIStroke")
                if stroke then
                    stroke.Color = Color3.fromRGB(30, 144, 255)
                    stroke.Thickness = 2
                    stroke.Transparency = 0.3
                end
                bg.BackgroundTransparency = 0.4
                bg.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            end
        end
    end

    local function startRagdollTimer()
        if timerActive then return end
        if not timerBillboard or not timerBillboard.Parent then
            createTimerBillboard()
            if not timerBillboard then return end
        end
        timerActive = true
        timerBillboard.Enabled = true
        local startTime = tick()
        local duration = 3.0
        if timerConn then timerConn:Disconnect() end
        timerConn = RunService.Heartbeat:Connect(function()
            if not timerActive then
                timerConn:Disconnect()
                timerConn = nil
                return
            end
            local char = LP.Character
            if not char then
                timerActive = false
                if timerBillboard then timerBillboard.Enabled = false end
                if timerConn then
                    timerConn:Disconnect()
                    timerConn = nil
                end
                return
            end
            local elapsed = tick() - startTime
            local remaining = math.max(duration - elapsed, 0)
            if remaining <= 0 then
                timerActive = false
                updateTimerDisplay(0, true)
                if timerConn then
                    timerConn:Disconnect()
                    timerConn = nil
                end
                task.delay(1.5, function()
                    if timerBillboard then timerBillboard.Enabled = false end
                    timerActive = false
                end)
                return
            end
            updateTimerDisplay(remaining, false)
        end)
    end

    local function checkRagdoll()
        if ragdollCheckConn then return end
        ragdollCheckConn = RunService.Heartbeat:Connect(function()
            local char = LP.Character
            if not char then return end
            local hum = char:FindFirstChildOfClass("Humanoid")
            if not hum then return end
            local state = hum:GetState()
            local isRagdolled = state == Enum.HumanoidStateType.Physics
                or state == Enum.HumanoidStateType.Ragdoll
                or state == Enum.HumanoidStateType.FallingDown
            if isRagdolled and not lastRagdollState and not timerActive then
                if not timerBillboard or not timerBillboard.Parent then
                    createTimerBillboard()
                end
                startRagdollTimer()
            end
            lastRagdollState = isRagdolled
        end)
    end

    task.spawn(checkRagdoll)

    LP.CharacterAdded:Connect(function(char)
        if ragdollCheckConn then
            ragdollCheckConn:Disconnect()
            ragdollCheckConn = nil
        end
        timerActive = false
        lastRagdollState = false
        if timerConn then
            timerConn:Disconnect()
            timerConn = nil
        end
        if timerBillboard then
            timerBillboard:Destroy()
            timerBillboard = nil
        end
        task.wait(0.5)
        createTimerBillboard()
        checkRagdoll()
    end)

    task.spawn(function()
        task.wait(0.5)
        createTimerBillboard()
    end)
end

local function getSpeedThemeColors()
    local th = getTheme()
    local accent = th and th.ACCENT or Color3.fromRGB(30, 144, 255)
    local accent2 = th and th.ACCENT2 or Color3.fromRGB(70, 180, 255)
    local gray = th and th.GRAY or Color3.fromRGB(180, 200, 220)
    return accent, accent2, gray
end

local function applySpeedIndicatorTheme()
    local char = LP.Character
    if not char then return end
    local head = char:FindFirstChild("Head")
    if not head then return end
    local bb = head:FindFirstChild("TamelessSpeedBB")
    if not bb then return end
    local accent, accent2, gray = getSpeedThemeColors()
    for _, lbl in ipairs(bb:GetChildren()) do
        if lbl:IsA("TextLabel") then
            if string.find(lbl.Text or "", BRAND, 1, true) or lbl.Name == "DiscordLbl" then
                lbl.TextColor3 = gray
                local gr = lbl:FindFirstChildOfClass("UIGradient")
                if gr then
                    gr.Color = ColorSequence.new({
                        ColorSequenceKeypoint.new(0, gray),
                        ColorSequenceKeypoint.new(0.5, accent),
                        ColorSequenceKeypoint.new(1, gray),
                    })
                end
            else
                lbl.TextColor3 = accent
                local gr = lbl:FindFirstChildOfClass("UIGradient")
                if gr then
                    gr.Color = ColorSequence.new({
                        ColorSequenceKeypoint.new(0, accent2),
                        ColorSequenceKeypoint.new(0.5, accent),
                        ColorSequenceKeypoint.new(1, accent2),
                    })
                end
            end
        end
    end
end

local function setupSpeedIndicator(char)
    local head = char:WaitForChild("Head", 5)
    if not head then return end
    if head:FindFirstChild("TamelessSpeedBB") then
        head.TamelessSpeedBB:Destroy()
    end
    local accent, accent2, gray = getSpeedThemeColors()
    local bb = Instance.new("BillboardGui", head)
    bb.Name = "TamelessSpeedBB"
    bb.Size = UDim2.new(0, 340, 0, 105)
    bb.StudsOffset = Vector3.new(0, 3.25, 0)
    bb.AlwaysOnTop = true
    bb.LightInfluence = 0
    local titleLabel = Instance.new("TextLabel", bb)
    titleLabel.Name = "TitleLbl"
    titleLabel.Size = UDim2.new(1, -8, 0, 24)
    titleLabel.Position = UDim2.new(0, 4, 0, 0)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = BRAND .. " AUDIT"
    titleLabel.TextColor3 = accent
    titleLabel.Font = Enum.Font.GothamBold
    titleLabel.TextSize = 14
    titleLabel.TextScaled = false
    titleLabel.TextWrapped = false
    titleLabel.TextStrokeTransparency = 0
    local discordLabel = Instance.new("TextLabel", bb)
    discordLabel.Name = "DiscordLbl"
    discordLabel.Size = UDim2.new(1, -8, 0, 34)
    discordLabel.Position = UDim2.new(0, 4, 0, 25)
    discordLabel.BackgroundTransparency = 1
    discordLabel.Text = DISCORD_STACKED
    discordLabel.TextColor3 = gray
    discordLabel.Font = Enum.Font.GothamBold
    discordLabel.TextSize = 10
    discordLabel.TextScaled = false
    discordLabel.TextWrapped = true
    discordLabel.TextYAlignment = Enum.TextYAlignment.Center
    discordLabel.TextStrokeTransparency = 0
    speedLabel = Instance.new("TextLabel", bb)
    speedLabel.Name = "SpeedLbl"
    speedLabel.Size = UDim2.new(1, -8, 0, 28)
    speedLabel.Position = UDim2.new(0, 4, 0, 63)
    speedLabel.BackgroundTransparency = 1
    speedLabel.Text = "SPEED: 0"
    speedLabel.TextColor3 = accent
    speedLabel.Font = Enum.Font.GothamBold
    speedLabel.TextSize = 15
    speedLabel.TextScaled = false
    speedLabel.TextWrapped = false
    speedLabel.TextStrokeTransparency = 0
    local gr0 = addShimmerToLabel(titleLabel, accent2, accent)
    local gr1 = addShimmerToLabel(speedLabel, accent2, accent)
    local gr2 = addShimmerToLabel(discordLabel, gray, accent)
    task.spawn(function()
        local t = 0
        while bb and bb.Parent do
            t = t + 0.03
            local o = Vector2.new(math.sin(t) * 0.4, 0)
            gr0.Offset = o
            gr1.Offset = o
            gr2.Offset = o
            task.wait(0.04)
        end
    end)
end

local function getActiveMoveSpeed()
    if laggerCarryActive then
        return LAGGER_CARRY_SPEED
    elseif laggerModeEnabled then
        return LAGGER_SPEED
    elseif carrySpeedActive then
        return CS
    else
        return NS
    end
end

local function getAutoPathSpeed()
    if laggerModeEnabled then
        return LAGGER_SPEED
    else
        return NS
    end
end

local function applyVel(part, targetVel)
    if not part or not part.Parent then return end
    local mass = part.AssemblyMass
    if mass and mass > 0 then
        local delta = targetVel - part.AssemblyLinearVelocity
        part:ApplyImpulse(delta * mass)
    else
        part.AssemblyLinearVelocity = targetVel
    end
end

local function applyAngVel(part, targetAng)
    if not part or not part.Parent then return end
    part.AssemblyAngularVelocity = targetAng
end

local function manualJumpBoost(boost)
    if not infJumpEnabled or infJumpMode ~= "manual" then return end
    local char = LP.Character
    if not char then return end
    local root = char:FindFirstChild("HumanoidRootPart")
    if root then
        applyVel(root, Vector3.new(root.AssemblyLinearVelocity.X, boost, root.AssemblyLinearVelocity.Z))
    end
end

local function startHoldInfJump()
    if holdInfJumpConn then
        holdInfJumpConn:Disconnect()
    end
    holdInfJumpConn = RunService.Heartbeat:Connect(function()
        if not infJumpEnabled or infJumpMode ~= "hold" then return end
        local char = LP.Character
        if not char then return end
        local root = char:FindFirstChild("HumanoidRootPart")
        local hum = char:FindFirstChildOfClass("Humanoid")
        if not root or not hum then return end
        local isJumpHeld = UIS:IsKeyDown(Enum.KeyCode.Space) or (hum.Jump == true)
        local cv = root.AssemblyLinearVelocity
        if isJumpHeld and cv.Y < 35 then
            applyVel(root, Vector3.new(cv.X, 55, cv.Z))
        end
        cv = root.AssemblyLinearVelocity
        if cv.Y < -120 then
            applyVel(root, Vector3.new(cv.X, -120, cv.Z))
        end
    end)
end

local function stopHoldInfJump()
    if holdInfJumpConn then
        holdInfJumpConn:Disconnect()
        holdInfJumpConn = nil
    end
end

UIS.JumpRequest:Connect(function()
    manualJumpBoost(45)
end)

UIS.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode == Enum.KeyCode.Space and not UIS:GetFocusedTextBox() then
        task.delay(0.12, function()
            if UIS:IsKeyDown(Enum.KeyCode.Space) then
                manualJumpBoost(50)
            end
        end)
    end
end)

RunService.Heartbeat:Connect(function()
    if UIS:IsKeyDown(Enum.KeyCode.Space) then
        manualJumpBoost(50)
    end
end)

_antiKickConns = {}
enableAntiKick = function()
    antiKickEnabled = true
    task.spawn(function()
        while antiKickEnabled do
            task.wait(0.5)
            local char = LP.Character
            if char then
                for _, tool in ipairs(char:GetChildren()) do
                    if tool:IsA("Tool") then
                        local n = tool.Name:lower()
                        if n:find("brainrot") or n:find("skibidi") or n:find("toilet") then
                            brainrotDetected = true
                            if autoBatEnabled then
                                autoBatEnabled = false
                                if resetAutoBatMotion then resetAutoBatMotion() end
                                if autoBatSetVisual then autoBatSetVisual(false) end
                            end
                            if autoLeftEnabled then
                                autoLeftEnabled = false
                                if autoLeftSetVisual then autoLeftSetVisual(false) end
                            end
                            if autoRightEnabled then
                                autoRightEnabled = false
                                if autoRightSetVisual then autoRightSetVisual(false) end
                            end
                        else
                            brainrotDetected = false
                        end
                    end
                end
            end
        end
    end)
end

disableAntiKick = function()
    antiKickEnabled = false
    brainrotDetected = false
    for _, c in ipairs(_antiKickConns) do
        pcall(function() c:Disconnect() end)
    end
    _antiKickConns = {}
end

pcall(function()
    if hookfunction and newcclosure then
        local oldFire
        oldFire = hookfunction(Instance.new("RemoteEvent").FireServer, newcclosure(function(self, ...)
            if not cursedResetRemote and typeof(self) == "Instance" and self:IsA("RemoteEvent") and self.Name:sub(1, 3) == "RE/" then
                cursedResetRemote = self
            end
            return oldFire(self, ...)
        end))
    end
end)

task.spawn(function()
    task.wait(2)
    if cursedResetRemote then return end
    for _, desc in ipairs(game:GetDescendants()) do
        if desc:IsA("RemoteEvent") and desc.Name:sub(1, 3) == "RE/" then
            cursedResetRemote = desc
            break
        end
    end
end)

cursedInstaReset = function()
    local wasAntiRagEnabled = antiRagdollEnabled
    if not cursedResetRemote then
        for _, desc in ipairs(game:GetDescendants()) do
            if desc:IsA("RemoteEvent") and desc.Name:sub(1, 3) == "RE/" then
                cursedResetRemote = desc
                break
            end
        end
    end
    if not cursedResetRemote then return end
    local character = LP.Character
    local humanoid = character and character:FindFirstChildOfClass("Humanoid")
    if humanoid and humanoid.Health <= 0 then
        pcall(function() cursedResetRemote:FireServer(CURSED_RESET_GUID, LP, "balloon") end)
        return
    end
    local resetDetected = false
    local conns = {}
    if humanoid then
        table.insert(conns, humanoid.Died:Connect(function() resetDetected = true end))
    end
    if character then
        table.insert(conns, character.AncestryChanged:Connect(function(_, parent)
            if not parent then resetDetected = true end
        end))
    end
    task.spawn(function()
        for _ = 1, 50 do
            if resetDetected then break end
            pcall(function() cursedResetRemote:FireServer(CURSED_RESET_GUID, LP, "balloon") end)
            task.wait()
        end
        for _, conn in ipairs(conns) do
            pcall(function() conn:Disconnect() end)
        end
        task.wait(0.7)
        if wasAntiRagEnabled and not antiRagdollEnabled then
            antiRagdollEnabled = true
            startAntiRagdoll()
        end
    end)
end

KB = {
    DropBrainrot = { kb = nil, gp = nil },
    AutoLeft = { kb = nil, gp = nil },
    AutoRight = { kb = nil, gp = nil },
    AutoBat = { kb = nil, gp = nil },
    AimbotV2 = { kb = nil, gp = nil },
    TPFloor = { kb = nil, gp = nil },
    InstaReset = { kb = nil, gp = nil },
    GuiHide = { kb = nil, gp = nil },
    SpeedToggle = { kb = nil, gp = nil },
    LaggerToggle = { kb = nil, gp = nil },
    LaggerCarry = { kb = nil, gp = nil },
    AntiDesync = { kb = nil, gp = nil },
    LaggerPanel = { kb = nil, gp = nil },
    TPBat = { kb = nil, gp = nil },
}

AP_L1, AP_L2 = Vector3.new(-476.47, -6.28, 92.73), Vector3.new(-483.12, -4.95, 94.81)
AP_R1, AP_R2 = Vector3.new(-476.16, -6.52, 25.62), Vector3.new(-483.06, -5.03, 25.48)

Steal = {
    AutoStealEnabled = true,
    StealRadius = 10,
    PrimeRange = 80,
    StealDuration = 0.3,
    Mode = "half",
    HalfFireRange = 10,
    HalfHoldMin = 1.3,
    HalfHoldMax = 2.6,
    HalfEntryDelay = 0.3,
    Data = {},
    plotCache = {},
    plotCacheTime = {},
    cachedPrompts = {},
    promptCacheTime = 0,
    Stats = {
        total = 0,
        failed = 0,
        phase = "idle",
        target = "",
        lastResult = "",
        lastResultTime = 0,
    },
}

lastStealTick = 0
isStealing, stealStartTime = false, nil
Conns = { autoSteal = nil, antiRag = nil, batCounter = nil, anchor = {} }
MEDUSA_COOLDOWN = 25
batCounterDebounce = false
modeValLbl = nil
lastMoveDir = Vector3.new(0, 0, 0)
MOVE_KEYS = {
    [Enum.KeyCode.W] = true,
    [Enum.KeyCode.A] = true,
    [Enum.KeyCode.S] = true,
    [Enum.KeyCode.D] = true,
    [Enum.KeyCode.Up] = true,
    [Enum.KeyCode.Left] = true,
    [Enum.KeyCode.Down] = true,
    [Enum.KeyCode.Right] = true,
}

local function isRagdollState(hum)
    if not hum then return true end
    local st = hum:GetState()
    return hum.PlatformStand or st == Enum.HumanoidStateType.Physics or st == Enum.HumanoidStateType.Ragdoll or st == Enum.HumanoidStateType.FallingDown
end

local function isMyPlotByName(plotName)
    local ct = tick()
    if Steal.plotCache[plotName] ~= nil and (ct - (Steal.plotCacheTime[plotName] or 0)) < 2 then
        return Steal.plotCache[plotName]
    end
    local plots = workspace:FindFirstChild("Plots")
    if not plots then
        Steal.plotCache[plotName] = false
        Steal.plotCacheTime[plotName] = ct
        return false
    end
    local plot = plots:FindFirstChild(plotName)
    if not plot then
        Steal.plotCache[plotName] = false
        Steal.plotCacheTime[plotName] = ct
        return false
    end
    local sign = plot:FindFirstChild("PlotSign")
    if sign then
        local yb = sign:FindFirstChild("YourBase")
        if yb and yb:IsA("BillboardGui") then
            local r = yb.Enabled == true
            Steal.plotCache[plotName] = r
            Steal.plotCacheTime[plotName] = ct
            return r
        end

        local surfaceGui = sign:FindFirstChild("SurfaceGui")
        local frame = surfaceGui and surfaceGui:FindFirstChild("Frame")
        local ownerLabel = frame and frame:FindFirstChild("TextLabel")
        if ownerLabel and ownerLabel:IsA("TextLabel") and ownerLabel.Text ~= "Empty Base" then
            local owner = ownerLabel.Text:gsub("'s [Bb]ase$", ""):gsub("%s+$", "")
            local r = owner == LP.DisplayName or owner == LP.Name
            Steal.plotCache[plotName] = r
            Steal.plotCacheTime[plotName] = ct
            return r
        end
    end
    Steal.plotCache[plotName] = false
    Steal.plotCacheTime[plotName] = ct
    return false
end

local function getMyPlot()
    local plotsFolder = workspace:FindFirstChild("Plots")
    if not plotsFolder then return nil end
    for _, plot in ipairs(plotsFolder:GetChildren()) do
        if isMyPlotByName(plot.Name) then
            return plot
        end
    end
    for _, name in ipairs({ LP.Name, LP.DisplayName }) do
        local plot = name and plotsFolder:FindFirstChild(name)
        if plot then return plot end
    end
    return nil
end

local function getInstancePivot(instance)
    if not instance then return nil end
    if instance:IsA("BasePart") then return instance.CFrame end
    if instance:IsA("Model") then
        local ok, pivot = pcall(function() return instance:GetPivot() end)
        if ok then return pivot end
    end
    return nil
end

local function getBaseCFrame(plot)
    if not plot then return nil end
    local preferredNames = {
        "Spawn",
        "SpawnLocation",
        "PlotSpawn",
        "BaseSpawn",
        "PlayerSpawn",
        "Home",
        "Origin",
    }
    for _, name in ipairs(preferredNames) do
        local object = plot:FindFirstChild(name)
        local pivot = getInstancePivot(object)
        if pivot then return pivot end
    end

    local animalPodiums = plot:FindFirstChild("AnimalPodiums")
    for _, object in ipairs(plot:GetDescendants()) do
        local excluded = animalPodiums and object:IsDescendantOf(animalPodiums)
        if not excluded then
            for _, name in ipairs(preferredNames) do
                if object.Name == name then
                    local pivot = getInstancePivot(object)
                    if pivot then return pivot end
                end
            end
        end
    end

    local base = plot:FindFirstChild("Base")
    local basePivot = getInstancePivot(base)
    if basePivot then return basePivot end

    local sign = plot:FindFirstChild("PlotSign")
    local signPivot = getInstancePivot(sign)
    if signPivot then return signPivot end

    return getInstancePivot(plot)
end

local function teleportToBase()
    local character = LP.Character
    local root = character and (character:FindFirstChild("HumanoidRootPart")
        or character:FindFirstChild("UpperTorso")
        or character:FindFirstChild("Torso"))
    local humanoid = character and character:FindFirstChildOfClass("Humanoid")
    local plot = getMyPlot()
    if not root or not humanoid or humanoid.Health <= 0 or not plot then
        return false
    end

    local baseCFrame = getBaseCFrame(plot)
    if not baseCFrame then return false end
    local _, yaw = baseCFrame:ToEulerAnglesYXZ()
    local destination = baseCFrame.Position + Vector3.new(0, 4, 0)
    root.CFrame = CFrame.new(destination) * CFrame.Angles(0, yaw, 0)
    root.AssemblyLinearVelocity = Vector3.zero
    root.AssemblyAngularVelocity = Vector3.zero
    return true
end

local function collectPromptFromSpawn(sp)
    if not sp then return nil end
    local att = sp:FindFirstChild("PromptAttachment")
    if att then
        for _, child in ipairs(att:GetChildren()) do
            if child:IsA("ProximityPrompt") then
                return child
            end
        end
    end
    for _, child in ipairs(sp:GetDescendants()) do
        if child:IsA("ProximityPrompt") then
            return child
        end
    end
    return nil
end

local BrighterSync = {
    enabled = false,
    caches = {},
    connections = {},
    routeConnection = nil,
    channelConnection = nil,
    animals = {},
    scanAt = 0,
    started = false,
}

local function brighterSplitSyncPath(path)
    if typeof(path) == "table" then return path end
    local out = {}
    for part in string.gmatch(tostring(path), "[^%.]+") do
        table.insert(out, tonumber(part) or part)
    end
    return out
end

local function brighterResolveSyncPath(path, root)
    local current, parent, key = root, nil, nil
    for _, part in ipairs(brighterSplitSyncPath(path)) do
        parent = current
        key = part
        current = current and current[part] or nil
    end
    return current, parent, key
end

local function brighterApplySyncDiff(channelName, packet)
    local cache = BrighterSync.caches[channelName]
    if typeof(cache) ~= "table" or typeof(packet) ~= "table" then return end
    local path, action, a, b = packet[1], packet[2], packet[3], packet[4]
    local current, parent, key = brighterResolveSyncPath(path, cache)
    if action == "Changed" then
        if parent ~= nil then parent[key] = a end
    elseif action == "ArrayInsert" then
        if current ~= nil then table.insert(current, b, a) end
    elseif action == "ArrayRemoved" then
        if current ~= nil then table.remove(current, b) end
    elseif action == "DictionaryInsert" then
        if current ~= nil then current[b] = a end
    elseif action == "DictionaryRemoved" then
        if current ~= nil then current[b] = nil end
    end
end

local function brighterAttachChannel(remote, channelFolder, requestData)
    if BrighterSync.connections[remote] then return end
    local channelName = tostring(remote.Name)
    local plotsFolder = workspace:FindFirstChild("Plots")
    if not plotsFolder or not plotsFolder:FindFirstChild(channelName) then return end

    if requestData and BrighterSync.caches[channelName] == nil then
        local ok, data = pcall(function()
            return requestData:InvokeServer(channelName)
        end)
        BrighterSync.caches[channelName] = (ok and typeof(data) == "table") and data or {}
    elseif BrighterSync.caches[channelName] == nil then
        BrighterSync.caches[channelName] = {}
    end

    BrighterSync.connections[remote] = remote.OnClientEvent:Connect(function(queue)
        if typeof(queue) ~= "table" then return end
        for _, packet in ipairs(queue) do
            brighterApplySyncDiff(channelName, packet)
        end
    end)
end

local function brighterDetachChannel(channelName)
    for remote, connection in pairs(BrighterSync.connections) do
        if tostring(remote.Name) == tostring(channelName) then
            pcall(function() connection:Disconnect() end)
            BrighterSync.connections[remote] = nil
            BrighterSync.caches[tostring(channelName)] = nil
            break
        end
    end
end

local function brighterPromptForAnimal(animal)
    if not animal then return nil end
    local cached = Steal.cachedPrompts[animal.uid]
    if cached and cached.Parent then return cached end

    local plot = workspace:FindFirstChild("Plots") and workspace.Plots:FindFirstChild(animal.plot)
    local podiums = plot and plot:FindFirstChild("AnimalPodiums")
    local podium = podiums and podiums:FindFirstChild(tostring(animal.slot))
    local base = podium and podium:FindFirstChild("Base")
    local spawn = base and base:FindFirstChild("Spawn")
    local prompt = spawn and collectPromptFromSpawn(spawn)
    if prompt and prompt.ActionText and not string.find(string.lower(prompt.ActionText), "steal", 1, true) then
        prompt = nil
    end
    if prompt then
        Steal.cachedPrompts[animal.uid] = prompt
    end
    return prompt
end

local function brighterAnimalPosition(animal)
    local plot = workspace:FindFirstChild("Plots") and workspace.Plots:FindFirstChild(animal.plot)
    local podiums = plot and plot:FindFirstChild("AnimalPodiums")
    local podium = podiums and podiums:FindFirstChild(tostring(animal.slot))
    if not podium then return nil end
    local ok, pivot = pcall(function() return podium:GetPivot() end)
    return ok and pivot and pivot.Position or nil
end

function BrighterSync.scan()
    local plotsFolder = workspace:FindFirstChild("Plots")
    if not plotsFolder then
        BrighterSync.animals = {}
        return 0
    end

    local nextAnimals = {}
    for _, plot in ipairs(plotsFolder:GetChildren()) do
        local cache = BrighterSync.caches[plot.Name]
        local animalList = cache and cache.AnimalList
        if typeof(animalList) == "table" then
            for slot, animalData in pairs(animalList) do
                if typeof(animalData) == "table" and animalData.Index then
                    local animalName = tostring(animalData.Index)
                    local info = BrighterAnimalsData and BrighterAnimalsData[animalName]
                    table.insert(nextAnimals, {
                        name = (info and info.DisplayName) or animalName,
                        plot = plot.Name,
                        slot = tostring(slot),
                        uid = plot.Name .. "_" .. tostring(slot),
                    })
                end
            end
        end
    end

    BrighterSync.animals = nextAnimals
    BrighterSync.scanAt = tick()
    return #nextAnimals
end

function BrighterSync.findNearest()
    if tick() - (BrighterSync.scanAt or 0) > 2 then
        BrighterSync.scan()
    end
    local character = LP.Character
    local root = character and (character:FindFirstChild("HumanoidRootPart")
        or character:FindFirstChild("UpperTorso")
        or character:FindFirstChild("Torso"))
    if not root then return nil, nil end

    local bestPrompt, bestAnimal, bestDistance = nil, nil, math.huge
    local maxDistance = Steal.PrimeRange or Steal.StealRadius or 60
    for _, animal in ipairs(BrighterSync.animals) do
        if not isMyPlotByName(animal.plot) then
            local position = brighterAnimalPosition(animal)
            if position then
                local distance = (root.Position - position).Magnitude
                if distance <= maxDistance and distance < bestDistance then
                    local prompt = brighterPromptForAnimal(animal)
                    if prompt then
                        bestPrompt, bestAnimal, bestDistance = prompt, animal, distance
                    end
                end
            end
        end
    end
    return bestPrompt, bestAnimal
end

function BrighterSync.start()
    if BrighterSync.started then return BrighterSync.enabled end
    BrighterSync.started = true

    local packages = ReplicatedStorage:FindFirstChild("Packages")
    local synchronizer = packages and packages:FindFirstChild("Synchronizer")
    local channelFolder = synchronizer and synchronizer:FindFirstChild("Channel")
    local routeRemote = synchronizer and synchronizer:FindFirstChild("CommunicationRoute")
    local requestData = synchronizer and synchronizer:FindFirstChild("RequestData")
    if not channelFolder then
        BrighterSync.enabled = false
        return false
    end

    BrighterSync.enabled = true
    for _, child in ipairs(channelFolder:GetChildren()) do
        if child:IsA("RemoteEvent") then
            brighterAttachChannel(child, channelFolder, requestData)
        end
    end
    BrighterSync.channelConnection = channelFolder.ChildAdded:Connect(function(child)
        if child:IsA("RemoteEvent") then
            brighterAttachChannel(child, channelFolder, requestData)
        end
    end)
    if routeRemote then
        BrighterSync.routeConnection = routeRemote.OnClientEvent:Connect(function(actions)
            if typeof(actions) ~= "table" then return end
            for _, action in ipairs(actions) do
                local kind, channelName = action[1], tostring(action[2])
                if kind == "ListenerAdded" then
                    local remote = channelFolder:FindFirstChild(channelName)
                    if remote and remote:IsA("RemoteEvent") then
                        brighterAttachChannel(remote, channelFolder, requestData)
                    end
                elseif kind == "ListenerRemoved" then
                    brighterDetachChannel(channelName)
                end
            end
        end)
    end
    BrighterSync.scan()

    task.spawn(function()
        while BrighterSync.enabled do
            task.wait(5)
            BrighterSync.scan()
        end
    end)
    return true
end

local function isNearPodiumWithPrompt()
    local char = LP.Character
    local hrpL = char and char:FindFirstChild("HumanoidRootPart")
    if not hrpL then return false end
    local plots = workspace:FindFirstChild("Plots")
    if not plots then return false end
    for _, plot in ipairs(plots:GetChildren()) do
        if not isMyPlotByName(plot.Name) then
            local podiums = plot:FindFirstChild("AnimalPodiums")
            if podiums then
                for _, podium in ipairs(podiums:GetChildren()) do
                    local base = podium:FindFirstChild("Base")
                    local sp = base and base:FindFirstChild("Spawn")
                    if sp then
                        local d = (hrpL.Position - sp.Position).Magnitude
                        if d <= (Steal.PrimeRange or Steal.StealRadius or 60) then
                            if collectPromptFromSpawn(sp) then
                                return true
                            end
                        end
                    end
                end
            end
        end
    end
    return false
end

local function findNearestPrompt()
    
    local syncedPrompt, syncedAnimal = BrighterSync.findNearest()
    if syncedPrompt then
        return syncedPrompt, syncedAnimal
    end

    local char = LP.Character
    if not char then return nil, nil end
    local root = char:FindFirstChild("HumanoidRootPart")
        or char:FindFirstChild("UpperTorso")
        or char:FindFirstChild("Torso")
    if not root then return nil, nil end
    local plotsFolder = workspace:FindFirstChild("Plots")
    if not plotsFolder then return nil, nil end

    local nearest, dist = nil, math.huge
    for _, plot in ipairs(plotsFolder:GetChildren()) do
        if plot:IsA("Model") and not isMyPlotByName(plot.Name) then
            local pods = plot:FindFirstChild("AnimalPodiums")
            if pods then
                for _, pod in ipairs(pods:GetChildren()) do
                    local base = pod:FindFirstChild("Base")
                    local spawn = base and base:FindFirstChild("Spawn")
                    if spawn then
                        local distance = (spawn.Position - root.Position).Magnitude
                        if distance <= (Steal.PrimeRange or Steal.StealRadius or 60) and distance < dist then
                            local found = collectPromptFromSpawn(spawn)
                            if found and (not found.ActionText
                                or string.find(string.lower(found.ActionText), "steal", 1, true)) then
                                nearest, dist = found, distance
                            end
                        end
                    end
                end
            end
        end
    end
    return nearest, nil
end

local function _promptDist(prompt)
    local char = LP.Character
    if not char then return math.huge end
    local root = char:FindFirstChild("HumanoidRootPart") or char:FindFirstChild("UpperTorso") or char:FindFirstChild("Torso")
    if not root then return math.huge end
    local part = prompt.Parent
    if part and part:IsA("Attachment") then
        part = part.Parent
    end
    if part and part:IsA("BasePart") then
        return (part.Position - root.Position).Magnitude
    end
    local ok, cf = pcall(function() return prompt.Parent and prompt.Parent.WorldPosition end)
    if ok and cf then
        return (cf - root.Position).Magnitude
    end
    return math.huge
end

local function executeSteal(prompt, target)
    if isStealing or not prompt or not prompt.Parent then return end
    if not Steal.Data[prompt] then
        local data = { hold = {}, trigger = {}, ready = true }
        if getconnections then
            local okHold, holdConnections = pcall(getconnections, prompt.PromptButtonHoldBegan)
            if okHold and type(holdConnections) == "table" then
                for _, connection in ipairs(holdConnections) do
                    if type(connection.Function) == "function" then
                        table.insert(data.hold, connection.Function)
                    end
                end
            end
            local okTrigger, triggerConnections = pcall(getconnections, prompt.Triggered)
            if okTrigger and type(triggerConnections) == "table" then
                for _, connection in ipairs(triggerConnections) do
                    if type(connection.Function) == "function" then
                        table.insert(data.trigger, connection.Function)
                    end
                end
            end
        end
        Steal.Data[prompt] = data
    end

    local data = Steal.Data[prompt]
    if not data or not data.ready then return end
    data.ready = false
    isStealing = true
    stealStartTime = tick()

    local stats = Steal.Stats
    local label = (target and target.name)
        or (prompt.ObjectText and prompt.ObjectText ~= "" and prompt.ObjectText)
        or "Target"
    stats.phase = "holding"
    stats.target = tostring(label)
    stats.lastResult = ""
    if setStealStatusText then setStealStatusText("STEALING", 0) end

    task.spawn(function()
        local fired = false
        for _, callback in ipairs(data.hold) do
            task.spawn(callback)
        end

        if Steal.Mode == "half" then
            task.wait(Steal.HalfHoldMin)
            stats.phase = "waitingRange"
            local alreadyInRange = _promptDist(prompt) <= Steal.HalfFireRange
            while true do
                local elapsed = tick() - stealStartTime
                if elapsed > Steal.HalfHoldMax or not prompt.Parent then break end
                if _promptDist(prompt) <= Steal.HalfFireRange then
                    if not alreadyInRange then
                        task.wait(Steal.HalfEntryDelay)
                    end
                    for _, callback in ipairs(data.trigger) do
                        task.spawn(callback)
                    end
                    fired = true
                    break
                end
                task.wait()
            end
        else
            stats.phase = "waitingRange"
            local elapsed = 0
            while elapsed < Steal.StealDuration and prompt.Parent do
                elapsed = elapsed + task.wait()
            end
            if prompt.Parent then
                for _, callback in ipairs(data.trigger) do
                    task.spawn(callback)
                end
                fired = true
            end
        end

        if fired then
            stats.total = stats.total + 1
            stats.lastResult = "Grabbed " .. tostring(label)
            if setStealStatusText then setStealStatusText("STOLE", 1) end
        else
            stats.failed = stats.failed + 1
            stats.lastResult = "Missed " .. tostring(label)
            if setStealStatusText then setStealStatusText("MISSED", 0) end
        end
        stats.lastResultTime = tick()
        stats.phase = "idle"
        stats.target = ""
        isStealing = false
        task.wait(0.05)
        data.ready = true
    end)
end

startAutoSteal = function()
    if Conns.autoSteal then return end
    BrighterSync.start()
    Conns.autoSteal = RunService.Heartbeat:Connect(function()
        if not Steal.AutoStealEnabled or isStealing then return end
        local prompt, target = findNearestPrompt()
        if prompt then
            executeSteal(prompt, target)
        end
    end)
end

stopAutoSteal = function()
    if Conns.autoSteal then
        Conns.autoSteal:Disconnect()
        Conns.autoSteal = nil
    end
    isStealing = false
    Steal.Stats.phase = "idle"
    Steal.Stats.target = ""
end

RunService.Stepped:Connect(function()
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LP and p.Character then
            for _, part in ipairs(p.Character:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = false
                end
            end
        end
    end
end)

RunService.RenderStepped:Connect(function()
    local char = LP.Character
    if not char then return end
    local hum = char:FindFirstChildOfClass("Humanoid")
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hum or not hrp then return end
    if isRagdollState(hum) then
        lastMoveDir = Vector3.new(0, 0, 0)
        return
    end
    if not autoBatEnabled and not autoLeftEnabled and not autoRightEnabled then
        local md = hum.MoveDirection
        local spd = getActiveMoveSpeed()
        if md.Magnitude > 0 then
            lastMoveDir = md
            applyVel(hrp, Vector3.new(md.X * spd, hrp.AssemblyLinearVelocity.Y, md.Z * spd))
        elseif antiRagdollEnabled and lastMoveDir.Magnitude > 0 then
            local anyHeld = false
            for key in pairs(MOVE_KEYS) do
                if UIS:IsKeyDown(key) then
                    anyHeld = true
                    break
                end
            end
            if anyHeld then
                applyVel(hrp, Vector3.new(lastMoveDir.X * spd, hrp.AssemblyLinearVelocity.Y, lastMoveDir.Z * spd))
            end
        end
    end
    if speedLabel then
        speedLabel.Text = "SPEED: " .. string.format("%.1f", Vector3.new(hrp.AssemblyLinearVelocity.X, 0, hrp.AssemblyLinearVelocity.Z).Magnitude)
    end
end)

LP.CharacterAdded:Connect(function(char)
    task.wait(0.5)
    setupSpeedIndicator(char)
    if medusaCounterEnabled then setupMedusa(char) end
    if batCounterEnabled then startBatCounter() end
    if unwalkEnabled then
        task.wait(0.5)
        startUnwalk()
    end
end)

if LP.Character then
    setupSpeedIndicator(LP.Character)
end

alConn, arConn = nil, nil
alPhase, arPhase = 1, 1

stopAutoLeft = function()
    if alConn then
        alConn:Disconnect()
        alConn = nil
    end
    alPhase = 1
    local char = LP.Character
    if char then
        local h = char:FindFirstChildOfClass("Humanoid")
        if h then
            h:Move(Vector3.zero, false)
        end
    end
    if autoLeftSetVisual then autoLeftSetVisual(false) end
    if mobBtnRefs.autoLeft then mobBtnRefs.autoLeft(false) end
end

stopAutoRight = function()
    if arConn then
        arConn:Disconnect()
        arConn = nil
    end
    arPhase = 1
    local char = LP.Character
    if char then
        local h = char:FindFirstChildOfClass("Humanoid")
        if h then
            h:Move(Vector3.zero, false)
        end
    end
    if autoRightSetVisual then autoRightSetVisual(false) end
    if mobBtnRefs.autoRight then mobBtnRefs.autoRight(false) end
end

startAutoLeft = function()
    if alConn then alConn:Disconnect() end
    alPhase = 1
    alConn = RunService.Heartbeat:Connect(function()
        if not autoLeftEnabled then return end
        local char = LP.Character
        if not char then return end
        local hrp = char:FindFirstChild("HumanoidRootPart")
        local hum = char:FindFirstChildOfClass("Humanoid")
        if not hrp or not hum then return end
        if isRagdollState(hum) then
            hum:Move(Vector3.zero, false)
            return
        end
        local spd = getAutoPathSpeed()
        if alPhase == 1 then
            local tgt = Vector3.new(AP_L1.X, hrp.Position.Y, AP_L1.Z)
            if (tgt - hrp.Position).Magnitude < 1 then
                alPhase = 2
                local d = AP_L2 - hrp.Position
                local mv = Vector3.new(d.X, 0, d.Z).Unit
                hum:Move(mv, false)
                applyVel(hrp, Vector3.new(mv.X * spd, hrp.AssemblyLinearVelocity.Y, mv.Z * spd))
                return
            end
            local d = AP_L1 - hrp.Position
            local mv = Vector3.new(d.X, 0, d.Z).Unit
            hum:Move(mv, false)
            applyVel(hrp, Vector3.new(mv.X * spd, hrp.AssemblyLinearVelocity.Y, mv.Z * spd))
        elseif alPhase == 2 then
            local tgt = Vector3.new(AP_L2.X, hrp.Position.Y, AP_L2.Z)
            if (tgt - hrp.Position).Magnitude < 1 then
                hum:Move(Vector3.zero, false)
                applyVel(hrp, Vector3.zero)
                autoLeftEnabled = false
                if alConn then
                    alConn:Disconnect()
                    alConn = nil
                end
                alPhase = 1
                if autoLeftSetVisual then autoLeftSetVisual(false) end
                if mobBtnRefs.autoLeft then mobBtnRefs.autoLeft(false) end
                return
            end
            local d = AP_L2 - hrp.Position
            local mv = Vector3.new(d.X, 0, d.Z).Unit
            hum:Move(mv, false)
            applyVel(hrp, Vector3.new(mv.X * spd, hrp.AssemblyLinearVelocity.Y, mv.Z * spd))
        end
        if autoMoveSwingEnabled and not _alSwingDebounce then
            _alSwingDebounce = true
            local bat = findBat()
            if bat then
                if bat.Parent ~= char then
                    pcall(function() hum:EquipTool(bat) end)
                end
                pcall(function() bat:Activate() end)
            end
            task.delay(autoMoveSwingInterval, function() _alSwingDebounce = false end)
        end
    end)
end

startAutoRight = function()
    if arConn then arConn:Disconnect() end
    arPhase = 1
    arConn = RunService.Heartbeat:Connect(function()
        if not autoRightEnabled then return end
        local char = LP.Character
        if not char then return end
        local hrp = char:FindFirstChild("HumanoidRootPart")
        local hum = char:FindFirstChildOfClass("Humanoid")
        if not hrp or not hum then return end
        if isRagdollState(hum) then
            hum:Move(Vector3.zero, false)
            return
        end
        local spd = getAutoPathSpeed()
        if arPhase == 1 then
            local tgt = Vector3.new(AP_R1.X, hrp.Position.Y, AP_R1.Z)
            if (tgt - hrp.Position).Magnitude < 1 then
                arPhase = 2
                local d = AP_R2 - hrp.Position
                local mv = Vector3.new(d.X, 0, d.Z).Unit
                hum:Move(mv, false)
                applyVel(hrp, Vector3.new(mv.X * spd, hrp.AssemblyLinearVelocity.Y, mv.Z * spd))
                return
            end
            local d = AP_R1 - hrp.Position
            local mv = Vector3.new(d.X, 0, d.Z).Unit
            hum:Move(mv, false)
            applyVel(hrp, Vector3.new(mv.X * spd, hrp.AssemblyLinearVelocity.Y, mv.Z * spd))
        elseif arPhase == 2 then
            local tgt = Vector3.new(AP_R2.X, hrp.Position.Y, AP_R2.Z)
            if (tgt - hrp.Position).Magnitude < 1 then
                hum:Move(Vector3.zero, false)
                applyVel(hrp, Vector3.zero)
                autoRightEnabled = false
                if arConn then
                    arConn:Disconnect()
                    arConn = nil
                end
                arPhase = 1
                if autoRightSetVisual then autoRightSetVisual(false) end
                if mobBtnRefs.autoRight then mobBtnRefs.autoRight(false) end
                return
            end
            local d = AP_R2 - hrp.Position
            local mv = Vector3.new(d.X, 0, d.Z).Unit
            hum:Move(mv, false)
            applyVel(hrp, Vector3.new(mv.X * spd, hrp.AssemblyLinearVelocity.Y, mv.Z * spd))
        end
        if autoMoveSwingEnabled and not _arSwingDebounce then
            _arSwingDebounce = true
            local bat = findBat()
            if bat then
                if bat.Parent ~= char then
                    pcall(function() hum:EquipTool(bat) end)
                end
                pcall(function() bat:Activate() end)
            end
            task.delay(autoMoveSwingInterval, function() _arSwingDebounce = false end)
        end
    end)
end

runDrop = function()
    if dropActive then return end
    local char = LP.Character
    if not char then return end
    local root = char:FindFirstChild("HumanoidRootPart")
    if not root then return end
    dropActive = true
    local t0 = tick()
    local dc
    dc = RunService.Heartbeat:Connect(function()
        local r = char and char:FindFirstChild("HumanoidRootPart")
        if not r then
            dc:Disconnect()
            dropActive = false
            return
        end
        if tick() - t0 >= DROP_ASCEND_DURATION then
            dc:Disconnect()
            local rp = RaycastParams.new()
            rp.FilterDescendantsInstances = { char }
            rp.FilterType = Enum.RaycastFilterType.Exclude
            local rr = workspace:Raycast(r.Position, Vector3.new(0, -2000, 0), rp)
            if rr then
                local hum2 = char:FindFirstChildOfClass("Humanoid")
                local off = (hum2 and hum2.HipHeight or 2) + (r.Size.Y / 2)
                r.CFrame = CFrame.new(r.Position.X, rr.Position.Y + off, r.Position.Z)
                applyVel(r, Vector3.zero)
            end
            dropActive = false
            return
        end
        applyVel(r, Vector3.new(r.AssemblyLinearVelocity.X, DROP_ASCEND_SPEED, r.AssemblyLinearVelocity.Z))
    end)
end

local function doAutoTPDown(force)
    local char = LP.Character
    if not char then return end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    local hum2 = char:FindFirstChildOfClass("Humanoid")
    if not hum2 then return end
    if not force then
        if hum2.FloorMaterial ~= Enum.Material.Air then return end
        if not (hrp.Position.Y >= autoTPHeight) then return end
    end
    hrp.CFrame = CFrame.new(hrp.Position.X, -7.00, hrp.Position.Z) * CFrame.Angles(0, select(2, hrp.CFrame:ToEulerAnglesYXZ()), 0)
    applyVel(hrp, Vector3.zero)
end

startAutoTP = function()
    if autoTPConn then
        task.cancel(autoTPConn)
        autoTPConn = nil
    end
    autoTPConn = task.spawn(function()
        while autoTPEnabled do
            task.wait(0.1)
            pcall(function() doAutoTPDown(false) end)
        end
    end)
end

stopAutoTP = function()
    autoTPEnabled = false
    if autoTPConn then
        task.cancel(autoTPConn)
        autoTPConn = nil
    end
end

runTPFloor = function()
    pcall(function() doAutoTPDown(true) end)
end

defLightBrightness, defLightClock, defLightAmbient = nil, nil, nil

local function applyAntiLagDerender(obj)
    pcall(function()
        if obj:IsA("Accessory") or obj:IsA("Hat") then
            obj:Destroy()
        elseif obj:IsA("BasePart") then
            obj.Material = Enum.Material.Plastic
            obj.Reflectance = 0
            obj.CastShadow = false
        elseif obj:IsA("Decal") or obj:IsA("Texture") then
            obj.Transparency = 1
        elseif obj:IsA("ParticleEmitter") or obj:IsA("Trail") or obj:IsA("Beam") or obj:IsA("Fire") or obj:IsA("Smoke") or obj:IsA("Sparkles") then
            obj.Enabled = false
        end
    end)
end

enableAntiLag = function()
    removeAccessoriesEnabled = true
    antiLagEnabled = true
    defLightBrightness = defLightBrightness or Lighting.Brightness
    defLightClock = defLightClock or Lighting.ClockTime
    defLightAmbient = defLightAmbient or Lighting.OutdoorAmbient
    Lighting.GlobalShadows = false
    Lighting.FogEnd = 1e10
    Lighting.Brightness = 1
    Lighting.EnvironmentDiffuseScale = 0
    Lighting.EnvironmentSpecularScale = 0
    for _, e in pairs(Lighting:GetChildren()) do
        pcall(function()
            if e:IsA("BlurEffect") or e:IsA("SunRaysEffect") or e:IsA("ColorCorrectionEffect") or e:IsA("BloomEffect") or e:IsA("DepthOfFieldEffect") then
                e.Enabled = false
            end
        end)
    end
    for _, obj in ipairs(workspace:GetDescendants()) do
        applyAntiLagDerender(obj)
    end
    if antiLagDescConn then antiLagDescConn:Disconnect() end
    antiLagDescConn = workspace.DescendantAdded:Connect(function(obj)
        if removeAccessoriesEnabled then
            applyAntiLagDerender(obj)
        end
    end)
end

disableAntiLag = function()
    removeAccessoriesEnabled = false
    antiLagEnabled = false
    if antiLagDescConn then
        antiLagDescConn:Disconnect()
        antiLagDescConn = nil
    end
    pcall(function()
        if defLightBrightness then Lighting.Brightness = defLightBrightness end
        if defLightClock then Lighting.ClockTime = defLightClock end
        if defLightAmbient then Lighting.OutdoorAmbient = defLightAmbient end
        Lighting.ExposureCompensation = 0
    end)
end

local function findMedusa()
    local c = LP.Character
    if not c then return nil end
    for _, t in ipairs(c:GetChildren()) do
        if t:IsA("Tool") then
            local n = t.Name:lower()
            if n:find("medusa") or n:find("head") or n:find("stone") then
                return t
            end
        end
    end
    local bp = LP:FindFirstChild("Backpack")
    if bp then
        for _, t in ipairs(bp:GetChildren()) do
            if t:IsA("Tool") then
                local n = t.Name:lower()
                if n:find("medusa") or n:find("head") or n:find("stone") then
                    return t
                end
            end
        end
    end
    return nil
end

local function useMedusaCounter()
    if medusaDebounce then return end
    if MEDUSA_COOLDOWN > (tick() - medusaLastUsed) then return end
    local c = LP.Character
    if not c then return end
    medusaDebounce = true
    local med = findMedusa()
    if not med then
        medusaDebounce = false
        return
    end
    if med.Parent ~= c then
        local hum2 = c:FindFirstChildOfClass("Humanoid")
        if hum2 then
            hum2:EquipTool(med)
        end
    end
    pcall(function() med:Activate() end)
    medusaLastUsed = tick()
    medusaDebounce = false
end

local function onAnchorChanged(part)
    return part:GetPropertyChangedSignal("Anchored"):Connect(function()
        if part.Anchored and part.Transparency == 1 then
            if medusaResetEnabled then
                cursedInstaReset()
            elseif medusaCounterEnabled then
                useMedusaCounter()
            end
        end
    end)
end

setupMedusa = function(char)
    for _, c in pairs(Conns.anchor) do
        pcall(function() c:Disconnect() end)
    end
    Conns.anchor = {}
    if not char then return end
    for _, part in ipairs(char:GetDescendants()) do
        if part:IsA("BasePart") then
            table.insert(Conns.anchor, onAnchorChanged(part))
        end
    end
    table.insert(Conns.anchor, char.DescendantAdded:Connect(function(part)
        if part:IsA("BasePart") then
            table.insert(Conns.anchor, onAnchorChanged(part))
        end
    end))
end

stopMedusaCounter = function()
    for _, c in pairs(Conns.anchor) do
        pcall(function() c:Disconnect() end)
    end
    Conns.anchor = {}
end

BAT_COUNTER_SLAP_LIST = {
    "Bat",
    "Slap",
    "Iron Slap",
    "Gold Slap",
    "Diamond Slap",
    "Emerald Slap",
    "Ruby Slap",
    "Dark Matter Slap",
    "Flame Slap",
    "Nuclear Slap",
    "Galaxy Slap",
    "Glitched Slap",
}

local function findBatForCounter()
    local c = LP.Character
    if not c then return nil end
    local bp = LP:FindFirstChildOfClass("Backpack")
    for _, name in ipairs(BAT_COUNTER_SLAP_LIST) do
        local t = c:FindFirstChild(name) or (bp and bp:FindFirstChild(name))
        if t then return t end
    end
    for _, ch in ipairs(c:GetChildren()) do
        if ch:IsA("Tool") and ch.Name:lower():find("bat") then
            return ch
        end
    end
    if bp then
        for _, ch in ipairs(bp:GetChildren()) do
            if ch:IsA("Tool") and ch.Name:lower():find("bat") then
                return ch
            end
        end
    end
    return nil
end

local function swingBatForCounter(bat, char)
    local hum2 = char:FindFirstChildOfClass("Humanoid")
    if bat.Parent ~= char then
        if hum2 then
            pcall(function() hum2:EquipTool(bat) end)
        end
        task.wait(0.05)
    end
    local remote = bat:FindFirstChildOfClass("RemoteEvent") or bat:FindFirstChildOfClass("RemoteFunction")
    if remote and remote:IsA("RemoteEvent") then
        pcall(function() remote:FireServer() end)
        task.wait(0.15)
        pcall(function() remote:FireServer() end)
    else
        pcall(function() bat:Activate() end)
        task.wait(0.15)
        pcall(function() bat:Activate() end)
    end
end

startBatCounter = function()
    if Conns.batCounter then return end
    Conns.batCounter = RunService.Heartbeat:Connect(function()
        if not batCounterEnabled or batCounterDebounce then return end
        local char = LP.Character
        if not char then return end
        local hum2 = char:FindFirstChildOfClass("Humanoid")
        if not hum2 then return end
        local st = hum2:GetState()
        if st == Enum.HumanoidStateType.Physics or st == Enum.HumanoidStateType.Ragdoll or st == Enum.HumanoidStateType.FallingDown then
            batCounterDebounce = true
            task.spawn(function()
                local bat = findBatForCounter()
                if bat then
                    swingBatForCounter(bat, char)
                end
                task.wait(0.5)
                batCounterDebounce = false
            end)
        end
    end)
end

stopBatCounter = function()
    if Conns.batCounter then
        Conns.batCounter:Disconnect()
        Conns.batCounter = nil
    end
    batCounterDebounce = false
end

aimbotConn = nil
aimbotV2Conn = nil

local function findBat()
    local char = LP.Character
    if not char then return nil end
    for _, tool in ipairs(char:GetChildren()) do
        if tool:IsA("Tool") and (tool.Name:lower():find("bat") or tool.Name:lower():find("slap")) then
            return tool
        end
    end
    local bp = LP:FindFirstChild("Backpack")
    if bp then
        for _, tool in ipairs(bp:GetChildren()) do
            if tool:IsA("Tool") and (tool.Name:lower():find("bat") or tool.Name:lower():find("slap")) then
                return tool
            end
        end
    end
    return nil
end

local function swingCurrentBat()
    if not autoSwingEnabled then return end
    local bat = findBat()
    if bat and bat.Parent == LP.Character and bat:IsA("Tool") then
        pcall(function() bat:Activate() end)
    end
end

local function getClosestPlayerAim(maxDist)
    local root = LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
    if not root then return nil, math.huge end
    local closest, minDist = nil, maxDist or math.huge
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= LP and plr.Character then
            local tRoot = plr.Character:FindFirstChild("HumanoidRootPart")
            local hum = plr.Character:FindFirstChildOfClass("Humanoid")
            if tRoot and hum and hum.Health > 0 then
                local dist = (tRoot.Position - root.Position).Magnitude
                if dist < minDist then
                    minDist = dist
                    closest = plr
                end
            end
        end
    end
    return closest, minDist
end

_predBall = nil
findBatForAimbot = findBat

startBatAimbot = function()
    if aimbotConn then aimbotConn:Disconnect() end
    autoBatEnabled = true
    if autoLeftEnabled then
        autoLeftEnabled = false
        if autoLeftSetVisual then autoLeftSetVisual(false) end
        stopAutoLeft()
    end
    if autoRightEnabled then
        autoRightEnabled = false
        if autoRightSetVisual then autoRightSetVisual(false) end
        stopAutoRight()
    end
    _autoTPWasEnabledForBat = false
    if autoTPEnabled then
        _autoTPWasEnabledForBat = true
        stopAutoTP()
        if setAutoTPVisual then setAutoTPVisual(false) end
    end
    autoBatEnabled = true
    _aimbotTarget = nil
    _aimbotLastScan = 0
    _aimbotSwingCooldown = false
    autoBatEquippedThisRun = false
    aimbotConn = RunService.Heartbeat:Connect(function()
        if not autoBatEnabled then return end
        local char = LP.Character
        if not char then return end
        local root = char:FindFirstChild("HumanoidRootPart")
        if not root then return end
        local hum = char:FindFirstChildOfClass("Humanoid")
        if not hum then return end
        if not char:FindFirstChildOfClass("Tool") then
            local bat = findBatForAimbot()
            if bat then
                pcall(function() hum:EquipTool(bat) end)
            end
        end
        local now = tick()
        local target = _aimbotTarget
        if now - (_aimbotLastScan or 0) > 0.1 or not target or not target.Parent then
            _aimbotLastScan = now
            target = nil
            local closest, minDist = nil, math.huge
            for _, plr in ipairs(Players:GetPlayers()) do
                if plr ~= LP and plr.Character then
                    local tRoot = plr.Character:FindFirstChild("HumanoidRootPart")
                    local th = plr.Character:FindFirstChildOfClass("Humanoid")
                    if tRoot and th and th.Health > 0 then
                        local dist = (tRoot.Position - root.Position).Magnitude
                        if dist < minDist then
                            minDist = dist
                            closest = tRoot
                        end
                    end
                end
            end
            target = closest
            _aimbotTarget = target
        else
            local th = target.Parent and target.Parent:FindFirstChildOfClass("Humanoid")
            if not th or th.Health <= 0 then
                _aimbotTarget = nil
                target = nil
            end
        end
        if not target then
            hum.AutoRotate = true
            root.AssemblyAngularVelocity = Vector3.zero
            return
        end
        hum.AutoRotate = false
        local targetVel = target.AssemblyLinearVelocity
        local myPos = root.Position
        local targetPos = target.Position
        local predictPos = targetPos + targetVel * 0.14
        predictPos = predictPos + target.CFrame.LookVector * 0.3
        local direction = predictPos - myPos
        local flatDir = Vector3.new(direction.X, 0, direction.Z)
        if flatDir.Magnitude > 0.01 then
            flatDir = flatDir.Unit
        else
            flatDir = Vector3.new(0, 0, 1)
        end
        local chaseSpeed = 58
        local desiredHeight = targetPos.Y + 3.7
        local yVel = (desiredHeight - myPos.Y) * 19.5 + targetVel.Y * 0.8
        if hum.FloorMaterial ~= Enum.Material.Air then
            yVel = math.max(yVel, 13)
        end
        yVel = math.clamp(yVel, -70, 110)
        local desiredVel = Vector3.new(flatDir.X * chaseSpeed, yVel, flatDir.Z * chaseSpeed)
        root.AssemblyLinearVelocity = root.AssemblyLinearVelocity:Lerp(desiredVel, 0.8)
        local speed3 = targetVel.Magnitude
        local predictTime = math.clamp(speed3 / 150, 0.05, 0.2)
        local predictedPos = targetPos + targetVel * predictTime
        local toPredict = predictedPos - myPos
        if toPredict.Magnitude > 0.1 then
            local goalCF = CFrame.lookAt(myPos, predictedPos)
            local diffCF = root.CFrame:Inverse() * goalCF
            local rx, ry, rz = diffCF:ToEulerAnglesXYZ()
            rx = math.clamp(rx, -2.5, 2.5)
            ry = math.clamp(ry, -2.5, 2.5)
            rz = math.clamp(rz, -2.5, 2.5)
            root.AssemblyAngularVelocity = root.CFrame:VectorToWorldSpace(Vector3.new(rx * 42, ry * 42, rz * 42))
        end
        if autoSwingEnabled then
            local bat = char:FindFirstChild("Bat") or findBatForAimbot()
            if bat and bat:IsA("Tool") then
                pcall(function() bat:Activate() end)
            end
        end
    end)
    if autoBatSetVisual then autoBatSetVisual(true) end
    if mobBtnRefs.autoBat then mobBtnRefs.autoBat(true) end
end

isSummerBaseName = function(name)
    if not name then return false end
    local n = tostring(name):lower()
    return n == "summerbase" or n == "summer_base" or n:find("summerbase", 1, true) ~= nil or n:find("summer_base", 1, true) ~= nil
end

isAnchorName = function(name)
    if not name then return false end
    local n = tostring(name):lower()
    return n == "anchor" or n == "anchors"
end

stripBlockingAnchor = function(obj)
    if not obj or not obj.Parent then return end
    local key = tostring(obj:GetFullName())
    if _antiSummerCleaned[key] then return end
    _antiSummerCleaned[key] = true
    pcall(function()
        if obj:IsA("BasePart") or obj:IsA("MeshPart") then
            obj.CanCollide = false
            obj.CanQuery = false
            obj.CanTouch = false
            obj.Transparency = 1
        end
        obj:Destroy()
    end)
end

cleanSummerBaseAnchors = function()
    if not antiSummerBaseEnabled then return end
    local plots = workspace:FindFirstChild("Plots")
    if not plots then return end
    for _, plot in ipairs(plots:GetChildren()) do
        local isSummer = isSummerBaseName(plot.Name)
        if not isSummer then
            for _, d in ipairs(plot:GetDescendants()) do
                if isSummerBaseName(d.Name) then
                    isSummer = true
                    break
                end
            end
        end
        if isSummer then
            for _, d in ipairs(plot:GetDescendants()) do
                if isAnchorName(d.Name) then
                    stripBlockingAnchor(d)
                end
            end
        end
    end
end

enableAntiSummerBase = function()
    antiSummerBaseEnabled = true
    _antiSummerCleaned = {}
    cleanSummerBaseAnchors()
    if antiSummerBaseConn then
        pcall(function() antiSummerBaseConn:Disconnect() end)
        antiSummerBaseConn = nil
    end
    antiSummerBaseConn = workspace.DescendantAdded:Connect(function(obj)
        if not antiSummerBaseEnabled then return end
        if not isAnchorName(obj.Name) then return end
        task.defer(function()
            if not antiSummerBaseEnabled or not obj.Parent then return end
            local p = obj
            local underPlots, nearSummer = false, false
            while p and p ~= workspace do
                if p.Name == "Plots" or (p.Parent and p.Parent.Name == "Plots") then
                    underPlots = true
                end
                if isSummerBaseName(p.Name) then
                    nearSummer = true
                end
                p = p.Parent
            end
            if underPlots and nearSummer then
                stripBlockingAnchor(obj)
            end
        end)
    end)
    task.spawn(function()
        while antiSummerBaseEnabled do
            cleanSummerBaseAnchors()
            task.wait(5)
        end
    end)
end

disableAntiSummerBase = function()
    antiSummerBaseEnabled = false
    if antiSummerBaseConn then
        pcall(function() antiSummerBaseConn:Disconnect() end)
        antiSummerBaseConn = nil
    end
end

local function removeFace(head)
    local face = head:FindFirstChild("face")
    if face then face:Destroy() end
end

applyHeadlessToChar = function(char, enabled)
    if not char then return end
    local head = char:FindFirstChild("Head")
    if not head then return end
    if enabled then
        head.Transparency = 1
        head.CanCollide = false
        removeFace(head)
        for _, child in ipairs(head:GetChildren()) do
            if child:IsA("SpecialMesh") and child.MeshId == "rbxassetid://1095708" then
                child:Destroy()
            end
        end
        local mesh = Instance.new("SpecialMesh")
        mesh.MeshType = Enum.MeshType.FileMesh
        mesh.MeshId = "rbxassetid://1095708"
        mesh.Scale = Vector3.new(0.001, 0.001, 0.001)
        mesh.Name = "HeadlessMesh"
        mesh.Parent = head
        head:GetPropertyChangedSignal("Transparency"):Connect(function()
            if head.Transparency ~= 1 then
                head.Transparency = 1
            end
        end)
        head.ChildAdded:Connect(function(child)
            if child.Name == "face" and child:IsA("Decal") then
                child:Destroy()
            end
        end)
    else
        head.Transparency = 0
        head.CanCollide = true
        for _, child in ipairs(head:GetChildren()) do
            if child:IsA("SpecialMesh") and child.Name == "HeadlessMesh" then
                child:Destroy()
            end
        end
        removeFace(head)
    end
end

applyKorbloxToChar = function(char, enabled)
    if not char then return end
    local humanoid = char:FindFirstChildOfClass("Humanoid")
    if not humanoid then return end
    if enabled then
        if humanoid.RigType == Enum.HumanoidRigType.R6 then
            local rightLeg = char:FindFirstChild("Right Leg")
            if rightLeg then
                for _, child in ipairs(rightLeg:GetChildren()) do
                    if child:IsA("SpecialMesh") or child:IsA("CharacterMesh") then
                        child:Destroy()
                    end
                end
                rightLeg.Color = Color3.fromRGB(64, 64, 64)
                rightLeg:GetPropertyChangedSignal("Color"):Connect(function()
                    if rightLeg.Color ~= Color3.fromRGB(64, 64, 64) then
                        rightLeg.Color = Color3.fromRGB(64, 64, 64)
                    end
                end)
                local mesh = Instance.new("SpecialMesh")
                mesh.MeshType = Enum.MeshType.FileMesh
                mesh.MeshId = "rbxassetid://101851696"
                mesh.TextureId = "rbxassetid://101851254"
                mesh.Scale = Vector3.new(1, 1, 1)
                mesh.Name = "KorbloxMesh"
                mesh.Parent = rightLeg
            end
        elseif humanoid.RigType == Enum.HumanoidRigType.R15 then
            local rightUpperLeg = char:FindFirstChild("RightUpperLeg")
            if rightUpperLeg then
                rightUpperLeg.Transparency = 1
                local rightLowerLeg = char:FindFirstChild("RightLowerLeg")
                local rightFoot = char:FindFirstChild("RightFoot")
                if rightLowerLeg then rightLowerLeg.Transparency = 1 end
                if rightFoot then rightFoot.Transparency = 1 end
                local oldKorblox = char:FindFirstChild("KorbloxLeg")
                if oldKorblox then oldKorblox:Destroy() end
                local korbloxLeg = Instance.new("Part")
                korbloxLeg.Name = "KorbloxLeg"
                korbloxLeg.Size = Vector3.new(1, 2, 1)
                korbloxLeg.Anchored = false
                korbloxLeg.CanCollide = false
                korbloxLeg.Color = Color3.fromRGB(64, 64, 64)
                korbloxLeg.Parent = char
                local mesh = Instance.new("SpecialMesh")
                mesh.MeshType = Enum.MeshType.FileMesh
                mesh.MeshId = "rbxassetid://101851696"
                mesh.TextureId = "rbxassetid://101851254"
                mesh.Scale = Vector3.new(1, 1, 1)
                mesh.Name = "KorbloxMesh"
                mesh.Parent = korbloxLeg
                local weld = Instance.new("Weld")
                weld.Part0 = rightUpperLeg
                weld.Part1 = korbloxLeg
                weld.C0 = CFrame.new(0, -0.8, 0)
                weld.Name = "KorbloxWeld"
                weld.Parent = korbloxLeg
            end
        end
    else
        if humanoid.RigType == Enum.HumanoidRigType.R6 then
            local rightLeg = char:FindFirstChild("Right Leg")
            if rightLeg then
                for _, child in ipairs(rightLeg:GetChildren()) do
                    if child:IsA("SpecialMesh") and child.Name == "KorbloxMesh" then
                        child:Destroy()
                    end
                end
                rightLeg.Color = Color3.fromRGB(255, 255, 255)
            end
        elseif humanoid.RigType == Enum.HumanoidRigType.R15 then
            local rightUpperLeg = char:FindFirstChild("RightUpperLeg")
            if rightUpperLeg then
                rightUpperLeg.Transparency = 0
                local rightLowerLeg = char:FindFirstChild("RightLowerLeg")
                local rightFoot = char:FindFirstChild("RightFoot")
                if rightLowerLeg then rightLowerLeg.Transparency = 0 end
                if rightFoot then rightFoot.Transparency = 0 end
                local korbloxLeg = char:FindFirstChild("KorbloxLeg")
                if korbloxLeg then korbloxLeg:Destroy() end
            end
        end
    end
end

applyCharterToChar = function(char)
    if not char then return end
    applyHeadlessToChar(char, headlessEnabled)
    applyKorbloxToChar(char, korbloxEnabled)
end

player.CharacterAdded:Connect(function(char)
    task.wait(0.15)
    applyCharterToChar(char)
end)

RunService.Heartbeat:Connect(function()
    local char = player.Character
    if char then
        applyCharterToChar(char)
    end
end)

toggleHeadless = function()
    headlessEnabled = not headlessEnabled
    local char = player.Character
    if char then
        applyHeadlessToChar(char, headlessEnabled)
    end
    if headlessSetVisual then headlessSetVisual(headlessEnabled) end
    return headlessEnabled
end

toggleKorblox = function()
    korbloxEnabled = not korbloxEnabled
    local char = player.Character
    if char then
        applyKorbloxToChar(char, korbloxEnabled)
    end
    if korbloxSetVisual then korbloxSetVisual(korbloxEnabled) end
    return korbloxEnabled
end

stopBatAimbot = function()
    if aimbotConn then
        aimbotConn:Disconnect()
        aimbotConn = nil
    end
    autoBatEnabled = false
    if _predBall then
        _predBall:Destroy()
        _predBall = nil
    end
    local char = LP.Character
    local root = char and char:FindFirstChild("HumanoidRootPart")
    if root then
        applyVel(root, Vector3.zero)
        applyAngVel(root, Vector3.zero)
    end
    local hum2 = char and char:FindFirstChildOfClass("Humanoid")
    if hum2 then
        hum2.AutoRotate = true
    end
    if autoTPEnabled then startAutoTP() end
    if autoBatSetVisual then autoBatSetVisual(false) end
    if mobBtnRefs.autoBat then mobBtnRefs.autoBat(false) end
end

startAimbotV2 = function()
    if aimbotV2Conn then aimbotV2Conn:Disconnect() end
    aimbotV2Enabled = true
    if autoBatEnabled then
        stopBatAimbot()
        if autoBatSetVisual then autoBatSetVisual(false) end
        if mobBtnRefs.autoBat then mobBtnRefs.autoBat(false) end
    end
    local char = LP.Character
    if not char then return end
    local root = char:FindFirstChild("HumanoidRootPart")
    local hum0 = char:FindFirstChildOfClass("Humanoid")
    if not root or not hum0 then return end
    hum0.AutoRotate = false
    local FACE_OFFSET = 3
    local VYSE_HIT_DIST = _G._S2_AimDist or 12
    local AIMBOT_SPD = _G._S2_AimSpeed or 50
    local velHistory = {}
    local MAX_HIST = 6
    local lastTargetPos = nil
    aimbotV2Conn = RunService.RenderStepped:Connect(function()
        if not aimbotV2Enabled then return end
        local char2 = LP.Character
        if not char2 then return end
        local root2 = char2:FindFirstChild("HumanoidRootPart")
        if not root2 then return end
        local hum2 = char2:FindFirstChildOfClass("Humanoid")
        if not hum2 then return end
        local bat = findBat()
        if bat and bat.Parent ~= char2 then
            pcall(function() hum2:EquipTool(bat) end)
        end
        local target, dist = getClosestPlayerAim()
        if not target or not target.Character then
            applyVel(root2, Vector3.new(0, root2.AssemblyLinearVelocity.Y, 0))
            applyAngVel(root2, Vector3.zero)
            if _predBall then
                _predBall:Destroy()
                _predBall = nil
            end
            velHistory = {}
            lastTargetPos = nil
            return
        end
        local tr = target.Character:FindFirstChild("HumanoidRootPart")
        if not tr then return end
        local head = target.Character:FindFirstChild("Head")
        local targetPos = head and head.Position or tr.Position
        local targetVel = tr.AssemblyLinearVelocity
        if lastTargetPos and (targetPos - lastTargetPos).Magnitude > 20 then
            velHistory = {}
        end
        lastTargetPos = targetPos
        table.insert(velHistory, targetVel)
        if #velHistory > MAX_HIST then table.remove(velHistory, 1) end
        local smoothVel = Vector3.zero
        local totalW = 0
        for i, v in ipairs(velHistory) do
            local w = i / #velHistory
            smoothVel = smoothVel + v * w
            totalW = totalW + w
        end
        if totalW > 0 then
            smoothVel = smoothVel / totalW
        end
        local speed = smoothVel.Magnitude
        local predictTime = #velHistory < 2 and 0 or math.clamp(speed / 150, 0.05, 0.2)
        local predictedPos = targetPos + smoothVel * predictTime
        pcall(function()
            if not _predBall then
                _predBall = Instance.new("Part")
                _predBall.Name = "PredictionBall"
                _predBall.Shape = Enum.PartType.Ball
                _predBall.Size = Vector3.new(3, 3, 3)
                _predBall.Color = getTheme().ACCENT
                _predBall.Material = Enum.Material.Neon
                _predBall.CanCollide = false
                _predBall.CastShadow = false
                _predBall.TopSurface = Enum.SurfaceType.Smooth
                _predBall.BottomSurface = Enum.SurfaceType.Smooth
                _predBall.Parent = workspace
            end
            if _predBall and _predBall.Parent then
                _predBall.CFrame = CFrame.new(predictedPos)
                _predBall.Transparency = 0.1
                local accent = getTheme().ACCENT
                if _predBall.Color ~= accent then
                    _predBall.Color = accent
                end
            end
        end)
        local toTarget = predictedPos - root2.Position
        if toTarget.Magnitude > 0.5 then
            local goalCF = CFrame.lookAt(root2.Position, root2.Position + toTarget)
            local diffCF = root2.CFrame:Inverse() * goalCF
            local rx, ry, rz = diffCF:ToEulerAnglesXYZ()
            rx = math.clamp(rx, -3, 3)
            ry = math.clamp(ry, -3, 3)
            rz = math.clamp(rz, -3, 3)
            root2.AssemblyAngularVelocity = root2.CFrame:VectorToWorldSpace(Vector3.new(rx * 50, ry * 50, rz * 50))
        end
        local aimPoint = predictedPos + tr.CFrame.LookVector * FACE_OFFSET
        local direction = (aimPoint - root2.Position)
        if direction.Magnitude > 0.5 then
            applyVel(root2, direction.Unit * AIMBOT_SPD)
        else
            applyVel(root2, Vector3.new(smoothVel.X, root2.AssemblyLinearVelocity.Y, smoothVel.Z))
        end
        if dist <= VYSE_HIT_DIST and autoSwingEnabled then
            swingCurrentBat()
        end
    end)
    if mobBtnRefs.aimbotV2 then mobBtnRefs.aimbotV2(true) end
end

stopAimbotV2 = function()
    if aimbotV2Conn then
        aimbotV2Conn:Disconnect()
        aimbotV2Conn = nil
    end
    aimbotV2Enabled = false
    if _predBall then
        _predBall:Destroy()
        _predBall = nil
    end
    local char = LP.Character
    local root = char and char:FindFirstChild("HumanoidRootPart")
    if root then
        applyVel(root, Vector3.new(0, root.AssemblyLinearVelocity.Y, 0))
        applyAngVel(root, Vector3.zero)
    end
    local hum2 = char and char:FindFirstChildOfClass("Humanoid")
    if hum2 then
        hum2.AutoRotate = true
    end
    if mobBtnRefs.aimbotV2 then mobBtnRefs.aimbotV2(false) end
end

_G.TamelessAntiDesync = _G.TamelessAntiDesync or { conn = nil, hittingCooldown = false, h = nil, hrp = nil, diedConn = nil }
_G.TamelessAntiDesyncAimbotOn = false

function _G.TamelessAntiDesyncGetBat()
    local char = LP.Character
    if not char then return nil end
    local tool = char:FindFirstChild("Bat")
    if tool then return tool end
    local bp = LP:FindFirstChild("Backpack")
    if bp then
        tool = bp:FindFirstChild("Bat")
        if tool then
            tool.Parent = char
            return tool
        end
    end
    return nil
end

function _G.TamelessAntiDesyncTrySwing()
    if not _G.TamelessAntiDesync or _G.TamelessAntiDesync.hittingCooldown then return end
    _G.TamelessAntiDesync.hittingCooldown = true
    pcall(function()
        local bat = _G.TamelessAntiDesyncGetBat()
        if bat then
            bat:Activate()
            local ev = bat:FindFirstChildWhichIsA("RemoteEvent")
            if ev then
                ev:FireServer()
            end
        end
    end)
    task.delay(0.08, function()
        if _G.TamelessAntiDesync then
            _G.TamelessAntiDesync.hittingCooldown = false
        end
    end)
end

function _G.TamelessAntiDesyncGetClosestPlayer()
    local hrp = _G.TamelessAntiDesync and _G.TamelessAntiDesync.hrp
    if not hrp then return nil, math.huge end
    local cp, cd = nil, math.huge
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= LP and p.Character then
            local tr = p.Character:FindFirstChild("HumanoidRootPart")
            if tr then
                local d = (hrp.Position - tr.Position).Magnitude
                if d < cd then
                    cd = d
                    cp = p
                end
            end
        end
    end
    return cp, cd
end

function _G.TamelessAntiDesyncSetupChar(char)
    task.wait(0.1)
    if not _G.TamelessAntiDesync then return end
    _G.TamelessAntiDesync.h = char and char:WaitForChild("Humanoid", 5) or nil
    _G.TamelessAntiDesync.hrp = char and char:WaitForChild("HumanoidRootPart", 5) or nil
    batTP.h = _G.TamelessAntiDesync.h
    batTP.hrp = _G.TamelessAntiDesync.hrp
    if _G.TamelessAntiDesync.diedConn then
        pcall(function() _G.TamelessAntiDesync.diedConn:Disconnect() end)
        _G.TamelessAntiDesync.diedConn = nil
    end
    if _G.TamelessAntiDesync.h and _G.TamelessAntiDesyncAimbotOn then
        _G.TamelessAntiDesync.diedConn = _G.TamelessAntiDesync.h.Died:Connect(function()
            _G.TamelessStopAntiDesyncAimbot()
            if batTP.setVisual then batTP.setVisual(false) end
            if mobBtnRefs.tpBat then mobBtnRefs.tpBat(false) end
        end)
    end
end

LP.CharacterAdded:Connect(function(char)
    pcall(function() _G.TamelessAntiDesyncSetupChar(char) end)
end)

if LP.Character then
    task.spawn(function()
        pcall(function() _G.TamelessAntiDesyncSetupChar(LP.Character) end)
    end)
end

function _G.TamelessStartAntiDesyncAimbot()
    _G.TamelessAntiDesyncAimbotOn = true
    batTP.enabled = true
    if _G.TamelessAntiDesync.conn then
        _G.TamelessAntiDesync.conn:Disconnect()
        _G.TamelessAntiDesync.conn = nil
    end
    if LP.Character then
        pcall(function() _G.TamelessAntiDesyncSetupChar(LP.Character) end)
    end
    _G.TamelessAntiDesync.conn = RunService.Heartbeat:Connect(function()
        if not (_G.TamelessAntiDesyncAimbotOn and _G.TamelessAntiDesync.h and _G.TamelessAntiDesync.hrp) then return end
        local target, dist = _G.TamelessAntiDesyncGetClosestPlayer()
        if target and target.Character then
            local tr = target.Character:FindFirstChild("HumanoidRootPart")
            if tr then
                pcall(function()
                    if sethiddenproperty then
                        sethiddenproperty(_G.TamelessAntiDesync.hrp, "PhysicsRepRootPart", tr)
                    end
                end)
                local targetPos = tr.Position + Vector3.new(0, 0.9, 0)
                if (_G.TamelessAntiDesync.hrp.Position - targetPos).Magnitude > 8 then
                    _G.TamelessAntiDesync.hrp.CFrame = CFrame.new(targetPos)
                end
                local cam = workspace.CurrentCamera
                if cam then
                    cam.CFrame = CFrame.new(cam.CFrame.Position, tr.Position)
                end
                if autoSwingEnabled then
                    _G.TamelessAntiDesyncTrySwing()
                end
            end
        end
    end)
    batTP.conn = _G.TamelessAntiDesync.conn
    if batTP.setVisual then batTP.setVisual(true) end
    if mobBtnRefs.tpBat then mobBtnRefs.tpBat(true) end
    saveConfig()
end

function _G.TamelessStopAntiDesyncAimbot()
    _G.TamelessAntiDesyncAimbotOn = false
    batTP.enabled = false
    if _G.TamelessAntiDesync and _G.TamelessAntiDesync.conn then
        _G.TamelessAntiDesync.conn:Disconnect()
        _G.TamelessAntiDesync.conn = nil
    end
    batTP.conn = nil
    if _G.TamelessAntiDesync then
        _G.TamelessAntiDesync.hittingCooldown = false
    end
    if _G.TamelessAntiDesync and _G.TamelessAntiDesync.diedConn then
        _G.TamelessAntiDesync.diedConn:Disconnect()
        _G.TamelessAntiDesync.diedConn = nil
    end
    batTP.hrp = nil
    batTP.h = nil
    if batTP.setVisual then batTP.setVisual(false) end
    if mobBtnRefs.tpBat then mobBtnRefs.tpBat(false) end
    saveConfig()
end

function _G.TamelessToggleAntiDesyncAimbot()
    if _G.TamelessAntiDesyncAimbotOn then
        _G.TamelessStopAntiDesyncAimbot()
    else
        _G.TamelessStartAntiDesyncAimbot()
    end
end

batTP = batTP or {}
batTP.start = function() _G.TamelessStartAntiDesyncAimbot() end
batTP.stop = function() _G.TamelessStopAntiDesyncAimbot() end
batTP.toggle = function() _G.TamelessToggleAntiDesyncAimbot() end
batTP.enabled = false
batTP.setVisual = nil

startAutoPlay = function()
    autoPlayEnabled = true
    stopAutoLeft()
    stopAutoRight()
    autoLeftEnabled = false
    autoRightEnabled = false
    local side = autoPlaySide or "left"
    if side == "left" then
        autoLeftEnabled = true
        if type(startAutoLeft) == "function" then startAutoLeft() end
    else
        autoRightEnabled = true
        if type(startAutoRight) == "function" then startAutoRight() end
    end
    if autoPlaySetVisual then autoPlaySetVisual(true) end
    if mobBtnRefs.autoPlay then mobBtnRefs.autoPlay(true) end
end

stopAutoPlay = function()
    autoPlayEnabled = false
    autoLeftEnabled = false
    autoRightEnabled = false
    if type(stopAutoLeft) == "function" then stopAutoLeft() end
    if type(stopAutoRight) == "function" then stopAutoRight() end
    if autoPlaySetVisual then autoPlaySetVisual(false) end
    if mobBtnRefs.autoPlay then mobBtnRefs.autoPlay(false) end
end

queueAutoBatStart = function()
    if antiKickEnabled and brainrotDetected then return end
    if autoLeftEnabled then
        autoLeftEnabled = false
        if autoLeftSetVisual then autoLeftSetVisual(false) end
        stopAutoLeft()
    end
    if autoRightEnabled then
        autoRightEnabled = false
        if autoRightSetVisual then autoRightSetVisual(false) end
        stopAutoRight()
    end
    startBatAimbot()
end

resetAutoBatMotion = function()
    local char = LP.Character
    local hrp = char and char:FindFirstChild("HumanoidRootPart")
    local hum = char and char:FindFirstChildOfClass("Humanoid")
    if hrp then
        applyVel(hrp, hrp.AssemblyLinearVelocity * 0.3)
        applyAngVel(hrp, Vector3.zero)
    end
    if hum then
        hum.AutoRotate = true
    end
end

setNormalSpeed = function()
    carrySpeedActive = false
    laggerModeEnabled = false
    laggerCarryActive = false
    refreshSpeedModeLabel()
    if mobBtnRefs.normalSpeed then mobBtnRefs.normalSpeed(true) end
    if mobBtnRefs.normalCarry then mobBtnRefs.normalCarry(false) end
    if mobBtnRefs.laggerNormal then mobBtnRefs.laggerNormal(false) end
    if mobBtnRefs.laggerCarry then mobBtnRefs.laggerCarry(false) end
    if setCarryModeVisual then setCarryModeVisual(false) end
    if setLaggerModeVisual then setLaggerModeVisual(false) end
    saveConfig()
end

setNormalCarry = function()
    carrySpeedActive = true
    laggerModeEnabled = false
    laggerCarryActive = false
    refreshSpeedModeLabel()
    if mobBtnRefs.normalSpeed then mobBtnRefs.normalSpeed(false) end
    if mobBtnRefs.normalCarry then mobBtnRefs.normalCarry(true) end
    if mobBtnRefs.laggerNormal then mobBtnRefs.laggerNormal(false) end
    if mobBtnRefs.laggerCarry then mobBtnRefs.laggerCarry(false) end
    if setCarryModeVisual then setCarryModeVisual(true) end
    if setLaggerModeVisual then setLaggerModeVisual(false) end
    saveConfig()
end

setLaggerNormal = function()
    carrySpeedActive = false
    laggerModeEnabled = true
    laggerCarryActive = false
    refreshSpeedModeLabel()
    if mobBtnRefs.normalSpeed then mobBtnRefs.normalSpeed(false) end
    if mobBtnRefs.normalCarry then mobBtnRefs.normalCarry(false) end
    if mobBtnRefs.laggerNormal then mobBtnRefs.laggerNormal(true) end
    if mobBtnRefs.laggerCarry then mobBtnRefs.laggerCarry(false) end
    if setCarryModeVisual then setCarryModeVisual(false) end
    if setLaggerModeVisual then setLaggerModeVisual(true) end
    saveConfig()
end

setLaggerCarry = function()
    carrySpeedActive = false
    laggerModeEnabled = false
    laggerCarryActive = true
    refreshSpeedModeLabel()
    if mobBtnRefs.normalSpeed then mobBtnRefs.normalSpeed(false) end
    if mobBtnRefs.normalCarry then mobBtnRefs.normalCarry(false) end
    if mobBtnRefs.laggerNormal then mobBtnRefs.laggerNormal(false) end
    if mobBtnRefs.laggerCarry then mobBtnRefs.laggerCarry(true) end
    if setCarryModeVisual then setCarryModeVisual(false) end
    if setLaggerModeVisual then setLaggerModeVisual(true) end
    saveConfig()
end

local function resetCharacter(char)
    local hum = char:FindFirstChildOfClass("Humanoid")
    local root = char:FindFirstChild("HumanoidRootPart")
    if not hum or not root or hum.Health <= 0 then return end
    pcall(function()
        hum:ChangeState(Enum.HumanoidStateType.GettingUp)
        hum:ChangeState(Enum.HumanoidStateType.Running)
        root.Velocity = Vector3.zero
        root.RotVelocity = Vector3.zero
        root.AssemblyLinearVelocity = Vector3.zero
        root.AssemblyAngularVelocity = Vector3.zero
        hum.PlatformStand = false
        hum.Sit = false
        hum.AutoRotate = true
        hum.JumpPower = hum.JumpPower > 0 and hum.JumpPower or 50
        hum.WalkSpeed = hum.WalkSpeed > 0 and hum.WalkSpeed or 16
        for _, obj in ipairs(char:GetDescendants()) do
            if obj:IsA("Motor6D") then
                obj.Enabled = true
            elseif obj:IsA("Constraint") or obj:IsA("BallSocketConstraint") or obj:IsA("HingeConstraint") then
                obj.Enabled = true
            elseif obj:IsA("BasePart") then
                obj.CanCollide = true
                obj.AssemblyLinearVelocity = Vector3.zero
                obj.AssemblyAngularVelocity = Vector3.zero
            end
        end
        workspace.CurrentCamera.CameraSubject = hum
        local PM = LP.PlayerScripts:FindFirstChild("PlayerModule")
        if PM then
            local CM = PM:FindFirstChild("ControlModule")
            if CM then
                local success, module = pcall(require, CM)
                if success and module and module.Enable then
                    module:Enable()
                end
            end
        end
    end)
end

startAntiRagdoll = function()
    if antiRagdollConn then return end
    antiRagdollConn = RunService.Heartbeat:Connect(function()
        if not antiRagdollEnabled then return end
        local char = LP.Character
        if not char then return end
        local hum = char:FindFirstChildOfClass("Humanoid")
        if not hum then return end
        local state = hum:GetState()
        if state == Enum.HumanoidStateType.Physics or state == Enum.HumanoidStateType.Ragdoll or state == Enum.HumanoidStateType.FallingDown or state == Enum.HumanoidStateType.Dead or hum.PlatformStand == true or hum.Sit == true then
            resetCharacter(char)
        end
    end)
end

stopAntiRagdoll = function()
    if antiRagdollConn then
        antiRagdollConn:Disconnect()
        antiRagdollConn = nil
    end
end

LP.CharacterAdded:Connect(function(char)
    task.wait(0.5)
    startAntiRagdoll()
end)
startAntiRagdoll()

saveConfig = function()
    local ok, err = pcall(function()
        local function ks(e)
            if type(e) ~= "table" then return { kb = nil, gp = nil } end
            return { kb = e.kb and e.kb.Name or nil, gp = e.gp and e.gp.Name or nil }
        end
        local btnPos = {}
        pcall(function() btnPos = loadBtnPositions() or {} end)
        local guiPos = {}
        pcall(function() guiPos = loadGuiPositions() or {} end)
        local cfg = {
            normalSpeed = NS,
            carrySpeed = CS,
            dropBrainrotKey = ks(KB.DropBrainrot),
            autoLeftKey = ks(KB.AutoLeft),
            autoRightKey = ks(KB.AutoRight),
            autoBatKey = ks(KB.AutoBat),
            aimbotV2Key = ks(KB.AimbotV2),
            laggerToggleKey = ks(KB.LaggerToggle),
            laggerCarryKey = ks(KB.LaggerCarry),
            tpFloorKey = ks(KB.TPFloor),
            instaResetKey = ks(KB.InstaReset),
            guiHideKey = ks(KB.GuiHide),
            speedToggleKey = ks(KB.SpeedToggle),
            antiDesyncKey = ks(KB.AntiDesync),
            tpBatKey = ks(KB.TPBat),
            autoCarryEnabled = autoCarryEnabled == true,
            grabRadius = Steal.StealRadius,
            primeRange = Steal.PrimeRange,
            stealDuration = Steal.StealDuration,
            antiRagdoll = antiRagdollEnabled == true,
            autoStealEnabled = Steal.AutoStealEnabled == true,
            infiniteJump = infJumpEnabled == true,
            infJumpMode = infJumpMode,
            medusaCounter = medusaCounterEnabled == true,
            batCounter = batCounterEnabled == true,
            carrySpeedActive = carrySpeedActive == true,
            laggerModeEnabled = laggerModeEnabled == true,
            laggerCarryActive = laggerCarryActive == true,
            laggerSpeed = LAGGER_SPEED,
            laggerCarrySpeed = LAGGER_CARRY_SPEED,
            autoBat = autoBatEnabled == true,
            aimbotV2 = aimbotV2Enabled == true,
            autoSwing = autoSwingEnabled == true,
            unwalkEnabled = unwalkEnabled == true,
            antiLag = antiLagEnabled == true,
            autoTPEnabled = autoTPEnabled == true,
            autoTPHeight = autoTPHeight,
            guiTransparencyEnabled = guiTransparencyEnabled == true,
            mobileButtonsEnabled = mobileButtonsEnabled == true,
            mobileButtonsLocked = mobileButtonsLocked == true,
            mobileButtonsSize = mobileButtonsSize,
            circleButtonsEnabled = circleButtonsEnabled == true,
            guiScale = guiScaleValue,
            antiKick = antiKickEnabled == true,
            fovValue = fovValue,
            perButtonDrag = true,
            antiSummerBase = antiSummerBaseEnabled == true,
            headless = headlessEnabled == true,
            korblox = korbloxEnabled == true,
            skyTheme = currentSkyTheme,
            guiTheme = currentGuiTheme,
            autoMoveSwing = autoMoveSwingEnabled == true,
            autoMoveSwingInterval = autoMoveSwingInterval,
            ragdollGui = ragdollGuiEnabled == true,
            introEnabled = introEnabled ~= false,
            introMusicEnabled = introMusicEnabled ~= false,
            espBox = espBoxEnabled == true,
            espHighlight = espHighlightEnabled == true,
            espTracer = espTracerEnabled == true,
            espSpeed = espSpeedEnabled == true,
            espRagdollCD = espRagdollCDEnabled == true,
            selectedIntroMusic = selectedIntroMusic,
            btnPositions = btnPos,
            guiPositions = guiPos,
            autoPlaySide = autoPlaySide,
            desyncEnabled = desyncEnabled == true,
        }
        local encoded = HS:JSONEncode(cfg)
        local wrote = false
        pcall(function() writefile("Tameless.json", encoded) wrote = true end)
        pcall(function() writefile("TamelessConfig.json", encoded) end)
        pcall(function()
            if getgenv then
                getgenv()._TamelessCfg = cfg
                getgenv()._TamelessIntroEnabled = cfg.introEnabled
            end
        end)
        if not wrote then
            warn("[Snow.VS] writefile did not succeed — using getgenv session backup")
        end
    end)
    if not ok then
        warn("[Snow.VS] saveConfig failed: ", err)
    end
end

task.spawn(function()
    while task.wait(5) do saveConfig() end
end)

local function resetAllSettings()
    NS = 60
    CS = 30
    LAGGER_SPEED = 15
    LAGGER_CARRY_SPEED = 24.5
    carrySpeedActive = false
    laggerModeEnabled = false
    laggerCarryActive = false
    antiRagdollEnabled = true
    infJumpEnabled = false
    infJumpMode = "manual"
    medusaCounterEnabled = false
    batCounterEnabled = false
    unwalkEnabled = false
    autoLeftEnabled = false
    autoRightEnabled = false
    autoBatEnabled = false
    autoSwingEnabled = true
    autoMoveSwingEnabled = false
    autoTPEnabled = false
    autoTPHeight = 20
    antiLagEnabled = false
    Steal.AutoStealEnabled = false
    if setInstaGrab then setInstaGrab(false) end
    Steal.StealRadius = 10
    Steal.PrimeRange = 80
    Steal.StealDuration = 0.3
    guiTransparencyEnabled = false
    mobileButtonsEnabled = true
    mobileButtonsSize = 98
    guiScaleValue = (UIS.TouchEnabled and 0.63 or 1)
    circleButtonsEnabled = false
    antiKickEnabled = false
    uiLocked = false
    fovValue = 80
    fovIndex = 1
    KB.DropBrainrot = { kb = nil, gp = nil }
    KB.AutoLeft = { kb = nil, gp = nil }
    KB.AutoRight = { kb = nil, gp = nil }
    KB.AutoBat = { kb = nil, gp = nil }
    KB.TPFloor = { kb = nil, gp = nil }
    KB.InstaReset = { kb = nil, gp = nil }
    KB.GuiHide = { kb = nil, gp = nil }
    KB.SpeedToggle = { kb = nil, gp = nil }
    KB.LaggerToggle = { kb = nil, gp = nil }
    autoPlaySide = "left"
    if refreshSpeedModeLabel then refreshSpeedModeLabel() end
    if mobBtnRefs.normalSpeed then mobBtnRefs.normalSpeed(true) end
    if mobBtnRefs.normalCarry then mobBtnRefs.normalCarry(false) end
    if mobBtnRefs.laggerNormal then mobBtnRefs.laggerNormal(false) end
    if mobBtnRefs.laggerCarry then mobBtnRefs.laggerCarry(false) end
    if mobBtnRefs.autoLeft then mobBtnRefs.autoLeft(false) end
    if mobBtnRefs.autoRight then mobBtnRefs.autoRight(false) end
    if mobBtnRefs.autoBat then mobBtnRefs.autoBat(false) end
    stopBatAimbot()
    stopAutoSteal()
    stopAutoLeft()
    stopAutoRight()
    stopAntiRagdoll()
    startAntiRagdoll()
    stopAutoTP()
    stopHoldInfJump()
    if antiLagEnabled then disableAntiLag() end
    saveConfig()
end

setInstaGrab, setInfJumpVisual, setAntiRagVisual, setMedusaVisual, setUnwalkVisual, setAntiLagVisual, setAutoSwingVisual = nil, nil, nil, nil, nil, nil, nil
setTranspVisual, setLockVisual, setMobVisual, setCircleBtnsVisual, setMedusaResetVisual = nil, nil, nil, nil, nil
normalBox, carryBox, laggerBox, laggerCarryBox, radInput, autoTPHeightBox, durationBox, primeRangeBox = nil, nil, nil, nil, nil, nil, nil, nil
mainFrame = nil
mainGuiRef = nil
_persistentConns = {}

local function trackConn(conn)
    table.insert(_persistentConns, conn)
    return conn
end

local function clearPersistentConns()
    for _, c in ipairs(_persistentConns) do
        pcall(function() c:Disconnect() end)
    end
    _persistentConns = {}
end

refreshSpeedModeLabel = function()
    if modeValLbl then
        if laggerCarryActive then
            modeValLbl.Text = "Lagger Carry"
        elseif laggerModeEnabled then
            modeValLbl.Text = "Lagger"
        elseif carrySpeedActive then
            modeValLbl.Text = "Carry"
        else
            modeValLbl.Text = "Normal"
        end
    end
    if mobBtnRefs.normalSpeed then
        mobBtnRefs.normalSpeed(not carrySpeedActive and not laggerModeEnabled and not laggerCarryActive)
    end
    if mobBtnRefs.normalCarry then
        mobBtnRefs.normalCarry(carrySpeedActive and not laggerModeEnabled and not laggerCarryActive)
    end
    if mobBtnRefs.laggerNormal then
        mobBtnRefs.laggerNormal(laggerModeEnabled and not laggerCarryActive)
    end
    if mobBtnRefs.laggerCarry then
        mobBtnRefs.laggerCarry(laggerCarryActive)
    end
    if setCarryModeVisual then
        setCarryModeVisual(carrySpeedActive and not laggerModeEnabled and not laggerCarryActive)
    end
    if setLaggerModeVisual then
        setLaggerModeVisual(laggerModeEnabled or laggerCarryActive)
    end
end

toggleCarryMode = function()
    if laggerModeEnabled or laggerCarryActive then
        if laggerCarryActive then setNormalCarry() else setNormalSpeed() end
    elseif carrySpeedActive then
        setNormalSpeed()
    else
        setNormalCarry()
    end
end

toggleLaggerMode = function()
    if laggerModeEnabled or laggerCarryActive then
        if laggerCarryActive then setLaggerNormal() else setLaggerCarry() end
    else
        if carrySpeedActive then setLaggerCarry() else setLaggerNormal() end
    end
end

toggleLaggerCarryMode = function() toggleLaggerMode() end

LP.CharacterAdded:Connect(function(char)
    task.wait(0.5)
    local hum = char:FindFirstChildOfClass("Humanoid")
    if hum and workspace.CurrentCamera then
        workspace.CurrentCamera.CameraSubject = hum
    end
end)

startUnwalk = function()
    local c = LP.Character
    if not c then return end
    local hum = c:FindFirstChildOfClass("Humanoid")
    if hum then
        for _, t in ipairs(hum:GetPlayingAnimationTracks()) do
            t:Stop()
        end
    end
    local anim = c:FindFirstChild("Animate")
    if anim then
        unwalkSavedAnimate = anim:Clone()
        anim:Destroy()
    end
end

stopUnwalk = function()
    local c = LP.Character
    if c and unwalkSavedAnimate then
        unwalkSavedAnimate:Clone().Parent = c
        unwalkSavedAnimate = nil
    end
end

local stealPctLbl = nil
local stealFpsLbl = nil
local stealPingLbl = nil
local stealGuiRef = nil
local stealFill = nil
local stealStatusLbl = nil

local function createStealBarUI()
    for _, n in ipairs({ "SnowVSStealBar", "SnowVSInfoBar" }) do
        local old = game:GetService("CoreGui"):FindFirstChild(n)
        if old then old:Destroy() end
        local pgui = LP:FindFirstChild("PlayerGui")
        if pgui then
            local o = pgui:FindFirstChild(n)
            if o then o:Destroy() end
        end
    end
    local ACCENT = Color3.fromRGB(30, 144, 255)
    local BARBG = Color3.fromRGB(14, 12, 20)
    local SB_W, SB_H = 300, 72
    local stealGui = Instance.new("ScreenGui")
    stealGui.Name = "SnowVSInfoBar"
    stealGui.ResetOnSpawn = false
    stealGui.IgnoreGuiInset = true
    stealGui.DisplayOrder = 12
    if parentGui then parentGui(stealGui) else stealGui.Parent = LP:FindFirstChild("PlayerGui") or game:GetService("CoreGui") end
    stealGuiRef = stealGui
    stealBarFrame = Instance.new("Frame", stealGui)
    stealBarFrame.Size = UDim2.new(0, SB_W, 0, SB_H)
    do
        local _sbPos = nil
        pcall(function() _sbPos = loadGuiPositions()["_stealBar"] end)
        if _sbPos and tonumber(_sbPos.xo) ~= nil and tonumber(_sbPos.yo) ~= nil then
            local svpX = (workspace.CurrentCamera and workspace.CurrentCamera.ViewportSize.X) or 800
            local svpY = (workspace.CurrentCamera and workspace.CurrentCamera.ViewportSize.Y) or 600
            local sx = (_sbPos.xs or 0.5) * svpX + (_sbPos.xo or 0)
            local sy = (_sbPos.ys or 1) * svpY + (_sbPos.yo or 0)
            if sx + SB_W >= 0 and sx - SB_W <= svpX and sy + SB_H >= 0 and sy - SB_H <= svpY then
                stealBarFrame.Position = UDim2.new(_sbPos.xs or 0.5, _sbPos.xo or 0, _sbPos.ys or 1, _sbPos.yo or 0)
            else
                stealBarFrame.Position = UDim2.new(0.5, -SB_W / 2, 1, -90)
            end
        else
            stealBarFrame.Position = UDim2.new(0.5, -SB_W / 2, 1, -90)
        end
    end
    stealBarFrame.BackgroundColor3 = BARBG
    stealBarFrame.BackgroundTransparency = 0.15
    stealBarFrame.BorderSizePixel = 0
    stealBarFrame.Active = true
    stealBarFrame.ClipsDescendants = true
    local corner = Instance.new("UICorner", stealBarFrame)
    corner.CornerRadius = UDim.new(0, 16)
    local sbStroke = Instance.new("UIStroke", stealBarFrame)
    sbStroke.Color = ACCENT
    sbStroke.Thickness = 1.2
    sbStroke.Transparency = 0.35
    local barGrad = Instance.new("UIGradient", stealBarFrame)
    barGrad.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(22, 14, 38)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(10, 8, 18)),
    })
    local stealLbl = Instance.new("TextLabel", stealBarFrame)
    stealLbl.Size = UDim2.new(1, -28, 0, 18)
    stealLbl.Position = UDim2.new(0, 14, 0, 3)
    stealLbl.BackgroundTransparency = 1
    stealLbl.Text = BRAND .. " // BRIGHTER AUTO GRAB"
    stealStatusLbl = stealLbl
    stealLbl.TextColor3 = ACCENT
    stealLbl.Font = Enum.Font.GothamBold
    stealLbl.TextSize = 12
    stealLbl.TextXAlignment = Enum.TextXAlignment.Center
    stealLbl.ZIndex = 5
    local pctLbl = Instance.new("TextLabel", stealBarFrame)
    pctLbl.Size = UDim2.new(0, 82, 0, 16)
    pctLbl.Position = UDim2.new(1, -96, 0, 51)
    pctLbl.BackgroundTransparency = 1
    pctLbl.Text = "0%"
    pctLbl.TextColor3 = ACCENT
    pctLbl.Font = Enum.Font.GothamBlack
    pctLbl.TextSize = 12
    pctLbl.TextXAlignment = Enum.TextXAlignment.Right
    pctLbl.ZIndex = 5
    stealPctLbl = pctLbl
    local fpsLbl = Instance.new("TextLabel", stealBarFrame)
    fpsLbl.Size = UDim2.new(0, 82, 0, 16)
    fpsLbl.Position = UDim2.new(0, 14, 0, 51)
    fpsLbl.BackgroundTransparency = 1
    fpsLbl.Text = "FPS: --"
    fpsLbl.TextColor3 = ACCENT
    fpsLbl.Font = Enum.Font.GothamBold
    fpsLbl.TextSize = 10
    fpsLbl.TextXAlignment = Enum.TextXAlignment.Left
    fpsLbl.ZIndex = 5
    stealFpsLbl = fpsLbl
    local pingLbl = Instance.new("TextLabel", stealBarFrame)
    pingLbl.Size = UDim2.new(0, 82, 0, 16)
    pingLbl.Position = UDim2.new(0.5, -41, 0, 51)
    pingLbl.BackgroundTransparency = 1
    pingLbl.Text = "PING: --"
    pingLbl.TextColor3 = ACCENT
    pingLbl.Font = Enum.Font.GothamBold
    pingLbl.TextSize = 10
    pingLbl.TextXAlignment = Enum.TextXAlignment.Center
    pingLbl.ZIndex = 5
    stealPingLbl = pingLbl
    local pTrack = Instance.new("Frame", stealBarFrame)
    pTrack.Size = UDim2.new(1, -24, 0, 14)
    pTrack.Position = UDim2.new(0, 12, 0, 27)
    pTrack.BackgroundColor3 = Color3.fromRGB(24, 16, 42)
    pTrack.BorderSizePixel = 0
    pTrack.ClipsDescendants = true
    local trackCorner = Instance.new("UICorner", pTrack)
    trackCorner.CornerRadius = UDim.new(0, 20)
    local trackStroke = Instance.new("UIStroke", pTrack)
    trackStroke.Color = ACCENT
    trackStroke.Thickness = 1
    trackStroke.Transparency = 0.6
    stealFill = Instance.new("Frame", pTrack)
    stealFill.Size = UDim2.new(0, 0, 1, 0)
    stealFill.BackgroundColor3 = ACCENT
    stealFill.BorderSizePixel = 0
    local fillCorner = Instance.new("UICorner", stealFill)
    fillCorner.CornerRadius = UDim.new(0, 20)
    local fillGrad = Instance.new("UIGradient", stealFill)
    fillGrad.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(20, 100, 200)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(100, 200, 255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(20, 100, 200)),
    })
    local dragStart, dragStartPos, isDragging = nil, nil, false
    stealBarFrame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            isDragging = true
            dragStart = input.Position
            dragStartPos = stealBarFrame.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    isDragging = false
                    if stealBarFrame and writefile then
                        local p = stealBarFrame.Position
                        pcall(function() mergeGuiPosition("_stealBar", p.X.Scale, p.X.Offset, p.Y.Scale, p.Y.Offset) end)
                    end
                end
            end)
        end
    end)
    UIS.InputChanged:Connect(function(input)
        if isDragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            local delta = input.Position - dragStart
            stealBarFrame.Position = UDim2.new(dragStartPos.X.Scale, dragStartPos.X.Offset + delta.X, dragStartPos.Y.Scale, dragStartPos.Y.Offset + delta.Y)
        end
    end)
    return stealGui
end

local function updateStealPct(pct)
    if stealPctLbl then stealPctLbl.Text = tostring(math.floor(pct * 100 + 0.5)) .. "%" end
    if stealFill then stealFill.Size = UDim2.new(math.clamp(pct, 0, 1), 0, 1, 0) end
end

local function updateStealFps(fps)
    if stealFpsLbl then stealFpsLbl.Text = "FPS: " .. tostring(fps) end
end

local function updateStealPing(ping)
    if stealPingLbl then stealPingLbl.Text = "PING: " .. tostring(ping) end
end

local function createStealBar() createStealBarUI() end

setStealStatusText = function(status, extra)
    if status == "STEALING" then
        updateStealPct(extra or 0)
        if stealStatusLbl then
            stealStatusLbl.Text = "GRABBING " .. tostring(Steal.Stats.target or "TARGET")
        end
    elseif status == "STOLE" then
        updateStealPct(1)
        if stealStatusLbl then
            stealStatusLbl.Text = "✓ " .. tostring(Steal.Stats.lastResult or "GRABBED")
        end
    elseif status == "MISSED" then
        updateStealPct(0)
        if stealStatusLbl then
            stealStatusLbl.Text = "× " .. tostring(Steal.Stats.lastResult or "MISSED")
        end
    elseif status == "SCANNING" then
        if stealStatusLbl then stealStatusLbl.Text = BRAND .. " // BRIGHTER AUTO GRAB" end
    elseif status == "BASE" then
        updateStealPct(1)
        if stealStatusLbl then stealStatusLbl.Text = "✓ BASE TP COMPLETE" end
    elseif status == "ERROR" then
        updateStealPct(0)
        if stealStatusLbl then stealStatusLbl.Text = "× BASE NOT FOUND" end
    else
        if stealStatusLbl then stealStatusLbl.Text = "AUTO GRAB OFFLINE" end
    end
end

task.spawn(function()
    local frames = 0
    local t0 = tick()
    while true do
        frames = frames + 1
        local now = tick()
        if now - t0 >= 0.5 then
            local fps = math.floor(frames / (now - t0) + 0.5)
            updateStealFps(fps)
            local ping = 0
            pcall(function()
                local ok, v = pcall(function() return math.floor(LP:GetNetworkPing() * 1000 + 0.5) end)
                if ok and type(v) == "number" then ping = v end
            end)
            updateStealPing(ping)
            frames = 0
            t0 = now
        end
        task.wait()
    end
end)

local function updateStealProgress()
    while true do
        task.wait(0.05)
        if isStealing and stealStartTime then
            local elapsed = tick() - stealStartTime
            local pct = math.clamp(elapsed / math.max(Steal.HalfHoldMax, 0.01), 0, 1)
            updateStealPct(pct)
            if stealStatusLbl and Steal.Stats.phase == "waitingRange" then
                stealStatusLbl.Text = "WAITING RANGE // " .. tostring(Steal.Stats.target or "TARGET")
            end
        elseif Steal.AutoStealEnabled then
            updateStealPct(0)
            if stealStatusLbl and (tick() - (Steal.Stats.lastResultTime or 0)) > 1.5 then
                setStealStatusText("SCANNING")
            end
        else
            updateStealPct(0)
            setStealStatusText("OFF")
        end
    end
end
task.spawn(updateStealProgress)

local function destroyMobileButtons()
    pcall(saveBtnPositions)
    if mobGuiRef then
        pcall(function() mobGuiRef:Destroy() end)
        mobGuiRef = nil
    end
    for _, n in ipairs({ "SnowVSMobileButtons" }) do
        local old = game:GetService("CoreGui"):FindFirstChild(n)
        if old then old:Destroy() end
        local pgui = LP:FindFirstChild("PlayerGui")
        if pgui then
            local o = pgui:FindFirstChild(n)
            if o then o:Destroy() end
        end
    end
    mobBtnRefs = {}
end

local function buildMobileButtons()
    destroyMobileButtons()
    if not mobileButtonsEnabled then return end
    perButtonDragEnabled = true
    local savedPositions = loadBtnPositions()
    local BTN_SIZE = math.floor(mobileButtonsSize * 0.55)
    local BTN_GAP = 12
    local CORNER_R = circleButtonsEnabled and BTN_SIZE or math.max(8, math.floor(BTN_SIZE * 0.22))
    local fontSize = math.max(7, math.floor(mobileButtonsSize * 0.10))
    local buttons = {
        { key = "drop", label = "DROP\nBR", toggle = false, exclusive = false },
        { key = "autoPlay", label = "AUTO\nPLAY", toggle = true, exclusive = true },
        { key = "autoBat", label = "AIMBOT", toggle = true, exclusive = true },
        { key = "tpBat", label = "TP\nBAT", toggle = true, exclusive = true },
        { key = "tpDown", label = "TP\nDOWN", toggle = false, exclusive = false },
        { key = "baseTP", label = "BASE\nTP", toggle = false, exclusive = false },
        { key = "normalCarry", label = "CARRY\nMODE", toggle = true, exclusive = false },
        { key = "laggerNormal", label = "LAGGER\nNORMAL", toggle = true, exclusive = false },
        { key = "laggerCarry", label = "LAGGER\nCARRY", toggle = true, exclusive = false },
        { key = "instaReset", label = "INSTA\nRESET", toggle = false, exclusive = false },
    }
    local COLS = 2
    local totalW = (COLS * (BTN_SIZE + BTN_GAP)) - BTN_GAP
    local totalH = (math.ceil(#buttons / COLS) * (BTN_SIZE + BTN_GAP)) - BTN_GAP
    local PAD = 10
    local vp = workspace.CurrentCamera and workspace.CurrentCamera.ViewportSize or Vector2.new(800, 600)
    local savedPanel = savedPositions["_panel"]
    local defPanelX = vp.X - totalW - PAD * 2 - 18
    local defPanelY = math.max(10, vp.Y / 2 - (totalH + PAD * 2) / 2)
    local panelXO = savedPanel and savedPanel.xo or defPanelX
    local panelYO = savedPanel and savedPanel.yo or defPanelY
    local mobGui = Instance.new("ScreenGui")
    mobGui.Name = "SnowVSMobileButtons"
    mobGui.ResetOnSpawn = false
    mobGui.DisplayOrder = 15
    mobGui.IgnoreGuiInset = true
    parentGui(mobGui)
    mobGuiRef = mobGui
    local th = getTheme()
    local PINK_ON = th.MOB_ON
    local BTN_BG_OFF = th.MOB_OFF
    local PANEL_BG = th.BG
    local BORDER_OFF = th.MOB_BORDER_OFF
    local BORDER_ON = th.MOB_ON
    local TEXT_OFF = th.MOB_TEXT_OFF
    local TEXT_ON = th.MOB_TEXT_ON
    local STROKE_W = 1
    local panel
    if not perButtonDragEnabled then
        panel = Instance.new("Frame", mobGui)
        panel.Name = "MobPanel"
        panel.Size = UDim2.new(0, totalW + PAD * 2, 0, totalH + PAD * 2)
        panel.Position = UDim2.new(0, panelXO, 0, panelYO)
        panel.BackgroundColor3 = PANEL_BG
        panel.BackgroundTransparency = 1
        panel.BorderSizePixel = 0
        panel.Active = true
        panel.ZIndex = 99
        local panelStroke = Instance.new("UIStroke", panel)
        panelStroke.Color = Color3.fromRGB(80, 80, 80)
        panelStroke.Thickness = 1
        panelStroke.Transparency = 0.7
        local gDragStart, gDragStartPos, gDragDown = nil, nil, false
        panel.InputBegan:Connect(function(input)
            if uiLocked then return end
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                gDragDown = true
                gDragStart = input.Position
                gDragStartPos = panel.Position
                input.Changed:Connect(function()
                    if input.UserInputState == Enum.UserInputState.End then
                        gDragDown = false
                        if writefile then
                            local posData = loadBtnPositions()
                            posData["_panel"] = { xo = panel.Position.X.Offset, yo = panel.Position.Y.Offset }
                            pcall(function() writefile(MOB_POS_FILE, HS:JSONEncode(posData)) end)
                        end
                    end
                end)
            end
        end)
        UIS.InputChanged:Connect(function(input)
            if gDragDown and not uiLocked and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
                local delta = input.Position - gDragStart
                panel.Position = UDim2.new(0, gDragStartPos.X.Offset + delta.X, 0, gDragStartPos.Y.Offset + delta.Y)
            end
        end)
    end
    for i, def in ipairs(buttons) do
        local col = (i - 1) % COLS
        local rowN = math.floor((i - 1) / COLS)
        local localX = PAD + col * (BTN_SIZE + BTN_GAP)
        local localY = PAD + rowN * (BTN_SIZE + BTN_GAP)
        local frameParent = perButtonDragEnabled and mobGui or panel
        local frame = Instance.new("Frame", frameParent)
        frame.Name = "MobBtn_" .. def.key
        frame.Size = UDim2.new(0, BTN_SIZE, 0, BTN_SIZE)
        local sp = (not forceDefaultBtnPos) and savedPositions[def.key] or nil
        local cam = workspace.CurrentCamera
        local vpX = (cam and cam.ViewportSize.X) or 800
        local vpY = (cam and cam.ViewportSize.Y) or 600
        if sp and tonumber(sp.xo) ~= nil and tonumber(sp.yo) ~= nil and tonumber(sp.xo) > vpX * 0.35 then
            frame.Position = UDim2.new(0, tonumber(sp.xo), 0, tonumber(sp.yo))
        else
            local xo = vpX - (totalW + PAD + 18) + localX
            local yo = math.max(10, vpY / 2 - (totalH + PAD * 2) / 2) + localY
            frame.Position = UDim2.new(0, xo, 0, yo)
        end
        frame.BackgroundColor3 = BTN_BG_OFF
        frame.BackgroundTransparency = 0
        frame.BorderSizePixel = 0
        frame.Active = true
        frame.ZIndex = 102
        frame:SetAttribute("BtnKey", def.key)
        local uic = Instance.new("UICorner", frame)
        uic.CornerRadius = circleButtonsEnabled and UDim.new(1, 0) or UDim.new(0, CORNER_R)
        local fstroke = Instance.new("UIStroke", frame)
        fstroke.Color = BORDER_OFF
        fstroke.Thickness = STROKE_W
        fstroke.Transparency = 0.45
        local btn = Instance.new("TextButton", frame)
        btn.Size = UDim2.new(1, 0, 1, 0)
        btn.BackgroundTransparency = 1
        btn.Text = def.label
        btn.TextColor3 = TEXT_OFF
        btn.Font = Enum.Font.GothamBlack
        btn.TextSize = fontSize
        btn.LineHeight = 1.1
        btn.TextWrapped = true
        btn.AutoButtonColor = false
        btn.ZIndex = 105
        btn.TextStrokeTransparency = 1
        local isOn = false
        local function setOn(v)
            isOn = v
            if v then
                frame:SetAttribute("BtnIsOn", true)
                TweenService:Create(frame, TweenInfo.new(0.12, Enum.EasingStyle.Quad), { BackgroundColor3 = PINK_ON }):Play()
                TweenService:Create(fstroke, TweenInfo.new(0.12), { Color = BORDER_ON, Thickness = STROKE_W + 1 }):Play()
                TweenService:Create(btn, TweenInfo.new(0.12), { TextColor3 = TEXT_ON }):Play()
            else
                frame:SetAttribute("BtnIsOn", false)
                TweenService:Create(frame, TweenInfo.new(0.12, Enum.EasingStyle.Quad), { BackgroundColor3 = BTN_BG_OFF }):Play()
                TweenService:Create(fstroke, TweenInfo.new(0.12), { Color = BORDER_OFF, Thickness = STROKE_W }):Play()
                TweenService:Create(btn, TweenInfo.new(0.12), { TextColor3 = TEXT_OFF }):Play()
            end
        end
        mobBtnRefs[def.key] = setOn
        local function flash()
            TweenService:Create(frame, TweenInfo.new(0.06), { BackgroundColor3 = Color3.fromRGB(240, 240, 240) }):Play()
            task.delay(0.18, function()
                TweenService:Create(frame, TweenInfo.new(0.1), { BackgroundColor3 = BTN_BG_OFF }):Play()
            end)
        end
        local _fdn, _fds, _fsp, _fdDragging, _justDragged = false, nil, nil, false, false
        btn.InputBegan:Connect(function(input)
            if uiLocked then return end
            if activeMobDrag and activeMobDrag ~= frame then return end
            if input.UserInputType ~= Enum.UserInputType.MouseButton1 and input.UserInputType ~= Enum.UserInputType.Touch then return end
            _fdn = true
            _fds = input.Position
            _fsp = frame.Position
            _fdDragging = false
            _justDragged = false
            activeMobDrag = frame
        end)
        btn.InputChanged:Connect(function(input)
            if not _fdn or uiLocked then return end
            if input.UserInputType ~= Enum.UserInputType.MouseMovement and input.UserInputType ~= Enum.UserInputType.Touch then return end
            local d = input.Position - _fds
            if not _fdDragging then
                if math.abs(d.X) > 8 or math.abs(d.Y) > 8 then
                    _fdDragging = true
                else
                    return
                end
            end
            local vp = (workspace.CurrentCamera and workspace.CurrentCamera.ViewportSize) or Vector2.new(800, 600)
            local rawX = _fsp.X.Scale * vp.X + _fsp.X.Offset + d.X
            local rawY = _fsp.Y.Scale * vp.Y + _fsp.Y.Offset + d.Y
            frame.Position = UDim2.new(0, math.clamp(rawX, 0, vp.X - BTN_SIZE), 0, math.clamp(rawY, 0, vp.Y - BTN_SIZE))
            _justDragged = true
        end)
        UIS.InputEnded:Connect(function(input)
            if not _fdn or activeMobDrag ~= frame then return end
            if input.UserInputType ~= Enum.UserInputType.MouseButton1 and input.UserInputType ~= Enum.UserInputType.Touch then return end
            _fdn = false
            activeMobDrag = nil
            if _fdDragging then pcall(saveBtnPositions) end
            _fdDragging = false
            task.delay(0.08, function() _justDragged = false end)
        end)
        btn.Activated:Connect(function()
            if _justDragged then return end
            if def.key == "tpDown" then
                runTPFloor()
                flash()
                return
            end
            if def.key == "baseTP" then
                local moved = teleportToBase()
                if setStealStatusText then
                    setStealStatusText(moved and "BASE" or "ERROR")
                end
                flash()
                return
            end
            if def.key == "drop" then
                runDrop()
                flash()
                return
            end
            if def.key == "instaReset" then
                cursedInstaReset()
                flash()
                return
            end
            if def.key == "normalCarry" then
                setNormalCarry()
                return
            elseif def.key == "laggerNormal" then
                setLaggerNormal()
                return
            elseif def.key == "laggerCarry" then
                setLaggerCarry()
                return
            end
            if def.exclusive then
                local alreadyOn = (def.key == "autoPlay" and autoPlayEnabled) or (def.key == "autoBat" and autoBatEnabled) or (def.key == "aimbotV2" and aimbotV2Enabled) or (def.key == "tpBat" and _G.TamelessAntiDesyncAimbotOn)
                if alreadyOn then
                    if def.key == "autoPlay" then
                        autoPlayEnabled = false
                        if type(stopAutoPlay) == "function" then stopAutoPlay() end
                        setOn(false)
                    elseif def.key == "autoBat" then
                        stopBatAimbot()
                        if autoBatSetVisual then autoBatSetVisual(false) end
                        setOn(false)
                    elseif def.key == "aimbotV2" then
                        stopAimbotV2()
                        setOn(false)
                    elseif def.key == "tpBat" then
                        _G.TamelessStopAntiDesyncAimbot()
                        if batTP.setVisual then batTP.setVisual(false) end
                        setOn(false)
                    end
                    return
                end
                if autoPlayEnabled and def.key ~= "autoPlay" then
                    autoPlayEnabled = false
                    if type(stopAutoPlay) == "function" then stopAutoPlay() end
                    if mobBtnRefs.autoPlay then mobBtnRefs.autoPlay(false) end
                end
                if autoBatEnabled and def.key ~= "autoBat" then
                    stopBatAimbot()
                    if autoBatSetVisual then autoBatSetVisual(false) end
                    if mobBtnRefs.autoBat then mobBtnRefs.autoBat(false) end
                end
                if aimbotV2Enabled and def.key ~= "aimbotV2" then
                    stopAimbotV2()
                    if mobBtnRefs.aimbotV2 then mobBtnRefs.aimbotV2(false) end
                end
                if _G.TamelessAntiDesyncAimbotOn and def.key ~= "tpBat" then
                    _G.TamelessStopAntiDesyncAimbot()
                    if batTP.setVisual then batTP.setVisual(false) end
                    if mobBtnRefs.tpBat then mobBtnRefs.tpBat(false) end
                end
                if def.key == "autoPlay" then
                    autoPlayEnabled = true
                    if type(startAutoPlay) == "function" then startAutoPlay() end
                    setOn(true)
                elseif def.key == "autoBat" then
                    if _G._S2_AimMode == "bypass" or antiBatBypassEnabled then
                        startAimbotV2()
                    else
                        queueAutoBatStart()
                    end
                    if autoBatSetVisual then autoBatSetVisual(true) end
                    setOn(true)
                elseif def.key == "tpBat" then
                    _G.TamelessStartAntiDesyncAimbot()
                    if batTP.setVisual then batTP.setVisual(true) end
                    setOn(true)
                end
                return
            end
        end)
    end
    if mobBtnRefs.normalCarry then mobBtnRefs.normalCarry(carrySpeedActive and not laggerModeEnabled and not laggerCarryActive) end
    if mobBtnRefs.laggerNormal then mobBtnRefs.laggerNormal(laggerModeEnabled and not laggerCarryActive) end
    if mobBtnRefs.laggerCarry then mobBtnRefs.laggerCarry(laggerCarryActive) end
    if mobBtnRefs.autoPlay then mobBtnRefs.autoPlay(autoPlayEnabled) end
    if mobBtnRefs.autoBat then mobBtnRefs.autoBat(autoBatEnabled) end
    if mobBtnRefs.aimbotV2 then mobBtnRefs.aimbotV2(aimbotV2Enabled) end
    if mobBtnRefs.tpBat then mobBtnRefs.tpBat(_G.TamelessAntiDesyncAimbotOn) end
end

espBoxEnabled = false
espHighlightEnabled = false
espTracerEnabled = false
espSpeedEnabled = false
espRagdollCDEnabled = false
setEspBoxVisual, setEspHighlightVisual, setEspTracerVisual = nil, nil, nil
setEspSpeedVisual, setEspRagdollCDVisual = nil, nil
ESP_ACCENT = Color3.fromRGB(30, 144, 255)
ESP_RAGDOLL_CD = 4.5
PlayerESP = PlayerESP or { enabled = false, playerData = {}, conns = {} }
BoxedESPOptions = BoxedESPOptions or { box = false, tracer = false }
BoxedESPData = BoxedESPData or {}
BoxedESPConn = BoxedESPConn or nil
espRagLast = espRagLast or {}
espRagConns = espRagConns or {}

local function espTrackRagdoll(plr)
    if espRagConns[plr] then return end
    espRagConns[plr] = {}
    local function hook(char)
        local hum = char and (char:FindFirstChildOfClass("Humanoid") or char:WaitForChild("Humanoid", 5))
        if not hum then return end
        if espRagConns[plr] and espRagConns[plr].state then
            pcall(function() espRagConns[plr].state:Disconnect() end)
        end
        local was = isRagdollState(hum)
        espRagConns[plr].state = hum.StateChanged:Connect(function()
            local now = isRagdollState(hum)
            if was and not now then
                espRagLast[plr] = tick()
            end
            was = now
        end)
    end
    espRagConns[plr].added = plr.CharacterAdded:Connect(function(c) task.defer(hook, plr, c) end)
    if plr.Character then task.defer(hook, plr.Character) end
end

local function espUntrackRagdoll(plr)
    local t = espRagConns[plr]
    if t then
        for _, c in pairs(t) do
            pcall(function() c:Disconnect() end)
        end
        espRagConns[plr] = nil
    end
    espRagLast[plr] = nil
end

local function espRagText(plr, hum)
    if not espRagdollCDEnabled then return nil end
    if hum and isRagdollState(hum) then return "ragdoll" end
    local last = espRagLast[plr]
    local left = last and (ESP_RAGDOLL_CD - (tick() - last)) or 0
    if left > 0 then return string.format("cd %.1fs", left) end
    return "ready"
end

function startPlayerESP()
    if PlayerESP.enabled then return end
    PlayerESP.enabled = true
    local function cleanup(plr)
        local d = PlayerESP.playerData[plr]
        if not d then return end
        pcall(function()
            if d.highlight then d.highlight:Destroy() end
        end)
        pcall(function()
            if d.billboard then d.billboard:Destroy() end
        end)
        if d.conns then
            for _, c in ipairs(d.conns) do
                pcall(function() c:Disconnect() end)
            end
        end
        PlayerESP.playerData[plr] = nil
    end
    local function setup(plr, char)
        if not PlayerESP.enabled or plr == LP then return end
        cleanup(plr)
        local hrp = char and (char:FindFirstChild("HumanoidRootPart") or char:WaitForChild("HumanoidRootPart", 5))
        local head = char and (char:FindFirstChild("Head") or char:WaitForChild("Head", 5))
        if not hrp or not head then return end
        local hl = Instance.new("Highlight")
        hl.Name = "TamelessESP"
        hl.Adornee = char
        hl.FillColor = ESP_ACCENT
        hl.FillTransparency = 0.6
        hl.OutlineColor = Color3.fromRGB(245, 245, 245)
        hl.OutlineTransparency = 0
        hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
        hl.Enabled = espHighlightEnabled == true
        hl.Parent = char
        local bb = Instance.new("BillboardGui")
        bb.Name = "TamelessESPTag"
        bb.Adornee = head
        bb.Size = UDim2.new(0, 130, 0, 36)
        bb.StudsOffset = Vector3.new(0, 2.7, 0)
        bb.AlwaysOnTop = true
        bb.LightInfluence = 0
        bb.Parent = head
        local box = Instance.new("Frame", bb)
        box.Size = UDim2.new(1, 0, 1, 0)
        box.BackgroundTransparency = 1
        box.BorderSizePixel = 0
        local n = Instance.new("TextLabel", box)
        n.Size = UDim2.new(1, -10, 0, 17)
        n.Position = UDim2.new(0, 5, 0, 2)
        n.BackgroundTransparency = 1
        n.TextColor3 = Color3.fromRGB(255, 255, 255)
        n.Font = Enum.Font.GothamBlack
        n.TextSize = 15
        n.TextStrokeTransparency = 0.38
        n.Text = plr.Name
        local sub = Instance.new("TextLabel", box)
        sub.Size = UDim2.new(1, -10, 0, 12)
        sub.Position = UDim2.new(0, 5, 0, 19)
        sub.BackgroundTransparency = 1
        sub.TextColor3 = ESP_ACCENT
        sub.Font = Enum.Font.GothamBold
        sub.TextSize = 10
        sub.TextStrokeTransparency = 0.58
        sub.Text = ""
        local conn = RunService.Heartbeat:Connect(function()
            if not PlayerESP.enabled or not hrp.Parent then return end
            local d = PlayerESP.playerData[plr]
            if d and d.highlight then d.highlight.Enabled = espHighlightEnabled == true end
            local parts = {}
            if espSpeedEnabled then
                local v = hrp.AssemblyLinearVelocity or hrp.Velocity
                table.insert(parts, string.format("%d speed", math.floor(Vector3.new(v.X, 0, v.Z).Magnitude + 0.5)))
            end
            local rt = espRagText(plr, char:FindFirstChildOfClass("Humanoid"))
            if rt then table.insert(parts, rt) end
            sub.Text = table.concat(parts, " | ")
            local show = (#parts > 0) or espHighlightEnabled
            n.Visible = show
            sub.Visible = #parts > 0
        end)
        PlayerESP.playerData[plr] = { highlight = hl, billboard = bb, conns = { conn } }
    end
    PlayerESP.cleanup = cleanup
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= LP then
            if plr.Character then setup(plr, plr.Character) end
            table.insert(PlayerESP.conns, plr.CharacterAdded:Connect(function(c) task.defer(setup, plr, c) end))
        end
    end
    table.insert(PlayerESP.conns, Players.PlayerAdded:Connect(function(plr)
        if plr ~= LP then
            table.insert(PlayerESP.conns, plr.CharacterAdded:Connect(function(c) task.defer(setup, plr, c) end))
        end
    end))
    table.insert(PlayerESP.conns, Players.PlayerRemoving:Connect(function(plr)
        if PlayerESP.cleanup then PlayerESP.cleanup(plr) end
    end))
end

function stopPlayerESP()
    PlayerESP.enabled = false
    for _, c in ipairs(PlayerESP.conns or {}) do pcall(function() c:Disconnect() end) end
    PlayerESP.conns = {}
    for _, d in pairs(PlayerESP.playerData or {}) do
        pcall(function() if d.highlight then d.highlight:Destroy() end end)
        pcall(function() if d.billboard then d.billboard:Destroy() end end)
        if d.conns then for _, c in ipairs(d.conns) do pcall(function() c:Disconnect() end) end end
    end
    PlayerESP.playerData = {}
end

local function _safeDrawing(kind, props)
    if not Drawing or not Drawing.new then return nil end
    local ok, obj = pcall(function() return Drawing.new(kind) end)
    if not ok or not obj then return nil end
    for k, v in pairs(props or {}) do pcall(function() obj[k] = v end) end
    return obj
end

function _cleanupBoxedESPPlayer(player)
    local data = BoxedESPData[player]
    if not data then return end
    for _, obj in pairs(data) do
        pcall(function()
            obj.Visible = false
            if obj.Remove then obj:Remove() end
        end)
    end
    BoxedESPData[player] = nil
end

function _cleanupBoxedESP()
    for player, _ in pairs(BoxedESPData) do _cleanupBoxedESPPlayer(player) end
end

function _updateBoxedESP()
    local cam = workspace.CurrentCamera
    if not cam then return end
    local anyOn = BoxedESPOptions.box or BoxedESPOptions.tracer
    if not anyOn then _cleanupBoxedESP() return end
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LP then
            local char = player.Character
            local root = char and char:FindFirstChild("HumanoidRootPart")
            local head = char and char:FindFirstChild("Head")
            if not root or not head then
                _cleanupBoxedESPPlayer(player)
            else
                local rootPos, onScreen = cam:WorldToViewportPoint(root.Position)
                local headPos = cam:WorldToViewportPoint(head.Position + Vector3.new(0, 0.55, 0))
                local data = BoxedESPData[player]
                if not data then
                    data = {
                        box = _safeDrawing("Square", { Thickness = 2, Filled = false, Transparency = 1, Color = ESP_ACCENT }),
                        tracer = _safeDrawing("Line", { Thickness = 2, Transparency = 1, Color = ESP_ACCENT }),
                    }
                    BoxedESPData[player] = data
                end
                local height = math.abs(headPos.Y - rootPos.Y) * 2.15
                if height < 20 or height ~= height then height = 65 end
                local width = height / 2.15
                local view = cam.ViewportSize
                local centerX, centerY = view.X / 2, view.Y / 2
                local targetX, targetY = rootPos.X, rootPos.Y + height / 2
                local targetVisible = onScreen and rootPos.Z > 0
                if not targetVisible then
                    local dx = rootPos.X - centerX
                    local dy = rootPos.Y - centerY
                    if rootPos.Z <= 0 then dx = -dx dy = -dy end
                    if math.abs(dx) < 1 and math.abs(dy) < 1 then
                        local rel = cam.CFrame:PointToObjectSpace(root.Position)
                        dx = rel.X
                        dy = -rel.Y
                        if rootPos.Z <= 0 then dx = -dx dy = -dy end
                    end
                    local edgePad = 10
                    local scaleX = (dx ~= 0) and ((view.X / 2 - edgePad) / math.abs(dx)) or math.huge
                    local scaleY = (dy ~= 0) and ((view.Y / 2 - edgePad) / math.abs(dy)) or math.huge
                    local scale = math.min(scaleX, scaleY)
                    if scale == math.huge or scale ~= scale then scale = 1 end
                    targetX = math.clamp(centerX + dx * scale, edgePad, view.X - edgePad)
                    targetY = math.clamp(centerY + dy * scale, edgePad, view.Y - edgePad)
                end
                if data.box then
                    data.box.Color = ESP_ACCENT
                    data.box.Size = Vector2.new(width, height)
                    data.box.Position = Vector2.new(rootPos.X - width / 2, rootPos.Y - height / 2)
                    data.box.Visible = BoxedESPOptions.box == true and targetVisible
                end
                if data.tracer then
                    data.tracer.Color = ESP_ACCENT
                    local localChar = LP.Character
                    local localRoot = localChar and localChar:FindFirstChild("HumanoidRootPart")
                    local fromX, fromY
                    if localRoot then
                        local localScreen = cam:WorldToViewportPoint(localRoot.Position)
                        fromX = localScreen.X
                        fromY = localScreen.Y + 15
                    end
                    if not fromX or not fromY then
                        fromX = view.X / 2
                        fromY = view.Y - 88
                    end
                    data.tracer.From = Vector2.new(fromX, fromY)
                    data.tracer.To = Vector2.new(targetX, targetY)
                    data.tracer.Visible = BoxedESPOptions.tracer == true
                end
            end
        end
    end
end

function refreshBoxedESP()
    local anyOn = BoxedESPOptions.box or BoxedESPOptions.tracer
    if anyOn and not BoxedESPConn then
        BoxedESPConn = RunService.RenderStepped:Connect(_updateBoxedESP)
    elseif (not anyOn) and BoxedESPConn then
        BoxedESPConn:Disconnect()
        BoxedESPConn = nil
        _cleanupBoxedESP()
    end
end

Players.PlayerRemoving:Connect(function(plr) _cleanupBoxedESPPlayer(plr) espUntrackRagdoll(plr) end)
Players.PlayerAdded:Connect(function(plr) if espRagdollCDEnabled then espTrackRagdoll(plr) end end)

function espApply()
    BoxedESPOptions.box = espBoxEnabled == true
    BoxedESPOptions.tracer = espTracerEnabled == true
    refreshBoxedESP()
    if espRagdollCDEnabled then
        for _, plr in ipairs(Players:GetPlayers()) do if plr ~= LP then espTrackRagdoll(plr) end end
    else
        for plr, _ in pairs(espRagConns) do espUntrackRagdoll(plr) end
    end
    if espHighlightEnabled or espSpeedEnabled or espRagdollCDEnabled then
        startPlayerESP()
    else
        stopPlayerESP()
    end
end

local function enableDesync()
    if desyncEnabled then return end
    local char = LP.Character
    if not char then return end
    local root = char:FindFirstChild("HumanoidRootPart")
    local humanoid = char:FindFirstChildOfClass("Humanoid")
    if not root or not humanoid then return end
    desyncEnabled = true
    desyncFrozenCFrame = root.CFrame
    desyncCurrentAngle = math.atan2(-root.CFrame.LookVector.X, -root.CFrame.LookVector.Z)
    if desyncVisualizer then desyncVisualizer:Destroy() desyncVisualizer = nil end
    local part = Instance.new("Part")
    part.Name = "DesyncVisualizer"
    part.Size = Vector3.new(2, 5, 2)
    part.CFrame = root.CFrame
    part.Anchored = true
    part.CanCollide = false
    part.Material = Enum.Material.ForceField
    part.Color = Color3.fromRGB(255, 0, 0)
    part.Transparency = 0.5
    part.Parent = workspace
    desyncVisualizer = part
    root.Anchored = true
    desyncConn = RunService.RenderStepped:Connect(function(dt)
        if not desyncEnabled then return end
        local r = LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
        local h = LP.Character and LP.Character:FindFirstChildOfClass("Humanoid")
        if not r or not h then return end
        local md = h.MoveDirection
        local spd = h.WalkSpeed
        if md.Magnitude > 0.1 then
            local ta = math.atan2(-md.X, -md.Z)
            desyncCurrentAngle = desyncCurrentAngle + (ta - desyncCurrentAngle) * math.min(1, dt * 15)
            local np = r.Position + (md * spd * dt)
            r.CFrame = CFrame.new(np) * CFrame.Angles(0, desyncCurrentAngle, 0)
        end
        r.Anchored = true
        if desyncVisualizer and desyncFrozenCFrame then
            desyncVisualizer.CFrame = desyncFrozenCFrame
        end
    end)
end

local function disableDesync()
    if not desyncEnabled then return end
    desyncEnabled = false
    if desyncConn then desyncConn:Disconnect() desyncConn = nil end
    local root = LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
    if root then root.Anchored = false end
    if desyncVisualizer then desyncVisualizer:Destroy() desyncVisualizer = nil end
    desyncFrozenCFrame = nil
end

LP.CharacterAdded:Connect(function()
    task.wait(1)
    if desyncEnabled then
        desyncEnabled = false
        enableDesync()
    end
end)

local function buildGui()
    clearPersistentConns()
    pcall(createStealBar)
    local th = getTheme() or SNOW_THEME
    local BG, BG2, ROW_BG, ROW_BORDER = th.BG, th.BG2, th.ROW_BG, th.ROW_BORDER
    local WHITE, GRAY, INP = th.WHITE, th.GRAY, th.INP
    local PINK, PINK2, PINK3 = th.ACCENT, th.ACCENT2, th.ACCENT3
    local OFF, TAB_ACTIVE, TAB_INACT, SECT_LBL = th.OFF, th.ACCENT, th.GRAY, th.SECT
    pcall(function()
        if mainGuiRef then mainGuiRef:Destroy() end
    end)
    mainGuiRef = nil
    pcall(function() destroyOldGui("TamelessHub") end)
    pcall(function() destroyOldGui("SnowVSHub") end)
    pcall(function()
        local cg = game:GetService("CoreGui")
        local o = cg:FindFirstChild("SnowVSHub")
        if o then o:Destroy() end
        local pg = LP:FindFirstChild("PlayerGui")
        if pg then
            local o2 = pg:FindFirstChild("SnowVSHub")
            if o2 then o2:Destroy() end
        end
    end)
    local gui = Instance.new("ScreenGui")
    gui.Name = "SnowVSHub"
    gui.ResetOnSpawn = false
    gui.DisplayOrder = 10
    gui.IgnoreGuiInset = true
    parentGui(gui)
    mainGuiRef = gui
    local W, H = 520, 420
    local outer = Instance.new("Frame", gui)
    outer.Name = "OuterBorder"
    outer.Size = UDim2.new(0, W, 0, H)
    outer.AnchorPoint = Vector2.new(0.5, 0.5)
    local _savedGuiPos = loadGuiPositions()
    local _sp = _savedGuiPos["_hub"]
    local _hubRestored = false
    if _sp and tonumber(_sp.xo) ~= nil and tonumber(_sp.yo) ~= nil and tonumber(_sp.xs) ~= nil and tonumber(_sp.ys) ~= nil then
        local vpX = (workspace.CurrentCamera and workspace.CurrentCamera.ViewportSize.X) or 800
        local vpY = (workspace.CurrentCamera and workspace.CurrentCamera.ViewportSize.Y) or 600
        local ox = _sp.xs * vpX + (_sp.xo or 0)
        local oy = _sp.ys * vpY + (_sp.yo or 0)
        if ox >= 0 and ox <= vpX and oy >= 0 and oy <= vpY then
            outer.Position = UDim2.new(_sp.xs, 0, _sp.ys, 0)
            _hubRestored = true
        end
    end
    if not _hubRestored then outer.Position = UDim2.new(0.5, 0, 0.5, 0) end
    outer.BackgroundColor3 = Color3.fromRGB(10, 10, 18)
    outer.BackgroundTransparency = 0.15
    outer.BorderSizePixel = 0
    outer.ZIndex = 4
    outer.ClipsDescendants = true
    mainGuiScaleRef = Instance.new("UIScale", outer)
    mainGuiScaleRef.Scale = math.clamp(tonumber(guiScaleValue) or 1, 0.55, 1.1)
    Instance.new("UICorner", outer).CornerRadius = UDim.new(0, 18)
    local bg = Instance.new("ImageLabel", outer)
    bg.Name = "HubBG"
    bg.Image = "rbxassetid://108697485255882"
    bg.ScaleType = Enum.ScaleType.Crop
    bg.Size = UDim2.new(1, 0, 1, 0)
    bg.BackgroundTransparency = 1
    bg.ZIndex = 0
    bg.ImageTransparency = 0
    bg.Visible = true
    local texBg = Instance.new("ImageLabel", outer)
    texBg.Name = "HubTexture"
    texBg.Image = "rbxassetid://108693294702841"
    texBg.ScaleType = Enum.ScaleType.Tile
    texBg.ImageRectSize = Vector2.new(256, 256)
    texBg.Size = UDim2.new(1, 0, 1, 0)
    texBg.BackgroundTransparency = 1
    texBg.ZIndex = 1
    texBg.ImageTransparency = 0.3
    texBg.Visible = true
    mainFrame = Instance.new("Frame", outer)
    mainFrame.Name = "Main"
    mainFrame.Size = UDim2.new(1, 0, 1, 0)
    mainFrame.Position = UDim2.new(0, 0, 0, 0)
    mainFrame.BackgroundColor3 = Color3.fromRGB(10, 14, 24)
    mainFrame.BackgroundTransparency = 1
    mainFrame.BorderSizePixel = 0
    mainFrame.ClipsDescendants = true
    mainFrame.ZIndex = 5
    Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0, 18)
    local mfStroke = Instance.new("UIStroke", mainFrame)
    mfStroke.Color = th.ACCENT
    mfStroke.Thickness = 1
    mfStroke.Transparency = 0.5
    local function applyTransparencyToGui(transparent)
        if transparent then
            mainFrame.BackgroundTransparency = 0
            if bg then bg.ImageTransparency = 1 bg.Visible = false end
        else
            mainFrame.BackgroundTransparency = 1
            if bg then bg.ImageTransparency = 0 bg.Visible = true end
        end
    end
    local function dragHandle(handle)
        local dn, ds, sp, di = false
        handle.InputBegan:Connect(function(i)
            if uiLocked then return end
            if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
                dn = true
                ds = i.Position
                sp = (mainFrame.Parent and mainFrame.Parent.Name == "OuterBorder" and mainFrame.Parent or mainFrame).Position
                i.Changed:Connect(function()
                    if i.UserInputState == Enum.UserInputState.End then
                        dn = false
                        if outer and writefile then
                            local p = outer.Position
                            pcall(function() mergeGuiPosition("_hub", p.X.Scale, p.X.Offset, p.Y.Scale, p.Y.Offset) end)
                        end
                    end
                end)
            end
        end)
        handle.InputChanged:Connect(function(i)
            if i.UserInputType == Enum.UserInputType.MouseMovement or i.UserInputType == Enum.UserInputType.Touch then
                di = i
            end
        end)
        trackConn(UIS.InputChanged:Connect(function(i)
            if i == di and dn and not uiLocked then
                local target = (mainFrame.Parent and mainFrame.Parent.Name == "OuterBorder" and mainFrame.Parent) or mainFrame
                target.Position = UDim2.new(sp.X.Scale, sp.X.Offset + (i.Position.X - ds.X), sp.Y.Scale, sp.Y.Offset + (i.Position.Y - ds.Y))
            end
        end))
    end
    local headerH = 36
    local header = Instance.new("Frame", mainFrame)
    header.Size = UDim2.new(1, 0, 0, headerH)
    header.BackgroundColor3 = BG2
    header.BackgroundTransparency = 0.75
    header.BorderSizePixel = 0
    header.ZIndex = 6
    Instance.new("UICorner", header).CornerRadius = UDim.new(0, 18)
    local headerFix = Instance.new("Frame", mainFrame)
    headerFix.Size = UDim2.new(1, 0, 0, 12)
    headerFix.Position = UDim2.new(0, 0, 0, headerH - 10)
    headerFix.BackgroundColor3 = BG2
    headerFix.BackgroundTransparency = 0.7
    headerFix.BorderSizePixel = 0
    headerFix.ZIndex = 5
    local hDivider = Instance.new("Frame", mainFrame)
    hDivider.Size = UDim2.new(1, 0, 0, 1)
    hDivider.Position = UDim2.new(0, 0, 0, headerH)
    hDivider.BackgroundColor3 = PINK
    hDivider.BackgroundTransparency = 0.85
    hDivider.BorderSizePixel = 0
    hDivider.ZIndex = 7
    dragHandle(header)
    local titleLbl = Instance.new("TextLabel", header)
    titleLbl.Size = UDim2.new(1, -80, 1, 0)
    titleLbl.Position = UDim2.new(0, 12, 0, 0)
    titleLbl.BackgroundTransparency = 1
    titleLbl.Text = BRAND
    titleLbl.TextColor3 = PINK
    titleLbl.Font = Enum.Font.GothamBlack
    titleLbl.TextSize = 16
    titleLbl.TextXAlignment = Enum.TextXAlignment.Left
    titleLbl.ZIndex = 8
    local discSmall = Instance.new("TextLabel", header)
    discSmall.Size = UDim2.new(0, 270, 0, 12)
    discSmall.Position = UDim2.new(0, 12, 1, -14)
    discSmall.BackgroundTransparency = 1
    discSmall.Text = DISCORD_INLINE
    discSmall.TextColor3 = PINK
    discSmall.Font = Enum.Font.GothamBold
    discSmall.TextSize = 8
    discSmall.TextXAlignment = Enum.TextXAlignment.Left
    discSmall.ZIndex = 8
    local pingFpsLbl = Instance.new("TextLabel", header)
    pingFpsLbl.Size = UDim2.new(0, 100, 0, 14)
    pingFpsLbl.Position = UDim2.new(1, -136, 0, 6)
    pingFpsLbl.BackgroundTransparency = 1
    pingFpsLbl.Text = "-- ms - -- fps"
    pingFpsLbl.TextColor3 = GRAY
    pingFpsLbl.Font = Enum.Font.GothamBold
    pingFpsLbl.TextSize = 8
    pingFpsLbl.TextXAlignment = Enum.TextXAlignment.Right
    pingFpsLbl.ZIndex = 8
    task.spawn(function()
        local frames = 0
        local t0 = tick()
        while pingFpsLbl and pingFpsLbl.Parent do
            frames = frames + 1
            local now = tick()
            if now - t0 >= 0.5 then
                local fps = math.floor(frames / (now - t0) + 0.5)
                local ok, ms = pcall(function() return LP:GetNetworkPing() * 1000 end)
                pingFpsLbl.Text = (ok and math.floor(ms + 0.5) or "--") .. "ms - " .. fps .. "fps"
                frames = 0
                t0 = now
            end
            task.wait()
        end
    end)
    local closeBtn = Instance.new("TextButton", header)
    closeBtn.Size = UDim2.new(0, 26, 0, 26)
    closeBtn.Position = UDim2.new(1, -34, 0.5, -13)
    closeBtn.BackgroundColor3 = PINK3
    closeBtn.BorderSizePixel = 0
    closeBtn.Text = "−"
    closeBtn.TextColor3 = WHITE
    closeBtn.Font = Enum.Font.GothamBlack
    closeBtn.TextSize = 16
    closeBtn.ZIndex = 10
    Instance.new("UICorner", closeBtn).CornerRadius = UDim.new(0, 10)
    local miniBtn = Instance.new("TextButton", gui)
    local miniBtnSize = math.floor(mobileButtonsSize * 0.55)
    miniBtn.Size = UDim2.new(0, miniBtnSize, 0, miniBtnSize)
    miniBtn.Position = UDim2.new(0, 20, 0.5, -miniBtnSize / 2)
    miniBtn.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    miniBtn.BorderSizePixel = 0
    miniBtn.Text = "MENU"
    miniBtn.TextColor3 = PINK
    miniBtn.Font = Enum.Font.GothamBlack
    miniBtn.TextSize = math.max(7, math.floor(mobileButtonsSize * 0.10))
    miniBtn.ZIndex = 20
    miniBtn.Visible = false
    Instance.new("UICorner", miniBtn).CornerRadius = UDim.new(0, math.max(8, math.floor(miniBtnSize * 0.22)))
    local miniStroke = Instance.new("UIStroke", miniBtn)
    miniStroke.Color = PINK
    miniStroke.Thickness = 1
    miniStroke.Transparency = 0.7
    do
        local _savedMiniPos = _savedGuiPos["_mini"]
        if _savedMiniPos and tonumber(_savedMiniPos.xo) ~= nil and tonumber(_savedMiniPos.yo) ~= nil then
            local mvpX = (workspace.CurrentCamera and workspace.CurrentCamera.ViewportSize.X) or 800
            local mvpY = (workspace.CurrentCamera and workspace.CurrentCamera.ViewportSize.Y) or 600
            local mx = _savedMiniPos.xo + ((_savedMiniPos.xs or 0) * mvpX)
            local my = _savedMiniPos.yo + ((_savedMiniPos.ys or 0) * mvpY)
            if mx >= 0 and mx <= mvpX and my >= 0 and my <= mvpY then
                miniBtn.Position = UDim2.new(_savedMiniPos.xs or 0, _savedMiniPos.xo or 0, _savedMiniPos.ys or 0, _savedMiniPos.yo or 0)
            end
        end
        local mdn, mds, msp = false, nil, nil
        miniBtn.InputBegan:Connect(function(i)
            if uiLocked then return end
            if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
                mdn = true
                mds = i.Position
                msp = miniBtn.Position
                i.Changed:Connect(function()
                    if i.UserInputState == Enum.UserInputState.End then
                        mdn = false
                        if writefile then
                            local p = miniBtn.Position
                            pcall(function() mergeGuiPosition("_mini", p.X.Scale, p.X.Offset, p.Y.Scale, p.Y.Offset) end)
                        end
                    end
                end)
            end
        end)
        trackConn(UIS.InputChanged:Connect(function(i)
            if mdn and not uiLocked and (i.UserInputType == Enum.UserInputType.MouseMovement or i.UserInputType == Enum.UserInputType.Touch) then
                miniBtn.Position = UDim2.new(msp.X.Scale, msp.X.Offset + (i.Position.X - mds.X), msp.Y.Scale, msp.Y.Offset + (i.Position.Y - mds.Y))
            end
        end))
    end
    closeBtn.MouseButton1Click:Connect(function()
        mainFrame.Visible = false
        if outer then outer.Visible = false end
        miniBtn.Visible = true
    end)
    miniBtn.MouseButton1Click:Connect(function()
        if outer then outer.Visible = true end
        mainFrame.Visible = true
        miniBtn.Visible = false
    end)
    local tabBarH = 30
    local contentFrameY = headerH + tabBarH + 2
    local contentH = H - contentFrameY
    local tabBar = Instance.new("Frame", mainFrame)
    tabBar.Size = UDim2.new(1, -12, 0, tabBarH)
    tabBar.Position = UDim2.new(0, 6, 0, headerH + 2)
    tabBar.BackgroundTransparency = 1
    tabBar.ZIndex = 12
    local tabLay = Instance.new("UIListLayout", tabBar)
    tabLay.FillDirection = Enum.FillDirection.Horizontal
    tabLay.Padding = UDim.new(0, 4)
    tabLay.HorizontalAlignment = Enum.HorizontalAlignment.Left
    tabLay.VerticalAlignment = Enum.VerticalAlignment.Center
    local tabNames = { "Speed", "Combat", "Auto", "Steal Mode", "Visual", "Keybind", "Settings" }
    local tabPages = {}
    local tabButtons = {}
    local activeTabName = "Speed"
    local function makePage(name)
        local sf = Instance.new("ScrollingFrame", mainFrame)
        sf.Name = name .. "Page"
        sf.Size = UDim2.new(1, 0, 0, contentH)
        sf.Position = UDim2.new(0, 0, 0, contentFrameY)
        sf.BackgroundTransparency = 1
        sf.BorderSizePixel = 0
        sf.ScrollBarThickness = 2
        sf.ScrollBarImageColor3 = PINK
        sf.CanvasSize = UDim2.new(0, 0, 0, 0)
        sf.AutomaticCanvasSize = Enum.AutomaticSize.Y
        sf.ScrollingDirection = Enum.ScrollingDirection.Y
        sf.Visible = (name == "Speed")
        sf.ZIndex = 10
        sf.Active = true
        local ll = Instance.new("UIListLayout", sf)
        ll.SortOrder = Enum.SortOrder.LayoutOrder
        ll.Padding = UDim.new(0, 2)
        local pd = Instance.new("UIPadding", sf)
        pd.PaddingLeft = UDim.new(0, 10)
        pd.PaddingRight = UDim.new(0, 10)
        pd.PaddingTop = UDim.new(0, 6)
        pd.PaddingBottom = UDim.new(0, 8)
        return sf
    end
    for _, name in ipairs(tabNames) do tabPages[name] = makePage(name) end
    tabPages["Speed Config"] = tabPages["Speed"]
    tabPages["Steal"] = tabPages["Steal Mode"]
    tabPages["Visuals"] = tabPages["Visual"]
    local function switchTab(name)
        activeTabName = name
        _G._TamelessActiveTab = name
        local showPage = tabPages[name]
        local unique = {}
        for _, tn in ipairs(tabNames) do
            local pg = tabPages[tn]
            if pg then unique[pg] = (pg == showPage) end
        end
        for pg, show in pairs(unique) do pg.Visible = show end
        for n, btn in pairs(tabButtons) do
            local on = (n == name)
            btn.BackgroundColor3 = on and PINK or Color3.fromRGB(20, 26, 40)
            btn.BackgroundTransparency = on and 0.05 or 0.25
            btn.TextColor3 = on and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(160, 190, 230)
            local st = btn:FindFirstChildOfClass("UIStroke")
            if st then st.Transparency = on and 0.3 or 0.7 end
        end
    end
    for i, name in ipairs(tabNames) do
        local b = Instance.new("TextButton", tabBar)
        b.Size = UDim2.new(0, 54, 0, 26)
        b.BackgroundColor3 = (name == "Speed") and PINK or Color3.fromRGB(20, 26, 40)
        b.BackgroundTransparency = (name == "Speed") and 0.05 or 0.25
        b.BorderSizePixel = 0
        b.Text = name:upper()
        b.TextColor3 = (name == "Speed") and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(160, 190, 230)
        b.Font = Enum.Font.GothamBold
        b.TextSize = 10
        b.AutoButtonColor = false
        b.ZIndex = 13
        Instance.new("UICorner", b).CornerRadius = UDim.new(0, 10)
        local bst = Instance.new("UIStroke", b)
        bst.Color = PINK
        bst.Thickness = 1
        bst.Transparency = (name == "Speed") and 0.3 or 0.7
        b.MouseButton1Click:Connect(function() switchTab(name) end)
        tabButtons[name] = b
    end
    _G._TamelessSwitchTab = switchTab
    if _G._TamelessActiveTab and tabPages[_G._TamelessActiveTab] then switchTab(_G._TamelessActiveTab) end
    local contentFrame = tabPages["Speed"]
    do
        local thank = Instance.new("Frame", contentFrame)
        thank.Name = "ThankCard"
        thank.Size = UDim2.new(1, 0, 0, 36)
        thank.BackgroundColor3 = ROW_BG
        thank.BackgroundTransparency = 0.2
        thank.BorderSizePixel = 0
        thank.LayoutOrder = 0
        thank.ZIndex = 8
        Instance.new("UICorner", thank).CornerRadius = UDim.new(0, 8)
        local ts = Instance.new("UIStroke", thank)
        ts.Color = PINK
        ts.Thickness = 1
        ts.Transparency = 0.65
        local av = Instance.new("ImageLabel", thank)
        av.Size = UDim2.new(0, 26, 0, 26)
        av.Position = UDim2.new(1, -32, 0.5, -13)
        av.BackgroundColor3 = BG2
        av.BorderSizePixel = 0
        av.ScaleType = Enum.ScaleType.Crop
        av.ZIndex = 9
        Instance.new("UICorner", av).CornerRadius = UDim.new(1, 0)
        pcall(function() av.Image = Players:GetUserThumbnailAsync(LP.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size48x48) end)
        local lbl = Instance.new("TextLabel", thank)
        lbl.Size = UDim2.new(1, -44, 1, 0)
        lbl.Position = UDim2.new(0, 10, 0, 0)
        lbl.BackgroundTransparency = 1
        lbl.Text = BRAND .. " AUDIT"
        lbl.TextColor3 = PINK
        lbl.Font = Enum.Font.GothamBold
        lbl.TextSize = 11
        lbl.TextXAlignment = Enum.TextXAlignment.Left
        lbl.ZIndex = 9
    end
    local function mkSectionLbl(parent, txt)
        local spacer = Instance.new("Frame", parent)
        spacer.Size = UDim2.new(1, 0, 0, 3)
        spacer.BackgroundTransparency = 1
        spacer.LayoutOrder = #parent:GetChildren()
        local row = Instance.new("Frame", parent)
        row.Size = UDim2.new(1, 0, 0, 14)
        row.BackgroundTransparency = 1
        row.LayoutOrder = #parent:GetChildren()
        local l = Instance.new("TextLabel", row)
        l.Size = UDim2.new(1, 0, 1, 0)
        l.BackgroundTransparency = 1
        l.Text = txt:upper()
        l.TextColor3 = SECT_LBL
        l.Font = Enum.Font.GothamBold
        l.TextSize = 9
        l.TextXAlignment = Enum.TextXAlignment.Left
        l.ZIndex = 9
        local div = Instance.new("Frame", parent)
        div.Size = UDim2.new(1, 0, 0, 1)
        div.BackgroundColor3 = ROW_BORDER
        div.BackgroundTransparency = 0.4
        div.BorderSizePixel = 0
        div.LayoutOrder = #parent:GetChildren()
        local sp2 = Instance.new("Frame", parent)
        sp2.Size = UDim2.new(1, 0, 0, 2)
        sp2.BackgroundTransparency = 1
        sp2.LayoutOrder = #parent:GetChildren()
    end
    local IS_PC = (UIS.MouseEnabled and not UIS.TouchEnabled)
    local function addHoverFX(frame, stroke)
        if not IS_PC or not frame then return end
        local scale = frame:FindFirstChildOfClass("UIScale") or Instance.new("UIScale", frame)
        scale.Scale = 1
        local baseStrokeT = stroke and stroke.Transparency or 0.6
        local baseStrokeC = stroke and stroke.Color or ROW_BORDER
        local ti = TweenInfo.new(0.18, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
        frame.MouseEnter:Connect(function()
            TweenService:Create(scale, TweenInfo.new(0.18, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Scale = 1.03 }):Play()
            if stroke then
                TweenService:Create(stroke, ti, { Transparency = 0.05, Color = PINK, Thickness = 1.5 }):Play()
            end
        end)
        frame.MouseLeave:Connect(function()
            TweenService:Create(scale, ti, { Scale = 1 }):Play()
            if stroke then
                TweenService:Create(stroke, ti, { Transparency = baseStrokeT, Color = baseStrokeC, Thickness = 1 }):Play()
            end
        end)
    end
    local function addHoverPop(guiObj, pop)
        if not IS_PC or not guiObj then return end
        local scale = guiObj:FindFirstChildOfClass("UIScale") or Instance.new("UIScale", guiObj)
        scale.Scale = 1
        guiObj.MouseEnter:Connect(function()
            TweenService:Create(scale, TweenInfo.new(0.16, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Scale = pop or 1.12 }):Play()
        end)
        guiObj.MouseLeave:Connect(function()
            TweenService:Create(scale, TweenInfo.new(0.16, Enum.EasingStyle.Quad), { Scale = 1 }):Play()
        end)
    end
    local function addClickFX(button, visual)
        if not button then return end
        local target = visual or button
        local scale = target:FindFirstChildOfClass("UIScale") or Instance.new("UIScale", target)
        local base = scale.Scale
        local function down()
            TweenService:Create(scale, TweenInfo.new(0.08, Enum.EasingStyle.Quad), { Scale = base * 0.88 }):Play()
        end
        local function up()
            TweenService:Create(scale, TweenInfo.new(0.22, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Scale = base }):Play()
        end
        button.MouseButton1Down:Connect(down)
        button.MouseButton1Up:Connect(up)
        button.MouseLeave:Connect(up)
        button.Activated:Connect(function()
            local ring = Instance.new("Frame", target)
            ring.AnchorPoint = Vector2.new(0.5, 0.5)
            ring.Position = UDim2.new(0.5, 0, 0.5, 0)
            ring.Size = UDim2.new(1, 0, 1, 0)
            ring.BackgroundTransparency = 1
            ring.ZIndex = 20
            Instance.new("UICorner", ring).CornerRadius = UDim.new(1, 0)
            local st = Instance.new("UIStroke", ring)
            st.Color = PINK
            st.Thickness = 2
            st.Transparency = 0.15
            TweenService:Create(ring, TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Size = UDim2.new(1.9, 0, 1.9, 0) }):Play()
            TweenService:Create(st, TweenInfo.new(0.35), { Transparency = 1, Thickness = 0.5 }):Play()
            task.delay(0.4, function() pcall(function() ring:Destroy() end) end)
        end)
    end
    local function mkRow(parent, h)
        h = h or 36
        local f = Instance.new("Frame", parent)
        f.Size = UDim2.new(1, 0, 0, h)
        f.BackgroundColor3 = ROW_BG
        f.BorderSizePixel = 0
        f.ZIndex = 8
        f.LayoutOrder = #parent:GetChildren()
        local stroke = Instance.new("UIStroke", f)
        stroke.Color = ROW_BORDER
        stroke.Thickness = 1
        stroke.Transparency = 0.6
        Instance.new("UICorner", f).CornerRadius = UDim.new(0, 10)
        addHoverFX(f, stroke)
        local spacer = Instance.new("Frame", parent)
        spacer.Size = UDim2.new(1, 0, 0, 1)
        spacer.BackgroundTransparency = 1
        spacer.LayoutOrder = #parent:GetChildren() + 1
        return f
    end
    local function mkLabel(row, txt)
        local l = Instance.new("TextLabel", row)
        l.Size = UDim2.new(0.6, 0, 1, 0)
        l.Position = UDim2.new(0, 10, 0, 0)
        l.BackgroundTransparency = 1
        l.Text = txt
        l.TextColor3 = WHITE
        l.Font = Enum.Font.GothamBold
        l.TextSize = 10
        l.TextXAlignment = Enum.TextXAlignment.Left
        l.ZIndex = 9
        return l
    end
    local function mkPill(row)
        local pill = Instance.new("Frame", row)
        pill.Size = UDim2.new(0, 30, 0, 16)
        pill.Position = UDim2.new(1, -40, 0.5, -8)
        pill.BackgroundColor3 = OFF
        pill.BorderSizePixel = 0
        pill.ZIndex = 9
        Instance.new("UICorner", pill).CornerRadius = UDim.new(1, 0)
        local dot = Instance.new("Frame", pill)
        dot.Size = UDim2.new(0, 10, 0, 10)
        dot.Position = UDim2.new(0, 3, 0.5, -5)
        dot.BackgroundColor3 = GRAY
        dot.BorderSizePixel = 0
        dot.ZIndex = 10
        Instance.new("UICorner", dot).CornerRadius = UDim.new(1, 0)
        addHoverPop(pill, 1.15)
        return pill, dot
    end
    local function animPill(pill, dot, on)
        TweenService:Create(pill, TweenInfo.new(0.15, Enum.EasingStyle.Quad), { BackgroundColor3 = on and PINK2 or OFF }):Play()
        TweenService:Create(dot, TweenInfo.new(0.15, Enum.EasingStyle.Back), { Position = on and UDim2.new(1, -13, 0.5, -5) or UDim2.new(0, 3, 0.5, -5), BackgroundColor3 = on and WHITE or GRAY }):Play()
    end
    local function mkToggle(parent, txt, cb)
        local row = mkRow(parent, 36)
        mkLabel(row, txt)
        local pill, dot = mkPill(row)
        local on = false
        local function sv(state)
            on = state
            animPill(pill, dot, state)
        end
        local clk = Instance.new("TextButton", pill)
        clk.Size = UDim2.new(1, 0, 1, 0)
        clk.BackgroundTransparency = 1
        clk.Text = ""
        clk.ZIndex = 11
        addClickFX(clk, pill)
        clk.Activated:Connect(function()
            on = not on
            sv(on)
            if cb then
                local ok, err = pcall(cb, on)
                if not ok then warn("[Snow.VS] toggle error (" .. tostring(txt) .. "): ", err) end
            end
        end)
        return sv
    end
    local function mkBoxRow(parent, txt, default, cb, minVal, maxVal, step)
        minVal = minVal or 1
        maxVal = maxVal or 500
        step = step or 1
        local row = mkRow(parent, 38)
        mkLabel(row, txt)
        local container = Instance.new("Frame", row)
        container.Size = UDim2.new(0, 150, 0, 28)
        container.Position = UDim2.new(1, -158, 0.5, -14)
        container.BackgroundTransparency = 1
        container.ZIndex = 9
        local tb = Instance.new("TextBox", container)
        tb.Size = UDim2.new(0, 50, 1, 0)
        tb.Position = UDim2.new(0, 0, 0, 0)
        tb.BackgroundColor3 = INP
        tb.BorderSizePixel = 0
        tb.Text = tostring(default)
        tb.TextColor3 = PINK
        tb.Font = Enum.Font.GothamBold
        tb.TextSize = 14
        tb.ClearTextOnFocus = false
        tb.ZIndex = 9
        Instance.new("UICorner", tb).CornerRadius = UDim.new(0, 5)
        addHoverPop(tb, 1.08)
        local minusBtn = Instance.new("TextButton", container)
        minusBtn.Size = UDim2.new(0, 34, 1, 0)
        minusBtn.Position = UDim2.new(0, 54, 0, 0)
        minusBtn.BackgroundColor3 = PINK3
        minusBtn.BorderSizePixel = 0
        minusBtn.Text = "−"
        minusBtn.TextColor3 = WHITE
        minusBtn.Font = Enum.Font.GothamBlack
        minusBtn.TextSize = 18
        minusBtn.ZIndex = 10
        Instance.new("UICorner", minusBtn).CornerRadius = UDim.new(0, 5)
        addClickFX(minusBtn)
        local plusBtn = Instance.new("TextButton", container)
        plusBtn.Size = UDim2.new(0, 34, 1, 0)
        plusBtn.Position = UDim2.new(0, 92, 0, 0)
        plusBtn.BackgroundColor3 = PINK3
        plusBtn.BorderSizePixel = 0
        plusBtn.Text = "+"
        plusBtn.TextColor3 = WHITE
        plusBtn.Font = Enum.Font.GothamBlack
        plusBtn.TextSize = 18
        plusBtn.ZIndex = 10
        Instance.new("UICorner", plusBtn).CornerRadius = UDim.new(0, 5)
        addClickFX(plusBtn)
        local currentVal = default
        local function updateValue(newVal)
            newVal = math.floor(math.clamp(newVal, minVal, maxVal))
            currentVal = newVal
            tb.Text = tostring(newVal)
            if cb then cb(newVal) end
        end
        minusBtn.Activated:Connect(function() updateValue(currentVal - step) end)
        plusBtn.Activated:Connect(function() updateValue(currentVal + step) end)
        tb.FocusLost:Connect(function()
            local n = tonumber(tb.Text)
            if n then updateValue(n) else tb.Text = tostring(currentVal) end
        end)
        tb.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.Touch then tb:CaptureFocus() end
        end)
        return tb
    end
    local function isGamepadInput(inp)
        return inp and inp.UserInputType and inp.UserInputType.Name:match("^Gamepad") ~= nil
    end
    local function isBindableInput(inp)
        if not inp or inp.KeyCode == Enum.KeyCode.Unknown then return false end
        if inp.UserInputType == Enum.UserInputType.Keyboard then return true end
        return isGamepadInput(inp)
    end
    local function kbMatch(entry, kc)
        return kc and (kc == entry.kb or (entry.gp and kc == entry.gp))
    end
    local function mkKBButton(row, kbEntry, bindType, cb)
        local function getLabel()
            local k = kbEntry[bindType]
            return k and k.Name or "..."
        end
        local btn = Instance.new("TextButton", row)
        btn.Size = UDim2.new(0, 66, 0, 22)
        btn.Position = UDim2.new(1, -74, 0.5, -11)
        btn.BackgroundColor3 = INP
        btn.BorderSizePixel = 0
        btn.Text = getLabel()
        btn.TextColor3 = PINK
        btn.Font = Enum.Font.GothamBold
        btn.TextSize = 10
        btn.AutoButtonColor = false
        btn.ZIndex = 9
        Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 5)
        addHoverPop(btn, 1.08)
        addClickFX(btn)
        local li = false
        local lc
        local pv = btn.Text
        local ls = 0
        btn.Activated:Connect(function()
            if li then
                li = false
                _anyKeyListening = false
                if lc then lc:Disconnect() lc = nil end
                btn.Text = pv
                btn.TextColor3 = PINK
                return
            end
            pv = btn.Text
            li = true
            _anyKeyListening = true
            ls = tick()
            btn.Text = "..."
            btn.TextColor3 = WHITE
            lc = UIS.InputBegan:Connect(function(inp)
                if not li then return end
                if inp.KeyCode == Enum.KeyCode.Escape then
                    li = false
                    _anyKeyListening = false
                    if lc then lc:Disconnect() lc = nil end
                    btn.Text = pv
                    btn.TextColor3 = PINK
                    return
                end
                local isGp = isGamepadInput(inp)
                if isGp and not (tick() - ls >= 0.15) then return end
                if not isBindableInput(inp) then return end
                if (bindType == "gp" and not isGp) or (bindType == "kb" and isGp) then return end
                btn.Text = inp.KeyCode.Name
                pv = inp.KeyCode.Name
                li = false
                _anyKeyListening = false
                if lc then lc:Disconnect() lc = nil end
                btn.TextColor3 = PINK
                kbEntry[bindType] = inp.KeyCode
                if cb then cb(inp.KeyCode, isGp) end
            end)
        end)
        return btn
    end
    local function mkToggleKB(parent, txt, kbEntry, bindType, onToggle, onKB)
        local row = mkRow(parent, 36)
        mkLabel(row, txt)
        mkKBButton(row, kbEntry, bindType or "kb", function(k, isGp)
            if onKB then onKB(k, isGp) end
        end)
        local pill = Instance.new("Frame", row)
        pill.Size = UDim2.new(0, 30, 0, 16)
        pill.Position = UDim2.new(1, -40, 0.5, -8)
        pill:Destroy()
        local pill2 = Instance.new("Frame", row)
        pill2.Size = UDim2.new(0, 34, 0, 18)
        pill2.Position = UDim2.new(1, -44, 0.5, -9)
        pill2.BackgroundColor3 = OFF
        pill2.BorderSizePixel = 0
        pill2.ZIndex = 9
        Instance.new("UICorner", pill2).CornerRadius = UDim.new(1, 0)
        local dot2 = Instance.new("Frame", pill2)
        dot2.Size = UDim2.new(0, 12, 0, 12)
        dot2.Position = UDim2.new(0, 3, 0.5, -6)
        dot2.BackgroundColor3 = GRAY
        dot2.BorderSizePixel = 0
        dot2.ZIndex = 10
        Instance.new("UICorner", dot2).CornerRadius = UDim.new(1, 0)
        addHoverPop(pill2, 1.15)
        local kbb = row:FindFirstChildOfClass("TextButton")
        if kbb then kbb.Position = UDim2.new(1, -122, 0.5, -11) kbb.Size = UDim2.new(0, 70, 0, 22) end
        local on = false
        local function sv(s)
            on = s
            animPill(pill2, dot2, s)
        end
        local clk = Instance.new("TextButton", pill2)
        clk.Size = UDim2.new(1, 0, 1, 0)
        clk.BackgroundTransparency = 1
        clk.Text = ""
        clk.ZIndex = 11
        addClickFX(clk, pill2)
        clk.Activated:Connect(function()
            if _anyKeyListening then return end
            on = not on
            sv(on)
            if onToggle then onToggle(on) end
        end)
        return sv
    end
    local function mkKBRow(parent, txt, kbEntry, bindType, onKB)
        local row = mkRow(parent, 36)
        mkLabel(row, txt)
        mkKBButton(row, kbEntry, bindType or "kb", function(k, isGp)
            if onKB then onKB(k, isGp) end
        end)
        return row
    end
    local function mkActionRow(parent, txt, onActivate)
        local row = mkRow(parent, 36)
        mkLabel(row, txt)
        local btn = Instance.new("TextButton", row)
        btn.Size = UDim2.new(0, 50, 0, 22)
        btn.Position = UDim2.new(1, -58, 0.5, -11)
        btn.BackgroundColor3 = PINK3
        btn.BorderSizePixel = 0
        btn.Text = "▶"
        btn.TextColor3 = WHITE
        btn.Font = Enum.Font.GothamBlack
        btn.TextSize = 11
        btn.AutoButtonColor = false
        btn.ZIndex = 9
        Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 5)
        addHoverPop(btn, 1.1)
        addClickFX(btn)
        btn.Activated:Connect(function()
            TweenService:Create(btn, TweenInfo.new(0.06), { BackgroundColor3 = Color3.fromRGB(90, 160, 255) }):Play()
            task.delay(0.12, function()
                TweenService:Create(btn, TweenInfo.new(0.1), { BackgroundColor3 = PINK3 }):Play()
            end)
            if onActivate then onActivate() end
        end)
        return row, btn
    end
    local pg = tabPages["Speed"]
    mkSectionLbl(pg, "Speed Configuration")
    mkSectionLbl(pg, "Normal Mode")
    normalBox = mkBoxRow(pg, "Normal Speed", NS, function(v)
        if v > 0 and v <= 500 then NS = v end
        saveConfig()
    end, 1, 500, 1)
    carryBox = mkBoxRow(pg, "Carry Speed", CS, function(v)
        if v > 0 and v <= 500 then CS = v end
        saveConfig()
    end, 1, 500, 1)
    mkSectionLbl(pg, "Lagger Mode")
    laggerBox = mkBoxRow(pg, "Lagger Speed", LAGGER_SPEED, function(v)
        if v > 0 and v <= 500 then LAGGER_SPEED = v end
        saveConfig()
    end, 1, 500, 1)
    laggerCarryBox = mkBoxRow(pg, "Lagger Carry Speed", LAGGER_CARRY_SPEED, function(v)
        if v > 0 and v <= 500 then LAGGER_CARRY_SPEED = v end
        saveConfig()
    end, 1, 500, 1)
    mkSectionLbl(pg, "Speed Modes")
    setCarryModeVisual = mkToggle(pg, "Carry Mode", function(on)
        if on then setNormalCarry() else setNormalSpeed() end
    end)
    setLaggerModeVisual = mkToggle(pg, "Lagger Mode", function(on)
        if on then setLaggerNormal() else setNormalSpeed() end
    end)
    pg = tabPages["Combat"]
    mkSectionLbl(pg, "Combat")
    setAntiRagVisual = mkToggle(pg, "Anti Ragdoll", function(on)
        antiRagdollEnabled = on
        if on then startAntiRagdoll() else stopAntiRagdoll() end
        saveConfig()
    end)
    setMedusaVisual = mkToggle(pg, "Medusa Counter", function(on)
        medusaCounterEnabled = on
        if on then setupMedusa(LP.Character) else stopMedusaCounter() end
        saveConfig()
    end)
    setUnwalkVisual = mkToggle(pg, "Unwalk", function(on)
        unwalkEnabled = on
        if on then startUnwalk() else stopUnwalk() end
        saveConfig()
    end)
    mkSectionLbl(pg, "Bat System")
    do
        if _G._TamelessAimMode == nil then _G._TamelessAimMode = "normal" end
        if _G._TamelessAimDist == nil then _G._TamelessAimDist = 12 end
        if _G._TamelessAimSpeed == nil then _G._TamelessAimSpeed = 50 end
        local modeRow = mkRow(pg, 36)
        mkLabel(modeRow, "Aim Mode")
        local nBtn = Instance.new("TextButton", modeRow)
        nBtn.Size = UDim2.new(0, 52, 0, 22)
        nBtn.Position = UDim2.new(1, -110, 0.5, -11)
        nBtn.BackgroundColor3 = (_G._TamelessAimMode == "normal") and PINK or OFF
        nBtn.BorderSizePixel = 0
        nBtn.Text = "Normal"
        nBtn.TextColor3 = WHITE
        nBtn.Font = Enum.Font.GothamBold
        nBtn.TextSize = 9
        nBtn.AutoButtonColor = false
        nBtn.ZIndex = 12
        Instance.new("UICorner", nBtn).CornerRadius = UDim.new(0, 6)
        local bBtn = Instance.new("TextButton", modeRow)
        bBtn.Size = UDim2.new(0, 52, 0, 22)
        bBtn.Position = UDim2.new(1, -54, 0.5, -11)
        bBtn.BackgroundColor3 = (_G._TamelessAimMode == "bypass") and PINK or OFF
        bBtn.BorderSizePixel = 0
        bBtn.Text = "Bypass"
        bBtn.TextColor3 = WHITE
        bBtn.Font = Enum.Font.GothamBold
        bBtn.TextSize = 9
        bBtn.AutoButtonColor = false
        bBtn.ZIndex = 12
        Instance.new("UICorner", bBtn).CornerRadius = UDim.new(0, 6)
        nBtn.Activated:Connect(function()
            _G._TamelessAimMode = "normal"
            nBtn.BackgroundColor3 = PINK
            bBtn.BackgroundColor3 = OFF
            antiBatBypassEnabled = false
            saveConfig()
        end)
        bBtn.Activated:Connect(function()
            _G._TamelessAimMode = "bypass"
            bBtn.BackgroundColor3 = PINK
            nBtn.BackgroundColor3 = OFF
            antiBatBypassEnabled = true
            saveConfig()
        end)
    end
    do
        local row = mkRow(pg, 36)
        mkLabel(row, "Aimbot Speed")
        local box = Instance.new("TextBox", row)
        box.Size = UDim2.new(0, 58, 0, 22)
        box.Position = UDim2.new(1, -66, 0.5, -11)
        box.BackgroundColor3 = INP
        box.BorderSizePixel = 0
        box.Text = tostring(_G._TamelessAimSpeed or 50)
        box.TextColor3 = PINK
        box.Font = Enum.Font.GothamBold
        box.TextSize = 11
        box.ClearTextOnFocus = false
        box.ZIndex = 11
        Instance.new("UICorner", box).CornerRadius = UDim.new(0, 5)
        box.FocusLost:Connect(function()
            local n = tonumber(box.Text)
            if n and n > 0 and n <= 500 then
                _G._TamelessAimSpeed = n
                saveConfig()
            else
                box.Text = tostring(_G._TamelessAimSpeed or 50)
            end
        end)
    end
    do
        local row = mkRow(pg, 36)
        mkLabel(row, "Hit Distance")
        local box = Instance.new("TextBox", row)
        box.Size = UDim2.new(0, 58, 0, 22)
        box.Position = UDim2.new(1, -66, 0.5, -11)
        box.BackgroundColor3 = INP
        box.BorderSizePixel = 0
        box.Text = tostring(_G._TamelessAimDist or 12)
        box.TextColor3 = PINK
        box.Font = Enum.Font.GothamBold
        box.TextSize = 11
        box.ClearTextOnFocus = false
        box.ZIndex = 11
        Instance.new("UICorner", box).CornerRadius = UDim.new(0, 5)
        box.FocusLost:Connect(function()
            local n = tonumber(box.Text)
            if n and n >= 1 and n <= 50 then
                _G._TamelessAimDist = n
                saveConfig()
            else
                box.Text = tostring(_G._TamelessAimDist or 12)
            end
        end)
    end
    autoBatSetVisual = mkToggle(pg, "Aimbot", function(on)
        if on then
            if _G.TamelessAntiDesyncAimbotOn then
                _G.TamelessStopAntiDesyncAimbot()
                if batTP.setVisual then batTP.setVisual(false) end
                if mobBtnRefs.tpBat then mobBtnRefs.tpBat(false) end
            end
            if aimbotV2Enabled then stopAimbotV2() end
            if _G._TamelessAimMode == "bypass" or antiBatBypassEnabled then
                antiBatBypassEnabled = true
                startAimbotV2()
            else
                antiBatBypassEnabled = false
                queueAutoBatStart()
            end
        else
            stopBatAimbot()
            stopAimbotV2()
        end
        saveConfig()
    end)
    tpBatSetVisual = mkToggle(pg, "TP Bat", function(on)
        if on then
            if autoBatEnabled then
                stopBatAimbot()
                if autoBatSetVisual then autoBatSetVisual(false) end
                if mobBtnRefs.autoBat then mobBtnRefs.autoBat(false) end
            end
            if aimbotV2Enabled then
                stopAimbotV2()
                if mobBtnRefs.aimbotV2 then mobBtnRefs.aimbotV2(false) end
            end
            if autoPlayEnabled then
                stopAutoPlay()
                if autoPlaySetVisual then autoPlaySetVisual(false) end
                if mobBtnRefs.autoPlay then mobBtnRefs.autoPlay(false) end
            end
            _G.TamelessStartAntiDesyncAimbot()
        else
            _G.TamelessStopAntiDesyncAimbot()
        end
        saveConfig()
    end)
    batTP.setVisual = tpBatSetVisual
    setBatCounterVisual = mkToggle(pg, "Bat Counter", function(on)
        batCounterEnabled = on
        if on then startBatCounter() else stopBatCounter() end
        saveConfig()
    end)
    do
        local row = mkRow(pg, 36)
        mkLabel(row, "Anti Kick")
        local pill = Instance.new("Frame", row)
        pill.Size = UDim2.new(0, 30, 0, 16)
        pill.Position = UDim2.new(1, -40, 0.5, -8)
        pill.BackgroundColor3 = OFF
        pill.BorderSizePixel = 0
        pill.ZIndex = 9
        Instance.new("UICorner", pill).CornerRadius = UDim.new(1, 0)
        local dot = Instance.new("Frame", pill)
        dot.Size = UDim2.new(0, 10, 0, 10)
        dot.Position = UDim2.new(0, 3, 0.5, -5)
        dot.BackgroundColor3 = GRAY
        dot.BorderSizePixel = 0
        dot.ZIndex = 10
        Instance.new("UICorner", dot).CornerRadius = UDim.new(1, 0)
        local on = false
        local function sv(s)
            on = s
            animPill(pill, dot, s)
        end
        antiKickSetVisual = sv
        local clk = Instance.new("TextButton", pill)
        clk.Size = UDim2.new(1, 0, 1, 0)
        clk.BackgroundTransparency = 1
        clk.Text = ""
        clk.ZIndex = 11
        clk.Activated:Connect(function()
            on = not on
            sv(on)
            antiKickEnabled = on
            if on then enableAntiKick() else disableAntiKick() end
            saveConfig()
        end)
    end
    setInfJumpVisual = mkToggle(pg, "Infinite Jump", function(on)
        infJumpEnabled = on
        if infJumpEnabled then
            if infJumpMode == "hold" then startHoldInfJump() end
        else
            stopHoldInfJump()
        end
        saveConfig()
    end)
    do
        local row = mkRow(pg, 36)
        mkLabel(row, "Jump Mode")
        local manualBtn = Instance.new("TextButton", row)
        manualBtn.Size = UDim2.new(0, 50, 0, 22)
        manualBtn.Position = UDim2.new(1, -110, 0.5, -11)
        manualBtn.BackgroundColor3 = (infJumpMode == "manual") and PINK2 or Color3.fromRGB(50, 30, 40)
        manualBtn.BorderSizePixel = 0
        manualBtn.Text = "Manual"
        manualBtn.TextColor3 = WHITE
        manualBtn.Font = Enum.Font.GothamBold
        manualBtn.TextSize = 9
        manualBtn.AutoButtonColor = false
        manualBtn.ZIndex = 12
        Instance.new("UICorner", manualBtn).CornerRadius = UDim.new(0, 5)
        local holdBtn = Instance.new("TextButton", row)
        holdBtn.Size = UDim2.new(0, 46, 0, 22)
        holdBtn.Position = UDim2.new(1, -57, 0.5, -11)
        holdBtn.BackgroundColor3 = (infJumpMode == "hold") and PINK2 or Color3.fromRGB(50, 30, 40)
        holdBtn.BorderSizePixel = 0
        holdBtn.Text = "Hold"
        holdBtn.TextColor3 = WHITE
        holdBtn.Font = Enum.Font.GothamBold
        holdBtn.TextSize = 9
        holdBtn.AutoButtonColor = false
        holdBtn.ZIndex = 12
        Instance.new("UICorner", holdBtn).CornerRadius = UDim.new(0, 5)
        manualBtn.Activated:Connect(function()
            infJumpMode = "manual"
            manualBtn.BackgroundColor3 = PINK2
            holdBtn.BackgroundColor3 = Color3.fromRGB(50, 30, 40)
            stopHoldInfJump()
            saveConfig()
        end)
        holdBtn.Activated:Connect(function()
            infJumpMode = "hold"
            holdBtn.BackgroundColor3 = PINK2
            manualBtn.BackgroundColor3 = Color3.fromRGB(50, 30, 40)
            if infJumpEnabled then startHoldInfJump() end
            saveConfig()
        end)
    end
    pg = tabPages["Auto"]
    mkSectionLbl(pg, "Auto")
    mkSectionLbl(pg, "Base Controls")
    setDesyncVisual = mkToggle(pg, "Desync", function(on)
        if on then enableDesync() else disableDesync() end
        saveConfig()
    end)
    mkActionRow(pg, "Base TP", function()
        local moved = teleportToBase()
        if setStealStatusText then
            setStealStatusText(moved and "BASE" or "ERROR")
        end
    end)
    autoPlaySetVisual = mkToggle(pg, "Auto Play", function(on)
        autoPlayEnabled = on
        if on then
            if _G.TamelessAntiDesyncAimbotOn then
                _G.TamelessStopAntiDesyncAimbot()
                if batTP.setVisual then batTP.setVisual(false) end
                if mobBtnRefs.tpBat then mobBtnRefs.tpBat(false) end
            end
            if autoLeftEnabled then
                autoLeftEnabled = false
                stopAutoLeft()
                if autoLeftSetVisual then autoLeftSetVisual(false) end
            end
            if autoRightEnabled then
                autoRightEnabled = false
                stopAutoRight()
                if autoRightSetVisual then autoRightSetVisual(false) end
            end
            if type(startAutoPlay) == "function" then startAutoPlay() end
        else
            if type(stopAutoPlay) == "function" then stopAutoPlay() end
            stopAutoLeft()
            stopAutoRight()
            autoLeftEnabled = false
            autoRightEnabled = false
        end
        saveConfig()
    end)
    mkSectionLbl(pg, "Auto Play Side")
    local sideRow = mkRow(pg, 36)
    mkLabel(sideRow, "Side")
    local leftBtn = Instance.new("TextButton", sideRow)
    leftBtn.Size = UDim2.new(0, 50, 0, 22)
    leftBtn.Position = UDim2.new(1, -110, 0.5, -11)
    leftBtn.BackgroundColor3 = (autoPlaySide == "left") and PINK or OFF
    leftBtn.BorderSizePixel = 0
    leftBtn.Text = "Left"
    leftBtn.TextColor3 = WHITE
    leftBtn.Font = Enum.Font.GothamBold
    leftBtn.TextSize = 9
    leftBtn.AutoButtonColor = false
    leftBtn.ZIndex = 12
    Instance.new("UICorner", leftBtn).CornerRadius = UDim.new(0, 6)
    local rightBtn = Instance.new("TextButton", sideRow)
    rightBtn.Size = UDim2.new(0, 50, 0, 22)
    rightBtn.Position = UDim2.new(1, -56, 0.5, -11)
    rightBtn.BackgroundColor3 = (autoPlaySide == "right") and PINK or OFF
    rightBtn.BorderSizePixel = 0
    rightBtn.Text = "Right"
    rightBtn.TextColor3 = WHITE
    rightBtn.Font = Enum.Font.GothamBold
    rightBtn.TextSize = 9
    rightBtn.AutoButtonColor = false
    rightBtn.ZIndex = 12
    Instance.new("UICorner", rightBtn).CornerRadius = UDim.new(0, 6)
    local function updateSideButtons(side)
        leftBtn.BackgroundColor3 = (side == "left") and PINK or OFF
        rightBtn.BackgroundColor3 = (side == "right") and PINK or OFF
    end
    updateSideButtons(autoPlaySide)
    leftBtn.Activated:Connect(function()
        if autoPlaySide ~= "left" then
            autoPlaySide = "left"
            updateSideButtons("left")
            if autoPlayEnabled then stopAutoPlay() startAutoPlay() end
            saveConfig()
        end
    end)
    rightBtn.Activated:Connect(function()
        if autoPlaySide ~= "right" then
            autoPlaySide = "right"
            updateSideButtons("right")
            if autoPlayEnabled then stopAutoPlay() startAutoPlay() end
            saveConfig()
        end
    end)
    setAutoCarryVisual = mkToggle(pg, "Auto Carry Speed", function(on)
        autoCarryEnabled = on
        saveConfig()
    end)
    if setAutoCarryVisual then setAutoCarryVisual(autoCarryEnabled) end
    setAutoSwingVisual = mkToggle(pg, "Auto Swing", function(on)
        autoSwingEnabled = on
        saveConfig()
    end)
    if setAutoSwingVisual then setAutoSwingVisual(autoSwingEnabled) end
    setAutoTPVisual = mkToggle(pg, "Auto TP", function(on)
        autoTPEnabled = on
        if on then startAutoTP() else stopAutoTP() end
        saveConfig()
    end)
    autoTPHeightBox = mkBoxRow(pg, "TP Height", autoTPHeight, function(v)
        if v >= 0 and v <= 500 then autoTPHeight = v end
        saveConfig()
    end, 0, 500, 1)
    pg = tabPages["Steal Mode"]
    mkSectionLbl(pg, "Steal Settings")
    do
        local row = mkRow(pg, 36)
        mkLabel(row, "Instant Steal")
        local pill = Instance.new("Frame", row)
        pill.Size = UDim2.new(0, 30, 0, 16)
        pill.Position = UDim2.new(1, -40, 0.5, -8)
        pill.BackgroundColor3 = OFF
        pill.BorderSizePixel = 0
        pill.ZIndex = 9
        Instance.new("UICorner", pill).CornerRadius = UDim.new(1, 0)
        local dot = Instance.new("Frame", pill)
        dot.Size = UDim2.new(0, 10, 0, 10)
        dot.Position = UDim2.new(0, 3, 0.5, -5)
        dot.BackgroundColor3 = GRAY
        dot.BorderSizePixel = 0
        dot.ZIndex = 10
        Instance.new("UICorner", dot).CornerRadius = UDim.new(1, 0)
        local on = false
        local function sv(s)
            on = s
            animPill(pill, dot, s)
        end
        setInstaGrab = sv
        sv(Steal.AutoStealEnabled == true)
        local function toggleSteal()
            on = not on
            sv(on)
            Steal.AutoStealEnabled = on
            if on then
                startAutoSteal()
            else
                stopAutoSteal()
                Steal.AutoStealEnabled = false
            end
            saveConfig()
        end
        local clk = Instance.new("TextButton", pill)
        clk.Size = UDim2.new(1, 0, 1, 0)
        clk.BackgroundTransparency = 1
        clk.Text = ""
        clk.ZIndex = 11
        clk.Activated:Connect(toggleSteal)
    end
    stealRadBox = mkBoxRow(pg, "Steal Range", Steal.HalfFireRange, function(v)
        if v >= 1 and v <= 300 then Steal.HalfFireRange = math.floor(v) end
        if stealRadBox then stealRadBox.Text = tostring(Steal.HalfFireRange) end
        saveConfig()
    end, 1, 300, 1)
    primeRangeBox = mkBoxRow(pg, "Prime Range", Steal.PrimeRange, function(v)
        if v >= 1 and v <= 300 then Steal.PrimeRange = math.floor(v) end
        if primeRangeBox then primeRangeBox.Text = tostring(Steal.PrimeRange) end
        saveConfig()
    end, 1, 300, 1)
    pg = tabPages["Visual"]
    mkSectionLbl(pg, "Visual")
    setAntiLagVisual = mkToggle(pg, "Anti Lag", function(on)
        if on then enableAntiLag() else disableAntiLag() end
        saveConfig()
    end)
    setAntiSummerBaseVisual = mkToggle(pg, "Anti Summer Base", function(on)
        if on then enableAntiSummerBase() else disableAntiSummerBase() end
        saveConfig()
    end)
    mkSectionLbl(pg, "Charter Features")
    headlessSetVisual = mkToggle(pg, "Headless", function(on)
        headlessEnabled = on
        local char = LP.Character
        if char then applyHeadlessToChar(char, headlessEnabled) end
        saveConfig()
    end)
    korbloxSetVisual = mkToggle(pg, "Korblox", function(on)
        korbloxEnabled = on
        local char = LP.Character
        if char then applyKorbloxToChar(char, korbloxEnabled) end
        saveConfig()
    end)
    mkSectionLbl(pg, "ESP Players")
    setEspBoxVisual = mkToggle(pg, "Box ESP", function(on)
        espBoxEnabled = on
        espApply()
        saveConfig()
    end)
    setEspHighlightVisual = mkToggle(pg, "Highlight Skin", function(on)
        espHighlightEnabled = on
        espApply()
        saveConfig()
    end)
    setEspTracerVisual = mkToggle(pg, "Tracers", function(on)
        espTracerEnabled = on
        espApply()
        saveConfig()
    end)
    setEspSpeedVisual = mkToggle(pg, "Speed ESP", function(on)
        espSpeedEnabled = on
        espApply()
        saveConfig()
    end)
    setEspRagdollCDVisual = mkToggle(pg, "Ragdoll Cooldown", function(on)
        espRagdollCDEnabled = on
        espApply()
        saveConfig()
    end)
    mkSectionLbl(pg, "Camera")
    do
        local row = mkRow(pg, 36)
        mkLabel(row, "FOV")
        local fovBtn = Instance.new("TextButton", row)
        fovBtn.Size = UDim2.new(0, 58, 0, 22)
        fovBtn.Position = UDim2.new(1, -66, 0.5, -11)
        fovBtn.BackgroundColor3 = INP
        fovBtn.BorderSizePixel = 0
        fovBtn.Text = tostring(fovValue)
        fovBtn.TextColor3 = PINK
        fovBtn.Font = Enum.Font.GothamBold
        fovBtn.TextSize = 11
        fovBtn.ZIndex = 11
        Instance.new("UICorner", fovBtn).CornerRadius = UDim.new(0, 5)
        for idx, v in ipairs(fovOptions) do
            if v == fovValue then fovIndex = idx end
        end
        fovBtn.Activated:Connect(function()
            fovIndex = fovIndex % #fovOptions + 1
            fovValue = fovOptions[fovIndex]
            fovBtn.Text = tostring(fovValue)
            applyFOV()
            saveConfig()
        end)
    end
    pg = tabPages["Keybind"]
    mkSectionLbl(pg, "KEYBINDS:")
    mkKBRow(pg, "Speed Toggle", KB.SpeedToggle, "kb", function() saveConfig() end)
    mkKBRow(pg, "Lagger Mode", KB.LaggerToggle, "kb", function() saveConfig() end)
    mkKBRow(pg, "TP Bat", KB.TPBat, "kb", function() saveConfig() end)
    mkKBRow(pg, "Hide UI", KB.GuiHide, "kb", function() saveConfig() end)
    mkKBRow(pg, "Auto Play", KB.AutoLeft, "kb", function() saveConfig() end)
    mkKBRow(pg, "Aimbot", KB.AutoBat, "kb", function() saveConfig() end)
    mkKBRow(pg, "Drop Brainrot", KB.DropBrainrot, "kb", function() saveConfig() end)
    mkKBRow(pg, "TP Floor", KB.TPFloor, "kb", function() saveConfig() end)
    mkKBRow(pg, "Insta Reset", KB.InstaReset, "kb", function() saveConfig() end)
    mkSectionLbl(pg, "CONTROLLER BINDS:")
    mkKBRow(pg, "Speed Toggle", KB.SpeedToggle, "gp", function() saveConfig() end)
    mkKBRow(pg, "Lagger Mode", KB.LaggerToggle, "gp", function() saveConfig() end)
    mkKBRow(pg, "TP Bat", KB.TPBat, "gp", function() saveConfig() end)
    mkKBRow(pg, "Hide UI", KB.GuiHide, "gp", function() saveConfig() end)
    mkKBRow(pg, "Auto Play", KB.AutoLeft, "gp", function() saveConfig() end)
    mkKBRow(pg, "Aimbot", KB.AutoBat, "gp", function() saveConfig() end)
    mkKBRow(pg, "Drop Brainrot", KB.DropBrainrot, "gp", function() saveConfig() end)
    mkKBRow(pg, "TP Floor", KB.TPFloor, "gp", function() saveConfig() end)
    mkKBRow(pg, "Insta Reset", KB.InstaReset, "gp", function() saveConfig() end)
    pg = tabPages["Settings"]
    mkSectionLbl(pg, "Settings")
    setLockVisual = mkToggle(pg, "Lock UI", function(on)
        uiLocked = on
        saveConfig()
    end)
    setIntroVisual = mkToggle(pg, "Intro Animation", function(on)
        introEnabled = on
        saveConfig()
    end)
    if introEnabled ~= false then setIntroVisual(true) end
    setIntroMusicVisual = mkToggle(pg, "Intro Music", function(on)
        introMusicEnabled = on
        saveConfig()
    end)
    if introMusicEnabled ~= false then setIntroMusicVisual(true) end
    setMobVisual = mkToggle(pg, "Mobile Buttons", function(on)
        mobileButtonsEnabled = on
        if on then buildMobileButtons() else destroyMobileButtons() end
        saveConfig()
    end)
    if mobileButtonsEnabled then setMobVisual(true) end
    do
        local scaleBox = mkBoxRow(pg, "GUI Scale %", math.floor((guiScaleValue or 1) * 100 + 0.5), function(v)
            if v >= 55 and v <= 110 then
                guiScaleValue = v / 100
                if mainGuiScaleRef then mainGuiScaleRef.Scale = guiScaleValue end
                saveConfig()
            end
        end, 55, 110, 5)
        if scaleBox then scaleBox.Text = tostring(math.floor((guiScaleValue or 1) * 100 + 0.5)) end
    end
    do
        local row = mkRow(pg, 36)
        mkLabel(row, "Btn Size")
        local sizeBox = Instance.new("TextBox", row)
        sizeBox.Size = UDim2.new(0, 58, 0, 22)
        sizeBox.Position = UDim2.new(1, -66, 0.5, -11)
        sizeBox.BackgroundColor3 = INP
        sizeBox.BorderSizePixel = 0
        sizeBox.Text = tostring(mobileButtonsSize)
        sizeBox.TextColor3 = PINK
        sizeBox.Font = Enum.Font.GothamBold
        sizeBox.TextSize = 10
        sizeBox.ClearTextOnFocus = false
        sizeBox.ZIndex = 9
        Instance.new("UICorner", sizeBox).CornerRadius = UDim.new(0, 5)
        sizeBox.FocusLost:Connect(function()
            local n = tonumber(sizeBox.Text)
            if n and n >= 40 and n <= 150 then
                mobileButtonsSize = n
                if mobileButtonsEnabled then buildMobileButtons() end
                saveConfig()
            else
                sizeBox.Text = tostring(mobileButtonsSize)
            end
        end)
    end
    do
        local row = mkRow(pg, 36)
        mkLabel(row, "Reset Btn Pos")
        local resetPosBtn = Instance.new("TextButton", row)
        resetPosBtn.Size = UDim2.new(0, 58, 0, 22)
        resetPosBtn.Position = UDim2.new(1, -66, 0.5, -11)
        resetPosBtn.BackgroundColor3 = PINK3
        resetPosBtn.BorderSizePixel = 0
        resetPosBtn.Text = "Reset"
        resetPosBtn.TextColor3 = WHITE
        resetPosBtn.Font = Enum.Font.GothamBold
        resetPosBtn.TextSize = 9
        resetPosBtn.ZIndex = 9
        Instance.new("UICorner", resetPosBtn).CornerRadius = UDim.new(0, 5)
        resetPosBtn.Activated:Connect(function()
            pcall(function() if writefile then writefile(MOB_POS_FILE, "{}") end end)
            pcall(function() if writefile then writefile(GUI_POS_FILE, "{}") end end)
            pcall(function()
                local raw = readfile("Tameless.json")
                if raw and writefile then
                    local cfg = HS:JSONDecode(raw)
                    if type(cfg) == "table" then
                        cfg.btnPositions = {}
                        cfg.guiPositions = {}
                        writefile("Tameless.json", HS:JSONEncode(cfg))
                    end
                end
            end)
            forceDefaultBtnPos = true
            if mobileButtonsEnabled then buildMobileButtons() end
            forceDefaultBtnPos = false
            pcall(saveBtnPositions)
        end)
    end
    trackConn(UIS.InputBegan:Connect(function(input, gpe)
        if _anyKeyListening then return end
        if input.UserInputType == Enum.UserInputType.Keyboard then
            if gpe or UIS:GetFocusedTextBox() then return end
        elseif not isGamepadInput(input) then return end
        if not isBindableInput(input) then return end
        local kc = input.KeyCode
        if kbMatch(KB.SpeedToggle, kc) then
            toggleCarryMode()
        elseif kbMatch(KB.LaggerToggle, kc) then
            toggleLaggerMode()
        elseif kbMatch(KB.TPBat, kc) then
            if _G.TamelessAntiDesyncAimbotOn then
                _G.TamelessStopAntiDesyncAimbot()
                if batTP.setVisual then batTP.setVisual(false) end
                if mobBtnRefs.tpBat then mobBtnRefs.tpBat(false) end
            else
                if autoBatEnabled then
                    stopBatAimbot()
                    if autoBatSetVisual then autoBatSetVisual(false) end
                    if mobBtnRefs.autoBat then mobBtnRefs.autoBat(false) end
                end
                if aimbotV2Enabled then
                    stopAimbotV2()
                    if mobBtnRefs.aimbotV2 then mobBtnRefs.aimbotV2(false) end
                end
                if autoPlayEnabled then
                    stopAutoPlay()
                    if autoPlaySetVisual then autoPlaySetVisual(false) end
                    if mobBtnRefs.autoPlay then mobBtnRefs.autoPlay(false) end
                end
                _G.TamelessStartAntiDesyncAimbot()
                if batTP.setVisual then batTP.setVisual(true) end
                if mobBtnRefs.tpBat then mobBtnRefs.tpBat(true) end
            end
            saveConfig()
        elseif kbMatch(KB.DropBrainrot, kc) then
            runDrop()
        elseif kbMatch(KB.TPFloor, kc) then
            runTPFloor()
        elseif kbMatch(KB.InstaReset, kc) then
            cursedInstaReset()
        elseif kbMatch(KB.AutoLeft, kc) or kbMatch(KB.AutoRight, kc) then
            autoPlayEnabled = not autoPlayEnabled
            if autoPlayEnabled then
                if _G.TamelessAntiDesyncAimbotOn then
                    _G.TamelessStopAntiDesyncAimbot()
                    if batTP.setVisual then batTP.setVisual(false) end
                    if mobBtnRefs.tpBat then mobBtnRefs.tpBat(false) end
                end
                if autoBatEnabled then
                    stopBatAimbot()
                    if autoBatSetVisual then autoBatSetVisual(false) end
                    if mobBtnRefs.autoBat then mobBtnRefs.autoBat(false) end
                end
                if aimbotV2Enabled then stopAimbotV2() end
                startAutoPlay()
            else
                stopAutoPlay()
            end
            saveConfig()
        elseif kbMatch(KB.AutoBat, kc) then
            if not autoBatEnabled then
                if _G.TamelessAntiDesyncAimbotOn then
                    _G.TamelessStopAntiDesyncAimbot()
                    if batTP.setVisual then batTP.setVisual(false) end
                    if mobBtnRefs.tpBat then mobBtnRefs.tpBat(false) end
                end
                if autoLeftEnabled then
                    autoLeftEnabled = false
                    stopAutoLeft()
                    if autoLeftSetVisual then autoLeftSetVisual(false) end
                    if mobBtnRefs.autoLeft then mobBtnRefs.autoLeft(false) end
                end
                if autoRightEnabled then
                    autoRightEnabled = false
                    stopAutoRight()
                    if autoRightSetVisual then autoRightSetVisual(false) end
                    if mobBtnRefs.autoRight then mobBtnRefs.autoRight(false) end
                end
                queueAutoBatStart()
                if autoBatSetVisual then autoBatSetVisual(true) end
                if mobBtnRefs.autoBat then mobBtnRefs.autoBat(true) end
            else
                stopBatAimbot()
                if autoBatSetVisual then autoBatSetVisual(false) end
                if mobBtnRefs.autoBat then mobBtnRefs.autoBat(false) end
            end
        elseif kbMatch(KB.AimbotV2, kc) then
            local on = not (autoBatEnabled or aimbotV2Enabled)
            if on then
                if _G.TamelessAntiDesyncAimbotOn then
                    _G.TamelessStopAntiDesyncAimbot()
                    if batTP.setVisual then batTP.setVisual(false) end
                    if mobBtnRefs.tpBat then mobBtnRefs.tpBat(false) end
                end
                if autoPlayEnabled then stopAutoPlay() end
                if _G._TamelessAimMode == "bypass" or antiBatBypassEnabled then
                    startAimbotV2()
                else
                    queueAutoBatStart()
                end
                if autoBatSetVisual then autoBatSetVisual(true) end
                if mobBtnRefs.autoBat then mobBtnRefs.autoBat(true) end
            else
                stopBatAimbot()
                stopAimbotV2()
                if autoBatSetVisual then autoBatSetVisual(false) end
                if mobBtnRefs.autoBat then mobBtnRefs.autoBat(false) end
            end
        elseif kbMatch(KB.GuiHide, kc) then
            local outerRef = mainFrame and mainFrame.Parent
            if mainFrame.Visible then
                mainFrame.Visible = false
                if outerRef and outerRef.Name == "OuterBorder" then outerRef.Visible = false end
                miniBtn.Visible = true
            else
                if outerRef and outerRef.Name == "OuterBorder" then outerRef.Visible = true end
                mainFrame.Visible = true
                miniBtn.Visible = false
            end
        end
    end))
end

_savedCfg = nil

local function loadConfigKeys()
    local cfg = nil
    pcall(function()
        if getgenv and type(getgenv()._TamelessCfg) == "table" then cfg = getgenv()._TamelessCfg end
    end)
    if not cfg then
        local raw = nil
        pcall(function() if isfile("Tameless.json") then raw = readfile("Tameless.json") end end)
        if not raw then pcall(function() if isfile("TamelessConfig.json") then raw = readfile("TamelessConfig.json") end end) end
        if raw then
            local ok, decoded = pcall(function() return HS:JSONDecode(raw) end)
            if ok and type(decoded) == "table" then cfg = decoded end
        end
    end
    if not cfg then return end
    _savedCfg = cfg
    introEnabled = true
    local function lk(e, d)
        if type(d) ~= "table" then return end
        if d.kb and Enum.KeyCode[d.kb] then e.kb = Enum.KeyCode[d.kb] else e.kb = nil end
        if d.gp and Enum.KeyCode[d.gp] then e.gp = Enum.KeyCode[d.gp] else e.gp = nil end
    end
    lk(KB.DropBrainrot, cfg.dropBrainrotKey)
    lk(KB.AutoLeft, cfg.autoLeftKey)
    lk(KB.AutoRight, cfg.autoRightKey)
    lk(KB.AutoBat, cfg.autoBatKey)
    lk(KB.AimbotV2, cfg.aimbotV2Key)
    lk(KB.LaggerToggle, cfg.laggerToggleKey)
    lk(KB.LaggerCarry, cfg.laggerCarryKey)
    lk(KB.TPFloor, cfg.tpFloorKey)
    lk(KB.InstaReset, cfg.instaResetKey)
    lk(KB.GuiHide, cfg.guiHideKey)
    lk(KB.SpeedToggle, cfg.speedToggleKey)
    lk(KB.AntiDesync, cfg.antiDesyncKey)
    lk(KB.TPBat, cfg.tpBatKey)
    if cfg.autoCarryEnabled ~= nil then autoCarryEnabled = cfg.autoCarryEnabled == true end
    if cfg.normalSpeed then NS = cfg.normalSpeed end
    if cfg.carrySpeed then CS = cfg.carrySpeed end
    if cfg.laggerSpeed then LAGGER_SPEED = cfg.laggerSpeed end
    if cfg.laggerCarrySpeed then LAGGER_CARRY_SPEED = cfg.laggerCarrySpeed end
    if cfg.grabRadius then Steal.StealRadius = cfg.grabRadius end
    if cfg.primeRange then Steal.PrimeRange = cfg.primeRange elseif cfg.grabRadius then Steal.PrimeRange = cfg.grabRadius end
    if cfg.stealDuration then Steal.StealDuration = cfg.stealDuration end
    if cfg.autoTPHeight then autoTPHeight = cfg.autoTPHeight end
    if cfg.autoSwing ~= nil then autoSwingEnabled = cfg.autoSwing == true end
    if cfg.guiTransparencyEnabled ~= nil then guiTransparencyEnabled = cfg.guiTransparencyEnabled end
    if cfg.mobileButtonsEnabled ~= nil then mobileButtonsEnabled = cfg.mobileButtonsEnabled end
    if cfg.mobileButtonsSize ~= nil then mobileButtonsSize = cfg.mobileButtonsSize else mobileButtonsSize = 98 end
    if cfg.guiScale ~= nil then guiScaleValue = math.clamp(tonumber(cfg.guiScale) or guiScaleValue, 0.55, 1.1) end
    if cfg.circleButtonsEnabled ~= nil then circleButtonsEnabled = cfg.circleButtonsEnabled == true end
    if cfg.antiKick ~= nil then antiKickEnabled = cfg.antiKick == true end
    if cfg.carrySpeedActive ~= nil then carrySpeedActive = cfg.carrySpeedActive end
    if cfg.laggerModeEnabled ~= nil then laggerModeEnabled = cfg.laggerModeEnabled end
    if cfg.laggerCarryActive ~= nil then laggerCarryActive = cfg.laggerCarryActive end
    if cfg.infJumpMode then infJumpMode = cfg.infJumpMode end
    if cfg.fovValue then
        fovValue = cfg.fovValue
        for idx, v in ipairs(fovOptions) do if v == fovValue then fovIndex = idx end end
    end
    if cfg.chromeImageVisible ~= nil then _G._TamelessDuels_bgImageVisible = cfg.chromeImageVisible == true end
    perButtonDragEnabled = true
    if cfg.autoMoveSwing ~= nil then autoMoveSwingEnabled = cfg.autoMoveSwing == true end
    if cfg.autoMoveSwingInterval then autoMoveSwingInterval = cfg.autoMoveSwingInterval end
    if cfg.skyTheme then
        currentSkyTheme = cfg.skyTheme
        CandyApplyCustomSky(currentSkyTheme)
    end
    if type(cfg.btnPositions) == "table" and next(cfg.btnPositions) ~= nil and writefile then
        pcall(function() writefile(MOB_POS_FILE, HS:JSONEncode(cfg.btnPositions)) end)
    end
    if type(cfg.guiPositions) == "table" and next(cfg.guiPositions) ~= nil and writefile then
        pcall(function() writefile(GUI_POS_FILE, HS:JSONEncode(cfg.guiPositions)) end)
    end
    if cfg.medusaReset ~= nil then medusaResetEnabled = cfg.medusaReset == true end
    if cfg.ragdollGui ~= nil then ragdollGuiEnabled = cfg.ragdollGui == true end
    if cfg.introEnabled ~= nil then introEnabled = cfg.introEnabled ~= false end
    if cfg.introMusicEnabled ~= nil then introMusicEnabled = cfg.introMusicEnabled ~= false end
    if cfg.selectedIntroMusic ~= nil then selectedIntroMusic = cfg.selectedIntroMusic end
end

local function loadConfigState()
    local cfg = _savedCfg
    if not cfg then
        if Steal.AutoStealEnabled then
            if setInstaGrab then setInstaGrab(true) end
            pcall(startAutoSteal)
        end
        return
    end
    if normalBox then normalBox.Text = tostring(NS) end
    if carryBox then carryBox.Text = tostring(CS) end
    if primeRangeBox then primeRangeBox.Text = tostring(Steal.PrimeRange) end
    if radInput then radInput.Text = tostring(Steal.StealRadius) end
    if durationBox then durationBox.Text = tostring(Steal.StealDuration) end
    if laggerBox then laggerBox.Text = tostring(LAGGER_SPEED) end
    if laggerCarryBox then laggerCarryBox.Text = tostring(LAGGER_CARRY_SPEED) end
    if autoTPHeightBox then autoTPHeightBox.Text = tostring(autoTPHeight) end
    task.spawn(function()
        task.wait(0.15)
        if cfg.antiRagdoll then
            antiRagdollEnabled = true
            if setAntiRagVisual then setAntiRagVisual(true) end
            startAntiRagdoll()
        else
            antiRagdollEnabled = false
            if setAntiRagVisual then setAntiRagVisual(false) end
            stopAntiRagdoll()
        end
        if cfg.autoStealEnabled ~= nil then
            Steal.AutoStealEnabled = cfg.autoStealEnabled == true
            if setInstaGrab then setInstaGrab(Steal.AutoStealEnabled) end
            if Steal.AutoStealEnabled then
                pcall(startAutoSteal)
            else
                stopAutoSteal()
            end
        elseif Steal.AutoStealEnabled then
            if setInstaGrab then setInstaGrab(true) end
            pcall(startAutoSteal)
        end
        if cfg.infiniteJump then
            infJumpEnabled = true
            if setInfJumpVisual then setInfJumpVisual(true) end
            if infJumpMode == "hold" then startHoldInfJump() end
        end
        if cfg.medusaCounter then
            medusaCounterEnabled = true
            if setMedusaVisual then setMedusaVisual(true) end
            setupMedusa(LP.Character)
        end
        if cfg.batCounter then
            batCounterEnabled = true
            if setBatCounterVisual then setBatCounterVisual(true) end
            startBatCounter()
        end
        refreshSpeedModeLabel()
        if cfg.autoTPEnabled then
            autoTPEnabled = true
            if setAutoTPVisual then setAutoTPVisual(true) end
            startAutoTP()
        end
        if setAutoSwingVisual then setAutoSwingVisual(autoSwingEnabled) end
        if cfg.autoBat then
            autoBatEnabled = true
            if autoBatSetVisual then autoBatSetVisual(true) end
            if mobBtnRefs.autoBat then mobBtnRefs.autoBat(true) end
            queueAutoBatStart()
        end
        if cfg.aimbotV2 then
            aimbotV2Enabled = true
            if mobBtnRefs.aimbotV2 then mobBtnRefs.aimbotV2(true) end
            startAimbotV2()
        end
        if cfg.unwalkEnabled then
            unwalkEnabled = true
            if setUnwalkVisual then setUnwalkVisual(true) end
            task.spawn(function() task.wait(0.5) startUnwalk() end)
        end
        if cfg.antiLag then
            enableAntiLag()
            if setAntiLagVisual then setAntiLagVisual(true) end
        end
        if cfg.antiSummerBase then
            enableAntiSummerBase()
            if setAntiSummerBaseVisual then setAntiSummerBaseVisual(true) end
        end
        if cfg.desyncEnabled then
            desyncEnabled = true
            if setDesyncVisual then setDesyncVisual(true) end
            enableDesync()
        end
        if cfg.headless then
            headlessEnabled = true
            if headlessSetVisual then headlessSetVisual(true) end
            local _hc = LP.Character
            if _hc then applyHeadlessToChar(_hc, true) end
        end
        if cfg.korblox then
            korbloxEnabled = true
            if korbloxSetVisual then korbloxSetVisual(true) end
            local _kc = LP.Character
            if _kc then applyKorbloxToChar(_kc, true) end
        end
        if cfg.espBox then espBoxEnabled = true if setEspBoxVisual then setEspBoxVisual(true) end end
        if cfg.espHighlight then espHighlightEnabled = true if setEspHighlightVisual then setEspHighlightVisual(true) end end
        if cfg.espTracer then espTracerEnabled = true if setEspTracerVisual then setEspTracerVisual(true) end end
        if cfg.espSpeed then espSpeedEnabled = true if setEspSpeedVisual then setEspSpeedVisual(true) end end
        if cfg.espRagdollCD then espRagdollCDEnabled = true if setEspRagdollCDVisual then setEspRagdollCDVisual(true) end end
        if espApply then espApply() end
        if cfg.antiKick then enableAntiKick() if antiKickSetVisual then antiKickSetVisual(true) end end
        if circleButtonsEnabled and setCircleBtnsVisual then setCircleBtnsVisual(true) end
        if cfg.skyTheme then CandyApplyCustomSky(cfg.skyTheme) end
        if carrySpeedActive and not laggerModeEnabled and not laggerCarryActive then setNormalCarry()
        elseif laggerModeEnabled and not laggerCarryActive then setLaggerNormal()
        elseif laggerCarryActive then setLaggerCarry()
        else setNormalSpeed() end
        refreshSpeedModeLabel()
    end)
end

local _okInit, _errInit = pcall(function()
    loadConfigKeys()
    buildGui()
    if mobileButtonsEnabled then buildMobileButtons() end
    loadConfigState()
    CandyApplyCustomSky(currentSkyTheme)
end)
if not _okInit then warn("[Snow.VS] init error: ", _errInit) end

task.spawn(function()
    task.wait(0.4)
    if introEnabled == false then return end
    pcall(function()
        local guiParent = (LP and LP:FindFirstChild("PlayerGui")) or game:GetService("CoreGui")
        for _, n in ipairs({ "TamelessIntro", "CalciumIntro" }) do
            local o = guiParent:FindFirstChild(n) or game:GetService("CoreGui"):FindFirstChild(n)
            if o then o:Destroy() end
        end
        local sg = Instance.new("ScreenGui")
        sg.Name = "TamelessIntro"
        sg.ResetOnSpawn = false
        sg.DisplayOrder = 9999
        sg.IgnoreGuiInset = true
        pcall(function() sg.Parent = game:GetService("CoreGui") end)
        if not sg.Parent then sg.Parent = guiParent end
        local bg = Instance.new("Frame", sg)
        bg.Size = UDim2.new(1, 0, 1, 0)
        bg.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        bg.BackgroundTransparency = 0.2
        bg.BorderSizePixel = 0
        local t1 = Instance.new("TextLabel", bg)
        t1.Size = UDim2.new(1, 0, 0, 52)
        t1.Position = UDim2.new(0, 0, 0.4, 0)
        t1.BackgroundTransparency = 1
        t1.Text = BRAND
        t1.TextColor3 = Color3.fromRGB(30, 144, 255)
        t1.Font = Enum.Font.GothamBlack
        t1.TextSize = 44
        t1.TextTransparency = 1
        local t2 = Instance.new("TextLabel", bg)
        t2.Size = UDim2.new(1, 0, 0, 44)
        t2.Position = UDim2.new(0, 0, 0.4, 52)
        t2.BackgroundTransparency = 1
        t2.Text = DISCORD_STACKED
        t2.TextColor3 = Color3.fromRGB(180, 200, 220)
        t2.Font = Enum.Font.GothamBold
        t2.TextSize = 16
        t2.TextWrapped = true
        t2.TextYAlignment = Enum.TextYAlignment.Center
        t2.TextTransparency = 1
        local introSound = Instance.new("Sound")
        introSound.SoundId = "rbxassetid://828172750"
        introSound.Volume = 1
        introSound.Parent = sg
        introSound:Play()
        TweenService:Create(t1, TweenInfo.new(0.4), { TextTransparency = 0 }):Play()
        TweenService:Create(t2, TweenInfo.new(0.5), { TextTransparency = 0 }):Play()
        task.wait(1.5)
        TweenService:Create(t1, TweenInfo.new(0.3), { TextTransparency = 1 }):Play()
        TweenService:Create(t2, TweenInfo.new(0.3), { TextTransparency = 1 }):Play()
        TweenService:Create(bg, TweenInfo.new(0.35), { BackgroundTransparency = 1 }):Play()
        task.wait(0.4)
        sg:Destroy()
    end)
end)

do
    local RS = game:GetService("RunService")
    local _acApplied = false
    local _acReturn = nil
    local _acGrace = 0
    local _acStealWas = false
    local function isCarryName(name)
        local n = tostring(name or ""):lower()
        return n:find("brainrot") or n:find("animal") or n:find("carry") or n:find("grab") or n:find("steal") or n:find("hold")
    end
    local function isIgnoredCarryTool(name)
        local n = tostring(name or ""):lower()
        return n:find("bat") or n:find("slap") or n:find("medusa") or n:find("head") or n:find("stone")
    end
    local function isCarryingBrainrot(char)
        if not char then return false end
        for _, name in ipairs({ "Carrying", "IsCarrying", "Grabbed", "Holding", "StealHold", "HasGrab" }) do
            local v = char:FindFirstChild(name, true)
            if v then
                if v:IsA("BoolValue") and v.Value then return true end
                if v:IsA("ObjectValue") and v.Value then return true end
                if v:IsA("StringValue") and v.Value ~= "" then return true end
            end
        end
        for _, child in ipairs(char:GetChildren()) do
            if child:IsA("Model") and child:FindFirstChildWhichIsA("BasePart", true) then
                if child:FindFirstChildOfClass("Humanoid") and child:FindFirstChild("HumanoidRootPart") then return true end
                if isCarryName(child.Name) then return true end
            elseif child:IsA("Tool") and not isIgnoredCarryTool(child.Name) then return true end
        end
        return false
    end
    local function applyCarry()
        if _acApplied then return end
        if laggerCarryActive then _acReturn = "LaggerCarry"
        elseif laggerModeEnabled then _acReturn = "Lagger"
        elseif carrySpeedActive then _acReturn = "Carry"
        else _acReturn = "Normal" end
        _acApplied = true
        _acGrace = tick() + 0.75
        if _acReturn == "Lagger" or _acReturn == "LaggerCarry" then setLaggerCarry() else setNormalCarry() end
    end
    local function restore()
        if not _acApplied then return end
        _acApplied = false
        _acGrace = 0
        local r = _acReturn
        _acReturn = nil
        if r == "Lagger" then setLaggerNormal()
        elseif r == "LaggerCarry" then setLaggerCarry()
        elseif r == "Carry" then setNormalCarry()
        else setNormalSpeed() end
    end
    RS.RenderStepped:Connect(function()
        if autoCarryEnabled ~= true then
            if _acApplied then restore() end
            _acStealWas = false
            return
        end
        local char = LP.Character
        local hum = char and char:FindFirstChildOfClass("Humanoid")
        if not char or not hum then
            if _acApplied then restore() end
            _acStealWas = false
            return
        end
        local st = hum:GetState()
        local gotHit = st == Enum.HumanoidStateType.Physics or st == Enum.HumanoidStateType.Ragdoll or st == Enum.HumanoidStateType.FallingDown
        local stealing = LP:GetAttribute("Stealing") == true
        local carrying = isCarryingBrainrot(char)
        if stealing and not _acStealWas then
            _acStealWas = true
            applyCarry()
        elseif not stealing then _acStealWas = false end
        if carrying and not _acApplied then applyCarry() end
        if _acApplied then
            local graceDone = tick() > _acGrace
            if gotHit or (graceDone and not carrying and not stealing) then restore() end
        end
    end)
end

do
    local glow = {}

    local function addGlow(obj, baseThick)
        if not obj then return end
        local s = Instance.new("UIStroke", obj)
        s.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        s.LineJoinMode = Enum.LineJoinMode.Round
        s.Thickness = baseThick or 2.4
        s.Transparency = 0.05
        s.Color = Color3.fromRGB(255,255,255)
        local g = Instance.new("UIGradient", s)
        g.Rotation = 0
        table.insert(glow, { stroke = s, grad = g, base = baseThick or 2.4 })
        return s, g
    end

    local mainOuter = mainGuiRef and mainGuiRef:FindFirstChild("OuterBorder")
    if mainOuter then addGlow(mainOuter, 2.6) end
    if stealBarFrame then addGlow(stealBarFrame, 2.2) end

    local band = NumberSequence.new({
        NumberSequenceKeypoint.new(0.00, 0.85),
        NumberSequenceKeypoint.new(0.42, 0.85),
        NumberSequenceKeypoint.new(0.50, 0.00),
        NumberSequenceKeypoint.new(0.58, 0.85),
        NumberSequenceKeypoint.new(1.00, 0.85),
    })
    for _, e in ipairs(glow) do
        e.stroke.Color = Color3.fromRGB(255, 255, 255)
        e.stroke.Transparency = 0
        e.grad.Color = ColorSequence.new(Color3.fromRGB(255, 255, 255))
        e.grad.Transparency = band
    end

    local pulseValue = Instance.new("NumberValue")
    pulseValue.Value = 0
    local function applyPulseColor(value)
        local color = Color3.fromRGB(0, 0, 0):Lerp(Color3.fromRGB(255, 255, 255), value)
        local roots = { mainOuter, stealBarFrame, mainGuiRef }
        for _, root in ipairs(roots) do
            if root then
                for _, object in ipairs(root:GetDescendants()) do
                    if object:IsA("UIStroke") then
                        object.Color = color
                    end
                end
            end
        end
    end
    pulseValue.Changed:Connect(applyPulseColor)
    TweenService:Create(
        pulseValue,
        TweenInfo.new(1.35, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true),
        { Value = 1 }
    ):Play()

    local t = 0
    RunService.RenderStepped:Connect(function(dt)
        t = t + dt
        local rot = (t * 70) % 360
        local breathe = math.sin(t * 1.8) * 0.5 + 0.5
        for _, e in ipairs(glow) do
            if e.stroke and e.stroke.Parent then
                e.grad.Rotation = rot
                e.stroke.Thickness = e.base * (0.9 + breathe * 0.45)
            end
        end
    end)
end

print("✅ Snow.VS // Brighter Hub loaded — single UI, unified auto-grab engine")
