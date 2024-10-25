local Players = game:GetService("Players")
local player = Players.LocalPlayer
local UserInputService = game:GetService("UserInputService")

local screenGui = Instance.new("ScreenGui")
local frame = Instance.new("Frame")
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

local function teleportPlayerToCorrectGate()
    -- (Сюда вставляется существующая функция для авто-фарма)
end

local function autoFarm()
    while autoFarmEnabled do
        teleportPlayerToCorrectGate()
        wait(2)
    end
end

local function autoFarmEnergy()
    local targetPosition = Vector3.new(112.894, 133.527, -482.233)
    player.Character:SetPrimaryPartCFrame(CFrame.new(targetPosition))

    while autoFarmEnergyEnabled do
        keypress(Enum.KeyCode.A)
        wait(4)
        keyrelease(Enum.KeyCode.A)
        keypress(Enum.KeyCode.D)
        wait(4)
        keyrelease(Enum.KeyCode.D)
    end
end

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

closeButton.MouseButton1Click:Connect(function()
    screenGui:Destroy()
end)

-- Код для перемещения окна frame
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
end) перемещает в кординаты но не двигается 

