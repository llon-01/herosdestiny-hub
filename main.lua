-- GUI настройки
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local Frame = Instance.new("Frame", ScreenGui)
Frame.AnchorPoint = Vector2.new(0, 0)
Frame.Position = UDim2.new(0.05, 0, 0.3, 0)
Frame.Size = UDim2.new(0, 200, 0, 200)
Frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)

local function makeBtn(text, mult, y)
	local btn = Instance.new("TextButton", Frame)
	btn.Size = UDim2.new(1, -20, 0, 40)
	btn.Position = UDim2.new(0, 10, 0, y)
	btn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
	btn.TextColor3 = Color3.new(1,1,1)
	btn.Text = text

	btn.MouseButton1Click:Connect(function()
		-- Отправка ивента на сервер
		local remote = game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvent")
		for i = 1, mult do
			remote:FireServer("UpgradeStrength", 1)
			task.wait(0.05)
		end
	end)
end

-- Кнопки
makeBtn("Урон ×10", 10, 10)
makeBtn("Урон ×20", 20, 60)
makeBtn("Урон ×50", 50, 110)
makeBtn("Урон ×100", 100, 160)
