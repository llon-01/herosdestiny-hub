-- A Hero's Destiny GUI Hub (обновлённый)

local player = game.Players.LocalPlayer

-- Ждём, когда появится персонаж
local function getHumanoid()
    local char = player.Character or player.CharacterAdded:Wait()
    return char:WaitForChild("Humanoid")
end

-- UI
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "SimpleGui"

-- Функция для создания кнопок
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
    return btn
end

local speedEnabled = false
local jumpEnabled = false

local function applySettings()
    local humanoid = getHumanoid()
    if humanoid then
        humanoid.WalkSpeed = speedEnabled and 100 or 16
        humanoid.JumpPower = jumpEnabled and 120 or 50
    end
end

-- Кнопка SpeedHack
createButton("Speedhack On/Off", 100, function()
    speedEnabled = not speedEnabled
    applySettings()
end)

-- Кнопка JumpHack
createButton("JumpHack On/Off", 150, function()
    jumpEnabled = not jumpEnabled
    applySettings()
end)

-- Автоматическое применение при респавне
player.CharacterAdded:Connect(function()
    wait(1) -- подождать загрузку персонажа
    applySettings()
end)

print("Скрипт запущен и готов к работе")
