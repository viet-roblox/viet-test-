local ScreenGui = Instance.new("ScreenGui")
local ImageButton = Instance.new("ImageButton")
local UICorner = Instance.new("UICorner")

ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

ImageButton.Parent = ScreenGui
ImageButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
ImageButton.BorderSizePixel = 0
ImageButton.Position = UDim2.new(0.106, 0, 0.162, 0)
ImageButton.Size = UDim2.new(0, 40, 0, 40)
ImageButton.Draggable = true
ImageButton.Image = "http://www.roblox.com/asset/?id=83190276951914"

UICorner.CornerRadius = UDim.new(1, 10)
UICorner.Parent = ImageButton

ImageButton.MouseButton1Down:Connect(function()
    game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.End, false, game)
end)

local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
repeat wait() until game:IsLoaded()

local Window = Fluent:CreateWindow({
    Title = "Vietnguvaiz",
    SubTitle = "Blox Fruit",
    TabWidth = 157,
    Size = UDim2.fromOffset(450, 300),
    Acrylic = true,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.End
})

local Tabs = {
    Main1 = Window:AddTab({ Title = "plan vs brainrot" }),
    Main2 = Window:AddTab({ Title = "99 night in Forest" }),
}

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

