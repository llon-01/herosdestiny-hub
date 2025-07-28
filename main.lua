-- Создание GUI
local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
local Frame = Instance.new("Frame", ScreenGui)
Frame.Position = UDim2.new(0.05, 0, 0.4, 0)
Frame.Size = UDim2.new(0, 180, 0, 200)
Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)

local function createButton(text, multiplier, positionY)
	local button = Instance.new("TextButton", Frame)
	button.Size = UDim2.new(0, 160, 0, 35)
	button.Position = UDim2.new(0, 10, 0, positionY)
	button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	button.TextColor3 = Color3.fromRGB(255, 255, 255)
	button.Text = text

	button.MouseButton1Click:Connect(function()
		for i = 1, multiplier do
			local args = {
				[1] = "UpgradeStrength", -- <- заменить на нужный RemoteEvent, если отличается
				[2] = 1
			}
			game:GetService("ReplicatedStorage").RemoteEvent:FireServer(unpack(args))
			wait(0.05) -- задержка между вызовами, чтобы не вылететь
		end
	end)
end

createButton("Урон x10", 10, 10)
createButton("Урон x20", 20, 50)
createButton("Урон x50", 50, 90)
createButton("Урон x100", 100, 130)
