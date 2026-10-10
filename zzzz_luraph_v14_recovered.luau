-- By DevAurora Code
-- Detected obfuscation: Luraph v14.8
-- By DevAurora Code
-- Result type: dynamic trace
-- source: zzzz.lua
-- NOTE: reconstructed from observed behaviour; branches that were not taken
--       during the trace are missing and conditions are only noted in comments.
-- run status: finished
-- 192 statements recorded in 1.80s

-- loadstring() of 240163 bytes: "return({FP=function(P,m,c,f,p,Z,a,R,s,X,n,F)F=0x4_b;while true do if F>47 then if not(F>57)then if F<=0x35 then p,F=P:fP(p,c,n,F);continue;else m=c[0X1A](n);Z=c[0x1A](n);break;end;else if F~=0X42 then"
-- loadstring() of 2478 bytes: "\n\t--[[\n\n\t\t\t\t\t .@%(/*,.......      ...,,*/(#%&@@.\n\t\t\t\t (*   ,/(#%%&&@@@@&%((////(((##%###((/**,,.     ,//(&.\n\t\t\t   /* .%@@@@@@@@%,  .(&@@@&&&&&&@@@@@@&#(*,........*%@@@(.  ,#.\n\t\t\t */ .&@@@@@@@*  (%,   "
getgenv().Nousigi = true

getgenv().UIColor = {
	["Background 1 Color"] = Color3.fromRGB(28, 28, 34),
	["Background 1 Transparency"] = 0.25,
	["Background 2 Color"] = Color3.fromRGB(38, 38, 46),
	["Background 3 Color"] = Color3.fromRGB(48, 48, 56),
	["Background Image"] = "",
	["Background Main Color"] = Color3.fromRGB(18, 18, 22),
	["Border Color"] = Color3.fromRGB(90, 90, 70),
	["Box Highlight Color"] = Color3.fromRGB(255, 214, 94),
	["Button Color"] = Color3.fromRGB(255, 214, 94),
	["Click Effect Color"] = Color3.fromRGB(230, 230, 220),
	["Dropdown Icon Color"] = Color3.fromRGB(220, 220, 210),
	["Dropdown Selected Check Color"] = Color3.fromRGB(250, 190, 50),
	["Dropdown Selected Color"] = Color3.fromRGB(255, 214, 94),
	["GUI Text Color"] = Color3.fromRGB(235, 235, 230),
	["Label Color"] = Color3.fromRGB(240, 240, 230),
	["Logo Image"] = "rbxassetid://5009915795",
	["Page Selected Color"] = Color3.fromRGB(255, 214, 94),
	["Placeholder Text Color"] = Color3.fromRGB(170, 170, 160),
	["Search Icon Color"] = Color3.fromRGB(240, 240, 230),
	["Search Icon Highlight Color"] = Color3.fromRGB(255, 214, 94),
	["Section Text Color"] = Color3.fromRGB(220, 220, 210),
	["Section Underline Color"] = Color3.fromRGB(255, 200, 72),
	["Setting Icon Color"] = Color3.fromRGB(220, 220, 210),
	["Slider Highlight Color"] = Color3.fromRGB(255, 214, 94),
	["Slider Line Color"] = Color3.fromRGB(80, 80, 60),
	["Text Color"] = Color3.fromRGB(235, 235, 230),
	["Text Stroke Transparency"] = 0.85,
	["Textbox Highlight Color"] = Color3.fromRGB(255, 214, 94),
	["Title Text Color"] = Color3.fromRGB(255, 214, 94),
	["Toggle Border Color"] = Color3.fromRGB(255, 214, 94),
	["Toggle Checked Color"] = Color3.fromRGB(250, 190, 50),
	["Toggle Desc Color"] = Color3.fromRGB(190, 190, 180),
	["Tween Animation 1 Speed"] = 0,
	["Tween Animation 2 Speed"] = 0,
	["Tween Animation 3 Speed"] = 0
}

getgenv().UIToggled = false
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local NousigiHubGUI = Instance.new("ScreenGui")
NousigiHubGUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
NousigiHubGUI.Name = "Nousigi Hub GUI"
NousigiHubGUI.Enabled = false
getgenv().ReadyForGuiLoaded = false

spawn(function()
	task.wait()
	task.wait()
	-- [envlog] the statements above repeat forever (loop)
end)

local NousigiHubNotification = Instance.new("ScreenGui")
NousigiHubNotification.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
NousigiHubNotification.Name = "Nousigi Hub Notification"
local NousigiHubBtn = Instance.new("ScreenGui")
NousigiHubBtn.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
NousigiHubBtn.Name = "Nousigi Hub Btn"
local TextButton = Instance.new("TextButton", NousigiHubBtn)
TextButton.BackgroundTransparency = 1
TextButton.Text = ""
TextButton.AnchorPoint = Vector2.new(0, 1)
TextButton.Size = UDim2.new(0, 50, 0, 50)
TextButton.Position = UDim2.new(0, 15, 1, -15)
local dutdit = Instance.new("Frame", TextButton)
dutdit.AnchorPoint = Vector2.new(0, 1)
dutdit.Size = UDim2.new(0, 50, 0, 50)
dutdit.Position = UDim2.new(0, 0, 1, 0)
dutdit.Name = "dut dit"
dutdit.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
dutdit.BackgroundTransparency = 0.25
local ImageLabel = Instance.new("ImageLabel", TextButton)
ImageLabel.AnchorPoint = Vector2.new(0, 0)
ImageLabel.Image = "rbxassetid://5009915795"
ImageLabel.BackgroundTransparency = 1
ImageLabel.Size = UDim2.new(0, 30, 0, 30)
ImageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
ImageLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
local UICorner = Instance.new("UICorner")
UICorner.Parent = dutdit
UICorner.CornerRadius = UDim.new(1, 0)

TextButton.InputBegan:Connect(function(input, gameProcessed)
end)

TextButton.InputEnded:Connect(function(input2, gameProcessed2)
end)

TextButton.InputChanged:Connect(function(input3, gameProcessed3)
end)

RunService.RenderStepped:Connect(function(deltaTime)
end)

TextButton.MouseButton1Click:Connect(function()
	getgenv().UIToggled = true
	local tween3 = TweenService:Create(ImageLabel, TweenInfo.new(0), { Size = UDim2.new(0, 40, 0, 40) })
	tween3:Play()
	local tween4 = TweenService:Create(dutdit, TweenInfo.new(0), { BackgroundTransparency = 0 })
	tween4:Play()
	game.CoreGui:FindFirstChild("Nousigi Hub GUI")
	local children = game.CoreGui:GetChildren()

	for i, v in ipairs(children) do
	end
end)

local NotiContainer = Instance.new("Frame")
local NotiList = Instance.new("UIListLayout")
NotiContainer.Name = "NotiContainer"
NotiContainer.Parent = NousigiHubNotification
NotiContainer.AnchorPoint = Vector2.new(1, 1)
NotiContainer.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
NotiContainer.BackgroundTransparency = 1
NotiContainer.Position = UDim2.new(1, -5, 1, -5)
NotiContainer.Size = UDim2.new(0, 350, 1, -10)
NotiList.Name = "NotiList"
NotiList.Parent = NotiContainer
NotiList.SortOrder = Enum.SortOrder.LayoutOrder
NotiList.VerticalAlignment = Enum.VerticalAlignment.Bottom
NotiList.Padding = UDim.new(0, 5)
local CoreGui = game:GetService("CoreGui")
NousigiHubGUI.Parent = CoreGui
NousigiHubNotification.Parent = CoreGui
NousigiHubBtn.Parent = CoreGui
getgenv().TitleNameNoti = "UI Library"
local NotiFrame = Instance.new("Frame")
local Noticontainer = Instance.new("Frame")
local UICorner2 = Instance.new("UICorner")
local Topnoti = Instance.new("Frame")
local Ruafimg = Instance.new("ImageLabel")
local RuafimgCorner = Instance.new("UICorner")
local TextLabelNoti = Instance.new("TextLabel")
local CloseContainer = Instance.new("Frame")
local CloseImage = Instance.new("ImageLabel")
local TextButton2 = Instance.new("TextButton")
local TextColor = Instance.new("TextLabel")
NotiFrame.Name = "NotiFrame"
NotiFrame.Parent = NotiContainer
NotiFrame.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
NotiFrame.BackgroundTransparency = 1
NotiFrame.ClipsDescendants = true
NotiFrame.Position = UDim2.new(0, 0, 0, 0)
NotiFrame.Size = UDim2.new(1, 0, 0, 0)
NotiFrame.AutomaticSize = Enum.AutomaticSize.Y
Noticontainer.Name = "Noticontainer"
Noticontainer.Parent = NotiFrame
Noticontainer.Position = UDim2.new(1, 0, 0, 0)
Noticontainer.Size = UDim2.new(1, 0, 1, 6)
Noticontainer.AutomaticSize = Enum.AutomaticSize.Y
Noticontainer.BackgroundColor3 = Color3.fromRGB(48, 48, 56)
UICorner2.CornerRadius = UDim.new(0, 4)
UICorner2.Parent = Noticontainer
Topnoti.Name = "Topnoti"
Topnoti.Parent = Noticontainer
Topnoti.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
Topnoti.BackgroundTransparency = 1
Topnoti.Position = UDim2.new(0, 0, 0, 5)
Topnoti.Size = UDim2.new(1, 0, 0, 25)
Ruafimg.Name = "Ruafimg"
Ruafimg.Parent = Topnoti
Ruafimg.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
Ruafimg.BackgroundTransparency = 1
Ruafimg.Position = UDim2.new(0, 5, 0, 0)
Ruafimg.Size = UDim2.new(0, 25, 0, 25)
Ruafimg.Image = "rbxassetid://5009915795"
RuafimgCorner.CornerRadius = UDim.new(1, 0)
RuafimgCorner.Name = "RuafimgCorner"
RuafimgCorner.Parent = Ruafimg
TextLabelNoti.Text = "<font color=\"rgb(255,214,94)\">Banana Cat Hub</font> UI Library"
TextLabelNoti.Name = "TextLabelNoti"
TextLabelNoti.Parent = Topnoti
TextLabelNoti.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
TextLabelNoti.BackgroundTransparency = 1
TextLabelNoti.Position = UDim2.new(0, 35, 0, 0)
TextLabelNoti.Size = UDim2.new(1, -35, 1, 0)
TextLabelNoti.Font = Enum.Font.GothamBold
TextLabelNoti.TextSize = 14
TextLabelNoti.TextWrapped = true
TextLabelNoti.TextXAlignment = Enum.TextXAlignment.Left
TextLabelNoti.RichText = true
TextLabelNoti.TextColor3 = Color3.fromRGB(235, 235, 230)
CloseContainer.Name = "CloseContainer"
CloseContainer.Parent = Topnoti
CloseContainer.AnchorPoint = Vector2.new(1, 0.5)
CloseContainer.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
CloseContainer.BackgroundTransparency = 1
CloseContainer.Position = UDim2.new(1, -4, 0.5, 0)
CloseContainer.Size = UDim2.new(0, 22, 0, 22)
CloseImage.Name = "CloseImage"
CloseImage.Parent = CloseContainer
CloseImage.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
CloseImage.BackgroundTransparency = 1
CloseImage.Size = UDim2.new(1, 0, 1, 0)
CloseImage.Image = "rbxassetid://3926305904"
CloseImage.ImageRectOffset = Vector2.new(284, 4)
CloseImage.ImageRectSize = Vector2.new(24, 24)
CloseImage.ImageColor3 = Color3.fromRGB(240, 240, 230)
TextButton2.Parent = CloseContainer
TextButton2.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
TextButton2.BackgroundTransparency = 1
TextButton2.Size = UDim2.new(1, 0, 1, 0)
TextButton2.Font = Enum.Font.SourceSans
TextButton2.Text = ""
TextButton2.TextColor3 = Color3.fromRGB(0, 0, 0)
TextButton2.TextSize = 14
TextColor.Name = "TextColor"
TextColor.Parent = Noticontainer
TextColor.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
TextColor.BackgroundTransparency = 1
TextColor.Position = UDim2.new(0, 10, 0, 35)
TextColor.Size = UDim2.new(1, -15, 0, 0)
TextColor.Font = Enum.Font.GothamBold
TextColor.Text = "The UI automatically hides once executed.\nPress the button at the bottom-left of the screen to show the GUI."
TextColor.TextSize = 14
TextColor.TextXAlignment = Enum.TextXAlignment.Left
TextColor.RichText = true
TextColor.TextColor3 = Color3.fromRGB(235, 235, 230)
TextColor.AutomaticSize = Enum.AutomaticSize.Y
TextColor.TextWrapped = true
local tween = TweenService:Create(Noticontainer, TweenInfo.new(0), { Position = UDim2.new(0, 0, 0, 0) })
tween:Play()

TextButton2.MouseEnter:Connect(function()
	local tween5 = TweenService:Create(CloseImage, TweenInfo.new(0), { ImageColor3 = Color3.fromRGB(255, 214, 94) })
	tween5:Play()
end)

TextButton2.MouseLeave:Connect(function()
	local tween6 = TweenService:Create(CloseImage, TweenInfo.new(0), { ImageColor3 = Color3.fromRGB(240, 240, 230) })
	tween6:Play()
end)

TextButton2.MouseButton1Click:Connect(function()
	wait(0.25)
	local tween7 = TweenService:Create(Noticontainer, TweenInfo.new(0), { Position = UDim2.new(1, 0, 0, 0) })
	tween7:Play()
	wait(0.25)
	NotiFrame:Destroy()
end)

spawn(function()
	wait(10)
	local tween2 = TweenService:Create(Noticontainer, TweenInfo.new(0), { Position = UDim2.new(1, 0, 0, 0) })
	tween2:Play()
	wait(0.25)
	NotiFrame:Destroy()
end)
