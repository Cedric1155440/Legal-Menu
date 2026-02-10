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
local Tab3Button = Instance.new("TextButton")
local ContentFrame = Instance.new("Frame")
local CloseButton = Instance.new("TextButton")
local ToggleButton = Instance.new("TextButton")
local UnloadButton = Instance.new("TextButton")

-- Tab 1 Content (General Hacks)
local GeneralContent = Instance.new("Frame")
local SpeedSection = Instance.new("Frame")
local SpeedLabel = Instance.new("TextLabel")
local SpeedSlider = Instance.new("TextBox")
local SpeedButton = Instance.new("TextButton")
local TeleportSection = Instance.new("Frame")
local TeleportLabel = Instance.new("TextLabel")
local PlayerList = Instance.new("ScrollingFrame")

-- Tab 2 Content (First Person Hacks)
local FirstPersonContent = Instance.new("Frame")
local AimbotSection = Instance.new("Frame")
local AimbotLabel = Instance.new("TextLabel")
local AimbotToggle = Instance.new("TextButton")

-- Tab 3 Content (Movement Hacks)
local MovementContent = Instance.new("Frame")
local FlySection = Instance.new("Frame")
local FlyLabel = Instance.new("TextLabel")
local FlyToggle = Instance.new("TextButton")
local FlySpeedSlider = Instance.new("TextBox")
local NoclipSection = Instance.new("Frame")
local NoclipLabel = Instance.new("TextLabel")
local NoclipToggle = Instance.new("TextButton")
local AntiAFKSection = Instance.new("Frame")
local AntiAFKLabel = Instance.new("TextLabel")
local AntiAFKToggle = Instance.new("TextButton")
local AntiRagdollSection = Instance.new("Frame")
local AntiRagdollLabel = Instance.new("TextLabel")
local AntiRagdollToggle = Instance.new("TextButton")

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

-- Tab 3 Button (Movement Hacks)
Tab3Button.Name = "Tab3Button"
Tab3Button.Parent = TabContainer
Tab3Button.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
Tab3Button.BorderSizePixel = 0
Tab3Button.Position = UDim2.new(0, 10, 0, 130)
Tab3Button.Size = UDim2.new(1, -20, 0, 50)
Tab3Button.Font = Enum.Font.GothamBold
Tab3Button.Text = "Movement\nHacks"
Tab3Button.TextColor3 = Color3.fromRGB(255, 255, 255)
Tab3Button.TextSize = 13

local Tab3Corner = Instance.new("UICorner")
Tab3Corner.CornerRadius = UDim.new(0, 8)
Tab3Corner.Parent = Tab3Button

-- Unload Button (at bottom of sidebar)
UnloadButton.Name = "UnloadButton"
UnloadButton.Parent = TabContainer
UnloadButton.BackgroundColor3 = Color3.fromRGB(220, 50, 50)
UnloadButton.BorderSizePixel = 0
UnloadButton.Position = UDim2.new(0, 10, 1, -60)
UnloadButton.Size = UDim2.new(1, -20, 0, 50)
UnloadButton.Font = Enum.Font.GothamBold
UnloadButton.Text = "UNLOAD\nMENU"
UnloadButton.TextColor3 = Color3.fromRGB(255, 255, 255)
UnloadButton.TextSize = 13

local UnloadCorner = Instance.new("UICorner")
UnloadCorner.CornerRadius = UDim.new(0, 8)
UnloadCorner.Parent = UnloadButton

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
TeleportSection.Size = UDim2.new(1, 0, 1, -110)

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
AimbotLabel.Text = "🎯 AIMBOT (Team-Aware)"
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

-- MOVEMENT CONTENT (Tab 3)
MovementContent.Name = "MovementContent"
MovementContent.Parent = ContentFrame
MovementContent.BackgroundTransparency = 1
MovementContent.Size = UDim2.new(1, 0, 1, 0)
MovementContent.Visible = false

-- Fly Section
FlySection.Name = "FlySection"
FlySection.Parent = MovementContent
FlySection.BackgroundColor3 = Color3.fromRGB(45, 45, 55)
FlySection.BorderSizePixel = 0
FlySection.Position = UDim2.new(0, 0, 0, 0)
FlySection.Size = UDim2.new(1, 0, 0, 110)

local FlyCorner = Instance.new("UICorner")
FlyCorner.CornerRadius = UDim.new(0, 8)
FlyCorner.Parent = FlySection

FlyLabel.Name = "FlyLabel"
FlyLabel.Parent = FlySection
FlyLabel.BackgroundTransparency = 1
FlyLabel.Position = UDim2.new(0, 10, 0, 5)
FlyLabel.Size = UDim2.new(1, -20, 0, 25)
FlyLabel.Font = Enum.Font.GothamBold
FlyLabel.Text = "✈️ FLY MODE"
FlyLabel.TextColor3 = Color3.fromRGB(100, 200, 255)
FlyLabel.TextSize = 16
FlyLabel.TextXAlignment = Enum.TextXAlignment.Left

FlySpeedSlider.Name = "FlySpeedSlider"
FlySpeedSlider.Parent = FlySection
FlySpeedSlider.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
FlySpeedSlider.BorderSizePixel = 0
FlySpeedSlider.Position = UDim2.new(0, 10, 0, 35)
FlySpeedSlider.Size = UDim2.new(1, -20, 0, 30)
FlySpeedSlider.Font = Enum.Font.Gotham
FlySpeedSlider.PlaceholderText = "Fly Speed (50)"
FlySpeedSlider.Text = "50"
FlySpeedSlider.TextColor3 = Color3.fromRGB(255, 255, 255)
FlySpeedSlider.TextSize = 14

local FlySpeedCorner = Instance.new("UICorner")
FlySpeedCorner.CornerRadius = UDim.new(0, 5)
FlySpeedCorner.Parent = FlySpeedSlider

FlyToggle.Name = "FlyToggle"
FlyToggle.Parent = FlySection
FlyToggle.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
FlyToggle.BorderSizePixel = 0
FlyToggle.Position = UDim2.new(0, 10, 0, 75)
FlyToggle.Size = UDim2.new(1, -20, 0, 30)
FlyToggle.Font = Enum.Font.GothamBold
FlyToggle.Text = "❌ FLY OFF"
FlyToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
FlyToggle.TextSize = 14

local FlyButtonCorner = Instance.new("UICorner")
FlyButtonCorner.CornerRadius = UDim.new(0, 5)
FlyButtonCorner.Parent = FlyToggle

-- Noclip Section
NoclipSection.Name = "NoclipSection"
NoclipSection.Parent = MovementContent
NoclipSection.BackgroundColor3 = Color3.fromRGB(45, 45, 55)
NoclipSection.BorderSizePixel = 0
NoclipSection.Position = UDim2.new(0, 0, 0, 120)
NoclipSection.Size = UDim2.new(1, 0, 0, 80)

local NoclipCorner = Instance.new("UICorner")
NoclipCorner.CornerRadius = UDim.new(0, 8)
NoclipCorner.Parent = NoclipSection

NoclipLabel.Name = "NoclipLabel"
NoclipLabel.Parent = NoclipSection
NoclipLabel.BackgroundTransparency = 1
NoclipLabel.Position = UDim2.new(0, 10, 0, 5)
NoclipLabel.Size = UDim2.new(1, -20, 0, 25)
NoclipLabel.Font = Enum.Font.GothamBold
NoclipLabel.Text = "👻 NOCLIP (Walk Through Walls)"
NoclipLabel.TextColor3 = Color3.fromRGB(200, 150, 255)
NoclipLabel.TextSize = 16
NoclipLabel.TextXAlignment = Enum.TextXAlignment.Left

NoclipToggle.Name = "NoclipToggle"
NoclipToggle.Parent = NoclipSection
NoclipToggle.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
NoclipToggle.BorderSizePixel = 0
NoclipToggle.Position = UDim2.new(0, 10, 0, 40)
NoclipToggle.Size = UDim2.new(1, -20, 0, 30)
NoclipToggle.Font = Enum.Font.GothamBold
NoclipToggle.Text = "❌ NOCLIP OFF"
NoclipToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
NoclipToggle.TextSize = 14

local NoclipButtonCorner = Instance.new("UICorner")
NoclipButtonCorner.CornerRadius = UDim.new(0, 5)
NoclipButtonCorner.Parent = NoclipToggle

-- Anti-AFK Section
AntiAFKSection.Name = "AntiAFKSection"
AntiAFKSection.Parent = MovementContent
AntiAFKSection.BackgroundColor3 = Color3.fromRGB(45, 45, 55)
AntiAFKSection.BorderSizePixel = 0
AntiAFKSection.Position = UDim2.new(0, 0, 0, 210)
AntiAFKSection.Size = UDim2.new(1, 0, 0, 80)

local AntiAFKCorner = Instance.new("UICorner")
AntiAFKCorner.CornerRadius = UDim.new(0, 8)
AntiAFKCorner.Parent = AntiAFKSection

AntiAFKLabel.Name = "AntiAFKLabel"
AntiAFKLabel.Parent = AntiAFKSection
AntiAFKLabel.BackgroundTransparency = 1
AntiAFKLabel.Position = UDim2.new(0, 10, 0, 5)
AntiAFKLabel.Size = UDim2.new(1, -20, 0, 25)
AntiAFKLabel.Font = Enum.Font.GothamBold
AntiAFKLabel.Text = "⏰ ANTI-AFK"
AntiAFKLabel.TextColor3 = Color3.fromRGB(255, 200, 100)
AntiAFKLabel.TextSize = 16
AntiAFKLabel.TextXAlignment = Enum.TextXAlignment.Left

AntiAFKToggle.Name = "AntiAFKToggle"
AntiAFKToggle.Parent = AntiAFKSection
AntiAFKToggle.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
AntiAFKToggle.BorderSizePixel = 0
AntiAFKToggle.Position = UDim2.new(0, 10, 0, 40)
AntiAFKToggle.Size = UDim2.new(1, -20, 0, 30)
AntiAFKToggle.Font = Enum.Font.GothamBold
AntiAFKToggle.Text = "❌ ANTI-AFK OFF"
AntiAFKToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
AntiAFKToggle.TextSize = 14

local AntiAFKButtonCorner = Instance.new("UICorner")
AntiAFKButtonCorner.CornerRadius = UDim.new(0, 5)
AntiAFKButtonCorner.Parent = AntiAFKToggle

-- Anti-Ragdoll Section
AntiRagdollSection.Name = "AntiRagdollSection"
AntiRagdollSection.Parent = MovementContent
AntiRagdollSection.BackgroundColor3 = Color3.fromRGB(45, 45, 55)
AntiRagdollSection.BorderSizePixel = 0
AntiRagdollSection.Position = UDim2.new(0, 0, 0, 300)
AntiRagdollSection.Size = UDim2.new(1, 0, 0, 80)

local AntiRagdollCorner = Instance.new("UICorner")
AntiRagdollCorner.CornerRadius = UDim.new(0, 8)
AntiRagdollCorner.Parent = AntiRagdollSection

AntiRagdollLabel.Name = "AntiRagdollLabel"
AntiRagdollLabel.Parent = AntiRagdollSection
AntiRagdollLabel.BackgroundTransparency = 1
AntiRagdollLabel.Position = UDim2.new(0, 10, 0, 5)
AntiRagdollLabel.Size = UDim2.new(1, -20, 0, 25)
AntiRagdollLabel.Font = Enum.Font.GothamBold
AntiRagdollLabel.Text = "🚫 ANTI-RAGDOLL"
AntiRagdollLabel.TextColor3 = Color3.fromRGB(255, 150, 150)
AntiRagdollLabel.TextSize = 16
AntiRagdollLabel.TextXAlignment = Enum.TextXAlignment.Left

AntiRagdollToggle.Name = "AntiRagdollToggle"
AntiRagdollToggle.Parent = AntiRagdollSection
AntiRagdollToggle.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
AntiRagdollToggle.BorderSizePixel = 0
AntiRagdollToggle.Position = UDim2.new(0, 10, 0, 40)
AntiRagdollToggle.Size = UDim2.new(1, -20, 0, 30)
AntiRagdollToggle.Font = Enum.Font.GothamBold
AntiRagdollToggle.Text = "❌ ANTI-RAGDOLL OFF"
AntiRagdollToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
AntiRagdollToggle.TextSize = 14

local AntiRagdollButtonCorner = Instance.new("UICorner")
AntiRagdollButtonCorner.CornerRadius = UDim.new(0, 5)
AntiRagdollButtonCorner.Parent = AntiRagdollToggle

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
		MovementContent.Visible = false
		Tab1Button.BackgroundColor3 = Color3.fromRGB(70, 180, 70)
		Tab2Button.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
		Tab3Button.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
	elseif tabNumber == 2 then
		-- Show First Person Hacks
		GeneralContent.Visible = false
		FirstPersonContent.Visible = true
		MovementContent.Visible = false
		Tab1Button.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
		Tab2Button.BackgroundColor3 = Color3.fromRGB(70, 180, 70)
		Tab3Button.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
	elseif tabNumber == 3 then
		-- Show Movement Hacks
		GeneralContent.Visible = false
		FirstPersonContent.Visible = false
		MovementContent.Visible = true
		Tab1Button.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
		Tab2Button.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
		Tab3Button.BackgroundColor3 = Color3.fromRGB(70, 180, 70)
	end
end

Tab1Button.MouseButton1Click:Connect(function()
	switchTab(1)
end)

Tab2Button.MouseButton1Click:Connect(function()
	switchTab(2)
end)

Tab3Button.MouseButton1Click:Connect(function()
	switchTab(3)
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
			
			-- Teleport Function (Game-wide teleport with chunk loading)
			PlayerButton.MouseButton1Click:Connect(function()
				local targetPlayer = player
				if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
					if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
						local char = LocalPlayer.Character
						local hrp = char.HumanoidRootPart
						local humanoid = char:FindFirstChildOfClass("Humanoid")
						local targetRoot = targetPlayer.Character.HumanoidRootPart
						local targetPos = targetRoot.CFrame
						
						-- Calculate distance
						local distance = (hrp.Position - targetRoot.Position).Magnitude
						
						-- Stand next to them with offset
						local offset = CFrame.new(3, 0, 3)
						local finalPos = targetPos * offset
						
						-- Disable character physics temporarily
						if humanoid then
							humanoid.PlatformStand = true
						end
						
						-- Remove all body movers
						for _, obj in pairs(hrp:GetChildren()) do
							if obj:IsA("BodyMover") then
								obj:Destroy()
							end
						end
						
						-- Reset velocity completely
						hrp.Velocity = Vector3.new(0, 0, 0)
						hrp.RotVelocity = Vector3.new(0, 0, 0)
						hrp.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
						hrp.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
						
						-- Direct teleport
						hrp.CFrame = finalPos
						
						-- For long distances, use multiple teleports to ensure chunk loading
						if distance > 500 then
							-- Teleport in steps for chunk loading
							task.wait(0.05)
							hrp.CFrame = finalPos
							task.wait(0.05)
							hrp.CFrame = finalPos
						end
						
						-- Re-enable physics after short delay
						task.wait(0.15)
						if humanoid then
							humanoid.PlatformStand = false
							humanoid:ChangeState(Enum.HumanoidStateType.Landed)
						end
						
						-- Final position confirmation
						task.wait(0.05)
						hrp.CFrame = finalPos
						
						PlayerButton.BackgroundColor3 = Color3.fromRGB(70, 180, 70)
						task.wait(0.2)
						PlayerButton.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
					end
				end
			end)
			
			yOffset = yOffset + 35
		end
	end
	
	PlayerList.CanvasSize = UDim2.new(0, 0, 0, yOffset)
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
Players.PlayerAdded:Connect(updatePlayerList)
Players.PlayerRemoving:Connect(updatePlayerList)

-- Auto-Update every 3 seconds
spawn(function()
	while wait(3) do
		updatePlayerList()
	end
end)

-- FLY SYSTEM
local flyEnabled = false
local flySpeed = 50
local flyControl = {f = 0, b = 0, l = 0, r = 0}
local flyConnection = nil
local flyBV = nil
local flyBG = nil

FlyToggle.MouseButton1Click:Connect(function()
	flyEnabled = not flyEnabled
	flySpeed = tonumber(FlySpeedSlider.Text) or 50
	
	if flyEnabled then
		FlyToggle.Text = "✓ FLY ON"
		FlyToggle.BackgroundColor3 = Color3.fromRGB(70, 180, 70)
		
		local char = LocalPlayer.Character
		if char and char:FindFirstChild("HumanoidRootPart") then
			local hrp = char.HumanoidRootPart
			
			-- Create BodyVelocity
			flyBV = Instance.new("BodyVelocity")
			flyBV.Velocity = Vector3.new(0, 0, 0)
			flyBV.MaxForce = Vector3.new(9e4, 9e4, 9e4)
			flyBV.Parent = hrp
			
			-- Create BodyGyro
			flyBG = Instance.new("BodyGyro")
			flyBG.MaxTorque = Vector3.new(9e4, 9e4, 9e4)
			flyBG.CFrame = hrp.CFrame
			flyBG.Parent = hrp
			
			-- Fly loop
			flyConnection = RunService.RenderStepped:Connect(function()
				if not flyEnabled then return end
				
				local cam = workspace.CurrentCamera
				local speed = flySpeed
				
				-- Calculate movement
				local moveVector = Vector3.new(
					flyControl.r - flyControl.l,
					0,
					flyControl.f - flyControl.b
				)
				
				if moveVector:Dot(moveVector) > 0 then
					moveVector = moveVector.Unit
				end
				
				flyBV.Velocity = (
					cam.CFrame.LookVector * moveVector.Z +
					cam.CFrame.RightVector * moveVector.X
				) * speed
				
				flyBG.CFrame = cam.CFrame
			end)
		end
	else
		FlyToggle.Text = "❌ FLY OFF"
		FlyToggle.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
		
		-- Disable fly
		if flyConnection then
			flyConnection:Disconnect()
			flyConnection = nil
		end
		if flyBV then flyBV:Destroy() end
		if flyBG then flyBG:Destroy() end
	end
end)

-- Fly controls
UserInputService.InputBegan:Connect(function(input, gameProcessed)
	if gameProcessed then return end
	
	if not flyEnabled then return end
	
	if input.KeyCode == Enum.KeyCode.W then
		flyControl.f = 1
	elseif input.KeyCode == Enum.KeyCode.S then
		flyControl.b = 1
	elseif input.KeyCode == Enum.KeyCode.A then
		flyControl.l = 1
	elseif input.KeyCode == Enum.KeyCode.D then
		flyControl.r = 1
	elseif input.KeyCode == Enum.KeyCode.Space then
		-- Up
		if flyBV then
			flyBV.Velocity = flyBV.Velocity + Vector3.new(0, flySpeed, 0)
		end
	elseif input.KeyCode == Enum.KeyCode.LeftShift then
		-- Down
		if flyBV then
			flyBV.Velocity = flyBV.Velocity + Vector3.new(0, -flySpeed, 0)
		end
	end
end)

UserInputService.InputEnded:Connect(function(input)
	if input.KeyCode == Enum.KeyCode.W then
		flyControl.f = 0
	elseif input.KeyCode == Enum.KeyCode.S then
		flyControl.b = 0
	elseif input.KeyCode == Enum.KeyCode.A then
		flyControl.l = 0
	elseif input.KeyCode == Enum.KeyCode.D then
		flyControl.r = 0
	end
end)

-- NOCLIP SYSTEM
local noclipEnabled = false
local noclipConnection = nil

NoclipToggle.MouseButton1Click:Connect(function()
	noclipEnabled = not noclipEnabled
	
	if noclipEnabled then
		NoclipToggle.Text = "✓ NOCLIP ON"
		NoclipToggle.BackgroundColor3 = Color3.fromRGB(70, 180, 70)
		
		noclipConnection = RunService.Stepped:Connect(function()
			if not noclipEnabled then return end
			
			local char = LocalPlayer.Character
			if char then
				for _, part in pairs(char:GetDescendants()) do
					if part:IsA("BasePart") then
						part.CanCollide = false
					end
				end
			end
		end)
	else
		NoclipToggle.Text = "❌ NOCLIP OFF"
		NoclipToggle.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
		
		if noclipConnection then
			noclipConnection:Disconnect()
			noclipConnection = nil
		end
		
		-- Re-enable collisions
		local char = LocalPlayer.Character
		if char then
			for _, part in pairs(char:GetDescendants()) do
				if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
					part.CanCollide = true
				end
			end
		end
	end
end)

-- ANTI-AFK SYSTEM
local antiAFKEnabled = false
local antiAFKConnection = nil

AntiAFKToggle.MouseButton1Click:Connect(function()
	antiAFKEnabled = not antiAFKEnabled
	
	if antiAFKEnabled then
		AntiAFKToggle.Text = "✓ ANTI-AFK ON"
		AntiAFKToggle.BackgroundColor3 = Color3.fromRGB(70, 180, 70)
		
		-- Bypass Roblox's Idle tracker
		local VirtualUser = game:GetService("VirtualUser")
		antiAFKConnection = LocalPlayer.Idled:Connect(function()
			VirtualUser:CaptureController()
			VirtualUser:ClickButton2(Vector2.new())
		end)
	else
		AntiAFKToggle.Text = "❌ ANTI-AFK OFF"
		AntiAFKToggle.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
		
		if antiAFKConnection then
			antiAFKConnection:Disconnect()
			antiAFKConnection = nil
		end
	end
end)

-- ANTI-RAGDOLL SYSTEM
local antiRagdollEnabled = false
local antiRagdollConnection = nil

AntiRagdollToggle.MouseButton1Click:Connect(function()
	antiRagdollEnabled = not antiRagdollEnabled
	
	if antiRagdollEnabled then
		AntiRagdollToggle.Text = "✓ ANTI-RAGDOLL ON"
		AntiRagdollToggle.BackgroundColor3 = Color3.fromRGB(70, 180, 70)
		
		antiRagdollConnection = RunService.Stepped:Connect(function()
			if not antiRagdollEnabled then return end
			
			local char = LocalPlayer.Character
			if char then
				local humanoid = char:FindFirstChildOfClass("Humanoid")
				
				-- Prevent ragdoll states
				if humanoid then
					-- Keep humanoid in normal states
					if humanoid:GetState() == Enum.HumanoidStateType.FallingDown or
					   humanoid:GetState() == Enum.HumanoidStateType.Ragdoll or
					   humanoid:GetState() == Enum.HumanoidStateType.Physics then
						humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
					end
					
					-- Disable platform stand
					if humanoid.PlatformStand then
						humanoid.PlatformStand = false
					end
				end
				
				-- Remove/prevent ragdoll joints
				for _, obj in pairs(char:GetDescendants()) do
					if obj:IsA("Motor6D") then
						obj.Enabled = true
					elseif obj:IsA("BallSocketConstraint") or obj:IsA("NoCollisionConstraint") then
						-- Remove ragdoll constraints
						obj:Destroy()
					end
				end
				
				-- Keep body parts properly attached
				for _, part in pairs(char:GetDescendants()) do
					if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
						part.Massless = false
					end
				end
			end
		end)
	else
		AntiRagdollToggle.Text = "❌ ANTI-RAGDOLL OFF"
		AntiRagdollToggle.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
		
		if antiRagdollConnection then
			antiRagdollConnection:Disconnect()
			antiRagdollConnection = nil
		end
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
	
	local closestEnemy = nil
	local closestDistance = math.huge
	
	-- Find closest enemy player
	for _, player in pairs(Players:GetPlayers()) do
		if player ~= LocalPlayer and player.Character then
			local targetRoot = player.Character:FindFirstChild("HumanoidRootPart")
			local targetHead = player.Character:FindFirstChild("Head")
			local targetHumanoid = player.Character:FindFirstChild("Humanoid")
			
			-- Skip dead players
			if not targetHumanoid or targetHumanoid.Health <= 0 then
				continue
			end
			
			if not targetRoot or not targetHead then
				continue
			end
			
			-- Default: Target everyone UNLESS they're on same team
			local shouldTarget = true
			
			-- Only check teams if both players have teams
			if player.Team ~= nil and LocalPlayer.Team ~= nil then
				-- Both have teams - check if same
				if player.Team == LocalPlayer.Team then
					shouldTarget = false -- Same team, don't target
				end
			end
			
			-- Double check with TeamColor if available
			if shouldTarget and player.TeamColor ~= nil and LocalPlayer.TeamColor ~= nil then
				if player.TeamColor == LocalPlayer.TeamColor then
					shouldTarget = false -- Same team color, don't target
				end
			end
			
			-- Target this player
			if shouldTarget then
				local distance = (humanoidRootPart.Position - targetRoot.Position).Magnitude
				
				if distance < closestDistance then
					closestDistance = distance
					closestEnemy = player
				end
			end
		end
	end
	
	-- Aim at closest enemy
	if closestEnemy and closestEnemy.Character then
		local targetHead = closestEnemy.Character:FindFirstChild("Head")
		if targetHead then
			Camera.CFrame = CFrame.new(Camera.CFrame.Position, targetHead.Position)
		end
	end
end)

-- Unload Button Function
UnloadButton.MouseButton1Click:Connect(function()
	-- Disable all active features
	flyEnabled = false
	noclipEnabled = false
	antiAFKEnabled = false
	antiRagdollEnabled = false
	aimbotEnabled = false
	
	-- Disconnect all connections
	if flyConnection then flyConnection:Disconnect() end
	if flyBV then flyBV:Destroy() end
	if flyBG then flyBG:Destroy() end
	if noclipConnection then noclipConnection:Disconnect() end
	if antiAFKConnection then antiAFKConnection:Disconnect() end
	if antiRagdollConnection then antiRagdollConnection:Disconnect() end
	
	-- Re-enable collisions if noclip was on
	local char = LocalPlayer.Character
	if char then
		for _, part in pairs(char:GetDescendants()) do
			if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
				part.CanCollide = true
			end
		end
	end
	
	-- Destroy the GUI
	ScreenGui:Destroy()
	
	print("Legal Menu unloaded successfully!")
end)

print("Legal Menu loaded! Press F3 to open/close")
