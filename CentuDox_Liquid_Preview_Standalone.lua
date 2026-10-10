
local Library = {}
local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer
local UserInputService = game:GetService("UserInputService")
local Lighting = game:GetService("Lighting")
-- Use executor globals when available, with a fallback for normal client-side testing.
local getgenv = getgenv or function() return _G end

---------
local HttpService = game:GetService("HttpService")

local isfolder = isfolder or function() return false end
local makefolder = makefolder or function() end
local writefile = writefile or function() end
local readfile = readfile or function() return "" end
local isfile = isfile or function() return false end

Library.ConfigFolder = "HubPremium_Configs"
Library.ConfigElements = {}



local saveTick = 0
function Library:AutoSave()
    if Library.IsLoading then return end
    saveTick = tick()
    task.delay(0.5, function()
        if tick() - saveTick >= 0.45 then
            Library:SaveConfig("AutoSave", true)
        end
    end)
end
---------

---------
local UI_Elements = {
    AnimatedGradients = {},
    AnimatedStrokes = {},
    RowStrokes = {},
    RowStrokeGradients = {},
    DivGradients = {},
    TabGradients = {},
    Switches = {},
    TextGradients = {},
    RotatingGradients = {},
    Containers = {},
    TabBackgrounds = {},
    PageElements = {},
    Descriptions = {},
    TabIcons = {},
    TextObjects = {}
}
---------


---------
local CurrentTheme = "Liquid"
local Notifications = {}

local exactFruitSeq = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromHex("#B4DCFF")), 
    ColorSequenceKeypoint.new(0.5, Color3.fromHex("#FFFFFF")), 
    ColorSequenceKeypoint.new(1, Color3.fromHex("#B4DCFF"))
})


---------
local Themes = {
    ["Ocean"] = {
        MainBg = Color3.fromHex("#D3D3D3"),
        MainBgTrans = 0.3,
        ContainerBg = Color3.fromHex("#FFFFFF"),
        ContainerTrans = 0.8,
        TextColor = Color3.fromHex("#FFFFFF"),
        DescTextColor = Color3.fromHex("#969696"),
        MainStroke = Color3.fromHex("#FFFFFF"),
        TextContrast = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromHex("#B4DCFF")),
            ColorSequenceKeypoint.new(0.50, Color3.fromHex("#B4DCFF")),
            ColorSequenceKeypoint.new(1, Color3.fromHex("#FFFFFF"))
        }),
        Wave = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromHex("#E0F0FF")),
            ColorSequenceKeypoint.new(0.5, Color3.fromHex("#FFFFFF")),
            ColorSequenceKeypoint.new(1, Color3.fromHex("#E0F0FF"))
        }),
        TitleStroke = Color3.fromHex("#ADD8E6"),
        TextGrad = exactFruitSeq,
        TabGrad = exactFruitSeq,
        DivGrad = exactFruitSeq,
        RowStroke = Color3.fromHex("#ADD8E6"),
        RowStrokeGrad = exactFruitSeq,
        ToggleActive = Color3.fromHex("#96C8DC"),
        LoopSeq = exactFruitSeq,
        SearchIconColor = Color3.fromHex("#333333")
    },
 
    ["Dream"] = {
        MainBg = Color3.fromHex("#0A1428"),
        MainBgTrans = 0.2,
        ContainerBg = Color3.fromHex("#151C3B"),
        ContainerTrans = 0.5,
        TextColor = Color3.fromHex("#E6FFFF"),
        DescTextColor = Color3.fromHex("#FFFFFF"),
        MainStroke = Color3.fromHex("#D3D3D3"),
        TextContrast = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromHex("#46E6FF")),
            ColorSequenceKeypoint.new(0.50, Color3.fromHex("#8C64FF")),
            ColorSequenceKeypoint.new(1, Color3.fromHex("#46E6FF"))
        }),
        Wave = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromHex("#151C3B")),
            ColorSequenceKeypoint.new(0.5, Color3.fromHex("#46E6FF")),
            ColorSequenceKeypoint.new(1, Color3.fromHex("#151C3B"))
        }),
        TitleStroke = Color3.fromHex("#140A32"),
        TextGrad = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromHex("#B4FFFF")),
            ColorSequenceKeypoint.new(0.5, Color3.fromHex("#A08CFF")),
            ColorSequenceKeypoint.new(1, Color3.fromHex("#8C64FF"))
        }),
        TabGrad = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromHex("#46E6FF")),
            ColorSequenceKeypoint.new(0.5, Color3.fromHex("#8C64FF")),
            ColorSequenceKeypoint.new(1, Color3.fromHex("#46E6FF"))
        }),
        DivGrad = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromHex("#151C3B")),
            ColorSequenceKeypoint.new(0.5, Color3.fromHex("#8C64FF")),
            ColorSequenceKeypoint.new(1, Color3.fromHex("#151C3B"))
        }),
        RowStroke = Color3.fromHex("#808080"),
        RowStrokeGrad = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromHex("#46E6FF")),
            ColorSequenceKeypoint.new(0.5, Color3.fromHex("#8C64FF")),
            ColorSequenceKeypoint.new(1, Color3.fromHex("#46E6FF"))
        }),
        ToggleActive = Color3.fromHex("#8C64FF"),
        LoopSeq = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromHex("#8C64FF")),
            ColorSequenceKeypoint.new(0.5, Color3.fromHex("#46E6FF")),
            ColorSequenceKeypoint.new(1, Color3.fromHex("#8C64FF"))
        }),
        SearchIconColor = Color3.fromHex("#8C64FF")
    },

    ["Dark"] = {
        MainBg = Color3.fromHex("#000000"),
        MainBgTrans = 0.3,
        ContainerBg = Color3.fromHex("#525252"), 
        ContainerTrans = 0.6,
        TextColor = Color3.fromHex("#FFFFFF"),
        DescTextColor = Color3.fromHex("#FFFFFF"),
        MainStroke = Color3.fromHex("#FFFFFF"), 
        TextContrast = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromHex("#808080")),
            ColorSequenceKeypoint.new(0.50, Color3.fromHex("#D3D3D3")),
            ColorSequenceKeypoint.new(1, Color3.fromHex("#000000"))
        }),
        Wave = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromHex("#0D0D0D")), 
            ColorSequenceKeypoint.new(0.5, Color3.fromHex("#1A1A1A")),
            ColorSequenceKeypoint.new(1, Color3.fromHex("#0D0D0D"))
        }),
        TitleStroke = Color3.fromHex("#222222"),
        TextGrad = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromHex("#FFFFFF")), 
            ColorSequenceKeypoint.new(0.5, Color3.fromHex("#8A8A8A")), 
            ColorSequenceKeypoint.new(1, Color3.fromHex("#1A1A1A")) 
        }),
        TabGrad = ColorSequence.new({ 
            ColorSequenceKeypoint.new(0, Color3.fromHex("#FFFFFF")),
            ColorSequenceKeypoint.new(0.5, Color3.fromHex("#777777")),
            ColorSequenceKeypoint.new(1, Color3.fromHex("#FFFFFF"))
        }),
        DivGrad = ColorSequence.new({ 
            ColorSequenceKeypoint.new(0, Color3.fromHex("#222222")),
            ColorSequenceKeypoint.new(0.5, Color3.fromHex("#888888")),
            ColorSequenceKeypoint.new(1, Color3.fromHex("#222222"))
        }),
        RowStroke = Color3.fromHex("#FFFFFF"), 
        RowStrokeGrad = ColorSequence.new({ 
            ColorSequenceKeypoint.new(0, Color3.fromHex("#FFFFFF")), 
            ColorSequenceKeypoint.new(0.5, Color3.fromHex("#555555")), 
            ColorSequenceKeypoint.new(1, Color3.fromHex("#54626F")) 
        }),
        ToggleActive = Color3.fromHex("#888888"),
        LoopSeq = ColorSequence.new({ 
            ColorSequenceKeypoint.new(0, Color3.fromHex("#AAAAAA")),
            ColorSequenceKeypoint.new(0.5, Color3.fromHex("#222222")),
            ColorSequenceKeypoint.new(1, Color3.fromHex("#000000"))
        }),
        SearchIconColor = Color3.fromHex("#FFFFFF")
    }
}

-- Liquid Glass theme: dark translucent surfaces, cool blue highlights, and soft borders.
Themes["Liquid"] = {
    MainBg = Color3.fromHex("#101A2A"),
    MainBgTrans = 0.20,
    ContainerBg = Color3.fromHex("#B9D8F5"),
    ContainerTrans = 0.86,
    TextColor = Color3.fromHex("#F4F8FF"),
    DescTextColor = Color3.fromHex("#BDD0E5"),
    MainStroke = Color3.fromHex("#B8DFFF"),
    TextContrast = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromHex("#F8FBFF")),
        ColorSequenceKeypoint.new(0.50, Color3.fromHex("#D3E8FF")),
        ColorSequenceKeypoint.new(1, Color3.fromHex("#9CCBFF"))
    }),
    Wave = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromHex("#101A2A")),
        ColorSequenceKeypoint.new(0.5, Color3.fromHex("#263B56")),
        ColorSequenceKeypoint.new(1, Color3.fromHex("#101A2A"))
    }),
    TitleStroke = Color3.fromHex("#16273D"),
    TextGrad = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromHex("#FFFFFF")),
        ColorSequenceKeypoint.new(0.5, Color3.fromHex("#D8EAFF")),
        ColorSequenceKeypoint.new(1, Color3.fromHex("#A8D1FF"))
    }),
    TabGrad = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromHex("#82C7FF")),
        ColorSequenceKeypoint.new(0.5, Color3.fromHex("#E4F3FF")),
        ColorSequenceKeypoint.new(1, Color3.fromHex("#5CAEFF"))
    }),
    DivGrad = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromHex("#13243A")),
        ColorSequenceKeypoint.new(0.5, Color3.fromHex("#B6DCFF")),
        ColorSequenceKeypoint.new(1, Color3.fromHex("#13243A"))
    }),
    RowStroke = Color3.fromHex("#8BBCE8"),
    RowStrokeGrad = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromHex("#5BAEFF")),
        ColorSequenceKeypoint.new(0.5, Color3.fromHex("#D6ECFF")),
        ColorSequenceKeypoint.new(1, Color3.fromHex("#5BAEFF"))
    }),
    ToggleActive = Color3.fromHex("#37A4FF"),
    LoopSeq = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromHex("#5BAEFF")),
        ColorSequenceKeypoint.new(0.5, Color3.fromHex("#D9EEFF")),
        ColorSequenceKeypoint.new(1, Color3.fromHex("#5BAEFF"))
    }),
    SearchIconColor = Color3.fromHex("#DCEEFF")
}
---------
local CurrentFont = Font.fromName("FredokaOne", Enum.FontWeight.Bold)
local CurrentFontScale = 1

local function ApplyTextGradient(obj)
    if obj:IsA("TextLabel") or obj:IsA("TextButton") or obj:IsA("TextBox") then
        obj.FontFace = CurrentFont
        obj.TextColor3 = Themes[CurrentTheme].TextColor
        
        local grad = Instance.new("UIGradient", obj)
        grad.Rotation = 90
        grad.Color = Themes[CurrentTheme].TextContrast
        table.insert(UI_Elements.TextGradients, grad)
        
        local shadow = Instance.new("UIStroke")
        shadow.Color = Themes[CurrentTheme].ToggleActive
        shadow.Thickness = 0.2
        shadow.Transparency = 0
        shadow.Parent = obj

        task.defer(function()
            if not obj or not obj.Parent then return end
            local base = obj.TextSize
            table.insert(UI_Elements.TextObjects, {Obj = obj, BaseSize = base})
            if CurrentFontScale ~= 1 then
                obj.TextSize = math.clamp(math.round(base * CurrentFontScale), 6, 60)
            end
        end)
    end
end

function Library:ApplyFont(fontName)
    local success, newFont = pcall(function()
        return Font.fromName(fontName, Enum.FontWeight.Bold)
    end)
    if not success or not newFont then
        newFont = Font.fromName(fontName)
    end
    CurrentFont = newFont
    for _, item in ipairs(UI_Elements.TextObjects) do
        if item.Obj and item.Obj.Parent then
            item.Obj.FontFace = newFont
        end
    end
end

function Library:ApplyFontScale(percent)
    CurrentFontScale = percent / 100
    for _, item in ipairs(UI_Elements.TextObjects) do
        if item.Obj and item.Obj.Parent then
            item.Obj.TextSize = math.clamp(math.round(item.BaseSize * CurrentFontScale), 6, 60)
        end
    end
end
Library.IsLoading = false

function Library:SaveConfig(fileName, silent)
    if not isfolder(Library.ConfigFolder) then
        makefolder(Library.ConfigFolder)
    end
    local data = {}
    for flag, element in pairs(Library.ConfigElements) do
        data[flag] = element.Value
    end
    local json = HttpService:JSONEncode(data)
    local actualFileName = LocalPlayer.Name .. "-Meyy-Hub-" .. fileName
    writefile(Library.ConfigFolder .. "/" .. actualFileName .. ".json", json)
    if not silent then
        Library:SendNotification("Config System", "Saved " .. actualFileName)
    end
end

function Library:LoadConfig(fileName, silent)
    local actualFileName = LocalPlayer.Name .. "-Meyy-Hub-" .. fileName
    local path = Library.ConfigFolder .. "/" .. actualFileName .. ".json"
    if isfile(path) then
        local json = readfile(path)
        local success, data = pcall(function()
            return HttpService:JSONDecode(json)
        end)
        if success and type(data) == "table" then
            Library.IsLoading = true
            for flag, value in pairs(data) do
                if Library.ConfigElements[flag] then
                    Library.ConfigElements[flag].Set(value)
                end
            end
            Library.IsLoading = false
            if not silent then
                Library:SendNotification("Config System", "Loaded " .. actualFileName)
            end
        else
            if not silent then
                Library:SendNotification("Config Error", "Failed to parse JSON")
            end
        end
    else
        if not silent then
            Library:SendNotification("Config Error", "File not found")
        end
    end
end
---------
function Library:SendNotification(titleText, descText)
    local g2 = Instance.new("ScreenGui")
    g2.Name = "UI_Cloud_Notification_" .. math.random(100, 999)
    g2.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    
    pcall(function() g2.Parent = CoreGui end)
    if not g2.Parent then g2.Parent = LocalPlayer:WaitForChild("PlayerGui") end
    
    local m2 = Instance.new("Frame", g2)
    m2.Name = "Main"
    m2.BackgroundColor3 = Themes[CurrentTheme].MainBg
    m2.BackgroundTransparency = 0.3
    m2.Size = UDim2.new(0, 260, 0, 80)
    m2.AnchorPoint = Vector2.new(1, 1)
    m2.Position = UDim2.new(1, 50, 1, -20)
    Instance.new("UICorner", m2).CornerRadius = UDim.new(0, 10)
    
    local u2 = Instance.new("UIStroke", m2)
    u2.Thickness = 2.5
    u2.Color = Themes[CurrentTheme].MainStroke
    
    local e2 = Instance.new("UIGradient", u2)
    e2.Color = Themes[CurrentTheme].LoopSeq
    table.insert(UI_Elements.RotatingGradients, e2)
    
    local bgGradient = Instance.new("UIGradient", m2)
    bgGradient.Color = Themes[CurrentTheme].Wave
    
    local function CreateStatusLabel(name, pos, text, size)
        local label = Instance.new("TextLabel", m2)
        label.Name = name
        label.Size = UDim2.new(1, -20, 0, 25)
        label.Position = UDim2.new(0.5, 0, 0, pos)
        label.AnchorPoint = Vector2.new(0.5, 0)
        label.BackgroundTransparency = 1
        label.Font = Enum.Font.GothamBold
        label.Text = text
        label.TextSize = size or 12
        -------------------------
        ApplyTextGradient(label)
        -------------------------
        return label
    end
    
    local titleLabel = CreateStatusLabel("Title", 12, titleText, 16)
    local subLabel = CreateStatusLabel("Subtitle", 40, descText, 12)
    
    local renderSteppedConn
    renderSteppedConn = RunService.RenderStepped:Connect(function()
        bgGradient.Offset = Vector2.new(math.sin(tick() * 1.5) * 0.3, 0)
    end)
    
    for i, notif in ipairs(Notifications) do
        if notif and notif.Parent then
            local newY = -20 - (i * 90)
            TweenService:Create(notif, TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Position = UDim2.new(1, -20, 1, newY)}):Play()
        end
    end
    
    table.insert(Notifications, 1, m2)
    if #Notifications > 5 then
        local oldNotif = table.remove(Notifications, 6)
        if oldNotif then
            TweenService:Create(oldNotif, TweenInfo.new(0.3), {Position = UDim2.new(1, 300, 1, oldNotif.Position.Y.Offset)}):Play()
            task.delay(0.3, function() oldNotif.Parent:Destroy() end)
        end
    end
    
    local showTween = TweenService:Create(m2, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Position = UDim2.new(1, -20, 1, -20)})
    showTween:Play()
    
    task.delay(3, function()
        for i, notif in ipairs(Notifications) do
            if notif == m2 then
                table.remove(Notifications, i)
                break
            end
        end
        local hideTween = TweenService:Create(m2, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {Position = UDim2.new(1, 300, 1, m2.Position.Y.Offset)})
        hideTween:Play()
        hideTween.Completed:Connect(function()
            if renderSteppedConn then renderSteppedConn:Disconnect() end
            g2:Destroy()
            for i, notif in ipairs(Notifications) do
                if notif and notif.Parent then
                    local newY = -20 - ((i - 1) * 90)
                    TweenService:Create(notif, TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Position = UDim2.new(1, -20, 1, newY)}):Play()
                end
            end
        end)
    end)
end

function Library:CreateWindow(config)
    local Window = {}
    config = config or {}
    CurrentTheme = (config.Theme and Themes[config.Theme]) and config.Theme or "Liquid"
    local windowTitle = config.Title or "CentuDox"
    
    if getgenv().MainUI_Library then
        pcall(function() getgenv().MainUI_Library:Destroy() end)
        getgenv().MainUI_Library = nil
    end
    
    local g = Instance.new("ScreenGui")
    g.Name = "Hub_Premium_" .. math.random(100, 999)
    g.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    g.ResetOnSpawn = false
    
    pcall(function() g.Parent = CoreGui end)
    if not g.Parent then g.Parent = LocalPlayer:WaitForChild("PlayerGui") end
    getgenv().MainUI_Library = g
    
---------
local AuraGlow = Instance.new("ImageLabel", g)
AuraGlow.Name = "AuraGlow"
AuraGlow.BackgroundTransparency = 1
AuraGlow.Image = "rbxassetid://5028857084"
AuraGlow.ImageTransparency = 0.4
AuraGlow.ImageColor3 = Color3.fromHex("#E0E0E0")
AuraGlow.ZIndex = 0
AuraGlow.AnchorPoint = Vector2.new(0.5, 0.5)

Instance.new("UICorner", AuraGlow).CornerRadius = UDim.new(0, 15)

local auraScale = Instance.new("UIScale", AuraGlow)

local m = Instance.new("Frame", g)
m.Name = "MainFrame"
m.BackgroundColor3 = Themes[CurrentTheme].MainBg
m.BackgroundTransparency = Themes[CurrentTheme].MainBgTrans
m.Size = UDim2.new(0, 600, 0, 525) -- Updated Ratio 400:350
m.Position = UDim2.new(0.5, 0, 0.5, 0)
m.AnchorPoint = Vector2.new(0.5, 0.5)
m.ClipsDescendants = true
Instance.new("UICorner", m).CornerRadius = UDim.new(0, 20)
local glassSheen = Instance.new("UIGradient", m)
glassSheen.Name = "LiquidGlassSheen"
glassSheen.Rotation = 28
glassSheen.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromHex("#17283F")),
    ColorSequenceKeypoint.new(0.45, Color3.fromHex("#0D1727")),
    ColorSequenceKeypoint.new(1, Color3.fromHex("#263D59"))
})
glassSheen.Transparency = NumberSequence.new({
    NumberSequenceKeypoint.new(0, 0.05),
    NumberSequenceKeypoint.new(0.5, 0.18),
    NumberSequenceKeypoint.new(1, 0.04)
})

-- Optional scene blur to approximate the reference's frosted-glass backdrop.
-- Off by default to avoid changing the experience's overall visual sharpness.
local liquidBlur
if config.LiquidBlur == true then
    local existingBlur = Lighting:FindFirstChild("CentuDoxLiquidBlur")
    if existingBlur then existingBlur:Destroy() end
    liquidBlur = Instance.new("BlurEffect")
    liquidBlur.Name = "CentuDoxLiquidBlur"
    liquidBlur.Size = 0
    liquidBlur.Parent = Lighting
    TweenService:Create(liquidBlur, TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        Size = 8
    }):Play()
    m:GetPropertyChangedSignal("Visible"):Connect(function()
        if liquidBlur and liquidBlur.Parent then
            TweenService:Create(liquidBlur, TweenInfo.new(0.25), {
                Size = (m.Visible and CurrentTheme == "Liquid") and 8 or 0
            }):Play()
        end
    end)
    g.Destroying:Connect(function()
        if liquidBlur and liquidBlur.Parent then liquidBlur:Destroy() end
    end)
end

local function UpdateAura()
    local targetWidth = m.Size.X.Scale == 1 and 600 or m.Size.X.Offset
    local factor = math.clamp(targetWidth / 600, 0, 1)
    
    local expandX = 105 * factor 
    local expandY = 95 * factor 

    AuraGlow.Position = m.Position
    AuraGlow.Size = UDim2.new(m.Size.X.Scale, m.Size.X.Offset + expandX, m.Size.Y.Scale, m.Size.Y.Offset + expandY)
    AuraGlow.Visible = m.Visible
end
m:GetPropertyChangedSignal("Position"):Connect(UpdateAura)
m:GetPropertyChangedSignal("Size"):Connect(UpdateAura)
m:GetPropertyChangedSignal("Visible"):Connect(UpdateAura)
UpdateAura()
---------
    ---------
local isMini = false
    local isMax = false

    local mainScale = Instance.new("UIScale", m)
    mainScale.Scale = 1
    
    mainScale:GetPropertyChangedSignal("Scale"):Connect(function()
        if g:FindFirstChild("AuraGlow") and g.AuraGlow:FindFirstChildOfClass("UIScale") then
            g.AuraGlow:FindFirstChildOfClass("UIScale").Scale = mainScale.Scale
        end
    end)
    
    local function UpdateUIScale()
        if not g then return end
        
        if m.Size.X.Scale == 1 and m.Size.Y.Scale == 1 then 
            TweenService:Create(mainScale, TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Scale = 1}):Play()
            return 
        end
        
        local screenSize = g.AbsoluteSize
        if screenSize.X > 0 and screenSize.Y > 0 then
            local targetScale = math.clamp(math.min(screenSize.X / 650, screenSize.Y / 600), 0.45, 1)
            TweenService:Create(mainScale, TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Scale = targetScale}):Play()
        end
    end
    
    UpdateUIScale()
    g:GetPropertyChangedSignal("AbsoluteSize"):Connect(UpdateUIScale)
    m:GetPropertyChangedSignal("Size"):Connect(UpdateUIScale)
---------


    local EdgeBarHitbox = Instance.new("TextButton", g)
    EdgeBarHitbox.Name = "EdgeBarHitbox"
    EdgeBarHitbox.Size = UDim2.new(0, 30, 0, 140) 
    EdgeBarHitbox.Position = UDim2.new(1, 0, 0.5, 0)
    EdgeBarHitbox.AnchorPoint = Vector2.new(1, 0.5)
    EdgeBarHitbox.BackgroundTransparency = 1 
    EdgeBarHitbox.Visible = false
    EdgeBarHitbox.Text = ""

    local EdgeBarVisual = Instance.new("Frame", EdgeBarHitbox)
    EdgeBarVisual.Size = UDim2.new(0, 4, 0, 120) 
    EdgeBarVisual.Position = UDim2.new(1, -2, 0.5, 0)
    EdgeBarVisual.AnchorPoint = Vector2.new(1, 0.5)
    EdgeBarVisual.BackgroundColor3 = Color3.fromHex("#FFFFFF")
    EdgeBarVisual.BackgroundTransparency = 0.8
    Instance.new("UICorner", EdgeBarVisual).CornerRadius = UDim.new(1, 0)

    local Mini3DIcon = Instance.new("Frame", g)
    Mini3DIcon.Name = "Mini3DIcon"
    Mini3DIcon.Size = UDim2.new(0, 140, 0, 140)
    Mini3DIcon.Position = UDim2.new(1, 150, 0.5, 0)
    Mini3DIcon.AnchorPoint = Vector2.new(1, 0.5)
    Mini3DIcon.BackgroundTransparency = 1
    Mini3DIcon.Visible = false

    local coreLayers = {}
    local baseSizes = {30, 45, 62, 78, 95, 112}    
    local baseTransparencies = {0.1, 0.3, 0.5, 0.7, 0.85, 0.93}
    for i = 1, #baseSizes do
        local layer = Instance.new("Frame")
        layer.AnchorPoint = Vector2.new(0.5, 0.5)
        layer.Position = UDim2.new(0.5, 0, 0.5, 0)
        layer.BorderSizePixel = 0
        layer.ZIndex = 3
        Instance.new("UICorner", layer).CornerRadius = UDim.new(1, 0)
        layer.Parent = Mini3DIcon
        table.insert(coreLayers, {frame = layer, baseSize = baseSizes[i], baseTrans = baseTransparencies[i]})
    end
    
    local phi = (1 + math.sqrt(5)) / 2
    local vertices = {
        Vector3.new(0, 1, phi), Vector3.new(0, -1, phi),
        Vector3.new(0, 1, -phi), Vector3.new(0, -1, -phi),
        Vector3.new(1, phi, 0), Vector3.new(-1, phi, 0),
        Vector3.new(1, -phi, 0), Vector3.new(-1, -phi, 0),
        Vector3.new(phi, 0, 1), Vector3.new(-phi, 0, 1),
        Vector3.new(phi, 0, -1), Vector3.new(-phi, 0, -1)
    }
    local edges = {}
    for i = 1, #vertices - 1 do
        for j = i + 1, #vertices do
            if math.abs((vertices[i] - vertices[j]).Magnitude - 2) < 0.1 then
                table.insert(edges, {i, j})
            end
        end
    end
    
    local lines, lineGradients = {}, {}
    for i = 1, #edges do
        local line = Instance.new("Frame")
        line.AnchorPoint = Vector2.new(0.5, 0.5)
        line.BackgroundColor3 = Color3.fromHex("#FFFFFF")
        line.BorderSizePixel = 0
        line.ZIndex = 3
        local lineGrad = Instance.new("UIGradient", line)
        table.insert(lineGradients, lineGrad)
        local glow = Instance.new("UIStroke", line)
        glow.Thickness = 2
        glow.Transparency = 0.4
        glow.Color = Color3.fromHex("#FFFFFF")
        local glowGrad = Instance.new("UIGradient", glow)
        table.insert(lineGradients, glowGrad)
        line.Parent = Mini3DIcon
        lines[i] = line
    end

  local MiniClickBtn = Instance.new("TextButton", Mini3DIcon)
    MiniClickBtn.Size = UDim2.new(1, 0, 1, 0)
    MiniClickBtn.BackgroundTransparency = 1
    MiniClickBtn.Text = ""
    MiniClickBtn.ZIndex = 10

    local angleX, angleY, r3D = 0, 0, 0
    local currentTiltX, currentTiltY = 0, 0
    local scale3D, perspective3D = 45, 150
    local function project3D(v3, aX, aY)
        local x, y, z = v3.X, v3.Y, v3.Z
        local cosY, sinY = math.cos(aY), math.sin(aY)
        x, z = x * cosY - z * sinY, x * sinY + z * cosY
        local cosX, sinX = math.cos(aX), math.sin(aX)
        y, z = y * cosX - z * sinX, y * sinX + z * cosX
        local factor = perspective3D / (perspective3D + z)
        return Vector2.new(x * factor * scale3D + 70, -y * factor * scale3D + 70), z
    end

    local clickCount = 0
    EdgeBarHitbox.MouseButton1Click:Connect(function()
        clickCount = clickCount + 1
        if clickCount == 1 then
            TweenService:Create(EdgeBarVisual, TweenInfo.new(0.2), {BackgroundTransparency = 0.2, Size = UDim2.new(0, 6, 0, 140)}):Play()
            task.delay(0.6, function() 
                if clickCount == 1 then
                    clickCount = 0 
                    TweenService:Create(EdgeBarVisual, TweenInfo.new(0.2), {BackgroundTransparency = 0.8, Size = UDim2.new(0, 4, 0, 120)}):Play()
                end
            end)
        elseif clickCount == 2 then
            clickCount = 0
            EdgeBarHitbox.Visible = false
            Mini3DIcon.Visible = true
            TweenService:Create(Mini3DIcon, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Position = UDim2.new(1, -20, 0.5, 0)}):Play()
        end
    end)


    ---------
    MiniClickBtn.MouseButton1Click:Connect(function()
        local tw = TweenService:Create(Mini3DIcon, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.In), {Position = UDim2.new(1, 150, 0.5, 0)})
        tw:Play()
        tw.Completed:Wait()
        Mini3DIcon.Visible = false
        
        local tgIcon = g:FindFirstChild("ToggleIcon")
        if tgIcon then tgIcon.Visible = true end
        
        m.Visible = true
        m.Size = UDim2.new(0, 0, 0, 0)
        m.Position = UDim2.new(1, 0, 0.5, 0)
        local targetSize = isMax and UDim2.new(1, 0, 1, 0) or UDim2.new(0, 600, 0, 525)
        TweenService:Create(m, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
            Size = targetSize,
            Position = UDim2.new(0.5, 0, 0.5, 0)
        }):Play()
        isMini = false
    end)
---------

-------------------------
    local SnowContainer = Instance.new("Frame", m)
    SnowContainer.Name = "SnowContainer"
    SnowContainer.Size = UDim2.new(1, -40, 1, -40)
    SnowContainer.Position = UDim2.new(0, 20, 0, 20)
    SnowContainer.BackgroundTransparency = 1
    SnowContainer.ZIndex = 0
    SnowContainer.ClipsDescendants = true
    Instance.new("UICorner", SnowContainer).CornerRadius = UDim.new(0, 15)
    
    task.spawn(function()
        while task.wait(0.15) do
            if not m.Visible or isMini then continue end
            local flake = Instance.new("ImageLabel", SnowContainer)
            flake.BackgroundTransparency = 1
            local iconId = "137906289429512"
            if CurrentTheme == "Dream" then iconId = "88081350809596"
            elseif CurrentTheme == "Dark" then iconId = "97956199432234" end
            
            flake.Image = "rbxthumb://type=Asset&id=" .. iconId .. "&w=150&h=150"
            
            local depth = math.random()
            
            local size = 13 + (7 * depth)
            flake.Size = UDim2.new(0, size, 0, size)
            
            flake.ImageTransparency = 0.8 - (0.6 * depth)
            flake.ZIndex = math.floor(depth * 3)
            
            local startX = math.random()
            flake.Position = UDim2.new(startX, 0, -0.1, 0)
            
            local fallDuration = 9 - (5 * depth)
            local swaySpeed = 1.2 + math.random()
            local swayAmount = 0.03 + (0.07 * depth)
            local randomOffset = math.random() * math.pi * 2
            local rotSpeed = 30 + (90 * depth)
            local rotDir = math.random(1, 2) == 1 and 1 or -1
            
            local startTime = tick()
            local renderConn
            renderConn = RunService.RenderStepped:Connect(function()
                if not flake or not flake.Parent then
                    if renderConn then renderConn:Disconnect() end
                    return
                end
                
                local elapsed = tick() - startTime
                local progress = elapsed / fallDuration
                
                if progress >= 1 then
                    flake:Destroy()
                    if renderConn then renderConn:Disconnect() end
                    return
                end
                
                local currentY = -0.1 + (1.2 * progress)
                local currentX = startX + math.sin(tick() * swaySpeed + randomOffset) * swayAmount
                
                flake.Position = UDim2.new(currentX, 0, currentY, 0)
                flake.Rotation = elapsed * rotSpeed * rotDir
            end)
        end
    end)
-------------------------
   ---------
local ToggleIcon = Instance.new("ImageButton", g)
ToggleIcon.Name = "ToggleIcon"
ToggleIcon.Size = UDim2.new(0, 45, 0, 45)
ToggleIcon.Position = UDim2.new(0, 20, 1, -65)
ToggleIcon.BackgroundColor3 = Themes[CurrentTheme].ContainerBg
ToggleIcon.BackgroundTransparency = Themes[CurrentTheme].ContainerTrans
Instance.new("UICorner", ToggleIcon).CornerRadius = UDim.new(1, 0)

local rawIconId = "77000372466296"
local idClean = string.match(rawIconId, "%d+")
if idClean then
    ToggleIcon.Image = "rbxthumb://type=Asset&id=" .. idClean .. "&w=150&h=150"
else
    ToggleIcon.Image = rawIconId
end
ToggleIcon.ImageColor3 = Themes[CurrentTheme].TextColor

local iconStroke = Instance.new("UIStroke", ToggleIcon)
iconStroke.Thickness = 1.5
iconStroke.Color = Themes[CurrentTheme].MainStroke
table.insert(UI_Elements.AnimatedStrokes, {Obj = iconStroke, Type = "MainStroke"})

local iconStrokeGrad = Instance.new("UIGradient", iconStroke)
table.insert(UI_Elements.RotatingGradients, iconStrokeGrad)

local iconGrad = Instance.new("UIGradient", ToggleIcon)
iconGrad.Rotation = 45
iconGrad.Color = Themes[CurrentTheme].TextContrast

task.spawn(function()
    while task.wait(0.5) do
        if not ToggleIcon.Parent then break end
        if Themes[CurrentTheme] then
            ToggleIcon.ImageColor3 = Themes[CurrentTheme].TextColor
            ToggleIcon.BackgroundColor3 = Themes[CurrentTheme].ContainerBg
            ToggleIcon.BackgroundTransparency = Themes[CurrentTheme].ContainerTrans
            iconGrad.Color = Themes[CurrentTheme].TextContrast
        end
    end
end)

local toggleScale = Instance.new("UIScale", ToggleIcon)
toggleScale.Scale = 1

local function CreateBubbleEffect(centerPos)
local pColor = Themes[CurrentTheme] and Themes[CurrentTheme].ToggleActive or Color3.fromHex("#969696")

for i = 1, 14 do
    task.delay(math.random(0, 10)/100, function()
        if not ToggleIcon or not ToggleIcon.Parent then return end
        
        local toggleRadius = ToggleIcon.AbsoluteSize.X / 2 
        local angle = math.rad(math.random(0, 360))
        
        local startX = centerPos.X + math.cos(angle) * toggleRadius
        local startY = centerPos.Y + math.sin(angle) * toggleRadius
        
        local particle = Instance.new("Frame", ToggleIcon.Parent)
        particle.Size = UDim2.new(0, 10, 0, 10)
        particle.AnchorPoint = Vector2.new(0.5, 0.5)
        particle.Position = UDim2.new(0, startX, 0, startY)
        particle.BackgroundColor3 = pColor
        particle.ZIndex = 50
        
        Instance.new("UICorner", particle).CornerRadius = UDim.new(1, 0)
        
        local distance = math.random(15, 35)
        local targetX = startX + math.cos(angle) * distance
        local targetY = startY + math.sin(angle) * distance
        
        local pTween = TweenService:Create(particle, TweenInfo.new(math.random(3, 5)/10, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
            Position = UDim2.new(0, targetX, 0, targetY),
            Size = UDim2.new(0, 0, 0, 0),
            BackgroundTransparency = 1
        })
        pTween:Play()
        pTween.Completed:Connect(function() particle:Destroy() end)
    end)
end
end

local function PlayJellyBounce()
local tUp = TweenService:Create(toggleScale, TweenInfo.new(0.4, Enum.EasingStyle.Bounce, Enum.EasingDirection.Out), {Scale = 1})
tUp:Play()
CreateBubbleEffect(ToggleIcon.AbsolutePosition + (ToggleIcon.AbsoluteSize / 2))
end

local toggleDragging = false
local toggleDragStart, toggleStartPos, toggleMoved

ToggleIcon.InputBegan:Connect(function(input)
if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then
toggleDragging = true
toggleMoved = false
toggleDragStart = input.Position
toggleStartPos = ToggleIcon.Position

    TweenService:Create(toggleScale, TweenInfo.new(0.1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {Scale = 0.85}):Play()
end
end)

UserInputService.InputChanged:Connect(function(input)
if toggleDragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
local delta = input.Position - toggleDragStart
if delta.Magnitude > 5 then
toggleMoved = true
end
ToggleIcon.Position = UDim2.new(toggleStartPos.X.Scale, toggleStartPos.X.Offset + delta.X, toggleStartPos.Y.Scale, toggleStartPos.Y.Offset + delta.Y)
end
end)
---------
UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        if toggleDragging then
            toggleDragging = false
            
            if toggleMoved then
                local parentSize = ToggleIcon.Parent and ToggleIcon.Parent.AbsoluteSize or workspace.CurrentCamera.ViewportSize
                local tSize = ToggleIcon.AbsoluteSize
                local tPos = ToggleIcon.AbsolutePosition
                
                local left = tPos.X
                local right = parentSize.X - (tPos.X + tSize.X)
                local top = tPos.Y
                local bottom = parentSize.Y - (tPos.Y + tSize.Y)
                
                local min = math.min(left, right, top, bottom)
                local sinkAmount = tSize.X * 0.35
                local restMargin = 2 
                local bottomMargin = 12 
                
                local sinkUDim, targetUDim
                
                if min == left then
                    sinkUDim = UDim2.new(0, -sinkAmount, 0, tPos.Y)
                    targetUDim = UDim2.new(0, restMargin, 0, tPos.Y)
                elseif min == right then
                    sinkUDim = UDim2.new(0, parentSize.X - tSize.X + sinkAmount, 0, tPos.Y)
                    targetUDim = UDim2.new(0, parentSize.X - tSize.X - restMargin, 0, tPos.Y)
                elseif min == top then
                    sinkUDim = UDim2.new(0, tPos.X, 0, -sinkAmount)
                    targetUDim = UDim2.new(0, tPos.X, 0, restMargin)
                else
                    sinkUDim = UDim2.new(0, tPos.X, 0, parentSize.Y - tSize.Y + sinkAmount)
                    targetUDim = UDim2.new(0, tPos.X, 0, parentSize.Y - tSize.Y - bottomMargin)
                end
                
                local sinkTween = TweenService:Create(ToggleIcon, TweenInfo.new(0.15, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {Position = sinkUDim})
                sinkTween:Play()
                
                sinkTween.Completed:Connect(function()
                    TweenService:Create(ToggleIcon, TweenInfo.new(0.35, Enum.EasingStyle.Bounce, Enum.EasingDirection.Out), {Position = targetUDim}):Play()
                    PlayJellyBounce()
                end)
            else
                PlayJellyBounce()
            end
        end
    end
end)

ToggleIcon.MouseButton1Click:Connect(function()
    if toggleMoved then return end
    if not m then return end
    if m.Size.X.Offset > 0 or m.Size.X.Scale > 0 then
        TweenService:Create(m, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
            Size = UDim2.new(0, 0, 0, 0),
            Position = UDim2.new(1, 0, 0.5, 0)
        }):Play()
        task.wait(0.3)
        m.Visible = false
    else
        m.Visible = true
        local targetSize = isMini and UDim2.new(0, 600, 0, 525) or (isMax and UDim2.new(1, 0, 1, 0) or UDim2.new(0, 600, 0, 525))
        local targetPos = isMini and UDim2.new(0.5, 0, 0.5, 0) or UDim2.new(0.5, 0, 0.5, 0)
        TweenService:Create(m, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Size = targetSize, Position = targetPos}):Play()
    end
end)
---------
    ---------
    ToggleIcon.MouseButton1Click:Connect(function()
        if not m then return end
        if m.Size.X.Offset > 0 or m.Size.X.Scale > 0 then
            TweenService:Create(m, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
                Size = UDim2.new(0, 0, 0, 0),
                Position = UDim2.new(1, 0, 0.5, 0)
            }):Play()
            task.wait(0.3)
            m.Visible = false
        else
            m.Visible = true
            local targetSize = isMini and UDim2.new(0, 600, 0, 525) or (isMax and UDim2.new(1, 0, 1, 0) or UDim2.new(0, 600, 0, 525))
            local targetPos = isMini and UDim2.new(0.5, 0, 0.5, 0) or UDim2.new(0.5, 0, 0.5, 0)
            TweenService:Create(m, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Size = targetSize, Position = targetPos}):Play()
        end
    end)
    ---------
    
    local u = Instance.new("UIStroke", m)
    u.Thickness = CurrentTheme == "Liquid" and 1.25 or 4.5
    u.Transparency = CurrentTheme == "Liquid" and 0.22 or 0
    u.Color = Themes[CurrentTheme].MainStroke
    table.insert(UI_Elements.AnimatedStrokes, {Obj = u, Type = "MainStroke"})
    
    local e = Instance.new("UIGradient", u)
    table.insert(UI_Elements.RotatingGradients, e)
    
    local titleBar = Instance.new("Frame", m)
    titleBar.Name = "TitleBar"
    titleBar.Size = UDim2.new(1, 0, 0, 55)
    titleBar.BackgroundTransparency = 1
    titleBar.ZIndex = 2
    
    local hubTitle = Instance.new("TextLabel", titleBar)
    hubTitle.Size = UDim2.new(0, 300, 1, 0)
    hubTitle.Position = UDim2.new(0, 20, 0, 0)
    hubTitle.BackgroundTransparency = 1
    hubTitle.Font = Enum.Font.GothamBold
    hubTitle.Text = windowTitle
    -------------------------
    ApplyTextGradient(hubTitle)
    -------------------------
    hubTitle.TextSize = 15
    hubTitle.TextXAlignment = Enum.TextXAlignment.Left
    
    local function CreateWinBtn(text, pos)
        local btn = Instance.new("TextButton", titleBar)
        btn.Size = UDim2.new(0, 30, 0, 30)
        btn.Position = UDim2.new(1, pos, 0.5, 0)
        btn.AnchorPoint = Vector2.new(0, 0.5)
        btn.BackgroundTransparency = 1
        btn.Text = text
        btn.Font = Enum.Font.GothamBold
        -------------------------
        ApplyTextGradient(btn)
        -------------------------
        btn.TextSize = 16
        return btn
    end
    
    local minBtn = CreateWinBtn("~", -105)
    local maxBtn = CreateWinBtn("⬚", -70)
    local closeBtn = CreateWinBtn("x", -35)


    minBtn.MouseButton1Click:Connect(function()
        if not isMini then
            isMini = true
            
            local tgIcon = g:FindFirstChild("ToggleIcon")
            if tgIcon then tgIcon.Visible = false end
            
            TweenService:Create(m, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
                Size = UDim2.new(0, 0, 0, 0),
                Position = UDim2.new(1, 0, 0.5, 0)
            }):Play()
            task.delay(0.5, function()
                if isMini then
                    m.Visible = false
                    EdgeBarHitbox.Visible = true
                    EdgeBarVisual.BackgroundTransparency = 0.8
                    EdgeBarVisual.Size = UDim2.new(0, 4, 0, 120)
                end
            end)
        end
    end)
---------

    
    maxBtn.MouseButton1Click:Connect(function()
        if not isMax then
            isMax = true; isMini = false
            TweenService:Create(m, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
                Size = UDim2.new(1, 0, 1, 0),
                Position = UDim2.new(0.5, 0, 0.5, 0)
            }):Play()
            if m:FindFirstChild("Sidebar") then m.Sidebar.Visible = true end
            if m:FindFirstChild("LeftDivider") then m.LeftDivider.Visible = true end
            if m:FindFirstChild("TopDivider") then m.TopDivider.Visible = true end
            if m:FindFirstChild("Sidebar") then
                for _, btn in pairs(m.Sidebar:GetChildren()) do
                    if btn:IsA("TextButton") and btn:FindFirstChild("ActiveBg") and btn.ActiveBg.BackgroundTransparency < 1 then
                        local pageName = btn.Text:gsub("%s+", "") .. "Page"
                        if m:FindFirstChild(pageName) then m[pageName].Visible = true end
                    end
                end
            end
        else
            isMax = false
            TweenService:Create(m, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
                Size = UDim2.new(0, 600, 0, 525), -- Updated
                Position = UDim2.new(0.5, 0, 0.5, 0)
            }):Play()
        end
    end)
    ---------
    
    closeBtn.MouseButton1Click:Connect(function()
        if m.Size.X.Offset > 0 or m.Size.X.Scale > 0 then
            TweenService:Create(m, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
                Size = UDim2.new(0, 0, 0, 0),
                Position = UDim2.new(1, 0, 0.5, 0)
            }):Play()
            task.wait(0.3)
            m.Visible = false
        end
    end)
    
    local dragging, dragInput, dragStart, startPos
    titleBar.InputBegan:Connect(function(input)
        if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then
            dragging = true
            dragStart = input.Position
            startPos = m.Position
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            local delta = input.Position - dragStart
            m.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)
    
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = false
        end
    end)
    
    local TopDivider = Instance.new("Frame", m)
    TopDivider.Name = "TopDivider"
    TopDivider.Size = UDim2.new(1, -40, 0, 1)
    TopDivider.Position = UDim2.new(0, 20, 0, 55)
    TopDivider.BackgroundColor3 = Color3.fromHex("#FFFFFF")
    TopDivider.BorderSizePixel = 0
    TopDivider.ZIndex = 3
    
    local topDivGrad = Instance.new("UIGradient", TopDivider)
    topDivGrad.Color = Themes[CurrentTheme].DivGrad
    topDivGrad.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 1),
        NumberSequenceKeypoint.new(0.5, 0),
        NumberSequenceKeypoint.new(1, 1)
    })
    table.insert(UI_Elements.DivGradients, topDivGrad)
    
    ---------
    local LeftDivider = Instance.new("Frame", m)
    LeftDivider.Name = "LeftDivider"
    LeftDivider.Size = UDim2.new(0, 1, 1, -80)
    LeftDivider.Position = UDim2.new(0, 175, 0, 65) -- Adjusted for UI Ratio
    LeftDivider.BackgroundColor3 = Color3.fromHex("#FFFFFF")
    LeftDivider.BorderSizePixel = 0
    LeftDivider.ZIndex = 3
    
    local leftDivGrad = Instance.new("UIGradient", LeftDivider)
    leftDivGrad.Rotation = 90
    leftDivGrad.Color = Themes[CurrentTheme].DivGrad
    leftDivGrad.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 1),
        NumberSequenceKeypoint.new(0.5, 0),
        NumberSequenceKeypoint.new(1, 1)
    })
    table.insert(UI_Elements.DivGradients, leftDivGrad)
        local Sidebar = Instance.new("ScrollingFrame", m)
    Sidebar.Name = "Sidebar"
    Sidebar.Size = UDim2.new(0, 170, 1, -65) -- Adjusted width for 600 UI
    Sidebar.Position = UDim2.new(0, 5, 0, 60)
    Sidebar.BackgroundTransparency = 1
    Sidebar.BorderSizePixel = 0
    Sidebar.ScrollBarThickness = 0
    Sidebar.AutomaticCanvasSize = Enum.AutomaticSize.Y
    Sidebar.ZIndex = 2
    
    local sideLayout = Instance.new("UIListLayout", Sidebar)
    sideLayout.Padding = UDim.new(0, 5)
    sideLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    sideLayout.SortOrder = Enum.SortOrder.LayoutOrder -- Ensure layout order respects Logo & Search

    -- Sidebar Logo Area
    local LogoFrame = Instance.new("Frame", Sidebar)
    LogoFrame.Name = "LogoArea"
    LogoFrame.BackgroundTransparency = 1
    LogoFrame.LayoutOrder = 1
    
    LogoFrame.Size = UDim2.new(1, -10, 0, 120)
    local logoIcon = Instance.new("ImageLabel", LogoFrame)
    logoIcon.Size = UDim2.new(1, 0, 1, 0)
    logoIcon.BackgroundTransparency = 1
    logoIcon.ScaleType = Enum.ScaleType.Fit
    
    -- CentuDox custom avatar (replaces the theme-specific sidebar logo)
    logoIcon.Image = config.Logo or ""

   -- Sidebar Search Area
    local SearchFrame = Instance.new("Frame", Sidebar)
    SearchFrame.Name = "SearchArea"
    SearchFrame.Size = UDim2.new(1, -20, 0, 32)
    SearchFrame.BackgroundColor3 = Themes[CurrentTheme].ContainerBg
    SearchFrame.BackgroundTransparency = Themes[CurrentTheme].ContainerTrans
    SearchFrame.LayoutOrder = 2
    table.insert(UI_Elements.Containers, SearchFrame)
    Instance.new("UICorner", SearchFrame).CornerRadius = UDim.new(0, 6)

    local SearchIconDisplay = Instance.new("ImageLabel", SearchFrame)
    SearchIconDisplay.Size = UDim2.new(0, 25, 0, 25)
SearchIconDisplay.AnchorPoint = Vector2.new(1, 0.5)
    SearchIconDisplay.Position = UDim2.new(1, -10, 0.5, 0)
    SearchIconDisplay.BackgroundTransparency = 1
    SearchIconDisplay.Image = "rbxthumb://type=Asset&id=111352610696552&w=150&h=150"
    
 if Themes[CurrentTheme] and Themes[CurrentTheme].SearchIconColor then
        SearchIconDisplay.ImageColor3 = Themes[CurrentTheme].SearchIconColor
    else
        SearchIconDisplay.ImageColor3 = Themes[CurrentTheme].TextColor
    end
    
    -- Vòng lặp kiểm tra để tự động thay đổi màu khi ann chọn theme khác nhó~
    task.spawn(function()
        while task.wait(0.5) do
            if not SearchIconDisplay.Parent then break end
            if Themes[CurrentTheme] then
                if Themes[CurrentTheme].SearchIconColor then
                    SearchIconDisplay.ImageColor3 = Themes[CurrentTheme].SearchIconColor
                else
                    SearchIconDisplay.ImageColor3 = Themes[CurrentTheme].TextColor
                end
            end
        end
    end)


    local SearchBox = Instance.new("TextBox", SearchFrame)
    SearchBox.Size = UDim2.new(1, -30, 1, 0)
    SearchBox.Position = UDim2.new(0, 26, 0, 0)
    SearchBox.BackgroundTransparency = 1
    SearchBox.Font = Enum.Font.GothamBold
    SearchBox.Text = ""
    SearchBox.PlaceholderText = "Search Tab..."
    SearchBox.TextSize = 12
    SearchBox.TextXAlignment = Enum.TextXAlignment.Left
    ApplyTextGradient(SearchBox)
    ---------
    
    local TabsList = {}
    local PagesList = {}
    
    ---------
    -- Handle Search Filter
    SearchBox:GetPropertyChangedSignal("Text"):Connect(function()
        local searchText = string.lower(SearchBox.Text)
        for _, tabData in ipairs(TabsList) do
            if searchText == "" or string.find(string.lower(tabData.Name), searchText) then
                tabData.Btn.Visible = true
            else
                tabData.Btn.Visible = false
            end
        end
    end)
    ---------

    -- [[ TAB SYSTEM ]] --
    function Window:CreateTab(name, isFirstPage, tabIconId)
        local Tab = {}
        local currentTitle = ""
        local currentSubTitle = ""

        local function GetSecureFlag(elementText, customFlag)
            -- Lớp 1: Đường dẫn cơ bản
            local t = currentTitle ~= "" and currentTitle or "NoTitle"
            local st = currentSubTitle ~= "" and currentSubTitle or "NoSub"
            local basePath = name .. "_" .. t .. "_" .. st .. "_" .. elementText

            -- Lớp 2: Gán Flag thủ công
            if customFlag then
                basePath = basePath .. "_" .. customFlag
            end

            -- Lớp 4: Khóa đường dẫn Namespace
            local namespace = "[" .. name .. "][" .. t .. "][" .. st .. "]"
            local finalFlag = namespace .. "_" .. basePath

            -- Lớp 3: Mã UUID chữa cháy nếu vẫn trùng
            if Library.ConfigElements[finalFlag] then
                finalFlag = finalFlag .. "_" .. HttpService:GenerateGUID(false)
            end

            return finalFlag
        end

        local btn = Instance.new("TextButton", Sidebar)
        btn.Size = UDim2.new(1, -20, 0, 38)
        btn.BackgroundTransparency = 1
        btn.Font = Enum.Font.GothamBold
        btn.Text = ""
        btn.LayoutOrder = 3 + #TabsList -- Tab order goes below Logo & Search
        
        ---------
        -- Elegant Tab Background Indicator
        local activeBg = Instance.new("Frame", btn)
        activeBg.Name = "ActiveBg"
        activeBg.Size = UDim2.new(1, 0, 1, 0)
        activeBg.BackgroundColor3 = Themes[CurrentTheme].ContainerBg
        activeBg.BackgroundTransparency = isFirstPage and 0.8 or 1
        Instance.new("UICorner", activeBg).CornerRadius = UDim.new(0, 8)
        table.insert(UI_Elements.TabBackgrounds, activeBg)
        
        local activeGlow = Instance.new("Frame", activeBg)
        activeGlow.Size = UDim2.new(0, 4, 1, -10)
        activeGlow.Position = UDim2.new(0, 4, 0.5, 0)
        activeGlow.AnchorPoint = Vector2.new(0, 0.5)
        activeGlow.BackgroundColor3 = Color3.fromHex("#FFFFFF")
        activeGlow.BackgroundTransparency = isFirstPage and 0 or 1
        activeGlow.BorderSizePixel = 0
        Instance.new("UICorner", activeGlow).CornerRadius = UDim.new(1, 0)
        
        local glowGrad = Instance.new("UIGradient", activeGlow)
        glowGrad.Rotation = 90
        glowGrad.Color = Themes[CurrentTheme].DivGrad
        glowGrad.Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.15, 0.5),
            NumberSequenceKeypoint.new(0.5, 0),
            NumberSequenceKeypoint.new(0.85, 0.5),
            NumberSequenceKeypoint.new(1, 1)
        })
        table.insert(UI_Elements.DivGradients, glowGrad)
        ---------
        
        local btnText = Instance.new("TextLabel", btn)
        btnText.Size = UDim2.new(1, -25, 1, 0)
        btnText.Position = UDim2.new(0, 18, 0, 0)
        btnText.BackgroundTransparency = 1
        btnText.Font = Enum.Font.GothamBold
        btnText.Text = name
        -------------------------
        ApplyTextGradient(btnText)
        -------------------------
        btnText.TextSize = 13 -- Slightly scaled down for new UI ratio
        btnText.TextXAlignment = Enum.TextXAlignment.Left

      ---------
        if tabIconId and tabIconId ~= "" then
            local iconDisplay = Instance.new("ImageLabel", btn)
            iconDisplay.Size = UDim2.new(0, 18, 0, 18)
            iconDisplay.Position = UDim2.new(0, 14, 0.5, 0)
            iconDisplay.AnchorPoint = Vector2.new(0, 0.5)
            iconDisplay.BackgroundTransparency = 1
            
            local idClean = string.match(tabIconId, "%d+")
            if idClean then
                iconDisplay.Image = "rbxthumb://type=Asset&id=" .. idClean .. "&w=150&h=150"
            else
                iconDisplay.Image = tabIconId
            end

            iconDisplay.ImageColor3 = Themes[CurrentTheme].TextColor
            
            local iconGrad = Instance.new("UIGradient", iconDisplay)
            iconGrad.Rotation = 90
            iconGrad.Color = Themes[CurrentTheme].TextContrast
            table.insert(UI_Elements.TextGradients, iconGrad)
            
            table.insert(UI_Elements.TabIcons, iconDisplay)
            
            btnText.Position = UDim2.new(0, 39, 0, 0)
            btnText.Size = UDim2.new(1, -40, 1, 0)
        end
        
        table.insert(TabsList, {Btn = btn, Bg = activeBg, Glow = activeGlow, Name = name})
---------
        
        local page = Instance.new("ScrollingFrame", m)
        page.Name = name .. "Page"
        ---------
        page.Size = UDim2.new(1, -190, 1, -85) -- Adjusted for 600 width
        page.Position = UDim2.new(0, 180, 0, 70)
        ---------
        page.BackgroundTransparency = 1
        page.ScrollBarThickness = 0
        page.ZIndex = 2
        page.Visible = isFirstPage
        page.AutomaticCanvasSize = Enum.AutomaticSize.Y
        
        local pagePadding = Instance.new("UIPadding", page)
        pagePadding.PaddingLeft = UDim.new(0, 10)
        pagePadding.PaddingRight = UDim.new(0, 20)
        pagePadding.PaddingTop = UDim.new(0, 5)
        
        local contentLayout = Instance.new("UIListLayout", page)
        contentLayout.Padding = UDim.new(0, 8)
        table.insert(PagesList, page)
        
---------
        -- Smooth Tab Transition with Light Beam Effect
        btn.MouseButton1Click:Connect(function()
            if page.Visible then return end

            local beam = Instance.new("Frame")
            beam.Name = "LightBeamEffect"
            beam.Size = UDim2.new(0, 250, 1, 0)
            beam.Position = UDim2.new(0, -250, 0, 0)
            beam.BackgroundColor3 = Themes[CurrentTheme] and Themes[CurrentTheme].ToggleActive or Color3.fromHex("#FFFFFF")
            beam.BorderSizePixel = 0
            beam.ZIndex = 50 
            beam.Parent = m

            local beamGrad = Instance.new("UIGradient", beam)
            beamGrad.Transparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 1),
                NumberSequenceKeypoint.new(0.4, 0.5),
                NumberSequenceKeypoint.new(0.5, 0),
                NumberSequenceKeypoint.new(0.6, 0.5),
                NumberSequenceKeypoint.new(1, 1)
            })
            beamGrad.Rotation = 15 

            local sweepTween = TweenService:Create(beam, TweenInfo.new(0.45, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
                Position = UDim2.new(1, m.AbsoluteSize.X + 100, 0, 0)
            })
            sweepTween:Play()
            
            local flashTween = TweenService:Create(beamGrad, TweenInfo.new(0.08, Enum.EasingStyle.Bounce, Enum.EasingDirection.InOut, -1, true), {
                Offset = Vector2.new(0, 0.3)
            })
            flashTween:Play()

            task.delay(0.22, function()
                for _, p in pairs(PagesList) do 
                    if p.Visible then
                        TweenService:Create(p, TweenInfo.new(0.2, Enum.EasingStyle.Sine), {ScrollBarImageTransparency = 1}):Play()
                        p.Visible = false 
                    end
                end
                for _, t in pairs(TabsList) do 
                    TweenService:Create(t.Bg, TweenInfo.new(0.3, Enum.EasingStyle.Quart), {BackgroundTransparency = 1}):Play()
                    TweenService:Create(t.Glow, TweenInfo.new(0.3, Enum.EasingStyle.Quart), {BackgroundTransparency = 1}):Play()
                end
                
                page.Position = UDim2.new(0, 180, 0, 100) 
                page.ScrollBarImageTransparency = 1
                page.Visible = true
                
                TweenService:Create(page, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
                    Position = UDim2.new(0, 180, 0, 70),
                    ScrollBarImageTransparency = 0
                }):Play()
                
                TweenService:Create(activeBg, TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {BackgroundTransparency = 0.8}):Play()
                TweenService:Create(activeGlow, TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {BackgroundTransparency = 0}):Play()
                
            end)

            sweepTween.Completed:Connect(function()
                flashTween:Cancel()
                beam:Destroy()
            end)
        end)
        ---------

        function Tab:CreatePageTitle(text)
            currentTitle = text
            currentSubTitle = ""
            local titleWrapper = Instance.new("Frame", page)
            titleWrapper.Size = UDim2.new(1, 0, 0, 45)
            titleWrapper.BackgroundTransparency = 1
            
            local title = Instance.new("TextLabel", titleWrapper)
            title.Size = UDim2.new(1, 0, 1, 0)
            title.Position = UDim2.new(0, 10, 0, 0)
            title.BackgroundTransparency = 1
            title.Font = Enum.Font.GothamBold
            title.Text = text
            -------------------------
            ApplyTextGradient(title)
            -------------------------
            title.TextSize = 26
            title.TextXAlignment = Enum.TextXAlignment.Left
        end
        
        function Tab:CreatePageSubTitle(text)
            currentSubTitle = text
            local titleWrapper = Instance.new("Frame", page)
            titleWrapper.Size = UDim2.new(1, 0, 0, 35)
            titleWrapper.BackgroundTransparency = 1
            
            local title = Instance.new("TextLabel", titleWrapper)
            title.Size = UDim2.new(1, 0, 1, 0)
            title.Position = UDim2.new(0, 10, 0, 0)
            title.BackgroundTransparency = 1
            title.Font = Enum.Font.GothamBold
            title.Text = text
            -------------------------
            ApplyTextGradient(title)
            -------------------------
            title.TextSize = 20
            title.TextXAlignment = Enum.TextXAlignment.Left
        end
        
        ---------
     ---------
        function Tab:CreateDropdown(text, default, optionsList, desc, callback, flag)
            local Dropdown = {}
            local rowHeight = (desc and desc ~= "") and 58 or 42
            local containerHeight = (desc and desc ~= "") and 62 or 46

            local container = Instance.new("Frame", page)
            container.Size = UDim2.new(1, -4, 0, containerHeight)
            container.Position = UDim2.new(0, 2, 0, 0)
            container.BackgroundTransparency = 1
            container.ClipsDescendants = false
            
            local row = Instance.new("Frame", container)
            row.Size = UDim2.new(1, 0, 0, rowHeight)
            row.Position = UDim2.new(0, 0, 0, 2)
            row.BackgroundColor3 = Themes[CurrentTheme].ContainerBg
            row.BackgroundTransparency = Themes[CurrentTheme].ContainerTrans
            table.insert(UI_Elements.Containers, row)
            Instance.new("UICorner", row).CornerRadius = UDim.new(0, 8)
            
            local rowStroke = Instance.new("UIStroke", row)
            rowStroke.Color = Themes[CurrentTheme].RowStroke
            rowStroke.Thickness = 1.2
            table.insert(UI_Elements.RowStrokes, rowStroke)
            
            local rowGrad = Instance.new("UIGradient", rowStroke)
            rowGrad.Color = Themes[CurrentTheme].RowStrokeGrad
            table.insert(UI_Elements.RowStrokeGradients, rowGrad)
            table.insert(UI_Elements.AnimatedGradients, rowGrad)
            
            local label = Instance.new("TextLabel", row)
            label.Size = UDim2.new(0.5, -10, 0, 42)
            label.Position = UDim2.new(0, 15, 0, 0)
            label.BackgroundTransparency = 1
            label.Font = Enum.Font.GothamBold
            label.Text = text
            ApplyTextGradient(label)
            label.TextSize = 14.5
            label.TextXAlignment = Enum.TextXAlignment.Left

            if desc and desc ~= "" then
                local descLabel = Instance.new("TextLabel", row)
                descLabel.Size = UDim2.new(1, -150, 0, 15)
                descLabel.Position = UDim2.new(0, 15, 0, 32)
                descLabel.BackgroundTransparency = 1
                descLabel.Font = Enum.Font.GothamBold
                descLabel.Text = desc
                descLabel.TextSize = 10
                descLabel.TextColor3 = Themes[CurrentTheme].DescTextColor
                descLabel.TextXAlignment = Enum.TextXAlignment.Left
                table.insert(UI_Elements.Descriptions, descLabel)
            end

            local dropBtn = Instance.new("TextButton", row)
            dropBtn.Size = UDim2.new(0, 130, 0, 30)
            dropBtn.Position = UDim2.new(1, -145, 0, 6)
            dropBtn.BackgroundColor3 = Themes[CurrentTheme].ContainerBg
            dropBtn.BackgroundTransparency = Themes[CurrentTheme].ContainerTrans
            table.insert(UI_Elements.Containers, dropBtn)
            dropBtn.Text = default
            dropBtn.Font = Enum.Font.GothamBold
            ApplyTextGradient(dropBtn)
            dropBtn.TextSize = 12.5
            Instance.new("UICorner", dropBtn).CornerRadius = UDim.new(0, 6)
            
            local arrow = Instance.new("TextLabel", dropBtn)
            arrow.Size = UDim2.new(0, 20, 1, 0)
            arrow.Position = UDim2.new(1, -25, 0, 0)
            arrow.BackgroundTransparency = 1
            arrow.Text = "​​≡"
            ApplyTextGradient(arrow)
            arrow.TextSize = 10
            
            local dropList = Instance.new("ScrollingFrame", container)
            dropList.Size = UDim2.new(1, 0, 1, -containerHeight - 2)
            dropList.Position = UDim2.new(0, 0, 0, containerHeight + 2)
            dropList.BackgroundTransparency = Themes[CurrentTheme].ContainerTrans
            dropList.BackgroundColor3 = Themes[CurrentTheme].ContainerBg
            table.insert(UI_Elements.Containers, dropList)
            dropList.BorderSizePixel = 0
            dropList.ScrollBarThickness = 2
            dropList.Visible = false
            dropList.AutomaticCanvasSize = Enum.AutomaticSize.Y
            dropList.CanvasSize = UDim2.new(0, 0, 0, 0)
            Instance.new("UICorner", dropList).CornerRadius = UDim.new(0, 8)
            
            local listLayout = Instance.new("UIListLayout", dropList)
            listLayout.Padding = UDim.new(0, 5)
            listLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
            
            local dropListStroke = Instance.new("UIStroke", dropList)
            dropListStroke.Color = Themes[CurrentTheme].RowStroke
            dropListStroke.Thickness = 1.2
            table.insert(UI_Elements.RowStrokes, dropListStroke)
            
            local dropListGrad = Instance.new("UIGradient", dropListStroke)
            dropListGrad.Color = Themes[CurrentTheme].RowStrokeGrad
            table.insert(UI_Elements.RowStrokeGradients, dropListGrad)
            table.insert(UI_Elements.AnimatedGradients, dropListGrad)

            local flagId = GetSecureFlag(text, flag)
            local function SetValue(val)
                dropBtn.Text = val
                if Library.ConfigElements[flagId] then
                    Library.ConfigElements[flagId].Value = val
                end
                if callback then callback(val) end
                Library:AutoSave()
            end

            Library.ConfigElements[flagId] = { Value = default, Set = SetValue }
            
            local isDropped = false

            local function RenderOptions(list)
                for _, child in pairs(dropList:GetChildren()) do
                    if child:IsA("TextButton") then
                        child:Destroy()
                    end
                end

                for _, opt in pairs(list) do
                    local dummyBtn = Instance.new("TextButton", dropList)
                    dummyBtn.Size = UDim2.new(1, -10, 0, 30)
                    dummyBtn.BackgroundTransparency = 1
                    dummyBtn.Text = opt
                    dummyBtn.Font = Enum.Font.GothamBold
                    ApplyTextGradient(dummyBtn)
                    dummyBtn.TextSize = 12
                    
                    dummyBtn.MouseButton1Click:Connect(function()
                        isDropped = false
                        
                        local tweenConn
                        local closeTween = TweenService:Create(container, TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(1, -4, 0, containerHeight)})
                        closeTween:Play()
                        
                        TweenService:Create(arrow, TweenInfo.new(0.3), {Rotation = 0}):Play()
                        
                        tweenConn = closeTween.Completed:Connect(function()
                            if not isDropped then
                                dropList.Visible = false
                            end
                            tweenConn:Disconnect()
                        end)

                        SetValue(opt)
                    end)
                end
            end

            RenderOptions(optionsList)
            
            dropBtn.MouseButton1Click:Connect(function()
                isDropped = not isDropped
                local targetHeight = isDropped and 165 or containerHeight
                
                if isDropped then
                    dropList.Visible = true
                    task.spawn(function()
                        while isDropped and container and container.Parent do
                            if container.AbsoluteSize.Y < targetHeight - 2 or container.AbsoluteSize.X < 20 then
                                dropList.Visible = true
                                task.wait(0.05)
                            else
                                break
                            end
                        end
                        if isDropped then
                            dropList.Visible = true
                        end
                    end)
                end
                
                local tween = TweenService:Create(container, TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(1, -4, 0, targetHeight)})
                tween:Play()
                
                if not isDropped then
                    local tweenConn
                    tweenConn = tween.Completed:Connect(function()
                        if not isDropped then
                            dropList.Visible = false
                        end
                        tweenConn:Disconnect()
                    end)
                end    
                
                TweenService:Create(arrow, TweenInfo.new(0.3), {Rotation = isDropped and 180 or 0}):Play()
            end)

            function Dropdown:Refresh(newList, newDefault)
                RenderOptions(newList)
                if newDefault then
                    SetValue(newDefault)
                else
                    local currentVal = Library.ConfigElements[flagId].Value
                    local exists = false
                    for _, opt in pairs(newList) do
                        if opt == currentVal then
                            exists = true
                            break
                        end
                    end
                    if not exists and #newList > 0 then
                        SetValue(newList[1])
                    elseif not exists then
                        SetValue("None")
                    end
                end
            end

            return Dropdown
        end

---------
        function Tab:CreateMultiDropdown(text, defaultSelections, optionsList, desc, callback, flag)
            local MultiDropdown = {}
            local rowHeight = (desc and desc ~= "") and 58 or 42
            local containerHeight = (desc and desc ~= "") and 62 or 46

            local container = Instance.new("Frame", page)
            container.Size = UDim2.new(1, -4, 0, containerHeight)
            container.Position = UDim2.new(0, 2, 0, 0)
            container.BackgroundTransparency = 1
            container.ClipsDescendants = false
            
            local row = Instance.new("Frame", container)
            row.Size = UDim2.new(1, 0, 0, rowHeight)
            row.Position = UDim2.new(0, 0, 0, 2)
            row.BackgroundColor3 = Themes[CurrentTheme].ContainerBg
            row.BackgroundTransparency = Themes[CurrentTheme].ContainerTrans
            table.insert(UI_Elements.Containers, row)
            Instance.new("UICorner", row).CornerRadius = UDim.new(0, 8)
            
            local rowStroke = Instance.new("UIStroke", row)
            rowStroke.Color = Themes[CurrentTheme].RowStroke
            rowStroke.Thickness = 1.2
            table.insert(UI_Elements.RowStrokes, rowStroke)
            
            local rowGrad = Instance.new("UIGradient", rowStroke)
            rowGrad.Color = Themes[CurrentTheme].RowStrokeGrad
            table.insert(UI_Elements.RowStrokeGradients, rowGrad)
            table.insert(UI_Elements.AnimatedGradients, rowGrad)
            
            local label = Instance.new("TextLabel", row)
            label.Size = UDim2.new(0.5, -10, 0, 42)
            label.Position = UDim2.new(0, 15, 0, 0)
            label.BackgroundTransparency = 1
            label.Font = Enum.Font.GothamBold
            label.Text = text
            ApplyTextGradient(label)
            label.TextSize = 14.5
            label.TextXAlignment = Enum.TextXAlignment.Left

            if desc and desc ~= "" then
                local descLabel = Instance.new("TextLabel", row)
                descLabel.Size = UDim2.new(1, -70, 0, 15)
                descLabel.Position = UDim2.new(0, 12, 0, 32)
                descLabel.BackgroundTransparency = 1
                descLabel.Font = Enum.Font.GothamBold
                descLabel.Text = desc
                descLabel.TextSize = 10
                descLabel.TextColor3 = Themes[CurrentTheme].DescTextColor
                descLabel.TextXAlignment = Enum.TextXAlignment.Left
                table.insert(UI_Elements.Descriptions, descLabel)
            end
            
            local dropBtn = Instance.new("TextButton", row)
            dropBtn.Size = UDim2.new(0, 130, 0, 30)
            dropBtn.Position = UDim2.new(1, -145, 0, 6)
            dropBtn.BackgroundColor3 = Themes[CurrentTheme].ContainerBg
            dropBtn.BackgroundTransparency = Themes[CurrentTheme].ContainerTrans
            table.insert(UI_Elements.Containers, dropBtn)
            dropBtn.Font = Enum.Font.GothamBold
            ApplyTextGradient(dropBtn)
            dropBtn.TextSize = 12.5
            dropBtn.TextTruncate = Enum.TextTruncate.AtEnd
            Instance.new("UICorner", dropBtn).CornerRadius = UDim.new(0, 6)
            
            local arrow = Instance.new("TextLabel", dropBtn)
            arrow.Size = UDim2.new(0, 20, 1, 0)
            arrow.Position = UDim2.new(1, -25, 0, 0)
            arrow.BackgroundTransparency = 1
            arrow.Text = "​​≡"
            ApplyTextGradient(arrow)
            arrow.TextSize = 10
            
            local dropList = Instance.new("ScrollingFrame", container)
            dropList.Size = UDim2.new(1, 0, 1, -containerHeight - 2)
            dropList.Position = UDim2.new(0, 0, 0, containerHeight + 2)
            dropList.BackgroundTransparency = Themes[CurrentTheme].ContainerTrans
            dropList.BackgroundColor3 = Themes[CurrentTheme].ContainerBg
            table.insert(UI_Elements.Containers, dropList)
            dropList.BorderSizePixel = 0
            dropList.ScrollBarThickness = 2
            dropList.Visible = false
            dropList.AutomaticCanvasSize = Enum.AutomaticSize.Y
            dropList.CanvasSize = UDim2.new(0, 0, 0, 0)
            Instance.new("UICorner", dropList).CornerRadius = UDim.new(0, 8)
            
            local listLayout = Instance.new("UIListLayout", dropList)
            listLayout.Padding = UDim.new(0, 5)
            listLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
            
            local dropListStroke = Instance.new("UIStroke", dropList)
            dropListStroke.Color = Themes[CurrentTheme].RowStroke
            dropListStroke.Thickness = 1.2 
            table.insert(UI_Elements.RowStrokes, dropListStroke)
            
            local dropListGrad = Instance.new("UIGradient", dropListStroke)
            dropListGrad.Color = Themes[CurrentTheme].RowStrokeGrad
            table.insert(UI_Elements.RowStrokeGradients, dropListGrad)
            table.insert(UI_Elements.AnimatedGradients, dropListGrad)

            local isDropped = false
            local selectedItems = {}
            optionsList = optionsList or {"Sample Mode 1", "Sample Mode 2"}
            defaultSelections = defaultSelections or {}
            
            for _, v in pairs(defaultSelections) do
                table.insert(selectedItems, v)
            end
            
            local OptionUpdaters = {}
            local flagId = GetSecureFlag(text, flag)

            local function UpdateButtonText()
                if #selectedItems == 0 then
                    dropBtn.Text = "None Selected"
                elseif #selectedItems == 1 then
                    dropBtn.Text = selectedItems[1]
                elseif #selectedItems == 2 then
                    dropBtn.Text = selectedItems[1] .. ", " .. selectedItems[2]
                else
                    dropBtn.Text = "Selected (" .. tostring(#selectedItems) .. ")"
                end
            end
            
            local function SetValue(arr)
                selectedItems = {}
                local saveArr = {}
                for _, v in pairs(arr) do
                    table.insert(selectedItems, v)
                    table.insert(saveArr, v)
                end
                UpdateButtonText()
                for _, updater in pairs(OptionUpdaters) do
                    updater()
                end
                if Library.ConfigElements[flagId] then
                    Library.ConfigElements[flagId].Value = saveArr
                end
                if callback then callback(selectedItems) end
                Library:AutoSave()
            end

            Library.ConfigElements[flagId] = { Value = defaultSelections, Set = SetValue }
            UpdateButtonText()
            
            local function RenderOptions(list)
                for _, child in pairs(dropList:GetChildren()) do
                    if child:IsA("TextButton") then
                        child:Destroy()
                    end
                end
                OptionUpdaters = {}

                for _, opt in pairs(list) do
                    local dummyBtn = Instance.new("TextButton", dropList)
                    dummyBtn.Size = UDim2.new(1, -10, 0, 30)
                    dummyBtn.BackgroundTransparency = 1
                    dummyBtn.Text = opt
                    dummyBtn.Font = Enum.Font.GothamBold
                    ApplyTextGradient(dummyBtn)
                    dummyBtn.TextSize = 12
                    Instance.new("UICorner", dummyBtn).CornerRadius = UDim.new(0, 6)
                    
                    local isSelected = false
                    local function UpdateVisuals()
                        if isSelected then
                            dummyBtn.BackgroundTransparency = 0.85
                            dummyBtn.BackgroundColor3 = Themes[CurrentTheme] and Themes[CurrentTheme].ToggleActive or Color3.fromHex("#00BFFF")
                            local textGrad = dummyBtn:FindFirstChildOfClass("UIGradient")
                            if textGrad then textGrad.Enabled = false end
                            dummyBtn.TextColor3 = Color3.fromHex("#FFFFFF")
                        else
                            dummyBtn.BackgroundTransparency = 1
                            local textGrad = dummyBtn:FindFirstChildOfClass("UIGradient")
                            if textGrad then textGrad.Enabled = true end
                            dummyBtn.TextColor3 = Themes[CurrentTheme] and Themes[CurrentTheme].TextColor or Color3.fromHex("#FFFFFF")
                        end
                    end
                    
                    table.insert(OptionUpdaters, function()
                        isSelected = false
                        for _, v in pairs(selectedItems) do
                            if v == opt then isSelected = true break end
                        end
                        UpdateVisuals()
                    end)
                    
                    for _, v in pairs(selectedItems) do
                        if v == opt then isSelected = true break end
                    end
                    UpdateVisuals()
                    
                    dummyBtn.MouseButton1Click:Connect(function()
                        if isSelected then
                            isSelected = false
                            for i, v in ipairs(selectedItems) do
                                if v == opt then table.remove(selectedItems, i) break end
                            end
                        else
                            isSelected = true
                            table.insert(selectedItems, opt)
                        end
                        UpdateVisuals()
                        UpdateButtonText()
                        
                        if Library.ConfigElements[flagId] then
                            local currentSave = {}
                            for _, v in pairs(selectedItems) do table.insert(currentSave, v) end
                            Library.ConfigElements[flagId].Value = currentSave
                        end
                        
                        if callback then callback(selectedItems) end
                        Library:AutoSave()
                    end)
                end
            end
            
            RenderOptions(optionsList)

            dropBtn.MouseButton1Click:Connect(function()
                isDropped = not isDropped
                local targetHeight = isDropped and 165 or containerHeight
                
                if isDropped then
                    dropList.Visible = true
                    task.spawn(function()
                        while isDropped and container and container.Parent do
                            if container.AbsoluteSize.Y < targetHeight - 2 or container.AbsoluteSize.X < 20 then
                                dropList.Visible = true
                                task.wait(0.05)
                            else
                                break
                            end
                        end
                        if isDropped then
                            dropList.Visible = true
                        end
                    end)
                end
                
                local tween = TweenService:Create(container, TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(1, -4, 0, targetHeight)})
                tween:Play()
                
                if not isDropped then
                    local tweenConn
                    tweenConn = tween.Completed:Connect(function()
                        if not isDropped then
                            dropList.Visible = false
                        end
                        tweenConn:Disconnect()
                    end)
                end    
                
                TweenService:Create(arrow, TweenInfo.new(0.3), {Rotation = isDropped and 180 or 0}):Play()
            end)

            function MultiDropdown:Refresh(newList, newDefaultSelections)
                if newDefaultSelections then
                    SetValue(newDefaultSelections)
                else
                    local validSelections = {}
                    for _, sel in ipairs(selectedItems) do
                        for _, opt in ipairs(newList) do
                            if sel == opt then
                                table.insert(validSelections, sel)
                                break
                            end
                        end
                    end
                    SetValue(validSelections)
                end
                RenderOptions(newList)
            end
            
            return MultiDropdown
        end
---------
---------

---------
        function Tab:CreateButton(text, desc, callback)
            local rowHeight = (desc and desc ~= "") and 58 or 42
            local row = Instance.new("Frame", page)
            row.Size = UDim2.new(1, -4, 0, rowHeight)
            row.BackgroundColor3 = Themes[CurrentTheme].ContainerBg
            row.BackgroundTransparency = Themes[CurrentTheme].ContainerTrans
            row.ClipsDescendants = true -- Thêm vào để Liquid Ripple không tràn ra ngoài
            table.insert(UI_Elements.Containers, row)
            Instance.new("UICorner", row).CornerRadius = UDim.new(0, 8)
            
            local rowStroke = Instance.new("UIStroke", row)
            rowStroke.Color = Themes[CurrentTheme].RowStroke
            rowStroke.Thickness = 1.2
            rowStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
            table.insert(UI_Elements.RowStrokes, rowStroke)
            
            local rowGrad = Instance.new("UIGradient", rowStroke)
            rowGrad.Color = Themes[CurrentTheme].RowStrokeGrad
            table.insert(UI_Elements.RowStrokeGradients, rowGrad)
            table.insert(UI_Elements.AnimatedGradients, rowGrad)

            local title = Instance.new("TextLabel", row)
            title.Name = "Title"
            title.Size = UDim2.new(1, -70, 0, 42)
            title.Position = UDim2.new(0, 12, 0, 0)
            title.BackgroundTransparency = 1
            title.Font = Enum.Font.GothamBold
            title.Text = text
            ApplyTextGradient(title)
            title.TextSize = 14
            title.TextXAlignment = Enum.TextXAlignment.Left

            if desc and desc ~= "" then
                local descLabel = Instance.new("TextLabel", row)
                descLabel.Size = UDim2.new(1, -70, 0, 15)
                descLabel.Position = UDim2.new(0, 12, 0, 32)
                descLabel.BackgroundTransparency = 1
                descLabel.Font = Enum.Font.GothamBold
                descLabel.Text = desc
                descLabel.TextSize = 10
                descLabel.TextColor3 = Themes[CurrentTheme].DescTextColor
                descLabel.TextXAlignment = Enum.TextXAlignment.Left
                table.insert(UI_Elements.Descriptions, descLabel)
            end
            
            local btnContainer = Instance.new("TextButton", row)
            btnContainer.Name = "Button"
            btnContainer.Size = UDim2.new(0, 36, 0, 36)
            btnContainer.Position = UDim2.new(1, -10, 0.5, 0)
            btnContainer.AnchorPoint = Vector2.new(1, 0.5)
            btnContainer.BackgroundTransparency = 1
            btnContainer.Text = ""
            btnContainer.ZIndex = 10
            
            local coreContainer = Instance.new("Frame", btnContainer)
            coreContainer.AnchorPoint = Vector2.new(0.5, 0.5)
            coreContainer.Position = UDim2.new(0.5, 0, 0.5, 0)
            coreContainer.Size = UDim2.new(1, 0, 1, 0)
            coreContainer.BackgroundTransparency = 1
            
            local uiScale = Instance.new("UIScale", coreContainer)
            uiScale.Scale = 1
            
            local coreLayers = {}
            local baseSizes = {8, 14, 20, 26, 32, 38} 
            local baseTransparencies = {0.1, 0.3, 0.5, 0.7, 0.85, 0.93}
            
            for i = 1, #baseSizes do
                local layer = Instance.new("Frame")
                layer.AnchorPoint = Vector2.new(0.5, 0.5)
                layer.Position = UDim2.new(0.5, 0, 0.5, 0)
                layer.BorderSizePixel = 0
                layer.ZIndex = 3
                
                Instance.new("UICorner", layer).CornerRadius = UDim.new(1, 0)
                layer.Parent = coreContainer
                table.insert(coreLayers, {frame = layer, baseSize = baseSizes[i], baseTrans = baseTransparencies[i]})
            end
            
            local r = 0
            local isClicked = false
            local clickTime = 0
            
            local renderConn
            renderConn = RunService.RenderStepped:Connect(function()
                if not btnContainer.Parent then
                    if renderConn then renderConn:Disconnect() end
                    return
                end
                
                r = (r + 1.5) % 360
                local t = Themes[CurrentTheme]
                
               local c1, c2
                if isClicked then
                    c1 = t.ToggleActive
                    c2 = t.ToggleActive
                else
                    c1 = Color3.fromRGB(150, 150, 150)
                    c2 = Color3.fromRGB(150, 150, 150)
                end
                
                local pulse = (math.sin(tick() * 3) + 1) / 2
                local coreColor = c1:Lerp(c2, math.abs(math.sin((r / 360) * math.pi)))
                
                for _, data in ipairs(coreLayers) do
                    local sizeOffset = pulse * 4
                    local targetSize = data.baseSize + sizeOffset
                    data.frame.Size = UDim2.new(0, targetSize, 0, targetSize)
                    data.frame.BackgroundColor3 = coreColor
                    data.frame.BackgroundTransparency = math.clamp(data.baseTrans + (pulse * 0.05), 0, 1)
                end
                
                if isClicked and tick() - clickTime >= 0.5 then
                    isClicked = false
                    TweenService:Create(uiScale, TweenInfo.new(0.3, Enum.EasingStyle.Bounce), {Scale = 1}):Play()
                end
            end)
            
---------
            local lastMousePos = Vector2.new(0, 0)
            
            btnContainer.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                    lastMousePos = Vector2.new(input.Position.X, input.Position.Y)
                    TweenService:Create(uiScale, TweenInfo.new(0.1, Enum.EasingStyle.Sine), {Scale = 0.8}):Play()
                    
                    -- 3D Glass Press (Chìm và nghiêng nhẹ, CHỈ mờ nền bên trong)
                    TweenService:Create(row, TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                        Rotation = -0.5, 
                        BackgroundTransparency = math.clamp(Themes[CurrentTheme].ContainerTrans + 0.15, 0, 1)
                    }):Play()
                end
            end)
            
            btnContainer.InputEnded:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                    if not isClicked then
                        TweenService:Create(uiScale, TweenInfo.new(0.1, Enum.EasingStyle.Sine), {Scale = 1}):Play()
                    end
                    -- Phục hồi lại nền sau khi nhả chuột
                    TweenService:Create(row, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
                        Rotation = 0, 
                        BackgroundTransparency = Themes[CurrentTheme].ContainerTrans
                    }):Play()
                end
            end)
---------
            btnContainer.MouseButton1Click:Connect(function()
                isClicked = true
                clickTime = tick()
                TweenService:Create(uiScale, TweenInfo.new(0.3, Enum.EasingStyle.Bounce), {Scale = 1.3}):Play()
                
                -- Liquid Ripple Effect (Neon Glassmorphism)
                local ripple = Instance.new("Frame")
                ripple.Name = "LiquidRipple"
                ripple.Parent = row
                ripple.BackgroundColor3 = Themes[CurrentTheme].ToggleActive
                ripple.BorderSizePixel = 0
                ripple.ZIndex = 4
                Instance.new("UICorner", ripple).CornerRadius = UDim.new(1, 0)
                
                local ripGrad = Instance.new("UIGradient", ripple)
                ripGrad.Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, Themes[CurrentTheme].ToggleActive),
                    ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))
                })
                ripGrad.Transparency = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 0),
                    NumberSequenceKeypoint.new(0.7, 0.4),
                    NumberSequenceKeypoint.new(1, 1)
                })
                
                -- Tính toán tâm Ripple chuẩn xác theo tọa độ chuột
                local relativeX = lastMousePos.X - row.AbsolutePosition.X
                local relativeY = lastMousePos.Y - row.AbsolutePosition.Y
                
                if lastMousePos.X == 0 and lastMousePos.Y == 0 then
                    relativeX = btnContainer.AbsolutePosition.X + btnContainer.AbsoluteSize.X / 2 - row.AbsolutePosition.X
                    relativeY = btnContainer.AbsolutePosition.Y + btnContainer.AbsoluteSize.Y / 2 - row.AbsolutePosition.Y
                end
                
                ripple.Position = UDim2.new(0, relativeX, 0, relativeY)
                ripple.Size = UDim2.new(0, 0, 0, 0)
                ripple.AnchorPoint = Vector2.new(0.5, 0.5)
                
                local maxDim = math.max(row.AbsoluteSize.X, row.AbsoluteSize.Y) * 1.5
                local ripTween = TweenService:Create(ripple, TweenInfo.new(0.6, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
                    Size = UDim2.new(0, maxDim, 0, maxDim),
                    BackgroundTransparency = 1
                })
                ripTween:Play()
                ripTween.Completed:Connect(function() ripple:Destroy() end)
                
                if callback then callback() end
            end)
        end
---------
---------
      ---------
        ---------
        function Tab:CreateSwitch(text, default, desc, callback, flag)
            local rowHeight = (desc and desc ~= "") and 58 or 42
            local row = Instance.new("Frame", page)
            row.Size = UDim2.new(1, -4, 0, rowHeight)
            row.Position = UDim2.new(0, 2, 0, 0)
            row.BackgroundColor3 = Themes[CurrentTheme].ContainerBg
            row.BackgroundTransparency = Themes[CurrentTheme].ContainerTrans
            table.insert(UI_Elements.Containers, row)
            Instance.new("UICorner", row).CornerRadius = UDim.new(0, 8)
            
            local rowStroke = Instance.new("UIStroke", row)
            rowStroke.Color = Themes[CurrentTheme].RowStroke
            rowStroke.Thickness = 1.2
            table.insert(UI_Elements.RowStrokes, rowStroke)
            
            local rowGrad = Instance.new("UIGradient", rowStroke)
            rowGrad.Color = Themes[CurrentTheme].RowStrokeGrad
            table.insert(UI_Elements.RowStrokeGradients, rowGrad)
            table.insert(UI_Elements.AnimatedGradients, rowGrad)
            
            local label = Instance.new("TextLabel", row)
            label.Size = UDim2.new(0.7, -10, 0, 42)
            label.Position = UDim2.new(0, 15, 0, 0)
            label.BackgroundTransparency = 1
            label.Font = Enum.Font.GothamBold
            label.Text = text
            ApplyTextGradient(label)
            label.TextSize = 14.5
            label.TextXAlignment = Enum.TextXAlignment.Left

            if desc and desc ~= "" then
                local descLabel = Instance.new("TextLabel", row)
                descLabel.Size = UDim2.new(1, -80, 0, 15)
                descLabel.Position = UDim2.new(0, 15, 0, 32)
                descLabel.BackgroundTransparency = 1
                descLabel.Font = Enum.Font.GothamBold
                descLabel.Text = desc
                descLabel.TextSize = 10
                descLabel.TextColor3 = Themes[CurrentTheme].DescTextColor
                descLabel.TextXAlignment = Enum.TextXAlignment.Left
                table.insert(UI_Elements.Descriptions, descLabel)
            end
---------
            
         ---------
            local toggleFrame = Instance.new("TextButton", row)
            toggleFrame.Size = UDim2.new(0, 40, 0, 20)
            toggleFrame.Position = UDim2.new(1, -55, 0.5, 0)
            toggleFrame.AnchorPoint = Vector2.new(0, 0.5)
            toggleFrame.BackgroundColor3 = default and Themes[CurrentTheme].ToggleActive or Color3.fromHex("#969696")
            toggleFrame.Text = ""
            toggleFrame.ClipsDescendants = false 
            Instance.new("UICorner", toggleFrame).CornerRadius = UDim.new(1, 0)
            
            local flashFrame = Instance.new("Frame", toggleFrame)
            flashFrame.Size = UDim2.new(1, 0, 1, 0)
            flashFrame.BackgroundColor3 = Color3.fromHex("#FFFFFF")
            flashFrame.BackgroundTransparency = 1
            flashFrame.ClipsDescendants = true
            Instance.new("UICorner", flashFrame).CornerRadius = UDim.new(1, 0)
            
            local flashGrad = Instance.new("UIGradient", flashFrame)
            flashGrad.Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromHex("#FFFFFF")),
                ColorSequenceKeypoint.new(0.5, Color3.fromHex("#FFFFFF")),
                ColorSequenceKeypoint.new(1, Color3.fromHex("#FFFFFF"))
            })
            flashGrad.Transparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 1),
                NumberSequenceKeypoint.new(0.5, 0),
                NumberSequenceKeypoint.new(1, 1)
            })
            flashGrad.Rotation = 45
            flashGrad.Offset = Vector2.new(-1, 0)

            local ball = Instance.new("Frame", toggleFrame)
            ball.Size = UDim2.new(0, 16, 0, 16)
            ball.Position = default and UDim2.new(1, -18, 0.5, 0) or UDim2.new(0, 2, 0.5, 0)
            ball.AnchorPoint = Vector2.new(0, 0.5)
            ball.BackgroundColor3 = Color3.fromHex("#FFFFFF")
            ball.ZIndex = 3
            Instance.new("UICorner", ball).CornerRadius = UDim.new(1, 0)
            
            local active = default
            local switchData = {Frame = toggleFrame, Active = active}
            table.insert(UI_Elements.Switches, switchData)
            
            local flagId = GetSecureFlag(text, flag)
            local function SetState(v)
                active = v
                switchData.Active = active
                if Library.ConfigElements[flagId] then
                    Library.ConfigElements[flagId].Value = active
                end
                
                local targetColor = active and Themes[CurrentTheme].ToggleActive or Color3.fromHex("#969696")
                TweenService:Create(toggleFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quart), {BackgroundColor3 = targetColor}):Play()
                
                local targetPos = active and UDim2.new(1, -18, 0.5, 0) or UDim2.new(0, 2, 0.5, 0)
                
                TweenService:Create(ball, TweenInfo.new(0.1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {Size = UDim2.new(0, 22, 0, 12)}):Play()
                TweenService:Create(ball, TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Position = targetPos}):Play()
                
                task.delay(0.1, function()
                    TweenService:Create(ball, TweenInfo.new(0.3, Enum.EasingStyle.Bounce, Enum.EasingDirection.Out), {Size = UDim2.new(0, 16, 0, 16)}):Play()
                end)

                flashFrame.BackgroundTransparency = 0.5
                flashGrad.Offset = Vector2.new(-1.5, 0)
                local flashTween = TweenService:Create(flashGrad, TweenInfo.new(0.4, Enum.EasingStyle.Sine), {Offset = Vector2.new(1.5, 0)})
                flashTween:Play()
           flashTween.Completed:Connect(function()
                flashFrame.BackgroundTransparency = 1
            end)

            local pColor = active and Themes[CurrentTheme].ToggleActive or Color3.fromHex("#969696")
            for i = 1, 14 do
                task.delay(math.random(0, 10)/100, function()
                    if not ball or not toggleFrame then return end
                    local particle = Instance.new("Frame", toggleFrame)
                    particle.Size = UDim2.new(0, 10, 0, 10)
                    particle.AnchorPoint = Vector2.new(0.5, 0.5)
                    particle.Position = ball.Position + UDim2.new(0, 0, 0, 0)
                    particle.BackgroundColor3 = pColor
                    
                    particle.ZIndex = 5
                    
                    Instance.new("UICorner", particle).CornerRadius = UDim.new(1, 0)
                    
                    local angle = math.rad(math.random(0, 360))
                    local distance = math.random(15, 35)
                    local offsetX = math.cos(angle) * distance
                    local offsetY = math.sin(angle) * distance
                    
                    local pTween = TweenService:Create(particle, TweenInfo.new(math.random(3, 5)/10, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                        Position = particle.Position + UDim2.new(0, offsetX, 0, offsetY),
                        Size = UDim2.new(0, 0, 0, 0),
                        BackgroundTransparency = 1
                    })
                    pTween:Play()
                    pTween.Completed:Connect(function() particle:Destroy() end)
                end)
            end
            
            if callback then callback(active) end
                Library:AutoSave()
            end

            Library.ConfigElements[flagId] = { Value = default, Set = SetState }

            toggleFrame.MouseButton1Click:Connect(function()
                SetState(not active)
                local status = active and "Enabled" or "Disabled"
            end)
        end
---------
---------

       function Tab:CreateLabel(titleText, descText)
            local row = Instance.new("Frame", page)
            row.AutomaticSize = Enum.AutomaticSize.Y
            row.Size = UDim2.new(1, -4, 0, 42)
            row.BackgroundColor3 = Themes[CurrentTheme].ContainerBg
            row.BackgroundTransparency = Themes[CurrentTheme].ContainerTrans
            table.insert(UI_Elements.Containers, row)
            Instance.new("UICorner", row).CornerRadius = UDim.new(0, 8)
            
            local rowStroke = Instance.new("UIStroke", row)
            rowStroke.Color = Themes[CurrentTheme].RowStroke
            rowStroke.Thickness = 1.2
            rowStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
            table.insert(UI_Elements.RowStrokes, rowStroke)
            
            local rowGrad = Instance.new("UIGradient", rowStroke)
            rowGrad.Color = Themes[CurrentTheme].RowStrokeGrad
            table.insert(UI_Elements.RowStrokeGradients, rowGrad)
            table.insert(UI_Elements.AnimatedGradients, rowGrad)

            local layout = Instance.new("UIListLayout", row)
            layout.SortOrder = Enum.SortOrder.LayoutOrder
            layout.Padding = UDim.new(0, 2)
            layout.VerticalAlignment = Enum.VerticalAlignment.Center
            layout.HorizontalAlignment = Enum.HorizontalAlignment.Left

            local padding = Instance.new("UIPadding", row)
            padding.PaddingLeft = UDim.new(0, 12)
            padding.PaddingRight = UDim.new(0, 12)
            padding.PaddingTop = UDim.new(0, 8)
            padding.PaddingBottom = UDim.new(0, 8)

            local labelTitle = nil
            if titleText and titleText ~= "" then
                labelTitle = Instance.new("TextLabel", row)
                labelTitle.Name = "Title"
                labelTitle.LayoutOrder = 1
                labelTitle.Size = UDim2.new(1, 0, 0, 20)
                labelTitle.BackgroundTransparency = 1
                labelTitle.Font = Enum.Font.GothamBold
                labelTitle.Text = titleText
                ApplyTextGradient(labelTitle)
                labelTitle.TextSize = 14
                labelTitle.TextXAlignment = Enum.TextXAlignment.Left
                labelTitle.AutomaticSize = Enum.AutomaticSize.Y
            end
            
            local labelDesc = nil
            if descText and descText ~= "" then
                labelDesc = Instance.new("TextLabel", row)
                labelDesc.Name = "Description"
                labelDesc.LayoutOrder = 2
                labelDesc.Size = UDim2.new(1, 0, 0, 0)
                labelDesc.BackgroundTransparency = 1
                labelDesc.Font = Enum.Font.GothamBold
                labelDesc.Text = descText
                labelDesc.TextColor3 = Themes[CurrentTheme].DescTextColor
                labelDesc.TextSize = 10
                labelDesc.TextXAlignment = Enum.TextXAlignment.Left
                labelDesc.TextWrapped = true
                labelDesc.AutomaticSize = Enum.AutomaticSize.Y
                table.insert(UI_Elements.Descriptions, labelDesc)
            end

            local LabelObj = {}
            function LabelObj:SetText(val)
                if labelDesc then
                    labelDesc.Text = tostring(val)
                elseif labelTitle then
                    labelTitle.Text = tostring(val)
                end
            end
            function LabelObj.SetText(self, val)
                if type(self) == "table" and val ~= nil then
                    self:SetText(val)
                else
                    LabelObj:SetText(self)
                end
            end
            function LabelObj:Set(title, desc)
                if title and labelTitle then labelTitle.Text = tostring(title) end
                if desc and labelDesc then labelDesc.Text = tostring(desc) end
            end
            return LabelObj
        end
---------

        ---------
        function Tab:CreateInput(text, placeholder, default, desc, numericOnly, callback, flag)
            local Input = {}
            local rowHeight = (desc and desc ~= "") and 64 or 48
            local row = Instance.new("Frame", page)
            row.Size = UDim2.new(1, -4, 0, rowHeight)
            row.BackgroundColor3 = Themes[CurrentTheme].ContainerBg
            row.BackgroundTransparency = Themes[CurrentTheme].ContainerTrans
            row.ClipsDescendants = true
            table.insert(UI_Elements.Containers, row)
            Instance.new("UICorner", row).CornerRadius = UDim.new(0, 10)

            local rowStroke = Instance.new("UIStroke", row)
            rowStroke.Color = Themes[CurrentTheme].RowStroke
            rowStroke.Thickness = 1.2
            rowStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
            table.insert(UI_Elements.RowStrokes, rowStroke)

            local rowGrad = Instance.new("UIGradient", rowStroke)
            rowGrad.Color = Themes[CurrentTheme].RowStrokeGrad
            table.insert(UI_Elements.RowStrokeGradients, rowGrad)
            table.insert(UI_Elements.AnimatedGradients, rowGrad)

            local title = Instance.new("TextLabel", row)
            title.Size = UDim2.new(1, -190, 0, 36)
            title.Position = UDim2.new(0, 15, 0, 4)
            title.BackgroundTransparency = 1
            title.Font = Enum.Font.GothamBold
            title.Text = text
            ApplyTextGradient(title)
            title.TextSize = 14
            title.TextXAlignment = Enum.TextXAlignment.Left

            if desc and desc ~= "" then
                local descLabel = Instance.new("TextLabel", row)
                descLabel.Size = UDim2.new(1, -190, 0, 16)
                descLabel.Position = UDim2.new(0, 15, 0, 36)
                descLabel.BackgroundTransparency = 1
                descLabel.Font = Enum.Font.GothamBold
                descLabel.Text = desc
                descLabel.TextSize = 10
                descLabel.TextColor3 = Themes[CurrentTheme].DescTextColor
                descLabel.TextXAlignment = Enum.TextXAlignment.Left
                table.insert(UI_Elements.Descriptions, descLabel)
            end

            local boxWrapper = Instance.new("Frame", row)
            boxWrapper.Size = UDim2.new(0, 120, 0, 32)
            boxWrapper.Position = UDim2.new(1, -15, 0.5, 0)
            boxWrapper.AnchorPoint = Vector2.new(1, 0.5)
            boxWrapper.BackgroundTransparency = 1

            local boxContainer = Instance.new("Frame", boxWrapper)
            boxContainer.Size = UDim2.new(1, 0, 1, 0)
            boxContainer.BackgroundColor3 = Themes[CurrentTheme].ContainerBg
            boxContainer.BackgroundTransparency = math.clamp(Themes[CurrentTheme].ContainerTrans + 0.1, 0.2, 0.95)
            boxContainer.ZIndex = 2
            boxContainer.ClipsDescendants = true
            table.insert(UI_Elements.Containers, boxContainer)
            Instance.new("UICorner", boxContainer).CornerRadius = UDim.new(0, 8)

            local boxStroke = Instance.new("UIStroke", boxContainer)
            boxStroke.Color = Themes[CurrentTheme].RowStroke
            boxStroke.Thickness = 1.2
            boxStroke.Transparency = 0.4
            table.insert(UI_Elements.RowStrokes, boxStroke)

            local boxGrad = Instance.new("UIGradient", boxStroke)
            boxGrad.Color = Themes[CurrentTheme].RowStrokeGrad
            table.insert(UI_Elements.RowStrokeGradients, boxGrad)
            table.insert(UI_Elements.AnimatedGradients, boxGrad)

            local boxScale = Instance.new("UIScale", boxWrapper)
            boxScale.Scale = 1

            local iconHolder = Instance.new("Frame", boxContainer)
            iconHolder.Size = UDim2.new(0, 24, 1, 0)
            iconHolder.Position = UDim2.new(0, 4, 0, 0)
            iconHolder.BackgroundTransparency = 1
            iconHolder.ZIndex = 4

            local iconImg = Instance.new("ImageLabel", iconHolder)
            iconImg.Size = UDim2.new(0, 15, 0, 15)
            iconImg.Position = UDim2.new(0.5, 0, 0.5, 0)
            iconImg.AnchorPoint = Vector2.new(0.5, 0.5)
            iconImg.BackgroundTransparency = 1
            iconImg.Image = "rbxassetid://6031154871"
            iconImg.ImageColor3 = Themes[CurrentTheme].DescTextColor
            iconImg.ZIndex = 4

            local flashFrame = Instance.new("Frame", boxContainer)
            flashFrame.Size = UDim2.new(1, 0, 1, 0)
            flashFrame.BackgroundColor3 = Color3.fromHex("#FFFFFF")
            flashFrame.BackgroundTransparency = 1
            flashFrame.ClipsDescendants = true
            flashFrame.ZIndex = 6
            Instance.new("UICorner", flashFrame).CornerRadius = UDim.new(0, 8)

            local flashGrad = Instance.new("UIGradient", flashFrame)
            flashGrad.Color = Themes[CurrentTheme].LoopSeq
            flashGrad.Transparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 1),
                NumberSequenceKeypoint.new(0.5, 0),
                NumberSequenceKeypoint.new(1, 1)
            })
            flashGrad.Rotation = 35
            flashGrad.Offset = Vector2.new(-1, 0)

            local function PlayNeonFlash()
                flashFrame.BackgroundTransparency = 0.5
                flashGrad.Offset = Vector2.new(-1.8, 0)
                local flashTween = TweenService:Create(flashGrad, TweenInfo.new(0.5, Enum.EasingStyle.Sine), {Offset = Vector2.new(1.8, 0)})
                flashTween:Play()
                flashTween.Completed:Connect(function()
                    flashFrame.BackgroundTransparency = 1
                end)
            end

            local function EmitNeonParticles(amount)
                amount = amount or 10
                if not boxWrapper or not boxWrapper.Parent then return end
                for i = 1, amount do
                    local p = Instance.new("Frame", boxWrapper)
                    p.Size = UDim2.new(0, math.random(3, 6), 0, math.random(3, 6))
                    p.Position = UDim2.new(0.5, 0, 0.5, 0)
                    p.AnchorPoint = Vector2.new(0.5, 0.5)
                    p.BackgroundColor3 = Themes[CurrentTheme].ToggleActive
                    p.ZIndex = 20
                    Instance.new("UICorner", p).CornerRadius = UDim.new(1, 0)

                    local angle = math.rad(math.random(0, 360))
                    local dist = math.random(15, 38)
                    local offX = math.cos(angle) * dist
                    local offY = math.sin(angle) * dist

                    local tw = TweenService:Create(p, TweenInfo.new(math.random(4, 7)/10, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
                        Position = p.Position + UDim2.new(0, offX, 0, offY),
                        Size = UDim2.new(0, 0, 0, 0),
                        BackgroundTransparency = 1
                    })
                    tw:Play()
                    tw.Completed:Connect(function() p:Destroy() end)
                end
            end

            local textBox = Instance.new("TextBox", boxContainer)
            textBox.Size = UDim2.new(1, -34, 1, 0)
            textBox.Position = UDim2.new(0, 28, 0, 0)
            textBox.BackgroundTransparency = 1
            textBox.Font = Enum.Font.GothamBold
            textBox.Text = default and tostring(default) or ""
            textBox.PlaceholderText = placeholder or "Type here..."
            textBox.PlaceholderColor3 = Themes[CurrentTheme].DescTextColor
            textBox.TextSize = 12
            textBox.ClearTextOnFocus = true
            textBox.ClipsDescendants = true
            textBox.ZIndex = 4
            ApplyTextGradient(textBox)

            local flagId = GetSecureFlag(text, flag)
            local function SetValue(val)
                local strVal = tostring(val)
                if numericOnly then
                    strVal = strVal:gsub("%D+", "")
                end
                textBox.Text = strVal
                if Library.ConfigElements[flagId] then
                    Library.ConfigElements[flagId].Value = strVal
                end
                if callback then callback(strVal) end
                Library:AutoSave()
            end

            Library.ConfigElements[flagId] = { Value = default or "", Set = SetValue }

            local lastMousePos = Vector2.new(0, 0)
            row.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                    lastMousePos = Vector2.new(input.Position.X, input.Position.Y)
                end
            end)

            textBox.Focused:Connect(function()
                TweenService:Create(boxScale, TweenInfo.new(0.18, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {Scale = 0.96}):Play()
                TweenService:Create(boxStroke, TweenInfo.new(0.25), {
                    Color = Themes[CurrentTheme].ToggleActive, 
                    Thickness = 1.6, 
                    Transparency = 0
                }):Play()
                TweenService:Create(iconImg, TweenInfo.new(0.25), {ImageColor3 = Themes[CurrentTheme].ToggleActive}):Play()
                
                TweenService:Create(row, TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                    Rotation = -0.4,
                    BackgroundTransparency = math.clamp(Themes[CurrentTheme].ContainerTrans + 0.12, 0, 1)
                }):Play()

                local ripple = Instance.new("Frame")
                ripple.Name = "LiquidRipple"
                ripple.Parent = row
                ripple.BackgroundColor3 = Themes[CurrentTheme].ToggleActive
                ripple.BorderSizePixel = 0
                ripple.ZIndex = 1
                Instance.new("UICorner", ripple).CornerRadius = UDim.new(1, 0)

                local ripGrad = Instance.new("UIGradient", ripple)
                ripGrad.Color = Themes[CurrentTheme].LoopSeq
                ripGrad.Transparency = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 0.2),
                    NumberSequenceKeypoint.new(0.7, 0.5),
                    NumberSequenceKeypoint.new(1, 1)
                })

                local relativeX = lastMousePos.X - row.AbsolutePosition.X
                local relativeY = lastMousePos.Y - row.AbsolutePosition.Y
                if lastMousePos.X == 0 and lastMousePos.Y == 0 then
                    relativeX = boxWrapper.AbsolutePosition.X - row.AbsolutePosition.X
                    relativeY = boxWrapper.AbsolutePosition.Y - row.AbsolutePosition.Y
                end

                ripple.Position = UDim2.new(0, relativeX, 0, relativeY)
                ripple.Size = UDim2.new(0, 0, 0, 0)
                ripple.AnchorPoint = Vector2.new(0.5, 0.5)

                local maxDim = math.max(row.AbsoluteSize.X, row.AbsoluteSize.Y) * 1.6
                local ripTween = TweenService:Create(ripple, TweenInfo.new(0.55, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
                    Size = UDim2.new(0, maxDim, 0, maxDim),
                    BackgroundTransparency = 1
                })
                ripTween:Play()
                ripTween.Completed:Connect(function() ripple:Destroy() end)
            end)

            textBox:GetPropertyChangedSignal("Text"):Connect(function()
                if numericOnly then
                    local clean = textBox.Text:gsub("%D+", "")
                    if clean ~= textBox.Text then
                        textBox.Text = clean
                    end
                end
            end)

            textBox.FocusLost:Connect(function()
                TweenService:Create(boxScale, TweenInfo.new(0.35, Enum.EasingStyle.Bounce, Enum.EasingDirection.Out), {Scale = 1}):Play()
                TweenService:Create(boxStroke, TweenInfo.new(0.3), {
                    Color = Themes[CurrentTheme].RowStroke, 
                    Thickness = 1.2, 
                    Transparency = 0.4
                }):Play()
                TweenService:Create(iconImg, TweenInfo.new(0.3), {ImageColor3 = Themes[CurrentTheme].DescTextColor}):Play()
                
                TweenService:Create(row, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
                    Rotation = 0,
                    BackgroundTransparency = Themes[CurrentTheme].ContainerTrans
                }):Play()

                PlayNeonFlash()
                EmitNeonParticles(12)
                SetValue(textBox.Text)
            end)

            function Input:Set(val)
                SetValue(val)
            end

            function Input:Get()
                return textBox.Text
            end

            return Input
        end
---------


        function Tab:CreateParagraph(titleText, descText)
            local Paragraph = {}
            local row = Instance.new("Frame", page)
            row.AutomaticSize = Enum.AutomaticSize.Y
            row.Size = UDim2.new(1, -4, 0, 0)
            row.BackgroundColor3 = Themes[CurrentTheme].ContainerBg
            row.BackgroundTransparency = Themes[CurrentTheme].ContainerTrans
            table.insert(UI_Elements.Containers, row)
            Instance.new("UICorner", row).CornerRadius = UDim.new(0, 8) 
            
            local rowStroke = Instance.new("UIStroke", row)
            rowStroke.Color = Themes[CurrentTheme].RowStroke 
            rowStroke.Thickness = 1.2 
            rowStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border 
            table.insert(UI_Elements.RowStrokes, rowStroke)
            
            local rowGrad = Instance.new("UIGradient", rowStroke)
            rowGrad.Color = Themes[CurrentTheme].RowStrokeGrad 
            table.insert(UI_Elements.RowStrokeGradients, rowGrad)
            table.insert(UI_Elements.AnimatedGradients, rowGrad)

            local layout = Instance.new("UIListLayout", row)
            layout.SortOrder = Enum.SortOrder.LayoutOrder
            layout.Padding = UDim.new(0, 4)
            layout.VerticalAlignment = Enum.VerticalAlignment.Center
            layout.HorizontalAlignment = Enum.HorizontalAlignment.Left

            local padding = Instance.new("UIPadding", row)
            padding.PaddingLeft = UDim.new(0, 12)
            padding.PaddingRight = UDim.new(0, 12)
            padding.PaddingTop = UDim.new(0, 10)
            padding.PaddingBottom = UDim.new(0, 10)

            local labelTitle = nil
            if titleText and titleText ~= "" then
                labelTitle = Instance.new("TextLabel", row)
                labelTitle.Name = "ParagraphTitle"
                labelTitle.LayoutOrder = 1
                labelTitle.Size = UDim2.new(1, 0, 0, 20)
                labelTitle.BackgroundTransparency = 1
                labelTitle.Font = Enum.Font.GothamBold 
                labelTitle.Text = titleText
                ApplyTextGradient(labelTitle)
                labelTitle.TextSize = 14 
                labelTitle.TextXAlignment = Enum.TextXAlignment.Left 
                labelTitle.AutomaticSize = Enum.AutomaticSize.Y
            end

            local labelDesc = nil
            if descText and descText ~= "" then
                labelDesc = Instance.new("TextLabel", row)
                labelDesc.Name = "ParagraphContent"
                labelDesc.LayoutOrder = 2
                labelDesc.Size = UDim2.new(1, 0, 0, 0)
                labelDesc.BackgroundTransparency = 1
                labelDesc.Font = Enum.Font.GothamBold
                labelDesc.Text = descText
                labelDesc.TextColor3 = Themes[CurrentTheme].DescTextColor
                labelDesc.TextSize = 10
                labelDesc.TextXAlignment = Enum.TextXAlignment.Left
                labelDesc.TextWrapped = true
                labelDesc.AutomaticSize = Enum.AutomaticSize.Y
                table.insert(UI_Elements.Descriptions, labelDesc)
            end
            
            function Paragraph:Set(arg1, arg2)
                if type(arg1) == "table" then
                    if arg1.Title and labelTitle then
                        labelTitle.Text = arg1.Title
                    end
                    if arg1.Content and labelDesc then
                        labelDesc.Text = arg1.Content
                    end
                elseif type(arg1) == "string" and type(arg2) == "string" then
                    if labelTitle then labelTitle.Text = arg1 end
                    if labelDesc then labelDesc.Text = arg2 end
                elseif type(arg1) == "string" and not arg2 then
                    if labelDesc then labelDesc.Text = arg1 end
                end
            end

            return Paragraph
        end
---------
    ---------
        function Tab:CreateSlider(text, min, max, default, desc, callback, flag)
            local rowHeight = (desc and desc ~= "") and 76 or 60
            local containerHeight = (desc and desc ~= "") and 81 or 65

            local container = Instance.new("Frame", page)
            container.Size = UDim2.new(1, -4, 0, containerHeight)
            container.BackgroundTransparency = 1
            
            local row = Instance.new("Frame", container)
            row.Size = UDim2.new(1, 0, 0, rowHeight)
            row.BackgroundColor3 = Themes[CurrentTheme].ContainerBg
            row.BackgroundTransparency = Themes[CurrentTheme].ContainerTrans
            table.insert(UI_Elements.Containers, row)
            Instance.new("UICorner", row).CornerRadius = UDim.new(0, 10)
            
            local rowStroke = Instance.new("UIStroke", row)
            rowStroke.Color = Themes[CurrentTheme].RowStroke
            rowStroke.Thickness = 1.2
            table.insert(UI_Elements.RowStrokes, rowStroke)
            
            local rowGrad = Instance.new("UIGradient", rowStroke)
            rowGrad.Color = Themes[CurrentTheme].RowStrokeGrad
            table.insert(UI_Elements.RowStrokeGradients, rowGrad)
            table.insert(UI_Elements.AnimatedGradients, rowGrad)
            
            local label = Instance.new("TextLabel", row)
            label.Size = UDim2.new(0.6, 0, 0, 30)
            label.Position = UDim2.new(0, 15, 0, 5)
            label.BackgroundTransparency = 1
            label.Font = Enum.Font.GothamBold
            label.Text = text
            ApplyTextGradient(label)
            label.TextSize = 14
            label.TextXAlignment = Enum.TextXAlignment.Left

            if desc and desc ~= "" then
                local descLabel = Instance.new("TextLabel", row)
                descLabel.Size = UDim2.new(1, -80, 0, 15)
                descLabel.Position = UDim2.new(0, 15, 0, 30)
                descLabel.BackgroundTransparency = 1
                descLabel.Font = Enum.Font.GothamBold
                descLabel.Text = desc
                descLabel.TextSize = 10
                descLabel.TextColor3 = Themes[CurrentTheme].DescTextColor
                descLabel.TextXAlignment = Enum.TextXAlignment.Left
                table.insert(UI_Elements.Descriptions, descLabel)
            end

            local inputField = Instance.new("TextBox", row)
            inputField.Size = UDim2.new(0, 50, 0, 22)
            inputField.Position = UDim2.new(1, -65, 0, 10)
            inputField.BackgroundColor3 = Color3.fromHex("#000000")
            inputField.BackgroundTransparency = 0.9
            inputField.Font = Enum.Font.GothamBold
            inputField.Text = tostring(default)
            ApplyTextGradient(inputField)
            inputField.TextSize = 12
            Instance.new("UICorner", inputField).CornerRadius = UDim.new(0, 5)
            
            local flashFrame = Instance.new("Frame", inputField)
            flashFrame.Size = UDim2.new(1, 0, 1, 0)
            flashFrame.BackgroundColor3 = Color3.fromHex("#FFFFFF")
            flashFrame.BackgroundTransparency = 1
            flashFrame.ClipsDescendants = true
            Instance.new("UICorner", flashFrame).CornerRadius = UDim.new(0, 5)
            
            local flashGrad = Instance.new("UIGradient", flashFrame)
            flashGrad.Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromHex("#FFFFFF")),
                ColorSequenceKeypoint.new(0.5, Color3.fromHex("#FFFFFF")),
                ColorSequenceKeypoint.new(1, Color3.fromHex("#FFFFFF"))
            })
            flashGrad.Transparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 1),
                NumberSequenceKeypoint.new(0.5, 0),
                NumberSequenceKeypoint.new(1, 1)
            })
            flashGrad.Rotation = 45
            flashGrad.Offset = Vector2.new(-1, 0)

            local function PlayNeonPulse()
                flashFrame.BackgroundTransparency = 0.4
                flashGrad.Offset = Vector2.new(-1.5, 0)
                local flashTween = TweenService:Create(flashGrad, TweenInfo.new(0.5, Enum.EasingStyle.Sine), {Offset = Vector2.new(1.5, 0)})
                flashTween:Play()
                flashTween.Completed:Connect(function()
                    flashFrame.BackgroundTransparency = 1
                end)
            end
            
            local sliderBg = Instance.new("Frame", row)
            sliderBg.Size = UDim2.new(1, -30, 0, 6)
            local sliderYPos = (desc and desc ~= "") and 60 or 45
            sliderBg.Position = UDim2.new(0, 15, 0, sliderYPos)
            sliderBg.BackgroundColor3 = Color3.fromHex("#FFFFFF")
            sliderBg.BackgroundTransparency = 0.9
            Instance.new("UICorner", sliderBg).CornerRadius = UDim.new(1, 0)
            
            local sliderHitbox = Instance.new("TextButton", sliderBg)
            sliderHitbox.Size = UDim2.new(1, 0, 1, 20)
            sliderHitbox.Position = UDim2.new(0, 0, 0.5, 0)
            sliderHitbox.AnchorPoint = Vector2.new(0, 0.5)
            sliderHitbox.BackgroundTransparency = 1
            sliderHitbox.Text = ""
            sliderHitbox.ZIndex = 4

            local sliderFill = Instance.new("Frame", sliderBg)
            sliderFill.Size = UDim2.new((default - min) / (max - min), 0, 1, 0)
            sliderFill.BackgroundColor3 = Color3.fromHex("#FFFFFF")
            sliderFill.BorderSizePixel = 0
            Instance.new("UICorner", sliderFill).CornerRadius = UDim.new(1, 0)
            
            local fillGrad = Instance.new("UIGradient", sliderFill)
            fillGrad.Color = Themes[CurrentTheme].TextGrad
            table.insert(UI_Elements.AnimatedGradients, fillGrad)

            local circle = Instance.new("Frame", sliderFill)
            circle.Size = UDim2.new(0, 65, 2, 60)
            circle.Position = UDim2.new(1, 0, 0.5, 0)
            circle.AnchorPoint = Vector2.new(0.5, 0.5)
            circle.BackgroundTransparency = 1
            circle.ZIndex = 5

            local circleVisual = Instance.new("Frame", circle)
            circleVisual.Size = UDim2.new(0, 14, 0, 14)
            circleVisual.Position = UDim2.new(0.5, 0, 0.5, 0)
            circleVisual.AnchorPoint = Vector2.new(0.5, 0.5)
            circleVisual.BackgroundColor3 = Color3.fromHex("#FFFFFF")
            Instance.new("UICorner", circleVisual).CornerRadius = UDim.new(1, 0)
            
            local function EmitParticles(amount)
                amount = amount or 15
                if not sliderBg or not sliderBg.Parent then return end
                for i = 1, amount do
                    local p = Instance.new("Frame", sliderBg)
                    p.Size = UDim2.new(0, math.random(3, 6), 0, math.random(3, 6))
                    p.Position = UDim2.new(sliderFill.Size.X.Scale, 0, 0.5, 0)
                    p.AnchorPoint = Vector2.new(0.5, 0.5)
                    p.BackgroundColor3 = Themes[CurrentTheme] and Themes[CurrentTheme].ToggleActive or Color3.fromHex("#FFFFFF")
                    p.ZIndex = 10
                    Instance.new("UICorner", p).CornerRadius = UDim.new(1, 0)
                    
                    local angle = math.rad(math.random(0, 360))
                    local dist = math.random(15, 35)
                    local offX = math.cos(angle) * dist
                    local offY = math.sin(angle) * dist
                    
                    local tw = TweenService:Create(p, TweenInfo.new(math.random(4, 8)/10, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
                        Position = p.Position + UDim2.new(0, offX, 0, offY),
                        Size = UDim2.new(0, 0, 0, 0),
                        BackgroundTransparency = 1
                    })
                    tw:Play()
                    tw.Completed:Connect(function() p:Destroy() end)
                end
            end

            local flagId = GetSecureFlag(text, flag)
            local function SetValue(val)
                val = math.clamp(val, min, max)
                sliderFill.Size = UDim2.new((val - min) / (max - min), 0, 1, 0)
                inputField.Text = tostring(val)
                if Library.ConfigElements[flagId] then
                    Library.ConfigElements[flagId].Value = val
                end
                if callback then callback(val) end
            end

            Library.ConfigElements[flagId] = { Value = default, Set = SetValue }

            local lastEmit = 0
            local function move(input)
                local pos = math.clamp((input.Position.X - sliderBg.AbsolutePosition.X) / sliderBg.AbsoluteSize.X, 0, 1)
                local value = math.floor(min + (max - min) * pos)
                SetValue(value)
                
                if tick() - lastEmit > 0.06 then
                    lastEmit = tick()
                    EmitParticles(2)
                end
            end
            
            local dragging = false
            circle.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then 
                    dragging = true 
                    EmitParticles(10)
                    TweenService:Create(circleVisual, TweenInfo.new(0.1, Enum.EasingStyle.Sine), {Size = UDim2.new(0, 10, 0, 10)}):Play()
                end
            end)
            
            sliderHitbox.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                    dragging = true 
                    local pos = math.clamp((input.Position.X - sliderBg.AbsolutePosition.X) / sliderBg.AbsoluteSize.X, 0, 1)
                    local value = math.floor(min + (max - min) * pos)
                    
                    TweenService:Create(circleVisual, TweenInfo.new(0.15, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {Size = UDim2.new(0, 0, 0, 0)}):Play()
                    
                    SetValue(value)
                    EmitParticles(10)
                    
                    TweenService:Create(circleVisual, TweenInfo.new(0.4, Enum.EasingStyle.Bounce, Enum.EasingDirection.Out), {Size = UDim2.new(0, 14, 0, 14)}):Play()
                end
            end)

            UserInputService.InputEnded:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                    if dragging then
                        dragging = false
                        TweenService:Create(circleVisual, TweenInfo.new(0.3, Enum.EasingStyle.Bounce), {Size = UDim2.new(0, 14, 0, 14)}):Play()
                        Library:AutoSave()
                    end
                end
            end)
            
            UserInputService.InputChanged:Connect(function(input)
                if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then 
                    move(input) 
                end
            end)

            inputField.FocusLost:Connect(function()
                local val = tonumber(inputField.Text)
                if not val then val = default end
                val = math.clamp(val, min, max)
                
                inputField.Text = tostring(val)
                TweenService:Create(sliderFill, TweenInfo.new(0.2), {Size = UDim2.new((val - min) / (max - min), 0, 1, 0)}):Play()
                PlayNeonPulse()
                EmitParticles(15)
                
                if Library.ConfigElements[flagId] then
                    Library.ConfigElements[flagId].Value = val
                end
                if callback then callback(val) end
                Library:AutoSave()
            end)
        end
---------

        ---------
    function Tab:CreateCopy(titleText, contentToCopy, descText)
        local rowHeight = (descText and descText ~= "") and 65 or 50
        local row = Instance.new("Frame", page)
        row.Size = UDim2.new(1, -4, 0, rowHeight)
        row.BackgroundColor3 = Themes[CurrentTheme].ContainerBg
        row.BackgroundTransparency = Themes[CurrentTheme].ContainerTrans
        row.ClipsDescendants = true
        table.insert(UI_Elements.Containers, row)
        Instance.new("UICorner", row).CornerRadius = UDim.new(0, 8)
            
            local rowStroke = Instance.new("UIStroke", row)
            rowStroke.Color = Themes[CurrentTheme].RowStroke
            rowStroke.Thickness = 1.2
            rowStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
            table.insert(UI_Elements.RowStrokes, rowStroke)
            
            local rowGrad = Instance.new("UIGradient", rowStroke)
            rowGrad.Color = Themes[CurrentTheme].RowStrokeGrad
            table.insert(UI_Elements.RowStrokeGradients, rowGrad)
            table.insert(UI_Elements.AnimatedGradients, rowGrad)

            local title = Instance.new("TextLabel", row)
            title.Size = UDim2.new(1, -50, 0, 30)
            title.Position = UDim2.new(0, 12, 0, 10)
            title.BackgroundTransparency = 1
            title.Font = Enum.Font.GothamBold
            title.Text = titleText
            ApplyTextGradient(title)
            title.TextSize = 13.5
            title.TextXAlignment = Enum.TextXAlignment.Left

            if descText and descText ~= "" then
                title.Position = UDim2.new(0, 12, 0, 5)
                local descLabel = Instance.new("TextLabel", row)
                descLabel.Size = UDim2.new(1, -60, 0, 20)
                descLabel.Position = UDim2.new(0, 12, 0, 28)
                descLabel.BackgroundTransparency = 1
                descLabel.Font = Enum.Font.GothamBold
                descLabel.Text = descText
                descLabel.TextSize = 10
                descLabel.TextColor3 = Themes[CurrentTheme].DescTextColor
                descLabel.TextXAlignment = Enum.TextXAlignment.Left
                descLabel.TextWrapped = true
                table.insert(UI_Elements.Descriptions, descLabel)
            end

            local copyBtn = Instance.new("TextButton", row)
            copyBtn.Size = UDim2.new(0, 30, 0, 30)
            copyBtn.Position = UDim2.new(1, -5, 0, 5)
            copyBtn.AnchorPoint = Vector2.new(1, 0)
            copyBtn.BackgroundTransparency = 1
            copyBtn.Text = ""
            
            local coreContainer = Instance.new("Frame", copyBtn)
            coreContainer.AnchorPoint = Vector2.new(0.5, 0.5)
            coreContainer.Position = UDim2.new(0.5, 0, 0.5, 0)
            coreContainer.Size = UDim2.new(1, 0, 1, 0)
            coreContainer.BackgroundTransparency = 1
            
            local uiScale = Instance.new("UIScale", coreContainer)
            uiScale.Scale = 1
            
            local coreLayers = {}
            local baseSizes = {8, 12, 16, 20, 24, 28} 
            local baseTransparencies = {0.1, 0.3, 0.5, 0.7, 0.85, 0.93}
            
            for i = 1, #baseSizes do
                local layer = Instance.new("Frame")
                layer.AnchorPoint = Vector2.new(0.5, 0.5)
                layer.Position = UDim2.new(0.5, 0, 0.5, 0)
                layer.BorderSizePixel = 0
                layer.ZIndex = 3
                Instance.new("UICorner", layer).CornerRadius = UDim.new(1, 0)
                layer.Parent = coreContainer
                table.insert(coreLayers, {frame = layer, baseSize = baseSizes[i], baseTrans = baseTransparencies[i]})
            end
            
            local r = 0
            local isClicked = false
            local clickTime = 0
            
            local renderConn
            renderConn = RunService.RenderStepped:Connect(function()
                if not copyBtn.Parent then
                    if renderConn then renderConn:Disconnect() end
                    return
                end
                
                r = (r + 1.5) % 360
                local t = Themes[CurrentTheme]
                
               local c1, c2
                if isClicked then
                    c1 = t.ToggleActive
                    c2 = t.ToggleActive
                else
                    c1 = Color3.fromRGB(150, 150, 150)
                    c2 = Color3.fromRGB(150, 150, 150)
                end
                
                local pulse = (math.sin(tick() * 3) + 1) / 2
                local coreColor = c1:Lerp(c2, math.abs(math.sin((r / 360) * math.pi)))
                
                for _, data in ipairs(coreLayers) do
                    local sizeOffset = pulse * 3
                    local targetSize = data.baseSize + sizeOffset
                    data.frame.Size = UDim2.new(0, targetSize, 0, targetSize)
                    data.frame.BackgroundColor3 = coreColor
                    data.frame.BackgroundTransparency = math.clamp(data.baseTrans + (pulse * 0.05), 0, 1)
                end
                
                if isClicked and tick() - clickTime >= 0.5 then
                    isClicked = false
                    TweenService:Create(uiScale, TweenInfo.new(0.3, Enum.EasingStyle.Bounce), {Scale = 1}):Play()
                end
            end)

           local lastMousePos = Vector2.new(0, 0)
        
        copyBtn.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                lastMousePos = Vector2.new(input.Position.X, input.Position.Y)
                TweenService:Create(uiScale, TweenInfo.new(0.1, Enum.EasingStyle.Sine), {Scale = 0.8}):Play()
                
                TweenService:Create(row, TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                    Rotation = -0.5, 
                    BackgroundTransparency = math.clamp(Themes[CurrentTheme].ContainerTrans + 0.15, 0, 1)
                }):Play()
            end
        end)
        
        copyBtn.InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                if not isClicked then
                    TweenService:Create(uiScale, TweenInfo.new(0.1, Enum.EasingStyle.Sine), {Scale = 1}):Play()
                end
                TweenService:Create(row, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
                    Rotation = 0, 
                    BackgroundTransparency = Themes[CurrentTheme].ContainerTrans
                }):Play()
            end
        end)
        
        copyBtn.MouseButton1Click:Connect(function()
            isClicked = true
            clickTime = tick()
            TweenService:Create(uiScale, TweenInfo.new(0.3, Enum.EasingStyle.Bounce), {Scale = 1.3}):Play()
            
            local ripple = Instance.new("Frame")
            ripple.Name = "LiquidRipple"
            ripple.Parent = row
            ripple.BackgroundColor3 = Themes[CurrentTheme].ToggleActive
            ripple.BorderSizePixel = 0
            ripple.ZIndex = 4
            Instance.new("UICorner", ripple).CornerRadius = UDim.new(1, 0)
            
            local ripGrad = Instance.new("UIGradient", ripple)
            ripGrad.Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Themes[CurrentTheme].ToggleActive),
                ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))
            })
            ripGrad.Transparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 0),
                NumberSequenceKeypoint.new(0.7, 0.4),
                NumberSequenceKeypoint.new(1, 1)
            })
            
            local relativeX = lastMousePos.X - row.AbsolutePosition.X
            local relativeY = lastMousePos.Y - row.AbsolutePosition.Y
            
            if lastMousePos.X == 0 and lastMousePos.Y == 0 then
                relativeX = copyBtn.AbsolutePosition.X + copyBtn.AbsoluteSize.X / 2 - row.AbsolutePosition.X
                relativeY = copyBtn.AbsolutePosition.Y + copyBtn.AbsoluteSize.Y / 2 - row.AbsolutePosition.Y
            end
            
            ripple.Position = UDim2.new(0, relativeX, 0, relativeY)
            ripple.Size = UDim2.new(0, 0, 0, 0)
            ripple.AnchorPoint = Vector2.new(0.5, 0.5)
            
            local maxDim = math.max(row.AbsoluteSize.X, row.AbsoluteSize.Y) * 1.5
            local ripTween = TweenService:Create(ripple, TweenInfo.new(0.6, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
                Size = UDim2.new(0, maxDim, 0, maxDim),
                BackgroundTransparency = 1
            })
            ripTween:Play()
            ripTween.Completed:Connect(function() ripple:Destroy() end)
            
            local clipboardFunc = setclipboard or toclipboard or function(text) warn("Clipboard: " .. tostring(text)) end
            clipboardFunc(contentToCopy)
            Library:SendNotification("Copied Successfully", titleText)
        end)
    end

---------
    function Tab:CreateConfigBoard(descText)
        local closedHeight = 96
        local expandedHeight = 310
        local isExpanded = true

        local container = Instance.new("Frame", page)
        container.Size = UDim2.new(1, -4, 0, expandedHeight)
        container.Position = UDim2.new(0, 2, 0, 0)
        container.BackgroundColor3 = Themes[CurrentTheme].ContainerBg
        container.BackgroundTransparency = Themes[CurrentTheme].ContainerTrans
        container.ClipsDescendants = true
        table.insert(UI_Elements.Containers, container)
        Instance.new("UICorner", container).CornerRadius = UDim.new(0, 10)

        local containerStroke = Instance.new("UIStroke", container)
        containerStroke.Color = Themes[CurrentTheme].RowStroke
        containerStroke.Thickness = 1.2
        containerStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        table.insert(UI_Elements.RowStrokes, containerStroke)

        local containerGrad = Instance.new("UIGradient", containerStroke)
        containerGrad.Color = Themes[CurrentTheme].RowStrokeGrad
        table.insert(UI_Elements.RowStrokeGradients, containerGrad)
        table.insert(UI_Elements.AnimatedGradients, containerGrad)

        local headerBtn = Instance.new("TextButton", container)
        headerBtn.Size = UDim2.new(1, 0, 0, 52)
        headerBtn.Position = UDim2.new(0, 0, 0, 0)
        headerBtn.BackgroundTransparency = 1
        headerBtn.Text = ""

        local titleLabel = Instance.new("TextLabel", headerBtn)
        titleLabel.Size = UDim2.new(1, -65, 0, 24)
        titleLabel.Position = UDim2.new(0, 15, 0, 6)
        titleLabel.BackgroundTransparency = 1
        titleLabel.Font = Enum.Font.GothamBold
        titleLabel.Text = "Configuration Board"
        ApplyTextGradient(titleLabel)
        titleLabel.TextSize = 14
        titleLabel.TextXAlignment = Enum.TextXAlignment.Left

        if descText and descText ~= "" then
            local descLabel = Instance.new("TextLabel", headerBtn)
            descLabel.Size = UDim2.new(1, -65, 0, 16)
            descLabel.Position = UDim2.new(0, 15, 0, 28)
            descLabel.BackgroundTransparency = 1
            descLabel.Font = Enum.Font.GothamBold
            descLabel.Text = descText
            descLabel.TextSize = 10
            descLabel.TextColor3 = Themes[CurrentTheme].DescTextColor
            descLabel.TextXAlignment = Enum.TextXAlignment.Left
            table.insert(UI_Elements.Descriptions, descLabel)
        end


        local arrowWrapper = Instance.new("Frame", headerBtn)
        arrowWrapper.Size = UDim2.new(0, 30, 0, 30)
        arrowWrapper.Position = UDim2.new(1, -15, 0.5, 0)
        arrowWrapper.AnchorPoint = Vector2.new(1, 0.5)
        arrowWrapper.BackgroundColor3 = Themes[CurrentTheme].ContainerBg
        arrowWrapper.BackgroundTransparency = Themes[CurrentTheme].ContainerTrans
        table.insert(UI_Elements.Containers, arrowWrapper)
        Instance.new("UICorner", arrowWrapper).CornerRadius = UDim.new(0, 8)


        local arrowStroke = Instance.new("UIStroke", arrowWrapper)
        arrowStroke.Thickness = 1.2
        arrowStroke.Color = Themes[CurrentTheme].RowStroke
        arrowStroke.Transparency = 0.2
        table.insert(UI_Elements.RowStrokes, arrowStroke)

        local arrowGrad = Instance.new("UIGradient", arrowStroke)
        arrowGrad.Rotation = -90
        arrowGrad.Color = Themes[CurrentTheme].RowStrokeGrad
        table.insert(UI_Elements.RowStrokeGradients, arrowGrad)


        local arrowScale = Instance.new("UIScale", arrowWrapper)
        arrowScale.Scale = 1


        local arrow = Instance.new("TextLabel", arrowWrapper)
        arrow.Size = UDim2.new(1, 0, 1, 0)
        arrow.BackgroundTransparency = 1
        arrow.Font = Enum.Font.GothamBold
        arrow.Text = "▼"
        arrow.TextSize = 10
        arrow.Rotation = 180
        arrow.AnchorPoint = Vector2.new(0.5, 0.5)
        arrow.Position = UDim2.new(0.5, 0, 0.5, 0)
        ApplyTextGradient(arrow)

        local boardFrame = Instance.new("Frame", container)
        boardFrame.Size = UDim2.new(1, -26, 1, -66)
        boardFrame.Position = UDim2.new(0, 13, 0, 52)
        boardFrame.BackgroundColor3 = Color3.fromHex("#000000")
        boardFrame.BackgroundTransparency = 0.65
        boardFrame.ClipsDescendants = true
        local boardCorner = Instance.new("UICorner", boardFrame)
        boardCorner.CornerRadius = UDim.new(0, 8)

        local boardStroke = Instance.new("UIStroke", boardFrame)
        boardStroke.Color = Themes[CurrentTheme].RowStroke
        boardStroke.Thickness = 1
        boardStroke.Transparency = 0.5
        table.insert(UI_Elements.RowStrokes, boardStroke)

        local inputBox = Instance.new("TextBox", boardFrame)
        inputBox.Size = UDim2.new(1, 0, 1, 0)
        inputBox.BackgroundTransparency = 1
        inputBox.Font = Enum.Font.Code
        inputBox.Text = ""
        inputBox.PlaceholderText = "Paste your JSON config here to sync..."
        ApplyTextGradient(inputBox)
        inputBox.TextSize = 11
        inputBox.TextXAlignment = Enum.TextXAlignment.Left
        inputBox.TextYAlignment = Enum.TextYAlignment.Top
        inputBox.ClearTextOnFocus = false
        inputBox.MultiLine = true
        inputBox.TextWrapped = true


        local boxPadding = Instance.new("UIPadding", inputBox)
        boxPadding.PaddingLeft = UDim.new(0, 14)
        boxPadding.PaddingRight = UDim.new(0, 14)
        boxPadding.PaddingTop = UDim.new(0, 6)
        boxPadding.PaddingBottom = UDim.new(0, 6)

        local lastClickPos = Vector2.new(0, 0)
        headerBtn.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                lastClickPos = Vector2.new(input.Position.X, input.Position.Y)
                TweenService:Create(arrowScale, TweenInfo.new(0.1, Enum.EasingStyle.Sine), {Scale = 0.8}):Play()
                TweenService:Create(container, TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                    Rotation = -0.5,
                    BackgroundTransparency = math.clamp(Themes[CurrentTheme].ContainerTrans + 0.15, 0, 1)
                }):Play()
            end
        end)

        headerBtn.InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                TweenService:Create(arrowScale, TweenInfo.new(0.1, Enum.EasingStyle.Sine), {Scale = 1}):Play()
                TweenService:Create(container, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
                    Rotation = 0,
                    BackgroundTransparency = Themes[CurrentTheme].ContainerTrans
                }):Play()
            end
        end)

        headerBtn.MouseButton1Click:Connect(function()
            isExpanded = not isExpanded
            local targetHeight = isExpanded and expandedHeight or closedHeight
            local targetRotation = isExpanded and 180 or 0
            local targetBoardHeight = isExpanded and UDim2.new(1, -26, 1, -66) or UDim2.new(1, -26, 0, 32)
            local targetCornerRadius = isExpanded and UDim.new(0, 8) or UDim.new(1, 0)

            inputBox.TextYAlignment = isExpanded and Enum.TextYAlignment.Top or Enum.TextYAlignment.Center

            TweenService:Create(arrowScale, TweenInfo.new(0.3, Enum.EasingStyle.Bounce), {Scale = 1.3}):Play()
            task.delay(0.25, function()
                TweenService:Create(arrowScale, TweenInfo.new(0.2, Enum.EasingStyle.Sine), {Scale = 1}):Play()
            end)

            local ripple = Instance.new("Frame", container)
            ripple.Name = "LiquidRipple"
            ripple.BackgroundColor3 = Themes[CurrentTheme].ToggleActive
            ripple.BorderSizePixel = 0
            ripple.ZIndex = 4
            Instance.new("UICorner", ripple).CornerRadius = UDim.new(1, 0)

            local ripGrad = Instance.new("UIGradient", ripple)
            ripGrad.Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Themes[CurrentTheme].ToggleActive),
                ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))
            })
            ripGrad.Transparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 0),
                NumberSequenceKeypoint.new(0.7, 0.4),
                NumberSequenceKeypoint.new(1, 1)
            })

            local relativeX = lastClickPos.X - container.AbsolutePosition.X
            local relativeY = lastClickPos.Y - container.AbsolutePosition.Y
            if lastClickPos.X == 0 and lastClickPos.Y == 0 then
                relativeX = arrowWrapper.AbsolutePosition.X + arrowWrapper.AbsoluteSize.X / 2 - container.AbsolutePosition.X
                relativeY = arrowWrapper.AbsolutePosition.Y + arrowWrapper.AbsoluteSize.Y / 2 - container.AbsolutePosition.Y
            end

            ripple.Position = UDim2.new(0, relativeX, 0, relativeY)
            ripple.Size = UDim2.new(0, 0, 0, 0)
            ripple.AnchorPoint = Vector2.new(0.5, 0.5)

            local maxDim = math.max(container.AbsoluteSize.X, 310) * 1.5
            local ripTween = TweenService:Create(ripple, TweenInfo.new(0.6, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
                Size = UDim2.new(0, maxDim, 0, maxDim),
                BackgroundTransparency = 1
            })
            ripTween:Play()
            ripTween.Completed:Connect(function() ripple:Destroy() end)

            TweenService:Create(container, TweenInfo.new(0.35, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(1, -4, 0, targetHeight)}):Play()
            TweenService:Create(boardFrame, TweenInfo.new(0.35, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = targetBoardHeight}):Play()
            TweenService:Create(boardCorner, TweenInfo.new(0.35, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {CornerRadius = targetCornerRadius}):Play()
            TweenService:Create(arrow, TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Rotation = targetRotation}):Play()
        end)

        inputBox.FocusLost:Connect(function()
            local txt = inputBox.Text
            if txt ~= "" then
                local success, data = pcall(function()
                    return HttpService:JSONDecode(txt)
                end)
                if success and type(data) == "table" then
                    Library.IsLoading = true
                    for flag, value in pairs(data) do
                        if Library.ConfigElements[flag] then
                            Library.ConfigElements[flag].Set(value)
                        end
                    end
                    Library.IsLoading = false
                    Library:SendNotification("Config System", "Synced settings from pasted JSON!")
                    inputBox.Text = ""
                else
                    Library:SendNotification("Config Error", "Invalid JSON format!")
                end
            end
        end)
    end


        return Tab
    end




function Window:ApplyTheme(name)
        local t = Themes[name]
        if not t then return end
        CurrentTheme = name
        
        if m then 
            TweenService:Create(m, TweenInfo.new(0.3), {BackgroundColor3 = t.MainBg, BackgroundTransparency = t.MainBgTrans}):Play()
        end
        if u and u.Parent then
            u.Thickness = name == "Liquid" and 1.25 or 4.5
            u.Transparency = name == "Liquid" and 0.22 or 0
        end
        if liquidBlur and liquidBlur.Parent then
            TweenService:Create(liquidBlur, TweenInfo.new(0.25), {
                Size = (name == "Liquid" and m.Visible) and 8 or 0
            }):Play()
        end
        if glassSheen and glassSheen.Parent then
            if name == "Liquid" then
                glassSheen.Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, Color3.fromHex("#17283F")),
                    ColorSequenceKeypoint.new(0.45, Color3.fromHex("#0D1727")),
                    ColorSequenceKeypoint.new(1, Color3.fromHex("#263D59"))
                })
                glassSheen.Transparency = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 0.05),
                    NumberSequenceKeypoint.new(0.5, 0.18),
                    NumberSequenceKeypoint.new(1, 0.04)
                })
            else
                glassSheen.Color = t.Wave
                glassSheen.Transparency = NumberSequence.new(0.18)
            end
        end
        
        local AuraGlow = g:FindFirstChild("AuraGlow")
        if AuraGlow then
            local auraColor = Color3.fromHex("#E0E0E0")
            if name == "Ocean" then
                auraColor = Color3.fromHex("#00E5FF")
            elseif name == "Liquid" then
                auraColor = Color3.fromHex("#68B9FF")
            elseif name == "Dream" then
                auraColor = Color3.fromHex("#B026FF")
            end
            TweenService:Create(AuraGlow, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {ImageColor3 = auraColor}):Play()
        end
        
        for _, bg in pairs(UI_Elements.Containers) do
            if bg and bg.Parent then
                TweenService:Create(bg, TweenInfo.new(0.3), {BackgroundColor3 = t.ContainerBg, BackgroundTransparency = t.ContainerTrans}):Play()
            end
        end
        
        for _, tabBg in pairs(UI_Elements.TabBackgrounds) do
            if tabBg and tabBg.Parent then
                TweenService:Create(tabBg, TweenInfo.new(0.3), {BackgroundColor3 = t.ContainerBg}):Play()
            end
        end
        
for _, obj in pairs(UI_Elements.TextGradients) do
            if obj and obj.Parent then 
                obj.Color = t.TextContrast 
                if obj.Parent:IsA("TextLabel") or obj.Parent:IsA("TextButton") or obj.Parent:IsA("TextBox") then
                    obj.Parent.TextColor3 = t.TextColor
                elseif obj.Parent:IsA("ImageLabel") then
                    obj.Parent.ImageColor3 = t.TextColor
                end
            end
        end

        for _, item in pairs(UI_Elements.AnimatedStrokes) do
            if item.Obj and item.Obj.Parent then
                TweenService:Create(item.Obj, TweenInfo.new(0.3), {Color = t[item.Type]}):Play()
            end
        end
        
        for _, s in pairs(UI_Elements.RowStrokes) do
            if s and s.Parent then
                TweenService:Create(s, TweenInfo.new(0.3), {Color = t.RowStroke}):Play()
            end
        end
        
        for _, g in pairs(UI_Elements.AnimatedGradients) do
            if g and g.Parent then g.Color = t.TextGrad end
        end
        
        for _, g in pairs(UI_Elements.RowStrokeGradients) do
            if g and g.Parent then g.Color = t.RowStrokeGrad end
        end
        
        for _, g in pairs(UI_Elements.TabGradients) do
            if g and g.Parent then g.Color = t.TabGrad end
        end
        
        for _, d in pairs(UI_Elements.DivGradients) do
            if d and d.Parent then d.Color = t.DivGrad end
        end
        
        ---------
---------
        for _, sw in pairs(UI_Elements.Switches) do
            if sw.Active then
                TweenService:Create(sw.Frame, TweenInfo.new(0.3), {BackgroundColor3 = t.ToggleActive}):Play()
                if sw.Glow then
                    TweenService:Create(sw.Glow, TweenInfo.new(0.3), {Color = t.ToggleActive}):Play()
                end
            end
        end
---------
        
        for _, desc in pairs(UI_Elements.Descriptions) do
            if desc and desc.Parent then
                TweenService:Create(desc, TweenInfo.new(0.3), {TextColor3 = t.DescTextColor}):Play()
            end
        end
    end

    
    local r = 0
    RunService.RenderStepped:Connect(function(dt)
        r = (r + 1.5) % 360
        e.Rotation = r
        
        for _, rotGrad in pairs(UI_Elements.RotatingGradients) do
            if rotGrad and rotGrad.Parent then 
                rotGrad.Rotation = r 
                rotGrad.Color = Themes[CurrentTheme].LoopSeq
            end
        end
        
        local animatedOffset = Vector2.new(math.sin(tick() * 2) * 0.4, 0)
        for _, grad in pairs(UI_Elements.AnimatedGradients) do
            if grad and grad.Parent then grad.Offset = animatedOffset end
        end
        for _, grad in pairs(UI_Elements.RowStrokeGradients) do
            if grad and grad.Parent then grad.Offset = animatedOffset end
        end
        for _, grad in pairs(UI_Elements.TabGradients) do
            if grad and grad.Parent then grad.Offset = animatedOffset end
        end
        
---------
        if Mini3DIcon.Visible then
            angleY = angleY + dt * 0.6
            angleX = angleX + dt * 0.35
            
            local mousePos = UserInputService:GetMouseLocation()
            local iconCenter = Mini3DIcon.AbsolutePosition + Mini3DIcon.AbsoluteSize / 2
            local dist = (mousePos - iconCenter).Magnitude
            
            local targetTiltX, targetTiltY = 0, 0
            if dist < 250 then
                local delta = mousePos - iconCenter
                targetTiltY = (delta.X / 250) * 0.8
                targetTiltX = (delta.Y / 250) * 0.8
            end
            
            currentTiltX = currentTiltX + (targetTiltX - currentTiltX) * (dt * 8)
            currentTiltY = currentTiltY + (targetTiltY - currentTiltY) * (dt * 8)
            
            local finalAngleX = angleX + currentTiltX
            local finalAngleY = angleY + currentTiltY

            local pulse = (math.sin(tick() * 3) + 1) / 2
            local tVal = (r / 360)
            
            local c1 = Themes[CurrentTheme].TextGrad.Keypoints[1].Value
            local c2 = Themes[CurrentTheme].ToggleActive
            local coreColor = c1:Lerp(c2, math.abs(math.sin(tVal * math.pi)))
            
            for _, grad in ipairs(lineGradients) do
                grad.Rotation = r
                grad.Color = Themes[CurrentTheme].LoopSeq
            end
            
            for _, data in ipairs(coreLayers) do
                local sizeOffset = pulse * 12
                data.frame.Size = UDim2.new(0, data.baseSize + sizeOffset, 0, data.baseSize + sizeOffset)
                data.frame.BackgroundColor3 = coreColor
                data.frame.BackgroundTransparency = math.clamp(data.baseTrans + (pulse * 0.05), 0, 1)
            end
            
            for i, edge in ipairs(edges) do
                local p1, z1 = project3D(vertices[edge[1]], finalAngleX, finalAngleY)
                local p2, z2 = project3D(vertices[edge[2]], finalAngleX, finalAngleY)
                local line = lines[i]
---------
                local diff = p2 - p1
                line.Size = UDim2.new(0, diff.Magnitude, 0, 0.1)
                line.Position = UDim2.new(0, (p1.X + p2.X) / 2, 0, (p1.Y + p2.Y) / 2)
                line.Rotation = math.deg(math.atan2(diff.Y, diff.X))
                local avgZ = (z1 + z2) / 2
                line.BackgroundTransparency = 1 - math.clamp(1 - (avgZ / 2.5), 0.15, 1)
                
                local strk = line:FindFirstChildWhichIsA("UIStroke")
                if avgZ > 0 then
                    line.ZIndex = 2
                    if strk then strk.Transparency = 0.8 end
                else
                    line.ZIndex = 4
                    if strk then strk.Transparency = math.clamp(0.4 - (pulse * 0.2), 0, 1) end
                end
            end
        end
    end)

---------
    m.Size = UDim2.new(0, 0, 0, 0)
    TweenService:Create(m, TweenInfo.new(0.6, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Size = UDim2.new(0, 600, 0, 525)}):Play()
    Library:SendNotification("Status", "Hub Initialized!")
    
    task.spawn(function()
        task.wait(1.5)
        Library:LoadConfig("AutoSave", true)
    end)

    local InfoTab = Window:CreateTab(config.InfoTabName or "Information", false, config.InfoIcon or "")
    InfoTab:CreatePageTitle("Information")
    if config.DiscordInvite and config.DiscordInvite ~= "" then
        InfoTab:CreateCopy("Server Discord", config.DiscordInvite, "Click to copy invite link")
    end
    if config.Designer and config.Designer ~= "" then
        InfoTab:CreateLabel("Designer", config.Designer)
    end
    InfoTab:CreateLabel("Library", config.LibraryName or "CentuDox UI")
    
---------
    local dfSettingsTab = Window:CreateTab(config.SettingsTabName or "Config & Themes", false, config.SettingsIcon or "")
    
    dfSettingsTab:CreatePageTitle("Configuration")
    
    dfSettingsTab:CreateButton("Copy Configuration", "Copy to clipboard with beautiful format", function()
        local data = {}
        for flag, element in pairs(Library.ConfigElements) do
            data[flag] = element.Value
        end
        
        local function Beautify(tbl, indent)
            indent = indent or 1
            local formatting = string.rep("    ", indent)
            local json = "{\n"
            local isFirst = true
            for k, v in pairs(tbl) do
                if not isFirst then
                    json = json .. ",\n"
                end
                isFirst = false
                local valStr = ""
                if type(v) == "table" then
                    valStr = "["
                    for i, arrV in ipairs(v) do
                        valStr = valStr .. '"' .. tostring(arrV) .. '"'
                        if i < #v then valStr = valStr .. ", " end
                    end
                    valStr = valStr .. "]"
                elseif type(v) == "string" then
                    valStr = '"' .. tostring(v) .. '"'
                else
                    valStr = tostring(v)
                end
                json = json .. formatting .. '"' .. tostring(k) .. '": ' .. valStr
            end
            json = json .. "\n" .. string.rep("    ", indent - 1) .. "}"
            return json
        end

        local prettyJson = Beautify(data)
        local clipboardFunc = setclipboard or toclipboard or function(text) warn("Clipboard: " .. tostring(text)) end
        clipboardFunc(prettyJson)
        Library:SendNotification("Config System", "Copied beautiful JSON to clipboard!")
    end)
    
    dfSettingsTab:CreateConfigBoard("Paste JSON config below to sync all settings")

    dfSettingsTab:CreatePageTitle("Themes")
    dfSettingsTab:CreateDropdown("Select Theme", "Liquid", {"Liquid", "Ocean", "Dream", "Dark"}, "Change UI colors", function(selected)
        Window:ApplyTheme(selected)
    end)
    dfSettingsTab:CreatePageTitle("Fonts")
    local fontList = {
        "FredokaOne",
        "Bangers",
        "DenkOne",
        "Kalam",
        "Creepster",
        "AmaticSC",
        "PatrickHand",
        "Boogaloo",
        "PermanentMarker",
        "IndieFlower",
        "Fondamento",
        "LuckiestGuy",
        "SpecialElite",
        "Jura",
        "Sarpanch"
    }
    dfSettingsTab:CreateDropdown("Select Font", "FredokaOne", fontList, "Change UI font family", function(selected)
        Library:ApplyFont(selected)
    end)
    dfSettingsTab:CreateSlider("Text Size", 50, 300, 100, "Scale text size (Default: 100%, Max: 300%)", function(value)
        Library:ApplyFontScale(value)
    end)
    if TabsList[#TabsList] then
        TabsList[#TabsList].Btn.LayoutOrder = 9999
    end

    return Window
end
-- -------------------------
-- CentuDox Liquid Glass Preview
-- This standalone file includes the library and opens a UI-only preview automatically.
-- It does not run game automation.

local Window = Library:CreateWindow({
    Title = "CentuDox | Liquid Glass",
    Theme = "Liquid",
    Logo = "rbxassetid://123438604306607",
    LibraryName = "CentuDox UI",
    Designer = "CentuDox",
    DiscordInvite = "",
    LiquidBlur = true,
    InfoIcon = "",
    SettingsIcon = ""
})

local Home = Window:CreateTab("Preview", true, "rbxassetid://77102684570531")
local Controls = Window:CreateTab("Controls", false, "rbxassetid://75102149296455")

Home:CreatePageTitle("Liquid Glass Preview")
Home:CreateLabel("Theme", "Dark translucent surfaces, soft blue borders, and glass-style gradients.")
Home:CreateParagraph("Shared Library", "Tab names and tab icons are supplied by this preview script, not hardcoded into the shared theme.")
Home:CreateButton("Test Notification", "Preview the notification style", function()
    Library:SendNotification("CentuDox", "Liquid Glass theme is running.")
end)

Controls:CreatePageTitle("Control Samples")
Controls:CreateSwitch("Example Toggle", true, "Visual test control", function(value)
    Library:SendNotification("Example Toggle", value and "Enabled" or "Disabled")
end, "LiquidPreviewToggle")
Controls:CreateSlider("Example Slider", 0, 100, 70, "Visual test slider", function(value)
    -- UI-only sample; no game state is changed.
end, "LiquidPreviewSlider")
Controls:CreateDropdown("Example Dropdown", "Blue", {"Blue", "Purple", "Silver"}, "Visual test dropdown", function(value)
    Library:SendNotification("Example Dropdown", "Selected: " .. tostring(value))
end, "LiquidPreviewDropdown")
Controls:CreateButton("Close Preview UI", "Uses the library's normal window controls", function()
    Library:SendNotification("CentuDox", "Use the window close/minimize controls to dismiss the preview.")
end)

return Library
