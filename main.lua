-- БЛОК МУЛЬТИМЕТРА УРОНА
do
    local rs = game:GetService("ReplicatedStorage")
    local remote = rs:WaitForChild("RemoteEvent") -- проверь имя
    local command = "UpgradeStrength"
    local argument = 1

    local player = game.Players.LocalPlayer
    local gui = Instance.new("ScreenGui")
    gui.Name = "DamageMultiplierGui"
    gui.ResetOnSpawn = false
    gui.Parent = player:WaitForChild("PlayerGui")

    local frame = Instance.new("Frame", gui)
    frame.Size = UDim2.new(0, 200, 0, 220)
    frame.Position = UDim2.new(0.05, 0, 0.3, 0)
    frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)

    local function makeBtn(label, mult, ypos)
        local btn = Instance.new("TextButton", frame)
        btn.Size = UDim2.new(1, -20, 0, 40)
        btn.Position = UDim2.new(0, 10, 0, ypos)
        btn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
        btn.TextColor3 = Color3.new(1,1,1)
        btn.Text = label

        btn.MouseButton1Click:Connect(function()
            for i = 1, mult do
                remote:FireServer(command, argument)
                task.wait(0.05)
            end
        end)
    end

    makeBtn("Урон ×10", 10, 10)
    makeBtn("Урон ×20", 20, 60)
    makeBtn("Урон ×50", 50, 110)
    makeBtn("Урон ×100",100,160)
end
-- КОНЕЦ БЛОКА
