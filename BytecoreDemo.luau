local Library = loadstring(game:HttpGet(
    "https://raw.githubusercontent.com/idrisvale-dev/bytecore/refs/heads/byte/BytecoreLibrary.luau"
))()

local Window = Library:CreateWindow({
    Title = "Bytecore",
    Subtitle = "Minimal authorized toolkit",
    Width = 720,
    Height = 470,
})

local Main = Window:AddTab({ Title = "Overview" })
local Controls = Main:AddSection("Controls")

Controls:AddLabel("Clean, stable UI foundation. Add your own authorized game modules here.")
Controls:AddButton({
    Title = "Test notification",
    Description = "Verify the notification system.",
    Label = "Run",
    Callback = function()
        Library:Notify({ Title = "Bytecore", Content = "Everything is working.", Color = Color3.fromRGB(92, 166, 255) })
    end,
})
Controls:AddToggle({
    Title = "Example toggle",
    Description = "A safe UI-only example control.",
    Default = false,
    Callback = function(value)
        print("Example toggle:", value)
    end,
})
Controls:AddSlider({
    Title = "Example slider",
    Description = "A UI-only value control.",
    Min = 0,
    Max = 100,
    Default = 50,
    Callback = function(value)
        print("Example slider:", value)
    end,
})

local Console = Window:AddTab({ Title = "Console" })
local ConsoleSection = Console:AddSection("Capture")
ConsoleSection:AddLabel("Optional console capture writes to the executor workspace.")
Library:EnableConsoleCapture({ File = "bytecore_console.txt", MaxEntries = 500 })
