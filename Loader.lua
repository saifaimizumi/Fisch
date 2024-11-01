--x2Real



local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local Window = Fluent:CreateWindow({
    Title = "Fisch[🎃] | Kurumi Hub",
    SubTitle = "",
    TabWidth = 160,
    Size = UDim2.fromOffset(510, 390),
    Acrylic = false, -- The blur may be detectable, setting this to false disables blur entirely
    Theme = "Amethyst",
    MinimizeKey = Enum.KeyCode.LeftControl -- Used when theres no MinimizeKeybind
})

--Fluent provides Lucide Icons https://lucide.dev/icons/ for the tabs, icons are optional
local Tabs = {
    Genaral = Window:AddTab({ Title = "Genaral", Icon = "home" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
}

local Options = Fluent.Options

do
    Fluent:Notify({
        Title = "Notification",
        Content = "Kurumi Hub running script",
        SubContent = "", -- Optional
        Duration = 10 -- Set to nil to make the notification not disappear
    })

end



local Toggle = Tabs.Genaral:AddToggle("MyToggle", {Title = "Auto Shake", Default = false })

    Toggle:OnChanged(function(Value)
        local PlayerGUI = game.Players.LocalPlayer:WaitForChild("PlayerGui")
local VirtualInputManager = game:GetService("VirtualInputManager")
local LocalPlayer = game.Players.LocalPlayer

local function shakeButton(button)
    if _G.autoshake then
        task.wait(0.1)
        local pos = button.AbsolutePosition
        local size = button.AbsoluteSize
        VirtualInputManager:SendMouseButtonEvent(pos.X + size.X / 2, pos.Y + size.Y / 2, 0, true, LocalPlayer, 0)
        VirtualInputManager:SendMouseButtonEvent(pos.X + size.X / 2, pos.Y + size.Y / 2, 0, false, LocalPlayer, 0)
    end
end

local function onChildAdded(GUI)
    if GUI:IsA("ScreenGui") and GUI.Name == "shakeui" then
        local safezone = GUI:FindFirstChild("safezone")
        if safezone then
            safezone.ChildAdded:Connect(function(child)
                if child:IsA("ImageButton") and child.Name == "button" then
                    shakeButton(child)
                end
            end)
        end
    end
end

local shakeUI = PlayerGUI:FindFirstChild("shakeui")
if shakeUI then onChildAdded(shakeUI) end

PlayerGUI.ChildAdded:Connect(onChildAdded)

Options.MyToggle:SetValue(false)


local Toggle = Tabs.Genaral:AddToggle("MyToggle", {Title = "AutoSell", Default = false })

Toggle:OnChanged(function(Value)
_G.Rewards = Value
if _G.Rewards then
     while _G.Rewards do wait()
          local args = {
               [1] = 1
           }
           
          game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("PlayRewards"):FireServer(unpack(args))
          
          local args = {
               [1] = 2
           }
          
          game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("PlayRewards"):FireServer(unpack(args))
          
          local args = {
               [1] = 3
           }
           
           game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("PlayRewards"):FireServer(unpack(args))
           
          
           local args = {
               [1] = 4
           }
           
           game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("PlayRewards"):FireServer(unpack(args))
           

           local args = {
               [1] = 5
           }
           
           game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("PlayRewards"):FireServer(unpack(args))
           

           local args = {
               [1] = 6
           }
           
           game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("PlayRewards"):FireServer(unpack(args))
          

           local args = {
               [1] = 7
           }
           
           game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("PlayRewards"):FireServer(unpack(args))

     end
end
end)

Options.MyToggle:SetValue(false)




local Toggle = Tabs.Genaral:AddToggle("MyToggle", {Title = "AntiAFK", Default = false })

    Toggle:OnChanged(function(Value)
        _G.antiAFK = Value

        while _G.antiAFK do wait(20)
    
        game:GetService'VirtualUser':Button1Down(Vector2.new(788, 547))
        
    end
    end)

    Options.MyToggle:SetValue(false)





    Tabs.Settings:AddButton({
        Title = "rejoin server",
        Description = "",
        Callback = function()
            local ts = game:GetService("TeleportService")
    
            local p = game:GetService("Players").LocalPlayer
            
             
            
            ts:Teleport(game.PlaceId, p)
        end
    })
    
    
                
-- Addons:
-- SaveManager (Allows you to have a configuration system)
-- InterfaceManager (Allows you to have a interface managment system)

-- Hand the library over to our managers
SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)

-- Ignore keys that are used by ThemeManager.
-- (we dont want configs to save themes, do we?)
SaveManager:IgnoreThemeSettings()

-- You can add indexes of elements the save manager should ignore
SaveManager:SetIgnoreIndexes({})

-- use case for doing it this way:
-- a script hub could have themes in a global folder
-- and game configs in a separate folder per game
InterfaceManager:SetFolder("FluentScriptHub")
SaveManager:SetFolder("FluentScriptHub/specific-game")

InterfaceManager:BuildInterfaceSection(Tabs.Settings)

Window:SelectTab(1)

Fluent:Notify({
    Title = "Notification",
    Content = "The script has been loading",
    Duration = 5
})

-- You can use the SaveManager:LoadAutoloadConfig() to load a config
-- which has been marked to be one that auto loads!
SaveManager:LoadAutoloadConfig()


--uitoggle

do
    local ToggleUI = game.CoreGui:FindFirstChild("MyToggle") 
    if ToggleUI then 
    ToggleUI:Destroy()
    end
end

local MyToggle = Instance.new("ScreenGui")
local ImageButton = Instance.new("ImageButton")
local UICorner = Instance.new("UICorner")

--Properties:

MyToggle.Name = "MyToggle"
MyToggle.Parent = game.CoreGui
MyToggle.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

ImageButton.Parent = MyToggle
ImageButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
ImageButton.BorderSizePixel = 0
ImageButton.Position = UDim2.new(0.156000003, 0, -0, 0)
ImageButton.Size = UDim2.new(0, 50, 0, 50)
ImageButton.Image = "rbxassetid://16731758728"
ImageButton.MouseButton1Click:Connect(function()
game.CoreGui:FindFirstChild("ScreenGui").Enabled = not game.CoreGui:FindFirstChild("ScreenGui").Enabled
end)


UICorner.CornerRadius = UDim.new(0, 10)
UICorner.Parent = ImageButton
