local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

-- Referenzen zu GUI-Elementen
local mainGui = script.Parent
local NoclipButton = mainGui:WaitForChild("NoclipButton")
local FlyButton = mainGui:WaitForChild("FlyButton")
local AimbotButton = mainGui:WaitForChild("AimbotButton")
local UnloadButton = mainGui:WaitForChild("UnloadButton")
local FlySpeedBox = mainGui:WaitForChild("FlySpeedSlider")
local StatusLabel = mainGui:WaitForChild("StatusLabel")

-- Variablen
local noclipEnabled = false
local noclipConnection = nil

local flyEnabled = false
local flyConnection = nil
local flyBV = nil
local flyBG = nil
local flyControl = {f = 0, b = 0, l = 0, r = 0}
local flySpeed = 50

local aimbotEnabled = false

local connections = {}

-- Helper Funktion: Update Status Label
local function updateStatus(text)
    StatusLabel.Text = text
end

-- Unload Funktion
UnloadButton.MouseButton1Click:Connect(function()
    -- Hier kannst du alles deaktivieren, was du willst
    -- z.B. alle Verbindungen trennen, alles zurücksetzen
    for _, conn in pairs(connections) do
        if conn and conn.Connected then
            conn:Disconnect()
        end
    end
    -- Reset Variablen
    noclipEnabled = false
    flyEnabled = false
    aimbotEnabled = false
    -- GUI Status
    updateStatus("Unloaded and reset.")
    -- Optional: GUI schließen oder deaktivieren
end)

-- Noclip Toggle
NoclipButton.MouseButton1Click:Connect(function()
    noclipEnabled = not noclipEnabled
    if noclipEnabled then
        NoclipButton.Text = "Noclip ON"
        NoclipButton.BackgroundColor3 = Color3.fromRGB(70, 180, 70)
        local conn = RunService.Stepped:Connect(function()
            local char = LocalPlayer.Character
            if char then
                for _, part in pairs(char:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = false
                    end
                end
            end
        end)
        table.insert(connections, conn)
        updateStatus("Noclip enabled.")
    else
        NoclipButton.Text = "Noclip OFF"
        NoclipButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
        -- Kollisions wieder aktivieren
        local char = LocalPlayer.Character
        if char then
            for _, part in pairs(char:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = true
                end
            end
        end
        -- Alle Noclip-Connections entfernen
        for _, conn in pairs(connections) do
            if conn and conn.Connected then
                conn:Disconnect()
            end
        end
        table.clear(connections)
        updateStatus("Noclip disabled.")
    end
end)

-- Fly Toggle
FlyButton.MouseButton1Click:Connect(function()
    flyEnabled = not flyEnabled
    flySpeed = tonumber(FlySpeedBox.Text) or 50
    if flyEnabled then
        FlyButton.Text = "Fly ON"
        FlyButton.BackgroundColor3 = Color3.fromRGB(70, 180, 70)
        local char = LocalPlayer.Character
        if char and char:FindFirstChild("HumanoidRootPart") then
            local hrp = char.HumanoidRootPart
            -- BodyVelocity
            flyBV = Instance.new("BodyVelocity")
            flyBV.Velocity = Vector3.new(0,0,0)
            flyBV.MaxForce = Vector3.new(9e4, 9e4, 9e4)
            flyBV.Parent = hrp
            -- BodyGyro
            flyBG = Instance.new("BodyGyro")
            flyBG.MaxTorque = Vector3.new(9e4, 9e4, 9e4)
            flyBG.CFrame = hrp.CFrame
            flyBG.Parent = hrp
            -- Loop
            local conn = RunService.RenderStepped:Connect(function()
                if not flyEnabled then return end
                local cam = workspace.CurrentCamera
                local moveVector = Vector3.new(
                    flyControl.r - flyControl.l,
                    0,
                    flyControl.f - flyControl.b
                )
                if moveVector:Dot(moveVector) > 0 then
                    moveVector = moveVector.Unit
                end
                flyBV.Velocity = (cam.CFrame.LookVector * moveVector.Z + cam.CFrame.RightVector * moveVector.X) * flySpeed
                flyBG.CFrame = cam.CFrame
            end)
            table.insert(connections, conn)
        end
        updateStatus("Fly enabled.")
    else
        FlyButton.Text = "Fly OFF"
        FlyButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
        for _, conn in pairs(connections) do
            if conn and conn.Connected then conn:Disconnect() end
        end
        if flyBV then flyBV:Destroy() end
        if flyBG then flyBG:Destroy() end
        updateStatus("Fly disabled.")
    end
end)

-- Steuerung für Fliegen
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if flyEnabled then
        if input.KeyCode == Enum.KeyCode.W then
            flyControl.f = 1
        elseif input.KeyCode == Enum.KeyCode.S then
            flyControl.b = 1
        elseif input.KeyCode == Enum.KeyCode.A then
            flyControl.l = 1
        elseif input.KeyCode == Enum.KeyCode.D then
            flyControl.r = 1
        end
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if flyEnabled then
        if input.KeyCode == Enum.KeyCode.W then
            flyControl.f = 0
        elseif input.KeyCode == Enum.KeyCode.S then
            flyControl.b = 0
        elseif input.KeyCode == Enum.KeyCode.A then
            flyControl.l = 0
        elseif input.KeyCode == Enum.KeyCode.D then
            flyControl.r = 0
        end
    end
end)

-- Aimbot
AimbotButton.MouseButton1Click:Connect(function()
    aimbotEnabled = not aimbotEnabled
    if aimbotEnabled then
        AimbotButton.Text = "Aimbot ON"
        AimbotButton.BackgroundColor3 = Color3.fromRGB(70, 180, 70)
    else
        AimbotButton.Text = "Aimbot OFF"
        AimbotButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
    end
end)

RunService.RenderStepped:Connect(function()
    if not aimbotEnabled then return end
    local minDist = math.huge
    local targetPlayer = nil
    local myPos = workspace.CurrentCamera.CFrame.Position
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local targetPos = player.Character.HumanoidRootPart.Position
            local dist = (targetPos - myPos).Magnitude
            if dist < minDist then
                minDist = dist
                targetPlayer = player
            end
        end
    end
    if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
        local targetPos = targetPlayer.Character.HumanoidRootPart.Position
        local cam = workspace.CurrentCamera
        cam.CFrame = CFrame.new(cam.CFrame.Position, targetPos)
    end
end)

-- Fly-Speed Slider (bei Klick oder Textänderung, hier einfach als TextBox)
FlySpeedBox.FocusLost:Connect(function()
    local val = tonumber(FlySpeedBox.Text)
    if val then
        flySpeed = val
    end
end)

print("Script loaded with full menu and functions.")local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

-- Referenzen zu GUI-Elementen
local mainGui = script.Parent
local NoclipButton = mainGui:WaitForChild("NoclipButton")
local FlyButton = mainGui:WaitForChild("FlyButton")
local AimbotButton = mainGui:WaitForChild("AimbotButton")
local UnloadButton = mainGui:WaitForChild("UnloadButton")
local FlySpeedBox = mainGui:WaitForChild("FlySpeedSlider")
local StatusLabel = mainGui:WaitForChild("StatusLabel")

-- Variablen
local noclipEnabled = false
local noclipConnection = nil

local flyEnabled = false
local flyConnection = nil
local flyBV = nil
local flyBG = nil
local flyControl = {f = 0, b = 0, l = 0, r = 0}
local flySpeed = 50

local aimbotEnabled = false

local connections = {}

-- Helper Funktion: Update Status Label
local function updateStatus(text)
    StatusLabel.Text = text
end

-- Unload Funktion
UnloadButton.MouseButton1Click:Connect(function()
    -- Hier kannst du alles deaktivieren, was du willst
    -- z.B. alle Verbindungen trennen, alles zurücksetzen
    for _, conn in pairs(connections) do
        if conn and conn.Connected then
            conn:Disconnect()
        end
    end
    -- Reset Variablen
    noclipEnabled = false
    flyEnabled = false
    aimbotEnabled = false
    -- GUI Status
    updateStatus("Unloaded and reset.")
    -- Optional: GUI schließen oder deaktivieren
end)

-- Noclip Toggle
NoclipButton.MouseButton1Click:Connect(function()
    noclipEnabled = not noclipEnabled
    if noclipEnabled then
        NoclipButton.Text = "Noclip ON"
        NoclipButton.BackgroundColor3 = Color3.fromRGB(70, 180, 70)
        local conn = RunService.Stepped:Connect(function()
            local char = LocalPlayer.Character
            if char then
                for _, part in pairs(char:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = false
                    end
                end
            end
        end)
        table.insert(connections, conn)
        updateStatus("Noclip enabled.")
    else
        NoclipButton.Text = "Noclip OFF"
        NoclipButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
        -- Kollisions wieder aktivieren
        local char = LocalPlayer.Character
        if char then
            for _, part in pairs(char:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = true
                end
            end
        end
        -- Alle Noclip-Connections entfernen
        for _, conn in pairs(connections) do
            if conn and conn.Connected then
                conn:Disconnect()
            end
        end
        table.clear(connections)
        updateStatus("Noclip disabled.")
    end
end)

-- Fly Toggle
FlyButton.MouseButton1Click:Connect(function()
    flyEnabled = not flyEnabled
    flySpeed = tonumber(FlySpeedBox.Text) or 50
    if flyEnabled then
        FlyButton.Text = "Fly ON"
        FlyButton.BackgroundColor3 = Color3.fromRGB(70, 180, 70)
        local char = LocalPlayer.Character
        if char and char:FindFirstChild("HumanoidRootPart") then
            local hrp = char.HumanoidRootPart
            -- BodyVelocity
            flyBV = Instance.new("BodyVelocity")
            flyBV.Velocity = Vector3.new(0,0,0)
            flyBV.MaxForce = Vector3.new(9e4, 9e4, 9e4)
            flyBV.Parent = hrp
            -- BodyGyro
            flyBG = Instance.new("BodyGyro")
            flyBG.MaxTorque = Vector3.new(9e4, 9e4, 9e4)
            flyBG.CFrame = hrp.CFrame
            flyBG.Parent = hrp
            -- Loop
            local conn = RunService.RenderStepped:Connect(function()
                if not flyEnabled then return end
                local cam = workspace.CurrentCamera
                local moveVector = Vector3.new(
                    flyControl.r - flyControl.l,
                    0,
                    flyControl.f - flyControl.b
                )
                if moveVector:Dot(moveVector) > 0 then
                    moveVector = moveVector.Unit
                end
                flyBV.Velocity = (cam.CFrame.LookVector * moveVector.Z + cam.CFrame.RightVector * moveVector.X) * flySpeed
                flyBG.CFrame = cam.CFrame
            end)
            table.insert(connections, conn)
        end
        updateStatus("Fly enabled.")
    else
        FlyButton.Text = "Fly OFF"
        FlyButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
        for _, conn in pairs(connections) do
            if conn and conn.Connected then conn:Disconnect() end
        end
        if flyBV then flyBV:Destroy() end
        if flyBG then flyBG:Destroy() end
        updateStatus("Fly disabled.")
    end
end)

-- Steuerung für Fliegen
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if flyEnabled then
        if input.KeyCode == Enum.KeyCode.W then
            flyControl.f = 1
        elseif input.KeyCode == Enum.KeyCode.S then
            flyControl.b = 1
        elseif input.KeyCode == Enum.KeyCode.A then
            flyControl.l = 1
        elseif input.KeyCode == Enum.KeyCode.D then
            flyControl.r = 1
        end
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if flyEnabled then
        if input.KeyCode == Enum.KeyCode.W then
            flyControl.f = 0
        elseif input.KeyCode == Enum.KeyCode.S then
            flyControl.b = 0
        elseif input.KeyCode == Enum.KeyCode.A then
            flyControl.l = 0
        elseif input.KeyCode == Enum.KeyCode.D then
            flyControl.r = 0
        end
    end
end)

-- Aimbot
AimbotButton.MouseButton1Click:Connect(function()
    aimbotEnabled = not aimbotEnabled
    if aimbotEnabled then
        AimbotButton.Text = "Aimbot ON"
        AimbotButton.BackgroundColor3 = Color3.fromRGB(70, 180, 70)
    else
        AimbotButton.Text = "Aimbot OFF"
        AimbotButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
    end
end)

RunService.RenderStepped:Connect(function()
    if not aimbotEnabled then return end
    local minDist = math.huge
    local targetPlayer = nil
    local myPos = workspace.CurrentCamera.CFrame.Position
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local targetPos = player.Character.HumanoidRootPart.Position
            local dist = (targetPos - myPos).Magnitude
            if dist < minDist then
                minDist = dist
                targetPlayer = player
            end
        end
    end
    if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
        local targetPos = targetPlayer.Character.HumanoidRootPart.Position
        local cam = workspace.CurrentCamera
        cam.CFrame = CFrame.new(cam.CFrame.Position, targetPos)
    end
end)

-- Fly-Speed Slider (bei Klick oder Textänderung, hier einfach als TextBox)
FlySpeedBox.FocusLost:Connect(function()
    local val = tonumber(FlySpeedBox.Text)
    if val then
        flySpeed = val
    end
end)

print("Script loaded with full menu and functions.")
