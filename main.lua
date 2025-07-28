local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local remote = game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvent")

-- Создаем GUI
local ScreenGui = Instance.new("ScreenGui", playerGui)
ScreenGui.Name = "DamageMultiplierGUI"

local Frame = Instance.new("Frame", ScreenGui)
Frame.Size = UDim2.new(0, 150, 0, 200)
Frame.Position = UDim2.new(0, 10, 0, 100)
Frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Frame.BackgroundTransparency = 0.3
Frame.BorderSizePixel = 0

local function createButton(text, count, yPos)
    local btn = Instance.new("TextButton", Frame)
    btn.Size = UDim2.new(0, 130, 0, 35)
    btn.Position = UDim2.new(0, 10, 0, yPos)
    btn.Text = text
    btn.Font = Enum.Font.SourceSansBold
    btn.TextSize = 18
    btn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    btn.TextColor3 = Color3.new(1, 1, 1)

    btn.MouseButton1Click:Connect(function()
        for i = 1, count do
            remote:FireServer("UpgradeStrength", 1)
            wait(0.05)
        end
        print("Прокачка урона x"..count.." отправлена")
    end)
end

createButton("Урон x10", 10, 10)
createButton("Урон x20", 20, 55)
createButton("Урон x50", 50, 100)
createButton("Урон x100", 100, 145)
