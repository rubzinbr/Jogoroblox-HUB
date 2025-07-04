
-- Música de fundo
local SoundService = game:GetService("SoundService")
local musica = Instance.new("Sound", SoundService)
musica.Name = "JogorobloxMusica"
musica.SoundId = "rbxassetid://1837436066" -- música alternativa
musica.Volume = 1
musica.Looped = true
musica:Play()
