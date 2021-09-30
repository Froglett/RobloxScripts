getgenv().autoPowerup = false
getgenv().skyPlatform = false

getgenv().zombieKill = false
getgenv().bossKill = false

local p = game.Players.LocalPlayer
local c = p.Character
local hrp = c.HumanoidRootPart

local killtxt = "[put code here]"



function killZombie()
    spawn(function()
    while zombieKill == true do
        for i,v in pairs(game:GetService("Workspace").Zombies:GetChildren())do
            local hum = v:FindFirstChildOfClass("Humanoid")
            if hum and hum.Health > 0 and v:FindFirstChild("Head") then
            local ohString1 = killtxt
            local ohTable2 = {
            [1] = v.Head
            }
            local ohVector33 = v.Head.Position
            local ohBoolean4 = true
        game:GetService("ReplicatedStorage").RemoteEvent:FireServer(ohString1, ohTable2, ohVector33, ohBoolean4)
    end
end
wait(0.2)
end
end)
end


function killBoss()
    spawn(function()
    while bossKill == true do
        for i,v in pairs(game:GetService("Workspace").Map.BossFolder:GetChildren())do
            local hum = v:FindFirstChildOfClass("Humanoid")
            if hum and hum.Health > 0 and v:FindFirstChild("Head") then
              local mohString1 = killtxt
              local mohTable2 = {
              [1] = v.Head
              }
              local mohVector33 = v.Head.Position
              local mohBoolean4 = true
          
          game:GetService("ReplicatedStorage").RemoteEvent:FireServer(mohString1, mohTable2, mohVector33, mohBoolean4)
        end
end
wait(0.2)
end
end)
end








function autoPowers()
    spawn(function()

    while autoPowerup == true do
    for _,v in pairs(game:GetService("Workspace").PowerUps:GetChildren()) do
        v.CFrame = game:GetService"Players".LocalPlayer.Character:FindFirstChild"HumanoidRootPart".CFrame
    end
    wait(5)
    end
end)
end

function skyPlat()
    spawn(function()

        while skyPlatform == true do
        np = Instance.new("Part")
        np.Anchored = true
        np.Name = "platform"
        np.Parent = Workspace
        np.Size = Vector3.new(10, 2, 10)
        np.CFrame = CFrame.new(9999, 9999, 9999)
        
        snp = Instance.new("Part")
        snp.Anchored = true
        snp.Name = "undplatform"
        snp.Parent = Workspace
        snp.Size = Vector3.new(10, 2, 10)
        snp.CFrame = CFrame.new(9999, 9985, 9999)
        
        print("platforms created")
        wait(0.1)
        
        c.HumanoidRootPart.CFrame = np.CFrame + Vector3.new(0, 10, 0)
        
        wait(10)
        np:Destroy()
        snp:Destroy()
        print("platform deleted")
        
        end
end)
end

function singleSkyPlat()
    spawn(function()

        ssnp = Instance.new("Part")
        ssnp.Anchored = true
        ssnp.Name = "platform"
        ssnp.Parent = Workspace
        ssnp.Size = Vector3.new(30, 2, 30)
        ssnp.CFrame = CFrame.new(9999, 9999, 5555)
        
        isnp = Instance.new("Part")
        isnp.Anchored = true
        isnp.Name = "undplatform"
        isnp.Parent = Workspace
        isnp.Size = Vector3.new(30, 2, 30)
        isnp.CFrame = CFrame.new(9999, 9985, 5555)
        
        print("single platform created")
        wait(0.1)
        c.HumanoidRootPart.CFrame = ssnp.CFrame + Vector3.new(0, 10, 0)

    end)
end






function teleportTo(placeCFrame)
    local plr = game.Players.LocalPlayer
    if plr.Character then
    plr.Character.HumanoidRootPart.CFrame = placeCFrame
    end
end


function teleportperk(perk)

 if game:GetService("Workspace").Map.PerkMachines:FindFirstChild(perk) then
    teleportTo(game:GetService("Workspace").Map.PerkMachines[perk].Source.CFrame)
    end
end


function teleportOrb(orb)

    if game:GetService("Workspace").Map.Upgrades:FindFirstChild(orb) then
       teleportTo(game:GetService("Workspace").Map.Upgrades[orb].MeshPart.CFrame)
       end
end

function TPpap(pap)

    if game:GetService("Workspace").Map.Upgrades:FindFirstChild(pap) then
       teleportTo(game:GetService("Workspace").Map.Upgrades[pap].Green.CFrame)
       end
end

function TPbox(box)

    if game:GetService("Workspace").Map.Upgrades:FindFirstChild(box) then
       teleportTo(game:GetService("Workspace").Map.Upgrades[box].Key.CFrame)
       end
end







local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/AikaV3rm/UiLib/master/Lib.lua')))()

local w = library:CreateWindow("Zombie Uprising :)")

local b = w:CreateFolder("Main")

local c = w:CreateFolder("Killing")

local d = w:CreateFolder("Teleports")

local e = w:CreateFolder("Platforms")

local extras = w:CreateFolder("Extras")


b:Toggle("TP Powerups",function(bool)
    getgenv().autoPowerup = bool
    if bool then
        autoPowers()
    end
end)


c:Toggle("Kill Zombies",function(bool)
    getgenv().zombieKill = bool
    if bool then
        killZombie()
        print(bool)
    end
end)

c:Toggle("Kill Boss",function(bool)
    getgenv().bossKill = bool
    if bool then
        killBoss()
    end
end)



e:Button("Single Sky Platform",function()
    singleSkyPlat()
end)

e:Toggle("AFK Sky Platform",function(bool)
    getgenv().skyPlatform = bool
    if bool then
        skyPlat()
    end
end)






local selectedPerk

d:Dropdown("Perks",{"Bloxilicious Gum","Goala Cola","Witches Brew","Bloxy Cola","Juggerblox","Quick Revive"},true,function(value)
    selectedPerk = value
end)

d:Button("Teleport to Perk",function()
    if selectedPerk then
    teleportperk(selectedPerk)
    end
end)

local selectedOrb

d:Dropdown("Orbs",{"Blue","Green","Purple","Red"},true,function(value)
    selectedOrb = value
end)

d:Button("Teleport to Orb",function()
    if selectedOrb then
    teleportOrb(selectedOrb)
    end
end)

local PaP = "Upgrader"
local mbox = "MysteryBox"

d:Button("Teleport to PaP",function()
    if PaP then
    TPpap(PaP)
    end
end)

d:Button("Teleport to Box",function()
    if mbox then
    TPbox(mbox)
    end
end)


extras:DestroyGui()
