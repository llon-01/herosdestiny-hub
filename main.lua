-- A Hero's Destiny GUI Hub (простой)
local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local human = char:WaitForChild("Humanoid")

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
end

-- SpeedHack toggle
local speedEnabled = false
createButton("Speedhack On/Off", 100, function()
    speedEnabled = not speedEnabled
    human.WalkSpeed = speedEnabled and 100 or 16
end)

-- JumpHack toggle
local jumpEnabled = false
createButton("JumpHack On/Off", 150, function()
    jumpEnabled = not jumpEnabled
    human.JumpPower = jumpEnabled and 120 or 50
end)

-- Anti-AFK
createButton("Enable Anti-AFK", 200, function()
    local vu = game:service("VirtualUser")
    game:service("Players").LocalPlayer.Idled:connect(function()
        vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
        wait(1)
        vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    end)
    print("Anti-AFK активирован")
end)

print("Simple Hero's Destiny GUI загружен.")

