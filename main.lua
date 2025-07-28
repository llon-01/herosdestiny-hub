-- Создаём GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.Name = "DamageMultiplierGUI"

local Frame = Instance.new("Frame")
Frame.Parent = ScreenGui
Frame.AnchorPoint = Vector2.new(0, 0)
Frame.Position = UDim2.new(0, 10, 0, 100)
Frame.Size = UDim2.new(0, 150, 0, 180)
Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Frame.BorderSizePixel = 0
Frame.BackgroundTransparency = 0.3
Frame.Visible = true

local function createButton(text, multiplier, yPos)
    local btn = Instance.new("TextButton")
    btn.Parent = Frame
    btn.Size = UDim2.new(0, 130, 0, 35)
    btn.Position = UDim2.new(0, 10, 0, yPos)
    btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    btn.TextColor3 = Color3.new(1, 1, 1)
    btn.Text = text
    btn.Font = Enum.Font.SourceSansBold
    btn.TextSize = 18
    btn.AutoButtonColor = true

    btn.MouseButton1Click:Connect(function()
        local remote = game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvent")
        for i = 1, multiplier do
            remote:FireServer("UpgradeStrength", 1)  -- заменяй "UpgradeStrength" на нужную команду
            wait(0.05)
        end
        print("Отправлено прокачек урона: " .. multiplier)
    end)
end

cre
