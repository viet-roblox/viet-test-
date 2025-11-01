-- Full sạch (chạy trên LocalScript trong Roblox Studio / game)
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- Xóa GUI cũ nếu có
if PlayerGui:FindFirstChild("VietMusicGUI") then
	PlayerGui.VietMusicGUI:Destroy()
end
if PlayerGui:FindFirstChild("VietToggleButton") then
	PlayerGui.VietToggleButton:Destroy()
end

-- ===== Music GUI =====
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "VietMusicGUI"
ScreenGui.Parent = PlayerGui
ScreenGui.ResetOnSpawn = false

local Frame = Instance.new("Frame")
Frame.Name = "MainFrame"
Frame.Size = UDim2.new(0, 420, 0, 320)
Frame.Position = UDim2.new(0.5, -210, 0.3, -160)
Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Frame.BorderSizePixel = 0
Frame.Parent = ScreenGui

local UICornerMain = Instance.new("UICorner")
UICornerMain.CornerRadius = UDim.new(0, 12)
UICornerMain.Parent = Frame

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -20, 0, 40)
Title.Position = UDim2.new(0, 10, 0, 10)
Title.BackgroundTransparency = 1
Title.Text = "Viet - Music"
Title.TextSize = 20
Title.TextColor3 = Color3.fromRGB(235,235,235)
Title.Font = Enum.Font.GothamSemibold
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = Frame

-- Playlist (thêm / sửa ID tại đây)
local playlist = {
	"rbxassetid://130235435158600", -- AutoSound
	"rbxassetid://115877769571526", -- ManualSound
	"rbxassetid://105075685614415", -- OtherSound
	"rbxassetid://117729337544496"  -- thêm ID cũ
}

-- Sound instance
local sound = Instance.new("Sound")
sound.Name = "VietMusicPlayer"
sound.Parent = workspace
sound.Looped = false
sound.Volume = 4

local current = 1
local playing = false

local function playIndex(idx)
	if not playlist[idx] then return end
	current = idx
	sound.SoundId = playlist[current]
	pcall(function() sound:Play() end)
	playing = true
end

local function stopSound()
	pcall(function() sound:Stop() end)
	playing = false
end

local function pauseSound()
	if sound.IsPlaying then
		pcall(function() sound:Pause() end)
		playing = false
	else
		pcall(function() sound:Play() end)
		playing = true
	end
end

sound.Ended:Connect(function()
	current = current + 1
	if current > #playlist then current = 1 end
	playIndex(current)
end)

-- Controls area
local btnSize = UDim2.new(0, 120, 0, 36)
local paddingX = 10
local startY = 60

local PlayPauseBtn = Instance.new("TextButton")
PlayPauseBtn.Size = btnSize
PlayPauseBtn.Position = UDim2.new(0, paddingX, 0, startY)
PlayPauseBtn.Text = "Play"
PlayPauseBtn.Font = Enum.Font.Gotham
PlayPauseBtn.TextSize = 16
PlayPauseBtn.Parent = Frame

local NextBtn = Instance.new("TextButton")
NextBtn.Size = btnSize
NextBtn.Position = UDim2.new(0, paddingX + 140, 0, startY)
NextBtn.Text = "Next"
NextBtn.Font = Enum.Font.Gotham
NextBtn.TextSize = 16
NextBtn.Parent = Frame

local PrevBtn = Instance.new("TextButton")
PrevBtn.Size = btnSize
PrevBtn.Position = UDim2.new(0, paddingX + 280, 0, startY)
PrevBtn.Text = "Prev"
PrevBtn.Font = Enum.Font.Gotham
PrevBtn.TextSize = 16
PrevBtn.Parent = Frame

local VolumeLabel = Instance.new("TextLabel")
VolumeLabel.Size = UDim2.new(0, 120, 0, 24)
VolumeLabel.Position = UDim2.new(0, paddingX, 0, startY + 50)
VolumeLabel.BackgroundTransparency = 1
VolumeLabel.Text = "Volume: 4"
VolumeLabel.TextColor3 = Color3.fromRGB(235,235,235)
VolumeLabel.Font = Enum.Font.Gotham
VolumeLabel.TextSize = 14
VolumeLabel.Parent = Frame

local VolumeSlider = Instance.new("Frame")
VolumeSlider.Size = UDim2.new(0, 260, 0, 8)
VolumeSlider.Position = UDim2.new(0, paddingX + 130, 0, startY + 54)
VolumeSlider.BackgroundColor3 = Color3.fromRGB(70,70,70)
VolumeSlider.Parent = Frame

local VolumeFill = Instance.new("Frame")
VolumeFill.Size = UDim2.new(0.4, 0, 1, 0)
VolumeFill.BackgroundColor3 = Color3.fromRGB(150,150,150)
VolumeFill.Parent = VolumeSlider

-- Playlist display
local ListLabel = Instance.new("TextLabel")
ListLabel.Size = UDim2.new(1, -20, 0, 120)
ListLabel.Position = UDim2.new(0, 10, 0, startY + 90)
ListLabel.BackgroundTransparency = 1
ListLabel.TextColor3 = Color3.fromRGB(235,235,235)
ListLabel.TextXAlignment = Enum.TextXAlignment.Left
ListLabel.TextYAlignment = Enum.TextYAlignment.Top
ListLabel.Font = Enum.Font.Gotham
ListLabel.TextSize = 14
ListLabel.Text = ""
ListLabel.Parent = Frame

local function refreshPlaylistText()
	local t = {}
	for idx, id in ipairs(playlist) do
		local mark = (idx == current and sound.IsPlaying) and "▶ " or "   "
		table.insert(t, mark .. tostring(idx) .. ". " .. id)
	end
	ListLabel.Text = table.concat(t, "\n")
end

-- Button behaviors
PlayPauseBtn.MouseButton1Click:Connect(function()
	if not sound.SoundId or sound.SoundId == "" then
		playIndex(current)
		PlayPauseBtn.Text = "Pause"
	else
		if sound.IsPlaying then
			pauseSound()
			PlayPauseBtn.Text = "Play"
		else
			pauseSound()
			PlayPauseBtn.Text = "Pause"
		end
	end
	refreshPlaylistText()
end)

NextBtn.MouseButton1Click:Connect(function()
	current = current + 1
	if current > #playlist then current = 1 end
	playIndex(current)
	PlayPauseBtn.Text = "Pause"
	refreshPlaylistText()
end)

PrevBtn.MouseButton1Click:Connect(function()
	current = current - 1
	if current < 1 then current = #playlist end
	playIndex(current)
	PlayPauseBtn.Text = "Pause"
	refreshPlaylistText()
end)

-- Volume slider click (basic)
local dragging = false
VolumeSlider.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		dragging = true
	end
end)
VolumeSlider.InputEnded:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		dragging = false
	end
end)
game:GetService("UserInputService").InputChanged:Connect(function(input)
	if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
		local mouse = game:GetService("Players").LocalPlayer:GetMouse()
		local absPos = mouse.X - (VolumeSlider.AbsolutePosition.X)
		local frac = math.clamp(absPos / VolumeSlider.AbsoluteSize.X, 0, 1)
		VolumeFill.Size = UDim2.new(frac, 0, 1, 0)
		local vol = math.floor(frac * 10 + 0.5)
		if vol < 0 then vol = 0 end
		if vol > 10 then vol = 10 end
		sound.Volume = vol
		VolumeLabel.Text = "Volume: " .. tostring(vol)
	end
end)

-- Init playlist text
refreshPlaylistText()

-- ===== Toggle Button (bật/tắt GUI) =====
local ToggleGui = Instance.new("ScreenGui")
ToggleGui.Name = "VietToggleButton"
ToggleGui.Parent = PlayerGui
ToggleGui.ResetOnSpawn = false

local ImageButton = Instance.new("ImageButton")
ImageButton.Parent = ToggleGui
ImageButton.Name = "ToggleButton"
ImageButton.BackgroundColor3 = Color3.fromRGB(0,0,0)
ImageButton.BorderSizePixel = 0
ImageButton.Position = UDim2.new(0.10615778, 0, 0.16217947, 0)
ImageButton.Size = UDim2.new(0, 40, 0, 40)
ImageButton.Draggable = true
ImageButton.Image = "rbxassetid://71119154056117"

local UICornerBtn = Instance.new("UICorner")
UICornerBtn.CornerRadius = UDim.new(1, 0)
UICornerBtn.Parent = ImageButton

ImageButton.MouseButton1Click:Connect(function()
	ScreenGui.Enabled = not ScreenGui.Enabled
end)

-- Auto-play first track on load
playIndex(current)
PlayPauseBtn.Text = "Pause"
refreshPlaylistText()

