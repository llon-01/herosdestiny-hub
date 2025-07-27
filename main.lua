local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local human = character:WaitForChild("Humanoid")

-- Обновляем human при смене персонажа
player.CharacterAdded:Connect(function(char)
    character = char
    human = char:WaitForChild("Humanoid")
end)

-- GUI как у тебя
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "SimpleGui"

local function createButton(text, posY, callback)
    local btn = Instance.new("TextButton", gui)
    btn.Size = UDim2.new(0, 200, 0, 40)
    btn.Position = UDim2.new(0, 10, 0, posY)
    btn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Text = text
    btn.Font = Enum.Font.SourceSansBold
    btn.TextSize = 20
    btn.MouseButton1Click:Connect(callback)
end

-- Speedhack toggle
local speedEnabled = false
createButton("Speedhack On/Off", 100, function()
    speedEnabled = not speedEnabled
    if human then
        human.WalkSpeed = speedEnabled and 100 or 16
    end
end)

-- Jumphack toggle
local jumpEnabled = false
createButton("JumpHack On/Off", 150, function()
    jumpEnabled = not jumpEnabled
    if human then
        human.JumpPower = jumpEnabled and 120 or 50
    end
end)

-- Anti-AFK кнопка (пример, просто выводит сообщение)
createButton("Enable Anti-AFK", 200, function()
    print("Anti-AFK включен (здесь надо добавить код)")
end)
