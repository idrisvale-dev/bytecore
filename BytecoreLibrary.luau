-- Bytecore UI Library
-- Clean, dependency-free Roblox UI foundation for authorized projects.
-- API: Library:CreateWindow(config), window:AddTab(config), tab:AddSection(title)

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local LogService = game:GetService("LogService")
local HttpService = game:GetService("HttpService")

local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

local Library = {
    Version = "1.0.0",
    Connections = {},
    Windows = {},
}
Library.__index = Library

local COLORS = {
    Background = Color3.fromRGB(12, 14, 19),
    Panel = Color3.fromRGB(19, 22, 29),
    Panel2 = Color3.fromRGB(24, 28, 37),
    Surface = Color3.fromRGB(30, 35, 45),
    SurfaceHover = Color3.fromRGB(38, 44, 56),
    Text = Color3.fromRGB(235, 239, 247),
    Muted = Color3.fromRGB(145, 154, 171),
    Accent = Color3.fromRGB(245, 74, 91),
    Accent2 = Color3.fromRGB(177, 42, 61),
    Good = Color3.fromRGB(83, 205, 139),
    Bad = Color3.fromRGB(240, 103, 111),
    Warn = Color3.fromRGB(245, 185, 92),
    Border = Color3.fromRGB(54, 62, 78),
}

local function connect(self, signal, callback)
    local c = signal:Connect(callback)
    table.insert(self.Connections, c)
    return c
end

local function tween(instance, duration, properties)
    local t = TweenService:Create(instance, TweenInfo.new(duration or 0.18, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), properties)
    t:Play()
    return t
end

local function corner(parent, radius)
    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, radius or 8)
    c.Parent = parent
    return c
end

local function stroke(parent, color, transparency)
    local s = Instance.new("UIStroke")
    s.Color = color or COLORS.Border
    s.Transparency = transparency or 0
    s.Thickness = 1
    s.Parent = parent
    return s
end

local function liquid(parent, first, second, rotation)
    local g = Instance.new("UIGradient")
    g.Color = ColorSequence.new(first or COLORS.Panel2, second or COLORS.Panel)
    g.Rotation = rotation or 28
    g.Parent = parent
    return g
end

local function label(parent, text, size, color, font)
    local l = Instance.new("TextLabel")
    l.BackgroundTransparency = 1
    l.Text = text or ""
    l.TextColor3 = color or COLORS.Text
    l.TextSize = size or 14
    l.Font = font or Enum.Font.Gotham
    l.TextXAlignment = Enum.TextXAlignment.Left
    l.TextYAlignment = Enum.TextYAlignment.Center
    l.Parent = parent
    return l
end

local function button(parent, text)
    local b = Instance.new("TextButton")
    b.AutoButtonColor = false
    b.BackgroundColor3 = COLORS.Surface
    b.BorderSizePixel = 0
    b.Text = text or ""
    b.TextColor3 = COLORS.Text
    b.TextSize = 13
    b.Font = Enum.Font.GothamMedium
    b.Parent = parent
    corner(b, 7)
    liquid(b, COLORS.SurfaceHover, COLORS.Surface, 35)
    connect(Library, b.MouseEnter, function() tween(b, 0.14, { BackgroundColor3 = COLORS.SurfaceHover }) end)
    connect(Library, b.MouseLeave, function() tween(b, 0.14, { BackgroundColor3 = COLORS.Surface }) end)
    return b
end

local function make(className, properties, parent)
    local obj = Instance.new(className)
    for k, v in pairs(properties or {}) do obj[k] = v end
    obj.Parent = parent
    return obj
end

local function safeCallback(callback, ...)
    if type(callback) ~= "function" then return end
    local args = table.pack(...)
    local ok, err = xpcall(function() callback(table.unpack(args, 1, args.n)) end, debug.traceback)
    if not ok then warn("[Bytecore] callback error: " .. tostring(err)) end
end

function Library:Notify(config)
    config = config or {}
    local holder = self.NotificationHolder
    if not holder then return end
    local item = make("Frame", {
        Size = UDim2.new(1, 0, 0, 66),
        BackgroundColor3 = COLORS.Panel2,
        BackgroundTransparency = 0.03,
        BorderSizePixel = 0,
    }, holder)
    corner(item, 9)
    stroke(item, config.Color or COLORS.Border, 0.1)
    local bar = make("Frame", { Size = UDim2.new(0, 3, 1, -18), Position = UDim2.fromOffset(10, 9), BackgroundColor3 = config.Color or COLORS.Accent, BorderSizePixel = 0 }, item)
    corner(bar, 2)
    local title = label(item, config.Title or "Notification", 13, COLORS.Text, Enum.Font.GothamBold)
    title.Position = UDim2.fromOffset(23, 9); title.Size = UDim2.new(1, -32, 0, 18)
    local body = label(item, config.Content or "", 12, COLORS.Muted)
    body.Position = UDim2.fromOffset(23, 29); body.Size = UDim2.new(1, -32, 0, 25); body.TextWrapped = true
    item.Position = UDim2.new(1, 12, 0, 0)
    tween(item, 0.25, { Position = UDim2.new(0, 0, 0, 0) })
    task.delay(config.Duration or 4, function()
        if item.Parent then
            tween(item, 0.2, { Position = UDim2.new(1, 12, 0, 0) }).Completed:Connect(function() item:Destroy() end)
        end
    end)
end

function Library:_makeRow(parent, titleText, description)
    local row = make("Frame", { Size = UDim2.new(1, 0, 0, description and 58 or 42), BackgroundTransparency = 1 }, parent)
    local title = label(row, titleText, 13, COLORS.Text, Enum.Font.GothamMedium)
    title.Position = UDim2.fromOffset(12, description and 8 or 0); title.Size = UDim2.new(1, -150, 0, 20)
    if description then
        local desc = label(row, description, 11, COLORS.Muted)
        desc.Position = UDim2.fromOffset(12, 28); desc.Size = UDim2.new(1, -150, 0, 17)
        desc.TextTruncate = Enum.TextTruncate.AtEnd
    end
    return row
end

function Library:_addControl(section, control)
    control.Parent = section.Content
    return control
end

function Library:_newSection(tab, titleText)
    local section = {
        Window = tab.Window,
        Tab = tab,
        Content = make("Frame", { Size = UDim2.new(1, 0, 0, 0), AutomaticSize = Enum.AutomaticSize.Y, BackgroundTransparency = 1 }, tab.Content),
    }
    local header = label(section.Content, string.upper(titleText or "SECTION"), 10, COLORS.Muted, Enum.Font.GothamBold)
    header.Size = UDim2.new(1, -24, 0, 22); header.Position = UDim2.fromOffset(12, 0)
    local list = make("UIListLayout", { Padding = UDim.new(0, 5), SortOrder = Enum.SortOrder.LayoutOrder }, section.Content)
    list:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        section.Content.Size = UDim2.new(1, 0, 0, list.AbsoluteContentSize.Y)
    end)
    function section:AddButton(config)
        config = type(config) == "table" and config or { Title = tostring(config) }
        local row = self.Window.Library:_makeRow(self.Content, config.Title or "Button", config.Description)
        local b = button(row, config.Label or config.ButtonText or "Run")
        b.Size = UDim2.fromOffset(82, 30); b.Position = UDim2.new(1, -94, 0.5, -15)
        connect(self.Window, b.Activated, function() safeCallback(config.Callback) end)
        return { Instance = row, Button = b }
    end
    function section:AddToggle(config)
        config = config or {}
        local row = self.Window.Library:_makeRow(self.Content, config.Title or "Toggle", config.Description)
        local track = button(row, "")
        track.Size = UDim2.fromOffset(42, 24); track.Position = UDim2.new(1, -54, 0.5, -12); track.ClipsDescendants = true
        track.BackgroundColor3 = config.Default and COLORS.Accent or COLORS.Surface
        local knob = make("Frame", { Size = UDim2.fromOffset(18, 18), Position = config.Default and UDim2.fromOffset(21, 3) or UDim2.fromOffset(3, 3), BackgroundColor3 = COLORS.Text, BorderSizePixel = 0 }, track)
        corner(knob, 9)
        local state = config.Default == true
        local api = {}
        local function set(value, fire)
            state = value == true
            tween(track, 0.16, { BackgroundColor3 = state and COLORS.Accent or COLORS.Surface })
            tween(knob, 0.16, { Position = state and UDim2.fromOffset(21, 3) or UDim2.fromOffset(3, 3) })
            if fire then safeCallback(config.Callback, state) end
        end
        api.SetValue = function(_, value) set(value, true) end
        api.GetValue = function() return state end
        connect(self.Window, track.Activated, function() set(not state, true) end)
        return api
    end
    function section:AddSlider(config)
        config = config or {}
        local row = self.Window.Library:_makeRow(self.Content, config.Title or "Slider", config.Description)
        local min, max = config.Min or 0, config.Max or 100
        local value = math.clamp(config.Default or min, min, max)
        local track = make("Frame", { Size = UDim2.fromOffset(120, 6), Position = UDim2.new(1, -132, 0.5, -3), BackgroundColor3 = COLORS.Surface, BorderSizePixel = 0, Active = true }, row)
        corner(track, 3)
        local fill = make("Frame", { Size = UDim2.new((value - min) / (max - min), 0, 1, 0), BackgroundColor3 = COLORS.Accent, BorderSizePixel = 0 }, track)
        corner(fill, 3)
        liquid(fill, Color3.fromRGB(255, 109, 122), COLORS.Accent2, 0)
        local knob = make("TextButton", { Size = UDim2.fromOffset(16, 16), Position = UDim2.new((value - min) / (max - min), -8, 0.5, -8), BackgroundColor3 = COLORS.Text, Text = "", BorderSizePixel = 0, AutoButtonColor = false }, track)
        corner(knob, 8)
        local api = {}
        local function set(v, fire)
            value = math.clamp(tonumber(v) or min, min, max)
            local alpha = (value - min) / math.max(max - min, 1)
            fill.Size = UDim2.new(alpha, 0, 1, 0); knob.Position = UDim2.new(alpha, -8, 0.5, -8)
            if fire then safeCallback(config.Callback, value) end
        end
        local dragging = false
        local function updateFromX(x)
            local alpha = math.clamp((x - track.AbsolutePosition.X) / math.max(track.AbsoluteSize.X, 1), 0, 1)
            set(min + (max - min) * alpha, true)
        end
        connect(self.Window, track.InputBegan, function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                dragging = true; updateFromX(input.Position.X)
            end
        end)
        connect(self.Window, UserInputService.InputChanged, function(input)
            if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
                updateFromX(input.Position.X)
            end
        end)
        connect(self.Window, UserInputService.InputEnded, function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then dragging = false end
        end)
        api.SetValue = function(_, v) set(v, true) end
        api.GetValue = function() return value end
        return api
    end
    function section:AddDropdown(config)
        config = config or {}
        local values = config.Values or config.Options or {}
        local row = self.Window.Library:_makeRow(self.Content, config.Title or "Dropdown", config.Description)
        row.ZIndex = 20; row.ClipsDescendants = false
        local selected = config.Default or values[1]
        local trigger = button(row, tostring(selected or "Select"))
        trigger.Size = UDim2.fromOffset(132, 30); trigger.Position = UDim2.new(1, -144, 0.5, -15); trigger.ZIndex = 21
        trigger.TextTruncate = Enum.TextTruncate.AtEnd
        liquid(trigger, COLORS.SurfaceHover, COLORS.Surface, 0)
        local menu = make("Frame", { Visible = false, ZIndex = 50, Size = UDim2.fromOffset(132, 0), AutomaticSize = Enum.AutomaticSize.Y, BackgroundColor3 = COLORS.Panel2, BorderSizePixel = 0, Active = true }, row)
        menu.Position = UDim2.new(1, -144, 1, 3); corner(menu, 7); stroke(menu, COLORS.Border, 0.1)
        liquid(menu, COLORS.Panel2, COLORS.Background, 20)
        local list = make("UIListLayout", { Padding = UDim.new(0, 2), SortOrder = Enum.SortOrder.LayoutOrder }, menu)
        local api = { Value = selected, Values = values }
        local function rebuild()
            for _, child in ipairs(menu:GetChildren()) do if child:IsA("TextButton") then child:Destroy() end end
            for index, value in ipairs(api.Values) do
                local option = button(menu, tostring(value)); option.Size = UDim2.new(1, -8, 0, 28); option.Position = UDim2.fromOffset(4, 0); option.LayoutOrder = index; option.ZIndex = 51
                connect(self.Window, option.Activated, function()
                    api.Value = value; trigger.Text = tostring(value); menu.Visible = false; safeCallback(config.Callback, value)
                end)
            end
        end
        function api:SetValue(value)
            if table.find(api.Values, value) then api.Value = value; trigger.Text = tostring(value); safeCallback(config.Callback, value) end
        end
        function api:SetValues(newValues)
            api.Values = newValues or {}; api.Value = api.Values[1]; trigger.Text = tostring(api.Value or "Select"); rebuild()
        end
        connect(self.Window, trigger.Activated, function() menu.Visible = not menu.Visible end)
        connect(self.Window, UserInputService.InputBegan, function(input)
            if menu.Visible and input.UserInputType == Enum.UserInputType.MouseButton1 then
                local p, s = menu.AbsolutePosition, menu.AbsoluteSize
                if input.Position.X < p.X or input.Position.X > p.X + s.X or input.Position.Y < p.Y or input.Position.Y > p.Y + s.Y then menu.Visible = false end
            end
        end)
        rebuild()
        return api
    end
    function section:AddLabel(text)
        local l = label(self.Content, text or "", 12, COLORS.Muted)
        l.Size = UDim2.new(1, -24, 0, 28); l.Position = UDim2.fromOffset(12, 0); l.TextWrapped = true
        return l
    end
    return section
end

function Library:_makeTabButton(window, tab, index)
    local b = button(window.Nav, tab.Title)
    b.Size = UDim2.new(1, 0, 0, 34); b.LayoutOrder = index; b.TextXAlignment = Enum.TextXAlignment.Left
    local padding = Instance.new("UIPadding", b); padding.PaddingLeft = UDim.new(0, 14)
    connect(self, b.Activated, function() window:SelectTab(index) end)
    return b
end

function Library:CreateWindow(config)
    config = config or {}
    local old = PlayerGui:FindFirstChild(config.Name or "BytecoreUI")
    if old then old:Destroy() end
    local gui = make("ScreenGui", { Name = config.Name or "BytecoreUI", ResetOnSpawn = false, IgnoreGuiInset = true, DisplayOrder = config.DisplayOrder or 999 }, PlayerGui)
    local root = make("Frame", { Size = UDim2.fromScale(0.92, 0.78), Position = UDim2.fromScale(0.5, 0.5), AnchorPoint = Vector2.new(0.5, 0.5), BackgroundColor3 = COLORS.Background, BorderSizePixel = 0 }, gui)
    corner(root, 14); stroke(root, COLORS.Border, 0.15)
    liquid(root, Color3.fromRGB(24, 28, 38), COLORS.Background, 28)
    make("UISizeConstraint", { MinSize = Vector2.new(300, 250), MaxSize = Vector2.new(config.Width or 720, config.Height or 470) }, root)
    local header = make("Frame", { Size = UDim2.new(1, 0, 0, 52), BackgroundTransparency = 1 }, root)
    local title = label(header, config.Title or "Bytecore", 16, COLORS.Text, Enum.Font.GothamBold); title.Position = UDim2.fromOffset(16, 8); title.Size = UDim2.new(1, -132, 0, 20); title.TextTruncate = Enum.TextTruncate.AtEnd
    local subtitle = label(header, config.Subtitle or "Minimal interface", 10, COLORS.Muted); subtitle.Position = UDim2.fromOffset(17, 28); subtitle.Size = UDim2.new(1, -132, 0, 14); subtitle.TextTruncate = Enum.TextTruncate.AtEnd
    local minimize = button(header, "—"); minimize.Size = UDim2.fromOffset(30, 28); minimize.Position = UDim2.new(1, -76, 0, 12); minimize.TextSize = 18
    local close = button(header, "×"); close.Size = UDim2.fromOffset(30, 28); close.Position = UDim2.new(1, -40, 0, 12); close.TextSize = 19
    local body = make("Frame", { Position = UDim2.fromOffset(10, 60), Size = UDim2.new(1, -20, 1, -70), BackgroundTransparency = 1 }, root)
    local nav = make("Frame", { Size = UDim2.fromOffset(108, 1), AutomaticSize = Enum.AutomaticSize.Y, BackgroundTransparency = 1 }, body)
    make("UIListLayout", { Padding = UDim.new(0, 5), SortOrder = Enum.SortOrder.LayoutOrder }, nav)
    local content = make("Frame", { Position = UDim2.fromOffset(118, 0), Size = UDim2.new(1, -118, 1, 0), BackgroundColor3 = COLORS.Panel, BorderSizePixel = 0 }, body)
    corner(content, 10); stroke(content, COLORS.Border, 0.35); liquid(content, Color3.fromRGB(27, 32, 43), COLORS.Panel, 24)
    local tabs = {}
    local window = { Library = self, GUI = gui, Root = root, Nav = nav, Content = content, Tabs = tabs, CurrentTab = 0, Connections = {}, Minimized = false, AnimationsEnabled = true }
    window.__index = window
    setmetatable(window, window)
    function window:SelectTab(index)
        local tab = tabs[index]; if not tab then return end
        self.CurrentTab = index
        for i, item in ipairs(tabs) do
            item.Page.Visible = i == index
            item.Button.BackgroundColor3 = i == index and COLORS.Accent2 or COLORS.Surface
            item.Button.TextColor3 = i == index and COLORS.Text or COLORS.Muted
        end
    end
    function window:AddTab(tabConfig)
        tabConfig = type(tabConfig) == "table" and tabConfig or { Title = tostring(tabConfig) }
        local page = make("ScrollingFrame", { Size = UDim2.new(1, -16, 1, -16), Position = UDim2.fromOffset(8, 8), BackgroundTransparency = 1, BorderSizePixel = 0, ScrollBarThickness = 3, ScrollBarImageColor3 = COLORS.Accent, AutomaticCanvasSize = Enum.AutomaticSize.Y, CanvasSize = UDim2.new() }, content)
        make("UIListLayout", { Padding = UDim.new(0, 10), SortOrder = Enum.SortOrder.LayoutOrder }, page)
        local tab = { Window = self, Title = tabConfig.Title or ("Tab " .. (#tabs + 1)), Page = page, Content = page }
        table.insert(tabs, tab)
        tab.Button = self.Library:_makeTabButton(self, tab, #tabs)
        function tab:AddSection(titleText) return self.Window.Library:_newSection(self, titleText) end
        page.Visible = #tabs == 1
        self:SelectTab(1)
        return tab
    end
    function window:Destroy()
        for _, c in ipairs(self.Connections) do pcall(function() c:Disconnect() end) end
        if self.GUI then self.GUI:Destroy() end
        self.Library.Windows[self] = nil
    end
    function window:SetAnimationsEnabled(enabled)
        self.AnimationsEnabled = enabled ~= false
        return self.AnimationsEnabled
    end
    function window:FixAnimations()
        self.AnimationsEnabled = true
        self.Library:Notify({ Title = "Animations", Content = "Smooth animation mode enabled.", Color = COLORS.Good, Duration = 2 })
    end
    local normalSize = root.Size
    local function setMinimized(value)
        window.Minimized = value
        if value then
            body.Visible = false
            tween(root, 0.24, { Size = UDim2.new(0.6, 0, 0, 52) })
        else
            tween(root, 0.24, { Size = normalSize }).Completed:Connect(function() body.Visible = true end)
        end
    end
    connect(self, minimize.Activated, function() setMinimized(not window.Minimized) end)
    connect(self, close.Activated, function() window:Destroy() end)
    local dragging, dragStart, startPos
    connect(self, header.InputBegan, function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true; dragStart = input.Position; startPos = root.Position
        end
    end)
    connect(self, UserInputService.InputChanged, function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            local delta = input.Position - dragStart
            root.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)
    connect(self, UserInputService.InputEnded, function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then dragging = false end
    end)
    local notifications = make("Frame", { Size = UDim2.fromOffset(280, 0), Position = UDim2.new(1, -294, 0, 16), AutomaticSize = Enum.AutomaticSize.Y, BackgroundTransparency = 1 }, gui)
    make("UIListLayout", { Padding = UDim.new(0, 8), VerticalAlignment = Enum.VerticalAlignment.Top }, notifications)
    self.NotificationHolder = notifications
    self.ActiveWindow = window
    self.Windows[window] = true
    window:SelectTab(1)
    tween(root, 0.35, { BackgroundTransparency = 0 })
    return window
end

function Library:EnableConsoleCapture(options)
    options = options or {}
    local max = options.MaxEntries or 500
    local entries = {}
    local function add(message, messageType)
        entries[#entries + 1] = { Time = os.time(), Type = tostring(messageType), Message = tostring(message) }
        if #entries > max then table.remove(entries, 1) end
        if options.File and type(writefile) == "function" then
            local lines = {}
            for _, item in ipairs(entries) do lines[#lines + 1] = os.date("!%Y-%m-%dT%H:%M:%SZ", item.Time) .. " [" .. item.Type .. "] " .. item.Message end
            pcall(writefile, options.File, table.concat(lines, "\n") .. "\n")
        end
    end
    local connection = LogService.MessageOut:Connect(add)
    table.insert(self.Connections, connection)
    return entries
end

function Library:Destroy()
    for _, c in ipairs(self.Connections) do pcall(function() c:Disconnect() end) end
    self.Connections = {}
    for window in pairs(self.Windows) do window:Destroy() end
end

return Library
