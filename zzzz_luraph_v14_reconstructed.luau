-- zzzz.lua readable reconstruction
-- Source protection: Luraph v14.5.2
-- Reconstructed from the complete bounded runtime trace.
--
-- Observed payload behavior:
--   1. Creates a hidden main ScreenGui named "Nousigi Hub GUI".
--   2. Creates a bottom-left circular logo button.
--   3. Shows a Banana Cat Hub UI Library notification.
--   4. The notification auto-closes after ten seconds or via its close button.
--   5. Clicking the bottom-left button marks the UI as toggled and reveals the
--      main ScreenGui. The protected sample did not create additional controls
--      in the observed execution path.

local env = (getgenv and getgenv()) or _G
local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local COLORS = {
    background1 = Color3.fromRGB(28, 28, 34),
    background2 = Color3.fromRGB(38, 38, 46),
    background3 = Color3.fromRGB(48, 48, 56),
    backgroundMain = Color3.fromRGB(18, 18, 22),
    border = Color3.fromRGB(90, 90, 70),
    accent = Color3.fromRGB(255, 214, 94),
    accentDark = Color3.fromRGB(250, 190, 50),
    text = Color3.fromRGB(235, 235, 230),
    muted = Color3.fromRGB(190, 190, 180),
    icon = Color3.fromRGB(240, 240, 230),
}

env.Nousigi = true
env.UIColor = {
    ["Background 1 Color"] = COLORS.background1,
    ["Background 1 Transparency"] = 0.25,
    ["Background 2 Color"] = COLORS.background2,
    ["Background 3 Color"] = COLORS.background3,
    ["Background Image"] = "",
    ["Background Main Color"] = COLORS.backgroundMain,
    ["Border Color"] = COLORS.border,
    ["Box Highlight Color"] = COLORS.accent,
    ["Button Color"] = COLORS.accent,
    ["Click Effect Color"] = Color3.fromRGB(230, 230, 220),
    ["Dropdown Icon Color"] = Color3.fromRGB(220, 220, 210),
    ["Dropdown Selected Check Color"] = COLORS.accentDark,
    ["Dropdown Selected Color"] = COLORS.accent,
    ["GUI Text Color"] = COLORS.text,
    ["Label Color"] = Color3.fromRGB(240, 240, 230),
    ["Logo Image"] = "rbxassetid://5009915795",
    ["Page Selected Color"] = COLORS.accent,
    ["Placeholder Text Color"] = Color3.fromRGB(170, 170, 160),
    ["Search Icon Color"] = COLORS.icon,
    ["Search Icon Highlight Color"] = COLORS.accent,
    ["Section Text Color"] = Color3.fromRGB(220, 220, 210),
    ["Section Underline Color"] = Color3.fromRGB(255, 200, 72),
    ["Setting Icon Color"] = Color3.fromRGB(220, 220, 210),
    ["Slider Highlight Color"] = COLORS.accent,
    ["Slider Line Color"] = Color3.fromRGB(80, 80, 60),
    ["Text Color"] = COLORS.text,
    ["Text Stroke Transparency"] = 0.85,
    ["Textbox Highlight Color"] = COLORS.accent,
    ["Title Text Color"] = COLORS.accent,
    ["Toggle Border Color"] = COLORS.accent,
    ["Toggle Checked Color"] = COLORS.accentDark,
    ["Toggle Desc Color"] = COLORS.muted,
    ["Tween Animation 1 Speed"] = 0,
    ["Tween Animation 2 Speed"] = 0,
    ["Tween Animation 3 Speed"] = 0,
}

env.UIToggled = false
env.ReadyForGuiLoaded = false
env.TitleNameNoti = "UI Library"

local function make(className, parent, properties)
    local object = Instance.new(className)
    if parent then
        object.Parent = parent
    end
    for property, value in pairs(properties or {}) do
        object[property] = value
    end
    return object
end

local function play(object, properties)
    local tween = TweenService:Create(object, TweenInfo.new(0), properties)
    tween:Play()
    return tween
end

-- The protected sample creates this GUI but leaves it disabled on startup.
local mainGui = make("ScreenGui", CoreGui, {
    Name = "Nousigi Hub GUI",
    ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
    Enabled = false,
    ResetOnSpawn = false,
})

local notificationGui = make("ScreenGui", CoreGui, {
    Name = "Nousigi Hub Notification",
    ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
    ResetOnSpawn = false,
})

local buttonGui = make("ScreenGui", CoreGui, {
    Name = "Nousigi Hub Btn",
    ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
    ResetOnSpawn = false,
})

-- Bottom-left circular toggle button.
local toggleButton = make("TextButton", buttonGui, {
    Name = "NousigiToggle",
    BackgroundTransparency = 1,
    Text = "",
    AnchorPoint = Vector2.new(0, 1),
    Size = UDim2.fromOffset(50, 50),
    Position = UDim2.new(0, 15, 1, -15),
    AutoButtonColor = false,
})

local toggleBackground = make("Frame", toggleButton, {
    Name = "dut dit",
    AnchorPoint = Vector2.new(0, 1),
    Size = UDim2.fromOffset(50, 50),
    Position = UDim2.new(0, 0, 1, 0),
    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
    BackgroundTransparency = 0.25,
})
make("UICorner", toggleBackground, {
    CornerRadius = UDim.new(1, 0),
})

local logo = make("ImageLabel", toggleButton, {
    Name = "Logo",
    AnchorPoint = Vector2.new(0.5, 0.5),
    Position = UDim2.fromScale(0.5, 0.5),
    Size = UDim2.fromOffset(30, 30),
    BackgroundTransparency = 1,
    Image = "rbxassetid://5009915795",
})

-- These connections are intentionally retained: they existed in the trace,
-- although their original callback bodies were empty on the observed path.
toggleButton.InputBegan:Connect(function(_input, _gameProcessed)
end)

toggleButton.InputEnded:Connect(function(_input, _gameProcessed)
end)

toggleButton.InputChanged:Connect(function(_input, _gameProcessed)
end)

RunService.RenderStepped:Connect(function(_deltaTime)
end)

toggleButton.MouseButton1Click:Connect(function()
    env.UIToggled = true
    play(logo, { Size = UDim2.fromOffset(40, 40) })
    play(toggleBackground, { BackgroundTransparency = 0 })
    mainGui.Enabled = true
end)

-- Notification layout.
local notificationList = make("Frame", notificationGui, {
    Name = "NotiContainer",
    AnchorPoint = Vector2.new(1, 1),
    Position = UDim2.new(1, -5, 1, -5),
    Size = UDim2.new(0, 350, 1, -10),
    BackgroundTransparency = 1,
})
make("UIListLayout", notificationList, {
    Name = "NotiList",
    SortOrder = Enum.SortOrder.LayoutOrder,
    VerticalAlignment = Enum.VerticalAlignment.Bottom,
    Padding = UDim.new(0, 5),
})

local notificationFrame = make("Frame", notificationList, {
    Name = "NotiFrame",
    Size = UDim.new(1, 0, 0, 0),
    AutomaticSize = Enum.AutomaticSize.Y,
    ClipsDescendants = true,
    BackgroundTransparency = 1,
})

local notificationBody = make("Frame", notificationFrame, {
    Name = "Noticontainer",
    Position = UDim2.new(1, 0, 0, 0),
    Size = UDim.new(1, 0, 1, 6),
    AutomaticSize = Enum.AutomaticSize.Y,
    BackgroundColor3 = COLORS.background3,
})
make("UICorner", notificationBody, {
    CornerRadius = UDim.new(0, 4),
})

local notificationTop = make("Frame", notificationBody, {
    Name = "Topnoti",
    Position = UDim2.new(0, 0, 0, 5),
    Size = UDim2.new(1, 0, 0, 25),
    BackgroundTransparency = 1,
})

local notificationIcon = make("ImageLabel", notificationTop, {
    Name = "Ruafimg",
    Position = UDim2.fromOffset(5, 0),
    Size = UDim2.fromOffset(25, 25),
    BackgroundTransparency = 1,
    Image = "rbxassetid://5009915795",
})
make("UICorner", notificationIcon, {
    Name = "RuafimgCorner",
    CornerRadius = UDim.new(1, 0),
})

make("TextLabel", notificationTop, {
    Name = "TextLabelNoti",
    Position = UDim2.fromOffset(35, 0),
    Size = UDim2.new(1, -62, 1, 0),
    BackgroundTransparency = 1,
    Font = Enum.Font.GothamBold,
    TextSize = 14,
    TextWrapped = true,
    TextXAlignment = Enum.TextXAlignment.Left,
    RichText = true,
    TextColor3 = COLORS.text,
    Text = '<font color="rgb(255,214,94)">Banana Cat Hub</font> UI Library',
})

local closeContainer = make("Frame", notificationTop, {
    Name = "CloseContainer",
    AnchorPoint = Vector2.new(1, 0.5),
    Position = UDim2.new(1, -4, 0.5, 0),
    Size = UDim2.fromOffset(22, 22),
    BackgroundTransparency = 1,
})
local closeImage = make("ImageLabel", closeContainer, {
    Name = "CloseImage",
    Size = UDim2.fromScale(1, 1),
    BackgroundTransparency = 1,
    Image = "rbxassetid://3926305904",
    ImageRectOffset = Vector2.new(284, 4),
    ImageRectSize = Vector2.new(24, 24),
    ImageColor3 = COLORS.icon,
})
local closeButton = make("TextButton", closeContainer, {
    BackgroundTransparency = 1,
    Size = UDim2.fromScale(1, 1),
    Text = "",
    AutoButtonColor = false,
})

local notificationText = make("TextLabel", notificationBody, {
    Name = "TextColor",
    Position = UDim2.fromOffset(10, 35),
    Size = UDim2.new(1, -15, 0, 0),
    AutomaticSize = Enum.AutomaticSize.Y,
    BackgroundTransparency = 1,
    Font = Enum.Font.GothamBold,
    TextSize = 14,
    TextXAlignment = Enum.TextXAlignment.Left,
    TextWrapped = true,
    RichText = true,
    TextColor3 = COLORS.text,
    Text = "The UI automatically hides once executed.\nPress the button at the bottom-left of the screen to show the GUI.",
})

local closed = false
local function closeNotification()
    if closed then
        return
    end
    closed = true
    play(notificationBody, { Position = UDim2.new(1, 0, 0, 0) })
    task.wait(0.25)
    if notificationFrame then
        notificationFrame:Destroy()
    end
end

play(notificationBody, { Position = UDim2.new(0, 0, 0, 0) })

closeButton.MouseEnter:Connect(function()
    play(closeImage, { ImageColor3 = COLORS.accent })
end)

closeButton.MouseLeave:Connect(function()
    play(closeImage, { ImageColor3 = COLORS.icon })
end)

closeButton.MouseButton1Click:Connect(function()
    task.wait(0.25)
    closeNotification()
end)

task.delay(10, closeNotification)

env.ReadyForGuiLoaded = true
return {
    MainGui = mainGui,
    NotificationGui = notificationGui,
    ToggleGui = buttonGui,
    Toggle = toggleButton,
    CloseNotification = closeNotification,
}
