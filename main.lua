local repo = "https://raw.githubusercontent.com/rubzinbr/Jogoroblox-HUB/main/"

-- função para carregar os módulos direto do GitHub
local function loadModule(name)
    local url = repo .. name .. ".lua"
    return loadstring(game:HttpGet(url))()
end

-- carrega os módulos
local Interface = loadModule("interface")
local Botoes = loadModule("botoes")

-- cria interface
local contentFrame = Interface.Criar()

-- adiciona os botões na interface
Botoes.Criar(contentFrame)
