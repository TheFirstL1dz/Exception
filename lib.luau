local ExceptionUI = {}
ExceptionUI.__index = ExceptionUI

-- Library initialization
function ExceptionUI.new()
    local self = setmetatable({}, ExceptionUI)
    
    -- Create main UI elements
    self.gui = Instance.new("ScreenGui")
    self.gui.Name = "Exception"
    self.gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    self.gui.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
    
    -- Clone all the provided elements
    self.main = script.Main:Clone()
    self.main.Parent = self.gui
    
    -- Set up references to key elements
    self.tabFrame = self.main.TabFrame
    self.contentFrame = self.main.TabFrame_2
    self.leftExample = self.contentFrame.LeftExample
    self.rightExample = self.contentFrame.RightExample
    
    -- Initialize tab system
    self.tabs = {}
    self.currentTab = nil
    
    -- Set up close button
    self.main.Close.MouseButton1Click:Connect(function()
        self:Toggle()
    end)
    
    -- Hide example elements
    self.tabFrame.TabButtonExample.Visible = false
    self.leftExample.ItemFrame.CheckboxExample.Visible = false
    self.leftExample.ItemFrame.ButtonExample.Visible = false
    
    -- Make draggable
    self:Dragify(self.main)
    
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
