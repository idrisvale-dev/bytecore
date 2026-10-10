--[[
    CentuDox | Liquid Glass Preview
    UI-only preview scaffold for Roblox Luau.
    This is a standalone visual demo, not a replacement for every method in your original library.

    Design goals:
    - Moderately transparent glass panels with cyan/violet rim lighting
    - Sidebar icons are clean line-style icons (no opaque square backgrounds)
    - Tab labels and icon asset IDs are provided by the caller
    - Logo is configurable per script, not hardcoded globally
]]

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Lighting = game:GetService("Lighting")

local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

local CentuDoxLiquid = {}

local COLORS = {
    Text = Color3.fromRGB(238, 245, 255),
    Muted = Color3.fromRGB(177, 201, 230),
    Cyan = Color3.fromRGB(90, 215, 255),
    Blue = Color3.fromRGB(85, 155, 255),
    Violet = Color3.fromRGB(157, 112, 255),
    Glass = Color3.fromRGB(20, 35, 60),
    Card = Color3.fromRGB(37, 66, 103),
    Green = Color3.fromRGB(80, 240, 174),
}

local function create(className, properties, parent)
    local obj = Instance.new(className)
    for key, value in pairs(properties or {}) do
        obj[key] = value
    end
    obj.Parent = parent
    return obj
end

local function corner(parent, radius)
    return create("UICorner", { CornerRadius = UDim.new(0, radius or 14) }, parent)
end

local function stroke(parent, color, thickness, transparency)
    return create("UIStroke", {
        Color = color or COLORS.Cyan,
        Thickness = thickness or 1,
        Transparency = transparency or 0.25,
        ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
    }, parent)
end

local function gradient(parent, colorA, colorB, rotation)
    return create("UIGradient", {
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, colorA),
            ColorSequenceKeypoint.new(1, colorB),
        }),
        Rotation = rotation or 0,
    }, parent)
end

local function label(parent, text, size, position, font, color)
    return create("TextLabel", {
        BackgroundTransparency = 1,
        Text = text or "",
        TextColor3 = color or COLORS.Text,
        TextSize = size or 14,
        Font = font or Enum.Font.Gotham,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextYAlignment = Enum.TextYAlignment.Center,
        Position = position or UDim2.new(),
        Size = UDim2.new(1, 0, 0, 24),
        RichText = false,
    }, parent)
end

local function makeIcon(parent, imageId, fallbackText, size)
    local icon = create("ImageLabel", {
        Name = "TabIcon",
        BackgroundTransparency = 1,
        Image = imageId and ("rbxassetid://" .. tostring(imageId)) or "",
        ImageTransparency = 0,
        ScaleType = Enum.ScaleType.Fit,
        Size = UDim2.fromOffset(size or 22, size or 22),
        BackgroundColor3 = Color3.new(1, 1, 1),
    }, parent)
    if not imageId then
        local fallback = label(icon, fallbackText or "•", 18, UDim2.new(), Enum.Font.GothamBold, COLORS.Muted)
        fallback.TextXAlignment = Enum.TextXAlignment.Center
        fallback.Size = UDim2.fromScale(1, 1)
    end
    return icon
end

function CentuDoxLiquid:CreateWindow(config)
    config = config or {}
    local old = PlayerGui:FindFirstChild("CentuDoxLiquidPreview")
    if old then old:Destroy() end

    local screen = create("ScreenGui", {
        Name = "CentuDoxLiquidPreview",
        ResetOnSpawn = false,
        IgnoreGuiInset = true,
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
    }, PlayerGui)

    local root = create("Frame", {
        Name = "Window",
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.52),
        Size = UDim2.new(0.82, 0, 0.78, 0),
        BackgroundColor3 = COLORS.Glass,
        BackgroundTransparency = 0.22,
        BorderSizePixel = 0,
    }, screen)
    corner(root, 28)
    stroke(root, COLORS.Cyan, 1.8, 0.08)
    gradient(root, Color3.fromRGB(21, 47, 77), Color3.fromRGB(36, 29, 67), 25)
    create("UISizeConstraint", { MinSize = Vector2.new(330, 320), MaxSize = Vector2.new(1000, 760) }, root)

    local top = create("Frame", {
        Name = "TitleBar",
        Size = UDim2.new(1, 0, 0, 58),
        BackgroundColor3 = Color3.fromRGB(30, 54, 86),
        BackgroundTransparency = 0.2,
        BorderSizePixel = 0,
    }, root)
    corner(top, 26)
    local topCover = create("Frame", {
        Position = UDim2.new(0, 0, 1, -18),
        Size = UDim2.new(1, 0, 0, 18),
        BackgroundColor3 = top.BackgroundColor3,
        BackgroundTransparency = top.BackgroundTransparency,
        BorderSizePixel = 0,
    }, top)
    local title = label(top, "♕  " .. (config.Title or "CentuDox") .. " | Liquid Glass", 19, UDim2.new(0, 24, 0, 0), Enum.Font.GothamBold)
    title.Size = UDim2.new(1, -150, 1, 0)
    local minimize = create("TextButton", {
        Name = "Minimize",
        Text = "−",
        Font = Enum.Font.Gotham,
        TextSize = 25,
        TextColor3 = COLORS.Text,
        BackgroundTransparency = 1,
        Position = UDim2.new(1, -104, 0, 8),
        Size = UDim2.fromOffset(30, 38),
    }, top)
    local close = create("TextButton", {
        Name = "Close",
        Text = "×",
        Font = Enum.Font.Gotham,
        TextSize = 25,
        TextColor3 = COLORS.Text,
        BackgroundTransparency = 1,
        Position = UDim2.new(1, -48, 0, 8),
        Size = UDim2.fromOffset(30, 38),
    }, top)

    local body = create("Frame", {
        Name = "Body",
        Position = UDim2.new(0, 0, 0, 58),
        Size = UDim2.new(1, 0, 1, -58),
        BackgroundTransparency = 1,
    }, root)

    local sidebar = create("Frame", {
        Name = "Sidebar",
        Size = UDim2.new(0, 230, 1, 0),
        BackgroundColor3 = Color3.fromRGB(17, 35, 60),
        BackgroundTransparency = 0.36,
        BorderSizePixel = 0,
    }, body)
    corner(sidebar, 24)
    local sidebarCover = create("Frame", {
        Position = UDim2.new(1, -12, 0, 0),
        Size = UDim2.new(0, 12, 1, 0),
        BackgroundColor3 = sidebar.BackgroundColor3,
        BackgroundTransparency = sidebar.BackgroundTransparency,
        BorderSizePixel = 0,
    }, sidebar)
    stroke(sidebar, COLORS.Blue, 0.7, 0.78)

    local divider = create("Frame", {
        Position = UDim2.new(0, 230, 0, 0),
        Size = UDim2.new(0, 1, 1, 0),
        BackgroundColor3 = COLORS.Cyan,
        BackgroundTransparency = 0.72,
        BorderSizePixel = 0,
    }, body)

    local logoSize = config.LogoSize or 100
    local logo = create("ImageLabel", {
        Name = "ScriptLogo",
        Position = UDim2.new(0, 20, 0, 18),
        Size = UDim2.fromOffset(logoSize, logoSize),
        BackgroundColor3 = Color3.fromRGB(83, 143, 201),
        BackgroundTransparency = config.LogoImage and 1 or 0.35,
        Image = config.LogoImage and ("rbxassetid://" .. tostring(config.LogoImage)) or "",
        ImageTransparency = 0,
        ScaleType = Enum.ScaleType.Fit,
        BorderSizePixel = 0,
    }, sidebar)
    corner(logo, 18)
    if not config.LogoImage then stroke(logo, COLORS.Cyan, 1, 0.35) end

    local search = create("TextBox", {
        Name = "SearchTabs",
        PlaceholderText = "Search tabs...",
        Text = "",
        ClearTextOnFocus = false,
        Font = Enum.Font.Gotham,
        TextSize = 13,
        TextColor3 = COLORS.Text,
        PlaceholderColor3 = COLORS.Muted,
        TextXAlignment = Enum.TextXAlignment.Left,
        Position = UDim2.new(0, 14, 0, 132),
        Size = UDim2.new(1, -28, 0, 40),
        BackgroundColor3 = COLORS.Card,
        BackgroundTransparency = 0.52,
        BorderSizePixel = 0,
    }, sidebar)
    corner(search, 12)
    stroke(search, COLORS.Blue, 0.8, 0.82)
    create("UIPadding", { PaddingLeft = UDim.new(0, 13) }, search)

    label(sidebar, "NAVIGATION", 10, UDim2.new(0, 20, 0, 180), Enum.Font.GothamBold, COLORS.Muted)

    local tabHolder = create("ScrollingFrame", {
        Name = "TabList",
        Position = UDim2.new(0, 10, 0, 204),
        Size = UDim2.new(1, -20, 1, -242),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ScrollBarThickness = 2,
        ScrollBarImageColor3 = COLORS.Cyan,
        CanvasSize = UDim2.new(),
        AutomaticCanvasSize = Enum.AutomaticSize.Y,
    }, sidebar)
    create("UIListLayout", { Padding = UDim.new(0, 7), SortOrder = Enum.SortOrder.LayoutOrder }, tabHolder)

    local content = create("ScrollingFrame", {
        Name = "Content",
        Position = UDim2.new(0, 252, 0, 0),
        Size = UDim2.new(1, -270, 1, -12),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ScrollBarThickness = 3,
        ScrollBarImageColor3 = COLORS.Cyan,
        CanvasSize = UDim2.new(),
        AutomaticCanvasSize = Enum.AutomaticSize.Y,
    }, body)
    create("UIPadding", {
        PaddingTop = UDim.new(0, 28),
        PaddingBottom = UDim.new(0, 24),
        PaddingRight = UDim.new(0, 16),
    }, content)
    create("UIListLayout", { Padding = UDim.new(0, 12), SortOrder = Enum.SortOrder.LayoutOrder }, content)

    local tabs = {}
    local activeTab
    local function selectTab(tab)
        activeTab = tab
        for _, entry in ipairs(tabs) do
            entry.Button.BackgroundTransparency = (entry == tab) and 0.28 or 1
            entry.Button.BackgroundColor3 = (entry == tab) and COLORS.Blue or COLORS.Glass
            entry.Indicator.BackgroundTransparency = (entry == tab) and 0 or 1
            entry.Label.TextColor3 = (entry == tab) and COLORS.Text or COLORS.Muted
        end
        for _, page in ipairs(content:GetChildren()) do
            if page:IsA("Frame") and page:GetAttribute("IsTabPage") then
                page.Visible = page == tab.Page
            end
        end
    end

    local window = {}
    function window:CreateTab(name, isFirstPage, tabIconId)
        local button = create("TextButton", {
            Name = tostring(name) .. "TabButton",
            Text = "",
            Size = UDim2.new(1, 0, 0, 46),
            BackgroundColor3 = COLORS.Blue,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            AutoButtonColor = false,
        }, tabHolder)
        corner(button, 12)
        local indicator = create("Frame", {
            Position = UDim2.new(0, 0, 0, 8),
            Size = UDim2.new(0, 3, 1, -16),
            BackgroundColor3 = COLORS.Cyan,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
        }, button)
        corner(indicator, 4)

        local icon = makeIcon(button, tabIconId, "•", 22)
        icon.Position = UDim2.new(0, 17, 0.5, -11)
        icon.ImageTransparency = 0
        local tabLabel = label(button, tostring(name), 14, UDim2.new(0, 54, 0, 0), Enum.Font.GothamMedium, COLORS.Muted)
        tabLabel.Size = UDim2.new(1, -62, 1, 0)

        local page = create("Frame", {
            Name = tostring(name) .. "Page",
            Size = UDim2.new(1, -8, 0, 0),
            AutomaticSize = Enum.AutomaticSize.Y,
            BackgroundTransparency = 1,
            Visible = false,
            BorderSizePixel = 0,
        }, content)
        page:SetAttribute("IsTabPage", true)
        create("UIListLayout", { Padding = UDim.new(0, 12), SortOrder = Enum.SortOrder.LayoutOrder }, page)
        local pageTitle = label(page, tostring(name), 30, UDim2.new(), Enum.Font.GothamBold, COLORS.Text)
        pageTitle.Size = UDim2.new(1, 0, 0, 40)
        local subtitle = label(page, "Liquid Glass controls", 14, UDim2.new(0, 1, 0, 42), Enum.Font.Gotham, COLORS.Muted)
        subtitle.Size = UDim2.new(1, 0, 0, 24)
        pageTitle.LayoutOrder = 1
        subtitle.LayoutOrder = 2

        local tab = { Name = name, Button = button, Indicator = indicator, Label = tabLabel, Icon = icon, Page = page }
        table.insert(tabs, tab)
        button.MouseButton1Click:Connect(function() selectTab(tab) end)
        if isFirstPage or not activeTab then selectTab(tab) end

        local api = { Page = page }
        local function makeCard(titleText, descText, order)
            local card = create("Frame", {
                Size = UDim2.new(1, 0, 0, 82),
                BackgroundColor3 = COLORS.Card,
                BackgroundTransparency = 0.4,
                BorderSizePixel = 0,
                LayoutOrder = order or 3,
            }, page)
            corner(card, 16)
            stroke(card, COLORS.Blue, 1.1, 0.48)
            gradient(card, Color3.fromRGB(48, 88, 135), Color3.fromRGB(48, 53, 105), 0)
            local titleLabel = label(card, titleText or "Control", 16, UDim2.new(0, 18, 0, 11), Enum.Font.GothamBold)
            titleLabel.Size = UDim2.new(1, -36, 0, 24)
            local descLabel = label(card, descText or "", 12, UDim2.new(0, 18, 0, 39), Enum.Font.Gotham, COLORS.Muted)
            descLabel.Size = UDim2.new(1, -36, 0, 30)
            descLabel.TextWrapped = true
            return card
        end

        function api:CreateLabel(titleText, descText)
            local card = makeCard(titleText, descText, 3)
            card.Size = UDim2.new(1, 0, 0, 66)
            return card
        end
        function api:CreateParagraph(titleText, descText)
            local card = makeCard(titleText, descText, 3)
            card.Size = UDim2.new(1, 0, 0, 86)
            return card
        end
        function api:CreateButton(text, desc, callback)
            local card = makeCard(text, desc, 3)
            local buttonAction = create("TextButton", {
                Text = "›",
                TextSize = 26,
                Font = Enum.Font.Gotham,
                TextColor3 = COLORS.Text,
                BackgroundColor3 = COLORS.Blue,
                BackgroundTransparency = 0.35,
                BorderSizePixel = 0,
                AnchorPoint = Vector2.new(1, 0.5),
                Position = UDim2.new(1, -14, 0.5, 0),
                Size = UDim2.fromOffset(38, 38),
            }, card)
            corner(buttonAction, 19)
            buttonAction.MouseButton1Click:Connect(function()
                if callback then task.spawn(callback) end
            end)
            return card
        end
        function api:CreateSwitch(text, default, desc, callback)
            local card = makeCard(text, desc, 3)
            local on = default == true
            local toggle = create("TextButton", {
                Text = "",
                AnchorPoint = Vector2.new(1, 0.5),
                Position = UDim2.new(1, -16, 0.5, 0),
                Size = UDim2.fromOffset(48, 26),
                BackgroundColor3 = on and COLORS.Cyan or Color3.fromRGB(90, 105, 125),
                BackgroundTransparency = 0.15,
                BorderSizePixel = 0,
                AutoButtonColor = false,
            }, card)
            corner(toggle, 15)
            local knob = create("Frame", {
                Position = on and UDim2.new(1, -22, 0, 4) or UDim2.new(0, 4, 0, 4),
                Size = UDim2.fromOffset(18, 18),
                BackgroundColor3 = Color3.fromRGB(245, 250, 255),
                BorderSizePixel = 0,
            }, toggle)
            corner(knob, 10)
            toggle.MouseButton1Click:Connect(function()
                on = not on
                TweenService:Create(toggle, TweenInfo.new(0.16), {
                    BackgroundColor3 = on and COLORS.Cyan or Color3.fromRGB(90, 105, 125),
                }):Play()
                TweenService:Create(knob, TweenInfo.new(0.16), {
                    Position = on and UDim2.new(1, -22, 0, 4) or UDim2.new(0, 4, 0, 4),
                }):Play()
                if callback then task.spawn(callback, on) end
            end)
            return card
        end
        function api:CreateSlider(text, min, max, default, desc, callback)
            local card = makeCard(text, desc, 3)
            card.Size = UDim2.new(1, 0, 0, 100)
            local value = math.clamp(tonumber(default) or min, min, max)
            local valueLabel = label(card, tostring(value), 13, UDim2.new(1, -76, 0, 10), Enum.Font.GothamBold, COLORS.Cyan)
            valueLabel.TextXAlignment = Enum.TextXAlignment.Right
            valueLabel.Size = UDim2.new(0, 58, 0, 24)
            local track = create("TextButton", {
                Text = "",
                Position = UDim2.new(0, 18, 1, -27),
                Size = UDim2.new(1, -36, 0, 6),
                BackgroundColor3 = Color3.fromRGB(85, 105, 135),
                BackgroundTransparency = 0.2,
                BorderSizePixel = 0,
                AutoButtonColor = false,
            }, card)
            corner(track, 4)
            local ratio = (value - min) / math.max(1, max - min)
            local fill = create("Frame", {
                Size = UDim2.new(ratio, 0, 1, 0),
                BackgroundColor3 = COLORS.Cyan,
                BorderSizePixel = 0,
            }, track)
            corner(fill, 4)
            local dragging = false
            local function setFromX(x)
                local r = math.clamp((x - track.AbsolutePosition.X) / track.AbsoluteSize.X, 0, 1)
                value = math.floor(min + (max - min) * r + 0.5)
                fill.Size = UDim2.new(r, 0, 1, 0)
                valueLabel.Text = tostring(value)
                if callback then task.spawn(callback, value) end
            end
            track.MouseButton1Down:Connect(function(x) dragging = true; setFromX(x) end)
            UserInputService.InputChanged:Connect(function(input)
                if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then setFromX(input.Position.X) end
            end)
            UserInputService.InputEnded:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then dragging = false end
            end)
            return card
        end
        function api:CreateDropdown(text, default, optionsList, desc, callback)
            local card = makeCard(text, desc, 3)
            card.Size = UDim2.new(1, 0, 0, 88)
            local chosen = tostring(default or (optionsList and optionsList[1]) or "Select")
            local dropdown = create("TextButton", {
                Text = chosen .. "  ▾",
                TextSize = 12,
                Font = Enum.Font.GothamMedium,
                TextColor3 = COLORS.Text,
                AnchorPoint = Vector2.new(1, 0.5),
                Position = UDim2.new(1, -14, 0.5, 6),
                Size = UDim2.new(0, 130, 0, 32),
                BackgroundColor3 = COLORS.Blue,
                BackgroundTransparency = 0.3,
                BorderSizePixel = 0,
                AutoButtonColor = false,
            }, card)
            corner(dropdown, 10)
            local index = 1
            dropdown.MouseButton1Click:Connect(function()
                if not optionsList or #optionsList == 0 then return end
                index = (index % #optionsList) + 1
                chosen = tostring(optionsList[index])
                dropdown.Text = chosen .. "  ▾"
                if callback then task.spawn(callback, chosen) end
            end)
            return card
        end
        function api:CreatePageTitle(text, desc)
            local heading = label(page, text or "", 23, UDim2.new(), Enum.Font.GothamBold)
            heading.Size = UDim2.new(1, 0, 0, 34)
            heading.LayoutOrder = 3
            if desc then
                local sub = label(page, desc, 13, UDim2.new(), Enum.Font.Gotham, COLORS.Muted)
                sub.Size = UDim2.new(1, 0, 0, 24)
                sub.LayoutOrder = 4
            end
            return heading
        end
        return api
    end

    function window:ApplyTheme(_name)
        -- Liquid Glass is the current preview theme.
    end

    function window:Destroy()
        screen:Destroy()
    end

    minimize.MouseButton1Click:Connect(function()
        body.Visible = not body.Visible
        root.Size = body.Visible and UDim2.new(0.82, 0, 0.78, 0) or UDim2.new(0.82, 0, 0, 58)
    end)
    close.MouseButton1Click:Connect(function() screen:Destroy() end)

    -- Drag the window from the title bar.
    local dragging, dragStart, startPosition
    top.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPosition = root.Position
        end
    end)
    top.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then dragging = false end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            local delta = input.Position - dragStart
            root.Position = UDim2.new(startPosition.X.Scale, startPosition.X.Offset + delta.X, startPosition.Y.Scale, startPosition.Y.Offset + delta.Y)
        end
    end)

    search:GetPropertyChangedSignal("Text"):Connect(function()
        local query = string.lower(search.Text)
        for _, tab in ipairs(tabs) do
            tab.Button.Visible = query == "" or string.find(string.lower(tostring(tab.Name)), query, 1, true) ~= nil
        end
    end)

    return window
end

function CentuDoxLiquid:SendNotification(config)
    config = config or {}
    local gui = PlayerGui:FindFirstChild("CentuDoxLiquidPreview")
    if not gui then return end
    local toast = create("Frame", {
        Name = "LiquidNotification",
        AnchorPoint = Vector2.new(1, 0),
        Position = UDim2.new(1, -24, 0, 24),
        Size = UDim2.fromOffset(300, 82),
        BackgroundColor3 = COLORS.Glass,
        BackgroundTransparency = 0.18,
        BorderSizePixel = 0,
    }, gui)
    corner(toast, 16)
    stroke(toast, COLORS.Cyan, 1.2, 0.2)
    gradient(toast, Color3.fromRGB(40, 85, 130), Color3.fromRGB(66, 48, 110), 15)
    label(toast, config.Title or "CentuDox", 15, UDim2.new(0, 16, 0, 10), Enum.Font.GothamBold)
    local desc = label(toast, config.Content or config.Description or "Liquid Glass notification", 12, UDim2.new(0, 16, 0, 38), Enum.Font.Gotham, COLORS.Muted)
    desc.Size = UDim2.new(1, -30, 0, 32)
    desc.TextWrapped = true
    toast.Position = UDim2.new(1, 330, 0, 24)
    TweenService:Create(toast, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
        Position = UDim2.new(1, -24, 0, 24),
    }):Play()
    task.delay(3.5, function()
        if toast.Parent then
            TweenService:Create(toast, TweenInfo.new(0.2), {
                Position = UDim2.new(1, 330, 0, 24),
                BackgroundTransparency = 1,
            }):Play()
            task.wait(0.22)
            if toast.Parent then toast:Destroy() end
        end
    end)
end

return CentuDoxLiquid
