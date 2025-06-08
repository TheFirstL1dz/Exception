local ExceptionUI = {}
ExceptionUI.__index = ExceptionUI

-- Library initialization
function ExceptionUI.new()
    local self = setmetatable({}, ExceptionUI)
    
    -- Create main UI elements using the properties you provided
    self.gui = Instance.new("ScreenGui")
    self.gui.Name = "Exception"
    self.gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    
    -- Create Main frame
    self.main = Instance.new("Frame")
    self.main.Name = "Main"
    self.main.AnchorPoint = Vector2.new(0.5, 0.5)
    self.main.BackgroundColor3 = Color3.fromRGB(23, 23, 29)
    self.main.BorderSizePixel = 0
    self.main.Position = UDim2.new(0.5, 0, 0.5, 0)
    self.main.Size = UDim2.new(0.4, 0, 0.4, 0)
    self.main.Parent = self.gui
    
    -- Add UICorner
    local mainCorner = Instance.new("UICorner")
    mainCorner.CornerRadius = UDim.new(0, 9)
    mainCorner.Parent = self.main
    
    -- Add Logo
    local logo = Instance.new("ImageLabel")
    logo.Name = "Logo"
    logo.AnchorPoint = Vector2.new(0.5, 0.5)
    logo.BackgroundTransparency = 1
    logo.Position = UDim2.new(0.04, 0, 0.08, 0)
    logo.Size = UDim2.new(0.3, 0, 0.3, 0)
    logo.Image = "rbxassetid://94099000985882"
    logo.Parent = self.main
    
    -- Add Title
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
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.Parent = self.main
    
    -- Add Close button
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
    close.Parent = self.main
    
    -- Create TabFrame (left side)
    self.tabFrame = Instance.new("Frame")
    self.tabFrame.Name = "TabFrame"
    self.tabFrame.BackgroundColor3 = Color3.fromRGB(28, 28, 35)
    self.tabFrame.BorderSizePixel = 0
    self.tabFrame.Position = UDim2.new(0, 0, 0.164, 0)
    self.tabFrame.Size = UDim2.new(0, 182, 0, 326)
    self.tabFrame.Parent = self.main
    
    local tabCorner = Instance.new("UICorner")
    tabCorner.Parent = self.tabFrame
    
    local tabLayout = Instance.new("UIGridLayout")
    tabLayout.SortOrder = Enum.SortOrder.LayoutOrder
    tabLayout.CellSize = UDim2.new(0, 180, 0, 40)
    tabLayout.Parent = self.tabFrame
    
    -- Create Content Frame (right side)
    self.contentFrame = Instance.new("Frame")
    self.contentFrame.Name = "TabFrame"
    self.contentFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    self.contentFrame.BackgroundColor3 = Color3.fromRGB(28, 28, 35)
    self.contentFrame.BorderSizePixel = 0
    self.contentFrame.Position = UDim2.new(0.62, 0, 0.54, 0)
    self.contentFrame.Size = UDim2.new(0.74, 0, 0.7, 0)
    self.contentFrame.Parent = self.main
    
    local contentCorner = Instance.new("UICorner")
    contentCorner.Parent = self.contentFrame
    
    -- Create Left Example (will be cloned for left tabs)
    self.leftExample = Instance.new("Frame")
    self.leftExample.Name = "LeftExample"
    self.leftExample.AnchorPoint = Vector2.new(0.5, 0.5)
    self.leftExample.BackgroundColor3 = Color3.fromRGB(23, 23, 29)
    self.leftExample.BorderSizePixel = 0
    self.leftExample.Position = UDim2.new(0.25, 0, 0.5, 0)
    self.leftExample.Size = UDim2.new(0.45, 0, 0.9, 0)
    self.leftExample.Visible = false
    
    local leftCorner = Instance.new("UICorner")
    leftCorner.Parent = self.leftExample
    
    local line = Instance.new("Frame")
    line.Name = "Line"
    line.AnchorPoint = Vector2.new(0.5, 0.5)
    line.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    line.BackgroundTransparency = 0.55
    line.BorderSizePixel = 0
    line.Position = UDim2.new(0.25, 0, 0.13, 0)
    line.Size = UDim2.new(0.391, 0, 0.005, 0)
    line.Parent = self.leftExample
    
    local tabText = Instance.new("TextLabel")
    tabText.Name = "TabText"
    tabText.AnchorPoint = Vector2.new(0.5, 0.5)
    tabText.BackgroundTransparency = 1
    tabText.Position = UDim2.new(0.45, 0, 0.07, 0)
    tabText.Size = UDim2.new(0.782, 0, 0.1, 0)
    tabText.Font = Enum.Font.SourceSans
    tabText.Text = "Tab"
    tabText.TextColor3 = Color3.fromRGB(255, 255, 255)
    tabText.TextScaled = true
    tabText.TextXAlignment = Enum.TextXAlignment.Left
    tabText.Parent = self.leftExample
    
    local itemFrame = Instance.new("Frame")
    itemFrame.Name = "ItemFrame"
    itemFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    itemFrame.BackgroundTransparency = 1
    itemFrame.Position = UDim2.new(0.5, 0, 0.56, 0)
    itemFrame.Size = UDim2.new(0.94, 0, 0.8, 0)
    itemFrame.Parent = self.leftExample
    
    local itemLayout = Instance.new("UIGridLayout")
    itemLayout.SortOrder = Enum.SortOrder.LayoutOrder
    itemLayout.CellSize = UDim2.new(0, 240, 0, 40)
    itemLayout.Parent = itemFrame
    
    -- Create Checkbox Example (hidden template)
    local checkboxExample = Instance.new("Frame")
    checkboxExample.Name = "CheckboxExample"
    checkboxExample.BackgroundTransparency = 1
    checkboxExample.Size = UDim2.new(0.999, 0, 0.184, 0)
    checkboxExample.Visible = false
    checkboxExample.Parent = itemFrame
    
    local checkboxButton = Instance.new("TextButton")
    checkboxButton.Name = "CheckboxButton"
    checkboxButton.AnchorPoint = Vector2.new(0.5, 0.5)
    checkboxButton.BackgroundColor3 = Color3.fromRGB(255, 0, 60)
    checkboxButton.BorderSizePixel = 0
    checkboxButton.Position = UDim2.new(0.1, 0, 0.5, 0)
    checkboxButton.Size = UDim2.new(0, 30, 0, 30)
    checkboxButton.Font = Enum.Font.SourceSans
    checkboxButton.Text = ""
    checkboxButton.TextColor3 = Color3.fromRGB(0, 0, 0)
    checkboxButton.TextSize = 14
    checkboxButton.Parent = checkboxExample
    
    local checkboxCorner = Instance.new("UICorner")
    checkboxCorner.Parent = checkboxButton
    
    local checkboxTitle = Instance.new("TextLabel")
    checkboxTitle.Name = "CheckboxTitle"
    checkboxTitle.AnchorPoint = Vector2.new(0.5, 0.5)
    checkboxTitle.BackgroundTransparency = 1
    checkboxTitle.Position = UDim2.new(0.6, 0, 0.5, 0)
    checkboxTitle.Size = UDim2.new(0.833, 0, 0.7, 0)
    checkboxTitle.Font = Enum.Font.SourceSans
    checkboxTitle.Text = "Checkbox"
    checkboxTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    checkboxTitle.TextScaled = true
    checkboxTitle.TextXAlignment = Enum.TextXAlignment.Left
    checkboxTitle.Parent = checkboxExample
    
    -- Create Button Example (hidden template)
    local buttonExample = Instance.new("Frame")
    buttonExample.Name = "ButtonExample"
    buttonExample.BackgroundTransparency = 1
    buttonExample.Size = UDim2.new(0.999, 0, 0.184, 0)
    buttonExample.Visible = false
    buttonExample.Parent = itemFrame
    
    local buttonTitle = Instance.new("TextLabel")
    buttonTitle.Name = "ButtonTitle"
    buttonTitle.AnchorPoint = Vector2.new(0.5, 0.5)
    buttonTitle.BackgroundTransparency = 1
    buttonTitle.Position = UDim2.new(0.45, 0, 0.5, 0)
    buttonTitle.Size = UDim2.new(0.833, 0, 0.7, 0)
    buttonTitle.Font = Enum.Font.SourceSans
    buttonTitle.Text = "Button"
    buttonTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    buttonTitle.TextScaled = true
    buttonTitle.TextXAlignment = Enum.TextXAlignment.Left
    buttonTitle.Parent = buttonExample
    
    local button = Instance.new("TextButton")
    button.Name = "Button"
    button.AnchorPoint = Vector2.new(0.5, 0.5)
    button.BackgroundColor3 = Color3.fromRGB(14, 255, 187)
    button.BorderSizePixel = 0
    button.Position = UDim2.new(0.75, 0, 0.5, 0)
    button.Size = UDim2.new(0.4, 0, 0.7, 0)
    button.Font = Enum.Font.SourceSans
    button.TextColor3 = Color3.fromRGB(0, 0, 0)
    button.TextScaled = true
    button.Parent = buttonExample
    
    local buttonCorner = Instance.new("UICorner")
    buttonCorner.Parent = button
    
    -- Create Right Example (will be cloned for right tabs)
    self.rightExample = self.leftExample:Clone()
    self.rightExample.Name = "RightExample"
    self.rightExample.Position = UDim2.new(0.75, 0, 0.5, 0)
    self.rightExample.Visible = false
    
    local rightLine = self.rightExample:FindFirstChild("Line")
    if rightLine then
        rightLine.Position = UDim2.new(0.75, 0, 0.13, 0)
    end
    
    local rightTabText = self.rightExample:FindFirstChild("TabText")
    if rightTabText then
        rightTabText.Position = UDim2.new(0.52, 0, 0.07, 0)
        rightTabText.TextXAlignment = Enum.TextXAlignment.Right
    end
    
    -- Create Tab Button Example (hidden template)
    self.tabButtonExample = Instance.new("TextButton")
    self.tabButtonExample.Name = "TabButtonExample"
    self.tabButtonExample.BackgroundTransparency = 1
    self.tabButtonExample.Size = UDim2.new(0, 200, 0, 50)
    self.tabButtonExample.AutoButtonColor = false
    self.tabButtonExample.Font = Enum.Font.SourceSans
    self.tabButtonExample.TextColor3 = Color3.fromRGB(255, 255, 255)
    self.tabButtonExample.TextScaled = true
    self.tabButtonExample.Visible = false
    
    -- Initialize tab system
    self.tabs = {}
    self.currentTab = nil
    
    -- Set up close button
    close.MouseButton1Click:Connect(function()
        self:Toggle()
    end)
    
    -- Make draggable
    self:Dragify(self.main)
    
    -- Parent to PlayerGui
    self.gui.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
    
    return self
end

-- Make window draggable
function ExceptionUI:Dragify(frame)
    local dragToggle = nil
    local dragSpeed = 0.25
    local dragStart = nil
    local startPos = nil

    local function updateInput(input)
        local delta = input.Position - dragStart
        local position = UDim2.new(
            startPos.X.Scale, 
            startPos.X.Offset + delta.X, 
            startPos.Y.Scale, 
            startPos.Y.Offset + delta.Y
        )
        frame.Position = position
    end

    frame.InputBegan:Connect(function(input)
        if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then
            dragToggle = true
            dragStart = input.Position
            startPos = frame.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragToggle = false
                end
            end)
        end
    end)

    game:GetService("UserInputService").InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            if dragToggle then
                updateInput(input)
            end
        end
    end)
end

-- Toggle UI visibility
function ExceptionUI:Toggle()
    self.gui.Enabled = not self.gui.Enabled
end

-- Tab management
function ExceptionUI:CreateTab(name, side)
    side = side or "left" -- default to left side
    
    -- Create tab button
    local tabButton = self.tabFrame.TabButtonExample:Clone()
    tabButton.Name = name
    tabButton.Text = name
    tabButton.Visible = true
    tabButton.Parent = self.tabFrame
    
    -- Create content container
    local contentContainer
    if side == "left" then
        contentContainer = self.leftExample:Clone()
        contentContainer.Name = name
        contentContainer.Parent = self.contentFrame
        contentContainer.Visible = false
    else
        contentContainer = self.rightExample:Clone()
        contentContainer.Name = name
        contentContainer.Parent = self.contentFrame
        contentContainer.Visible = false
    end
    
    -- Update tab text
    local tabText = contentContainer:FindFirstChild("TabText")
    if tabText then
        tabText.Text = name
    end
    
    -- Set up tab button click
    tabButton.MouseButton1Click:Connect(function()
        self:SwitchTab(name)
    end)
    
    -- Store tab data
    local tabData = {
        name = name,
        button = tabButton,
        container = contentContainer,
        side = side,
        items = {}
    }
    
    self.tabs[name] = tabData
    
    -- Set as current tab if first tab
    if not self.currentTab then
        self:SwitchTab(name)
    end
    
    return tabData
end

function ExceptionUI:SwitchTab(name)
    if not self.tabs[name] then return end
    
    -- Hide current tab
    if self.currentTab then
        self.currentTab.container.Visible = false
        self.currentTab.button.BackgroundTransparency = 1
    end
    
    -- Show new tab
    self.tabs[name].container.Visible = true
    self.tabs[name].button.BackgroundTransparency = 0.8
    self.currentTab = self.tabs[name]
end

-- UI Elements
function ExceptionUI:AddCheckbox(tabName, options)
    if not self.tabs[tabName] then return end
    
    local tab = self.tabs[tabName]
    local checkboxExample = tab.container.ItemFrame.CheckboxExample
    
    -- Create new checkbox
    local newCheckbox = checkboxExample:Clone()
    newCheckbox.Name = options.name or "Checkbox_"..tostring(#tab.items + 1)
    newCheckbox.Visible = true
    newCheckbox.Parent = tab.container.ItemFrame
    
    -- Update text
    local title = newCheckbox:FindFirstChild("CheckboxTitle")
    if title then
        title.Text = options.text or "Checkbox"
    end
    
    -- Set up functionality
    local button = newCheckbox:FindFirstChild("CheckboxButton")
    local isChecked = options.default or false
    
    local function updateVisual()
        button.BackgroundColor3 = isChecked and Color3.fromRGB(255, 0, 60) or Color3.fromRGB(100, 100, 100)
    end
    
    button.MouseButton1Click:Connect(function()
        isChecked = not isChecked
        updateVisual()
        if options.callback then
            options.callback(isChecked)
        end
    end)
    
    updateVisual()
    
    -- Store checkbox data
    local checkboxData = {
        name = options.name,
        instance = newCheckbox,
        value = isChecked,
        toggle = function(self, state)
            if state ~= nil then
                isChecked = state
            else
                isChecked = not isChecked
            end
            updateVisual()
        end
    }
    
    table.insert(tab.items, checkboxData)
    
    return checkboxData
end

function ExceptionUI:AddButton(tabName, options)
    if not self.tabs[tabName] then return end
    
    local tab = self.tabs[tabName]
    local buttonExample = tab.container.ItemFrame.ButtonExample
    
    -- Create new button
    local newButton = buttonExample:Clone()
    newButton.Name = options.name or "Button_"..tostring(#tab.items + 1)
    newButton.Visible = true
    newButton.Parent = tab.container.ItemFrame
    
    -- Update text
    local title = newButton:FindFirstChild("ButtonTitle")
    if title then
        title.Text = options.text or "Button"
    end
    
    local button = newButton:FindFirstChild("Button")
    if button then
        button.Text = options.buttonText or "Execute"
    end
    
    -- Set up functionality
    if button and options.callback then
        button.MouseButton1Click:Connect(function()
            options.callback()
        end)
    end
    
    -- Store button data
    local buttonData = {
        name = options.name,
        instance = newButton
    }
    
    table.insert(tab.items, buttonData)
    
    return buttonData
end

-- Initialize the library
local library = ExceptionUI.new()

-- Example usage:
--[[
-- Create tabs
local leftTab = library:CreateTab("Main")
local rightTab = library:CreateTab("Settings", "right")

-- Add elements
library:AddCheckbox("Main", {
    name = "ExampleCheckbox",
    text = "Enable Feature",
    default = true,
    callback = function(value)
        print("Checkbox toggled:", value)
    end
})

library:AddButton("Main", {
    name = "ExampleButton",
    text = "Important Action",
    buttonText = "Run",
    callback = function()
        print("Button clicked!")
    end
})

library:AddCheckbox("Settings", {
    text = "Advanced Mode",
    callback = function(value)
        print("Advanced mode:", value)
    end
})
]]

return library
