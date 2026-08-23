local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer

local FrozenCFrame = nil
local RealCFrame = nil
local Connection = nil
local Visualizer = nil

local function getRootPart()
    local char = player.Character
    return char and char:FindFirstChild("HumanoidRootPart")
end

local function createVisualizer()
    if Visualizer then
        Visualizer:Destroy()
    end
    
    local root = getRootPart()
    if not root then return end
    
    local part = Instance.new("Part")
    part.Name = "DesyncVisualizer"
    part.Size = Vector3.new(2, 5, 2)
    part.CFrame = root.CFrame
    part.Anchored = true
    part.CanCollide = false
    part.Material = Enum.Material.ForceField
    part.Color = Color3.fromRGB(255, 0, 0)
    part.Transparency = 0.5
    part.Parent = workspace
    
    Visualizer = part
end

local function removeVisualizer()
    if Visualizer then
        Visualizer:Destroy()
        Visualizer = nil
    end
end

local function updateVisualizer()
    if not Visualizer then return end
    
    local root = getRootPart()
    if not root then return end
    
    Visualizer.CFrame = FrozenCFrame or root.CFrame
end

local function freezePosition()
    local root = getRootPart()
    if not root then return end
    
    FrozenCFrame = root.CFrame
    RealCFrame = root.CFrame
end

local function enableDesync()
    local root = getRootPart()
    if not root then return end
    
    freezePosition()
    createVisualizer()
    
    pcall(function()
        if setsimulationradius then
            setsimulationradius(0)
        end
    end)
    
    pcall(function()
        if hookmetamethod then
            hookmetamethod(root, "__index", newcclosure(function(self, key)
                if self == root and key == "CFrame" then
                    if FrozenCFrame then
                        return FrozenCFrame
                    end
                end
                return rawget(self, key)
            end))
        end
    end)
    
    Connection = RunService.Heartbeat:Connect(function()
        local root = getRootPart()
        if not root then return end
        
        RealCFrame = root.CFrame
        updateVisualizer()
        
        pcall(function()
            if setsimulationradius then
                setsimulationradius(0)
            end
        end)
    end)
    
    print("[Desync] ACTIVE - Enemy sees you frozen, you move normally")
end

local function disableDesync()
    if Connection then
        Connection:Disconnect()
        Connection = nil
    end
    
    removeVisualizer()
    
    pcall(function()
        if setsimulationradius then
            setsimulationradius(1000)
        end
    end)
    
    FrozenCFrame = nil
    RealCFrame = nil
    
    print("[Desync] DISABLED")
end

player.CharacterAdded:Connect(function()
    task.wait(1)
    enableDesync()
end)

enableDesync()
