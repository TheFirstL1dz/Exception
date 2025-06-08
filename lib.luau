local Exception = {}

-- Main container for the UI
function Exception:CreateWindow()
    local gui = Instance.new("ScreenGui")
    gui.Name = "Exception"
    gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    gui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

    local main = Instance.new("Frame")
    main.Name = "Main"
    main.AnchorPoint = Vector2.new(0.5, 0.5)
    main.BackgroundColor3 = Color3.fromRGB(23, 23, 29)
    main.BorderSizePixel = 0
    main.Position = UDim2.new(0.5, 0, 0.5, 0)
    main.Size = UDim2.new(0.4, 0, 0.4, 0)
    main.Parent = gui

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 9)
    corner.Parent = main

    -- Logo
    local logo = Instance.new("ImageLabel")
    logo.Name = "Logo"
    logo.AnchorPoint = Vector2.new(0.5, 0.5)
    logo.BackgroundTransparency = 1
    logo.Position = UDim2.new(0.04, 0, 0.08, 0)
    logo.Size = UDim2.new(0.3, 0, 0.3, 0)
    logo.Image = "rbxassetid://94099000985882"
    logo.Parent = main

    -- Title
    local title = Instance.new("TextLabel")
    title.Name = "Title"
    title.AnchorPoint = Vector2.new(0.5, 0.5)
    title.BackgroundTransparency = 1
    title.Position = UDim2.new(0.18, 0, 0.955, 0)
    title.Size = UDim2.new(0.337, 0, 0.067, 0)
    title.Font = Enum.Font.Oswald
    title.Text = "Exception.red"
    title.TextColor3 = Color3.fromRGB(255, 255, 255)
    title.TextScaled = true
    title.TextWrapped = true
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.Parent = main

    -- Close button
    local close = Instance.new("TextButton")
    close.Name = "Close"
    close.AnchorPoint = Vector2.new(0.5, 0.5)
    close.BackgroundTransparency = 1
    close.Position = UDim2.new(0.97, 0, 0.06, 0)
    close.Size = UDim2.new(0.05, 0, 0.1, 0)
    close.AutoButtonColor = false
    close.Font = Enum.Font.SourceSans
    close.Text = "X"
    close.TextColor3 = Color3.fromRGB(255, 255, 255)
    close.TextScaled = true
    close.TextWrapped = true
    close.Parent = main

    -- Tab navigation frame
    local tabFrame = Instance.new("Frame")
    tabFrame.Name = "TabFrame"
    tabFrame.BackgroundColor3 = Color3.fromRGB(28, 28, 35)
    tabFrame.BorderSizePixel = 0
    tabFrame.Position = UDim2.new(0, 0, 0.164, 0)
    tabFrame.Size = UDim2.new(0, 182, 0, 326)
    tabFrame.Parent = main

    local tabCorner = Instance.new("UICorner")
    tabCorner.Parent = tabFrame

    local grid = Instance.new("UIGridLayout")
    grid.SortOrder = Enum.SortOrder.LayoutOrder
    grid.CellSize = UDim2.new(0, 180, 0, 40)
    grid.Parent = tabFrame

    -- Content frame
    local contentFrame = Instance.new("Frame")
    contentFrame.Name = "TabFrame"
    contentFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    contentFrame.BackgroundColor3 = Color3.fromRGB(28, 28, 35)
    contentFrame.BorderSizePixel = 0
    contentFrame.Position = UDim2.new(0.62, 0, 0.54, 0)
    contentFrame.Size = UDim2.new(0.74, 0, 0.7, 0)
    contentFrame.Parent = main

    local contentCorner = Instance.new("UICorner")
    contentCorner.Parent = contentFrame

    -- Left panel example
    local leftPanel = Instance.new("Frame")
    leftPanel.Name = "LeftExample"
    leftPanel.AnchorPoint = Vector2.new(0.5, 0.5)
    leftPanel.BackgroundColor3 = Color3.fromRGB(23, 23, 29)
    leftPanel.BorderSizePixel = 0
    leftPanel.Position = UDim2.new(0.25, 0, 0.5, 0)
    leftPanel.Size = UDim2.new(0.45, 0, 0.9, 0)
    leftPanel.Parent = contentFrame

    local leftCorner = Instance.new("UICorner")
    leftCorner.Parent = leftPanel

    local leftLine = Instance.new("Frame")
    leftLine.Name = "Line"
    leftLine.AnchorPoint = Vector2.new(0.5, 0.5)
    leftLine.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    leftLine.BackgroundTransparency = 0.55
    leftLine.BorderSizePixel = 0
    leftLine.Position = UDim2.new(0.25, 0, 0.13, 0)
    leftLine.Size = UDim2.new(0.391, 0, 0.005, 0)
    leftLine.Parent = leftPanel

    local leftText = Instance.new("TextLabel")
    leftText.Name = "TabText"
    leftText.AnchorPoint = Vector2.new(0.5, 0.5)
    leftText.BackgroundTransparency = 1
    leftText.Position = UDim2.new(0.45, 0, 0.07, 0)
    leftText.Size = UDim2.new(0.782, 0, 0.1, 0)
    leftText.Font = Enum.Font.SourceSans
    leftText.Text = "Tab"
    leftText.TextColor3 = Color3.fromRGB(255, 255, 255)
    leftText.TextScaled = true
    leftText.TextWrapped = true
    leftText.TextXAlignment = Enum.TextXAlignment.Left
    leftText.Parent = leftPanel

    -- Right panel example
    local rightPanel = Instance.new("Frame")
    rightPanel.Name = "RightExample"
    rightPanel.AnchorPoint = Vector2.new(0.5, 0.5)
    rightPanel.BackgroundColor3 = Color3.fromRGB(23, 23, 29)
    rightPanel.BorderSizePixel = 0
    rightPanel.Position = UDim2.new(0.75, 0, 0.5, 0)
    rightPanel.Size = UDim2.new(0.45, 0, 0.9, 0)
    rightPanel.Parent = contentFrame

    local rightCorner = Instance.new("UICorner")
    rightCorner.Parent = rightPanel

    local rightLine = Instance.new("Frame")
    rightLine.Name = "Line"
    rightLine.AnchorPoint = Vector2.new(0.5, 0.5)
    rightLine.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    rightLine.BackgroundTransparency = 0.55
    rightLine.BorderSizePixel = 0
    rightLine.Position = UDim2.new(0.75, 0, 0.13, 0)
    rightLine.Size = UDim2.new(0.391, 0, 0.005, 0)
    rightLine.Parent = rightPanel

    local rightText = Instance.new("TextLabel")
    rightText.Name = "TabText"
    rightText.AnchorPoint = Vector2.new(0.5, 0.5)
    rightText.BackgroundTransparency = 1
    rightText.Position = UDim2.new(0.52, 0, 0.07, 0)
    rightText.Size = UDim2.new(0.782, 0, 0.1, 0)
    rightText.Font = Enum.Font.SourceSans
    rightText.Text = "Tab"
    rightText.TextColor3 = Color3.fromRGB(255, 255, 255)
    rightText.TextScaled = true
    rightText.TextWrapped = true
    rightText.TextXAlignment = Enum.TextXAlignment.Right
    rightText.Parent = rightPanel

    -- Tab button example (hidden template)
    local tabButton = Instance.new("TextButton")
    tabButton.Name = "TabButtonExample"
    tabButton.BackgroundTransparency = 1
    tabButton.Size = UDim2.new(0, 200, 0, 50)
    tabButton.AutoButtonColor = false
    tabButton.Font = Enum.Font.SourceSans
    tabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    tabButton.TextScaled = true
    tabButton.TextWrapped = true
    tabButton.Visible = false
    tabButton.Parent = tabFrame

    return {
        MainWindow = main,
        CloseButton = close,
        TabFrame = tabFrame,
        ContentFrame = contentFrame,
        LeftPanel = leftPanel,
        RightPanel = rightPanel,
        TabButtonTemplate = tabButton
    }
end

return Exception
