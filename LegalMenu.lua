local RunService = game:GetService("RunService") -- Stelle sicher, dass RunService importiert ist

local flyConnection = nil
local flyBV = nil
local flyBG = nil
local flyEnabled = false
local flySpeed = 50
local flyControl = {f = 0, b = 0, l = 0, r = 0}

FlyToggle.MouseButton1Click:Connect(function()
    flyEnabled = not flyEnabled
    flySpeed = tonumber(FlySpeedSlider.Text) or 50
    
    if flyEnabled then
        FlyToggle.Text = "✓ FLY ON"
        FlyToggle.BackgroundColor3 = Color3.fromRGB(70, 180, 70)
        
        local char = LocalPlayer.Character
        if char and char:FindFirstChild("HumanoidRootPart") then
            local hrp = char.HumanoidRootPart
            
            -- BodyVelocity erstellen
            flyBV = Instance.new("BodyVelocity")
            flyBV.Velocity = Vector3.new(0, 0, 0)
            flyBV.MaxForce = Vector3.new(9e4, 9e4, 9e4)
            flyBV.Parent = hrp
            
            -- BodyGyro erstellen
            flyBG = Instance.new("BodyGyro")
            flyBG.MaxTorque = Vector3.new(9e4, 9e4, 9e4)
            flyBG.CFrame = hrp.CFrame
            flyBG.Parent = hrp
            
            -- Loop für das Fliegen starten
            flyConnection = RunService.RenderStepped:Connect(function()
                if not flyEnabled then return end
                
                local cam = workspace.CurrentCamera
                local speed = flySpeed
                
                -- Bewegung berechnen
                local moveVector = Vector3.new(
                    flyControl.r - flyControl.l,
                    0,
                    flyControl.f - flyControl.b
                )
                
                if moveVector:Dot(moveVector) > 0 then
                    moveVector = moveVector.Unit
                end
                
                -- Velocity aktualisieren
                flyBV.Velocity = (
                    cam.CFrame.LookVector * moveVector.Z +
                    cam.CFrame.RightVector * moveVector.X
                ) * speed
                
                -- Orientierung aktualisieren
                flyBG.CFrame = cam.CFrame
            end)
        end
    else
        FlyToggle.Text = "❌ FLY OFF"
        FlyToggle.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
        
        if flyConnection then
            flyConnection:Disconnect()
            flyConnection = nil
        end
        if flyBV then flyBV:Destroy() end
        if flyBG then flyBG:Destroy() end
    end
end)

-- Steuerung für Fliegen
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed or not flyEnabled then return end
    
    if input.KeyCode == Enum.KeyCode.W then
        flyControl.f = 1
    elseif input.KeyCode == Enum.KeyCode.S then
        flyControl.b = 1
    elseif input.KeyCode == Enum.KeyCode.A then
        flyControl.l = 1
    elseif input.KeyCode == Enum.KeyCode.D then
        flyControl.r = 1
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
