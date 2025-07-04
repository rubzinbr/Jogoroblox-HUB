
-- Interface principal do Jogoroblox HUB
local CoreGui = game:GetService("CoreGui")
local interface = Instance.new("ScreenGui", CoreGui)
interface.Name = "JogorobloxInterface"

local menu = Instance.new("Frame", interface)
menu.Name = "MainMenu"
menu.Size = UDim2.new(0.9, 0, 0.9, 0)
menu.Position = UDim2.new(0.05, 0, 0.05, 0)
menu.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
menu.BorderSizePixel = 0
menu.ZIndex = 5
Instance.new("UICorner", menu).CornerRadius = UDim.new(0, 12)

local titulo = Instance.new("TextLabel", menu)
titulo.Text = "Jogoroblox HUB"
titulo.Size = UDim2.new(1, 0, 0, 40)
titulo.BackgroundTransparency = 1
titulo.TextColor3 = Color3.new(1, 1, 1)
titulo.Font = Enum.Font.GothamBold
titulo.TextSize = 24
