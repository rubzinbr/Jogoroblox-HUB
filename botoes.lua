-- botoes.lua
local TweenService = game:GetService("TweenService")
local Botoes = {}

function Botoes.Criar(contentFrame)
    for i = 1, 5 do
        local button = Instance.new("TextButton")
        button.Name = "Botao" .. i
        button.Parent = contentFrame
        button.Size = UDim2.new(0, 200, 0, 28) -- retangular e fininho
        button.Position = UDim2.new(0, 20, 0, (i - 1) * 40 + 20)
        button.BackgroundColor3 = Color3.fromRGB(120, 60, 200)
        button.Text = "Botão " .. i
        button.TextColor3 = Color3.new(1, 1, 1)
        button.Font = Enum.Font.GothamBold
        button.TextSize = 16
        button.AutoButtonColor = false

        local corner = Instance.new("UICorner")
        corner.CornerRadius = UDim.new(0, 10)
        corner.Parent = button

        -- começa escondido
        button.BackgroundTransparency = 1
        button.TextTransparency = 1
        button.Size = UDim2.new(0, 0, 0, 0)

        -- animação divertida de entrada (um por vez)
        task.delay(i * 0.15, function()
            local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Bounce, Enum.EasingDirection.Out)
            TweenService:Create(button, tweenInfo, {
                BackgroundTransparency = 0,
                TextTransparency = 0,
                Size = UDim2.new(0, 200, 0, 28)
            }):Play()
        end)

        -- hover animado
        button.MouseEnter:Connect(function()
            TweenService:Create(button, TweenInfo.new(0.2), {
                BackgroundColor3 = Color3.fromRGB(150, 90, 220)
            }):Play()
        end)
        button.MouseLeave:Connect(function()
            TweenService:Create(button, TweenInfo.new(0.2), {
                BackgroundColor3 = Color3.fromRGB(120, 60, 200)
            }):Play()
        end)

        -- ação quando clicar
        button.MouseButton1Click:Connect(function()
            print("Você clicou no " .. button.Name)
        end)
    end
end

return Botoes