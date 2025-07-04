
-- Botão de mutar/desmutar a música
local menu = game.CoreGui:WaitForChild("JogorobloxInterface"):WaitForChild("MainMenu")
local btn = Instance.new("TextButton", menu)
btn.Size = UDim2.new(0, 120, 0, 30)
btn.Position = UDim2.new(1, -130, 0, 10)
btn.Text = "Mutar Música"
btn.BackgroundColor3 = Color3.fromRGB(100, 0, 200)
btn.TextColor3 = Color3.new(1, 1, 1)

local musica = game:GetService("SoundService"):FindFirstChild("JogorobloxMusica")
btn.MouseButton1Click:Connect(function()
    if musica then
        musica.Volume = musica.Volume > 0 and 0 or 1
        btn.Text = musica.Volume > 0 and "Mutar Música" or "Ativar Música"
    end
end)
