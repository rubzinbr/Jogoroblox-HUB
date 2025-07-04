
-- Botões do menu na lateral direita
local menu = game.CoreGui:WaitForChild("JogorobloxInterface"):WaitForChild("MainMenu")

local botoes = Instance.new("Frame", menu)
botoes.Position = UDim2.new(0.2, 0, 0.15, 0)
botoes.Size = UDim2.new(0, 200, 0, 300)
botoes.BackgroundTransparency = 1

local layout = Instance.new("UIListLayout", botoes)
layout.Padding = UDim.new(0, 6)
layout.SortOrder = Enum.SortOrder.LayoutOrder

local nomes = {"ESP", "FLY", "Speed", "NoClip", "TP"}
for _, nome in ipairs(nomes) do
    local btn = Instance.new("TextButton", botoes)
    btn.Size = UDim2.new(1, 0, 0, 40)
    btn.Text = nome
    btn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    btn.TextColor3 = Color3.new(1, 1, 1)
end
