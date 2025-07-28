-- Настройка
local autofarmEnabled = false -- Включить/выключить автофарм
local targetEnemyName = "TIGER THREAT" -- Имя врага для фарма

-- Функция автофарма
local function autoFarm()
    while autofarmEnabled do
        local player = game.Players.LocalPlayer
        local character = player.Character
        if character and character:FindFirstChild("HumanoidRootPart") and character:FindFirstChild("Humanoid") and character.Humanoid.Health > 0 then
            -- Ищем всех врагов в workspace
            for _, enemy in pairs(workspace:GetChildren()) do
                if enemy:IsA("Model") and enemy.Name == targetEnemyName then
                    local enemyHumanoid = enemy:FindFirstChildOfClass("Humanoid")
                    local enemyHRP = enemy:FindFirstChild("HumanoidRootPart")
                    if enemyHumanoid and enemyHRP and enemyHumanoid.Health > 0 then
                        -- Подойти к врагу
                        repeat
                            wait(0.1)
                            character.HumanoidRootPart.CFrame = enemyHRP.CFrame * CFrame.new(0, 0, 2)
                        until enemyHumanoid.Health <= 0 or not autofarmEnabled or character.Humanoid.Health <= 0
                    end
                end
            end
        end
        wait(1)
    end
end

-- Включение/выключение автофарма клавишей F
local UserInputService = game:GetService("UserInputService")

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.F then
        autofarmEnabled = not autofarmEnabled
        if autofarmEnabled then
            print("AutoFarm включен!")
            coroutine.wrap(autoFarm)()
        else
            print("AutoFarm выключен!")
        end
    end
end)

-- Ноклип для безопасного прохождения через объекты во время фарма
game:GetService("RunService").Stepped:Connect(function()
    if autofarmEnabled and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
        game.Players.LocalPlayer.Characte
