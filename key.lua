
-- Sistema de chave do Jogoroblox HUB
local repo = "https://raw.githubusercontent.com/hubzinbr/Jogoroblox-HUB/main/"
local Players = game:GetService("Players")
local player = Players.LocalPlayer

local key = "jogoroblox2025" -- chave de acesso

-- UI de verificação
local screen = Instance.new("ScreenGui", game.CoreGui)
screen.Name = "KeySystem"

local fundo = Instance.new("Frame", screen)
fundo.Size = UDim2.new(1, 0, 1, 0)
fundo.BackgroundColor3 = Color3.fromRGB(20, 20, 20)

local caixa = Instance.new("Frame", fundo)
caixa.Size = UDim2.new(0.4, 0, 0.25, 0)
caixa.Position = UDim2.new(0.3, 0, 0.375, 0)
caixa.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Instance.new("UICorner", caixa).CornerRadius = UDim.new(0, 8)

local input = Instance.new("TextBox", caixa)
input.PlaceholderText = "Digite a chave"
input.Size = UDim2.new(0.8, 0, 0.3, 0)
input.Position = UDim2.new(0.1, 0, 0.2, 0)
input.Text = ""
input.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
input.TextColor3 = Color3.new(1, 1, 1)

local botao = Instance.new("TextButton", caixa)
botao.Text = "Verificar"
botao.Size = UDim2.new(0.4, 0, 0.25, 0)
botao.Position = UDim2.new(0.3, 0, 0.6, 0)

botao.MouseButton1Click:Connect(function()
    if input.Text == key then
        screen:Destroy()
        loadstring(game:HttpGet(repo .. "interface.lua"))()
        loadstring(game:HttpGet(repo .. "abas.lua"))()
        loadstring(game:HttpGet(repo .. "botoes.lua"))()
        loadstring(game:HttpGet(repo .. "config.lua"))()
        loadstring(game:HttpGet(repo .. "musica.lua"))()
        loadstring(game:HttpGet(repo .. "fundo.lua"))()
    else
        input.Text = "Chave incorreta!"
    end
end)
