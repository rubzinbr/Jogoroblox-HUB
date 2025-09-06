local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local isMinimized = false
local isDragging = false
local dragStart = nil
local startPos = nil

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "AnimatedInterface"
screenGui.Parent = playerGui
screenGui.ResetOnSpawn = false
screenGui.DisplayOrder = 100
screenGui.IgnoreGuiInset = true

local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainWindow"
mainFrame.Parent = screenGui
mainFrame.Size = UDim2.new(0, 600, 0, 350)
mainFrame.Position = UDim2.new(0.5, -300, 0.5, -175)
mainFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.ZIndex = 10

local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 12)
mainCorner.Parent = mainFrame

local shadowFrame = Instance.new("Frame")
shadowFrame.Name = "Shadow"
shadowFrame.Parent = screenGui
shadowFrame.Size = UDim2.new(0, 610, 0, 360)
shadowFrame.Position = UDim2.new(0.5, -305, 0.5, -170)
shadowFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
shadowFrame.BackgroundTransparency = 0.7
shadowFrame.ZIndex = 9

local shadowCorner = Instance.new("UICorner")
shadowCorner.CornerRadius = UDim.new(0, 12)
shadowCorner.Parent = shadowFrame

local titleBar = Instance.new("Frame")
titleBar.Name = "TitleBar"
titleBar.Parent = mainFrame
titleBar.Size = UDim2.new(1, 0, 0, 40)
titleBar.Position = UDim2.new(0, 0, 0, 0)
titleBar.BackgroundColor3 = Color3.fromRGB(102, 51, 153)
titleBar.BorderSizePixel = 0
titleBar.ZIndex = 11

local titleCorner = Instance.new("UICorner")
titleCorner.CornerRadius = UDim.new(0, 12)
titleCorner.Parent = titleBar

local titleLabel = Instance.new("TextLabel")
titleLabel.Name = "Title"
titleLabel.Parent = titleBar
titleLabel.Size = UDim2.new(1, -100, 1, 0)
titleLabel.Position = UDim2.new(0, 10, 0, 0)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "Jogo-roblox HUB"
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.TextSize = 16
titleLabel.TextXAlignment = Enum.TextXAlignment.Left
titleLabel.Font = Enum.Font.SourceSansBold
titleLabel.ZIndex = 12

local minimizeButton = Instance.new("TextButton")
minimizeButton.Name = "MinimizeButton"
minimizeButton.Parent = titleBar
minimizeButton.Size = UDim2.new(0, 30, 0, 30)
minimizeButton.Position = UDim2.new(1, -70, 0, 5)
minimizeButton.BackgroundColor3 = Color3.fromRGB(85, 26, 139) -- roxo escuro
minimizeButton.BorderSizePixel = 0
minimizeButton.Text = "─"
minimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
minimizeButton.TextSize = 16
minimizeButton.Font = Enum.Font.SourceSansBold
minimizeButton.ZIndex = 12

local minimizeCorner = Instance.new("UICorner")
minimizeCorner.CornerRadius = UDim.new(0, 6)
minimizeCorner.Parent = minimizeButton

local closeButton = Instance.new("TextButton")
closeButton.Name = "CloseButton"
closeButton.Parent = titleBar
closeButton.Size = UDim2.new(0, 30, 0, 30)
closeButton.Position = UDim2.new(1, -35, 0, 5)
closeButton.BackgroundColor3 = Color3.fromRGB(85, 26, 139) -- roxo escuro
closeButton.BorderSizePixel = 0
closeButton.Text = "✕"
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.TextSize = 14
closeButton.Font = Enum.Font.SourceSansBold
closeButton.ZIndex = 12

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 6)
closeCorner.Parent = closeButton

local contentFrame = Instance.new("Frame")
contentFrame.Name = "Content"
contentFrame.Parent = mainFrame
contentFrame.Size = UDim2.new(1, -20, 1, -60)
contentFrame.Position = UDim2.new(0, 10, 0, 50)
contentFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
contentFrame.BorderSizePixel = 0
contentFrame.ZIndex = 11

local contentCorner = Instance.new("UICorner")
contentCorner.CornerRadius = UDim.new(0, 8)
contentCorner.Parent = contentFrame

local exampleText = Instance.new("TextLabel")
exampleText.Parent = contentFrame
exampleText.Size = UDim2.new(1, -20, 1, -20)
exampleText.Position = UDim2.new(0, 10, 0, 10)
exampleText.BackgroundTransparency = 1
exampleText.Text = "Esta é uma interface animada!\n\nVocê pode:\n• Arrastar pela barra de título\n• Minimizar com animação\n• Fechar a janela\n\nDivirta-se! 🎉"
exampleText.TextColor3 = Color3.fromRGB(200, 200, 200)
exampleText.TextSize = 14
exampleText.TextWrapped = true
exampleText.TextYAlignment = Enum.TextYAlignment.Top
exampleText.Font = Enum.Font.SourceSans
exampleText.ZIndex = 12

local animationInfo = TweenInfo.new(
    0.5,
    Enum.EasingStyle.Back,
    Enum.EasingDirection.Out,
    0,
    false,
    0
)

local quickAnimInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

-- Variável para salvar a posição antes de minimizar
local lastPosition = mainFrame.Position

local function minimizeWindow()
    if not isMinimized then
        isMinimized = true

        -- Salvar posição antes de minimizar
        lastPosition = mainFrame.Position

        local closeDisappearTween = TweenService:Create(closeButton, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
            Size = UDim2.new(0, 0, 0, 0),
            Position = UDim2.new(1, -17.5, 0, 20),
            Rotation = 180
        })
        closeDisappearTween:Play()

        local minimizeMoveTexto = TweenService:Create(minimizeButton, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
            Position = UDim2.new(1, -35, 0, 5),
            Rotation = 360
        })
        minimizeMoveTexto:Play()

        wait(0.15)
        minimizeButton.Text = "□"

        local minimizeTween = TweenService:Create(mainFrame, animationInfo, {
            Size = UDim2.new(0, 300, 0, 40),
            -- usa a posição salva, só muda o Y para ficar mais compacto
            Position = UDim2.new(lastPosition.X.Scale, lastPosition.X.Offset, lastPosition.Y.Scale, lastPosition.Y.Offset),
            Rotation = 0
        })

        local shadowTween = TweenService:Create(shadowFrame, animationInfo, {
            Size = UDim2.new(0, 310, 0, 50),
            Position = UDim2.new(lastPosition.X.Scale, lastPosition.X.Offset - 5, lastPosition.Y.Scale, lastPosition.Y.Offset + 5)
        })

        minimizeTween:Play()
        shadowTween:Play()

        contentFrame.Visible = false
        closeButton.Visible = false

    else
        isMinimized = false
        contentFrame.Visible = true
        closeButton.Visible = true

        -- restaurar na posição anterior salva
        local restoreTween = TweenService:Create(mainFrame, animationInfo, {
            Size = UDim2.new(0, 600, 0, 350),
            Position = lastPosition,
            Rotation = 0
        })

        local shadowRestoreTween = TweenService:Create(shadowFrame, animationInfo, {
            Size = UDim2.new(0, 610, 0, 360),
            Position = UDim2.new(lastPosition.X.Scale, lastPosition.X.Offset - 5, lastPosition.Y.Scale, lastPosition.Y.Offset + 5)
        })

        restoreTween:Play()
        shadowRestoreTween:Play()

        local minimizeRestoreTween = TweenService:Create(minimizeButton, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
            Position = UDim2.new(1, -70, 0, 5),
            Rotation = 0
        })
        minimizeRestoreTween:Play()

        minimizeButton.Text = "─"

        closeButton.Size = UDim2.new(0, 0, 0, 0)
        closeButton.Position = UDim2.new(1, -17.5, 0, 20)
        closeButton.Rotation = 180

        local closeAppearTween = TweenService:Create(closeButton, TweenInfo.new(0.4, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out), {
            Size = UDim2.new(0, 30, 0, 30),
            Position = UDim2.new(1, -35, 0, 5),
            Rotation = 0
        })
        closeAppearTween:Play()
    end
end

local function closeWindow()
    local closeTween = TweenService:Create(mainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
        Size = UDim2.new(0, 0, 0, 0),
        Rotation = 180
    })

    local shadowCloseTween = TweenService:Create(shadowFrame, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
        Size = UDim2.new(0, 0, 0, 0)
    })

    closeTween:Play()
    shadowCloseTween:Play()

    closeTween.Completed:Connect(function()
        screenGui:Destroy()
    end)
end

local function startDrag(input)
    isDragging = true
    dragStart = input.Position
    startPos = mainFrame.Position
end

local function updateDrag(input)
    if isDragging and dragStart then
        local delta = input.Position - dragStart
        local newPos = UDim2.new(
            startPos.X.Scale,
            startPos.X.Offset + delta.X,
            startPos.Y.Scale,
            startPos.Y.Offset + delta.Y
        )
        mainFrame.Position = newPos
        shadowFrame.Position = UDim2.new(
            newPos.X.Scale,
            newPos.X.Offset - 5,
            newPos.Y.Scale,
            newPos.Y.Offset + 5
        )
    end
end

local function stopDrag()
    isDragging = false
end

minimizeButton.MouseButton1Click:Connect(minimizeWindow)
closeButton.MouseButton1Click:Connect(closeWindow)

titleBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        startDrag(input)
    end
end)

titleBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch then
        startDrag(input)
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        updateDrag(input)
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        stopDrag()
    end
end)

-- Animação de hover para o botão minimizar (roxo)
minimizeButton.MouseEnter:Connect(function()
    local hoverTween = TweenService:Create(minimizeButton, quickAnimInfo, {
        BackgroundColor3 = Color3.fromRGB(120, 52, 180)
    })
    hoverTween:Play()
end)

minimizeButton.MouseLeave:Connect(function()
    local leaveTween = TweenService:Create(minimizeButton, quickAnimInfo, {
        BackgroundColor3 = Color3.fromRGB(85, 26, 139)
    })
    leaveTween:Play()
end)

-- Animação de hover para o botão fechar (roxo igual ao minimizar)
closeButton.MouseEnter:Connect(function()
    local hoverTween = TweenService:Create(closeButton, quickAnimInfo, {
        BackgroundColor3 = Color3.fromRGB(120, 52, 180)
    })
    hoverTween:Play()
end)

closeButton.MouseLeave:Connect(function()
    local leaveTween = TweenService:Create(closeButton, quickAnimInfo, {
        BackgroundColor3 = Color3.fromRGB(85, 26, 139)
    })
    leaveTween:Play()
end)

-- Animação de entrada inicial da janela e sombra
mainFrame.Size = UDim2.new(0, 0, 0, 0)
shadowFrame.Size = UDim2.new(0, 0, 0, 0)

local enterTween = TweenService:Create(mainFrame, TweenInfo.new(0.6, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
    Size = UDim2.new(0, 600, 0, 350)
})

local shadowEnterTween = TweenService:Create(shadowFrame, TweenInfo.new(0.6, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
    Size = UDim2.new(0, 610, 0, 360)
})

enterTween:Play()
shadowEnterTween:Play()

print("Interface Animada carregada com sucesso!")
