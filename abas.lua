
-- Abas verticais no menu
local menu = game.CoreGui:WaitForChild("JogorobloxInterface"):WaitForChild("MainMenu")

local abas = Instance.new("Frame", menu)
abas.Size = UDim2.new(0, 150, 1, 0)
abas.Position = UDim2.new(0, 0, 0, 40)
abas.BackgroundColor3 = Color3.fromRGB(30, 30, 30)

local layout = Instance.new("UIListLayout", abas)
layout.Padding = UDim.new(0, 4)
layout.SortOrder = Enum.SortOrder.LayoutOrder

local nomes = {"Alt", "Configurações", "Extras", "Visual", "Funções"}
for _, nome in ipairs(nomes) do
    local btn = Instance.new("TextButton", abas)
    btn.Size = UDim2.new(1, 0, 0, 40)
    btn.Text = nome
    btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    btn.TextColor3 = Color3.new(1, 1, 1)

    btn.MouseEnter:Connect(function()
        btn.BackgroundColor3 = Color3.fromRGB(128, 0, 255)
    end)
    btn.MouseLeave:Connect(function()
        btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    end)
end
