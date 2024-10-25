local Players = game:GetService("Players")
local player = Players.LocalPlayer
local UserInputService = game:GetService("UserInputService")

local screenGui = Instance.new("ScreenGui")
local frame = Instance.new("Frame")
local autoFarmButton = Instance.new("TextButton")
local closeButton = Instance.new("TextButton")

screenGui.Parent = player:WaitForChild("PlayerGui")
frame.Size = UDim2.new(0, 300, 0, 150)
frame.Position = UDim2.new(0.5, -150, 0.5, -75)
frame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
frame.BorderSizePixel = 0
frame.Parent = screenGui

autoFarmButton.Size = UDim2.new(1, 0, 0.5, 0)
autoFarmButton.Text = "Auto Farm: Off"
autoFarmButton.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
autoFarmButton.TextColor3 = Color3.fromRGB(255, 255, 255)
autoFarmButton.BorderSizePixel = 0
autoFarmButton.Parent = frame

closeButton.Size = UDim2.new(1, 0, 0.5, 0)
closeButton.Position = UDim2.new(0, 0, 0.5, 0)
closeButton.Text = "Close"
closeButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.BorderSizePixel = 0
closeButton.Parent = frame

local autoFarmEnabled = false

local function teleportPlayerToCorrectGate()
    local levelsFolder = game.Workspace:FindFirstChild("Levels")
    if not levelsFolder then
        warn("Папка Levels не найдена в Workspace")
        return
    end

    for i = 1, 50 do
        local model = levelsFolder:FindFirstChild(tostring(i))
        if model then
            local map = model:FindFirstChild("Map")
            if map then
                local geometry = map:FindFirstChild("Geometry")
                if geometry then
                    local keep = geometry:FindFirstChild("Keep")
                    if keep then
                        local gate = keep:FindFirstChild("Gate")
                        if gate and gate:IsA("Model") then
                            local targetPart = gate:FindFirstChild("Smooth Block Model")
                            if targetPart and targetPart:IsA("BasePart") then
                                player.Character:SetPrimaryPartCFrame(targetPart.CFrame * CFrame.new(0, 0, -7))
                                print("Игрок телепортирован к Gate в папке Keep.")
                                return
                            else
                                warn("Не найден Smooth Block Model в Gate.")
                            end
                        end
                    end

                    local gate = geometry:FindFirstChild("Gate")
                    if gate and gate:IsA("Model") then
                        local targetPart = gate:FindFirstChild("Smooth Block Model")
                        if targetPart and targetPart:IsA("BasePart") then
                            player.Character:SetPrimaryPartCFrame(targetPart.CFrame * CFrame.new(0, 0, -7))
                            print("Игрок телепортирован к Gate в папке Geometry.")
                            return
                        else
                            warn("Не найден Smooth Block Model в Gate.")
                        end
                    end

                    local border = geometry:FindFirstChild("border")
                    if border and border:IsA("Model") then
                        local targetPart = border:FindFirstChild("Smooth Block Model")
                        if targetPart and targetPart:IsA("BasePart") then
                            player.Character:SetPrimaryPartCFrame(targetPart.CFrame * CFrame.new(0, 0, -7))
                            print("Игрок телепортирован к Border в папке Geometry.")
                            return
                        else
                            warn("Не найден Smooth Block Model в Border.")
                        end
                    end

                    local level = geometry:FindFirstChild("Level")
                    if level then
                        local gate = level:FindFirstChild("Gate")
                        if gate and gate:IsA("Model") then
                            local targetPart = gate:FindFirstChild("Smooth Block Model")
                            if targetPart and targetPart:IsA("BasePart") then
                                player.Character:SetPrimaryPartCFrame(targetPart.CFrame * CFrame.new(0, 0, -7))
                                print("Игрок телепортирован к Gate в папке Level.")
                                return
                            else
                                warn("Не найден Smooth Block Model в Gate.")
                            end
                        end
                    end
                    
                    local level5 = geometry:FindFirstChild("Level 5")
                    if level5 then
                        local keep = level5:FindFirstChild("Keep")
                        if keep then
                            local gate = keep:FindFirstChild("Gate")
                            if gate and gate:IsA("Model") then
                                local targetPart = gate:FindFirstChild("Smooth Block Model")
                                if targetPart and targetPart:IsA("BasePart") then
                                    player.Character:SetPrimaryPartCFrame(targetPart.CFrame * CFrame.new(0, 0, -7))
                                    print("Игрок телепортирован к Gate в папке Level 5.")
                                    return
                                else
                                    warn("Не найден Smooth Block Model в Gate в Level 5.")
                                end
                            end
                        end
                    end
                end
            end
        end
    end

    local rainbowRun = levelsFolder:FindFirstChild("RainbowRun")
    if rainbowRun then
        local map = rainbowRun:FindFirstChild("Map")
        if map then
            local geometry = map:FindFirstChild("Geometry")
            if geometry then
                local gate = geometry:FindFirstChild("Gate")
                if gate and gate:IsA("Model") then
                    local targetPart = gate:FindFirstChild("Smooth Block Model")
                    if targetPart and targetPart:IsA("BasePart") then
                        player.Character:SetPrimaryPartCFrame(targetPart.CFrame * CFrame.new(0, 0, -7))
                        print("Игрок телепортирован к Gate в RainbowRun.")
                        return
                    else
                        warn("Не найден Smooth Block Model в Gate в RainbowRun.")
                    end
                end
            end
        end
    end

    local finalDestinyProps = levelsFolder:FindFirstChild("final destiny props")
    if finalDestinyProps then
        local map = finalDestinyProps:FindFirstChild("Map")
        if map then
            local geometry = map:FindFirstChild("Geometry")
            if geometry then
                local doNotEnterWinnersSecret = geometry:FindFirstChild("do not enter winners secret")
                if doNotEnterWinnersSecret then
                    local gate = doNotEnterWinnersSecret:FindFirstChild("Gate")
                    if gate and gate:IsA("Model") then
                        local targetPart = gate:FindFirstChild("Smooth Block Model")
                        if targetPart and targetPart:IsA("BasePart") then
                            player.Character:SetPrimaryPartCFrame(targetPart.CFrame * CFrame.new(0, 0, -7))
                            print("Игрок телепортирован к Gate в do not enter winners secret.")
                            return
                        else
                            warn("Не найден Smooth Block Model в Gate в do not enter winners secret.")
                        end
                    end
                end
            end
        end
    end

    warn("Модель Gate или Border с Part 'Smooth Block Model' не найдена в диапазоне уровней 1-50, RainbowRun и final destiny props.")
end

local function autoFarm()
    while autoFarmEnabled do
        teleportPlayerToCorrectGate()
        wait(2)
    end
end

autoFarmButton.MouseButton1Click:Connect(function()
    autoFarmEnabled = not autoFarmEnabled
    autoFarmButton.Text = "Auto Farm: " .. (autoFarmEnabled and "On" or "Off")
    
    if autoFarmEnabled then
        autoFarm()
    end
end)

closeButton.MouseButton1Click:Connect(function()
    screenGui:Destroy()
end)

local dragging
local dragInput
local mousePos
local framePos

frame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        mousePos = UserInputService:GetMouse().Position
        framePos = frame.Position

        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = UserInputService:GetMouse().Position - mousePos
        frame.Position = UDim2.new(framePos.X.Scale, framePos.X.Offset + delta.X, framePos.Y.Scale, framePos.Y.Offset + delta.Y)
    end
end)
