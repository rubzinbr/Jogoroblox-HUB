
-- Fundo com pontos que reagem ao mouse
local gui = Instance.new("ScreenGui", game.CoreGui)
gui.Name = "PontosDeFundo"

local gridSize = 30
local screenWidth, screenHeight = 1920, 1080
local points = {}

for x = 150, screenWidth, gridSize do
    for y = 0, screenHeight, gridSize do
        local dot = Instance.new("Frame", gui)
        dot.Size = UDim2.new(0, 4, 0, 4)
        dot.Position = UDim2.new(0, x, 0, y)
        dot.BackgroundColor3 = Color3.new(1, 1, 1)
        dot.BackgroundTransparency = 0.5
        dot.BorderSizePixel = 0
        table.insert(points, dot)
    end
end

game:GetService("RunService").RenderStepped:Connect(function()
    local mouse = game.Players.LocalPlayer:GetMouse()
    for _, dot in pairs(points) do
        local pos = dot.AbsolutePosition
        local dist = (Vector2.new(mouse.X, mouse.Y) - pos).Magnitude
        if dist < 60 then
            dot.Position = UDim2.new(0, pos.X + (mouse.X - pos.X)/15, 0, pos.Y + (mouse.Y - pos.Y)/15)
        else
            dot.Position = UDim2.new(0, pos.X, 0, pos.Y)
        end
    end
end)
