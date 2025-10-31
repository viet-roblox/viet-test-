local ScreenGui = Instance.new("ScreenGui")
local ImageButton = Instance.new("ImageButton")
local UICorner = Instance.new("UICorner")

local Sound = Instance.new("Sound")
Sound.Parent = game:GetService("SoundService")
Sound.SoundId = "rbxassetid://9129993134"
Sound.Volume = 2
Sound.Looped = true
Sound:Play()

ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

ImageButton.Parent = ScreenGui
ImageButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
ImageButton.BorderSizePixel = 0
ImageButton.Position = UDim2.new(0.1, 0, 0.16, 0)
ImageButton.Size = UDim2.new(0, 40, 0, 40)
ImageButton.Draggable = true
ImageButton.Image = "http://www.roblox.com/asset/?id=71119154056117"

UICorner.CornerRadius = UDim.new(1, 10)
UICorner.Parent = ImageButton

local MusicPlaying = true
ImageButton.MouseButton1Down:Connect(function()
	MusicPlaying = not MusicPlaying
	if MusicPlaying then
		Sound:Play()
	else
		Sound:Pause()
	end
end)

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
}

Tabs.Main0:AddButton({
	Title = "Discord",
	Description = "viet dep zai",
	Callback = function()
		setclipboard("https://discord.com/channels/@me/1251540671890718723")
	end
})

Tabs.Main0:AddButton({
	Title = "Tiktok",
	Description = "ấn vào để copy link",
	Callback = function()
		setclip
