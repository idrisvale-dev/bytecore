-- language: Lua (Roblox LocalScript), target: Steal an Egg, executor: any
-- ANTI-KICK: 8 systems — Gaussian engine, Idle bypass, RemoteFunction
--            auto-respond, RemoteEvent intercept, Tool cycle, Physics nudge,
--            Kick metatable hook, Respawn recovery
-- FPS: 14 techniques — VFX, Lights, Sounds, Textures, Distance cull,
--      RenderFidelity, Billboards, Pets, Water, Lighting FX, Shadows, Quality

local Players  = game:GetService("Players")
local RunSvc   = game:GetService("RunService")
local Lighting = game:GetService("Lighting")
local SoundSvc = game:GetService("SoundService")

local player   = Players.LocalPlayer
local plrGui   = player:WaitForChild("PlayerGui")

-- ══════════════════════════════════════════════════════════════════
--  CONFIG
-- ══════════════════════════════════════════════════════════════════
local CFG = {
    stepMean  = 25,  stepSd  = 5,
    camMean   = 13,  camSd   = 4,
    animMean  = 55,  animSd  = 12,
    jumpMean  = 190, jumpSd  = 28,
    toolMean  = 300, toolSd  = 55,
    nudgeMean = 90,  nudgeSd = 18,

    stepRange           = 0.35,
    renderQuality       = 1,
    killLightingFX      = true,
    killShadows         = true,
    killWater           = true,
    killVFX             = true,
    killBillboards      = true,
    killLights          = true,
    killSounds          = true,
    killTextures        = true,
    killViewports       = true,
    forceRenderFidelity = true,
    cullDistance        = 80,
    removePets          = true,
    hideOtherChars      = false,
    cleanInterval       = 7,
}

-- ══════════════════════════════════════════════════════════════════
--  GAUSSIAN — Box-Muller
-- ══════════════════════════════════════════════════════════════════
local function gauss(mean, sd)
    local u1 = math.max(1e-10, math.random())
    local u2 = math.random()
    local z  = math.sqrt(-2 * math.log(u1)) * math.cos(2 * math.pi * u2)
    return math.max(mean * 0.35, mean + z * sd)
end

-- ══════════════════════════════════════════════════════════════════
--  STATE
-- ══════════════════════════════════════════════════════════════════
local startTime  = os.time()
local idleBlocks = 0
local fpsCount   = 0
local originPos  = nil
local stepDir    = 1
local guiOpen    = true
local statusLbl  = nil
local uptimeLbl  = nil
local fpsLbl     = nil
local suppressed = {}

-- ══════════════════════════════════════════════════════════════════
--  HELPERS
-- ══════════════════════════════════════════════════════════════════
local function getChar() return player.Character end
local function getHum()
    local c = getChar(); return c and c:FindFirstChildOfClass("Humanoid")
end
local function getHRP()
    local c = getChar(); return c and c:FindFirstChild("HumanoidRootPart")
end
local function isAlive()
    local h = getHum(); return h and h.Health > 0
end
local function isGrounded()
    local h = getHum(); if not h then return false end
    local s = h:GetState()
    return s == Enum.HumanoidStateType.Running
        or s == Enum.HumanoidStateType.Standing
        or s == Enum.HumanoidStateType.RunningNoPhysics
end
local function setStatus(s)
    if statusLbl and statusLbl.Parent then statusLbl.Text = ">> " .. s end
end

-- ══════════════════════════════════════════════════════════════════
--  FINGERPRINT WIPE
-- ══════════════════════════════════════════════════════════════════
local function wipeFingerprints()
    pcall(function()
        local env = getgenv and getgenv() or {}
        for _, k in ipairs({
            "syn","SYNAPSE_RUNNING","KRNL_LOADED","is_sirhurt_closure",
            "pebc_loaded","Oxygen","fluxus","evon","wave","trigon",
            "Script_Ware","SCRIPTWARE","SCRIPTWARE_VERSION","DELTA_LOADED"
        }) do pcall(function() env[k] = nil end) end
    end)
end

-- ══════════════════════════════════════════════════════════════════
--  GUI — ASCII markers, collapsible, CoreGui, randomized name
-- ══════════════════════════════════════════════════════════════════
local function buildGUI()
    local parent = plrGui
    pcall(function() parent = game:GetService("CoreGui") end)
    pcall(function()
        for _, v in ipairs(parent:GetChildren()) do
            if v.Name:sub(1,5) == "__mxv" then v:Destroy() end
        end
    end)

    local rname = "__mxv" .. math.random(10000, 99999)
    local gui   = Instance.new("ScreenGui", parent)
    gui.Name            = rname
    gui.ResetOnSpawn    = false
    gui.ZIndexBehavior  = Enum.ZIndexBehavior.Sibling
    pcall(function()
        if syn and syn.protect_gui then syn.protect_gui(gui)
        elseif protect_gui then protect_gui(gui) end
    end)

    -- toggle button
    local btn = Instance.new("TextButton", gui)
    btn.Size                = UDim2.new(0, 36, 0, 22)
    btn.Position            = UDim2.new(1, -42, 0, 8)
    btn.BackgroundColor3    = Color3.fromRGB(14, 14, 22)
    btn.BackgroundTransparency = 0.1
    btn.Text                = "[ X ]"
    btn.TextColor3          = Color3.fromRGB(80, 200, 255)
    btn.Font                = Enum.Font.Code
    btn.TextSize            = 11
    btn.BorderSizePixel     = 0
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 5)

    -- panel
    local frame = Instance.new("Frame", gui)
    frame.Size                   = UDim2.new(0, 240, 0, 178)
    frame.Position               = UDim2.new(1, -248, 0, 34)
    frame.BackgroundColor3       = Color3.fromRGB(6, 6, 12)
    frame.BackgroundTransparency = 0.08
    frame.BorderSizePixel        = 0
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 8)

    local stroke        = Instance.new("UIStroke", frame)
    stroke.Color        = Color3.fromRGB(40, 160, 240)
    stroke.Thickness    = 1
    stroke.Transparency = 0.4

    -- header bar
    local hbar = Instance.new("Frame", frame)
    hbar.Size             = UDim2.new(1, 0, 0, 22)
    hbar.BackgroundColor3 = Color3.fromRGB(18, 18, 32)
    hbar.BorderSizePixel  = 0
    Instance.new("UICorner", hbar).CornerRadius = UDim.new(0, 8)

    local htitle = Instance.new("TextLabel", hbar)
    htitle.Size                 = UDim2.new(1, -8, 1, 0)
    htitle.Position             = UDim2.new(0, 8, 0, 0)
    htitle.Text                 = "[ MAX STEALTH v5  //  BAC BYPASS ]"
    htitle.TextColor3           = Color3.fromRGB(80, 210, 255)
    htitle.BackgroundTransparency = 1
    htitle.Font                 = Enum.Font.Code
    htitle.TextSize             = 11
    htitle.TextXAlignment       = Enum.TextXAlignment.Left

    -- rows
    local function row(txt, y, col)
        local l = Instance.new("TextLabel", frame)
        l.Size                  = UDim2.new(1, -12, 0, 18)
        l.Position              = UDim2.new(0, 6, 0, y)
        l.Text                  = txt
        l.TextColor3            = col or Color3.fromRGB(210, 210, 210)
        l.BackgroundTransparency = 1
        l.Font                  = Enum.Font.Code
        l.TextSize              = 10
        l.TextXAlignment        = Enum.TextXAlignment.Left
        l.TextTruncate          = Enum.TextTruncate.AtEnd
        return l
    end

    statusLbl = row(">> Booting...", 26, Color3.fromRGB(255, 255, 255))
    uptimeLbl = row("TIME  00:00:00   BLOCKS  0", 46, Color3.fromRGB(160, 160, 160))
    fpsLbl    = row("CLEANED  0 objects", 64, Color3.fromRGB(90, 240, 150))

    -- divider
    local div = Instance.new("Frame", frame)
    div.Size             = UDim2.new(1, -12, 0, 1)
    div.Position         = UDim2.new(0, 6, 0, 85)
    div.BackgroundColor3 = Color3.fromRGB(40, 80, 120)
    div.BorderSizePixel  = 0

    -- status rows — [ON] / [OFF] style
    local function srow(label, val, y, col)
        local state = val and "[ON] " or "[--] "
        return row(state .. label, y, col or (val
            and Color3.fromRGB(90, 240, 150)
            or  Color3.fromRGB(140, 140, 140)))
    end

    srow("Gaussian timing",       true,  90)
    srow("No VirtualUser",        true,  105)
    srow("RemoteFunction hook",   true,  120)
    srow("Tool cycle",            true,  135)
    srow("Kick metatable hook",   true,  150)
    srow("FPS — 14 techniques",   true,  165, Color3.fromRGB(90, 200, 255))

    btn.MouseButton1Click:Connect(function()
        guiOpen = not guiOpen
        frame.Visible = guiOpen
        btn.Text = guiOpen and "[ X ]" or "[ - ]"
    end)

    task.spawn(function()
        while gui.Parent do
            task.wait(1)
            local e = os.time() - startTime
            uptimeLbl.Text = string.format(
                "TIME  %02d:%02d:%02d   BLOCKS  %d",
                math.floor(e/3600), math.floor((e%3600)/60), e%60, idleBlocks
            )
            fpsLbl.Text = "CLEANED  " .. fpsCount .. " objects"
        end
    end)
end

-- ══════════════════════════════════════════════════════════════════
--  ANTI-KICK 1 — GAUSSIAN BEHAVIOR ENGINE
-- ══════════════════════════════════════════════════════════════════
local function doStep()
    if not isAlive() then return end
    local hrp = getHRP(); local hum = getHum()
    if not hrp or not hum then return end
    if not originPos then originPos = hrp.Position end
    local nx = stepDir * CFG.stepRange * (0.3 + math.random() * 0.7)
    local nz = (math.random() - 0.5) * 0.12
    stepDir  = stepDir * -1
    hum:MoveTo(originPos + Vector3.new(nx, 0, nz))
    setStatus(string.format("step  %.2fst -> server: legit", nx))
end

local function doCam()
    pcall(function()
        local cam = workspace.CurrentCamera
        cam.CFrame = cam.CFrame * CFrame.Angles(
            math.rad((math.random()-0.5)*0.16),
            math.rad((math.random()-0.5)*0.16), 0
        )
    end)
    setStatus("camera micro-drift")
end

local function doAnim()
    if not isAlive() then return end
    pcall(function()
        local hum = getHum(); if not hum then return end
        local animator = hum:FindFirstChildOfClass("Animator")
        if not animator then return end
        local animObj = Instance.new("Animation")
        animObj.AnimationId = "rbxassetid://507766388"
        local track = animator:LoadAnimation(animObj)
        track:Play(); task.wait(0.8)
        pcall(function() track:Stop() end)
        pcall(function() animObj:Destroy() end)
    end)
    setStatus("animator keepalive")
end

local function doJump()
    if not isAlive() or not isGrounded() then return end
    pcall(function()
        local hum = getHum(); local hrp = getHRP()
        if not hum or not hrp then return end
        hum:ChangeState(Enum.HumanoidStateType.Jumping)
        task.wait(0.7)
        if originPos then hum:MoveTo(originPos) end
    end)
    setStatus("jump simulated")
end

local bList = {
    {fn=doStep, mean=CFG.stepMean, sd=CFG.stepSd},
    {fn=doCam,  mean=CFG.camMean,  sd=CFG.camSd},
    {fn=doAnim, mean=CFG.animMean, sd=CFG.animSd},
    {fn=doJump, mean=CFG.jumpMean, sd=CFG.jumpSd},
}
for _, b in ipairs(bList) do
    task.spawn(function()
        while true do
            task.wait(gauss(b.mean, b.sd))
            pcall(b.fn)
        end
    end)
end

-- ══════════════════════════════════════════════════════════════════
--  ANTI-KICK 2 — IDLE EVENT -> MOVETO
-- ══════════════════════════════════════════════════════════════════
player.Idled:Connect(function()
    idleBlocks = idleBlocks + 1
    setStatus("idle blocked #" .. idleBlocks)
    pcall(function()
        local hrp = getHRP(); local hum = getHum()
        if hrp and hum and hum.Health > 0 then
            hum:MoveTo(hrp.Position + Vector3.new(0.07, 0, 0))
        end
    end)
end)

-- ══════════════════════════════════════════════════════════════════
--  ANTI-KICK 3 — REMOTEFUNCTION AUTO-RESPOND
-- ══════════════════════════════════════════════════════════════════
local function hookRF(rf)
    pcall(function()
        rf.OnClientInvoke = function(...) return true, "active" end
    end)
end

local function hookAllRFs()
    pcall(function()
        for _, s in ipairs({workspace, game:GetService("ReplicatedStorage")}) do
            for _, rf in ipairs(s:GetDescendants()) do
                if rf:IsA("RemoteFunction") then hookRF(rf) end
            end
        end
    end)
end

workspace.DescendantAdded:Connect(function(d)
    if d:IsA("RemoteFunction") then task.wait(0.1); hookRF(d) end
end)

-- ══════════════════════════════════════════════════════════════════
--  ANTI-KICK 4 — REMOTEEVENT AFK INTERCEPT
-- ══════════════════════════════════════════════════════════════════
local function hookRE(re)
    pcall(function()
        re.OnClientEvent:Connect(function(...)
            for _, v in ipairs({...}) do
                if type(v) == "string" then
                    local low = v:lower()
                    if low:find("afk") or low:find("idle") or low:find("warn")
                    or low:find("kick") or low:find("cheat") then
                        pcall(function() re:FireServer("active") end)
                        pcall(function() re:FireServer(true) end)
                        idleBlocks = idleBlocks + 1
                        setStatus("remote AFK intercepted")
                    end
                end
            end
        end)
    end)
end

local function hookAllREs()
    pcall(function()
        for _, s in ipairs({workspace, game:GetService("ReplicatedStorage")}) do
            for _, re in ipairs(s:GetDescendants()) do
                if re:IsA("RemoteEvent") then hookRE(re) end
            end
        end
    end)
end

workspace.DescendantAdded:Connect(function(d)
    if d:IsA("RemoteEvent") then task.wait(0.1); hookRE(d) end
end)

-- ══════════════════════════════════════════════════════════════════
--  ANTI-KICK 5 — TOOL CYCLE
-- ══════════════════════════════════════════════════════════════════
task.spawn(function()
    while true do
        task.wait(gauss(CFG.toolMean, CFG.toolSd))
        if not isAlive() then continue end
        pcall(function()
            local bp  = player:FindFirstChildOfClass("Backpack")
            local hum = getHum()
            if not bp or not hum then return end
            local tool = bp:FindFirstChildOfClass("Tool")
            if not tool then return end
            hum:EquipTool(tool)
            task.wait(0.35 + math.random() * 0.3)
            hum:UnequipTools()
            setStatus("tool cycle fired")
        end)
    end
end)

-- ══════════════════════════════════════════════════════════════════
--  ANTI-KICK 6 — PHYSICS NUDGE
-- ══════════════════════════════════════════════════════════════════
task.spawn(function()
    while true do
        task.wait(gauss(CFG.nudgeMean, CFG.nudgeSd))
        if not isAlive() then continue end
        pcall(function()
            local hrp = getHRP(); if not hrp then return end
            hrp.AssemblyLinearVelocity = Vector3.new(0.01, 0, 0)
            task.wait(0.05)
            hrp.AssemblyLinearVelocity = Vector3.zero
            setStatus("physics packet alive")
        end)
    end
end)

-- ══════════════════════════════════════════════════════════════════
--  ANTI-KICK 7 — KICK METATABLE HOOK
-- ══════════════════════════════════════════════════════════════════
pcall(function()
    if not (getrawmetatable and setreadonly and newcclosure) then return end
    local mt = getrawmetatable(player)
    setreadonly(mt, false)
    local old_nc = mt.__namecall
    mt.__namecall = newcclosure(function(self, ...)
        local method = getnamecallmethod and getnamecallmethod() or ""
        if method:lower() == "kick" then
            idleBlocks = idleBlocks + 1
            setStatus("kick swallowed #" .. idleBlocks)
            return
        end
        return old_nc(self, ...)
    end)
    setreadonly(mt, true)
    print("[MaxStealth v5] kick hook installed")
end)

-- ══════════════════════════════════════════════════════════════════
--  ANTI-KICK 8 — RESPAWN RECOVERY
-- ══════════════════════════════════════════════════════════════════
player.CharacterAdded:Connect(function(char)
    originPos = nil
    task.wait(1.5)
    local hrp = char:WaitForChild("HumanoidRootPart", 8)
    if hrp then
        originPos = hrp.Position
        setStatus("respawn anchor reset")
    end
    task.wait(1)
    hookAllRFs()
    hookAllREs()
end)

-- ══════════════════════════════════════════════════════════════════
--  FPS SYSTEM
-- ══════════════════════════════════════════════════════════════════
local LIGHTING_FX   = {"BloomEffect","BlurEffect","SunRaysEffect",
                        "DepthOfFieldEffect","ColorCorrectionEffect","Atmosphere","Sky"}
local VFX_CLASSES   = {"ParticleEmitter","Beam","Trail","Fire",
                        "Smoke","Sparkles","SelectionBox"}
local BILLBOARD_CLS = {"BillboardGui","SurfaceGui"}
local LIGHT_CLS     = {"PointLight","SpotLight","SurfaceLight"}
local TEXTURE_CLS   = {"Decal","Texture"}
local PET_KEYWORDS  = {"pet","egg","hatch","animal","creature",
                        "chicken","bird","baby","critter","mount","spawn","npc"}

-- FPS-1: render quality
pcall(function()
    settings().Rendering.QualityLevel =
        Enum.QualityLevel["Level0" .. math.min(CFG.renderQuality, 9)]
end)
pcall(function()
    UserSettings():GetService("UserGameSettings").SavedQualityLevel =
        Enum.SavedQualitySetting.QualityLevel1
end)

-- FPS-2: lighting + shadows
local function killLighting()
    if not CFG.killLightingFX then return end
    for _, child in ipairs(Lighting:GetChildren()) do
        for _, c in ipairs(LIGHTING_FX) do
            if child:IsA(c) then
                pcall(function() child:Destroy(); fpsCount += 1 end)
            end
        end
    end
    if CFG.killShadows then
        pcall(function()
            Lighting.GlobalShadows  = false
            Lighting.FogEnd         = 100000
            Lighting.FogStart       = 99999
            Lighting.Brightness     = 0.5
            Lighting.Ambient        = Color3.fromRGB(180,180,180)
            Lighting.OutdoorAmbient = Color3.fromRGB(140,140,140)
        end)
    end
end

-- FPS-3: water
if CFG.killWater then
    pcall(function()
        workspace.Terrain.WaterWaveSize     = 0
        workspace.Terrain.WaterWaveSpeed    = 0
        workspace.Terrain.WaterReflectance  = 0
        workspace.Terrain.WaterTransparency = 1
    end)
end

-- FPS-4: sounds
local function muteSounds()
    if not CFG.killSounds then return end
    pcall(function()
        for _, s in ipairs(workspace:GetDescendants()) do
            if s:IsA("Sound") then
                pcall(function()
                    s.Volume = 0
                    s.RollOffMaxDistance = 0
                end)
            end
        end
        SoundSvc.AmbientReverb = Enum.ReverbType.NoReverb
    end)
end

-- FPS-5 to 11: universal suppressor
local function suppressInst(inst)
    if not inst or not inst.Parent then return end
    if suppressed[inst] then return end
    local lc = getChar()
    if lc and inst:IsDescendantOf(lc) then return end

    for _, c in ipairs(VFX_CLASSES) do
        if inst:IsA(c) then
            pcall(function()
                if inst:IsA("SelectionBox") then
                    inst.Visible = false
                else
                    inst.Enabled = false
                end
                suppressed[inst] = true
                fpsCount += 1
            end)
            return
        end
    end
    if CFG.killBillboards then
        for _, c in ipairs(BILLBOARD_CLS) do
            if inst:IsA(c) then
                pcall(function()
                    inst.Enabled = false
                    suppressed[inst] = true
                    fpsCount += 1
                end)
                return
            end
        end
    end
    if CFG.killViewports and inst:IsA("ViewportFrame") then
        pcall(function()
            inst.Visible = false
            suppressed[inst] = true
            fpsCount += 1
        end)
        return
    end
    if CFG.killLights then
        for _, c in ipairs(LIGHT_CLS) do
            if inst:IsA(c) then
                pcall(function()
                    inst.Enabled = false
                    suppressed[inst] = true
                    fpsCount += 1
                end)
                return
            end
        end
    end
    if CFG.killTextures then
        for _, c in ipairs(TEXTURE_CLS) do
            if inst:IsA(c) then
                pcall(function()
                    inst.Transparency = 1
                    suppressed[inst] = true
                    fpsCount += 1
                end)
                return
            end
        end
    end
    if CFG.forceRenderFidelity and inst:IsA("MeshPart") then
        pcall(function()
            inst.RenderFidelity = Enum.RenderFidelity.Automatic
        end)
    end
    if CFG.killSounds and inst:IsA("Sound") then
        pcall(function()
            inst.Volume = 0
            inst.RollOffMaxDistance = 0
        end)
    end
end

-- FPS-12: distance cull
local function doCull()
    local hrp = getHRP(); if not hrp then return end
    local pos = hrp.Position
    pcall(function()
        for _, p in ipairs(Players:GetPlayers()) do
            if p == player then continue end
            local c = p.Character; if not c then continue end
            local cHRP = c:FindFirstChild("HumanoidRootPart")
            local dist = cHRP and (cHRP.Position - pos).Magnitude or 999
            local hide = dist > CFG.cullDistance
            for _, part in ipairs(c:GetDescendants()) do
                if part:IsA("BasePart") then
                    pcall(function()
                        part.LocalTransparencyModifier = hide and 1 or 0
                    end)
                end
            end
        end
    end)
end

-- FPS-13: pets
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
            for _, d in ipairs(char:GetDescendants()) do suppressInst(d) end
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
                        for _, d in ipairs(obj:GetDescendants()) do
                            if d:IsA("BasePart") then
                                pcall(function()
                                    d.LocalTransparencyModifier = 1
                                end)
                            end
                            suppressInst(d)
                        end
                        fpsCount += 1
                    end
                end
            end
        end)
    end
end

local function sweepWorkspace()
    local lc = getChar()
    pcall(function()
        for _, d in ipairs(workspace:GetDescendants()) do
            if lc and d:IsDescendantOf(lc) then continue end
            suppressInst(d)
        end
    end)
end

-- FPS-14: live watchers
workspace.DescendantAdded:Connect(function(d)
    task.wait(0.08)
    local lc = getChar()
    if lc and d:IsDescendantOf(lc) then return end
    suppressInst(d)
end)

Lighting.ChildAdded:Connect(function(child)
    task.wait(0.05)
    for _, c in ipairs(LIGHTING_FX) do
        if child:IsA(c) then pcall(function() child:Destroy() end) end
    end
end)

Players.PlayerAdded:Connect(function(p)
    task.wait(2.5)
    pcall(function() cleanPlayer(p) end)
end)

-- clean loop
task.spawn(function()
    while true do
        task.wait(CFG.cleanInterval)
        for _, p in ipairs(Players:GetPlayers()) do
            pcall(function() cleanPlayer(p) end)
        end
        sweepWorkspace()
        doCull()
        muteSounds()
    end
end)

-- ══════════════════════════════════════════════════════════════════
--  BOOT
-- ══════════════════════════════════════════════════════════════════
wipeFingerprints()
buildGUI()
killLighting()
muteSounds()
hookAllRFs()
hookAllREs()

local hrp = getHRP()
if hrp then originPos = hrp.Position end

for _, p in ipairs(Players:GetPlayers()) do
    pcall(function() cleanPlayer(p) end)
end
sweepWorkspace()

setStatus("all 8+14 systems active")
print("[MaxStealth v5] running — clean build, no emoji")
