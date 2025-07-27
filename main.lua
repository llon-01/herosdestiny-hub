local player = game.Players.LocalPlayer

local speedEnabled = false
local jumpEnabled = false
local antiAfkEnabled = false

local desiredSpeed = 200
local desiredJump = 240

-- GUI
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "SimpleGui"

local function createButton(text, posY, callback)
    local btn = Instance.new("TextButton", gui)
    btn.Size = UDim2.new(0, 200, 0, 40)
    btn.Position = UDim2.new(0, 10, 0, posY)
    btn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    btn.TextColor3 = Color3.new(1, 1, 1)
    btn.Font = Enum.Font.SourceSansBold
    btn.TextSize = 20
    btn.Text = text
    btn.MouseButton1Click:Connect(callback)
    return btn
end

-- Кнопки
createButton("Speedhack On/Off", 50, function()
    speedEnabled = not speedEnabled
end)

createButton("JumpHack On/Off", 100, function()
    jumpEnabled = not jumpEnabled
end)

createButton("Enable Anti-AFK", 150, function()
    antiAfkEnabled = not antiAfkEnabled
end)

-- Постоянная фиксация значений
spawn(function()
    while true do
        wait(0.05)
        local char = player.Character
        local humanoid = char and char:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid.WalkSpeed = speedEnabled and desiredSpeed or 16
            humanoid.JumpPower = jumpEnabled and desiredJump or 50
        end
    end
end)

-- Anti-AFK
player.Idled:Connect(function()
    if antiAfkEnabled then
        local vu = game:GetService("VirtualUser")
        vu:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
        wait(1)
        vu:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
    end
end)
