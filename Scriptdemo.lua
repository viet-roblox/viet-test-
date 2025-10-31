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

local AutoSound = Instance.new("Sound", workspace)
AutoSound.SoundId = "rbxassetid://115877769571526"
AutoSound.Volume = 4
AutoSound.Looped = true
AutoSound:Play()

local ManualSound = Instance.new("Sound", workspace)
ManualSound.SoundId = "rbxassetid://105075685614415"
ManualSound.Volume = 4
ManualSound.Looped = true

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
	Main0 = Window:AddTab({ Title = "Thông Tin" }),
	Main1 = Window:AddTab({ Title = "plan vs brainrot" }),
	Main2 = Window:AddTab({ Title = "99 night in Forset" }),
	Main3 = Window:AddTab({ Title = "mai update" }),
	Main4 = Window:AddTab({ Title = "mai update" }),
	Main5 = Window:AddTab({ Title = "mai update" }),
}

Tabs.Main0:AddButton({
	Title = "Discord",
	Description = "viet dep zai",
	Callback = function()
		setclipboard("https://discord.com/channels/@me/1251540671890718723")
	end
})

Tabs.Main0:AddButton({
	Title = "ấn vào đây",
	Description = "dán lên google",
	Callback = function()
		setclipboard("https://www.tiktok.com/@davoslingoagain/video/7563277456124153096?_r=1&_t=ZS-90lEgPdgG5I")
	end
})

Tabs.Main0:AddButton({
	Title = "Tắt / Bật nhạc Auto",
	Description = "Bật hoặc tắt âm thanh nền tự phát",
	Callback = function()
		if AutoSound.IsPlaying then
			AutoSound:Pause()
		else
			AutoSound:Play()
		end
	end
})

Tabs.Main0:AddButton({
	Title = "Bật / Tắt nhạc Manual",
	Description = "Nhạc này phải bật bằng tay",
	Callback = function()
		if ManualSound.IsPlaying then
			ManualSound:Pause()
		else
			ManualSound:Play()
		end
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

