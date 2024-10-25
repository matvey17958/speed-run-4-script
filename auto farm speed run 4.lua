local Players = game:GetService("Players")
local player = Players.LocalPlayer
local UserInputService = game:GetService("UserInputService")
local VirtualInputManager = game:GetService("VirtualInputManager")

-- Создание GUI
local screenGui = Instance.new("ScreenGui")
local frame = Instance.new("Frame")
local titleLabel = Instance.new("TextLabel")
local autoFarmButton = Instance.new("TextButton")
local autoFarmEnergyButton = Instance.new("TextButton")
local closeButton = Instance.new("TextButton")

screenGui.Parent = player:WaitForChild("PlayerGui")
frame.Size = UDim2.new(0, 300, 0, 200)
frame.Position = UDim2.new(0.5, -150, 0.5, -100)
frame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
frame.BorderSizePixel = 0
frame.Parent = screenGui

autoFarmButton.Size = UDim2.new(1, 0, 0.33, 0)
autoFarmButton.Text = "Auto Farm: Off"
autoFarmButton.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
autoFarmButton.TextColor3 = Color3.fromRGB(255, 255, 255)
autoFarmButton.BorderSizePixel = 0
autoFarmButton.Parent = frame

autoFarmEnergyButton.Size = UDim2.new(1, 0, 0.33, 0)
autoFarmEnergyButton.Position = UDim2.new(0, 0, 0.33, 0)
autoFarmEnergyButton.Text = "Auto Farm Energy: Off"
autoFarmEnergyButton.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
autoFarmEnergyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
autoFarmEnergyButton.BorderSizePixel = 0
autoFarmEnergyButton.Parent = frame

closeButton.Size = UDim2.new(1, 0, 0.33, 0)
closeButton.Position = UDim2.new(0, 0, 0.66, 0)
closeButton.Text = "Close"
closeButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.BorderSizePixel = 0
closeButton.Parent = frame

local autoFarmEnabled = false
local autoFarmEnergyEnabled = false

-- Функция для телепортации игрока к модели Gate со смещением назад на -7 по оси Z
local function teleportPlayerToCorrectGate()
    local levelsFolder = game.Workspace:FindFirstChild("Levels")
    if not levelsFolder then
        warn("Папка Levels не найдена в Workspace")
        return
    end

    -- Проверка моделей с цифрами от 1 до 50
    for i = 1, 50 do
        local model = levelsFolder:FindFirstChild(tostring(i))
        if model then
            local map = model:FindFirstChild("Map")
            if map then
                local geometry = map:FindFirstChild("Geometry")
                if geometry then
                    -- Поиск Gate в Keep
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

                    -- Поиск Gate в Geometry
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

                    -- Поиск border в Geometry
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

                    -- Поиск Gate в Level
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
                    
                    -- Поиск Gate в Level 5
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

    -- Поиск Gate в RainbowRun
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

    -- Поиск Gate в final destiny props
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

-- Основной цикл для авто-фарма
local function autoFarm()
    while autoFarmEnabled do
        teleportPlayerToCorrectGate()
        wait(2) -- Подождите 2 секунды перед следующей попыткой телепортации
    end
end

local function autoFarmEnergy()
    local targetPosition = Vector3.new(112.894, 133.527, -482.233)
    player.Character:SetPrimaryPartCFrame(CFrame.new(targetPosition))

    while autoFarmEnergyEnabled do
        VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.A, false, game) -- Нажать A
        wait(4)
        VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.A, false, game) -- Отпустить A
        
        VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.D, false, game) -- Нажать D
        wait(4)
        VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.D, false, game) -- Отпустить D
    end
end

-- Обработчик нажатия кнопки авто-фарма
autoFarmButton.MouseButton1Click:Connect(function()
    autoFarmEnabled = not autoFarmEnabled
    autoFarmButton.Text = "Auto Farm: " .. (autoFarmEnabled and "On" or "Off")
    
    if autoFarmEnabled then
        autoFarm()
    end
end)

autoFarmEnergyButton.MouseButton1Click:Connect(function()
    autoFarmEnergyEnabled = not autoFarmEnergyEnabled
    autoFarmEnergyButton.Text = "Auto Farm Energy: " .. (autoFarmEnergyEnabled and "On" or "Off")
    if autoFarmEnergyEnabled then
        autoFarmEnergy()
    end
end)

-- Обработчик нажатия кнопки закрытия
closeButton.MouseButton1Click:Connect(function()
    screenGui:Destroy() -- Уничтожаем GUI при закрытии
end)

-- Возможность перемещения GUI
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
