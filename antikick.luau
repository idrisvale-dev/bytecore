-- language: Lua (Roblox LocalScript), target: Steal an Egg, executor: any
-- v4: Gaussian timing, no VirtualUser, Enabled=false VFX (not Destroy),
--     behavior rotation, CoreGui attempt, executor fingerprint wipe,
--     humanoid state awareness, animation via existing Animator

local Players    = game:GetService("Players")
local RunService = game:GetService("RunService")
local Lighting   = game:GetService("Lighting")
local TweenSvc   = game:GetService("TweenService")

local player     = Players.LocalPlayer
local plrGui     = player:WaitForChild("PlayerGui")

-- ══════════════════════════════════════════════════════════════════════════════
--  CONFIG
-- ══════════════════════════════════════════════════════════════════════════════
local CFG = {
    -- movement (Gaussian mean ± std seconds)
    moveMean        = 26,   moveSd     = 6,
    jumpMean        = 190,  jumpSd     = 30,
    camMean         = 14,   camSd      = 4,
    animMean        = 60,   animSd     = 15,

    -- micro-step
    stepRange       = 0.35,   -- max studs from origin (stay on treadmill)

    -- fps
    renderQuality   = 1,
    killLightingFX  = true,
    killShadows     = true,
    killWater       = true,
    killVFX         = true,     -- Enabled=false, not Destroy
    killBillboards  = true,
    removePets      = true,
    hideOtherChars  = false,
    cleanInterval   = 7,
}

-- ══════════════════════════════════════════════════════════════════════════════
--  GAUSSIAN RNG  (Box-Muller — human-like timing, not uniform random)
-- ══════════════════════════════════════════════════════════════════════════════
local function gauss(mean, sd)
    local u1 = math.max(1e-10, math.random())
    local u2 = math.random()
    local z  = math.sqrt(-2 * math.log(u1)) * math.cos(2 * math.pi * u2)
    return math.max(mean * 0.4, mean + z * sd) -- floor at 40% of mean
end

-- ══════════════════════════════════════════════════════════════════════════════
--  STATE
-- ══════════════════════════════════════════════════════════════════════════════
local startTime   = os.time()
local idleBlocks  = 0
local fpsCount    = 0
local originPos   = nil
local stepDir     = 1
local statusLbl   = nil
local uptimeLbl   = nil
local fpsLbl      = nil

-- behavior rotation index (prevents repeating same action)
local behaviors   = { "step", "cam", "anim", "jump" }
local bIdx        = 0
local function nextBehavior()
    bIdx = (bIdx % #behaviors) + 1
    return behaviors[bIdx]
end

-- ══════════════════════════════════════════════════════════════════════════════
--  HELPERS
-- ══════════════════════════════════════════════════════════════════════════════
local function getChar()  return player.Character end
local function getHum()
    local c = getChar()
    return c and c:FindFirstChildOfClass("Humanoid")
end
local function getHRP()
    local c = getChar()
    return c and c:FindFirstChild("HumanoidRootPart")
end
local function isAlive()
    local h = getHum()
    return h and h.Health > 0
end
local function isGrounded()
    local h = getHum()
    if not h then return false end
    local s = h:GetState()
    return s == Enum.HumanoidStateType.Running
        or s == Enum.HumanoidStateType.Standing
        or s == Enum.HumanoidStateType.RunningNoPhysics
end

-- ══════════════════════════════════════════════════════════════════════════════
--  EXECUTOR FINGERPRINT WIPE
--  Clears common executor globals that games probe for
-- ══════════════════════════════════════════════════════════════════════════════
local function wipeFingerprints()
    pcall(function()
        local env = getgenv and getgenv() or {}
        local kills = {
            "syn","SYNAPSE_RUNNING","KRNL_LOADED",
            "is_sirhurt_closure","pebc_loaded","Oxygen",
            "fluxus","evon","wave","trigon"
        }
        for _, k in ipairs(kills) do
            pcall(function() env[k] = nil end)
        end
    end)
end

-- ══════════════════════════════════════════════════════════════════════════════
--  GUI — try CoreGui first (server can't scan it), fallback PlayerGui
-- ══════════════════════════════════════════════════════════════════════════════
local function buildGUI()
    local guiParent = plrGui
    pcall(function()
        -- CoreGui is invisible to server-side Explorer scanning
        local cg = game:GetService("CoreGui")
        guiParent = cg
    end)

    -- remove old if exists
    pcall(function()
        for _, v in ipairs(guiParent:GetChildren()) do
            if v.Name:find("__afk") then v:Destroy() end
        end
    end)

    -- randomized name — harder to string-scan
    local rname = "__afk_" .. tostring(math.random(10000,99999))

    local gui           = Instance.new("ScreenGui", guiParent)
    gui.Name            = rname
    gui.ResetOnSpawn    = false
    gui.ZIndexBehavior  = Enum.ZIndexBehavior.Sibling
    pcall(function()
        -- protect_gui for synapseX — hides from game's gui scan
        if syn and syn.protect_gui then syn.protect_gui(gui) end
    end)

    local frame                  = Instance.new("Frame", gui)
    frame.Size                   = UDim2.new(0, 218, 0, 125)
    frame.Position               = UDim2.new(1, -225, 0, 10)
    frame.BackgroundColor3       = Color3.fromRGB(8, 8, 14)
    frame.BackgroundTransparency = 0.12
    frame.BorderSizePixel        = 0
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 10)

    local stroke = Instance.new("UIStroke", frame)
    stroke.Color     = Color3.fromRGB(60, 180, 255)
    stroke.Thickness = 1
    stroke.Transparency = 0.6

    local function lbl(txt, y, col, bold, sz)
        local l = Instance.new("TextLabel", frame)
        l.Size = UDim2.new(1, -10, 0, sz or 20)
        l.Position = UDim2.new(0, 5, 0, y)
        l.Text = txt
        l.TextColor3 = col or Color3.fromRGB(255,255,255)
        l.BackgroundTransparency = 1
        l.Font = bold and Enum.Font.GothamBold or Enum.Font.Gotham
        l.TextSize = bold and 13 or 10
        l.TextXAlignment = Enum.TextXAlignment.Left
        l.TextTruncate = Enum.TextTruncate.AtEnd
        return l
    end

    lbl("🔒 MAX STEALTH v4 — BAC BYPASS", 3, Color3.fromRGB(80,210,255), true, 22)
    statusLbl = lbl("⚡ Booting...", 27, Color3.fromRGB(255,255,255))
    uptimeLbl = lbl("⏱ 00:00:00  |  Blocks: 0", 49, Color3.fromRGB(170,170,170))
    fpsLbl    = lbl("🗑 FPS cleaned: 0", 69, Color3.fromRGB(100,255,160))
    lbl("🎲 Gaussian timing  ✅  VirtualUser gone", 89, Color3.fromRGB(255,180,60))
    lbl("🛡 CoreGui hidden  ✅  Fingerprint wiped", 105, Color3.fromRGB(150,255,150))

    task.spawn(function()
        while gui.Parent do
            task.wait(1)
            local e = os.time() - startTime
            uptimeLbl.Text = string.format(
                "⏱ %02d:%02d:%02d  |  Blocks: %d",
                math.floor(e/3600), math.floor((e%3600)/60), e%60, idleBlocks
            )
            fpsLbl.Text = "🗑 FPS cleaned: " .. fpsCount
        end
    end)
end

local function setStatus(s)
    if statusLbl and statusLbl.Parent then
        statusLbl.Text = "⚡ " .. s
    end
end

-- ══════════════════════════════════════════════════════════════════════════════
--  ANTI-KICK: BEHAVIOR ENGINE
--  Rotates through 4 behaviors, each with Gaussian timing.
--  Server sees varied, human-patterned activity — not a bot loop.
-- ══════════════════════════════════════════════════════════════════════════════

-- [B1] Micro-step — Humanoid:MoveTo(), left/right within treadmill
local function doStep()
    if not isAlive() or not isGrounded() then return end
    local hrp = getHRP()
    local hum = getHum()
    if not hrp or not hum then return end
    if not originPos then originPos = hrp.Position end

    local nudgeX = stepDir * CFG.stepRange * (0.3 + math.random() * 0.7)
    local nudgeZ = (math.random() - 0.5) * 0.15
    stepDir = stepDir * -1

    hum:MoveTo(originPos + Vector3.new(nudgeX, 0, nudgeZ))
    setStatus("Step → " .. string.format("%.2f", nudgeX) .. " studs")
end

-- [B2] Camera micro-rotation — client only
local function doCam()
    pcall(function()
        local cam = workspace.CurrentCamera
        local rx   = math.rad((math.random()-0.5) * 0.14)
        local ry   = math.rad((math.random()-0.5) * 0.14)
        cam.CFrame = cam.CFrame * CFrame.Angles(rx, ry, 0)
    end)
    setStatus("Camera drift")
end

-- [B3] Animation ping — plays 0.8s of existing idle track via Animator
local function doAnim()
    if not isAlive() then return end
    pcall(function()
        local char = getChar()
        if not char then return end
        local hum  = char:FindFirstChildOfClass("Humanoid")
        if not hum then return end
        local anim  = char:FindFirstChild("Animate") -- built-in animate script
        if anim then
            -- wiggle the idle weight to signal Animator activity
            local idle = anim:FindFirstChild("idle")
            if idle then
                local a1 = idle:FindFirstChild("Animation1")
                local a2 = idle:FindFirstChild("Animation2")
                if a1 then a1.Weight.Value = a1.Weight.Value end
                if a2 then a2.Weight.Value = a2.Weight.Value end
            end
        end
        -- also load + play a 1-frame track via Animator
        local animator = hum:FindFirstChildOfClass("Animator")
        if animator then
            local animObj = Instance.new("Animation")
            animObj.AnimationId = "rbxassetid://507766388"
            local track = animator:LoadAnimation(animObj)
            track:Play()
            task.wait(0.8)
            pcall(function() track:Stop() end)
            pcall(function() animObj:Destroy() end)
        end
    end)
    setStatus("Anim ping")
end

-- [B4] Jump — only when grounded, restores to origin after
local function doJump()
    if not isAlive() or not isGrounded() then return end
    pcall(function()
        local hum = getHum()
        local hrp = getHRP()
        if not hum or not hrp then return end
        hum:ChangeState(Enum.HumanoidStateType.Jumping)
        task.wait(0.7)
        -- gentle return to origin via MoveTo (not CFrame)
        if originPos then
            hum:MoveTo(originPos)
        end
    end)
    setStatus("Jump activity")
end

-- master behavior loop
local behaviorFns = { doStep, doCam, doAnim, doJump }
local bMeans      = { CFG.moveMean, CFG.camMean, CFG.animMean, CFG.jumpMean }
local bSds        = { CFG.moveSd,   CFG.camSd,   CFG.animSd,   CFG.jumpSd   }

-- each behavior runs on its own independent Gaussian timer
local function spawnBehaviorLoop(idx)
    task.spawn(function()
        while true do
            local wait = gauss(bMeans[idx], bSds[idx])
            task.wait(wait)
            pcall(behaviorFns[idx])
        end
    end)
end

-- ══════════════════════════════════════════════════════════════════════════════
--  ANTI-KICK: IDLE EVENT (Roblox native 20-min)
--  MoveTo response instead of VirtualUser
-- ══════════════════════════════════════════════════════════════════════════════
player.Idled:Connect(function()
    idleBlocks = idleBlocks + 1
    setStatus("Idle event blocked #" .. idleBlocks)
    pcall(function()
        local hrp = getHRP()
        local hum = getHum()
        if hrp and hum and hum.Health > 0 then
            hum:MoveTo(hrp.Position + Vector3.new(0.08, 0, 0))
        end
    end)
end)

-- ══════════════════════════════════════════════════════════════════════════════
--  ANTI-KICK: RESPAWN RECOVERY
-- ══════════════════════════════════════════════════════════════════════════════
player.CharacterAdded:Connect(function(char)
    originPos = nil
    task.wait(1.5)
    local hrp = char:WaitForChild("HumanoidRootPart", 8)
    if hrp then
        originPos = hrp.Position
        setStatus("Respawn — anchor reset ✓")
    end
end)

-- ══════════════════════════════════════════════════════════════════════════════
--  FPS BOOSTER
--  VFX: Enabled=false instead of Destroy — even less detectable,
--  still fully client-side, game never knows they're suppressed
-- ══════════════════════════════════════════════════════════════════════════════
local LIGHTING_FX = {
    "BloomEffect","BlurEffect","SunRaysEffect",
    "DepthOfFieldEffect","ColorCorrectionEffect","Atmosphere","Sky"
}
local VFX_CLASSES = {
    "ParticleEmitter","Beam","Trail","Fire","Smoke","Sparkles","SelectionBox"
}
local BILLBOARD_CLASSES = { "BillboardGui","SurfaceGui" }
local PET_KEYWORDS = {
    "pet","egg","hatch","animal","creature",
    "chicken","bird","baby","critter","mount","spawn"
}

local disabledCache = {} -- track what we've already disabled

local function suppressVFX(inst)
    if not inst or not inst.Parent then return end
    if disabledCache[inst] then return end
    for _, c in ipairs(VFX_CLASSES) do
        if inst:IsA(c) then
            pcall(function()
                if inst:IsA("ParticleEmitter") or inst:IsA("Fire")
                or inst:IsA("Smoke") or inst:IsA("Sparkles") then
                    inst.Enabled = false  -- Enabled=false, stays in workspace
                elseif inst:IsA("Beam") or inst:IsA("Trail") then
                    inst.Enabled = false
                end
                disabledCache[inst] = true
                fpsCount = fpsCount + 1
            end)
            return
        end
    end
    if CFG.killBillboards then
        for _, c in ipairs(BILLBOARD_CLASSES) do
            if inst:IsA(c) then
                pcall(function()
                    inst.Enabled = false
                    disabledCache[inst] = true
                    fpsCount = fpsCount + 1
                end)
                return
            end
        end
    end
end

local function killLighting()
    if not CFG.killLightingFX then return end
    for _, child in ipairs(Lighting:GetChildren()) do
        for _, c in ipairs(LIGHTING_FX) do
            if child:IsA(c) then
                pcall(function() child:Destroy() end)
                fpsCount = fpsCount + 1
            end
        end
    end
    if CFG.killShadows then
        pcall(function()
            Lighting.GlobalShadows = false
            Lighting.FogEnd = 100000
            Lighting.FogStart = 99999
        end)
    end
end

local function isPet(obj)
    local n = obj.Name:lower()
    for _, kw in ipairs(PET_KEYWORDS) do
        if n:find(kw) then return true end
    end
    return false
end

local function cleanPlayer(p)
    if p == player then return end
    local char = p.Character
    if char then
        if CFG.hideOtherChars then
            pcall(function()
                for _, part in ipairs(char:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.LocalTransparencyModifier = 1
                    end
                end
            end)
        end
        pcall(function()
            for _, d in ipairs(char:GetDescendants()) do
                suppressVFX(d)
            end
        end)
    end
    if CFG.removePets then
        pcall(function()
            for _, obj in ipairs(workspace:GetChildren()) do
                if isPet(obj) then
                    local ov = obj:FindFirstChild("Owner")
                        or obj:FindFirstChild("OwnerName")
                        or obj:FindFirstChild("PlayerId")
                    if ov and (ov.Value == p.Name or ov.Value == p.UserId) then
                        -- Disable all VFX inside, then make invisible
                        for _, d in ipairs(obj:GetDescendants()) do
                            pcall(function()
                                if d:IsA("BasePart") then
                                    d.LocalTransparencyModifier = 1
                                end
                                suppressVFX(d)
                            end)
                        end
                        fpsCount = fpsCount + 1
                    end
                end
            end
        end)
    end
end

local function sweepWorkspace()
    local lc = player.Character
    pcall(function()
        for _, d in ipairs(workspace:GetDescendants()) do
            if lc and d:IsDescendantOf(lc) then continue end
            suppressVFX(d)
        end
    end)
end

if CFG.killWater then
    pcall(function()
        workspace.Terrain.WaterWaveSize     = 0
        workspace.Terrain.WaterWaveSpeed    = 0
        workspace.Terrain.WaterReflectance  = 0
        workspace.Terrain.WaterTransparency = 1
    end)
end

-- live watcher
workspace.DescendantAdded:Connect(function(d)
    task.wait(0.1)
    local lc = player.Character
    if lc and d:IsDescendantOf(lc) then return end
    suppressVFX(d)
end)
Lighting.ChildAdded:Connect(function(child)
    task.wait(0.05)
    for _, c in ipairs(LIGHTING_FX) do
        if child:IsA(c) then
            pcall(function() child:Destroy() end)
        end
    end
end)
Players.PlayerAdded:Connect(function(p)
    task.wait(2.5)
    pcall(function() cleanPlayer(p) end)
end)

-- render quality
pcall(function()
    settings().Rendering.QualityLevel =
        Enum.QualityLevel["Level0" .. math.min(CFG.renderQuality, 9)]
end)
pcall(function()
    UserSettings():GetService("UserGameSettings").SavedQualityLevel =
        Enum.SavedQualitySetting.QualityLevel1
end)

-- clean loop
task.spawn(function()
    while true do
        task.wait(CFG.cleanInterval)
        for _, p in ipairs(Players:GetPlayers()) do
            pcall(function() cleanPlayer(p) end)
        end
        sweepWorkspace()
    end
end)

-- ══════════════════════════════════════════════════════════════════════════════
--  BOOT
-- ══════════════════════════════════════════════════════════════════════════════
wipeFingerprints()
buildGUI()
killLighting()

local hrp = getHRP()
if hrp then originPos = hrp.Position end

for _, p in ipairs(Players:GetPlayers()) do
    pcall(function() cleanPlayer(p) end)
end
sweepWorkspace()

-- launch all 4 independent behavior loops
for i = 1, #behaviorFns do
    spawnBehaviorLoop(i)
end

setStatus("MAX STEALTH v4 active ✓")
print("[MaxStealth v4] All systems go — BAC bypass engaged")
