local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
local ToggleMusic = Instance.new("TextButton", ScreenGui)
local UICorner = Instance.new("UICorner", ToggleMusic)
local Sound = Instance.new("Sound", game:GetService("SoundService"))

Sound.SoundId = "rbxassetid://1848354533"
Sound.Volume = 2
Sound.Looped = true
Sound:Play()

ToggleMusic.Size = UDim2.new(0, 120, 0, 40)
ToggleMusic.Position = UDim2.new(0.05, 0, 0.15, 0)
ToggleMusic.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
ToggleMusic.Text = "TẮT NHẠC 🎵"
ToggleMusic.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleMusic.Font = Enum.Font.GothamBold
ToggleMusic.TextSize = 16
ToggleMusic.Draggable = true
UICorner.CornerRadius = UDim.new(0, 10)

local playing = true
ToggleMusic.MouseButton1Click:Connect(function()
	playing = not playing
	if playing then
		Sound:Play()
		ToggleMusic.Text = "TẮT NHẠC 🎵"
	else
		Sound:Pause()
		ToggleMusic.Text = "BẬT NHẠC 🔇"
	end
end)
