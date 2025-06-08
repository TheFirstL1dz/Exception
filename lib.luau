local Exception = {}

-- Default properties
Exception.Theme = {
    MainColor = Color3.fromRGB(23, 23, 29),
    SecondaryColor = Color3.fromRGB(28, 28, 35),
    TextColor = Color3.fromRGB(255, 255, 255),
    CornerRadius = UDim.new(0, 9)
}

-- Create a new window
function Exception:CreateWindow(options)
    local window = {}
    options = options or {}
    
    -- Create the main GUI
    local ExceptionGUI = Instance.new("ScreenGui")
    ExceptionGUI.Name = "Exception"
    ExceptionGUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    ExceptionGUI.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

    -- Main frame
    local Main = Instance.new("Frame")
    Main.Name = "Main"
    Main.Parent = ExceptionGUI
    Main.AnchorPoint = Vector2.new(0.5, 0.5)
    Main.BackgroundColor3 = self.Theme.MainColor
    Main.BorderSizePixel = 0
    Main.Position = options.Position or UDim2.new(0.5, 0, 0.5, 0)
    Main.Size = options.Size or UDim2.new(0.5, 0, 0.4, 0)

    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = self.Theme.CornerRadius
    UICorner.Parent = Main

    -- Logo
    local Logo = Instance.new("ImageLabel")
    Logo.Name = "Logo"
    Logo.Parent = Main
    Logo.AnchorPoint = Vector2.new(0.5, 0.5)
    Logo.BackgroundTransparency = 1
    Logo.Position = UDim2.new(0.04, 0, 0.08, 0)
    Logo.Size = UDim2.new(0.3, 0, 0.3, 0)
    Logo.Image = options.Logo or "rbxassetid://94099000985882"

    -- Title
    local Title = Instance.new("TextLabel")
    Title.Name = "Title"
    Title.Parent = Main
    Title.AnchorPoint = Vector2.new(0.5, 0.5)
    Title.BackgroundTransparency = 1
    Title.Position = UDim2.new(0.18, 0, 0.955, 0)
    Title.Size = UDim2.new(0.337, 0, 0.067, 0)
    Title.Font = Enum.Font.Oswald
    Title.Text = options.Title or "Exception.red"
    Title.TextColor3 = self.Theme.TextColor
    Title.TextScaled = true
    Title.TextWrapped = true
    Title.TextXAlignment = Enum.TextXAlignment.Left

    -- Close button
    local Close = Instance.new("TextButton")
    Close.Name = "Close"
    Close.Parent = Main
    Close.AnchorPoint = Vector2.new(0.5, 0.5)
    Close.BackgroundTransparency = 1
    Close.Position = UDim2.new(0.97, 0, 0.06, 0)
    Close.Size = UDim2.new(0.05, 0, 0.1, 0)
    Close.AutoButtonColor = false
    Close.Font = Enum.Font.SourceSans
    Close.Text = "X"
    Close.TextColor3 = self.Theme.TextColor
    Close.TextScaled = true
    Close.TextWrapped = true

    -- Tab frame
    local TabFrame = Instance.new("Frame")
    TabFrame.Name = "TabFrame"
    TabFrame.Parent = Main
    TabFrame.BackgroundColor3 = self.Theme.SecondaryColor
    TabFrame.BorderSizePixel = 0
    TabFrame.Position = UDim2.new(0, 0, 0.164, 0)
    TabFrame.Size = UDim2.new(0.19, 0, 0.755, 0)

    local UIGridLayout = Instance.new("UIGridLayout")
    UIGridLayout.Parent = TabFrame
    UIGridLayout.SortOrder = Enum.SortOrder.LayoutOrder
    UIGridLayout.CellSize = UDim2.new(0, 180, 0, 40)

    -- Store references
    window.GUI = ExceptionGUI
    window.MainFrame = Main
    window.TabFrame = TabFrame
    window.Tabs = {}

    -- Close button functionality
    Close.MouseButton1Click:Connect(function()
        ExceptionGUI:Destroy()
    end)

    -- Dragging functionality
    local UserInputService = game:GetService("UserInputService")
    local dragging
    local dragInput
    local dragStart
    local startPos

    local function update(input)
        local delta = input.Position - dragStart
        Main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end

    Main.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = Main.Position
            
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    Main.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            update(input)
        end
    end)

    -- Create tab function
    function window:CreateTab(tabName)
        local tab = {}
        tab.Name = tabName or "Tab"
        
        -- Tab button
        local TabButton = Instance.new("TextButton")
        TabButton.Name = tabName or "TabButton"
        TabButton.Parent = window.TabFrame
        TabButton.BackgroundTransparency = 1
        TabButton.Size = UDim2.new(0.989, 0, 0.123, 0)
        TabButton.AutoButtonColor = false
        TabButton.Font = Enum.Font.SourceSans
        TabButton.Text = tabName or "Tab"
        TabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        TabButton.TextScaled = true
        TabButton.TextWrapped = true
        
        -- Content frame
        local ContentFrame = Instance.new("Frame")
        ContentFrame.Name = tabName.."Content"
        ContentFrame.Parent = window.MainFrame
        ContentFrame.BackgroundTransparency = 1
        ContentFrame.Position = UDim2.new(0.2, 0, 0.164, 0)
        ContentFrame.Size = UDim2.new(0.79, 0, 0.755, 0)
        ContentFrame.Visible = false
        
        -- Store references
        tab.Button = TabButton
        tab.Content = ContentFrame
        
        -- Show this tab by default if it's the first one
        if #window.Tabs == 0 then
            ContentFrame.Visible = true
            TabButton.TextColor3 = Color3.fromRGB(255, 170, 0) -- Highlight color
        end
        
        -- Tab switching functionality
        TabButton.MouseButton1Click:Connect(function()
            for _, otherTab in pairs(window.Tabs) do
                otherTab.Content.Visible = false
                otherTab.Button.TextColor3 = self.Theme.TextColor
            end
            ContentFrame.Visible = true
            TabButton.TextColor3 = Color3.fromRGB(255, 170, 0)
        end)
        
        -- Add button creation functions to the tab
        function tab:CreateButton(options)
            local button = Instance.new("TextButton")
            button.Name = options.Name or "Button"
            button.Parent = tab.Content
            button.BackgroundColor3 = self.Theme.SecondaryColor
            button.Size = UDim2.new(0.9, 0, 0.1, 0)
            button.Position = options.Position or UDim2.new(0.05, 0, 0.05 + (#tab.Content:GetChildren() * 0.11), 0)
            button.Font = Enum.Font.SourceSans
            button.Text = options.Text or "Button"
            button.TextColor3 = self.Theme.TextColor
            button.TextScaled = true
            
            local UICorner = Instance.new("UICorner")
            UICorner.CornerRadius = UDim.new(0, 6)
            UICorner.Parent = button
            
            if options.Callback and type(options.Callback) == "function" then
                button.MouseButton1Click:Connect(options.Callback)
            end
            
            return button
        end
        
        -- Add to window tabs
        table.insert(window.Tabs, tab)
        
        return tab
    end
    
    return window
end

return Exception
