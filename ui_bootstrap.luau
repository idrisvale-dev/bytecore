-- HoHo/NightGlass recovered-library UI bootstrap
-- This file intentionally only loads the hosted library and opens its UI.

local SOURCE_URL = "https://raw.githubusercontent.com/idrisvale-dev/bytecore/refs/heads/byte/input.devirt(2).luau"

local function report(message)
    warn("[NightGlass bootstrap] " .. tostring(message))
end

local ok, result = pcall(function()
    local source = game:HttpGet(SOURCE_URL)
    local chunk, compileError = loadstring(source)
    if not chunk then
        error("compile failed: " .. tostring(compileError))
    end
    return chunk()
end)

if not ok then
    report(result)
    return nil
end

local Library = result
if type(Library) ~= "table" then
    report("library returned " .. typeof(Library) .. "; expected a table")
    return nil
end

local okWindow, Window = pcall(function()
    return Library:CreateWindow({
        Title = "HoHo Hub",
        Subtitle = "Recovered UI",
        Size = UDim2.fromOffset(580, 440),
        Theme = "Blue",
        Glass = false,
        Blur = 70,
        Depth = 55,
        MinimizeKey = Enum.KeyCode.RightControl,
        Settings = { Save = false },
    })
end)

if not okWindow or not Window then
    report("CreateWindow failed: " .. tostring(Window))
    return nil
end

local okTab, Tab = pcall(function()
    return Window:AddTab({
        Title = "Home",
        Icon = "home",
    })
end)

if not okTab or not Tab then
    report("AddTab failed: " .. tostring(Tab))
    return Window
end

local okSection, Section = pcall(function()
    return Tab:AddSection("Status")
end)

if not okSection or not Section then
    report("AddSection failed: " .. tostring(Section))
    return Window
end

Section:AddButton({
    Title = "UI loaded",
    Description = "Recovered NightGlass library is running.",
    Label = "OK",
    Callback = function()
        if Library.Notify then
            Library:Notify({
                Title = "NightGlass",
                Content = "The recovered UI is active.",
                Kind = "good",
                Duration = 3,
            })
        end
    end,
})

Section:AddToggle({
    Title = "Test toggle",
    Description = "Smoke-test control for the recovered UI.",
    Default = false,
    Callback = function(value)
        report("Test toggle = " .. tostring(value))
    end,
})

return {
    Library = Library,
    Window = Window,
    Tab = Tab,
    Section = Section,
}
