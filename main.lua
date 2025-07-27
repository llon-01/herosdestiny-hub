local player = game.Players.LocalPlayer

local speedEnabled = false
local jumpEnabled = false

local desiredSpeed = 350
local desiredJump = 360

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
    local char = player.Character
    if char then
        local humanoid = char:FindFirstChildOfClass("Humanoid")
        if humanoid then
            if speedEnabled then
                spawn(function()
                    while speedEnabled and humanoid and humanoid.Parent do
                        humanoid.WalkSpeed = desiredSpeed
                        wait(0.01)
                    end
                    if humanoid and humanoid.Parent then
                        humanoid.WalkSpeed = 16
                    end
                end)
            end
        end
    end
end)

createButton("Toggle Jumphack", 100, function()
    jumpEnabled = not jumpEnabled
    local char = player.Character
    if cha
