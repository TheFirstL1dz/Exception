-- Create a simple and modular UI Library

-- Instance Builder: Helper function to create UI elements
local function createInstance(instanceType, properties)
    local instance = Instance.new(instanceType)
    for property, value in pairs(properties) do
        instance[property] = value
    end
    return instance
end

-- Create UI elements
local UI = {}

-- The main screen
UI.ScreenGui = function()
    return createInstance("ScreenGui", {
        Name = "UI_Library",
        Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui"),
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    })
end

-- Main frame for UI container
UI.MainFrame = function(parent)
    local frame = createInstance("Frame", {
        Name = "Main",
        Parent = parent,
        BackgroundColor3 = Color3.fromRGB(23, 23, 29),
        BorderSizePixel = 0,
        Size = UDim2.new(0.4, 0, 0.4, 0),
        Position = UDim2.new(0.5, 0, 0.5, 0),
        AnchorPoint = Vector2.new(0.5, 0.5)
    })
    createInstance("UICorner", { Parent = frame })
    return frame
end

-- Title label
UI.TitleLabel = function(parent)
    return createInstance("TextLabel", {
        Name = "Title",
        Parent = parent,
        BackgroundTransparency = 1,
        Font = Enum.Font.Oswald,
        Text = "Example Title",
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = 14,
        TextScaled = true,
        TextXAlignment = Enum.TextXAlignment.Left,
        Position = UDim2.new(0.18, 0, 0.95, 0),
        Size = UDim2.new(0.33, 0, 0.07, 0)
    })
end

-- Close button
UI.CloseButton = function(parent)
    local button = createInstance("TextButton", {
        Name = "Close",
        Parent = parent,
        BackgroundTransparency = 1,
        Font = Enum.Font.SourceSans,
        Text = "X",
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = 14,
        TextScaled = true,
        Position = UDim2.new(0.97, 0, 0.06, 0),
        Size = UDim2.new(0.05, 0, 0.1, 0),
        AutoButtonColor = false
    })
    button.MouseButton1Click:Connect(function()
        parent:Destroy()
    end)
    return button
end

-- Tab Frame (Container for tabs)
UI.TabFrame = function(parent)
    local frame = createInstance("Frame", {
        Name = "TabFrame",
        Parent = parent,
        BackgroundColor3 = Color3.fromRGB(28, 28, 35),
        BorderSizePixel = 0,
        Size = UDim2.new(0, 182, 0, 326),
        Position = UDim2.new(0, 0, 0.16, 0)
    })
    local grid = createInstance("UIGridLayout", {
        Parent = frame,
        SortOrder = Enum.SortOrder.LayoutOrder,
        CellSize = UDim2.new(0, 180, 0, 40)
    })
    return frame
end

-- Tab Button (Switch between tabs)
UI.TabButton = function(parent, text, callback)
    local button = createInstance("TextButton", {
        Name = "TabButton",
        Parent = parent,
        BackgroundTransparency = 1,
        Font = Enum.Font.SourceSans,
        Text = text,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = 14,
        TextScaled = true,
        Size = UDim2.new(0, 200, 0, 50),
        AutoButtonColor = false
    })
    button.MouseButton1Click:Connect(callback)
    return button
end

-- Checkbox (For toggling options)
UI.Checkbox = function(parent, title, callback)
    local frame = createInstance("Frame", {
        Name = "CheckboxFrame",
        Parent = parent,
        BackgroundTransparency = 1,
        Size = UDim2.new(0.998, 0, 0.183, 0)
    })

    local button = createInstance("TextButton", {
        Name = "CheckboxButton",
        Parent = frame,
        BackgroundColor3 = Color3.fromRGB(255, 0, 60),
        BorderSizePixel = 0,
        Size = UDim2.new(0, 30, 0, 30),
        Font = Enum.Font.SourceSans,
        Text = "",
        TextColor3 = Color3.fromRGB(0, 0, 0),
        TextSize = 14
    })
    local checkboxTitle = createInstance("TextLabel", {
        Name = "CheckboxTitle",
        Parent = frame,
        BackgroundTransparency = 1,
        Font = Enum.Font.SourceSans,
        Text = title,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = 14,
        TextWrapped = true,
        TextXAlignment = Enum.TextXAlignment.Left,
        Position = UDim2.new(0.6, 0, 0.5, 0),
        Size = UDim2.new(0.83, 0, 0.7, 0)
    })

    button.MouseButton1Click:Connect(function()
        local isChecked = button.BackgroundColor3 == Color3.fromRGB(255, 0, 60)
        button.BackgroundColor3 = isChecked and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 60)
        if callback then
            callback(isChecked)
        end
    end)

    return frame
end

-- Button (A clickable button)
UI.Button = function(parent, title, callback)
    local frame = createInstance("Frame", {
        Name = "ButtonFrame",
        Parent = parent,
        BackgroundTransparency = 1,
        Size = UDim2.new(0.998, 0, 0.183, 0)
    })
    
    local buttonTitle = createInstance("TextLabel", {
        Name = "ButtonTitle",
        Parent = frame,
        BackgroundTransparency = 1,
        Font = Enum.Font.SourceSans,
        Text = title,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = 14,
        TextWrapped = true,
        TextXAlignment = Enum.TextXAlignment.Left,
        Size = UDim2.new(0.83, 0, 0.7, 0)
    })

    local button = createInstance("TextButton", {
        Name = "Button",
        Parent = frame,
        BackgroundColor3 = Color3.fromRGB(14, 255, 187),
        BorderSizePixel = 0,
        Position = UDim2.new(0.75, 0, 0.5, 0),
        Size = UDim2.new(0.4, 0, 0.7, 0),
        Font = Enum.Font.SourceSans,
        Text = "",
        TextColor3 = Color3.fromRGB(0, 0, 0),
        TextSize = 14
    })
    
    button.MouseButton1Click:Connect(function()
        if callback then
            callback()
        end
    end)

    return frame
end

return UI
