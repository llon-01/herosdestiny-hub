local player = game.Players.LocalPlayer

local speedEnabled = false
local jumpEnabled = false

local desiredSpeed = 250
local desiredJump = 240

-- GUI
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "SpeedJumpGui"

local function createButton(text, posY, callback)
    local btn = Instance.new("TextButton", gui)
    btn.Size = UDim2.new(0, 200, 0, 40)
    btn.Position = UDim2.new(0, 10, 0, posY)
    btn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    btn.TextColor3 = Color3.new(1, 1, 1)
    btn.Font = Enum.Font.SourceSansBold
    btn.TextSize = 20
    btn.Text = text
    btn.MouseButton1Click:Connect(callback)
    return btn
end

createButton("Toggle Speedhack", 50, function()
    speedEnabled = not speedEnabled
end)

createButton("Toggle Jumphack", 100, function()
    jumpEnabled = not jumpEnabled
end)

-- Функция плавного изменения скорости
local function applySpeed(humanoid)
    spawn(function()
        while speedEnabled and humanoid and humanoid.Parent do
            if humanoid.WalkSpeed < desiredSpeed then
                humanoid.WalkSpeed = math.min(humanoid.WalkSpeed + 10, desiredSpeed)
            elseif humanoid.WalkSpeed > desiredSpeed then
                humanoid.WalkSpeed = math.max(humanoid.WalkSpeed - 10, desiredSpeed)
            end
            wait(0.05)
        end
        -- Если выключили, вернуть к нормальной скорости
        if humanoid and humanoid.Parent then
            humanoid.WalkSpeed = 16
        end
    end)
end

-- Постоянное обновление прыжка
spawn(function()
    while true do
        wait(0.1)
        local char = player.Character
        if char then
            local humanoid = char:FindFirstChildOfClass("Humanoid")
            if humanoid then
                if jumpEnabled then
                    humanoid.JumpPower = desiredJump
                else
                    humanoid.JumpPower = 50
                end
            end
        end
    end
end)

-- Обработка появления персонажа
local function onCharacterAdded(char)
    local humanoid = char:WaitForChild("Humanoid")
    if speedEnabled then
        applySpeed(humanoid)
    else
        humanoid.WalkSpeed = 16
    end
    if jumpEnabled then
        humanoid.JumpPower = desiredJump
    else
        humanoid.JumpPower = 50
    end
end

player.CharacterAdded:Connect(onCharacterAdded)
if player.Character then
    onCharacterAdded(player.Character)
end
