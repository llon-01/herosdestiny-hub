local player = game.Players.LocalPlayer

local speedEnabled = false
local jumpEnabled = false

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
    return btn
end

local function applySettings()
    local character = player.Character
    if not character then return end
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    if not humanoid then return end
    
    humanoid.WalkSpeed = speedEnabled and 100 or 16
    humanoid.JumpPower = jumpEnabled and 120 or 50
end

spawn(function()
    while true do
        applySettings()
        local humanoid = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            print("Speed:", humanoid.WalkSpeed, "Jump:", humanoid.JumpPower)
        end
        wait(0.1)
    end
end)

createButton("Speedhack On/Off", 100, function()
    speedEnabled = not speedEnabled
end)

createButton("JumpHack On/Off", 150, function()
    jumpEnabled = not jumpEnabled
end)

player.CharacterAdded:Connect(function()
    wait(1)
    applySettings()
end)

print("Скрипт запущен, GUI готов!")
