-- CentuDox Liquid Glass - Preview Demo
-- UI-only showcase with fake tabs, switches, sliders and dropdown.
-- Run as a LocalScript in a Roblox test place.
-- This is a preview/demo, not the final replacement for the original shared library.

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local old = playerGui:FindFirstChild("CentuDoxLiquidGlassDemo")
if old then old:Destroy() end

local C = {
    text = Color3.fromRGB(239, 247, 255),
    muted = Color3.fromRGB(176, 202, 231),
    cyan = Color3.fromRGB(103, 220, 255),
    blue = Color3.fromRGB(87, 151, 255),
    violet = Color3.fromRGB(164, 119, 255),
    glass = Color3.fromRGB(18, 32, 55),
    card = Color3.fromRGB(41, 70, 108),
    green = Color3.fromRGB(93, 241, 180),
}

local function new(class, props, parent)
    local o = Instance.new(class)
    for k, v in pairs(props or {}) do o[k] = v end
    o.Parent = parent
    return o
end

local function round(parent, px)
    new("UICorner", {CornerRadius = UDim.new(0, px or 14)}, parent)
end

local function outline(parent, color, thickness, transparency)
    new("UIStroke", {
        Color = color or C.cyan,
        Thickness = thickness or 1,
        Transparency = transparency or 0.3,
        ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
    }, parent)
end

local function grad(parent, a, b, rotation)
    new("UIGradient", {
        Color = ColorSequence.new(a, b),
        Rotation = rotation or 0,
    }, parent)
end

local function text(parent, value, size, pos, font, color)
    return new("TextLabel", {
        BackgroundTransparency = 1,
        Text = value or "",
        TextColor3 = color or C.text,
        TextSize = size or 14,
        Font = font or Enum.Font.Gotham,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextYAlignment = Enum.TextYAlignment.Center,
        Position = pos or UDim2.new(),
        Size = UDim2.new(1, 0, 0, 24),
    }, parent)
end

local gui = new("ScreenGui", {
    Name = "CentuDoxLiquidGlassDemo",
    ResetOnSpawn = false,
    IgnoreGuiInset = true,
    ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
}, playerGui)

local window = new("Frame", {
    Name = "Window",
    AnchorPoint = Vector2.new(0.5, 0.5),
    Position = UDim2.fromScale(0.5, 0.52),
    Size = UDim2.new(0.82, 0, 0.78, 0),
    BackgroundColor3 = C.glass,
    BackgroundTransparency = 0.2,
    BorderSizePixel = 0,
}, gui)
round(window, 28)
outline(window, C.cyan, 1.8, 0.08)
grad(window, Color3.fromRGB(20, 49, 81), Color3.fromRGB(38, 29, 68), 24)
new("UISizeConstraint", {MinSize = Vector2.new(330, 330), MaxSize = Vector2.new(1100, 780)}, window)

local top = new("Frame", {
    Name = "TitleBar",
    Size = UDim2.new(1, 0, 0, 58),
    BackgroundColor3 = Color3.fromRGB(30, 57, 90),
    BackgroundTransparency = 0.2,
    BorderSizePixel = 0,
}, window)
round(top, 26)
new("Frame", {
    Position = UDim2.new(0, 0, 1, -18),
    Size = UDim2.new(1, 0, 0, 18),
    BackgroundColor3 = top.BackgroundColor3,
    BackgroundTransparency = top.BackgroundTransparency,
    BorderSizePixel = 0,
}, top)

local title = text(top, "♕  CentuDox | Liquid Glass", 19, UDim2.new(0, 22, 0, 0), Enum.Font.GothamBold)
title.Size = UDim2.new(1, -150, 1, 0)

local minimize = new("TextButton", {
    Text = "−", TextSize = 25, Font = Enum.Font.Gotham,
    TextColor3 = C.text, BackgroundTransparency = 1,
    Position = UDim2.new(1, -95, 0, 8), Size = UDim2.fromOffset(30, 38),
}, top)
local close = new("TextButton", {
    Text = "×", TextSize = 25, Font = Enum.Font.Gotham,
    TextColor3 = C.text, BackgroundTransparency = 1,
    Position = UDim2.new(1, -48, 0, 8), Size = UDim2.fromOffset(30, 38),
}, top)

local body = new("Frame", {
    Name = "Body",
    Position = UDim2.new(0, 0, 0, 58),
    Size = UDim2.new(1, 0, 1, -58),
    BackgroundTransparency = 1,
}, window)

local side = new("Frame", {
    Name = "Sidebar",
    Size = UDim2.new(0, 225, 1, 0),
    BackgroundColor3 = Color3.fromRGB(17, 34, 58),
    BackgroundTransparency = 0.34,
    BorderSizePixel = 0,
}, body)
round(side, 24)
new("Frame", {
    Position = UDim2.new(1, -12, 0, 0),
    Size = UDim2.new(0, 12, 1, 0),
    BackgroundColor3 = side.BackgroundColor3,
    BackgroundTransparency = side.BackgroundTransparency,
    BorderSizePixel = 0,
}, side)

local logo = new("ImageLabel", {
    Name = "DemoLogo",
    Position = UDim2.new(0, 18, 0, 18),
    Size = UDim2.fromOffset(100, 100),
    BackgroundColor3 = Color3.fromRGB(69, 124, 180),
    BackgroundTransparency = 0.45,
    Image = "",
    ScaleType = Enum.ScaleType.Fit,
    BorderSizePixel = 0,
}, side)
round(logo, 18)
outline(logo, C.cyan, 1, 0.4)
text(logo, "CD", 32, UDim2.new(), Enum.Font.GothamBold, C.text).TextXAlignment = Enum.TextXAlignment.Center

local search = new("TextBox", {
    Name = "SearchTabs",
    PlaceholderText = "⌕  Search tabs...",
    Text = "",
    ClearTextOnFocus = false,
    Font = Enum.Font.Gotham,
    TextSize = 13,
    TextColor3 = C.text,
    PlaceholderColor3 = C.muted,
    TextXAlignment = Enum.TextXAlignment.Left,
    Position = UDim2.new(0, 14, 0, 132),
    Size = UDim2.new(1, -28, 0, 40),
    BackgroundColor3 = C.card,
    BackgroundTransparency = 0.5,
    BorderSizePixel = 0,
}, side)
round(search, 12)
outline(search, C.blue, 0.8, 0.8)
new("UIPadding", {PaddingLeft = UDim.new(0, 12)}, search)
text(side, "DEMO NAVIGATION", 10, UDim2.new(0, 18, 0, 180), Enum.Font.GothamBold, C.muted)

local tabList = new("Frame", {
    Name = "TabList",
    Position = UDim2.new(0, 10, 0, 204),
    Size = UDim2.new(1, -20, 1, -245),
    BackgroundTransparency = 1,
}, side)
new("UIListLayout", {Padding = UDim.new(0, 7), SortOrder = Enum.SortOrder.LayoutOrder}, tabList)

local connected = new("Frame", {
    Position = UDim2.new(0, 18, 1, -27),
    Size = UDim2.fromOffset(8, 8),
    BackgroundColor3 = C.green,
    BorderSizePixel = 0,
}, side)
round(connected, 5)
text(side, "Preview mode", 11, UDim2.new(0, 34, 1, -33), Enum.Font.Gotham, C.muted)

local content = new("ScrollingFrame", {
    Name = "Pages",
    Position = UDim2.new(0, 246, 0, 0),
    Size = UDim2.new(1, -262, 1, -8),
    BackgroundTransparency = 1,
    BorderSizePixel = 0,
    ScrollBarThickness = 3,
    ScrollBarImageColor3 = C.cyan,
    CanvasSize = UDim2.new(),
    AutomaticCanvasSize = Enum.AutomaticSize.Y,
}, body)
new("UIPadding", {
    PaddingTop = UDim.new(0, 26),
    PaddingBottom = UDim.new(0, 24),
    PaddingRight = UDim.new(0, 14),
}, content)
new("UIListLayout", {Padding = UDim.new(0, 12), SortOrder = Enum.SortOrder.LayoutOrder}, content)

local pages, navButtons = {}, {}
local activePage

local function createPage(name, iconText)
    local nav = new("TextButton", {
        Name = name .. "Nav",
        Text = "",
        Size = UDim2.new(1, 0, 0, 44),
        BackgroundColor3 = C.blue,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        AutoButtonColor = false,
    }, tabList)
    round(nav, 12)
    local marker = new("Frame", {
        Position = UDim2.new(0, 0, 0, 7),
        Size = UDim2.new(0, 3, 1, -14),
        BackgroundColor3 = C.cyan,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
    }, nav)
    round(marker, 3)
    local glyph = text(nav, iconText, 21, UDim2.new(0, 15, 0, 0), Enum.Font.Gotham, C.cyan)
    glyph.Size = UDim2.new(0, 27, 1, 0)
    glyph.TextXAlignment = Enum.TextXAlignment.Center
    local navText = text(nav, name, 14, UDim2.new(0, 53, 0, 0), Enum.Font.GothamMedium, C.muted)
    navText.Size = UDim2.new(1, -58, 1, 0)

    local page = new("Frame", {
        Name = name .. "Page",
        Size = UDim2.new(1, -4, 0, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        BackgroundTransparency = 1,
        Visible = false,
    }, content)
    page:SetAttribute("DemoPage", true)
    new("UIListLayout", {Padding = UDim.new(0, 12), SortOrder = Enum.SortOrder.LayoutOrder}, page)

    local h = text(page, name, 30, UDim2.new(), Enum.Font.GothamBold, C.text)
    h.Size = UDim2.new(1, 0, 0, 39)
    h.LayoutOrder = 1
    local sub = text(page, "Interactive Liquid Glass UI preview", 13, UDim2.new(), Enum.Font.Gotham, C.muted)
    sub.Size = UDim2.new(1, 0, 0, 24)
    sub.LayoutOrder = 2

    local item = {Name = name, Nav = nav, Marker = marker, NavText = navText, Page = page}
    table.insert(pages, item)
    table.insert(navButtons, nav)

    local function select()
        activePage = item
        for _, p in ipairs(pages) do
            local selected = p == item
            p.Nav.BackgroundTransparency = selected and 0.32 or 1
            p.Marker.BackgroundTransparency = selected and 0 or 1
            p.NavText.TextColor3 = selected and C.text or C.muted
            p.Page.Visible = selected
        end
    end
    nav.MouseButton1Click:Connect(select)
    item.Select = select
    return page, item
end

local function card(parent, name, description, height)
    local frame = new("Frame", {
        Name = name:gsub("%s+", "") .. "Card",
        Size = UDim2.new(1, 0, 0, height or 82),
        BackgroundColor3 = C.card,
        BackgroundTransparency = 0.39,
        BorderSizePixel = 0,
    }, parent)
    round(frame, 16)
    outline(frame, C.blue, 1.1, 0.47)
    grad(frame, Color3.fromRGB(49, 91, 139), Color3.fromRGB(43, 49, 97), 0)
    local h = text(frame, name, 16, UDim2.new(0, 17, 0, 9), Enum.Font.GothamBold)
    h.Size = UDim2.new(1, -34, 0, 25)
    local d = text(frame, description or "", 12, UDim2.new(0, 17, 0, 37), Enum.Font.Gotham, C.muted)
    d.Size = UDim2.new(1, -34, 0, 31)
    d.TextWrapped = true
    return frame
end

local function addSwitch(parent, name, description, initial)
    local row = card(parent, name, description, 82)
    local on = initial == true
    local switch = new("TextButton", {
        Text = "",
        AnchorPoint = Vector2.new(1, 0.5),
        Position = UDim2.new(1, -16, 0.5, 0),
        Size = UDim2.fromOffset(48, 26),
        BackgroundColor3 = on and C.cyan or Color3.fromRGB(85, 102, 124),
        BackgroundTransparency = 0.12,
        BorderSizePixel = 0,
        AutoButtonColor = false,
    }, row)
    round(switch, 14)
    local knob = new("Frame", {
        Position = on and UDim2.new(1, -22, 0, 4) or UDim2.new(0, 4, 0, 4),
        Size = UDim2.fromOffset(18, 18),
        BackgroundColor3 = Color3.fromRGB(248, 251, 255),
        BorderSizePixel = 0,
    }, switch)
    round(knob, 10)
    switch.MouseButton1Click:Connect(function()
        on = not on
        TweenService:Create(switch, TweenInfo.new(0.16), {
            BackgroundColor3 = on and C.cyan or Color3.fromRGB(85, 102, 124),
        }):Play()
        TweenService:Create(knob, TweenInfo.new(0.16), {
            Position = on and UDim2.new(1, -22, 0, 4) or UDim2.new(0, 4, 0, 4),
        }):Play()
    end)
    return row
end

local function addSlider(parent, name, description, minValue, maxValue, initial)
    local row = card(parent, name, description, 100)
    local value = math.clamp(initial or minValue, minValue, maxValue)
    local valueText = text(row, tostring(value), 13, UDim2.new(1, -76, 0, 9), Enum.Font.GothamBold, C.cyan)
    valueText.TextXAlignment = Enum.TextXAlignment.Right
    valueText.Size = UDim2.new(0, 58, 0, 24)

    local track = new("TextButton", {
        Text = "",
        Position = UDim2.new(0, 18, 1, -26),
        Size = UDim2.new(1, -36, 0, 6),
        BackgroundColor3 = Color3.fromRGB(91, 110, 139),
        BackgroundTransparency = 0.18,
        BorderSizePixel = 0,
        AutoButtonColor = false,
    }, row)
    round(track, 4)
    local ratio = (value - minValue) / math.max(1, maxValue - minValue)
    local fill = new("Frame", {
        Size = UDim2.new(ratio, 0, 1, 0),
        BackgroundColor3 = C.cyan,
        BorderSizePixel = 0,
    }, track)
    round(fill, 4)

    local dragging = false
    local function update(x)
        local r = math.clamp((x - track.AbsolutePosition.X) / math.max(1, track.AbsoluteSize.X), 0, 1)
        value = math.floor(minValue + (maxValue - minValue) * r + 0.5)
        fill.Size = UDim2.new(r, 0, 1, 0)
        valueText.Text = tostring(value)
    end
    track.MouseButton1Down:Connect(function(x) dragging = true; update(x) end)
    UserInputService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then update(input.Position.X) end
    end)
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then dragging = false end
    end)
    return row
end

local function addDropdown(parent, name, description, options)
    local row = card(parent, name, description, 88)
    local index = 1
    local choice = new("TextButton", {
        Text = options[index] .. "  ▾",
        TextSize = 12,
        Font = Enum.Font.GothamMedium,
        TextColor3 = C.text,
        AnchorPoint = Vector2.new(1, 0.5),
        Position = UDim2.new(1, -14, 0.5, 7),
        Size = UDim2.new(0, 130, 0, 32),
        BackgroundColor3 = C.blue,
        BackgroundTransparency = 0.32,
        BorderSizePixel = 0,
        AutoButtonColor = false,
    }, row)
    round(choice, 10)
    choice.MouseButton1Click:Connect(function()
        index = index % #options + 1
        choice.Text = options[index] .. "  ▾"
    end)
    return row
end

-- Fake tabs for visual testing only.
local homePage, homeTab = createPage("Home", "⌂")
local infoPage = createPage("Information", "ⓘ")
local previewPage = createPage("Preview", "▧")
local controlsPage = createPage("Controls", "☷")
local themesPage = createPage("Config & Themes", "⚙")

card(homePage, "Liquid Glass Theme", "Translucent dark surfaces, soft cyan borders, violet glow and smooth gradients.", 82)
card(homePage, "Fake Tabs", "These tabs are only for testing the layout. Add your real game tabs in the shared library.", 82)
local notificationCard = card(homePage, "Test Notification", "Click the arrow to show a temporary glass notification.", 82)
local notify = new("TextButton", {
    Text = "›", TextSize = 26, Font = Enum.Font.Gotham,
    TextColor3 = C.text, BackgroundColor3 = C.blue, BackgroundTransparency = 0.3,
    AnchorPoint = Vector2.new(1, 0.5), Position = UDim2.new(1, -14, 0.5, 0),
    Size = UDim2.fromOffset(38, 38), BorderSizePixel = 0,
}, notificationCard)
round(notify, 19)

local function toast()
    local t = new("Frame", {
        AnchorPoint = Vector2.new(1, 0),
        Position = UDim2.new(1, 320, 0, 20),
        Size = UDim2.fromOffset(290, 78),
        BackgroundColor3 = C.glass,
        BackgroundTransparency = 0.15,
        BorderSizePixel = 0,
    }, gui)
    round(t, 15)
    outline(t, C.cyan, 1.2, 0.18)
    grad(t, Color3.fromRGB(39, 84, 130), Color3.fromRGB(66, 45, 110), 20)
    text(t, "CentuDox", 15, UDim2.new(0, 14, 0, 8), Enum.Font.GothamBold)
    text(t, "Liquid Glass notification preview", 11, UDim2.new(0, 14, 0, 36), Enum.Font.Gotham, C.muted)
    TweenService:Create(t, TweenInfo.new(0.25, Enum.EasingStyle.Quint), {
        Position = UDim2.new(1, -20, 0, 20),
    }):Play()
    task.delay(2.6, function()
        if t.Parent then
            TweenService:Create(t, TweenInfo.new(0.2), {
                Position = UDim2.new(1, 320, 0, 20),
                BackgroundTransparency = 1,
            }):Play()
            task.wait(0.22)
            if t.Parent then t:Destroy() end
        end
    end)
end
notify.MouseButton1Click:Connect(toast)

card(infoPage, "About This Preview", "Standalone visual demo. The original library has not been replaced.", 82)
card(infoPage, "Transparency", "Panels use moderate transparency; exact blur depends on Roblox rendering support.", 82)

card(previewPage, "Glass Surface", "A translucent card with a soft blue outline.", 82)
card(previewPage, "Tab Icon Style", "Simple glyph icons here are placeholders, not final game-specific image assets.", 82)

addSwitch(controlsPage, "Demo Toggle", "Click to switch the visual state on or off.", true)
addSwitch(controlsPage, "Another Toggle", "A second fake setting for spacing and layout checks.", false)
addSlider(controlsPage, "Demo Slider", "Drag the line to change its displayed value.", 0, 100, 65)
addSlider(controlsPage, "Transparency Preview", "Fake control for visual testing only.", 10, 90, 35)
addDropdown(controlsPage, "Demo Dropdown", "Click to cycle through sample options.", {"Default", "Blue Glass", "Violet Glass"})

card(themesPage, "Liquid Glass", "Current demo palette: deep blue glass with cyan and violet highlights.", 82)
addSwitch(themesPage, "Glow Effect", "Fake toggle for checking the switch styling.", true)
addSlider(themesPage, "Glass Opacity", "Demo slider only; does not alter the whole window yet.", 10, 80, 35)

homeTab.Select()

search:GetPropertyChangedSignal("Text"):Connect(function()
    local q = string.lower(search.Text)
    for _, p in ipairs(pages) do
        p.Nav.Visible = q == "" or string.find(string.lower(p.Name), q, 1, true) ~= nil
    end
end)

minimize.MouseButton1Click:Connect(function()
    body.Visible = not body.Visible
    window.Size = body.Visible and UDim2.new(0.82, 0, 0.78, 0) or UDim2.new(0.82, 0, 0, 58)
end)
close.MouseButton1Click:Connect(function() gui:Destroy() end)

-- Drag window using title bar.
local dragging, dragStart, startPos
top.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = window.Position
    end
end)
top.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = false
    end
end)
UserInputService.InputChanged:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - dragStart
        window.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)
