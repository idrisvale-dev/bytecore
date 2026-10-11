-- Library Glass Theme Test
-- i-inject lang ito sa Delta, walang kailangan na script

local Library = loadstring(game:HttpGet(
    "https://raw.githubusercontent.com/idrisvale-dev/bytecore/refs/heads/byte/Library/Library_Glass.lua"
))()

local Window = Library:CreateWindow({ Title = "Library Test" })

-- Tab 1
local Tab1 = Window:CreateTab("Preview", true)
Tab1:CreatePageTitle("Glass Theme")
Tab1:CreatePageSubTitle("Testing UI Elements")

Tab1:CreateSwitch("Toggle Test", false, "Sample toggle element", function(v) end, "T1")
Tab1:CreateSwitch("Another Toggle", true, "Another sample toggle", function(v) end, "T2")

Tab1:CreateSlider("Slider Test", 0, 100, 50, "Sample slider element", function(v) end, "S1")

Tab1:CreateDropdown("Dropdown Test", "Option 1",
    {"Option 1", "Option 2", "Option 3"},
    "Sample dropdown element", function(v) end, "D1")

Tab1:CreateButton("Button Test", "Sample button element", function()
    Library:SendNotification("Test", "Button clicked!")
end)

Tab1:CreateLabel("Label Title", "Sample label description text here")

Tab1:CreateInput("Input Test", "Type here...", "", "Sample input field", false, function(v) end, "I1")

-- Tab 2
local Tab2 = Window:CreateTab("More", false)
Tab2:CreatePageTitle("More Elements")
Tab2:CreatePageSubTitle("Second Tab")

Tab2:CreateSwitch("Option A", false, "Test option A", function(v) end, "A1")
Tab2:CreateSwitch("Option B", false, "Test option B", function(v) end, "A2")
Tab2:CreateSlider("Value", 1, 200, 75, "Sample value slider", function(v) end, "V1")
Tab2:CreateButton("Notify Test", "Triggers a notification", function()
    Library:SendNotification("Glass Theme", "Liquid Glass UI is working!")
end)

Library:SendNotification("Library Test", "Glass theme loaded successfully.")
