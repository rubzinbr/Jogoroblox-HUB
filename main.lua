-- main.lua
local repo = "https://raw.githubusercontent.com/rubzinbr/Jogoroblox-HUB/main/"

-- função para carregar módulos do GitHub
local function loadModule(name)
    local url = repo .. name .. ".lua"
    local success, result = pcall(function()
        return loadstring(game:HttpGet(url))()
    end)
    if not success then
        warn("Falha ao carregar módulo: " .. name .. " | Erro: " .. tostring(result))
    end
    return result
end

-- carrega os módulos
local Interface = loadModule("interface")
local Botoes = loadModule("botoes")

-- cria interface
local contentFrame = Interface and Interface.Criar()
if contentFrame then
    -- adiciona botões
    if Botoes and Botoes.Criar then
        Botoes.Criar(contentFrame)
    else
        warn("Módulo 'botoes' não carregou ou não tem função Criar()")
    end
else
    warn("Módulo 'interface' não carregou ou não tem função Criar()")
end
