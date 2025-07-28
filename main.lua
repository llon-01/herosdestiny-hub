-- Настройка
local autofarmEnabled = false -- Включить/выключить автофарм
local targetEnemyName = "Psykos" -- Имя врага для фарма

-- Функция автофарма
local function autoFarm()
    while autofarmEnabled do
        local player = game.Players.LocalPlayer
        local character = player.Character
        if character and character:FindFirstChild("HumanoidRootPart") and character:FindFirstChild("Humanoid") and character.Humanoid.Health > 0 then
            local enemiesFolder = workspace:WaitForChild("Spawns"):WaitForChild(targetEnemyName .. "s") -- Предполагается, что враги лежат в Spawns -> Psykos
            for _, enemy in pairs(enemiesFolder:GetChildren()) do
                if enemy:IsA("Model") and enemy.Name == targetEnemyName then
                    local enemyHumanoid = enemy:FindFirstChildOfClass("Humanoid")
                    local enemyHRP = enemy:FindFirstChild("HumanoidRootPart")
                    if enemyHumanoid and enemyHRP and enemyHumanoid.Health > 0 then
                        -- Подойти к врагу
                        repeat
                            wait(0.1)
                            character.HumanoidRootPart.CFrame = enemyHRP.CFrame * CFrame.new(0, 0, 2) -- стоим рядом с врагом
                        until enemyHumanoid.Health <= 0 or not autofarmEnabled or character.Humanoid.Health <= 0
                    end
                end
            end
        end
        wait(1)
    end
end

-- Включение/выключение автофарма (например, по нажатию кнопки)
local UserInputService = game:GetService("UserInputService")

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.F then -- Нажми F чтобы включить/выключить
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
        game.Players.LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Physics)
    end
end)
