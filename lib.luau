-- ExceptionUI Library

local ExceptionUI = {}

-- Create the main exception UI
function ExceptionUI.createMainUI(parent)
    -- Instances
    local Exception = Instance.new("ScreenGui")
    local Main = Instance.new("Frame")
    local UICorner = Instance.new("UICorner")
    local Logo = Instance.new("ImageLabel")
    local Title = Instance.new("TextLabel")
    local Close = Instance.new("TextButton")
    local TabFrame = Instance.new("Frame")
    local UIGridLayout = Instance.new("UIGridLayout")
    local TabButton = Instance.new("TextButton")

    -- Properties

    Exception.Name = "Exception"
    Exception.Parent = parent or game.Players.LocalPlayer:WaitForChild("PlayerGui")
    Exception.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    Main.Name = "Main"
    Main.Parent = Exception
    Main.AnchorPoint = Vector2.new(0.5, 0.5)
    Main.BackgroundColor3 = Color3.fromRGB(23, 23, 29)
    Main.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Main.BorderSizePixel = 0
    Main.Position = UDim2.new(0.5, 0, 0.5, 0)
    Main.Size = UDim2.new(0.5, 0, 0.400000006, 0)

    UICorner.CornerRadius = UDim.new(0, 9)
    UICorner.Parent = Main

    Logo.Name = "Logo"
    Logo.Parent = Main
    Logo.AnchorPoint = Vector2.new(0.5, 0.5)
    Logo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Logo.BackgroundTransparency = 1.000
    Logo.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Logo.BorderSizePixel = 0
    Logo.Position = UDim2.new(0.0399999991, 0, 0.0799999982, 0)
    Logo.Size = UDim2.new(0.300000012, 0, 0.300000012, 0)
    Logo.Image = "rbxassetid://94099000985882"

    Title.Name = "Title"
    Title.Parent = Main
    Title.AnchorPoint = Vector2.new(0.5, 0.5)
    Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Title.BackgroundTransparency = 1.000
    Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Title.BorderSizePixel = 0
    Title.Position = UDim2.new(0.180000022, 0, 0.954687536, 0)
    Title.Size = UDim2.new(0.336633652, 0, 0.0670136362, 0)
    Title.Font = Enum.Font.Oswald
    Title.Text = "Exception.red"
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.TextScaled = true
    Title.TextSize = 14.000
    Title.TextWrapped = true
    Title.TextXAlignment = Enum.TextXAlignment.Left

    Close.Name = "Close"
    Close.Parent = Main
    Close.AnchorPoint = Vector2.new(0.5, 0.5)
    Close.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Close.BackgroundTransparency = 1.000
    Close.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Close.BorderSizePixel = 0
    Close.Position = UDim2.new(0.970000029, 0, 0.0599999987, 0)
    Close.Size = UDim2.new(0.0500000007, 0, 0.100000001, 0)
    Close.AutoButtonColor = false
    Close.Font = Enum.Font.SourceSans
    Close.Text = "X"
    Close.TextColor3 = Color3.fromRGB(255, 255, 255)
    Close.TextScaled = true
    Close.TextSize = 14.000
    Close.TextWrapped = true

    TabFrame.Name = "TabFrame"
    TabFrame.Parent = Main
    TabFrame.BackgroundColor3 = Color3.fromRGB(28, 28, 35)
    TabFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TabFrame.BorderSizePixel = 0
    TabFrame.Position = UDim2.new(0, 0, 0.164351851, 0)
    TabFrame.Size = UDim2.new(0.189682126, 0, 0.754629612, 0)

    UIGridLayout.Parent = TabFrame
    UIGridLayout.SortOrder = Enum.SortOrder.LayoutOrder
    UIGridLayout.CellSize = UDim2.new(0, 180, 0, 40)

    TabButton.Name = "TabButton"
    TabButton.Parent = TabFrame
    TabButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TabButton.BackgroundTransparency = 1.000
    TabButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TabButton.BorderSizePixel = 0
    TabButton.Size = UDim2.new(0.98901099, 0, 0.122699387, 0)
    TabButton.AutoButtonColor = false
    TabButton.Font = Enum.Font.SourceSans
    TabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    TabButton.TextScaled = true
    TabButton.TextSize = 14.000
    TabButton.TextWrapped = true

    -- Close functionality
    Close.MouseButton1Click:Connect(function()
        Exception:Destroy()
    end)

    return Exception
end

-- Add a tab button to the tab frame
function ExceptionUI.addTabButton(parent, buttonText)
    local TabButton = Instance.new("TextButton")
    TabButton.Name = "TabButton"
    TabButton.Parent = parent
    TabButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TabButton.BackgroundTransparency = 1.000
    TabButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TabButton.BorderSizePixel = 0
    TabButton.Size = UDim2.new(0.98901099, 0, 0.122699387, 0)
    TabButton.AutoButtonColor = false
    TabButton.Font = Enum.Font.SourceSans
    TabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    TabButton.TextScaled = true
    TabButton.TextSize = 14.000
    TabButton.TextWrapped = true
    TabButton.Text = buttonText

    return TabButton
end

-- Function to add multiple tabs
function ExceptionUI.addMultipleTabs(tabFrame, buttonTexts)
    for _, text in ipairs(buttonTexts) do
        ExceptionUI.addTabButton(tabFrame, text)
    end
end

return ExceptionUI
