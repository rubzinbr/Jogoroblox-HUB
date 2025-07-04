
-- Jogoroblox HUB Loader
local repo = "https://raw.githubusercontent.com/hubzinbr/Jogoroblox-HUB/main/"

-- Tela de carregamento
loadstring(game:HttpGet(repo .. "carregamento.lua"))()
task.wait(2)

-- Sistema de chave
loadstring(game:HttpGet(repo .. "key.lua"))()
