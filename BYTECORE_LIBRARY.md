# Bytecore Library

A clean, dependency-free Roblox Luau UI foundation for authorized projects. It is a fresh rewrite and does not depend on the recovered NightGlass/Luraph output.

## Files

- `BytecoreLibrary.luau` — reusable UI library
- `BytecoreDemo.luau` — ready-to-run example

## Hosted usage

```lua
local Library = loadstring(game:HttpGet(
    "https://raw.githubusercontent.com/idrisvale-dev/bytecore/refs/heads/byte/BytecoreLibrary.luau"
))()

local Window = Library:CreateWindow({
    Title = "My Hub",
    Subtitle = "Authorized project",
})

local Tab = Window:AddTab({ Title = "Main" })
local Section = Tab:AddSection("Controls")

Section:AddButton({
    Title = "Run",
    Description = "Button description",
    Label = "Execute",
    Callback = function()
        print("button clicked")
    end,
})
```

## Included

- Smooth draggable window
- Tab navigation
- Sections and labels
- Buttons
- Toggles
- Sliders
- Notifications
- Optional `LogService.MessageOut` capture
- Optional executor workspace text logging
- Safe callback isolation with `xpcall`
- Clean `Destroy()` lifecycle
- Dark minimalist visual system with centralized colors

The library intentionally contains no game-specific automation or remote payload loader. Game modules can be added separately and should be authorized for the target experience.
