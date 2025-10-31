local AutoSound = Instance.new("Sound", workspace)
AutoSound.SoundId = "rbxassetid://130235435158600"
AutoSound.Volume = 4
AutoSound.Looped = true
AutoSound:Play()

local ManualSound = Instance.new("Sound", workspace)
ManualSound.SoundId = "rbxassetid://115877769571526"
ManualSound.Volume = 4
ManualSound.Looped = true

local OtherSound = Instance.new("Sound", workspace)
OtherSound.SoundId = "rbxassetid://105075685614415"
OtherSound.Volume = 4
OtherSound.Looped = true

local Main0Sounds = {AutoSound, ManualSound, OtherSound}

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

local Tabs = {
	Main0 = Window:AddTab({ Title = "Music" }),
	Main1 = Window:AddTab({ Title = "plan vs brainrot" }),
	Main2 = Window:AddTab({ Title = "99 night in Forset" }),
	Main3 = Window:AddTab({ Title = "mai update" }),
	Main4 = Window:AddTab({ Title = "mai update" }),
	Main5 = Window:AddTab({ Title = "mai update" }),
}

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
