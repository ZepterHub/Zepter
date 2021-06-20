--if game.CoreGui.Zepter then game.CoreGui.Zepter:Destroy() end
repeat wait() until game:IsLoaded()
local library = loadstring(game:HttpGet("https://kierandapro.wtf/venyxui.lua"))()
local venyx = library.new("Zepter", 5013109572)

local players= game:GetService"Players"
local playerList = {}
local lp = players.LocalPlayer

-- themes
local themes = {
Background = Color3.fromRGB(24, 24, 24),
Glow = Color3.fromRGB(0, 0, 0),
Accent = Color3.fromRGB(10, 10, 10),
LightContrast = Color3.fromRGB(20, 20, 20),
DarkContrast = Color3.fromRGB(14, 14, 14),  
TextColor = Color3.fromRGB(255, 255, 255)
}

local required = {
    Booleans = {
        Noclip = false,
        InfiniteJump = false,
        AntiIsolation = false
    },
    
    services = {
        RunService = game:GetService("RunService"),
        marketplaceService = game:GetService("MarketplaceService")
    },
    LP = game.Players.LocalPlayer
}

function updateList()
    for i,v in next,players:GetPlayers() do 
        table.insert(playerList,tostring(v))
    end
end

updateList()

players.PlayerAdded:Connect(function(plr)
    table.insert(playerList,plr)
end)

players.PlayerRemoving:Connect(function(plr)
   playerList = {}
   updateList()
end)

local noclipConnection
    noclipConnection =
    required.services.RunService.Stepped:connect(
        function()
            if
            required.Booleans.Noclip and required.LP and required.LP.Character and
            required.LP.Character:findFirstChild("Humanoid")
            then
                for i, v in pairs(required.LP.Character:GetChildren()) do
                    if v:IsA("BasePart") then
                        v.CanCollide = false
                    end
                
            end
            end
    end
    )

    repeat wait() 
    until game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:findFirstChild("Head") and game.Players.LocalPlayer.Character:findFirstChild("Humanoid") 
    local mouse = game.Players.LocalPlayer:GetMouse() 
    repeat wait() until mouse
    local plr = game.Players.LocalPlayer 
    local torso = plr.Character.Head
    local flying = false
    local deb = true 
    local ctrl = {f = 0, b = 0, l = 0, r = 0} 
    local lastctrl = {f = 0, b = 0, l = 0, r = 0} 
    local maxspeed = 100 
    local speed = 0 

    function Fly() 
        local bg = Instance.new("BodyGyro", torso) 
        bg.P = 9e4 
        bg.maxTorque = Vector3.new(9e9, 9e9, 9e9) 
        bg.cframe = torso.CFrame 
        local bv = Instance.new("BodyVelocity", torso) 
        bv.velocity = Vector3.new(0,0.1,0) 
        bv.maxForce = Vector3.new(9e9, 9e9, 9e9) 
        repeat wait() 
            plr.Character.Humanoid.PlatformStand = true 
            if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then 
                speed = speed+50+(speed/maxspeed) 
                if speed > maxspeed then 
                    speed = maxspeed 
                end 
            elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then 
                speed = speed-50 
                if speed < 0 then 
                    speed = 0 
                end 
            end 
            if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then 
                bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f+ctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l+ctrl.r,(ctrl.f+ctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed 
                lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r} 
            elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then 
                bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f+lastctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l+lastctrl.r,(lastctrl.f+lastctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed 
            else 
                bv.velocity = Vector3.new(0,0.1,0) 
            end 
            bg.cframe = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f+ctrl.b)*50*speed/maxspeed),0,0) 
        until not flying 
        ctrl = {f = 0, b = 0, l = 0, r = 0} 
        lastctrl = {f = 0, b = 0, l = 0, r = 0} 
        speed = 0 
        bg:Destroy() 
        bv:Destroy() 
        plr.Character.Humanoid.PlatformStand = false 
    end
    mouse.KeyDown:connect(function(key) 
        if key:lower() == "w" then 
            ctrl.f = 1 
        elseif key:lower() == "s" then 
            ctrl.b = -1 
        elseif key:lower() == "a" then 
            ctrl.l = -1 
        elseif key:lower() == "d" then 
            ctrl.r = 1 
        end 
    end) 
    mouse.KeyUp:connect(function(key) 
        if key:lower() == "w" then 
            ctrl.f = 0 
        elseif key:lower() == "s" then 
            ctrl.b = 0 
        elseif key:lower() == "a" then 
            ctrl.l = 0 
        elseif key:lower() == "d" then 
            ctrl.r = 0 
        end
    end)
 
    
--pages
local LocalPlayerPage = venyx:addPage("LocalPlayer", 5012544693)
local GamePage = venyx:addPage("Game", 6979514736)
local AutoFarmsPage = venyx:addPage("Auto Farms")
local AutoQuest = venyx:addPage("Auto Quests")
local credits = venyx:addPage("Credits")

--sections
local LocalPlayer = LocalPlayerPage:addSection("LocalPlayer")
local section2 = LocalPlayerPage:addSection("Section 2")
local GamePart = GamePage:addSection("Game")
local FreeGamePasses = GamePage:addSection("Free Game Passes")
local Teleports = GamePage:addSection("Teleports")
local autofarms = AutoFarmsPage:addSection("Auto Farms")
local Quests = AutoQuest:addSection("Quests")


LocalPlayer:addSlider("WalkSpeed", 16, 16, 300, function(value)
game.Players.LocalPlayer.Character:FindFirstChild("Humanoid").WalkSpeed = value
end)

LocalPlayer:addSlider("JumpPower", 50, 50, 150, function(value)
game.Players.LocalPlayer.Character:FindFirstChild("Humanoid").JumpPower = value
end)


LocalPlayer:addKeybind("Toggle Keybind",
Enum.KeyCode.One,
function()
    if flying then
        flying = false
    elseif not flying then
        flying = true
        Fly()
    end
    print(flying)
end, function()
    print("Changed Keybind")
    end
)


LocalPlayer:addToggle("NoClip", nil, function(value)
            if required.Booleans.Noclip then
                required.Booleans.Noclip = false
            elseif not required.Booleans.Noclip then
                required.Booleans.Noclip = true
            end
    end,
    false
)


LocalPlayer:addToggle("Infinite Jump ", nil, function(value)
                if required.Booleans.InfiniteJump then
                required.Booleans.InfiniteJump = false
            elseif not required.Booleans.InfiniteJump then
                required.Booleans.InfiniteJump = true
            end
            game:GetService("UserInputService").JumpRequest:connect(function()
                if required.Booleans.InfiniteJump and required.LP and required.LP.Character and required.LP.Character:findFirstChild("Humanoid") then
                   game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")
                end
                   end)
end,
false
)

LocalPlayer:addButton("Button", function()
print("Clicked")
end)
LocalPlayer:addTextbox("Notification", "Default", function(value, focusLost)
print("Input", value)

if focusLost then
venyx:Notify("Title", value)
end
end)

section2:addKeybind("Toggle Keybind", Enum.KeyCode.One, function()
print("Activated Keybind")
venyx:toggle()
end, function()
print("Changed Keybind")
end)
section2:addColorPicker("ColorPicker", Color3.fromRGB(50, 50, 50))
section2:addColorPicker("ColorPicker2")
section2:addDropdown("Dropdown", {"Hello", "World", "Hello World", "Word", 1, 2, 3})
section2:addDropdown("Dropdown", {"Hello", "World", "Hello World", "Word", 1, 2, 3}, function(text)
print("Selected", text)
end)
section2:addButton("Button")

-- game
FreeGamePasses:addButton("Chicken Morph", function()
    game:GetService("Workspace").ChangeCharacter:FireServer("ChickenCharacter")
end)
FreeGamePasses:addButton("Fox Morph", function()
    game:GetService("Workspace").ChangeCharacter:FireServer("FoxCharacter")
end)
FreeGamePasses:addButton("Penguin Morph", function()
    game:GetService("Workspace").ChangeCharacter:FireServer("PenguinCharacter")
end)
GamePart:addToggle("Anti-Isolation", nil, function(value)
                if required.Booleans.AntiIsolation then
                required.Booleans.AntiIsolation = false
                elseif not required.Booleans.AntiIsolation then
                required.Booleans.AntiIsolation = true
                end
        if required.Booleans.AntiIsolation then
            repeat
            game.Workspace:FindFirstChild("Really blueZone").IsolationBeams:Destroy()
            game.Workspace:FindFirstChild("New YellerZone").IsolationBeams:Destroy()
            game.Workspace:FindFirstChild("WhiteZone").IsolationBeams:Destroy()
            game.Workspace:FindFirstChild("CamoZone").IsolationBeams:Destroy()
            game.Workspace:FindFirstChild("Really redZone").IsolationBeams:Destroy()
            game.Workspace:FindFirstChild("BlackZone").IsolationBeams:Destroy()
            game.Workspace:FindFirstChild("MagentaZone").IsolationBeams:Destroy()
            
            game.Workspace:FindFirstChild("Really blueZone").Lock:Destroy()
            game.Workspace:FindFirstChild("New YellerZone").Lock:Destroy()
            game.Workspace:FindFirstChild("WhiteZone").Lock:Destroy()
            game.Workspace:FindFirstChild("CamoZone").Lock:Destroy()
            game.Workspace:FindFirstChild("Really redZone").Lock:Destroy()
            game.Workspace:FindFirstChild("BlackZone").Lock:Destroy()
            game.Workspace:FindFirstChild("MagentaZone").Lock:Destroy()
            until not required.Booleans.AntiIsolation
end
end)

local tplocationback = {}
Teleports:addButton("Save Last Location", function()
    tplocationback = {
        [1] = lp.Character.HumanoidRootPart.Position
    }
    print(tplocationback[1])
end)
Teleports:addButton("Teleport Back To Your Last Saved Location", function()
lp.Character.HumanoidRootPart.CFrame = CFrame.new(tplocationback[1])
print(tplocationback[1])
end)

Teleports:addDropdown("Team Teleports", {"Pink Team", "Black Team", "White Team", "Green Team", "Yellow Team", "Blue Team", "Red Team"}, function(text)
local player = game.Players.LocalPlayer
if text == "Pink Team" then
     player.Character.HumanoidRootPart.CFrame = CFrame.new(407.851257, -9.70000076, 647.543518)
elseif text == "Black Team" then
     player.Character.HumanoidRootPart.CFrame = CFrame.new(-505.00528, -9.70000172, -69.7606049)
elseif text == "White Team" then
     player.Character.HumanoidRootPart.CFrame = CFrame.new(-49.6760216, -9.70000076, -528.089478)
elseif text == "Green Team" then
     player.Character.HumanoidRootPart.CFrame = CFrame.new(-503.715302, -9.70000172, 293.109589)
elseif text == "Yellow Team" then
     player.Character.HumanoidRootPart.CFrame = CFrame.new(-490.941681, -9.70000172, 640.740234)
elseif text == "Blue Team" then
     player.Character.HumanoidRootPart.CFrame = CFrame.new(415.813843, -9.70000076, 300.507477)
elseif text == "Red Team" then
     player.Character.HumanoidRootPart.CFrame = CFrame.new(402.262299, -9.70000076, -64.1650085)
    end
end)
Teleports:addDropdown("Misc", {"Secret Area", "Water Fall", "Chest"}, function(text)
    local player = game.Players.LocalPlayer
    if text == "Secret Area" then
        player.Character.HumanoidRootPart.CFrame = CFrame.new(266.886658, -11.4400835, 1158.99963)
        player.Character.UpperTorso.Anchored = true
        wait(1)
        player.Character.UpperTorso.Anchored = false
    elseif text == "Water Fall" then
        player.Character.HumanoidRootPart.CFrame = CFrame.new(-51.5662689, 39.6199951, 8812.69434)
    elseif text == "Chest" then
        player.Character.HumanoidRootPart.CFrame = CFrame.new(-58.1661339, -360.404236, 9445.65332)
        end
    end)
local function tp(cf)
    lp.Character.HumanoidRootPart.CFrame = CFrame.new(cf)
end
   
local target
Teleports:addDropdown(playerList[1], {unpack(playerList)},function(plr)
    target = plr
    for i,v in next,players:GetPlayers() do 
        if tostring(v) == tostring(target) then 
            if v.Character and v.Character:FindFirstChild("HumanoidRootPart") then 
                tp(v.Character.HumanoidRootPart.CFrame.p)
            end
        end
    end
end)


    
    --third page
    autofarms:addToggle("Gold Farm 1 (Normal Speed)", nil, function(value)
        if value then
            if not game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                wait(20)
            else
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-40.938282, 39.9491692, 1376.95056)
                wait(1)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-71.0553055, 39.9491692, 2133.87329)
                wait(1)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-90.7048721, 39.9491692, 2913.69385)
                wait(1)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-40.3703117, 39.9491692, 3679.47949)
                wait(1)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-71.9135437, 39.9491692, 4447.48877)
                wait(1)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-69.7151413, 39.9491692, 5217.50928)
                wait(1)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-106.750626, 39.9491692, 5990.0415)
                wait(1)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-105.073509, 39.9491692, 6761.18799)
                wait(1)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-66.6984787, 39.9491692, 7526.50928)
                wait(1)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-78.8796921, 39.9491692, 8300.21387)
                wait(1)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-56.3610268, -356.102051, 9495.7373)
                wait(16)
                end
            end
    end,
    false
)
    
    autofarms:addToggle("Gold Farm 2 (Fast)",
        nil,
        function(value)
            if value then
        if not game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        wait(20)
    else
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-40.938282, 39.9491692, 1376.95056)
        wait(0.5)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-71.0553055, 39.9491692, 2133.87329)
        wait(0.5)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-90.7048721, 39.9491692, 2913.69385)
        wait(0.5)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-40.3703117, 39.9491692, 3679.47949)
        wait(0.5)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-71.9135437, 39.9491692, 4447.48877)
        wait(0,5)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-69.7151413, 39.9491692, 5217.50928)
        wait(0.5)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-106.750626, 39.9491692, 5990.0415)
        wait(0.5)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-105.073509, 39.9491692, 6761.18799)
        wait(0.5)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-66.6984787, 39.9491692, 7526.50928)
        wait(0.5)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-78.8796921, 39.9491692, 8300.21387)
        wait(0.5)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-56.3610268, -356.102051, 9495.7373)
        wait(16)
        end
end
end,
false
)

    autofarms:addToggle("Gold Farm 3 (Slow)", 
    nil, 
    function(value)
        if value then
         if not game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                wait(20)
         else
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-40.938282, 39.9491692, 1376.95056)
                wait(2.5)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-71.0553055, 39.9491692, 2133.87329)
                wait(2.5)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-90.7048721, 39.9491692, 2913.69385)
                wait(2.5)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-40.3703117, 39.9491692, 3679.47949)
                wait(2.5)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-71.9135437, 39.9491692, 4447.48877)
                wait(2.5)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-69.7151413, 39.9491692, 5217.50928)
                wait(2.5)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-106.750626, 39.9491692, 5990.0415)
                wait(2.5)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-105.073509, 39.9491692, 6761.18799)
                wait(2.5)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-66.6984787, 39.9491692, 7526.50928)
                wait(2.5)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-78.8796921, 39.9491692, 8300.21387)
                wait(2.5)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-56.3610268, -356.102051, 9495.7373)
                wait(16)
            end
        end
    end,
    false
)
    autofarms:addToggle("Gold Block Farm", 
    nil, 
    function(value)
        if value then
           if not game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
               wait(20)
               else
                   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-45.8771515, 48.0415802, 2137.98218)
                   wait(0.7)
                   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-55.8625717, 47.385437, 3682.37012)
                   wait(0.7)
                   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-50.3793869, 39.05933, 5219.32861)
                   wait(0.7)
                   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-45.9186287, 26.6014977, 6769.38037)
                   wait(0.7)
                   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-21.0466461, 36.8076859, 8300.7168)
                   wait (0.7)
                   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-58.5168648, 26.7542458, 8555.91699)
                   wait(0.7)
                   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-56.3610268, -356.102051, 9495.7373)
                   wait(16)
           end
                    end
        end,
        false
    )
--auto quests
Quests:addButton("Ramp Quest", function()
    if required.LP and required.LP.Character and required.LP.Character:findFirstChild("Humanoid") then
    local lastlocation = {
        [1] = lp.Character.HumanoidRootPart.Position
    }
    local args = {
        [1] = 3
    }
game.Workspace.QuestMakerEvent:FireServer(unpack(args))
if lp.Team.Name == "green" then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-206.88000488281, 67.541366577148, 278.83642578125)
elseif lp.Team.Name == "yellow" then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-206.72593688965, 74.924362182617, 636.10107421875)
elseif lp.Team.Name == "white" then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-206.88000488281, 67.541366577148, 278.83642578125)
elseif lp.Team.Name == "magenta" then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(98.083137512207, 73.710998535156, 651.62487792969)
elseif lp.Team.Name == "black" then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-207.66595458984, 87.889602661133, -79.166473388672)
elseif lp.Team.Name == "red" then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(98.947555541992, 89.278816223145, -68.505058288574)
elseif lp.Team.Name == "blue" then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(99.800132751465, 75.583023071289, 293.76126098633)
end
print(lastlocation[1])
wait(1.5)
lp.Character.HumanoidRootPart.CFrame = CFrame.new(lastlocation[1])
lastlocation = {}
end
end
)
Quests:addButton("Cloud Quest", function()
    if required.LP and required.LP.Character and required.LP.Character:findFirstChild("Humanoid") then
    local lastlocation = {
        [1] = lp.Character.HumanoidRootPart.Position
    }
    local args = {
        [1] = 1
    }
game.Workspace.QuestMakerEvent:FireServer(unpack(args))
if lp.Team.Name == "green" then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-793.60107421875, 679.65551757813, 291.43008422852)
elseif lp.Team.Name == "yellow" then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-833.57141113281, 591.19927978516, 656.25842285156)
elseif lp.Team.Name == "white" then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-559.708984375, 610.33044433594, -347.41278076172)
elseif lp.Team.Name == "magenta" then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-248.62182617188, 623.24194335938, 639.25994873047)
elseif lp.Team.Name == "black" then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-802.61370849609, 553.60076904297, -55.858108520508)
elseif lp.Team.Name == "red" then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-264.64987182617, 605.49627685547, -96.939849853516)
elseif lp.Team.Name == "blue" then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-282.6181640625, 595.87872314453, 258.66119384766)
end
wait(1.5)
 lp.Character.HumanoidRootPart.CFrame = CFrame.new(lastlocation[1])
 lastlocation = {}
end
end)


--credits
local CreditsArea = credits:addSection("Credits")
CreditsArea:addButton("Developer - KieranDaPro#9999")
CreditsArea:addButton("Ex Developer - Mew#3665")
CreditsArea:addButton("Developer - hiymi#8560")
CreditsArea:addButton("Helper - FindFirstAncestorツ#4476")
-- themes
local theme = venyx:addPage("Theme", 5012544693)
local colors = theme:addSection("Colors")

for theme, color in pairs(themes) do -- all in one theme changer, i know, im cool
colors:addColorPicker(theme, color, function(color3)
venyx:setTheme(theme, color3)
end)
end

-- load
venyx:SelectPage(venyx.pages[1], true)