local ScreenGui = Instance.new("ScreenGui")
local ImageButton = Instance.new("ImageButton")
local UICorner = Instance.new("UICorner")

ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

ImageButton.Parent = ScreenGui
ImageButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
ImageButton.BorderSizePixel = 0
ImageButton.Position = UDim2.new(0.10615778, 0, 0.16217947, 0)
ImageButton.Size = UDim2.new(0, 40, 0, 40)
ImageButton.Draggable = true
ImageButton.Image = "http://www.roblox.com/asset/?id=71119154056117"

UICorner.CornerRadius = UDim.new(1, 0)
UICorner.Parent = ImageButton

ImageButton.MouseButton1Down:Connect(function()
	game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.End, false, game)
end)

-- Nhạc auto
local AutoSound = Instance.new("Sound", workspace)
AutoSound.SoundId = "rbxassetid://130235435158600"
AutoSound.Volume = 4
AutoSound.Looped = true
AutoSound:Play()

-- Nhạc bình thường
local ManualSound = Instance.new("Sound", workspace)
ManualSound.SoundId = "rbxassetid://115877769571526"
ManualSound.Volume = 4
ManualSound.Looped = true

-- Bạn có thể thêm nhạc khác vào đây
local OtherSound = Instance.new("Sound", workspace)
OtherSound.SoundId = "rbxassetid://105075685614415" -- ví dụ nhạc thứ 3
OtherSound.Volume = 4
OtherSound.Looped = true

-- Danh sách lưu tất cả Sound của Main0
local Main0Sounds = {AutoSound, ManualSound, OtherSound}

-- Hàm bật/tắt nhạc, chỉ cho phép 1 nhạc bật cùng lúc
local function ToggleSound(sound)
	if sound.IsPlaying then
		sound:Pause()
	else
		for _, s in pairs(Main0Sounds) do
			if s ~= sound and s.IsPlaying then
				s:Pause()
			end
		end
		sound:Play()
	end
end

-- Fluent UI
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
repeat task.wait() until game:IsLoaded()
local Window = Fluent:CreateWindow({
	Title = "Viet",
	SubTitle = "tổng hợp",
	TabWidth = 157,
	Size = UDim2.fromOffset(450, 300),
	Acrylic = true,
	Theme = "Amethyst",
	MinimizeKey = Enum.KeyCode.End
})

-- Tabs
local Tabs = {
	Main0 = Window:AddTab({ Title = "Music" }),
	Main1 = Window:AddTab({ Title = "plan vs brainrot" }),
	Main2 = Window:AddTab({ Title = "99 night in Forset" }),
	Main3 = Window:AddTab({ Title = "mai update" }),
	Main4 = Window:AddTab({ Title = "mai update" }),
	Main5 = Window:AddTab({ Title = "mai update" }),
}

-- Main0 buttons
Tabs.Main0:AddButton({
	Title = "Nhạc Auto",
	Description = "Ấn để bật/tắt nhạc auto",
	Callback = function()
		ToggleSound(AutoSound)
	end
})

Tabs.Main0:AddButton({
	Title = "My Compass",
	Description = "Ấn để bật/tắt nhạc bình thường",
	Callback = function()
		ToggleSound(ManualSound)
	end
})

Tabs.Main0:AddButton({
	Title = "Other Music",
	Description = "Ấn để bật/tắt nhạc thứ 3",
	Callback = function()
		ToggleSound(OtherSound)
	end
})

-- Main1 buttons
Tabs.Main1:AddButton({
	Title = "speed hub",
	Description = "có key",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua"))()
	end
})

Tabs.Main1:AddButton({
	Title = "hendar",
	Description = "",
	Callback = function()
		loadstring(game:HttpGet("https://github.com/collectorhenfi-wq/Hendarscriptt/raw/refs/heads/main/Plantvsbrainrotupdate.txt"))()
	end
})

Tabs.Main1:AddButton({
	Title = "cilent scripts",
	Description = "key:700member1234",
	Callback = function()
		loadstring(game:HttpGet("https://pastefy.app/2DsuRU5s/raw"))()
	end
})

-- Main2 buttons
Tabs.Main2:AddButton({
	Title = "cao mod script kaitun auto fram day",
	Description = "cre: caomod",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/caomod2077/Script/refs/heads/main/FNDayFarm.lua"))()
	end
})

Tabs.Main2:AddButton({
	Title = "fox name",
	Description = "",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/caomod2077/Script/refs/heads/main/FoxnameHub.lua"))()
	end
})

Tabs.Main2:AddButton({
	Title = "voidware",
	Description = "",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/VapeVoidware/VW-Add/main/nightsintheforest.lua", true))()
	end
})

Tabs.Main2:AddButton({
	Title = "RINGTA HUB",
	Description = "",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/wefwef127382/99daysloader.github.io/refs/heads/main/ringta.lua"))()
	end
})

Tabs.Main2:AddButton({
	Title = "ronix hub",
	Description = "",
	Callback = function()
		loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/7d8a2a1a9a562a403b52532e58a14065.lua"))()
	end
})


