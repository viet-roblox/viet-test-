local ScreenGui = Instance.new("ScreenGui")
local ImageButton = Instance.new("ImageButton")
local UICorner = Instance.new("UICorner")

ScreenGui.Name = "ScriptToggle"
ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

ImageButton.Parent = ScreenGui
ImageButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
ImageButton.BorderSizePixel = 0
ImageButton.Position = UDim2.new(0.106, 0, 0.162, 0)
ImageButton.Size = UDim2.new(0, 40, 0, 40)
ImageButton.Draggable = true
ImageButton.Image = "http://www.roblox.com/asset/?id=71119154056117"

UICorner.CornerRadius = UDim.new(1, 10)
UICorner.Parent = ImageButton

local SoundsFolder = Instance.new("Folder", workspace)
SoundsFolder.Name = "ScriptSounds"

local soundIDs = {
	117729337544496
}

local Sounds = {}
for _, id in ipairs(soundIDs) do
	local s = Instance.new("Sound", SoundsFolder)
	s.SoundId = "rbxassetid://" .. id
	s.Volume = 4
	s.Looped = false
	table.insert(Sounds, s)
end

local i = 1
local function playSound(n)
	for _, s in ipairs(Sounds) do s:Stop() end
	i = n
	Sounds[i]:Play()
end

for _, s in ipairs(Sounds) do
	s.Ended:Connect(function()
		i += 1
		if i > #Sounds then i = 1 end
		playSound(i)
	end)
end

playSound(1)

repeat task.wait() until game:IsLoaded()
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local Window = Fluent:CreateWindow({
	Title = "Viet",
	SubTitle = "Tổng hợp",
	TabWidth = 157,
	Size = UDim2.fromOffset(450, 300),
	Acrylic = true,
	Theme = "Amethyst",
	MinimizeKey = Enum.KeyCode.End
})

local Tabs = {
	Main0 = Window:AddTab({ Title = "Thông Tin" }),
	Main1 = Window:AddTab({ Title = "Script" }),
	Main2 = Window:AddTab({ Title = "Nhạc" }),
}

Tabs.Main0:AddButton({
	Title = "Tắt Script",
	Description = "Tắt toàn bộ GUI và nhạc",
	Callback = function()
		for _, s in ipairs(Sounds) do s:Stop() end
		ScreenGui:Destroy()
		for _, gui in pairs(game.CoreGui:GetChildren()) do
			if gui.Name == "Fluent" then gui:Destroy() end
		end
	end
})

Tabs.Main1:AddButton({
	Title = "Speed Hub",
	Description = "",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua"))()
	end
})

Tabs.Main1:AddButton({
	Title = "Hendar Script",
	Description = "",
	Callback = function()
		loadstring(game:HttpGet("https://github.com/collectorhenfi-wq/Hendarscriptt/raw/refs/heads/main/Plantvsbrainrotupdate.txt"))()
	end
})

Tabs.Main1:AddButton({
	Title = "Cao Mod Auto Farm",
	Description = "",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/caomod2077/Script/refs/heads/main/FNDayFarm.lua"))()
	end
})

Tabs.Main1:AddButton({
	Title = "Ronix Hub",
	Description = "",
	Callback = function()
		loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/7d8a2a1a9a562a403b52532e58a14065.lua"))()
	end
})

Tabs.Main2:AddButton({
	Title = "Tạm dừng / Tiếp tục nhạc",
	Description = "",
	Callback = function()
		local s = Sounds[i]
		if s.IsPlaying then s:Pause() else s:Play() end
	end
})

Tabs.Main2:AddButton({
	Title = "Bài tiếp theo",
	Description = "",
	Callback = function()
		i += 1
		if i > #Sounds then i = 1 end
		playSound(i)
	end
})

Tabs.Main2:AddButton({
	Title = "Bài trước",
	Description = "",
	Callback = function()
		i -= 1
		if i < 1 then i = #Sounds end
		playSound(i)
	end
})

ImageButton.MouseButton1Down:Connect(function()
	game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.End, false, game)
end)
