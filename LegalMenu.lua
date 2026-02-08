-- Roblox Legal Menu Script
-- Features: Speed Hack & Player Teleport & Aimbot with Tab System

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local UserInputService = game:GetService("UserInputService")

-- GUI Creation
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local TabContainer = Instance.new("Frame")
local Tab1Button = Instance.new("TextButton")
local Tab2Button = Instance.new("TextButton")
local ContentFrame = Instance.new("Frame")
local CloseButton = Instance.new("TextButton")
local ToggleButton = Instance.new("TextButton")

-- Tab 1 Content (General Hacks)
local GeneralContent = Instance.new("Frame")
local SpeedSection = Instance.new("Frame")
local SpeedLabel = Instance.new("TextLabel")
local SpeedSlider = Instance.new("TextBox")
local SpeedButton = Instance.new("TextButton")
local TeleportSection = Instance.new("Frame")
local TeleportLabel = Instance.new("TextLabel")
local PlayerList = Instance.new("ScrollingFrame")
local BringSection = Instance.new("Frame")
local BringLabel = Instance.new("TextLabel")
local BringPlayerList = Instance.new("ScrollingFrame")

-- Tab 2 Content (First Person Hacks)
local FirstPersonContent = Instance.new("Frame")
local AimbotSection = Instance.new("Frame")
local AimbotLabel = Instance.new("TextLabel")
local AimbotToggle = Instance.new("TextButton")

-- GUI Properties
ScreenGui.Name = "LegalMenuGui"
ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = false

-- Main Frame
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0.5, -250, 0.5, -225)
MainFrame.Size = UDim2.new(0, 500, 0, 450)
MainFrame.Active = true
MainFrame.Draggable = true

-- Rounded Corners
local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 10)
UICorner.Parent = MainFrame

-- Title
Title.Name = "Title"
Title.Parent = MainFrame
Title.BackgroundColor3 = Color3.fromRGB(50, 50, 65)
Title.BorderSizePixel = 0
Title.Size = UDim2.new(1, 0, 0, 50)
Title.Font = Enum.Font.GothamBold
Title.Text = "🎮 LEGAL MENU"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 24

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 10)
TitleCorner.Parent = Title

-- Close Button
CloseButton.Name = "CloseButton"
CloseButton.Parent = MainFrame
CloseButton.BackgroundColor3 = Color3.fromRGB(220, 50, 50)
CloseButton.BorderSizePixel = 0
CloseButton.Position = UDim2.new(1, -40, 0, 10)
CloseButton.Size = UDim2.new(0, 30, 0, 30)
CloseButton.Font = Enum.Font.GothamBold
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.TextSize = 18

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 5)
CloseCorner.Parent = CloseButton

-- Tab Container
TabContainer.Name = "TabContainer"
TabContainer.Parent = MainFrame
TabContainer.BackgroundTransparency = 1
TabContainer.Position = UDim2.new(0, 0, 0, 60)
TabContainer.Size = UDim2.new(0, 120, 1, -60)

-- Tab 1 Button (General Hacks)
Tab1Button.Name = "Tab1Button"
Tab1Button.Parent = TabContainer
Tab1Button.BackgroundColor3 = Color3.fromRGB(70, 180, 70)
Tab1Button.BorderSizePixel = 0
Tab1Button.Position = UDim2.new(0, 10, 0, 10)
Tab1Button.Size = UDim2.new(1, -20, 0, 50)
Tab1Button.Font = Enum.Font.GothamBold
Tab1Button.Text = "General\nHacks"
Tab1Button.TextColor3 = Color3.fromRGB(255, 255, 255)
Tab1Button.TextSize = 13

local Tab1Corner = Instance.new("UICorner")
Tab1Corner.CornerRadius = UDim.new(0, 8)
Tab1Corner.Parent = Tab1Button

-- Tab 2 Button (First Person Hacks)
Tab2Button.Name = "Tab2Button"
Tab2Button.Parent = TabContainer
Tab2Button.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
Tab2Button.BorderSizePixel = 0
Tab2Button.Position = UDim2.new(0, 10, 0, 70)
Tab2Button.Size = UDim2.new(1, -20, 0, 50)
Tab2Button.Font = Enum.Font.GothamBold
Tab2Button.Text = "First Person\nHacks"
Tab2Button.TextColor3 = Color3.fromRGB(255, 255, 255)
Tab2Button.TextSize = 13

local Tab2Corner = Instance.new("UICorner")
Tab2Corner.CornerRadius = UDim.new(0, 8)
Tab2Corner.Parent = Tab2Button

-- Content Frame
ContentFrame.Name = "ContentFrame"
ContentFrame.Parent = MainFrame
ContentFrame.BackgroundTransparency = 1
ContentFrame.Position = UDim2.new(0, 130, 0, 60)
ContentFrame.Size = UDim2.new(1, -140, 1, -70)

-- GENERAL CONTENT (Tab 1)
GeneralContent.Name = "GeneralContent"
GeneralContent.Parent = ContentFrame
GeneralContent.BackgroundTransparency = 1
GeneralContent.Size = UDim2.new(1, 0, 1, 0)
GeneralContent.Visible = true

-- Speed Section
SpeedSection.Name = "SpeedSection"
SpeedSection.Parent = GeneralContent
SpeedSection.BackgroundColor3 = Color3.fromRGB(45, 45, 55)
SpeedSection.BorderSizePixel = 0
SpeedSection.Position = UDim2.new(0, 0, 0, 0)
SpeedSection.Size = UDim2.new(1, 0, 0, 100)

local SpeedCorner = Instance.new("UICorner")
SpeedCorner.CornerRadius = UDim.new(0, 8)
SpeedCorner.Parent = SpeedSection

SpeedLabel.Name = "SpeedLabel"
SpeedLabel.Parent = SpeedSection
SpeedLabel.BackgroundTransparency = 1
SpeedLabel.Position = UDim2.new(0, 10, 0, 5)
SpeedLabel.Size = UDim2.new(1, -20, 0, 25)
SpeedLabel.Font = Enum.Font.GothamBold
SpeedLabel.Text = "⚡ SPEED HACK"
SpeedLabel.TextColor3 = Color3.fromRGB(100, 200, 255)
SpeedLabel.TextSize = 16
SpeedLabel.TextXAlignment = Enum.TextXAlignment.Left

SpeedSlider.Name = "SpeedSlider"
SpeedSlider.Parent = SpeedSection
SpeedSlider.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
SpeedSlider.BorderSizePixel = 0
SpeedSlider.Position = UDim2.new(0, 10, 0, 35)
SpeedSlider.Size = UDim2.new(1, -20, 0, 30)
SpeedSlider.Font = Enum.Font.Gotham
SpeedSlider.PlaceholderText = "Speed (50)"
SpeedSlider.Text = "16"
SpeedSlider.TextColor3 = Color3.fromRGB(255, 255, 255)
SpeedSlider.TextSize = 14

local SliderCorner = Instance.new("UICorner")
SliderCorner.CornerRadius = UDim.new(0, 5)
SliderCorner.Parent = SpeedSlider

SpeedButton.Name = "SpeedButton"
SpeedButton.Parent = SpeedSection
SpeedButton.BackgroundColor3 = Color3.fromRGB(70, 180, 70)
SpeedButton.BorderSizePixel = 0
SpeedButton.Position = UDim2.new(0, 10, 0, 70)
SpeedButton.Size = UDim2.new(1, -20, 0, 25)
SpeedButton.Font = Enum.Font.GothamBold
SpeedButton.Text = "SET SPEED"
SpeedButton.TextColor3 = Color3.fromRGB(255, 255, 255)
SpeedButton.TextSize = 14

local ButtonCorner = Instance.new("UICorner")
ButtonCorner.CornerRadius = UDim.new(0, 5)
ButtonCorner.Parent = SpeedButton

-- Teleport Section
TeleportSection.Name = "TeleportSection"
TeleportSection.Parent = GeneralContent
TeleportSection.BackgroundColor3 = Color3.fromRGB(45, 45, 55)
TeleportSection.BorderSizePixel = 0
TeleportSection.Position = UDim2.new(0, 0, 0, 110)
TeleportSection.Size = UDim2.new(1, 0, 0, 130)

local TeleportCorner = Instance.new("UICorner")
TeleportCorner.CornerRadius = UDim.new(0, 8)
TeleportCorner.Parent = TeleportSection

TeleportLabel.Name = "TeleportLabel"
TeleportLabel.Parent = TeleportSection
TeleportLabel.BackgroundTransparency = 1
TeleportLabel.Position = UDim2.new(0, 10, 0, 5)
TeleportLabel.Size = UDim2.new(1, -20, 0, 25)
TeleportLabel.Font = Enum.Font.GothamBold
TeleportLabel.Text = "📍 TELEPORT TO PLAYERS"
TeleportLabel.TextColor3 = Color3.fromRGB(255, 150, 100)
TeleportLabel.TextSize = 16
TeleportLabel.TextXAlignment = Enum.TextXAlignment.Left

-- Player List ScrollingFrame
PlayerList.Name = "PlayerList"
PlayerList.Parent = TeleportSection
PlayerList.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
PlayerList.BorderSizePixel = 0
PlayerList.Position = UDim2.new(0, 10, 0, 35)
PlayerList.Size = UDim2.new(1, -20, 1, -45)
PlayerList.CanvasSize = UDim2.new(0, 0, 0, 0)
PlayerList.ScrollBarThickness = 6

local ListCorner = Instance.new("UICorner")
ListCorner.CornerRadius = UDim.new(0, 5)
ListCorner.Parent = PlayerList

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.Parent = PlayerList
UIListLayout.SortOrder = Enum.SortOrder.Name
UIListLayout.Padding = UDim.new(0, 5)

-- Bring Section
BringSection.Name = "BringSection"
BringSection.Parent = GeneralContent
BringSection.BackgroundColor3 = Color3.fromRGB(45, 45, 55)
BringSection.BorderSizePixel = 0
BringSection.Position = UDim2.new(0, 0, 0, 250)
BringSection.Size = UDim2.new(1, 0, 1, -250)

local BringCorner = Instance.new("UICorner")
BringCorner.CornerRadius = UDim.new(0, 8)
BringCorner.Parent = BringSection

BringLabel.Name = "BringLabel"
BringLabel.Parent = BringSection
BringLabel.BackgroundTransparency = 1
BringLabel.Position = UDim2.new(0, 10, 0, 5)
BringLabel.Size = UDim2.new(1, -20, 0, 25)
BringLabel.Font = Enum.Font.GothamBold
BringLabel.Text = "🔄 BRING PLAYERS TO YOU"
BringLabel.TextColor3 = Color3.fromRGB(150, 255, 150)
BringLabel.TextSize = 16
BringLabel.TextXAlignment = Enum.TextXAlignment.Left

-- Bring Player List ScrollingFrame
BringPlayerList.Name = "BringPlayerList"
BringPlayerList.Parent = BringSection
BringPlayerList.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
BringPlayerList.BorderSizePixel = 0
BringPlayerList.Position = UDim2.new(0, 10, 0, 35)
BringPlayerList.Size = UDim2.new(1, -20, 1, -45)
BringPlayerList.CanvasSize = UDim2.new(0, 0, 0, 0)
BringPlayerList.ScrollBarThickness = 6

local BringListCorner = Instance.new("UICorner")
BringListCorner.CornerRadius = UDim.new(0, 5)
BringListCorner.Parent = BringPlayerList

local BringUIListLayout = Instance.new("UIListLayout")
BringUIListLayout.Parent = BringPlayerList
BringUIListLayout.SortOrder = Enum.SortOrder.Name
BringUIListLayout.Padding = UDim.new(0, 5)

-- FIRST PERSON CONTENT (Tab 2)
FirstPersonContent.Name = "FirstPersonContent"
FirstPersonContent.Parent = ContentFrame
FirstPersonContent.BackgroundTransparency = 1
FirstPersonContent.Size = UDim2.new(1, 0, 1, 0)
FirstPersonContent.Visible = false

-- Aimbot Section
AimbotSection.Name = "AimbotSection"
AimbotSection.Parent = FirstPersonContent
AimbotSection.BackgroundColor3 = Color3.fromRGB(45, 45, 55)
AimbotSection.BorderSizePixel = 0
AimbotSection.Position = UDim2.new(0, 0, 0, 0)
AimbotSection.Size = UDim2.new(1, 0, 0, 80)

local AimbotCorner = Instance.new("UICorner")
AimbotCorner.CornerRadius = UDim.new(0, 8)
AimbotCorner.Parent = AimbotSection

AimbotLabel.Name = "AimbotLabel"
AimbotLabel.Parent = AimbotSection
AimbotLabel.BackgroundTransparency = 1
AimbotLabel.Position = UDim2.new(0, 10, 0, 5)
AimbotLabel.Size = UDim2.new(1, -20, 0, 25)
AimbotLabel.Font = Enum.Font.GothamBold
AimbotLabel.Text = "🎯 AIMBOT"
AimbotLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
AimbotLabel.TextSize = 16
AimbotLabel.TextXAlignment = Enum.TextXAlignment.Left

AimbotToggle.Name = "AimbotToggle"
AimbotToggle.Parent = AimbotSection
AimbotToggle.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
AimbotToggle.BorderSizePixel = 0
AimbotToggle.Position = UDim2.new(0, 10, 0, 40)
AimbotToggle.Size = UDim2.new(1, -20, 0, 30)
AimbotToggle.Font = Enum.Font.GothamBold
AimbotToggle.Text = "❌ AIMBOT OFF"
AimbotToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
AimbotToggle.TextSize = 14

local AimbotButtonCorner = Instance.new("UICorner")
AimbotButtonCorner.CornerRadius = UDim.new(0, 5)
AimbotButtonCorner.Parent = AimbotToggle

-- Toggle Button (um Menu zu öffnen/schließen)
ToggleButton.Name = "ToggleButton"
ToggleButton.Parent = ScreenGui
ToggleButton.BackgroundColor3 = Color3.fromRGB(50, 50, 65)
ToggleButton.BorderSizePixel = 0
ToggleButton.Position = UDim2.new(0, 10, 0, 10)
ToggleButton.Size = UDim2.new(0, 120, 0, 40)
ToggleButton.Font = Enum.Font.GothamBold
ToggleButton.Text = "MENU (F3)"
ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleButton.TextSize = 14

local ToggleCorner = Instance.new("UICorner")
ToggleCorner.CornerRadius = UDim.new(0, 8)
ToggleCorner.Parent = ToggleButton

-- Functions
local currentTab = 1

local function switchTab(tabNumber)
	currentTab = tabNumber
	
	if tabNumber == 1 then
		-- Show General Hacks
		GeneralContent.Visible = true
		FirstPersonContent.Visible = false
		Tab1Button.BackgroundColor3 = Color3.fromRGB(70, 180, 70)
		Tab2Button.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
	elseif tabNumber == 2 then
		-- Show First Person Hacks
		GeneralContent.Visible = false
		FirstPersonContent.Visible = true
		Tab1Button.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
		Tab2Button.BackgroundColor3 = Color3.fromRGB(70, 180, 70)
	end
end

Tab1Button.MouseButton1Click:Connect(function()
	switchTab(1)
end)

Tab2Button.MouseButton1Click:Connect(function()
	switchTab(2)
end)

local function updatePlayerList()
	-- Delete old entries
	for _, child in pairs(PlayerList:GetChildren()) do
		if child:IsA("TextButton") then
			child:Destroy()
		end
	end
	
	local yOffset = 0
	for _, player in pairs(Players:GetPlayers()) do
		if player ~= LocalPlayer then
			local PlayerButton = Instance.new("TextButton")
			PlayerButton.Name = player.Name
			PlayerButton.Parent = PlayerList
			PlayerButton.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
			PlayerButton.BorderSizePixel = 0
			PlayerButton.Size = UDim2.new(1, -10, 0, 30)
			PlayerButton.Font = Enum.Font.Gotham
			PlayerButton.Text = "➜ " .. player.Name
			PlayerButton.TextColor3 = Color3.fromRGB(255, 255, 255)
			PlayerButton.TextSize = 13
			PlayerButton.TextXAlignment = Enum.TextXAlignment.Left
			PlayerButton.TextTruncate = Enum.TextTruncate.AtEnd
			
			local PlayerCorner = Instance.new("UICorner")
			PlayerCorner.CornerRadius = UDim.new(0, 4)
			PlayerCorner.Parent = PlayerButton
			
			local UIPadding = Instance.new("UIPadding")
			UIPadding.PaddingLeft = UDim.new(0, 10)
			UIPadding.Parent = PlayerButton
			
			-- Teleport Function
			PlayerButton.MouseButton1Click:Connect(function()
				local targetPlayer = player
				if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
					if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
						LocalPlayer.Character.HumanoidRootPart.CFrame = targetPlayer.Character.HumanoidRootPart.CFrame
						PlayerButton.BackgroundColor3 = Color3.fromRGB(70, 180, 70)
						wait(0.2)
						PlayerButton.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
					end
				end
			end)
			
			yOffset = yOffset + 35
		end
	end
	
	PlayerList.CanvasSize = UDim2.new(0, 0, 0, yOffset)
end

local function updateBringList()
	-- Delete old entries
	for _, child in pairs(BringPlayerList:GetChildren()) do
		if child:IsA("TextButton") then
			child:Destroy()
		end
	end
	
	local yOffset = 0
	for _, player in pairs(Players:GetPlayers()) do
		if player ~= LocalPlayer then
			local BringButton = Instance.new("TextButton")
			BringButton.Name = player.Name
			BringButton.Parent = BringPlayerList
			BringButton.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
			BringButton.BorderSizePixel = 0
			BringButton.Size = UDim2.new(1, -10, 0, 30)
			BringButton.Font = Enum.Font.Gotham
			BringButton.Text = "⬅ " .. player.Name
			BringButton.TextColor3 = Color3.fromRGB(255, 255, 255)
			BringButton.TextSize = 13
			BringButton.TextXAlignment = Enum.TextXAlignment.Left
			BringButton.TextTruncate = Enum.TextTruncate.AtEnd
			
			local BringButtonCorner = Instance.new("UICorner")
			BringButtonCorner.CornerRadius = UDim.new(0, 4)
			BringButtonCorner.Parent = BringButton
			
			local BringUIPadding = Instance.new("UIPadding")
			BringUIPadding.PaddingLeft = UDim.new(0, 10)
			BringUIPadding.Parent = BringButton
			
			-- Bring Function
			BringButton.MouseButton1Click:Connect(function()
				local targetPlayer = player
				if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
					if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
						targetPlayer.Character.HumanoidRootPart.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame
						BringButton.BackgroundColor3 = Color3.fromRGB(70, 180, 70)
						wait(0.2)
						BringButton.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
					end
				end
			end)
			
			yOffset = yOffset + 35
		end
	end
	
	BringPlayerList.CanvasSize = UDim2.new(0, 0, 0, yOffset)
end

-- Speed Hack Function
SpeedButton.MouseButton1Click:Connect(function()
	local speedValue = tonumber(SpeedSlider.Text)
	if speedValue and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
		LocalPlayer.Character.Humanoid.WalkSpeed = speedValue
		SpeedButton.Text = "✓ SPEED: " .. speedValue
		SpeedButton.BackgroundColor3 = Color3.fromRGB(70, 180, 70)
		wait(1)
		SpeedButton.Text = "SET SPEED"
		SpeedButton.BackgroundColor3 = Color3.fromRGB(70, 180, 70)
	else
		SpeedButton.Text = "❌ INVALID"
		SpeedButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
		wait(1)
		SpeedButton.Text = "SET SPEED"
		SpeedButton.BackgroundColor3 = Color3.fromRGB(70, 180, 70)
	end
end)

-- Menu Toggle
local menuVisible = true
CloseButton.MouseButton1Click:Connect(function()
	menuVisible = false
	MainFrame.Visible = false
end)

ToggleButton.MouseButton1Click:Connect(function()
	menuVisible = not menuVisible
	MainFrame.Visible = menuVisible
end)

-- F3 Key Toggle
UserInputService.InputBegan:Connect(function(input, gameProcessed)
	if not gameProcessed and input.KeyCode == Enum.KeyCode.F3 then
		menuVisible = not menuVisible
		MainFrame.Visible = menuVisible
	end
end)

-- Update player list
updatePlayerList()
updateBringList()
Players.PlayerAdded:Connect(function()
	updatePlayerList()
	updateBringList()
end)
Players.PlayerRemoving:Connect(function()
	updatePlayerList()
	updateBringList()
end)

-- Auto-Update every 3 seconds
spawn(function()
	while wait(3) do
		updatePlayerList()
		updateBringList()
	end
end)

-- Aimbot System
local aimbotEnabled = false
local RunService = game:GetService("RunService")
local Camera = workspace.CurrentCamera

AimbotToggle.MouseButton1Click:Connect(function()
	aimbotEnabled = not aimbotEnabled
	if aimbotEnabled then
		AimbotToggle.Text = "✓ AIMBOT ON"
		AimbotToggle.BackgroundColor3 = Color3.fromRGB(70, 180, 70)
	else
		AimbotToggle.Text = "❌ AIMBOT OFF"
		AimbotToggle.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
	end
end)

-- Aimbot Loop
RunService.RenderStepped:Connect(function()
	if not aimbotEnabled then return end
	
	local character = LocalPlayer.Character
	if not character then return end
	
	local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
	if not humanoidRootPart then return end
	
	local closestPlayer = nil
	local closestDistance = math.huge
	
	-- Find closest player
	for _, player in pairs(Players:GetPlayers()) do
		if player ~= LocalPlayer and player.Character then
			local targetRoot = player.Character:FindFirstChild("HumanoidRootPart")
			local targetHead = player.Character:FindFirstChild("Head")
			
			if targetRoot and targetHead then
				local distance = (humanoidRootPart.Position - targetRoot.Position).Magnitude
				
				if distance < closestDistance then
					closestDistance = distance
					closestPlayer = player
				end
			end
		end
	end
	
	-- Look at closest player
	if closestPlayer and closestPlayer.Character then
		local targetHead = closestPlayer.Character:FindFirstChild("Head")
		if targetHead then
			Camera.CFrame = CFrame.new(Camera.CFrame.Position, targetHead.Position)
		end
	end
end)

print("Legal Menu loaded! Press F3 to open/close")
