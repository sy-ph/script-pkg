-- phantom forces
-- Made by someone else --
-- Uploaded by wut_lah / YeowEn --
-- For Phantom Forces --
-- ESP HACK --
-- Extra sensory perception means can see where are the players --
-- See thru wall & building hack --


local espRainbow = false
local espToggle = true


local library = loadstring(game:HttpGet("https://pastebin.com/raw/CkyR8ePz",true))()
local espwindow = library:CreateWindow("ESP")

espwindow:Section('Edited By everett#9541')

espwindow:Bind("Toggled", {
   flag = "espToggle";
   kbonly = true;
   default = Enum.KeyCode.N;
}, function()
   if espToggle == true then espToggle = false elseif espToggle == false then espToggle = true end
end)

espwindow:Section('Settings:')

espwindow:Bind("Rainbow", {
   flag = "espRainbow";
   kbonly = true;
   default = Enum.KeyCode.M;
}, function()
   if espRainbow == true then espRainbow = false elseif espRainbow == false then espRainbow = true end
end)

local player = game.Players.LocalPlayer
local players = {} 
local core = game:GetService("CoreGui")

function zigzag(X) return math.acos(math.cos(X*math.pi))/math.pi end

local counter = 0

function CreateBillboard(adornee)
local billboard = Instance.new("BillboardGui")
billboard.Name = "E"
local frame = Instance.new("Frame")
billboard.AlwaysOnTop = true
billboard.Size = UDim2.new(4, 0, 5.5, 0)
billboard.StudsOffset = Vector3.new(0, 0, 0)
billboard.Adornee = adornee
if espRainbow then
	frame.BackgroundColor3 = Color3.fromHSV(zigzag(counter),1,1)
else 
	frame.BackgroundColor = BrickColor.new("Maroon")
end
frame.BackgroundTransparency = .35
frame.BorderSizePixel = 0
frame.Size = UDim2.new(1, 0, 1, 0)
billboard.Parent = core
frame.Parent = billboard
counter = counter + 0.0005
billboard.Parent = core
end

function GetEnemyPlayers()
players = {}
if #game:GetService("Teams"):GetTeams() > 0 then
local friendly = player.Team.Name
for i,v in pairs(game:GetService("Teams"):GetTeams()) do
if v.Name ~= friendly and v.Name ~= (game.Teams:FindFirstChild("Spectators") and game.Teams.Spectators.Name) then
local enemyPlayers = v:GetPlayers()
for i,v in pairs(enemyPlayers) do
table.insert(players, v)
end
end
end
return players
end
end

function InsertBillboardToPlayers()
for i,v in pairs(game:GetService("CoreGui"):GetChildren()) do if v.Name == "E" then v:Destroy() end end
local otherTeamR
if game.Players.LocalPlayer.Team ~= nil then
	if game.Players.LocalPlayer.Team.Name == "Ghosts" then
		otherTeamR = "Phantoms"
	elseif game.Players.LocalPlayer.Team.Name == "Phantoms" then
		otherTeamR = "Ghosts"
	end
end

local players = game.Workspace:FindFirstChild("Players")
local otherteam = players:FindFirstChild(otherTeamR)
for i,v in pairs(otherteam:GetChildren()) do
CreateBillboard(v.Torso)
end
end

if espToggle then
InsertBillboardToPlayers()
end

game.Players.PlayerAdded:Connect(function(plr)
plr.CharacterAdded:Wait()
players = GetEnemyPlayers()
if espToggle then
InsertBillboardToPlayers()
else
for i,v in pairs(game:GetService("CoreGui"):GetChildren()) do if v.Name == "E" then v:Destroy() end end
end
end)

game.Players.PlayerRemoving:Connect(function(plr)
plr.CharacterRemoving:Wait()
players = GetEnemyPlayers()
if espToggle then
InsertBillboardToPlayers()
else
for i,v in pairs(game:GetService("CoreGui"):GetChildren()) do if v.Name == "E" then v:Destroy() end end
end
end)

game:GetService('RunService').Stepped:Connect(function()
if espToggle then
InsertBillboardToPlayers()
else
for i,v in pairs(game:GetService("CoreGui"):GetChildren()) do if v.Name == "E" then v:Destroy() end end
end
end)