
-- Tela de carregamento com barra animada
local screen = Instance.new("ScreenGui", game.CoreGui)
screen.Name = "JogorobloxLoading"

local fundo = Instance.new("Frame", screen)
fundo.Size = UDim2.new(1, 0, 1, 0)
fundo.BackgroundColor3 = Color3.new(0, 0, 0)

local barra = Instance.new("Frame", fundo)
barra.Size = UDim2.new(0, 0, 0, 20)
barra.Position = UDim2.new(0.25, 0, 0.5, 0)
barra.BackgroundColor3 = Color3.fromRGB(128, 0, 255)
Instance.new("UICorner", barra).CornerRadius = UDim.new(0, 10)

local texto = Instance.new("TextLabel", fundo)
texto.Text = "Jogoroblox HUB"
texto.Position = UDim2.new(0.25, 0, 0.45, -30)
texto.Size = UDim2.new(0.5, 0, 0.1, 0)
texto.TextColor3 = Color3.new(1, 1, 1)
texto.BackgroundTransparency = 1
texto.Font = Enum.Font.Gotham
texto.TextSize = 22

for i = 1, 100 do
    barra.Size = UDim2.new(i/200, 0, 0, 20)
    wait(0.01)
end

screen:Destroy()
