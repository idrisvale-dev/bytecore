-- Quantum Onyx + NightHub visible startup launcher
-- Static-authored wrapper; do not execute in the sandbox.
local NIGHT_URL = "https://raw.githubusercontent.com/idrisvale-dev/bytecore/6f96387a55d31f431728d2e8696a1bcd9e896f87/NightHub_v15_reconstructed13.luau"
local QUANTUM_URL = "https://raw.githubusercontent.com/idrisvale-dev/bytecore/f59d4f3e6aadee031777a624011e39ed09d21a5e/QuantumOnyx_NightHub.luau"

local function loadRemote(url)
    local source = game:HttpGet(url)
    local chunk, err = loadstring(source)
    if not chunk then
        error("compile failed for " .. url .. ": " .. tostring(err))
    end
    return chunk()
end

local Library = loadRemote(NIGHT_URL)
local Window = Library:CreateWindow({
    Title = "Quantum Onyx",
    Subtitle = "NightHub startup monitor",
    Size = UDim2.fromOffset(580, 440),
    TabWidth = 132,
})

local Tab = Window:AddTab({ Title = "Startup", Icon = "activity" })
local Section = Tab:AddSection("Loader status")
local Status = Section:AddParagraph({
    Title = "Quantum Onyx",
    Description = "NightHub loaded. Waiting for Quantum startup...",
})

local function setStatus(title, description)
    if Status.SetTitle then Status:SetTitle(title) end
    if Status.SetDesc then Status:SetDesc(description) end
end

local localPlayer = game:GetService("Players").LocalPlayer
setStatus("Waiting for game state", "Checking DataLoaded and PlayerGui.Main...")

task.spawn(function()
    local started = tick()
    while tick() - started < 45 do
        if game:IsLoaded() and localPlayer and localPlayer:FindFirstChild("DataLoaded") then
            break
        end
        task.wait(0.25)
    end

    if not localPlayer or not localPlayer:FindFirstChild("DataLoaded") then
        setStatus("Startup timeout", "DataLoaded was not found after 45 seconds. Join Blox Fruits fully, then run again.")
        return
    end

    setStatus("DataLoaded found", "Waiting for PlayerGui.Main...")
    local startedMain = tick()
    while tick() - startedMain < 45 do
        local playerGui = localPlayer:FindFirstChildOfClass("PlayerGui")
        if playerGui and playerGui:FindFirstChild("Main") then
            break
        end
        task.wait(0.25)
    end

    local playerGui = localPlayer:FindFirstChildOfClass("PlayerGui")
    if not playerGui or not playerGui:FindFirstChild("Main") then
        setStatus("Main GUI timeout", "PlayerGui.Main was not found after 45 seconds. Rejoin the game and run again.")
        return
    end

    setStatus("Loading Quantum", "Executing the pinned Quantum Onyx integration...")
    local ok, result = pcall(function()
        return loadRemote(QUANTUM_URL)
    end)

    if ok then
        setStatus("Quantum started", "Quantum Onyx finished its startup call. Check the tabs and controls.")
    else
        setStatus("Quantum failed", tostring(result))
        warn("[Quantum Launcher] " .. tostring(result))
    end
end)
