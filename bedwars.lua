
























































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































local SytroWaterMark = Instance.new("ScreenGui")
local TextLabel = Instance.new("TextButton")
local UIGradient = Instance.new("UIGradient")
local TextLabel_2 = Instance.new("TextLabel")
local UIGradient_2 = Instance.new("UIGradient")
local UITextSizeConstraint = Instance.new("UITextSizeConstraint")
local UITextSizeConstraint_2 = Instance.new("UITextSizeConstraint")

SytroWaterMark.Name = "SytroWaterMark"
SytroWaterMark.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
SytroWaterMark.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
SytroWaterMark.ResetOnSpawn = false

TextLabel.Parent = SytroWaterMark
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.BorderSizePixel = 0
TextLabel.Position = UDim2.new(-0.000772226602, 0, 0.0343558267, 0)
TextLabel.Size = UDim2.new(0.170134634, 0, 0.0700389072, 0)
TextLabel.Font = Enum.Font.GothamBold
TextLabel.Text = "NightUltraXPrivate"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextScaled = true
TextLabel.TextSize = 28.000
TextLabel.TextWrapped = true
TextLabel.TextXAlignment = Enum.TextXAlignment.Left
TextLabel.MouseButton1Down:Connect(function()
	print("gay")
end)

UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(126, 0, 0)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(209, 0, 0))}
UIGradient.Parent = TextLabel

TextLabel_2.Parent = TextLabel
TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_2.BackgroundTransparency = 1.000
TextLabel_2.BorderSizePixel = 0
TextLabel_2.Position = UDim2.new(-0.000772226602, 0, 0.67410934, 0)
TextLabel_2.Size = UDim2.new(1, 0, 1, 0)
TextLabel_2.Font = Enum.Font.GothamBold
TextLabel_2.Text = "V40"
TextLabel_2.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_2.TextScaled = true
TextLabel_2.TextSize = 24.000
TextLabel_2.TextWrapped = true
TextLabel_2.TextXAlignment = Enum.TextXAlignment.Left

UIGradient_2.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(126, 0, 0)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(209, 0, 0))}
UIGradient_2.Parent = TextLabel_2

UITextSizeConstraint.Parent = TextLabel_2
UITextSizeConstraint.MaxTextSize = 24

UITextSizeConstraint_2.Parent = TextLabel
UITextSizeConstraint_2.MaxTextSize = 27


local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:connect(function()
    vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    wait(1)
    vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)
 
game.StarterGui:SetCore("SendNotification", {
    Title = "Bedwars OP Script";
    Text = "Made by the Collector"; -- what the text says (ofc)
    Duration = 30;
})
wait(1)
game.StarterGui:SetCore("SendNotification", {
    Title = "Enjoy";
    Text = "Don't Forget to Subscribe the Collector"; -- what the text says (ofc)
    Duration = 30;
})





local players = game:GetService("Players")
local lplr = players.LocalPlayer
local oldchar = lplr.Character
local cam = workspace.CurrentCamera
local uis = game:GetService("UserInputService")
local KnitClient = debug.getupvalue(require(game.Players.LocalPlayer.PlayerScripts.TS.knit).setup, 6)
local Client = require(game:GetService("ReplicatedStorage").TS.remotes).default.Client
local InventoryUtil = require(game:GetService("ReplicatedStorage").TS.inventory["inventory-util"]).InventoryUtil
local itemstuff = debug.getupvalue(require(game:GetService("ReplicatedStorage").TS.item["item-meta"]).getItemMeta, 1)
local RenderStepTable = {}
local StepTable = {}
local connectioninfjump
local killauraswing = {["Enabled"] = true}
local killaurasound = {["Enabled"] = true}
local killaurahitdelay = {["Value"] = 2}
local killaurasoundval = {["Value"] = 1}
local speedval = {["Value"] = 1}
local testtogttt = {["Value"] = 20}
local ACC1
local ACC2
local antivoidtransparent = {["Value"] = 50}
local antivoidcolor = {["Hue"] = 0.93, ["Sat"] = 1, ["Value"] = 1}
local reachval = {["Value"] = 18}
local autoclick = {["Enabled"] = true}
local origC0 = game.ReplicatedStorage.Assets.Viewmodel.RightHand.RightWrist.C0
local killaurafirstpersonanim = {["Value"] = true}
local killauraanimval = {["Value"] = "Cool"}

local SprintCont = KnitClient.Controllers.SprintController
local SwordCont = KnitClient.Controllers.SwordController
local KnockbackTable = debug.getupvalue(require(game:GetService("ReplicatedStorage").TS.damage["knockback-util"]).KnockbackUtil.calculateKnockbackVelocity, 1)
local ClientHandler = Client

local function GetURL(scripturl)
	return game:HttpGet("https://raw.githubusercontent.com/7GrandLittleBrother/SytroNight4ROBLOX/main/"..scripturl, true)
end

local function isAlive(plr)
	if plr then
		return plr and plr.Character and plr.Character.Parent ~= nil and plr.Character:FindFirstChild("HumanoidRootPart") and plr.Character:FindFirstChild("Head") and plr.Character:FindFirstChild("Humanoid")
	end
	return lplr and lplr.Character and lplr.Character.Parent ~= nil and lplr.Character:FindFirstChild("HumanoidRootPart") and lplr.Character:FindFirstChild("Head") and lplr.Character:FindFirstChild("Humanoid")
end

local function runcode(func)
	func()
end

local function playsound(id, volume) 
	local sound = Instance.new("Sound")
	sound.Parent = workspace
	sound.SoundId = id
	sound.PlayOnRemove = true 
	if volume then 
		sound.Volume = volume
	end
	sound:Destroy()
end

local function playanimation(id) 
	if isAlive() then 
		local animation = Instance.new("Animation")
		animation.AnimationId = id
		local animatior = lplr.Character.Humanoid.Animator
		animatior:LoadAnimation(animation):Play()
	end
end

function isNumber(str)
	if tonumber(str) ~= nil or str == 'inf' then
		return true
	end
end

function getinv(plr)
	local plr = plr or lplr
	local thingy, thingytwo = pcall(function() return InventoryUtil.getInventory(plr) end)
	return (thingy and thingytwo or {
		items = {},
		armor = {},
		hand = nil
	})
end

function getsword()
	local sd
	local higherdamage
	local swordslots
	local swords = getinv().items
	for i, v in pairs(swords) do
		if v.itemType:lower():find("sword") or v.itemType:lower():find("blade") then
			if higherdamage == nil or itemstuff[v.itemType].sword.damage > higherdamage then
				sd = v
				higherdamage = itemstuff[v.itemType].sword.damage
				swordslots = i
			end
		end
	end
	return sd, swordslots
end

local function getremote(tab)
	for i,v in pairs(tab) do
		if v == "Client" then
			return tab[i + 1]
		end
	end
	return ""
end

local function hvFunc(cock)
	return {hashedval = cock}
end

local function targetCheck(plr, check)
	return (check and plr.Character.Humanoid.Health > 0 and plr.Character:FindFirstChild("ForceField") == nil or check == false)
end

local function isPlayerTargetable(plr, target)
	return plr ~= lplr and plr and isAlive(plr) and targetCheck(plr, target)
end

local function GetAllNearestHumanoidToPosition(distance, amount)
	local returnedplayer = {}
	local currentamount = 0
	if entity.isAlive then -- alive check
		for i, v in pairs(game.Players:GetChildren()) do -- loop through players
			if isPlayerTargetable((v), true, true, v.Character ~= nil) and v.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChild("Head") and currentamount < amount then -- checks
				local mag = (lplr.Character.HumanoidRootPart.Position - v.Character:FindFirstChild("HumanoidRootPart").Position).magnitude
				if mag <= distance then -- mag check
					table.insert(returnedplayer, v)
					currentamount = currentamount + 1
				end
			end
		end
		for i2,v2 in pairs(game:GetService("CollectionService"):GetTagged("Monster")) do -- monsters
			if v2:FindFirstChild("HumanoidRootPart") and currentamount < amount and v2.Name ~= "Duck" then -- no duck
				local mag = 
(lplr.Character.HumanoidRootPart.Position - v.Character:FindFirstChild("HumanoidRootPart").Position).magnitude
				if mag <= distance then -- mag check
					table.insert(returnedplayer, v)
					currentamount = currentamount + 1
				end
			end
		end
		for i2,v2 in pairs(game:GetService("CollectionService"):GetTagged("Monster")) do -- monsters
			if v2:FindFirstChild("HumanoidRootPart") and currentamount < amount and v2.Name ~= "Duck" then -- no duck
				local mag = (lplr.Character.HumanoidRootPart.Position - v2.HumanoidRootPart.Position).magnitude
				if mag <= distance then -- magcheck
					table.insert(returnedplayer, {Name = (v2 and v2.Name or "Monster"), UserId = 1443379645, Character = v2}) -- monsters are npcs so I have to create a fake player for target info
					currentamount = currentamount + 1
				end
			end
		end
	end
	return returnedplayer -- table of attackable entities
end

local function BindToRenderStep(name, num, func)
	if RenderStepTable[name] == nil then
		RenderStepTable[name] = game:GetService("RunService").RenderStepped:connect(func)
	end
end
local function UnbindFromRenderStep(name)
	if RenderStepTable[name] then
		RenderStepTable[name]:Disconnect()
		RenderStepTable[name] = nil
	end
end

local function BindToStepped(name, num, func)
	if StepTable[name] == nil then
		StepTable[name] = game:GetService("RunService").Stepped:connect(func)
	end
end
local function UnbindFromStepped(name)
	if StepTable[name] then
		StepTable[name]:Disconnect()
		StepTable[name] = nil
	end
end

local attackentitycont = Client:Get(getremote(debug.getconstants(getmetatable(KnitClient.Controllers.SwordController)["attackEntity"])))
local rgfejd = false
local DistVal = {["Value"] = 18}
function KillauraRemote()
	for i,v in pairs(game.Players:GetChildren()) do
		if v.Character and v.Name ~= game.Players.LocalPlayer.Name and v.Character:FindFirstChild("HumanoidRootPart") then
			local mag = (v.Character.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
			if mag <= DistVal["Value"] and v.Team ~= game.Players.LocalPlayer.Team and v.Character:FindFirstChild("Humanoid") then
				if v.Character.Humanoid.Health > 0 then
					rgfejd = true
					local GBW = getsword()
					local selfPosition = lplr.Character.HumanoidRootPart.Position + (DistVal["Value"] > 14 and (lplr.Character.HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).magnitude > 14 and (CFrame.lookAt(lplr.Character.HumanoidRootPart.Position, v.Character.HumanoidRootPart.Position).lookVector * 4) or Vector3.new(0, 0, 0))
					local Entity = v.Character
					local target = v.Character:GetPrimaryPartCFrame().Position
					attackentitycont:CallServer({
						["chargedAttack"] = {["chargeRatio"] = 1},
						["weapon"] = GBW ~= nil and GBW.tool,
						["entityInstance"] = Entity,
						["validate"] = {["targetPosition"] = {["value"] = target,
							["hash"] = hvFunc(target)},
						["raycast"] = {
							["cameraPosition"] = hvFunc(cam.CFrame.Position), 
							["cursorDirection"] = hvFunc(Ray.new(cam.CFrame.Position, v.Character:GetPrimaryPartCFrame().Position).Unit.Direction)
						},
						["selfPosition"] = {["value"] = selfPosition,
							["hash"] = hvFunc(selfPosition)
						}
						}
					})
					if killaurasound["Enabled"] then
						playsound("rbxassetid://6760544639", killaurasoundval["Value"])
					end
					if killauraswing["Enabled"] then
						playanimation("rbxassetid://4947108314")
					end
				end
			else
				rgfejd = false
			end
		end
	end
end

local itemtab = debug.getupvalue(require(game:GetService("ReplicatedStorage").TS.item["item-meta"]).getItemMeta, 1)
local CombatConstant = require(game:GetService("ReplicatedStorage").TS.combat["combat-constant"]).CombatConstant
local function getEquipped()
	local typetext = ""
	local obj = (entity.isAlive and lplr.Character:FindFirstChild("HandInvItem") and lplr.Character.HandInvItem.Value or nil)
	if obj then
		if obj.Name:find("sword") or obj.Name:find("blade") or obj.Name:find("baguette") or obj.Name:find("scythe") or obj.Name:find("dao") then
			typetext = "sword"
		end
		if obj.Name:find("wool") or itemtab[obj.Name]["block"] then
			typetext = "block"
		end
		if obj.Name:find("bow") then
			typetext = "bow"
		end
	end
	return {["Object"] = obj, ["Type"] = typetext}
end


function getbeds()
	local beds = {}
	local blocks = game:GetService("Workspace").Map.Blocks
	for _,Block in pairs(blocks:GetChildren()) do
		if Block.Name == "bed" and Block.Covers.BrickColor ~= game.Players.LocalPlayer.Team.TeamColor then
			table.insert(beds,Block)
		end
	end
	return beds
end

function getbedsblocks()
	local blockstb = {}
	local blocks = game:GetService("Workspace").Map.Blocks
	for i,v in pairs(blocks:GetChildren()) do
		if v:IsA("Part") then
			table.insert(blockstb,v)
		end
	end
	return blockstb
end

function blocks(bed)
	local aboveblocks = 0
	local Blocks = getbedsblocks()
	for _,Block in pairs(Blocks) do
		if Block.Position.X == bed.X and Block.Position.Z == bed.Z and Block.Name ~= "bed" and (Block.Position.Y - bed.Y) <= 9 and Block.Position.Y > bed.Y then
			aboveblocks = aboveblocks + 1
		end
	end
	return aboveblocks
end

function nuker()
	local beds = getbeds()
	for _,bed in pairs(beds) do
		local bedmagnitude = (bed.Position - game.Players.LocalPlayer.Character.PrimaryPart.Position).Magnitude
		if bedmagnitude < 27 then
			local upnum = blocks(bed.Position)
			local x = math.round(bed.Position.X/3)
			local y = math.round(bed.Position.Y/3) + upnum
			local z = math.round(bed.Position.Z/3)
			game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.DamageBlock:InvokeServer({
				["blockRef"] = {
					["blockPosition"] = Vector3.new(x,y,z)
				},
				["hitPosition"] = Vector3.new(x,y,z),
				["hitNormal"] = Vector3.new(x,y,z),
			})
		end
	end
end










local kavoUi = loadstring(game:HttpGet("https://raw.githubusercontent.com/EZEZEZEZZE/RektSky-Remake/main/Libraries/kavo.lua"))()
local window = kavoUi.CreateLib("NightX private", "BloodTheme")
local entity = loadstring(game:HttpGet("https://raw.githubusercontent.com/JustDxrk/Vxpe-Entity/main/Vxpe%20Entity", true))()
makefolder("hi")
    makefolder("hi/assets")
makefolder("hi/configs")

do
	local oldcharacteradded = entity.characterAdded
	entity.characterAdded = function(plr, char, localcheck)
		return oldcharacteradded(plr, char, localcheck, function() end)
	end
	entity.fullEntityRefresh()
end

local colorbox
local function makeRainbowText(text)
	spawn(function()
		colorbox = Color3.fromRGB(170,0,170)
		local x = 0
		while wait() do
			colorbox = Color3.fromHSV(x,1,1)
			x = x + 4.5/255
			if x >= 1 then
				x = 0
			end
		end
	end)
	spawn(function()
		repeat
			wait()
			text.TextColor3 = colorbox
		until true == false
	end)
end
-- Tab

local Combat = window:NewTab("Combat")
local CombatSection = Combat:NewSection("Combat")
local Blatant = window:NewTab("Blatant")
local BlatantSection = Blatant:NewSection("Blatant")
local Render = window:NewTab("Render")
local RenderSection = Render:NewSection("Render")
local Utlity = window:NewTab("Utlity")
local UtlitySection = Utlity:NewSection("Utlity")
local World = window:NewTab("World")
local WorldSection = World:NewSection("World")
local Private = window:NewTab("Private")
local PrivateSection = Private:NewSection("Private")
local Tab6 = window:NewTab("Animation")
local Tab6Section = Tab6:NewSection("Everyone Can See (Fe)")



CombatSection:NewToggle("KillAura", "Autoswing the sword if someone is near you", function(state)
    local Guitwo = game.CoreGui.RektskyNotificationGui

local function createnotification(title, text, delay2, toggled)
    spawn(function()
        if Guitwo:FindFirstChild("Background") then Guitwo:FindFirstChild("Background"):Destroy() end
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(0, 100, 0, 115)
        frame.Position = UDim2.new(0.5, 0, 0, -115)
        frame.BorderSizePixel = 0
        frame.AnchorPoint = Vector2.new(0.5, 0)
        frame.BackgroundTransparency = 0.5
        frame.BackgroundColor3 = Color3.new(0, 0, 0)
        frame.Name = "Background"
        frame.Parent = Guitwo
        local frameborder = Instance.new("Frame")
        frameborder.Size = UDim2.new(1, 0, 0, 8)
        frameborder.BorderSizePixel = 0
        frameborder.BackgroundColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frameborder.Parent = frame
        local frametitle = Instance.new("TextLabel")
        frametitle.Font = Enum.Font.SourceSansLight
        frametitle.BackgroundTransparency = 1
        frametitle.Position = UDim2.new(0, 0, 0, 30)
        frametitle.TextColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frametitle.Size = UDim2.new(1, 0, 0, 28)
        frametitle.Text = "          "..title
        frametitle.TextSize = 24
        frametitle.TextXAlignment = Enum.TextXAlignment.Left
        frametitle.TextYAlignment = Enum.TextYAlignment.Top
        frametitle.Parent = frame
        local frametext = Instance.new("TextLabel")
        frametext.Font = Enum.Font.SourceSansLight
        frametext.BackgroundTransparency = 1
        frametext.Position = UDim2.new(0, 0, 0, 68)
        frametext.TextColor3 = Color3.new(1, 1, 1)
        frametext.Size = UDim2.new(1, 0, 0, 28)
        frametext.Text = "          "..text
        frametext.TextSize = 24
        frametext.TextXAlignment = Enum.TextXAlignment.Left
        frametext.TextYAlignment = Enum.TextYAlignment.Top
        frametext.Parent = frame
        local textsize = game:GetService("TextService"):GetTextSize(frametitle.Text, frametitle.TextSize, frametitle.Font, Vector2.new(100000, 100000))
        local textsize2 = game:GetService("TextService"):GetTextSize(frametext.Text, frametext.TextSize, frametext.Font, Vector2.new(100000, 100000))
        if textsize2.X > textsize.X then textsize = textsize2 end
        frame.Size = UDim2.new(0, textsize.X + 38, 0, 115)
        pcall(function()
            frame:TweenPosition(UDim2.new(0.5, 0, 0, 20), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.15)
            game:GetService("Debris"):AddItem(frame, delay2 + 0.15)
        end)
    end)
end

createnotification("Notification", "Kllaura has been Enabled", 2, true) -- false is off true is on
	if state then
		BindToStepped("Killaura", 1, function()
			if entity.isAlive then
				KillauraRemote()
			end
		end)
	else
		local Guitwo = game.CoreGui.RektskyNotificationGui

local function createnotification(title, text, delay2, toggled)
    spawn(function()
        if Guitwo:FindFirstChild("Background") then Guitwo:FindFirstChild("Background"):Destroy() end
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(0, 100, 0, 115)
        frame.Position = UDim2.new(0.5, 0, 0, -115)
        frame.BorderSizePixel = 0
        frame.AnchorPoint = Vector2.new(0.5, 0)
        frame.BackgroundTransparency = 0.5
        frame.BackgroundColor3 = Color3.new(0, 0, 0)
        frame.Name = "Background"
        frame.Parent = Guitwo
        local frameborder = Instance.new("Frame")
        frameborder.Size = UDim2.new(1, 0, 0, 8)
        frameborder.BorderSizePixel = 0
        frameborder.BackgroundColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frameborder.Parent = frame
        local frametitle = Instance.new("TextLabel")
        frametitle.Font = Enum.Font.SourceSansLight
        frametitle.BackgroundTransparency = 1
        frametitle.Position = UDim2.new(0, 0, 0, 30)
        frametitle.TextColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frametitle.Size = UDim2.new(1, 0, 0, 28)
        frametitle.Text = "          "..title
        frametitle.TextSize = 24
        frametitle.TextXAlignment = Enum.TextXAlignment.Left
        frametitle.TextYAlignment = Enum.TextYAlignment.Top
        frametitle.Parent = frame
        local frametext = Instance.new("TextLabel")
        frametext.Font = Enum.Font.SourceSansLight
        frametext.BackgroundTransparency = 1
        frametext.Position = UDim2.new(0, 0, 0, 68)
        frametext.TextColor3 = Color3.new(1, 1, 1)
        frametext.Size = UDim2.new(1, 0, 0, 28)
        frametext.Text = "          "..text
        frametext.TextSize = 24
        frametext.TextXAlignment = Enum.TextXAlignment.Left
        frametext.TextYAlignment = Enum.TextYAlignment.Top
        frametext.Parent = frame
        local textsize = game:GetService("TextService"):GetTextSize(frametitle.Text, frametitle.TextSize, frametitle.Font, Vector2.new(100000, 100000))
        local textsize2 = game:GetService("TextService"):GetTextSize(frametext.Text, frametext.TextSize, frametext.Font, Vector2.new(100000, 100000))
        if textsize2.X > textsize.X then textsize = textsize2 end
        frame.Size = UDim2.new(0, textsize.X + 38, 0, 115)
        pcall(function()
            frame:TweenPosition(UDim2.new(0.5, 0, 0, 20), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.15)
            game:GetService("Debris"):AddItem(frame, delay2 + 0.15)
        end)
    end)
end



createnotification("Notification", "Kllaura has been Disabled", 2, false)
		UnbindFromStepped("Killaura")
	end
end)

CombatSection:NewSlider("Distance 1-40", "Increase killaura distance", 40, 1, function(val)
	DistVal["Value"] = val
end)

CombatSection:NewToggle("No Swing", "Disable killaura swing", function(state)
    local Guitwo = game.CoreGui.RektskyNotificationGui

local function createnotification(title, text, delay2, toggled)
    spawn(function()
        if Guitwo:FindFirstChild("Background") then Guitwo:FindFirstChild("Background"):Destroy() end
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(0, 100, 0, 115)
        frame.Position = UDim2.new(0.5, 0, 0, -115)
        frame.BorderSizePixel = 0
        frame.AnchorPoint = Vector2.new(0.5, 0)
        frame.BackgroundTransparency = 0.5
        frame.BackgroundColor3 = Color3.new(0, 0, 0)
        frame.Name = "Background"
        frame.Parent = Guitwo
        local frameborder = Instance.new("Frame")
        frameborder.Size = UDim2.new(1, 0, 0, 8)
        frameborder.BorderSizePixel = 0
        frameborder.BackgroundColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frameborder.Parent = frame
        local frametitle = Instance.new("TextLabel")
        frametitle.Font = Enum.Font.SourceSansLight
        frametitle.BackgroundTransparency = 1
        frametitle.Position = UDim2.new(0, 0, 0, 30)
        frametitle.TextColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frametitle.Size = UDim2.new(1, 0, 0, 28)
        frametitle.Text = "          "..title
        frametitle.TextSize = 24
        frametitle.TextXAlignment = Enum.TextXAlignment.Left
        frametitle.TextYAlignment = Enum.TextYAlignment.Top
        frametitle.Parent = frame
        local frametext = Instance.new("TextLabel")
        frametext.Font = Enum.Font.SourceSansLight
        frametext.BackgroundTransparency = 1
        frametext.Position = UDim2.new(0, 0, 0, 68)
        frametext.TextColor3 = Color3.new(1, 1, 1)
        frametext.Size = UDim2.new(1, 0, 0, 28)
        frametext.Text = "          "..text
        frametext.TextSize = 24
        frametext.TextXAlignment = Enum.TextXAlignment.Left
        frametext.TextYAlignment = Enum.TextYAlignment.Top
        frametext.Parent = frame
        local textsize = game:GetService("TextService"):GetTextSize(frametitle.Text, frametitle.TextSize, frametitle.Font, Vector2.new(100000, 100000))
        local textsize2 = game:GetService("TextService"):GetTextSize(frametext.Text, frametext.TextSize, frametext.Font, Vector2.new(100000, 100000))
        if textsize2.X > textsize.X then textsize = textsize2 end
        frame.Size = UDim2.new(0, textsize.X + 38, 0, 115)
        pcall(function()
            frame:TweenPosition(UDim2.new(0.5, 0, 0, 20), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.15)
            game:GetService("Debris"):AddItem(frame, delay2 + 0.15)
        end)
    end)
end

createnotification("Notification", "No Swing has been Enabled", 2, true) -- false is off true is on
	if state then
		if killauraswing["Enabled"] == true then
			killauraswing["Enabled"] = false
		end
	else
		local Guitwo = game.CoreGui.RektskyNotificationGui

local function createnotification(title, text, delay2, toggled)
    spawn(function()
        if Guitwo:FindFirstChild("Background") then Guitwo:FindFirstChild("Background"):Destroy() end
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(0, 100, 0, 115)
        frame.Position = UDim2.new(0.5, 0, 0, -115)
        frame.BorderSizePixel = 0
        frame.AnchorPoint = Vector2.new(0.5, 0)
        frame.BackgroundTransparency = 0.5
        frame.BackgroundColor3 = Color3.new(0, 0, 0)
        frame.Name = "Background"
        frame.Parent = Guitwo
        local frameborder = Instance.new("Frame")
        frameborder.Size = UDim2.new(1, 0, 0, 8)
        frameborder.BorderSizePixel = 0
        frameborder.BackgroundColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frameborder.Parent = frame
        local frametitle = Instance.new("TextLabel")
        frametitle.Font = Enum.Font.SourceSansLight
        frametitle.BackgroundTransparency = 1
        frametitle.Position = UDim2.new(0, 0, 0, 30)
        frametitle.TextColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frametitle.Size = UDim2.new(1, 0, 0, 28)
        frametitle.Text = "          "..title
        frametitle.TextSize = 24
        frametitle.TextXAlignment = Enum.TextXAlignment.Left
        frametitle.TextYAlignment = Enum.TextYAlignment.Top
        frametitle.Parent = frame
        local frametext = Instance.new("TextLabel")
        frametext.Font = Enum.Font.SourceSansLight
        frametext.BackgroundTransparency = 1
        frametext.Position = UDim2.new(0, 0, 0, 68)
        frametext.TextColor3 = Color3.new(1, 1, 1)
        frametext.Size = UDim2.new(1, 0, 0, 28)
        frametext.Text = "          "..text
        frametext.TextSize = 24
        frametext.TextXAlignment = Enum.TextXAlignment.Left
        frametext.TextYAlignment = Enum.TextYAlignment.Top
        frametext.Parent = frame
        local textsize = game:GetService("TextService"):GetTextSize(frametitle.Text, frametitle.TextSize, frametitle.Font, Vector2.new(100000, 100000))
        local textsize2 = game:GetService("TextService"):GetTextSize(frametext.Text, frametext.TextSize, frametext.Font, Vector2.new(100000, 100000))
        if textsize2.X > textsize.X then textsize = textsize2 end
        frame.Size = UDim2.new(0, textsize.X + 38, 0, 115)
        pcall(function()
            frame:TweenPosition(UDim2.new(0.5, 0, 0, 20), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.15)
            game:GetService("Debris"):AddItem(frame, delay2 + 0.15)
        end)
    end)
end



createnotification("Notification", "No Swing has been Disabled", 2, false)
		if killauraswing["Enabled"] == false then
			killauraswing["Enabled"] = true
		end
	end
end)
CombatSection:NewSlider("Sound 1-0", "Adjust killaura sound", 1, 0, function(val)
	killaurasoundval["Value"] = val
end)


BlatantSection:NewToggle("fly", "HypixelFly", function(v)
    local Guitwo = game.CoreGui.RektskyNotificationGui

local function createnotification(title, text, delay2, toggled)
    spawn(function()
        if Guitwo:FindFirstChild("Background") then Guitwo:FindFirstChild("Background"):Destroy() end
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(0, 100, 0, 115)
        frame.Position = UDim2.new(0.5, 0, 0, -115)
        frame.BorderSizePixel = 0
        frame.AnchorPoint = Vector2.new(0.5, 0)
        frame.BackgroundTransparency = 0.5
        frame.BackgroundColor3 = Color3.new(0, 0, 0)
        frame.Name = "Background"
        frame.Parent = Guitwo
        local frameborder = Instance.new("Frame")
        frameborder.Size = UDim2.new(1, 0, 0, 8)
        frameborder.BorderSizePixel = 0
        frameborder.BackgroundColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frameborder.Parent = frame
        local frametitle = Instance.new("TextLabel")
        frametitle.Font = Enum.Font.SourceSansLight
        frametitle.BackgroundTransparency = 1
        frametitle.Position = UDim2.new(0, 0, 0, 30)
        frametitle.TextColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frametitle.Size = UDim2.new(1, 0, 0, 28)
        frametitle.Text = "          "..title
        frametitle.TextSize = 24
        frametitle.TextXAlignment = Enum.TextXAlignment.Left
        frametitle.TextYAlignment = Enum.TextYAlignment.Top
        frametitle.Parent = frame
        local frametext = Instance.new("TextLabel")
        frametext.Font = Enum.Font.SourceSansLight
        frametext.BackgroundTransparency = 1
        frametext.Position = UDim2.new(0, 0, 0, 68)
        frametext.TextColor3 = Color3.new(1, 1, 1)
        frametext.Size = UDim2.new(1, 0, 0, 28)
        frametext.Text = "          "..text
        frametext.TextSize = 24
        frametext.TextXAlignment = Enum.TextXAlignment.Left
        frametext.TextYAlignment = Enum.TextYAlignment.Top
        frametext.Parent = frame
        local textsize = game:GetService("TextService"):GetTextSize(frametitle.Text, frametitle.TextSize, frametitle.Font, Vector2.new(100000, 100000))
        local textsize2 = game:GetService("TextService"):GetTextSize(frametext.Text, frametext.TextSize, frametext.Font, Vector2.new(100000, 100000))
        if textsize2.X > textsize.X then textsize = textsize2 end
        frame.Size = UDim2.new(0, textsize.X + 38, 0, 115)
        pcall(function()
            frame:TweenPosition(UDim2.new(0.5, 0, 0, 20), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.15)
            game:GetService("Debris"):AddItem(frame, delay2 + 0.15)
        end)
    end)
end

createnotification("Notification", "fly has been Enabled", 2, true) -- false is off true is on
    longjumpval = v
            if longjumpval then
                workspace.Gravity = 0
                spawn(function()
                    repeat
                        if (not longjumpval) then return end
                        lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Freefall)
                        wait(0.1)
                        lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Running)
                        wait(0.1)
                        lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Climbing)
                        wait(0.1)
                        lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Swimming)
                        wait(0.1)
                        lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Landed)
                        wait(0.1)
                    until (not longjumpval)
                end)
        else
			local Guitwo = game.CoreGui.RektskyNotificationGui

local function createnotification(title, text, delay2, toggled)
    spawn(function()
        if Guitwo:FindFirstChild("Background") then Guitwo:FindFirstChild("Background"):Destroy() end
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(0, 100, 0, 115)
        frame.Position = UDim2.new(0.5, 0, 0, -115)
        frame.BorderSizePixel = 0
        frame.AnchorPoint = Vector2.new(0.5, 0)
        frame.BackgroundTransparency = 0.5
        frame.BackgroundColor3 = Color3.new(0, 0, 0)
        frame.Name = "Background"
        frame.Parent = Guitwo
        local frameborder = Instance.new("Frame")
        frameborder.Size = UDim2.new(1, 0, 0, 8)
        frameborder.BorderSizePixel = 0
        frameborder.BackgroundColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frameborder.Parent = frame
        local frametitle = Instance.new("TextLabel")
        frametitle.Font = Enum.Font.SourceSansLight
        frametitle.BackgroundTransparency = 1
        frametitle.Position = UDim2.new(0, 0, 0, 30)
        frametitle.TextColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frametitle.Size = UDim2.new(1, 0, 0, 28)
        frametitle.Text = "          "..title
        frametitle.TextSize = 24
        frametitle.TextXAlignment = Enum.TextXAlignment.Left
        frametitle.TextYAlignment = Enum.TextYAlignment.Top
        frametitle.Parent = frame
        local frametext = Instance.new("TextLabel")
        frametext.Font = Enum.Font.SourceSansLight
        frametext.BackgroundTransparency = 1
        frametext.Position = UDim2.new(0, 0, 0, 68)
        frametext.TextColor3 = Color3.new(1, 1, 1)
        frametext.Size = UDim2.new(1, 0, 0, 28)
        frametext.Text = "          "..text
        frametext.TextSize = 24
        frametext.TextXAlignment = Enum.TextXAlignment.Left
        frametext.TextYAlignment = Enum.TextYAlignment.Top
        frametext.Parent = frame
        local textsize = game:GetService("TextService"):GetTextSize(frametitle.Text, frametitle.TextSize, frametitle.Font, Vector2.new(100000, 100000))
        local textsize2 = game:GetService("TextService"):GetTextSize(frametext.Text, frametext.TextSize, frametext.Font, Vector2.new(100000, 100000))
        if textsize2.X > textsize.X then textsize = textsize2 end
        frame.Size = UDim2.new(0, textsize.X + 38, 0, 115)
        pcall(function()
            frame:TweenPosition(UDim2.new(0.5, 0, 0, 20), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.15)
            game:GetService("Debris"):AddItem(frame, delay2 + 0.15)
        end)
    end)
end



createnotification("Notification", "fly has been Disabled", 2, false)
            workspace.Gravity = 196.19999694824
            return
        end
    end)

    BlatantSection:NewToggle("Speed", "Gives Speed", function(state)
        local Guitwo = game.CoreGui.RektskyNotificationGui

local function createnotification(title, text, delay2, toggled)
    spawn(function()
        if Guitwo:FindFirstChild("Background") then Guitwo:FindFirstChild("Background"):Destroy() end
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(0, 100, 0, 115)
        frame.Position = UDim2.new(0.5, 0, 0, -115)
        frame.BorderSizePixel = 0
        frame.AnchorPoint = Vector2.new(0.5, 0)
        frame.BackgroundTransparency = 0.5
        frame.BackgroundColor3 = Color3.new(0, 0, 0)
        frame.Name = "Background"
        frame.Parent = Guitwo
        local frameborder = Instance.new("Frame")
        frameborder.Size = UDim2.new(1, 0, 0, 8)
        frameborder.BorderSizePixel = 0
        frameborder.BackgroundColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frameborder.Parent = frame
        local frametitle = Instance.new("TextLabel")
        frametitle.Font = Enum.Font.SourceSansLight
        frametitle.BackgroundTransparency = 1
        frametitle.Position = UDim2.new(0, 0, 0, 30)
        frametitle.TextColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frametitle.Size = UDim2.new(1, 0, 0, 28)
        frametitle.Text = "          "..title
        frametitle.TextSize = 24
        frametitle.TextXAlignment = Enum.TextXAlignment.Left
        frametitle.TextYAlignment = Enum.TextYAlignment.Top
        frametitle.Parent = frame
        local frametext = Instance.new("TextLabel")
        frametext.Font = Enum.Font.SourceSansLight
        frametext.BackgroundTransparency = 1
        frametext.Position = UDim2.new(0, 0, 0, 68)
        frametext.TextColor3 = Color3.new(1, 1, 1)
        frametext.Size = UDim2.new(1, 0, 0, 28)
        frametext.Text = "          "..text
        frametext.TextSize = 24
        frametext.TextXAlignment = Enum.TextXAlignment.Left
        frametext.TextYAlignment = Enum.TextYAlignment.Top
        frametext.Parent = frame
        local textsize = game:GetService("TextService"):GetTextSize(frametitle.Text, frametitle.TextSize, frametitle.Font, Vector2.new(100000, 100000))
        local textsize2 = game:GetService("TextService"):GetTextSize(frametext.Text, frametext.TextSize, frametext.Font, Vector2.new(100000, 100000))
        if textsize2.X > textsize.X then textsize = textsize2 end
        frame.Size = UDim2.new(0, textsize.X + 38, 0, 115)
        pcall(function()
            frame:TweenPosition(UDim2.new(0.5, 0, 0, 20), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.15)
            game:GetService("Debris"):AddItem(frame, delay2 + 0.15)
        end)
    end)
end

createnotification("Notification", "Speed has been Enabled", 2, true) -- false is off true is on
        if state then
            BindToStepped("CFrameWalkSpeed", 1, function(time, delta)
                if entity.isAlive then
                    local newpos = (lplr.Character.Humanoid.MoveDirection  * (speedval["Value"] - lplr.Character.Humanoid.WalkSpeed)) * delta
    
                    local raycastparameters = RaycastParams.new()
                    raycastparameters.FilterDescendantsInstances = {lplr.Character}
                    local ray = workspace:Raycast(lplr.Character.HumanoidRootPart.Position, newpos, raycastparameters)
                    if ray then newpos = (ray.Position - lplr.Character.HumanoidRootPart.Position) end
                    lplr.Character.HumanoidRootPart.CFrame = lplr.Character.HumanoidRootPart.CFrame + newpos
                end
            end)
        else
			local Guitwo = game.CoreGui.RektskyNotificationGui

local function createnotification(title, text, delay2, toggled)
    spawn(function()
        if Guitwo:FindFirstChild("Background") then Guitwo:FindFirstChild("Background"):Destroy() end
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(0, 100, 0, 115)
        frame.Position = UDim2.new(0.5, 0, 0, -115)
        frame.BorderSizePixel = 0
        frame.AnchorPoint = Vector2.new(0.5, 0)
        frame.BackgroundTransparency = 0.5
        frame.BackgroundColor3 = Color3.new(0, 0, 0)
        frame.Name = "Background"
        frame.Parent = Guitwo
        local frameborder = Instance.new("Frame")
        frameborder.Size = UDim2.new(1, 0, 0, 8)
        frameborder.BorderSizePixel = 0
        frameborder.BackgroundColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frameborder.Parent = frame
        local frametitle = Instance.new("TextLabel")
        frametitle.Font = Enum.Font.SourceSansLight
        frametitle.BackgroundTransparency = 1
        frametitle.Position = UDim2.new(0, 0, 0, 30)
        frametitle.TextColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frametitle.Size = UDim2.new(1, 0, 0, 28)
        frametitle.Text = "          "..title
        frametitle.TextSize = 24
        frametitle.TextXAlignment = Enum.TextXAlignment.Left
        frametitle.TextYAlignment = Enum.TextYAlignment.Top
        frametitle.Parent = frame
        local frametext = Instance.new("TextLabel")
        frametext.Font = Enum.Font.SourceSansLight
        frametext.BackgroundTransparency = 1
        frametext.Position = UDim2.new(0, 0, 0, 68)
        frametext.TextColor3 = Color3.new(1, 1, 1)
        frametext.Size = UDim2.new(1, 0, 0, 28)
        frametext.Text = "          "..text
        frametext.TextSize = 24
        frametext.TextXAlignment = Enum.TextXAlignment.Left
        frametext.TextYAlignment = Enum.TextYAlignment.Top
        frametext.Parent = frame
        local textsize = game:GetService("TextService"):GetTextSize(frametitle.Text, frametitle.TextSize, frametitle.Font, Vector2.new(100000, 100000))
        local textsize2 = game:GetService("TextService"):GetTextSize(frametext.Text, frametext.TextSize, frametext.Font, Vector2.new(100000, 100000))
        if textsize2.X > textsize.X then textsize = textsize2 end
        frame.Size = UDim2.new(0, textsize.X + 38, 0, 115)
        pcall(function()
            frame:TweenPosition(UDim2.new(0.5, 0, 0, 20), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.15)
            game:GetService("Debris"):AddItem(frame, delay2 + 0.15)
        end)
    end)
end



createnotification("Notification", "Speed has been Disabled", 2, false)
            UnbindFromStepped("CFrameWalkSpeed")
        end
    end)
    
    BlatantSection:NewSlider("Speed 1-27", "Adjust CFrame speed", 27, 1, function(s)
        speedval["Value"] = s
    end)
    
    
	BlatantSection:NewToggle("Infinite Jumps"," Infinite Jumps",function(state)

		local Guitwo = game.CoreGui.RektskyNotificationGui

local function createnotification(title, text, delay2, toggled)
    spawn(function()
        if Guitwo:FindFirstChild("Background") then Guitwo:FindFirstChild("Background"):Destroy() end
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(0, 100, 0, 115)
        frame.Position = UDim2.new(0.5, 0, 0, -115)
        frame.BorderSizePixel = 0
        frame.AnchorPoint = Vector2.new(0.5, 0)
        frame.BackgroundTransparency = 0.5
        frame.BackgroundColor3 = Color3.new(0, 0, 0)
        frame.Name = "Background"
        frame.Parent = Guitwo
        local frameborder = Instance.new("Frame")
        frameborder.Size = UDim2.new(1, 0, 0, 8)
        frameborder.BorderSizePixel = 0
        frameborder.BackgroundColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frameborder.Parent = frame
        local frametitle = Instance.new("TextLabel")
        frametitle.Font = Enum.Font.SourceSansLight
        frametitle.BackgroundTransparency = 1
        frametitle.Position = UDim2.new(0, 0, 0, 30)
        frametitle.TextColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frametitle.Size = UDim2.new(1, 0, 0, 28)
        frametitle.Text = "          "..title
        frametitle.TextSize = 24
        frametitle.TextXAlignment = Enum.TextXAlignment.Left
        frametitle.TextYAlignment = Enum.TextYAlignment.Top
        frametitle.Parent = frame
        local frametext = Instance.new("TextLabel")
        frametext.Font = Enum.Font.SourceSansLight
        frametext.BackgroundTransparency = 1
        frametext.Position = UDim2.new(0, 0, 0, 68)
        frametext.TextColor3 = Color3.new(1, 1, 1)
        frametext.Size = UDim2.new(1, 0, 0, 28)
        frametext.Text = "          "..text
        frametext.TextSize = 24
        frametext.TextXAlignment = Enum.TextXAlignment.Left
        frametext.TextYAlignment = Enum.TextYAlignment.Top
        frametext.Parent = frame
        local textsize = game:GetService("TextService"):GetTextSize(frametitle.Text, frametitle.TextSize, frametitle.Font, Vector2.new(100000, 100000))
        local textsize2 = game:GetService("TextService"):GetTextSize(frametext.Text, frametext.TextSize, frametext.Font, Vector2.new(100000, 100000))
        if textsize2.X > textsize.X then textsize = textsize2 end
        frame.Size = UDim2.new(0, textsize.X + 38, 0, 115)
        pcall(function()
            frame:TweenPosition(UDim2.new(0.5, 0, 0, 20), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.15)
            game:GetService("Debris"):AddItem(frame, delay2 + 0.15)
        end)
    end)
end

createnotification("Notification", "Infinite Jumps has been Enabled", 2, true) -- false is off true is on
if state then
		local InfJump = {["Enabled"] = true}
		connectioninfjump = uis.JumpRequest:connect(function(jump)
			if InfJump["Enabled"] then
				lplr.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")
			end
		end)
	else
		local Guitwo = game.CoreGui.RektskyNotificationGui

local function createnotification(title, text, delay2, toggled)
    spawn(function()
        if Guitwo:FindFirstChild("Background") then Guitwo:FindFirstChild("Background"):Destroy() end
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(0, 100, 0, 115)
        frame.Position = UDim2.new(0.5, 0, 0, -115)
        frame.BorderSizePixel = 0
        frame.AnchorPoint = Vector2.new(0.5, 0)
        frame.BackgroundTransparency = 0.5
        frame.BackgroundColor3 = Color3.new(0, 0, 0)
        frame.Name = "Background"
        frame.Parent = Guitwo
        local frameborder = Instance.new("Frame")
        frameborder.Size = UDim2.new(1, 0, 0, 8)
        frameborder.BorderSizePixel = 0
        frameborder.BackgroundColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frameborder.Parent = frame
        local frametitle = Instance.new("TextLabel")
        frametitle.Font = Enum.Font.SourceSansLight
        frametitle.BackgroundTransparency = 1
        frametitle.Position = UDim2.new(0, 0, 0, 30)
        frametitle.TextColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frametitle.Size = UDim2.new(1, 0, 0, 28)
        frametitle.Text = "          "..title
        frametitle.TextSize = 24
        frametitle.TextXAlignment = Enum.TextXAlignment.Left
        frametitle.TextYAlignment = Enum.TextYAlignment.Top
        frametitle.Parent = frame
        local frametext = Instance.new("TextLabel")
        frametext.Font = Enum.Font.SourceSansLight
        frametext.BackgroundTransparency = 1
        frametext.Position = UDim2.new(0, 0, 0, 68)
        frametext.TextColor3 = Color3.new(1, 1, 1)
        frametext.Size = UDim2.new(1, 0, 0, 28)
        frametext.Text = "          "..text
        frametext.TextSize = 24
        frametext.TextXAlignment = Enum.TextXAlignment.Left
        frametext.TextYAlignment = Enum.TextYAlignment.Top
        frametext.Parent = frame
        local textsize = game:GetService("TextService"):GetTextSize(frametitle.Text, frametitle.TextSize, frametitle.Font, Vector2.new(100000, 100000))
        local textsize2 = game:GetService("TextService"):GetTextSize(frametext.Text, frametext.TextSize, frametext.Font, Vector2.new(100000, 100000))
        if textsize2.X > textsize.X then textsize = textsize2 end
        frame.Size = UDim2.new(0, textsize.X + 38, 0, 115)
        pcall(function()
            frame:TweenPosition(UDim2.new(0.5, 0, 0, 20), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.15)
            game:GetService("Debris"):AddItem(frame, delay2 + 0.15)
        end)
    end)
end



createnotification("Notification", "Infinite Jumps been Disabled", 2, false)
		connectioninfjump:Disconnect()
	end
end)


CombatSection:NewToggle("Velocity","Reduces knockback taken",function(state)
	local Guitwo = game.CoreGui.RektskyNotificationGui

local function createnotification(title, text, delay2, toggled)
    spawn(function()
        if Guitwo:FindFirstChild("Background") then Guitwo:FindFirstChild("Background"):Destroy() end
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(0, 100, 0, 115)
        frame.Position = UDim2.new(0.5, 0, 0, -115)
        frame.BorderSizePixel = 0
        frame.AnchorPoint = Vector2.new(0.5, 0)
        frame.BackgroundTransparency = 0.5
        frame.BackgroundColor3 = Color3.new(0, 0, 0)
        frame.Name = "Background"
        frame.Parent = Guitwo
        local frameborder = Instance.new("Frame")
        frameborder.Size = UDim2.new(1, 0, 0, 8)
        frameborder.BorderSizePixel = 0
        frameborder.BackgroundColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frameborder.Parent = frame
        local frametitle = Instance.new("TextLabel")
        frametitle.Font = Enum.Font.SourceSansLight
        frametitle.BackgroundTransparency = 1
        frametitle.Position = UDim2.new(0, 0, 0, 30)
        frametitle.TextColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frametitle.Size = UDim2.new(1, 0, 0, 28)
        frametitle.Text = "          "..title
        frametitle.TextSize = 24
        frametitle.TextXAlignment = Enum.TextXAlignment.Left
        frametitle.TextYAlignment = Enum.TextYAlignment.Top
        frametitle.Parent = frame
        local frametext = Instance.new("TextLabel")
        frametext.Font = Enum.Font.SourceSansLight
        frametext.BackgroundTransparency = 1
        frametext.Position = UDim2.new(0, 0, 0, 68)
        frametext.TextColor3 = Color3.new(1, 1, 1)
        frametext.Size = UDim2.new(1, 0, 0, 28)
        frametext.Text = "          "..text
        frametext.TextSize = 24
        frametext.TextXAlignment = Enum.TextXAlignment.Left
        frametext.TextYAlignment = Enum.TextYAlignment.Top
        frametext.Parent = frame
        local textsize = game:GetService("TextService"):GetTextSize(frametitle.Text, frametitle.TextSize, frametitle.Font, Vector2.new(100000, 100000))
        local textsize2 = game:GetService("TextService"):GetTextSize(frametext.Text, frametext.TextSize, frametext.Font, Vector2.new(100000, 100000))
        if textsize2.X > textsize.X then textsize = textsize2 end
        frame.Size = UDim2.new(0, textsize.X + 38, 0, 115)
        pcall(function()
            frame:TweenPosition(UDim2.new(0.5, 0, 0, 20), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.15)
            game:GetService("Debris"):AddItem(frame, delay2 + 0.15)
        end)
    end)
end

createnotification("Notification", "Velocity has been Enabled", 2, true) -- false is off true is on
if state then
		KnockbackTable["kbDirectionStrength"] = 0
		KnockbackTable["kbUpwardStrength"] = 0
	else
		local Guitwo = game.CoreGui.RektskyNotificationGui

local function createnotification(title, text, delay2, toggled)
    spawn(function()
        if Guitwo:FindFirstChild("Background") then Guitwo:FindFirstChild("Background"):Destroy() end
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(0, 100, 0, 115)
        frame.Position = UDim2.new(0.5, 0, 0, -115)
        frame.BorderSizePixel = 0
        frame.AnchorPoint = Vector2.new(0.5, 0)
        frame.BackgroundTransparency = 0.5
        frame.BackgroundColor3 = Color3.new(0, 0, 0)
        frame.Name = "Background"
        frame.Parent = Guitwo
        local frameborder = Instance.new("Frame")
        frameborder.Size = UDim2.new(1, 0, 0, 8)
        frameborder.BorderSizePixel = 0
        frameborder.BackgroundColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frameborder.Parent = frame
        local frametitle = Instance.new("TextLabel")
        frametitle.Font = Enum.Font.SourceSansLight
        frametitle.BackgroundTransparency = 1
        frametitle.Position = UDim2.new(0, 0, 0, 30)
        frametitle.TextColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frametitle.Size = UDim2.new(1, 0, 0, 28)
        frametitle.Text = "          "..title
        frametitle.TextSize = 24
        frametitle.TextXAlignment = Enum.TextXAlignment.Left
        frametitle.TextYAlignment = Enum.TextYAlignment.Top
        frametitle.Parent = frame
        local frametext = Instance.new("TextLabel")
        frametext.Font = Enum.Font.SourceSansLight
        frametext.BackgroundTransparency = 1
        frametext.Position = UDim2.new(0, 0, 0, 68)
        frametext.TextColor3 = Color3.new(1, 1, 1)
        frametext.Size = UDim2.new(1, 0, 0, 28)
        frametext.Text = "          "..text
        frametext.TextSize = 24
        frametext.TextXAlignment = Enum.TextXAlignment.Left
        frametext.TextYAlignment = Enum.TextYAlignment.Top
        frametext.Parent = frame
        local textsize = game:GetService("TextService"):GetTextSize(frametitle.Text, frametitle.TextSize, frametitle.Font, Vector2.new(100000, 100000))
        local textsize2 = game:GetService("TextService"):GetTextSize(frametext.Text, frametext.TextSize, frametext.Font, Vector2.new(100000, 100000))
        if textsize2.X > textsize.X then textsize = textsize2 end
        frame.Size = UDim2.new(0, textsize.X + 38, 0, 115)
        pcall(function()
            frame:TweenPosition(UDim2.new(0.5, 0, 0, 20), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.15)
            game:GetService("Debris"):AddItem(frame, delay2 + 0.15)
        end)
    end)
end



createnotification("Notification", "Velocity been Disabled", 2, false)
		KnockbackTable["kbDirectionStrength"] = 100
		KnockbackTable["kbUpwardStrength"] = 100
	end
end)

BlatantSection:NewToggle("No Fall", "Prevents taking fall ", function(callback)
	local Guitwo = game.CoreGui.RektskyNotificationGui

local function createnotification(title, text, delay2, toggled)
    spawn(function()
        if Guitwo:FindFirstChild("Background") then Guitwo:FindFirstChild("Background"):Destroy() end
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(0, 100, 0, 115)
        frame.Position = UDim2.new(0.5, 0, 0, -115)
        frame.BorderSizePixel = 0
        frame.AnchorPoint = Vector2.new(0.5, 0)
        frame.BackgroundTransparency = 0.5
        frame.BackgroundColor3 = Color3.new(0, 0, 0)
        frame.Name = "Background"
        frame.Parent = Guitwo
        local frameborder = Instance.new("Frame")
        frameborder.Size = UDim2.new(1, 0, 0, 8)
        frameborder.BorderSizePixel = 0
        frameborder.BackgroundColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frameborder.Parent = frame
        local frametitle = Instance.new("TextLabel")
        frametitle.Font = Enum.Font.SourceSansLight
        frametitle.BackgroundTransparency = 1
        frametitle.Position = UDim2.new(0, 0, 0, 30)
        frametitle.TextColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frametitle.Size = UDim2.new(1, 0, 0, 28)
        frametitle.Text = "          "..title
        frametitle.TextSize = 24
        frametitle.TextXAlignment = Enum.TextXAlignment.Left
        frametitle.TextYAlignment = Enum.TextYAlignment.Top
        frametitle.Parent = frame
        local frametext = Instance.new("TextLabel")
        frametext.Font = Enum.Font.SourceSansLight
        frametext.BackgroundTransparency = 1
        frametext.Position = UDim2.new(0, 0, 0, 68)
        frametext.TextColor3 = Color3.new(1, 1, 1)
        frametext.Size = UDim2.new(1, 0, 0, 28)
        frametext.Text = "          "..text
        frametext.TextSize = 24
        frametext.TextXAlignment = Enum.TextXAlignment.Left
        frametext.TextYAlignment = Enum.TextYAlignment.Top
        frametext.Parent = frame
        local textsize = game:GetService("TextService"):GetTextSize(frametitle.Text, frametitle.TextSize, frametitle.Font, Vector2.new(100000, 100000))
        local textsize2 = game:GetService("TextService"):GetTextSize(frametext.Text, frametext.TextSize, frametext.Font, Vector2.new(100000, 100000))
        if textsize2.X > textsize.X then textsize = textsize2 end
        frame.Size = UDim2.new(0, textsize.X + 38, 0, 115)
        pcall(function()
            frame:TweenPosition(UDim2.new(0.5, 0, 0, 20), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.15)
            game:GetService("Debris"):AddItem(frame, delay2 + 0.15)
        end)
    end)
end

createnotification("Notification", "No Fall has been Enabled", 2, true) -- false is off true is on
    local nofall = true
    if callback then
        if nofall then
            spawn(function()
                repeat
                    wait()
                    if nofall == false then
                        return end

                        game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.GroundHit:FireServer()
                    until nofall == false
                end)
            end
    else
		local Guitwo = game.CoreGui.RektskyNotificationGui

local function createnotification(title, text, delay2, toggled)
    spawn(function()
        if Guitwo:FindFirstChild("Background") then Guitwo:FindFirstChild("Background"):Destroy() end
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(0, 100, 0, 115)
        frame.Position = UDim2.new(0.5, 0, 0, -115)
        frame.BorderSizePixel = 0
        frame.AnchorPoint = Vector2.new(0.5, 0)
        frame.BackgroundTransparency = 0.5
        frame.BackgroundColor3 = Color3.new(0, 0, 0)
        frame.Name = "Background"
        frame.Parent = Guitwo
        local frameborder = Instance.new("Frame")
        frameborder.Size = UDim2.new(1, 0, 0, 8)
        frameborder.BorderSizePixel = 0
        frameborder.BackgroundColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frameborder.Parent = frame
        local frametitle = Instance.new("TextLabel")
        frametitle.Font = Enum.Font.SourceSansLight
        frametitle.BackgroundTransparency = 1
        frametitle.Position = UDim2.new(0, 0, 0, 30)
        frametitle.TextColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frametitle.Size = UDim2.new(1, 0, 0, 28)
        frametitle.Text = "          "..title
        frametitle.TextSize = 24
        frametitle.TextXAlignment = Enum.TextXAlignment.Left
        frametitle.TextYAlignment = Enum.TextYAlignment.Top
        frametitle.Parent = frame
        local frametext = Instance.new("TextLabel")
        frametext.Font = Enum.Font.SourceSansLight
        frametext.BackgroundTransparency = 1
        frametext.Position = UDim2.new(0, 0, 0, 68)
        frametext.TextColor3 = Color3.new(1, 1, 1)
        frametext.Size = UDim2.new(1, 0, 0, 28)
        frametext.Text = "          "..text
        frametext.TextSize = 24
        frametext.TextXAlignment = Enum.TextXAlignment.Left
        frametext.TextYAlignment = Enum.TextYAlignment.Top
        frametext.Parent = frame
        local textsize = game:GetService("TextService"):GetTextSize(frametitle.Text, frametitle.TextSize, frametitle.Font, Vector2.new(100000, 100000))
        local textsize2 = game:GetService("TextService"):GetTextSize(frametext.Text, frametext.TextSize, frametext.Font, Vector2.new(100000, 100000))
        if textsize2.X > textsize.X then textsize = textsize2 end
        frame.Size = UDim2.new(0, textsize.X + 38, 0, 115)
        pcall(function()
            frame:TweenPosition(UDim2.new(0.5, 0, 0, 20), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.15)
            game:GetService("Debris"):AddItem(frame, delay2 + 0.15)
        end)
    end)
end



createnotification("Notification", "No Fall been Disabled", 2, false)
        local nofall = false
    end
end)



RenderSection:NewToggle("Esp Box","Opens Box esp",function()
	local Guitwo = game.CoreGui.RektskyNotificationGui

local function createnotification(title, text, delay2, toggled)
    spawn(function()
        if Guitwo:FindFirstChild("Background") then Guitwo:FindFirstChild("Background"):Destroy() end
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(0, 100, 0, 115)
        frame.Position = UDim2.new(0.5, 0, 0, -115)
        frame.BorderSizePixel = 0
        frame.AnchorPoint = Vector2.new(0.5, 0)
        frame.BackgroundTransparency = 0.5
        frame.BackgroundColor3 = Color3.new(0, 0, 0)
        frame.Name = "Background"
        frame.Parent = Guitwo
        local frameborder = Instance.new("Frame")
        frameborder.Size = UDim2.new(1, 0, 0, 8)
        frameborder.BorderSizePixel = 0
        frameborder.BackgroundColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frameborder.Parent = frame
        local frametitle = Instance.new("TextLabel")
        frametitle.Font = Enum.Font.SourceSansLight
        frametitle.BackgroundTransparency = 1
        frametitle.Position = UDim2.new(0, 0, 0, 30)
        frametitle.TextColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frametitle.Size = UDim2.new(1, 0, 0, 28)
        frametitle.Text = "          "..title
        frametitle.TextSize = 24
        frametitle.TextXAlignment = Enum.TextXAlignment.Left
        frametitle.TextYAlignment = Enum.TextYAlignment.Top
        frametitle.Parent = frame
        local frametext = Instance.new("TextLabel")
        frametext.Font = Enum.Font.SourceSansLight
        frametext.BackgroundTransparency = 1
        frametext.Position = UDim2.new(0, 0, 0, 68)
        frametext.TextColor3 = Color3.new(1, 1, 1)
        frametext.Size = UDim2.new(1, 0, 0, 28)
        frametext.Text = "          "..text
        frametext.TextSize = 24
        frametext.TextXAlignment = Enum.TextXAlignment.Left
        frametext.TextYAlignment = Enum.TextYAlignment.Top
        frametext.Parent = frame
        local textsize = game:GetService("TextService"):GetTextSize(frametitle.Text, frametitle.TextSize, frametitle.Font, Vector2.new(100000, 100000))
        local textsize2 = game:GetService("TextService"):GetTextSize(frametext.Text, frametext.TextSize, frametext.Font, Vector2.new(100000, 100000))
        if textsize2.X > textsize.X then textsize = textsize2 end
        frame.Size = UDim2.new(0, textsize.X + 38, 0, 115)
        pcall(function()
            frame:TweenPosition(UDim2.new(0.5, 0, 0, 20), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.15)
            game:GetService("Debris"):AddItem(frame, delay2 + 0.15)
        end)
    end)
end

createnotification("Notification", "Esp Box has been Enabled", 2, true) -- false is off true is on
local Player = game:GetService("Players").LocalPlayer
local Camera = game:GetService("Workspace").CurrentCamera
local Mouse = Player:GetMouse()

local function Dist(pointA, pointB) -- magnitude errors for some reason  : (
    return math.sqrt(math.pow(pointA.X - pointB.X, 2) + math.pow(pointA.Y - pointB.Y, 2))
end

local function GetClosest(points, dest)
    local min  = math.huge 
    local closest = nil
    for _,v in pairs(points) do
        local dist = Dist(v, dest)
        if dist < min then
            min = dist
            closest = v
        end
    end
    return closest
end

local function DrawESP(plr)
    local Box = Drawing.new("Quad")
    Box.Visible = false
    Box.PointA = Vector2.new(0, 0)
    Box.PointB = Vector2.new(0, 0)
    Box.PointC = Vector2.new(0, 0)
    Box.PointD = Vector2.new(0, 0)
    Box.Color = Color3.fromRGB(255, 255, 255)
    Box.Thickness = 2
    Box.Transparency = 1

    local function Update()
        local c
        c = game:GetService("RunService").RenderStepped:Connect(function()
            if plr.Character ~= nil and plr.Character:FindFirstChildOfClass("Humanoid") ~= nil and plr.Character:FindFirstChild("HumanoidRootPart") ~= nil and plr.Character:FindFirstChildOfClass("Humanoid").Health > 0 and plr.Character:FindFirstChild("Head") ~= nil then
                local pos, vis = Camera:WorldToViewportPoint(plr.Character.HumanoidRootPart.Position)
                if vis then 
                    local points = {}
                    local c = 0
                    for _,v in pairs(plr.Character:GetChildren()) do
                        if v:IsA("BasePart") then
                            c = c + 1
                            local p = Camera:WorldToViewportPoint(v.Position)
                            if v.Name == "HumanoidRootPart" then
                                p = Camera:WorldToViewportPoint((v.CFrame * CFrame.new(0, 0, -v.Size.Z)).p)
                            elseif v.Name == "Head" then
                                p = Camera:WorldToViewportPoint((v.CFrame * CFrame.new(0, v.Size.Y/2, v.Size.Z/1.25)).p)
                            elseif string.match(v.Name, "Left") then
                                p = Camera:WorldToViewportPoint((v.CFrame * CFrame.new(-v.Size.X/2, 0, 0)).p)
                            elseif string.match(v.Name, "Right") then
                                p = Camera:WorldToViewportPoint((v.CFrame * CFrame.new(v.Size.X/2, 0, 0)).p)
                            end
                            points[c] = p
                        end
                    end
                    local Left = GetClosest(points, Vector2.new(0, pos.Y))
                    local Right = GetClosest(points, Vector2.new(Camera.ViewportSize.X, pos.Y))
                    local Top = GetClosest(points, Vector2.new(pos.X, 0))
                    local Bottom = GetClosest(points, Vector2.new(pos.X, Camera.ViewportSize.Y))

                    if Left ~= nil and Right ~= nil and Top ~= nil and Bottom ~= nil then
                        Box.PointA = Vector2.new(Right.X, Top.Y)
                        Box.PointB = Vector2.new(Left.X, Top.Y)
                        Box.PointC = Vector2.new(Left.X, Bottom.Y)
                        Box.PointD = Vector2.new(Right.X, Bottom.Y)

                        Box.Visible = true
                    else 
						local Guitwo = game.CoreGui.RektskyNotificationGui

local function createnotification(title, text, delay2, toggled)
    spawn(function()
        if Guitwo:FindFirstChild("Background") then Guitwo:FindFirstChild("Background"):Destroy() end
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(0, 100, 0, 115)
        frame.Position = UDim2.new(0.5, 0, 0, -115)
        frame.BorderSizePixel = 0
        frame.AnchorPoint = Vector2.new(0.5, 0)
        frame.BackgroundTransparency = 0.5
        frame.BackgroundColor3 = Color3.new(0, 0, 0)
        frame.Name = "Background"
        frame.Parent = Guitwo
        local frameborder = Instance.new("Frame")
        frameborder.Size = UDim2.new(1, 0, 0, 8)
        frameborder.BorderSizePixel = 0
        frameborder.BackgroundColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frameborder.Parent = frame
        local frametitle = Instance.new("TextLabel")
        frametitle.Font = Enum.Font.SourceSansLight
        frametitle.BackgroundTransparency = 1
        frametitle.Position = UDim2.new(0, 0, 0, 30)
        frametitle.TextColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frametitle.Size = UDim2.new(1, 0, 0, 28)
        frametitle.Text = "          "..title
        frametitle.TextSize = 24
        frametitle.TextXAlignment = Enum.TextXAlignment.Left
        frametitle.TextYAlignment = Enum.TextYAlignment.Top
        frametitle.Parent = frame
        local frametext = Instance.new("TextLabel")
        frametext.Font = Enum.Font.SourceSansLight
        frametext.BackgroundTransparency = 1
        frametext.Position = UDim2.new(0, 0, 0, 68)
        frametext.TextColor3 = Color3.new(1, 1, 1)
        frametext.Size = UDim2.new(1, 0, 0, 28)
        frametext.Text = "          "..text
        frametext.TextSize = 24
        frametext.TextXAlignment = Enum.TextXAlignment.Left
        frametext.TextYAlignment = Enum.TextYAlignment.Top
        frametext.Parent = frame
        local textsize = game:GetService("TextService"):GetTextSize(frametitle.Text, frametitle.TextSize, frametitle.Font, Vector2.new(100000, 100000))
        local textsize2 = game:GetService("TextService"):GetTextSize(frametext.Text, frametext.TextSize, frametext.Font, Vector2.new(100000, 100000))
        if textsize2.X > textsize.X then textsize = textsize2 end
        frame.Size = UDim2.new(0, textsize.X + 38, 0, 115)
        pcall(function()
            frame:TweenPosition(UDim2.new(0.5, 0, 0, 20), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.15)
            game:GetService("Debris"):AddItem(frame, delay2 + 0.15)
        end)
    end)
end



createnotification("Notification", "Esp been Disabled", 2, false)
                        Box.Visible = false
                    end
                else 
                    Box.Visible = false
                end
            else
                Box.Visible = false
                if game.Players:FindFirstChild(plr.Name) == nil then
                    c:Disconnect()
                end
            end
        end)
    end
    coroutine.wrap(Update)()
end

for _,v in pairs(game:GetService("Players"):GetChildren()) do
    if v.Name ~= Player.Name then 
        DrawESP(v)
    end
end

game:GetService("Players").PlayerAdded:Connect(function(v)
    DrawESP(v)
end)
end)


Tab6Section:NewButton("Zombie" , "Plays Zombie Animation",function()
	local Guitwo = game.CoreGui.RektskyNotificationGui

local function createnotification(title, text, delay2, toggled)
    spawn(function()
        if Guitwo:FindFirstChild("Background") then Guitwo:FindFirstChild("Background"):Destroy() end
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(0, 100, 0, 115)
        frame.Position = UDim2.new(0.5, 0, 0, -115)
        frame.BorderSizePixel = 0
        frame.AnchorPoint = Vector2.new(0.5, 0)
        frame.BackgroundTransparency = 0.5
        frame.BackgroundColor3 = Color3.new(0, 0, 0)
        frame.Name = "Background"
        frame.Parent = Guitwo
        local frameborder = Instance.new("Frame")
        frameborder.Size = UDim2.new(1, 0, 0, 8)
        frameborder.BorderSizePixel = 0
        frameborder.BackgroundColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frameborder.Parent = frame
        local frametitle = Instance.new("TextLabel")
        frametitle.Font = Enum.Font.SourceSansLight
        frametitle.BackgroundTransparency = 1
        frametitle.Position = UDim2.new(0, 0, 0, 30)
        frametitle.TextColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frametitle.Size = UDim2.new(1, 0, 0, 28)
        frametitle.Text = "          "..title
        frametitle.TextSize = 24
        frametitle.TextXAlignment = Enum.TextXAlignment.Left
        frametitle.TextYAlignment = Enum.TextYAlignment.Top
        frametitle.Parent = frame
        local frametext = Instance.new("TextLabel")
        frametext.Font = Enum.Font.SourceSansLight
        frametext.BackgroundTransparency = 1
        frametext.Position = UDim2.new(0, 0, 0, 68)
        frametext.TextColor3 = Color3.new(1, 1, 1)
        frametext.Size = UDim2.new(1, 0, 0, 28)
        frametext.Text = "          "..text
        frametext.TextSize = 24
        frametext.TextXAlignment = Enum.TextXAlignment.Left
        frametext.TextYAlignment = Enum.TextYAlignment.Top
        frametext.Parent = frame
        local textsize = game:GetService("TextService"):GetTextSize(frametitle.Text, frametitle.TextSize, frametitle.Font, Vector2.new(100000, 100000))
        local textsize2 = game:GetService("TextService"):GetTextSize(frametext.Text, frametext.TextSize, frametext.Font, Vector2.new(100000, 100000))
        if textsize2.X > textsize.X then textsize = textsize2 end
        frame.Size = UDim2.new(0, textsize.X + 38, 0, 115)
        pcall(function()
            frame:TweenPosition(UDim2.new(0.5, 0, 0, 20), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.15)
            game:GetService("Debris"):AddItem(frame, delay2 + 0.15)
        end)
    end)
end

createnotification("Notification", "Zombie Animation been Enabled", 2, true) -- false is off true is on
	local Animate =
	game.Players.LocalPlayer.Character.Animate
	Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=616158929"
	Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=616160636"
	Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=616168032"
	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=616163682"
	Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=616161997"
	Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=616156119"
	Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=616157476"
	game.Players.LocalPlayer.Character.Humanoid.Jump = true
	end)
	
	Tab6Section:NewButton("Ninja","Plays Ninja Animation",function()
		local Guitwo = game.CoreGui.RektskyNotificationGui

local function createnotification(title, text, delay2, toggled)
    spawn(function()
        if Guitwo:FindFirstChild("Background") then Guitwo:FindFirstChild("Background"):Destroy() end
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(0, 100, 0, 115)
        frame.Position = UDim2.new(0.5, 0, 0, -115)
        frame.BorderSizePixel = 0
        frame.AnchorPoint = Vector2.new(0.5, 0)
        frame.BackgroundTransparency = 0.5
        frame.BackgroundColor3 = Color3.new(0, 0, 0)
        frame.Name = "Background"
        frame.Parent = Guitwo
        local frameborder = Instance.new("Frame")
        frameborder.Size = UDim2.new(1, 0, 0, 8)
        frameborder.BorderSizePixel = 0
        frameborder.BackgroundColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frameborder.Parent = frame
        local frametitle = Instance.new("TextLabel")
        frametitle.Font = Enum.Font.SourceSansLight
        frametitle.BackgroundTransparency = 1
        frametitle.Position = UDim2.new(0, 0, 0, 30)
        frametitle.TextColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frametitle.Size = UDim2.new(1, 0, 0, 28)
        frametitle.Text = "          "..title
        frametitle.TextSize = 24
        frametitle.TextXAlignment = Enum.TextXAlignment.Left
        frametitle.TextYAlignment = Enum.TextYAlignment.Top
        frametitle.Parent = frame
        local frametext = Instance.new("TextLabel")
        frametext.Font = Enum.Font.SourceSansLight
        frametext.BackgroundTransparency = 1
        frametext.Position = UDim2.new(0, 0, 0, 68)
        frametext.TextColor3 = Color3.new(1, 1, 1)
        frametext.Size = UDim2.new(1, 0, 0, 28)
        frametext.Text = "          "..text
        frametext.TextSize = 24
        frametext.TextXAlignment = Enum.TextXAlignment.Left
        frametext.TextYAlignment = Enum.TextYAlignment.Top
        frametext.Parent = frame
        local textsize = game:GetService("TextService"):GetTextSize(frametitle.Text, frametitle.TextSize, frametitle.Font, Vector2.new(100000, 100000))
        local textsize2 = game:GetService("TextService"):GetTextSize(frametext.Text, frametext.TextSize, frametext.Font, Vector2.new(100000, 100000))
        if textsize2.X > textsize.X then textsize = textsize2 end
        frame.Size = UDim2.new(0, textsize.X + 38, 0, 115)
        pcall(function()
            frame:TweenPosition(UDim2.new(0.5, 0, 0, 20), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.15)
            game:GetService("Debris"):AddItem(frame, delay2 + 0.15)
        end)
    end)
end

createnotification("Notification", "Ninja Animation Enabled", 2, true) -- false is off true is on
	loadstring(game:HttpGet("https://pastebin.com/raw/bwGLPVV7",true))()
	end)
	
	Tab6Section:NewButton("Robot","Plays Robot Animation",function()
		local Guitwo = game.CoreGui.RektskyNotificationGui

local function createnotification(title, text, delay2, toggled)
    spawn(function()
        if Guitwo:FindFirstChild("Background") then Guitwo:FindFirstChild("Background"):Destroy() end
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(0, 100, 0, 115)
        frame.Position = UDim2.new(0.5, 0, 0, -115)
        frame.BorderSizePixel = 0
        frame.AnchorPoint = Vector2.new(0.5, 0)
        frame.BackgroundTransparency = 0.5
        frame.BackgroundColor3 = Color3.new(0, 0, 0)
        frame.Name = "Background"
        frame.Parent = Guitwo
        local frameborder = Instance.new("Frame")
        frameborder.Size = UDim2.new(1, 0, 0, 8)
        frameborder.BorderSizePixel = 0
        frameborder.BackgroundColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frameborder.Parent = frame
        local frametitle = Instance.new("TextLabel")
        frametitle.Font = Enum.Font.SourceSansLight
        frametitle.BackgroundTransparency = 1
        frametitle.Position = UDim2.new(0, 0, 0, 30)
        frametitle.TextColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frametitle.Size = UDim2.new(1, 0, 0, 28)
        frametitle.Text = "          "..title
        frametitle.TextSize = 24
        frametitle.TextXAlignment = Enum.TextXAlignment.Left
        frametitle.TextYAlignment = Enum.TextYAlignment.Top
        frametitle.Parent = frame
        local frametext = Instance.new("TextLabel")
        frametext.Font = Enum.Font.SourceSansLight
        frametext.BackgroundTransparency = 1
        frametext.Position = UDim2.new(0, 0, 0, 68)
        frametext.TextColor3 = Color3.new(1, 1, 1)
        frametext.Size = UDim2.new(1, 0, 0, 28)
        frametext.Text = "          "..text
        frametext.TextSize = 24
        frametext.TextXAlignment = Enum.TextXAlignment.Left
        frametext.TextYAlignment = Enum.TextYAlignment.Top
        frametext.Parent = frame
        local textsize = game:GetService("TextService"):GetTextSize(frametitle.Text, frametitle.TextSize, frametitle.Font, Vector2.new(100000, 100000))
        local textsize2 = game:GetService("TextService"):GetTextSize(frametext.Text, frametext.TextSize, frametext.Font, Vector2.new(100000, 100000))
        if textsize2.X > textsize.X then textsize = textsize2 end
        frame.Size = UDim2.new(0, textsize.X + 38, 0, 115)
        pcall(function()
            frame:TweenPosition(UDim2.new(0.5, 0, 0, 20), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.15)
            game:GetService("Debris"):AddItem(frame, delay2 + 0.15)
        end)
    end)
end

createnotification("Notification", "Robot Animation has been Enabled", 2, true) -- false is off true is on
	local Animate =
	game.Players.LocalPlayer.Character.Animate
	Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=616088211"
	Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=616089559"
	Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=616095330"
	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=616091570"
	Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=616090535"
	Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=616086039"
	Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=616087089"
	end)
	
	Tab6Section:NewButton("Toy","Opens Toy Animation",function()
		local Guitwo = game.CoreGui.RektskyNotificationGui

local function createnotification(title, text, delay2, toggled)
    spawn(function()
        if Guitwo:FindFirstChild("Background") then Guitwo:FindFirstChild("Background"):Destroy() end
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(0, 100, 0, 115)
        frame.Position = UDim2.new(0.5, 0, 0, -115)
        frame.BorderSizePixel = 0
        frame.AnchorPoint = Vector2.new(0.5, 0)
        frame.BackgroundTransparency = 0.5
        frame.BackgroundColor3 = Color3.new(0, 0, 0)
        frame.Name = "Background"
        frame.Parent = Guitwo
        local frameborder = Instance.new("Frame")
        frameborder.Size = UDim2.new(1, 0, 0, 8)
        frameborder.BorderSizePixel = 0
        frameborder.BackgroundColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frameborder.Parent = frame
        local frametitle = Instance.new("TextLabel")
        frametitle.Font = Enum.Font.SourceSansLight
        frametitle.BackgroundTransparency = 1
        frametitle.Position = UDim2.new(0, 0, 0, 30)
        frametitle.TextColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frametitle.Size = UDim2.new(1, 0, 0, 28)
        frametitle.Text = "          "..title
        frametitle.TextSize = 24
        frametitle.TextXAlignment = Enum.TextXAlignment.Left
        frametitle.TextYAlignment = Enum.TextYAlignment.Top
        frametitle.Parent = frame
        local frametext = Instance.new("TextLabel")
        frametext.Font = Enum.Font.SourceSansLight
        frametext.BackgroundTransparency = 1
        frametext.Position = UDim2.new(0, 0, 0, 68)
        frametext.TextColor3 = Color3.new(1, 1, 1)
        frametext.Size = UDim2.new(1, 0, 0, 28)
        frametext.Text = "          "..text
        frametext.TextSize = 24
        frametext.TextXAlignment = Enum.TextXAlignment.Left
        frametext.TextYAlignment = Enum.TextYAlignment.Top
        frametext.Parent = frame
        local textsize = game:GetService("TextService"):GetTextSize(frametitle.Text, frametitle.TextSize, frametitle.Font, Vector2.new(100000, 100000))
        local textsize2 = game:GetService("TextService"):GetTextSize(frametext.Text, frametext.TextSize, frametext.Font, Vector2.new(100000, 100000))
        if textsize2.X > textsize.X then textsize = textsize2 end
        frame.Size = UDim2.new(0, textsize.X + 38, 0, 115)
        pcall(function()
            frame:TweenPosition(UDim2.new(0.5, 0, 0, 20), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.15)
            game:GetService("Debris"):AddItem(frame, delay2 + 0.15)
        end)
    end)
end

createnotification("Notification", "Toy Animation has been Enabled", 2, true) -- false is off true is on
	local Animate =
	game.Players.LocalPlayer.Character.Animate
	Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=782841498"
	Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=782845736"
	Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=782843345"
	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=782842708"
	Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=782847020"
	Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=782843869"
	Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=782846423"
	end)
	
	Tab6Section:NewButton("Levitation"," Levitation Animation",function()
		local Guitwo = game.CoreGui.RektskyNotificationGui

local function createnotification(title, text, delay2, toggled)
    spawn(function()
        if Guitwo:FindFirstChild("Background") then Guitwo:FindFirstChild("Background"):Destroy() end
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(0, 100, 0, 115)
        frame.Position = UDim2.new(0.5, 0, 0, -115)
        frame.BorderSizePixel = 0
        frame.AnchorPoint = Vector2.new(0.5, 0)
        frame.BackgroundTransparency = 0.5
        frame.BackgroundColor3 = Color3.new(0, 0, 0)
        frame.Name = "Background"
        frame.Parent = Guitwo
        local frameborder = Instance.new("Frame")
        frameborder.Size = UDim2.new(1, 0, 0, 8)
        frameborder.BorderSizePixel = 0
        frameborder.BackgroundColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frameborder.Parent = frame
        local frametitle = Instance.new("TextLabel")
        frametitle.Font = Enum.Font.SourceSansLight
        frametitle.BackgroundTransparency = 1
        frametitle.Position = UDim2.new(0, 0, 0, 30)
        frametitle.TextColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frametitle.Size = UDim2.new(1, 0, 0, 28)
        frametitle.Text = "          "..title
        frametitle.TextSize = 24
        frametitle.TextXAlignment = Enum.TextXAlignment.Left
        frametitle.TextYAlignment = Enum.TextYAlignment.Top
        frametitle.Parent = frame
        local frametext = Instance.new("TextLabel")
        frametext.Font = Enum.Font.SourceSansLight
        frametext.BackgroundTransparency = 1
        frametext.Position = UDim2.new(0, 0, 0, 68)
        frametext.TextColor3 = Color3.new(1, 1, 1)
        frametext.Size = UDim2.new(1, 0, 0, 28)
        frametext.Text = "          "..text
        frametext.TextSize = 24
        frametext.TextXAlignment = Enum.TextXAlignment.Left
        frametext.TextYAlignment = Enum.TextYAlignment.Top
        frametext.Parent = frame
        local textsize = game:GetService("TextService"):GetTextSize(frametitle.Text, frametitle.TextSize, frametitle.Font, Vector2.new(100000, 100000))
        local textsize2 = game:GetService("TextService"):GetTextSize(frametext.Text, frametext.TextSize, frametext.Font, Vector2.new(100000, 100000))
        if textsize2.X > textsize.X then textsize = textsize2 end
        frame.Size = UDim2.new(0, textsize.X + 38, 0, 115)
        pcall(function()
            frame:TweenPosition(UDim2.new(0.5, 0, 0, 20), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.15)
            game:GetService("Debris"):AddItem(frame, delay2 + 0.15)
        end)
    end)
end

createnotification("Notification", "Levitation Animation has been Enabled", 2, true) -- false is off true is on
	local Animate =
	game.Players.LocalPlayer.Character.Animate
	Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=616006778"
	Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=616008087"
	Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=616013216"
	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=616010382"
	Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=616008936"
	Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=616003713"
	Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=616005863"
	game.Players.LocalPlayer.Character.Humanoid.Jump = true
	end)
	
	Tab6Section:NewButton("Astronaut" , "Astronaut Animation",function()
		local Guitwo = game.CoreGui.RektskyNotificationGui

local function createnotification(title, text, delay2, toggled)
    spawn(function()
        if Guitwo:FindFirstChild("Background") then Guitwo:FindFirstChild("Background"):Destroy() end
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(0, 100, 0, 115)
        frame.Position = UDim2.new(0.5, 0, 0, -115)
        frame.BorderSizePixel = 0
        frame.AnchorPoint = Vector2.new(0.5, 0)
        frame.BackgroundTransparency = 0.5
        frame.BackgroundColor3 = Color3.new(0, 0, 0)
        frame.Name = "Background"
        frame.Parent = Guitwo
        local frameborder = Instance.new("Frame")
        frameborder.Size = UDim2.new(1, 0, 0, 8)
        frameborder.BorderSizePixel = 0
        frameborder.BackgroundColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frameborder.Parent = frame
        local frametitle = Instance.new("TextLabel")
        frametitle.Font = Enum.Font.SourceSansLight
        frametitle.BackgroundTransparency = 1
        frametitle.Position = UDim2.new(0, 0, 0, 30)
        frametitle.TextColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frametitle.Size = UDim2.new(1, 0, 0, 28)
        frametitle.Text = "          "..title
        frametitle.TextSize = 24
        frametitle.TextXAlignment = Enum.TextXAlignment.Left
        frametitle.TextYAlignment = Enum.TextYAlignment.Top
        frametitle.Parent = frame
        local frametext = Instance.new("TextLabel")
        frametext.Font = Enum.Font.SourceSansLight
        frametext.BackgroundTransparency = 1
        frametext.Position = UDim2.new(0, 0, 0, 68)
        frametext.TextColor3 = Color3.new(1, 1, 1)
        frametext.Size = UDim2.new(1, 0, 0, 28)
        frametext.Text = "          "..text
        frametext.TextSize = 24
        frametext.TextXAlignment = Enum.TextXAlignment.Left
        frametext.TextYAlignment = Enum.TextYAlignment.Top
        frametext.Parent = frame
        local textsize = game:GetService("TextService"):GetTextSize(frametitle.Text, frametitle.TextSize, frametitle.Font, Vector2.new(100000, 100000))
        local textsize2 = game:GetService("TextService"):GetTextSize(frametext.Text, frametext.TextSize, frametext.Font, Vector2.new(100000, 100000))
        if textsize2.X > textsize.X then textsize = textsize2 end
        frame.Size = UDim2.new(0, textsize.X + 38, 0, 115)
        pcall(function()
            frame:TweenPosition(UDim2.new(0.5, 0, 0, 20), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.15)
            game:GetService("Debris"):AddItem(frame, delay2 + 0.15)
        end)
    end)
end

createnotification("Notification", "Astronaut Animation has been Enabled", 2, true) -- false is off true is on
	local Animate =
	game.Players.LocalPlayer.Character.Animate
	Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=891621366"
	Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=891633237"
	Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=891667138"
	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=891636393"
	Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=891627522"
	Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=891609353"
	Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=891617961"
	game.Players.LocalPlayer.Character.Humanoid.Jump = true
	end)
	
	Tab6Section:NewButton("Bubbly" , "Bubbly Animation",function()
		local Guitwo = game.CoreGui.RektskyNotificationGui

local function createnotification(title, text, delay2, toggled)
    spawn(function()
        if Guitwo:FindFirstChild("Background") then Guitwo:FindFirstChild("Background"):Destroy() end
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(0, 100, 0, 115)
        frame.Position = UDim2.new(0.5, 0, 0, -115)
        frame.BorderSizePixel = 0
        frame.AnchorPoint = Vector2.new(0.5, 0)
        frame.BackgroundTransparency = 0.5
        frame.BackgroundColor3 = Color3.new(0, 0, 0)
        frame.Name = "Background"
        frame.Parent = Guitwo
        local frameborder = Instance.new("Frame")
        frameborder.Size = UDim2.new(1, 0, 0, 8)
        frameborder.BorderSizePixel = 0
        frameborder.BackgroundColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frameborder.Parent = frame
        local frametitle = Instance.new("TextLabel")
        frametitle.Font = Enum.Font.SourceSansLight
        frametitle.BackgroundTransparency = 1
        frametitle.Position = UDim2.new(0, 0, 0, 30)
        frametitle.TextColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frametitle.Size = UDim2.new(1, 0, 0, 28)
        frametitle.Text = "          "..title
        frametitle.TextSize = 24
        frametitle.TextXAlignment = Enum.TextXAlignment.Left
        frametitle.TextYAlignment = Enum.TextYAlignment.Top
        frametitle.Parent = frame
        local frametext = Instance.new("TextLabel")
        frametext.Font = Enum.Font.SourceSansLight
        frametext.BackgroundTransparency = 1
        frametext.Position = UDim2.new(0, 0, 0, 68)
        frametext.TextColor3 = Color3.new(1, 1, 1)
        frametext.Size = UDim2.new(1, 0, 0, 28)
        frametext.Text = "          "..text
        frametext.TextSize = 24
        frametext.TextXAlignment = Enum.TextXAlignment.Left
        frametext.TextYAlignment = Enum.TextYAlignment.Top
        frametext.Parent = frame
        local textsize = game:GetService("TextService"):GetTextSize(frametitle.Text, frametitle.TextSize, frametitle.Font, Vector2.new(100000, 100000))
        local textsize2 = game:GetService("TextService"):GetTextSize(frametext.Text, frametext.TextSize, frametext.Font, Vector2.new(100000, 100000))
        if textsize2.X > textsize.X then textsize = textsize2 end
        frame.Size = UDim2.new(0, textsize.X + 38, 0, 115)
        pcall(function()
            frame:TweenPosition(UDim2.new(0.5, 0, 0, 20), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.15)
            game:GetService("Debris"):AddItem(frame, delay2 + 0.15)
        end)
    end)
end

createnotification("Notification", "Bubbly Animationhas been Enabled", 2, true) -- false is off true is on
	local Animate =
	game.Players.LocalPlayer.Character.Animate
	Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=910004836"
	Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=910009958"
	Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=910034870"
	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=910025107"
	Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=910016857"
	Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=910001910"
	Animate.swimidle.SwimIdle.AnimationId = "http://www.roblox.com/asset/?id=910030921"
	Animate.swim.Swim.AnimationId = "http://www.roblox.com/asset/?id=910028158"
	game.Players.LocalPlayer.Character.Humanoid.Jump = true
	end)
	
	Tab6Section:NewButton("Cartoony" , "Cartoony Animation",function()
		local Guitwo = game.CoreGui.RektskyNotificationGui

local function createnotification(title, text, delay2, toggled)
    spawn(function()
        if Guitwo:FindFirstChild("Background") then Guitwo:FindFirstChild("Background"):Destroy() end
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(0, 100, 0, 115)
        frame.Position = UDim2.new(0.5, 0, 0, -115)
        frame.BorderSizePixel = 0
        frame.AnchorPoint = Vector2.new(0.5, 0)
        frame.BackgroundTransparency = 0.5
        frame.BackgroundColor3 = Color3.new(0, 0, 0)
        frame.Name = "Background"
        frame.Parent = Guitwo
        local frameborder = Instance.new("Frame")
        frameborder.Size = UDim2.new(1, 0, 0, 8)
        frameborder.BorderSizePixel = 0
        frameborder.BackgroundColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frameborder.Parent = frame
        local frametitle = Instance.new("TextLabel")
        frametitle.Font = Enum.Font.SourceSansLight
        frametitle.BackgroundTransparency = 1
        frametitle.Position = UDim2.new(0, 0, 0, 30)
        frametitle.TextColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frametitle.Size = UDim2.new(1, 0, 0, 28)
        frametitle.Text = "          "..title
        frametitle.TextSize = 24
        frametitle.TextXAlignment = Enum.TextXAlignment.Left
        frametitle.TextYAlignment = Enum.TextYAlignment.Top
        frametitle.Parent = frame
        local frametext = Instance.new("TextLabel")
        frametext.Font = Enum.Font.SourceSansLight
        frametext.BackgroundTransparency = 1
        frametext.Position = UDim2.new(0, 0, 0, 68)
        frametext.TextColor3 = Color3.new(1, 1, 1)
        frametext.Size = UDim2.new(1, 0, 0, 28)
        frametext.Text = "          "..text
        frametext.TextSize = 24
        frametext.TextXAlignment = Enum.TextXAlignment.Left
        frametext.TextYAlignment = Enum.TextYAlignment.Top
        frametext.Parent = frame
        local textsize = game:GetService("TextService"):GetTextSize(frametitle.Text, frametitle.TextSize, frametitle.Font, Vector2.new(100000, 100000))
        local textsize2 = game:GetService("TextService"):GetTextSize(frametext.Text, frametext.TextSize, frametext.Font, Vector2.new(100000, 100000))
        if textsize2.X > textsize.X then textsize = textsize2 end
        frame.Size = UDim2.new(0, textsize.X + 38, 0, 115)
        pcall(function()
            frame:TweenPosition(UDim2.new(0.5, 0, 0, 20), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.15)
            game:GetService("Debris"):AddItem(frame, delay2 + 0.15)
        end)
    end)
end

createnotification("Notification", "Cartoony Animation has been Enabled", 2, true) -- false is off true is on
	local Animate =
	game.Players.LocalPlayer.Character.Animate
	Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=742637544"
	Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=742638445"
	Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=742640026"
	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=742638842"
	Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=742637942"
	Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=742636889"
	Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=742637151"
	game.Players.LocalPlayer.Character.Humanoid.Jump = true
	end)
	
	Tab6Section:NewButton("Elder" , "Elder Animation",function()
		local Guitwo = game.CoreGui.RektskyNotificationGui

local function createnotification(title, text, delay2, toggled)
    spawn(function()
        if Guitwo:FindFirstChild("Background") then Guitwo:FindFirstChild("Background"):Destroy() end
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(0, 100, 0, 115)
        frame.Position = UDim2.new(0.5, 0, 0, -115)
        frame.BorderSizePixel = 0
        frame.AnchorPoint = Vector2.new(0.5, 0)
        frame.BackgroundTransparency = 0.5
        frame.BackgroundColor3 = Color3.new(0, 0, 0)
        frame.Name = "Background"
        frame.Parent = Guitwo
        local frameborder = Instance.new("Frame")
        frameborder.Size = UDim2.new(1, 0, 0, 8)
        frameborder.BorderSizePixel = 0
        frameborder.BackgroundColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frameborder.Parent = frame
        local frametitle = Instance.new("TextLabel")
        frametitle.Font = Enum.Font.SourceSansLight
        frametitle.BackgroundTransparency = 1
        frametitle.Position = UDim2.new(0, 0, 0, 30)
        frametitle.TextColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frametitle.Size = UDim2.new(1, 0, 0, 28)
        frametitle.Text = "          "..title
        frametitle.TextSize = 24
        frametitle.TextXAlignment = Enum.TextXAlignment.Left
        frametitle.TextYAlignment = Enum.TextYAlignment.Top
        frametitle.Parent = frame
        local frametext = Instance.new("TextLabel")
        frametext.Font = Enum.Font.SourceSansLight
        frametext.BackgroundTransparency = 1
        frametext.Position = UDim2.new(0, 0, 0, 68)
        frametext.TextColor3 = Color3.new(1, 1, 1)
        frametext.Size = UDim2.new(1, 0, 0, 28)
        frametext.Text = "          "..text
        frametext.TextSize = 24
        frametext.TextXAlignment = Enum.TextXAlignment.Left
        frametext.TextYAlignment = Enum.TextYAlignment.Top
        frametext.Parent = frame
        local textsize = game:GetService("TextService"):GetTextSize(frametitle.Text, frametitle.TextSize, frametitle.Font, Vector2.new(100000, 100000))
        local textsize2 = game:GetService("TextService"):GetTextSize(frametext.Text, frametext.TextSize, frametext.Font, Vector2.new(100000, 100000))
        if textsize2.X > textsize.X then textsize = textsize2 end
        frame.Size = UDim2.new(0, textsize.X + 38, 0, 115)
        pcall(function()
            frame:TweenPosition(UDim2.new(0.5, 0, 0, 20), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.15)
            game:GetService("Debris"):AddItem(frame, delay2 + 0.15)
        end)
    end)
end

createnotification("Notification", "Elder Animation has been Enabled", 2, true) -- false is off true is on
	local Animate =
	game.Players.LocalPlayer.Character.Animate
	Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=845397899"
	Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=845400520"
	Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=845403856"
	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=845386501"
	Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=845398858"
	Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=845392038"
	Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=845396048"
	game.Players.LocalPlayer.Character.Humanoid.Jump = true
	end)
	
	Tab6Section:NewButton("Knight" , "Knight Animation",function()
		local Guitwo = game.CoreGui.RektskyNotificationGui

local function createnotification(title, text, delay2, toggled)
    spawn(function()
        if Guitwo:FindFirstChild("Background") then Guitwo:FindFirstChild("Background"):Destroy() end
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(0, 100, 0, 115)
        frame.Position = UDim2.new(0.5, 0, 0, -115)
        frame.BorderSizePixel = 0
        frame.AnchorPoint = Vector2.new(0.5, 0)
        frame.BackgroundTransparency = 0.5
        frame.BackgroundColor3 = Color3.new(0, 0, 0)
        frame.Name = "Background"
        frame.Parent = Guitwo
        local frameborder = Instance.new("Frame")
        frameborder.Size = UDim2.new(1, 0, 0, 8)
        frameborder.BorderSizePixel = 0
        frameborder.BackgroundColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frameborder.Parent = frame
        local frametitle = Instance.new("TextLabel")
        frametitle.Font = Enum.Font.SourceSansLight
        frametitle.BackgroundTransparency = 1
        frametitle.Position = UDim2.new(0, 0, 0, 30)
        frametitle.TextColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frametitle.Size = UDim2.new(1, 0, 0, 28)
        frametitle.Text = "          "..title
        frametitle.TextSize = 24
        frametitle.TextXAlignment = Enum.TextXAlignment.Left
        frametitle.TextYAlignment = Enum.TextYAlignment.Top
        frametitle.Parent = frame
        local frametext = Instance.new("TextLabel")
        frametext.Font = Enum.Font.SourceSansLight
        frametext.BackgroundTransparency = 1
        frametext.Position = UDim2.new(0, 0, 0, 68)
        frametext.TextColor3 = Color3.new(1, 1, 1)
        frametext.Size = UDim2.new(1, 0, 0, 28)
        frametext.Text = "          "..text
        frametext.TextSize = 24
        frametext.TextXAlignment = Enum.TextXAlignment.Left
        frametext.TextYAlignment = Enum.TextYAlignment.Top
        frametext.Parent = frame
        local textsize = game:GetService("TextService"):GetTextSize(frametitle.Text, frametitle.TextSize, frametitle.Font, Vector2.new(100000, 100000))
        local textsize2 = game:GetService("TextService"):GetTextSize(frametext.Text, frametext.TextSize, frametext.Font, Vector2.new(100000, 100000))
        if textsize2.X > textsize.X then textsize = textsize2 end
        frame.Size = UDim2.new(0, textsize.X + 38, 0, 115)
        pcall(function()
            frame:TweenPosition(UDim2.new(0.5, 0, 0, 20), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.15)
            game:GetService("Debris"):AddItem(frame, delay2 + 0.15)
        end)
    end)
end

createnotification("Notification", "Knight Animation has been Enabled", 2, true) -- false is off true is on
	local Animate =
	game.Players.LocalPlayer.Character.Animate
	Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=657595757"
	Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=657568135"
	Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=657552124"
	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=657564596"
	Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=658409194"
	Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=658360781"
	Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=657600338"
	game.Players.LocalPlayer.Character.Humanoid.Jump = true
	end)
	
	Tab6Section:NewButton("Mage" , "Mage Animation",function()
		local Guitwo = game.CoreGui.RektskyNotificationGui

local function createnotification(title, text, delay2, toggled)
    spawn(function()
        if Guitwo:FindFirstChild("Background") then Guitwo:FindFirstChild("Background"):Destroy() end
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(0, 100, 0, 115)
        frame.Position = UDim2.new(0.5, 0, 0, -115)
        frame.BorderSizePixel = 0
        frame.AnchorPoint = Vector2.new(0.5, 0)
        frame.BackgroundTransparency = 0.5
        frame.BackgroundColor3 = Color3.new(0, 0, 0)
        frame.Name = "Background"
        frame.Parent = Guitwo
        local frameborder = Instance.new("Frame")
        frameborder.Size = UDim2.new(1, 0, 0, 8)
        frameborder.BorderSizePixel = 0
        frameborder.BackgroundColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frameborder.Parent = frame
        local frametitle = Instance.new("TextLabel")
        frametitle.Font = Enum.Font.SourceSansLight
        frametitle.BackgroundTransparency = 1
        frametitle.Position = UDim2.new(0, 0, 0, 30)
        frametitle.TextColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frametitle.Size = UDim2.new(1, 0, 0, 28)
        frametitle.Text = "          "..title
        frametitle.TextSize = 24
        frametitle.TextXAlignment = Enum.TextXAlignment.Left
        frametitle.TextYAlignment = Enum.TextYAlignment.Top
        frametitle.Parent = frame
        local frametext = Instance.new("TextLabel")
        frametext.Font = Enum.Font.SourceSansLight
        frametext.BackgroundTransparency = 1
        frametext.Position = UDim2.new(0, 0, 0, 68)
        frametext.TextColor3 = Color3.new(1, 1, 1)
        frametext.Size = UDim2.new(1, 0, 0, 28)
        frametext.Text = "          "..text
        frametext.TextSize = 24
        frametext.TextXAlignment = Enum.TextXAlignment.Left
        frametext.TextYAlignment = Enum.TextYAlignment.Top
        frametext.Parent = frame
        local textsize = game:GetService("TextService"):GetTextSize(frametitle.Text, frametitle.TextSize, frametitle.Font, Vector2.new(100000, 100000))
        local textsize2 = game:GetService("TextService"):GetTextSize(frametext.Text, frametext.TextSize, frametext.Font, Vector2.new(100000, 100000))
        if textsize2.X > textsize.X then textsize = textsize2 end
        frame.Size = UDim2.new(0, textsize.X + 38, 0, 115)
        pcall(function()
            frame:TweenPosition(UDim2.new(0.5, 0, 0, 20), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.15)
            game:GetService("Debris"):AddItem(frame, delay2 + 0.15)
        end)
    end)
end

createnotification("Notification", "Mage Animation has been Enabled", 2, true) -- false is off true is on
	local Animate =
	game.Players.LocalPlayer.Character.Animate
	Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=707742142"
	Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=707855907"
	Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=707897309"
	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=707861613"
	Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=707853694"
	Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=707826056"
	Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=707829716"
	game.Players.LocalPlayer.Character.Humanoid.Jump = true
	end)
	
	Tab6Section:NewButton("Pirate" , "Pirate Animation",function()
		local Guitwo = game.CoreGui.RektskyNotificationGui

local function createnotification(title, text, delay2, toggled)
    spawn(function()
        if Guitwo:FindFirstChild("Background") then Guitwo:FindFirstChild("Background"):Destroy() end
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(0, 100, 0, 115)
        frame.Position = UDim2.new(0.5, 0, 0, -115)
        frame.BorderSizePixel = 0
        frame.AnchorPoint = Vector2.new(0.5, 0)
        frame.BackgroundTransparency = 0.5
        frame.BackgroundColor3 = Color3.new(0, 0, 0)
        frame.Name = "Background"
        frame.Parent = Guitwo
        local frameborder = Instance.new("Frame")
        frameborder.Size = UDim2.new(1, 0, 0, 8)
        frameborder.BorderSizePixel = 0
        frameborder.BackgroundColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frameborder.Parent = frame
        local frametitle = Instance.new("TextLabel")
        frametitle.Font = Enum.Font.SourceSansLight
        frametitle.BackgroundTransparency = 1
        frametitle.Position = UDim2.new(0, 0, 0, 30)
        frametitle.TextColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frametitle.Size = UDim2.new(1, 0, 0, 28)
        frametitle.Text = "          "..title
        frametitle.TextSize = 24
        frametitle.TextXAlignment = Enum.TextXAlignment.Left
        frametitle.TextYAlignment = Enum.TextYAlignment.Top
        frametitle.Parent = frame
        local frametext = Instance.new("TextLabel")
        frametext.Font = Enum.Font.SourceSansLight
        frametext.BackgroundTransparency = 1
        frametext.Position = UDim2.new(0, 0, 0, 68)
        frametext.TextColor3 = Color3.new(1, 1, 1)
        frametext.Size = UDim2.new(1, 0, 0, 28)
        frametext.Text = "          "..text
        frametext.TextSize = 24
        frametext.TextXAlignment = Enum.TextXAlignment.Left
        frametext.TextYAlignment = Enum.TextYAlignment.Top
        frametext.Parent = frame
        local textsize = game:GetService("TextService"):GetTextSize(frametitle.Text, frametitle.TextSize, frametitle.Font, Vector2.new(100000, 100000))
        local textsize2 = game:GetService("TextService"):GetTextSize(frametext.Text, frametext.TextSize, frametext.Font, Vector2.new(100000, 100000))
        if textsize2.X > textsize.X then textsize = textsize2 end
        frame.Size = UDim2.new(0, textsize.X + 38, 0, 115)
        pcall(function()
            frame:TweenPosition(UDim2.new(0.5, 0, 0, 20), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.15)
            game:GetService("Debris"):AddItem(frame, delay2 + 0.15)
        end)
    end)
end

createnotification("Notification", "Pirate Animation has been Enabled", 2, true) -- false is off true is on
	local Animate =
	game.Players.LocalPlayer.Character.Animate
	Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=750781874"
	Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=750782770"
	Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=750785693"
	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=750783738"
	Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=750782230"
	Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=750779899"
	Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=750780242"
	game.Players.LocalPlayer.Character.Humanoid.Jump = true
	end)
	
	Tab6Section:NewButton("Stylish" , "Stylish Animation",function()
		local Guitwo = game.CoreGui.RektskyNotificationGui

local function createnotification(title, text, delay2, toggled)
    spawn(function()
        if Guitwo:FindFirstChild("Background") then Guitwo:FindFirstChild("Background"):Destroy() end
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(0, 100, 0, 115)
        frame.Position = UDim2.new(0.5, 0, 0, -115)
        frame.BorderSizePixel = 0
        frame.AnchorPoint = Vector2.new(0.5, 0)
        frame.BackgroundTransparency = 0.5
        frame.BackgroundColor3 = Color3.new(0, 0, 0)
        frame.Name = "Background"
        frame.Parent = Guitwo
        local frameborder = Instance.new("Frame")
        frameborder.Size = UDim2.new(1, 0, 0, 8)
        frameborder.BorderSizePixel = 0
        frameborder.BackgroundColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frameborder.Parent = frame
        local frametitle = Instance.new("TextLabel")
        frametitle.Font = Enum.Font.SourceSansLight
        frametitle.BackgroundTransparency = 1
        frametitle.Position = UDim2.new(0, 0, 0, 30)
        frametitle.TextColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frametitle.Size = UDim2.new(1, 0, 0, 28)
        frametitle.Text = "          "..title
        frametitle.TextSize = 24
        frametitle.TextXAlignment = Enum.TextXAlignment.Left
        frametitle.TextYAlignment = Enum.TextYAlignment.Top
        frametitle.Parent = frame
        local frametext = Instance.new("TextLabel")
        frametext.Font = Enum.Font.SourceSansLight
        frametext.BackgroundTransparency = 1
        frametext.Position = UDim2.new(0, 0, 0, 68)
        frametext.TextColor3 = Color3.new(1, 1, 1)
        frametext.Size = UDim2.new(1, 0, 0, 28)
        frametext.Text = "          "..text
        frametext.TextSize = 24
        frametext.TextXAlignment = Enum.TextXAlignment.Left
        frametext.TextYAlignment = Enum.TextYAlignment.Top
        frametext.Parent = frame
        local textsize = game:GetService("TextService"):GetTextSize(frametitle.Text, frametitle.TextSize, frametitle.Font, Vector2.new(100000, 100000))
        local textsize2 = game:GetService("TextService"):GetTextSize(frametext.Text, frametext.TextSize, frametext.Font, Vector2.new(100000, 100000))
        if textsize2.X > textsize.X then textsize = textsize2 end
        frame.Size = UDim2.new(0, textsize.X + 38, 0, 115)
        pcall(function()
            frame:TweenPosition(UDim2.new(0.5, 0, 0, 20), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.15)
            game:GetService("Debris"):AddItem(frame, delay2 + 0.15)
        end)
    end)
end

createnotification("Notification", "Stylish Animation has been Enabled", 2, true) -- false is off true is on
	local Animate =
	game.Players.LocalPlayer.Character.Animate
	Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=616136790"
	Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=616138447"
	Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=616146177"
	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=616140816"
	Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=616139451"
	Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=616133594"
	Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=616134815"
	game.Players.LocalPlayer.Character.Humanoid.Jump = true
	end)
	
	Tab6Section:NewButton("Super Hero" , "Super Hero Animation",function()
		local Guitwo = game.CoreGui.RektskyNotificationGui

local function createnotification(title, text, delay2, toggled)
    spawn(function()
        if Guitwo:FindFirstChild("Background") then Guitwo:FindFirstChild("Background"):Destroy() end
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(0, 100, 0, 115)
        frame.Position = UDim2.new(0.5, 0, 0, -115)
        frame.BorderSizePixel = 0
        frame.AnchorPoint = Vector2.new(0.5, 0)
        frame.BackgroundTransparency = 0.5
        frame.BackgroundColor3 = Color3.new(0, 0, 0)
        frame.Name = "Background"
        frame.Parent = Guitwo
        local frameborder = Instance.new("Frame")
        frameborder.Size = UDim2.new(1, 0, 0, 8)
        frameborder.BorderSizePixel = 0
        frameborder.BackgroundColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frameborder.Parent = frame
        local frametitle = Instance.new("TextLabel")
        frametitle.Font = Enum.Font.SourceSansLight
        frametitle.BackgroundTransparency = 1
        frametitle.Position = UDim2.new(0, 0, 0, 30)
        frametitle.TextColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frametitle.Size = UDim2.new(1, 0, 0, 28)
        frametitle.Text = "          "..title
        frametitle.TextSize = 24
        frametitle.TextXAlignment = Enum.TextXAlignment.Left
        frametitle.TextYAlignment = Enum.TextYAlignment.Top
        frametitle.Parent = frame
        local frametext = Instance.new("TextLabel")
        frametext.Font = Enum.Font.SourceSansLight
        frametext.BackgroundTransparency = 1
        frametext.Position = UDim2.new(0, 0, 0, 68)
        frametext.TextColor3 = Color3.new(1, 1, 1)
        frametext.Size = UDim2.new(1, 0, 0, 28)
        frametext.Text = "          "..text
        frametext.TextSize = 24
        frametext.TextXAlignment = Enum.TextXAlignment.Left
        frametext.TextYAlignment = Enum.TextYAlignment.Top
        frametext.Parent = frame
        local textsize = game:GetService("TextService"):GetTextSize(frametitle.Text, frametitle.TextSize, frametitle.Font, Vector2.new(100000, 100000))
        local textsize2 = game:GetService("TextService"):GetTextSize(frametext.Text, frametext.TextSize, frametext.Font, Vector2.new(100000, 100000))
        if textsize2.X > textsize.X then textsize = textsize2 end
        frame.Size = UDim2.new(0, textsize.X + 38, 0, 115)
        pcall(function()
            frame:TweenPosition(UDim2.new(0.5, 0, 0, 20), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.15)
            game:GetService("Debris"):AddItem(frame, delay2 + 0.15)
        end)
    end)
end

createnotification("Notification", "Super Hero has been Enabled", 2, true) -- false is off true is on
	local Animate =
	game.Players.LocalPlayer.Character.Animate
	Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=616111295"
	Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=616113536"
	Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=616122287"
	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=616117076"
	Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=616115533"
	Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=616104706"
	Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=616108001"
	game.Players.LocalPlayer.Character.Humanoid.Jump = true
	end)
	
	Tab6Section:NewButton("Vampire" , "Vampire Animation",function()
		local Guitwo = game.CoreGui.RektskyNotificationGui

local function createnotification(title, text, delay2, toggled)
    spawn(function()
        if Guitwo:FindFirstChild("Background") then Guitwo:FindFirstChild("Background"):Destroy() end
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(0, 100, 0, 115)
        frame.Position = UDim2.new(0.5, 0, 0, -115)
        frame.BorderSizePixel = 0
        frame.AnchorPoint = Vector2.new(0.5, 0)
        frame.BackgroundTransparency = 0.5
        frame.BackgroundColor3 = Color3.new(0, 0, 0)
        frame.Name = "Background"
        frame.Parent = Guitwo
        local frameborder = Instance.new("Frame")
        frameborder.Size = UDim2.new(1, 0, 0, 8)
        frameborder.BorderSizePixel = 0
        frameborder.BackgroundColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frameborder.Parent = frame
        local frametitle = Instance.new("TextLabel")
        frametitle.Font = Enum.Font.SourceSansLight
        frametitle.BackgroundTransparency = 1
        frametitle.Position = UDim2.new(0, 0, 0, 30)
        frametitle.TextColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frametitle.Size = UDim2.new(1, 0, 0, 28)
        frametitle.Text = "          "..title
        frametitle.TextSize = 24
        frametitle.TextXAlignment = Enum.TextXAlignment.Left
        frametitle.TextYAlignment = Enum.TextYAlignment.Top
        frametitle.Parent = frame
        local frametext = Instance.new("TextLabel")
        frametext.Font = Enum.Font.SourceSansLight
        frametext.BackgroundTransparency = 1
        frametext.Position = UDim2.new(0, 0, 0, 68)
        frametext.TextColor3 = Color3.new(1, 1, 1)
        frametext.Size = UDim2.new(1, 0, 0, 28)
        frametext.Text = "          "..text
        frametext.TextSize = 24
        frametext.TextXAlignment = Enum.TextXAlignment.Left
        frametext.TextYAlignment = Enum.TextYAlignment.Top
        frametext.Parent = frame
        local textsize = game:GetService("TextService"):GetTextSize(frametitle.Text, frametitle.TextSize, frametitle.Font, Vector2.new(100000, 100000))
        local textsize2 = game:GetService("TextService"):GetTextSize(frametext.Text, frametext.TextSize, frametext.Font, Vector2.new(100000, 100000))
        if textsize2.X > textsize.X then textsize = textsize2 end
        frame.Size = UDim2.new(0, textsize.X + 38, 0, 115)
        pcall(function()
            frame:TweenPosition(UDim2.new(0.5, 0, 0, 20), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.15)
            game:GetService("Debris"):AddItem(frame, delay2 + 0.15)
        end)
    end)
end

createnotification("Notification", "Vampire Animation has been Enabled", 2, true) -- false is off true is on
	local Animate =
	game.Players.LocalPlayer.Character.Animate
	Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=1083445855"
	Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=1083450166"
	Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=1083473930"
	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=1083462077"
	Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=1083455352"
	Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=1083439238"
	Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=1083443587"
	game.Players.LocalPlayer.Character.Humanoid.Jump = true
	end)
	
	Tab6Section:NewButton("WereWolf" , "WereWolf Animation",function()
		local Guitwo = game.CoreGui.RektskyNotificationGui

local function createnotification(title, text, delay2, toggled)
    spawn(function()
        if Guitwo:FindFirstChild("Background") then Guitwo:FindFirstChild("Background"):Destroy() end
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(0, 100, 0, 115)
        frame.Position = UDim2.new(0.5, 0, 0, -115)
        frame.BorderSizePixel = 0
        frame.AnchorPoint = Vector2.new(0.5, 0)
        frame.BackgroundTransparency = 0.5
        frame.BackgroundColor3 = Color3.new(0, 0, 0)
        frame.Name = "Background"
        frame.Parent = Guitwo
        local frameborder = Instance.new("Frame")
        frameborder.Size = UDim2.new(1, 0, 0, 8)
        frameborder.BorderSizePixel = 0
        frameborder.BackgroundColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frameborder.Parent = frame
        local frametitle = Instance.new("TextLabel")
        frametitle.Font = Enum.Font.SourceSansLight
        frametitle.BackgroundTransparency = 1
        frametitle.Position = UDim2.new(0, 0, 0, 30)
        frametitle.TextColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frametitle.Size = UDim2.new(1, 0, 0, 28)
        frametitle.Text = "          "..title
        frametitle.TextSize = 24
        frametitle.TextXAlignment = Enum.TextXAlignment.Left
        frametitle.TextYAlignment = Enum.TextYAlignment.Top
        frametitle.Parent = frame
        local frametext = Instance.new("TextLabel")
        frametext.Font = Enum.Font.SourceSansLight
        frametext.BackgroundTransparency = 1
        frametext.Position = UDim2.new(0, 0, 0, 68)
        frametext.TextColor3 = Color3.new(1, 1, 1)
        frametext.Size = UDim2.new(1, 0, 0, 28)
        frametext.Text = "          "..text
        frametext.TextSize = 24
        frametext.TextXAlignment = Enum.TextXAlignment.Left
        frametext.TextYAlignment = Enum.TextYAlignment.Top
        frametext.Parent = frame
        local textsize = game:GetService("TextService"):GetTextSize(frametitle.Text, frametitle.TextSize, frametitle.Font, Vector2.new(100000, 100000))
        local textsize2 = game:GetService("TextService"):GetTextSize(frametext.Text, frametext.TextSize, frametext.Font, Vector2.new(100000, 100000))
        if textsize2.X > textsize.X then textsize = textsize2 end
        frame.Size = UDim2.new(0, textsize.X + 38, 0, 115)
        pcall(function()
            frame:TweenPosition(UDim2.new(0.5, 0, 0, 20), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.15)
            game:GetService("Debris"):AddItem(frame, delay2 + 0.15)
        end)
    end)
end

createnotification("Notification", "WereWolf Animation has been Enabled", 2, true) -- false is off true is on
	local Animate =
	game.Players.LocalPlayer.Character.Animate
	Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=1083195517"
	Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=1083214717"
	Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=1083178339"
	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=1083216690"
	Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=1083218792"
	Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=1083182000"
	Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=1083189019"
	game.Players.LocalPlayer.Character.Humanoid.Jump = true
	end)
	
	Tab6Section:NewButton("CowBoy" , "CowBoy Animation",function()
		local Guitwo = game.CoreGui.RektskyNotificationGui

local function createnotification(title, text, delay2, toggled)
    spawn(function()
        if Guitwo:FindFirstChild("Background") then Guitwo:FindFirstChild("Background"):Destroy() end
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(0, 100, 0, 115)
        frame.Position = UDim2.new(0.5, 0, 0, -115)
        frame.BorderSizePixel = 0
        frame.AnchorPoint = Vector2.new(0.5, 0)
        frame.BackgroundTransparency = 0.5
        frame.BackgroundColor3 = Color3.new(0, 0, 0)
        frame.Name = "Background"
        frame.Parent = Guitwo
        local frameborder = Instance.new("Frame")
        frameborder.Size = UDim2.new(1, 0, 0, 8)
        frameborder.BorderSizePixel = 0
        frameborder.BackgroundColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frameborder.Parent = frame
        local frametitle = Instance.new("TextLabel")
        frametitle.Font = Enum.Font.SourceSansLight
        frametitle.BackgroundTransparency = 1
        frametitle.Position = UDim2.new(0, 0, 0, 30)
        frametitle.TextColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frametitle.Size = UDim2.new(1, 0, 0, 28)
        frametitle.Text = "          "..title
        frametitle.TextSize = 24
        frametitle.TextXAlignment = Enum.TextXAlignment.Left
        frametitle.TextYAlignment = Enum.TextYAlignment.Top
        frametitle.Parent = frame
        local frametext = Instance.new("TextLabel")
        frametext.Font = Enum.Font.SourceSansLight
        frametext.BackgroundTransparency = 1
        frametext.Position = UDim2.new(0, 0, 0, 68)
        frametext.TextColor3 = Color3.new(1, 1, 1)
        frametext.Size = UDim2.new(1, 0, 0, 28)
        frametext.Text = "          "..text
        frametext.TextSize = 24
        frametext.TextXAlignment = Enum.TextXAlignment.Left
        frametext.TextYAlignment = Enum.TextYAlignment.Top
        frametext.Parent = frame
        local textsize = game:GetService("TextService"):GetTextSize(frametitle.Text, frametitle.TextSize, frametitle.Font, Vector2.new(100000, 100000))
        local textsize2 = game:GetService("TextService"):GetTextSize(frametext.Text, frametext.TextSize, frametext.Font, Vector2.new(100000, 100000))
        if textsize2.X > textsize.X then textsize = textsize2 end
        frame.Size = UDim2.new(0, textsize.X + 38, 0, 115)
        pcall(function()
            frame:TweenPosition(UDim2.new(0.5, 0, 0, 20), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.15)
            game:GetService("Debris"):AddItem(frame, delay2 + 0.15)
        end)
    end)
end

createnotification("Notification", "CowBoy Animationhas been Enabled", 2, true) -- false is off true is on
	local Animate =
	game.Players.LocalPlayer.Character.Animate
	Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=1014390418"
	Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=1014398616"
	Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=1014421541"
	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=1014401683"
	Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=1014394726"
	Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=1014380606"
	Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=1014384571"
	game.Players.LocalPlayer.Character.Humanoid.Jump = true
	end)
	
	
	Tab6Section:NewButton("Patrol" , "Patrol Animation",function()
		local Guitwo = game.CoreGui.RektskyNotificationGui

local function createnotification(title, text, delay2, toggled)
    spawn(function()
        if Guitwo:FindFirstChild("Background") then Guitwo:FindFirstChild("Background"):Destroy() end
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(0, 100, 0, 115)
        frame.Position = UDim2.new(0.5, 0, 0, -115)
        frame.BorderSizePixel = 0
        frame.AnchorPoint = Vector2.new(0.5, 0)
        frame.BackgroundTransparency = 0.5
        frame.BackgroundColor3 = Color3.new(0, 0, 0)
        frame.Name = "Background"
        frame.Parent = Guitwo
        local frameborder = Instance.new("Frame")
        frameborder.Size = UDim2.new(1, 0, 0, 8)
        frameborder.BorderSizePixel = 0
        frameborder.BackgroundColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frameborder.Parent = frame
        local frametitle = Instance.new("TextLabel")
        frametitle.Font = Enum.Font.SourceSansLight
        frametitle.BackgroundTransparency = 1
        frametitle.Position = UDim2.new(0, 0, 0, 30)
        frametitle.TextColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frametitle.Size = UDim2.new(1, 0, 0, 28)
        frametitle.Text = "          "..title
        frametitle.TextSize = 24
        frametitle.TextXAlignment = Enum.TextXAlignment.Left
        frametitle.TextYAlignment = Enum.TextYAlignment.Top
        frametitle.Parent = frame
        local frametext = Instance.new("TextLabel")
        frametext.Font = Enum.Font.SourceSansLight
        frametext.BackgroundTransparency = 1
        frametext.Position = UDim2.new(0, 0, 0, 68)
        frametext.TextColor3 = Color3.new(1, 1, 1)
        frametext.Size = UDim2.new(1, 0, 0, 28)
        frametext.Text = "          "..text
        frametext.TextSize = 24
        frametext.TextXAlignment = Enum.TextXAlignment.Left
        frametext.TextYAlignment = Enum.TextYAlignment.Top
        frametext.Parent = frame
        local textsize = game:GetService("TextService"):GetTextSize(frametitle.Text, frametitle.TextSize, frametitle.Font, Vector2.new(100000, 100000))
        local textsize2 = game:GetService("TextService"):GetTextSize(frametext.Text, frametext.TextSize, frametext.Font, Vector2.new(100000, 100000))
        if textsize2.X > textsize.X then textsize = textsize2 end
        frame.Size = UDim2.new(0, textsize.X + 38, 0, 115)
        pcall(function()
            frame:TweenPosition(UDim2.new(0.5, 0, 0, 20), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.15)
            game:GetService("Debris"):AddItem(frame, delay2 + 0.15)
        end)
    end)
end

createnotification("Notification", "Patrol Animation has been Enabled", 2, true) -- false is off true is on
	local Animate =
	game.Players.LocalPlayer.Character.Animate
	Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=1149612882"
	Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=1150842221"
	Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=1151231493"
	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=1150967949"
	Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=1148811837"
	Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=1148811837"
	Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=1148863382"
	game.Players.LocalPlayer.Character.Humanoid.Jump = true
	end)
	
	Tab6Section:NewButton("Confident" , "Confident Animation",function()
		local Guitwo = game.CoreGui.RektskyNotificationGui

local function createnotification(title, text, delay2, toggled)
    spawn(function()
        if Guitwo:FindFirstChild("Background") then Guitwo:FindFirstChild("Background"):Destroy() end
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(0, 100, 0, 115)
        frame.Position = UDim2.new(0.5, 0, 0, -115)
        frame.BorderSizePixel = 0
        frame.AnchorPoint = Vector2.new(0.5, 0)
        frame.BackgroundTransparency = 0.5
        frame.BackgroundColor3 = Color3.new(0, 0, 0)
        frame.Name = "Background"
        frame.Parent = Guitwo
        local frameborder = Instance.new("Frame")
        frameborder.Size = UDim2.new(1, 0, 0, 8)
        frameborder.BorderSizePixel = 0
        frameborder.BackgroundColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frameborder.Parent = frame
        local frametitle = Instance.new("TextLabel")
        frametitle.Font = Enum.Font.SourceSansLight
        frametitle.BackgroundTransparency = 1
        frametitle.Position = UDim2.new(0, 0, 0, 30)
        frametitle.TextColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frametitle.Size = UDim2.new(1, 0, 0, 28)
        frametitle.Text = "          "..title
        frametitle.TextSize = 24
        frametitle.TextXAlignment = Enum.TextXAlignment.Left
        frametitle.TextYAlignment = Enum.TextYAlignment.Top
        frametitle.Parent = frame
        local frametext = Instance.new("TextLabel")
        frametext.Font = Enum.Font.SourceSansLight
        frametext.BackgroundTransparency = 1
        frametext.Position = UDim2.new(0, 0, 0, 68)
        frametext.TextColor3 = Color3.new(1, 1, 1)
        frametext.Size = UDim2.new(1, 0, 0, 28)
        frametext.Text = "          "..text
        frametext.TextSize = 24
        frametext.TextXAlignment = Enum.TextXAlignment.Left
        frametext.TextYAlignment = Enum.TextYAlignment.Top
        frametext.Parent = frame
        local textsize = game:GetService("TextService"):GetTextSize(frametitle.Text, frametitle.TextSize, frametitle.Font, Vector2.new(100000, 100000))
        local textsize2 = game:GetService("TextService"):GetTextSize(frametext.Text, frametext.TextSize, frametext.Font, Vector2.new(100000, 100000))
        if textsize2.X > textsize.X then textsize = textsize2 end
        frame.Size = UDim2.new(0, textsize.X + 38, 0, 115)
        pcall(function()
            frame:TweenPosition(UDim2.new(0.5, 0, 0, 20), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.15)
            game:GetService("Debris"):AddItem(frame, delay2 + 0.15)
        end)
    end)
end

createnotification("Notification", "Confident Animation has been Enabled", 2, true) -- false is off true is on
	local Animate =
	game.Players.LocalPlayer.Character.Animate
	Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=1069977950"
	Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=1069987858"
	Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=1070017263"
	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=1070001516"
	Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=1069984524"
	Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=1069946257"
	Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=1069973677"
	game.Players.LocalPlayer.Character.Humanoid.Jump = true
	end)
	
	Tab6Section:NewButton("PopStar" , "PopStar Animation",function()
		local Guitwo = game.CoreGui.RektskyNotificationGui

local function createnotification(title, text, delay2, toggled)
    spawn(function()
        if Guitwo:FindFirstChild("Background") then Guitwo:FindFirstChild("Background"):Destroy() end
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(0, 100, 0, 115)
        frame.Position = UDim2.new(0.5, 0, 0, -115)
        frame.BorderSizePixel = 0
        frame.AnchorPoint = Vector2.new(0.5, 0)
        frame.BackgroundTransparency = 0.5
        frame.BackgroundColor3 = Color3.new(0, 0, 0)
        frame.Name = "Background"
        frame.Parent = Guitwo
        local frameborder = Instance.new("Frame")
        frameborder.Size = UDim2.new(1, 0, 0, 8)
        frameborder.BorderSizePixel = 0
        frameborder.BackgroundColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frameborder.Parent = frame
        local frametitle = Instance.new("TextLabel")
        frametitle.Font = Enum.Font.SourceSansLight
        frametitle.BackgroundTransparency = 1
        frametitle.Position = UDim2.new(0, 0, 0, 30)
        frametitle.TextColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frametitle.Size = UDim2.new(1, 0, 0, 28)
        frametitle.Text = "          "..title
        frametitle.TextSize = 24
        frametitle.TextXAlignment = Enum.TextXAlignment.Left
        frametitle.TextYAlignment = Enum.TextYAlignment.Top
        frametitle.Parent = frame
        local frametext = Instance.new("TextLabel")
        frametext.Font = Enum.Font.SourceSansLight
        frametext.BackgroundTransparency = 1
        frametext.Position = UDim2.new(0, 0, 0, 68)
        frametext.TextColor3 = Color3.new(1, 1, 1)
        frametext.Size = UDim2.new(1, 0, 0, 28)
        frametext.Text = "          "..text
        frametext.TextSize = 24
        frametext.TextXAlignment = Enum.TextXAlignment.Left
        frametext.TextYAlignment = Enum.TextYAlignment.Top
        frametext.Parent = frame
        local textsize = game:GetService("TextService"):GetTextSize(frametitle.Text, frametitle.TextSize, frametitle.Font, Vector2.new(100000, 100000))
        local textsize2 = game:GetService("TextService"):GetTextSize(frametext.Text, frametext.TextSize, frametext.Font, Vector2.new(100000, 100000))
        if textsize2.X > textsize.X then textsize = textsize2 end
        frame.Size = UDim2.new(0, textsize.X + 38, 0, 115)
        pcall(function()
            frame:TweenPosition(UDim2.new(0.5, 0, 0, 20), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.15)
            game:GetService("Debris"):AddItem(frame, delay2 + 0.15)
        end)
    end)
end

createnotification("Notification", "PopStar Animation has been Enabled", 2, true) -- false is off true is on
	local Animate =
	game.Players.LocalPlayer.Character.Animate
	Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=1212900985"
	Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=1150842221"
	Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=1212980338"
	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=1212980348"
	Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=1212954642"
	Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=1213044953"
	Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=1212900995"
	game.Players.LocalPlayer.Character.Humanoid.Jump = true
	end)
	
	Tab6Section:NewButton("Ghost" , "Ghost Animation",function()
		local Guitwo = game.CoreGui.RektskyNotificationGui

local function createnotification(title, text, delay2, toggled)
    spawn(function()
        if Guitwo:FindFirstChild("Background") then Guitwo:FindFirstChild("Background"):Destroy() end
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(0, 100, 0, 115)
        frame.Position = UDim2.new(0.5, 0, 0, -115)
        frame.BorderSizePixel = 0
        frame.AnchorPoint = Vector2.new(0.5, 0)
        frame.BackgroundTransparency = 0.5
        frame.BackgroundColor3 = Color3.new(0, 0, 0)
        frame.Name = "Background"
        frame.Parent = Guitwo
        local frameborder = Instance.new("Frame")
        frameborder.Size = UDim2.new(1, 0, 0, 8)
        frameborder.BorderSizePixel = 0
        frameborder.BackgroundColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frameborder.Parent = frame
        local frametitle = Instance.new("TextLabel")
        frametitle.Font = Enum.Font.SourceSansLight
        frametitle.BackgroundTransparency = 1
        frametitle.Position = UDim2.new(0, 0, 0, 30)
        frametitle.TextColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frametitle.Size = UDim2.new(1, 0, 0, 28)
        frametitle.Text = "          "..title
        frametitle.TextSize = 24
        frametitle.TextXAlignment = Enum.TextXAlignment.Left
        frametitle.TextYAlignment = Enum.TextYAlignment.Top
        frametitle.Parent = frame
        local frametext = Instance.new("TextLabel")
        frametext.Font = Enum.Font.SourceSansLight
        frametext.BackgroundTransparency = 1
        frametext.Position = UDim2.new(0, 0, 0, 68)
        frametext.TextColor3 = Color3.new(1, 1, 1)
        frametext.Size = UDim2.new(1, 0, 0, 28)
        frametext.Text = "          "..text
        frametext.TextSize = 24
        frametext.TextXAlignment = Enum.TextXAlignment.Left
        frametext.TextYAlignment = Enum.TextYAlignment.Top
        frametext.Parent = frame
        local textsize = game:GetService("TextService"):GetTextSize(frametitle.Text, frametitle.TextSize, frametitle.Font, Vector2.new(100000, 100000))
        local textsize2 = game:GetService("TextService"):GetTextSize(frametext.Text, frametext.TextSize, frametext.Font, Vector2.new(100000, 100000))
        if textsize2.X > textsize.X then textsize = textsize2 end
        frame.Size = UDim2.new(0, textsize.X + 38, 0, 115)
        pcall(function()
            frame:TweenPosition(UDim2.new(0.5, 0, 0, 20), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.15)
            game:GetService("Debris"):AddItem(frame, delay2 + 0.15)
        end)
    end)
end

createnotification("Notification", "Ghost Animation has been Enabled", 2, true) -- false is off true is on
	local Animate =
	game.Players.LocalPlayer.Character.Animate
	Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=616006778"
	Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=616008087"
	Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=616013216"
	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=616013216"
	Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=616008936"
	Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=616005863"
	Animate.swimidle.SwimIdle.AnimationId = "http://www.roblox.com/asset/?id=616012453"
	Animate.swim.Swim.AnimationId = "http://www.roblox.com/asset/?id=616011509"
	game.Players.LocalPlayer.Character.Humanoid.Jump = true
	end)
	
	Tab6Section:NewButton("Sneaky" , "Sneaky Animation",function()
		local Guitwo = game.CoreGui.RektskyNotificationGui

local function createnotification(title, text, delay2, toggled)
    spawn(function()
        if Guitwo:FindFirstChild("Background") then Guitwo:FindFirstChild("Background"):Destroy() end
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(0, 100, 0, 115)
        frame.Position = UDim2.new(0.5, 0, 0, -115)
        frame.BorderSizePixel = 0
        frame.AnchorPoint = Vector2.new(0.5, 0)
        frame.BackgroundTransparency = 0.5
        frame.BackgroundColor3 = Color3.new(0, 0, 0)
        frame.Name = "Background"
        frame.Parent = Guitwo
        local frameborder = Instance.new("Frame")
        frameborder.Size = UDim2.new(1, 0, 0, 8)
        frameborder.BorderSizePixel = 0
        frameborder.BackgroundColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frameborder.Parent = frame
        local frametitle = Instance.new("TextLabel")
        frametitle.Font = Enum.Font.SourceSansLight
        frametitle.BackgroundTransparency = 1
        frametitle.Position = UDim2.new(0, 0, 0, 30)
        frametitle.TextColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frametitle.Size = UDim2.new(1, 0, 0, 28)
        frametitle.Text = "          "..title
        frametitle.TextSize = 24
        frametitle.TextXAlignment = Enum.TextXAlignment.Left
        frametitle.TextYAlignment = Enum.TextYAlignment.Top
        frametitle.Parent = frame
        local frametext = Instance.new("TextLabel")
        frametext.Font = Enum.Font.SourceSansLight
        frametext.BackgroundTransparency = 1
        frametext.Position = UDim2.new(0, 0, 0, 68)
        frametext.TextColor3 = Color3.new(1, 1, 1)
        frametext.Size = UDim2.new(1, 0, 0, 28)
        frametext.Text = "          "..text
        frametext.TextSize = 24
        frametext.TextXAlignment = Enum.TextXAlignment.Left
        frametext.TextYAlignment = Enum.TextYAlignment.Top
        frametext.Parent = frame
        local textsize = game:GetService("TextService"):GetTextSize(frametitle.Text, frametitle.TextSize, frametitle.Font, Vector2.new(100000, 100000))
        local textsize2 = game:GetService("TextService"):GetTextSize(frametext.Text, frametext.TextSize, frametext.Font, Vector2.new(100000, 100000))
        if textsize2.X > textsize.X then textsize = textsize2 end
        frame.Size = UDim2.new(0, textsize.X + 38, 0, 115)
        pcall(function()
            frame:TweenPosition(UDim2.new(0.5, 0, 0, 20), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.15)
            game:GetService("Debris"):AddItem(frame, delay2 + 0.15)
        end)
    end)
end

createnotification("Notification", "Sneaky Animation has been Enabled", 2, true) -- false is off true is on
	local Animate =
	game.Players.LocalPlayer.Character.Animate
	Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=1132473842"
	Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=1132477671"
	Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=1132510133"
	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=1132494274"
	Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=1132489853"
	Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=1132461372"
	Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=1132469004"
	game.Players.LocalPlayer.Character.Humanoid.Jump = true
	end)
	
	Tab6Section:NewButton("Princess" , "Princess Animation",function()
		local Guitwo = game.CoreGui.RektskyNotificationGui

local function createnotification(title, text, delay2, toggled)
    spawn(function()
        if Guitwo:FindFirstChild("Background") then Guitwo:FindFirstChild("Background"):Destroy() end
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(0, 100, 0, 115)
        frame.Position = UDim2.new(0.5, 0, 0, -115)
        frame.BorderSizePixel = 0
        frame.AnchorPoint = Vector2.new(0.5, 0)
        frame.BackgroundTransparency = 0.5
        frame.BackgroundColor3 = Color3.new(0, 0, 0)
        frame.Name = "Background"
        frame.Parent = Guitwo
        local frameborder = Instance.new("Frame")
        frameborder.Size = UDim2.new(1, 0, 0, 8)
        frameborder.BorderSizePixel = 0
        frameborder.BackgroundColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frameborder.Parent = frame
        local frametitle = Instance.new("TextLabel")
        frametitle.Font = Enum.Font.SourceSansLight
        frametitle.BackgroundTransparency = 1
        frametitle.Position = UDim2.new(0, 0, 0, 30)
        frametitle.TextColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frametitle.Size = UDim2.new(1, 0, 0, 28)
        frametitle.Text = "          "..title
        frametitle.TextSize = 24
        frametitle.TextXAlignment = Enum.TextXAlignment.Left
        frametitle.TextYAlignment = Enum.TextYAlignment.Top
        frametitle.Parent = frame
        local frametext = Instance.new("TextLabel")
        frametext.Font = Enum.Font.SourceSansLight
        frametext.BackgroundTransparency = 1
        frametext.Position = UDim2.new(0, 0, 0, 68)
        frametext.TextColor3 = Color3.new(1, 1, 1)
        frametext.Size = UDim2.new(1, 0, 0, 28)
        frametext.Text = "          "..text
        frametext.TextSize = 24
        frametext.TextXAlignment = Enum.TextXAlignment.Left
        frametext.TextYAlignment = Enum.TextYAlignment.Top
        frametext.Parent = frame
        local textsize = game:GetService("TextService"):GetTextSize(frametitle.Text, frametitle.TextSize, frametitle.Font, Vector2.new(100000, 100000))
        local textsize2 = game:GetService("TextService"):GetTextSize(frametext.Text, frametext.TextSize, frametext.Font, Vector2.new(100000, 100000))
        if textsize2.X > textsize.X then textsize = textsize2 end
        frame.Size = UDim2.new(0, textsize.X + 38, 0, 115)
        pcall(function()
            frame:TweenPosition(UDim2.new(0.5, 0, 0, 20), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.15)
            game:GetService("Debris"):AddItem(frame, delay2 + 0.15)
        end)
    end)
end

createnotification("Notification", "Princess Animation has been Enabled", 2, true) -- false is off true is on
	local Animate =
	game.Players.LocalPlayer.Character.Animate
	Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=941003647"
	Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=941013098"
	Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=941028902"
	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=941015281"
	Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=941008832"
	Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=940996062"
	Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=941000007"
	game.Players.LocalPlayer.Character.Humanoid.Jump = true
	end)

	local shopthingyshopshop = debug.getupvalue(require(game:GetService("ReplicatedStorage").TS.games.bedwars.shop["bedwars-shop"]).BedwarsShop.getShopItem, 2)
local oldnexttier
local oldtiered
local bypassstpidshoptiers = false
RenderSection:NewToggle("ShopTierBypass", "bypassesShopTierBypass", function(v)
	local Guitwo = game.CoreGui.RektskyNotificationGui

local function createnotification(title, text, delay2, toggled)
    spawn(function()
        if Guitwo:FindFirstChild("Background") then Guitwo:FindFirstChild("Background"):Destroy() end
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(0, 100, 0, 115)
        frame.Position = UDim2.new(0.5, 0, 0, -115)
        frame.BorderSizePixel = 0
        frame.AnchorPoint = Vector2.new(0.5, 0)
        frame.BackgroundTransparency = 0.5
        frame.BackgroundColor3 = Color3.new(0, 0, 0)
        frame.Name = "Background"
        frame.Parent = Guitwo
        local frameborder = Instance.new("Frame")
        frameborder.Size = UDim2.new(1, 0, 0, 8)
        frameborder.BorderSizePixel = 0
        frameborder.BackgroundColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frameborder.Parent = frame
        local frametitle = Instance.new("TextLabel")
        frametitle.Font = Enum.Font.SourceSansLight
        frametitle.BackgroundTransparency = 1
        frametitle.Position = UDim2.new(0, 0, 0, 30)
        frametitle.TextColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frametitle.Size = UDim2.new(1, 0, 0, 28)
        frametitle.Text = "          "..title
        frametitle.TextSize = 24
        frametitle.TextXAlignment = Enum.TextXAlignment.Left
        frametitle.TextYAlignment = Enum.TextYAlignment.Top
        frametitle.Parent = frame
        local frametext = Instance.new("TextLabel")
        frametext.Font = Enum.Font.SourceSansLight
        frametext.BackgroundTransparency = 1
        frametext.Position = UDim2.new(0, 0, 0, 68)
        frametext.TextColor3 = Color3.new(1, 1, 1)
        frametext.Size = UDim2.new(1, 0, 0, 28)
        frametext.Text = "          "..text
        frametext.TextSize = 24
        frametext.TextXAlignment = Enum.TextXAlignment.Left
        frametext.TextYAlignment = Enum.TextYAlignment.Top
        frametext.Parent = frame
        local textsize = game:GetService("TextService"):GetTextSize(frametitle.Text, frametitle.TextSize, frametitle.Font, Vector2.new(100000, 100000))
        local textsize2 = game:GetService("TextService"):GetTextSize(frametext.Text, frametext.TextSize, frametext.Font, Vector2.new(100000, 100000))
        if textsize2.X > textsize.X then textsize = textsize2 end
        frame.Size = UDim2.new(0, textsize.X + 38, 0, 115)
        pcall(function()
            frame:TweenPosition(UDim2.new(0.5, 0, 0, 20), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.15)
            game:GetService("Debris"):AddItem(frame, delay2 + 0.15)
        end)
    end)
end

createnotification("Notification", "ShopTierBypass has been Enabled", 2, true) -- false is off true is on
		if (bypassstpidshoptiers) then
            for i,v in pairs(shopthingyshopshop) do
                oldtiered = oldtiered or v.tiered
                oldnexttier = oldnexttier or v.nextTier
            end
            for i,v in pairs(shopthingyshopshop) do
                v.tiered = nil
                v.nextTier = nil
            end
    else
        local Guitwo = game.CoreGui.RektskyNotificationGui

local function createnotification(title, text, delay2, toggled)
    spawn(function()
        if Guitwo:FindFirstChild("Background") then Guitwo:FindFirstChild("Background"):Destroy() end
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(0, 100, 0, 115)
        frame.Position = UDim2.new(0.5, 0, 0, -115)
        frame.BorderSizePixel = 0
        frame.AnchorPoint = Vector2.new(0.5, 0)
        frame.BackgroundTransparency = 0.5
        frame.BackgroundColor3 = Color3.new(0, 0, 0)
        frame.Name = "Background"
        frame.Parent = Guitwo
        local frameborder = Instance.new("Frame")
        frameborder.Size = UDim2.new(1, 0, 0, 8)
        frameborder.BorderSizePixel = 0
        frameborder.BackgroundColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frameborder.Parent = frame
        local frametitle = Instance.new("TextLabel")
        frametitle.Font = Enum.Font.SourceSansLight
        frametitle.BackgroundTransparency = 1
        frametitle.Position = UDim2.new(0, 0, 0, 30)
        frametitle.TextColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frametitle.Size = UDim2.new(1, 0, 0, 28)
        frametitle.Text = "          "..title
        frametitle.TextSize = 24
        frametitle.TextXAlignment = Enum.TextXAlignment.Left
        frametitle.TextYAlignment = Enum.TextYAlignment.Top
        frametitle.Parent = frame
        local frametext = Instance.new("TextLabel")
        frametext.Font = Enum.Font.SourceSansLight
        frametext.BackgroundTransparency = 1
        frametext.Position = UDim2.new(0, 0, 0, 68)
        frametext.TextColor3 = Color3.new(1, 1, 1)
        frametext.Size = UDim2.new(1, 0, 0, 28)
        frametext.Text = "          "..text
        frametext.TextSize = 24
        frametext.TextXAlignment = Enum.TextXAlignment.Left
        frametext.TextYAlignment = Enum.TextYAlignment.Top
        frametext.Parent = frame
        local textsize = game:GetService("TextService"):GetTextSize(frametitle.Text, frametitle.TextSize, frametitle.Font, Vector2.new(100000, 100000))
        local textsize2 = game:GetService("TextService"):GetTextSize(frametext.Text, frametext.TextSize, frametext.Font, Vector2.new(100000, 100000))
        if textsize2.X > textsize.X then textsize = textsize2 end
        frame.Size = UDim2.new(0, textsize.X + 38, 0, 115)
        pcall(function()
            frame:TweenPosition(UDim2.new(0.5, 0, 0, 20), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.15)
            game:GetService("Debris"):AddItem(frame, delay2 + 0.15)
        end)
    end)
end

createnotification("Notification", "ez", 2, true) -- false is off true is on
        for i,v in pairs(shopthingyshopshop) do
			v.tiered = oldtiered
			v.nextTier = oldnexttier
		end
    end
end)

WorldSection:NewToggle("Night", "Your Bedtime Little Boy", function(v)
    local Guitwo = game.CoreGui.RektskyNotificationGui

local function createnotification(title, text, delay2, toggled)
    spawn(function()
        if Guitwo:FindFirstChild("Background") then Guitwo:FindFirstChild("Background"):Destroy() end
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(0, 100, 0, 115)
        frame.Position = UDim2.new(0.5, 0, 0, -115)
        frame.BorderSizePixel = 0
        frame.AnchorPoint = Vector2.new(0.5, 0)
        frame.BackgroundTransparency = 0.5
        frame.BackgroundColor3 = Color3.new(0, 0, 0)
        frame.Name = "Background"
        frame.Parent = Guitwo
        local frameborder = Instance.new("Frame")
        frameborder.Size = UDim2.new(1, 0, 0, 8)
        frameborder.BorderSizePixel = 0
        frameborder.BackgroundColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frameborder.Parent = frame
        local frametitle = Instance.new("TextLabel")
        frametitle.Font = Enum.Font.SourceSansLight
        frametitle.BackgroundTransparency = 1
        frametitle.Position = UDim2.new(0, 0, 0, 30)
        frametitle.TextColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frametitle.Size = UDim2.new(1, 0, 0, 28)
        frametitle.Text = "          "..title
        frametitle.TextSize = 24
        frametitle.TextXAlignment = Enum.TextXAlignment.Left
        frametitle.TextYAlignment = Enum.TextYAlignment.Top
        frametitle.Parent = frame
        local frametext = Instance.new("TextLabel")
        frametext.Font = Enum.Font.SourceSansLight
        frametext.BackgroundTransparency = 1
        frametext.Position = UDim2.new(0, 0, 0, 68)
        frametext.TextColor3 = Color3.new(1, 1, 1)
        frametext.Size = UDim2.new(1, 0, 0, 28)
        frametext.Text = "          "..text
        frametext.TextSize = 24
        frametext.TextXAlignment = Enum.TextXAlignment.Left
        frametext.TextYAlignment = Enum.TextYAlignment.Top
        frametext.Parent = frame
        local textsize = game:GetService("TextService"):GetTextSize(frametitle.Text, frametitle.TextSize, frametitle.Font, Vector2.new(100000, 100000))
        local textsize2 = game:GetService("TextService"):GetTextSize(frametext.Text, frametext.TextSize, frametext.Font, Vector2.new(100000, 100000))
        if textsize2.X > textsize.X then textsize = textsize2 end
        frame.Size = UDim2.new(0, textsize.X + 38, 0, 115)
        pcall(function()
            frame:TweenPosition(UDim2.new(0.5, 0, 0, 20), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.15)
            game:GetService("Debris"):AddItem(frame, delay2 + 0.15)
        end)
    end)
end

createnotification("Notification", "Night has been Enabled", 2, true) -- false is off true is on
    if v then
        game.Lighting.TimeOfDay = "00:00:00"
    else
		local Guitwo = game.CoreGui.RektskyNotificationGui

local function createnotification(title, text, delay2, toggled)
    spawn(function()
        if Guitwo:FindFirstChild("Background") then Guitwo:FindFirstChild("Background"):Destroy() end
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(0, 100, 0, 115)
        frame.Position = UDim2.new(0.5, 0, 0, -115)
        frame.BorderSizePixel = 0
        frame.AnchorPoint = Vector2.new(0.5, 0)
        frame.BackgroundTransparency = 0.5
        frame.BackgroundColor3 = Color3.new(0, 0, 0)
        frame.Name = "Background"
        frame.Parent = Guitwo
        local frameborder = Instance.new("Frame")
        frameborder.Size = UDim2.new(1, 0, 0, 8)
        frameborder.BorderSizePixel = 0
        frameborder.BackgroundColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frameborder.Parent = frame
        local frametitle = Instance.new("TextLabel")
        frametitle.Font = Enum.Font.SourceSansLight
        frametitle.BackgroundTransparency = 1
        frametitle.Position = UDim2.new(0, 0, 0, 30)
        frametitle.TextColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frametitle.Size = UDim2.new(1, 0, 0, 28)
        frametitle.Text = "          "..title
        frametitle.TextSize = 24
        frametitle.TextXAlignment = Enum.TextXAlignment.Left
        frametitle.TextYAlignment = Enum.TextYAlignment.Top
        frametitle.Parent = frame
        local frametext = Instance.new("TextLabel")
        frametext.Font = Enum.Font.SourceSansLight
        frametext.BackgroundTransparency = 1
        frametext.Position = UDim2.new(0, 0, 0, 68)
        frametext.TextColor3 = Color3.new(1, 1, 1)
        frametext.Size = UDim2.new(1, 0, 0, 28)
        frametext.Text = "          "..text
        frametext.TextSize = 24
        frametext.TextXAlignment = Enum.TextXAlignment.Left
        frametext.TextYAlignment = Enum.TextYAlignment.Top
        frametext.Parent = frame
        local textsize = game:GetService("TextService"):GetTextSize(frametitle.Text, frametitle.TextSize, frametitle.Font, Vector2.new(100000, 100000))
        local textsize2 = game:GetService("TextService"):GetTextSize(frametext.Text, frametext.TextSize, frametext.Font, Vector2.new(100000, 100000))
        if textsize2.X > textsize.X then textsize = textsize2 end
        frame.Size = UDim2.new(0, textsize.X + 38, 0, 115)
        pcall(function()
            frame:TweenPosition(UDim2.new(0.5, 0, 0, 20), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.15)
            game:GetService("Debris"):AddItem(frame, delay2 + 0.15)
        end)
    end)
end



createnotification("Notification", "Night has been Disabled", 2, false)
        game.Lighting.TimeOfDay = "13:00:00"
    end
end)

WorldSection:NewToggle("Ocean", "Ocean", function(v)
    local Guitwo = game.CoreGui.RektskyNotificationGui

local function createnotification(title, text, delay2, toggled)
    spawn(function()
        if Guitwo:FindFirstChild("Background") then Guitwo:FindFirstChild("Background"):Destroy() end
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(0, 100, 0, 115)
        frame.Position = UDim2.new(0.5, 0, 0, -115)
        frame.BorderSizePixel = 0
        frame.AnchorPoint = Vector2.new(0.5, 0)
        frame.BackgroundTransparency = 0.5
        frame.BackgroundColor3 = Color3.new(0, 0, 0)
        frame.Name = "Background"
        frame.Parent = Guitwo
        local frameborder = Instance.new("Frame")
        frameborder.Size = UDim2.new(1, 0, 0, 8)
        frameborder.BorderSizePixel = 0
        frameborder.BackgroundColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frameborder.Parent = frame
        local frametitle = Instance.new("TextLabel")
        frametitle.Font = Enum.Font.SourceSansLight
        frametitle.BackgroundTransparency = 1
        frametitle.Position = UDim2.new(0, 0, 0, 30)
        frametitle.TextColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frametitle.Size = UDim2.new(1, 0, 0, 28)
        frametitle.Text = "          "..title
        frametitle.TextSize = 24
        frametitle.TextXAlignment = Enum.TextXAlignment.Left
        frametitle.TextYAlignment = Enum.TextYAlignment.Top
        frametitle.Parent = frame
        local frametext = Instance.new("TextLabel")
        frametext.Font = Enum.Font.SourceSansLight
        frametext.BackgroundTransparency = 1
        frametext.Position = UDim2.new(0, 0, 0, 68)
        frametext.TextColor3 = Color3.new(1, 1, 1)
        frametext.Size = UDim2.new(1, 0, 0, 28)
        frametext.Text = "          "..text
        frametext.TextSize = 24
        frametext.TextXAlignment = Enum.TextXAlignment.Left
        frametext.TextYAlignment = Enum.TextYAlignment.Top
        frametext.Parent = frame
        local textsize = game:GetService("TextService"):GetTextSize(frametitle.Text, frametitle.TextSize, frametitle.Font, Vector2.new(100000, 100000))
        local textsize2 = game:GetService("TextService"):GetTextSize(frametext.Text, frametext.TextSize, frametext.Font, Vector2.new(100000, 100000))
        if textsize2.X > textsize.X then textsize = textsize2 end
        frame.Size = UDim2.new(0, textsize.X + 38, 0, 115)
        pcall(function()
            frame:TweenPosition(UDim2.new(0.5, 0, 0, 20), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.15)
            game:GetService("Debris"):AddItem(frame, delay2 + 0.15)
        end)
    end)
end

createnotification("Notification", "Ocean has been Enabled", 2, true) -- false is off true is on
    if v then
        game.Lighting.Ambient = Color3.fromRGB(0,0,255)
        game.Lighting.OutdoorAmbient = Color3.fromRGB(0, 0, 0)
    else
		local Guitwo = game.CoreGui.RektskyNotificationGui

local function createnotification(title, text, delay2, toggled)
    spawn(function()
        if Guitwo:FindFirstChild("Background") then Guitwo:FindFirstChild("Background"):Destroy() end
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(0, 100, 0, 115)
        frame.Position = UDim2.new(0.5, 0, 0, -115)
        frame.BorderSizePixel = 0
        frame.AnchorPoint = Vector2.new(0.5, 0)
        frame.BackgroundTransparency = 0.5
        frame.BackgroundColor3 = Color3.new(0, 0, 0)
        frame.Name = "Background"
        frame.Parent = Guitwo
        local frameborder = Instance.new("Frame")
        frameborder.Size = UDim2.new(1, 0, 0, 8)
        frameborder.BorderSizePixel = 0
        frameborder.BackgroundColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frameborder.Parent = frame
        local frametitle = Instance.new("TextLabel")
        frametitle.Font = Enum.Font.SourceSansLight
        frametitle.BackgroundTransparency = 1
        frametitle.Position = UDim2.new(0, 0, 0, 30)
        frametitle.TextColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frametitle.Size = UDim2.new(1, 0, 0, 28)
        frametitle.Text = "          "..title
        frametitle.TextSize = 24
        frametitle.TextXAlignment = Enum.TextXAlignment.Left
        frametitle.TextYAlignment = Enum.TextYAlignment.Top
        frametitle.Parent = frame
        local frametext = Instance.new("TextLabel")
        frametext.Font = Enum.Font.SourceSansLight
        frametext.BackgroundTransparency = 1
        frametext.Position = UDim2.new(0, 0, 0, 68)
        frametext.TextColor3 = Color3.new(1, 1, 1)
        frametext.Size = UDim2.new(1, 0, 0, 28)
        frametext.Text = "          "..text
        frametext.TextSize = 24
        frametext.TextXAlignment = Enum.TextXAlignment.Left
        frametext.TextYAlignment = Enum.TextYAlignment.Top
        frametext.Parent = frame
        local textsize = game:GetService("TextService"):GetTextSize(frametitle.Text, frametitle.TextSize, frametitle.Font, Vector2.new(100000, 100000))
        local textsize2 = game:GetService("TextService"):GetTextSize(frametext.Text, frametext.TextSize, frametext.Font, Vector2.new(100000, 100000))
        if textsize2.X > textsize.X then textsize = textsize2 end
        frame.Size = UDim2.new(0, textsize.X + 38, 0, 115)
        pcall(function()
            frame:TweenPosition(UDim2.new(0.5, 0, 0, 20), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.15)
            game:GetService("Debris"):AddItem(frame, delay2 + 0.15)
        end)
    end)
end



createnotification("Notification", "Ocean has been Disabled", 2, false)
        game.Lighting.Ambient = Color3.fromRGB(91, 91, 91)
            game.Lighting.OutdoorAmbient = Color3.fromRGB(201, 201, 201)
    end
end)


 
    if v then
        wait(0.0)
            game.Lighting.Ambient = Color3.fromRGB(0, 255, 255)
            game.Lighting.OutdoorAmbient = Color3.fromRGB(0, 0, 0)
    else
		local Guitwo = game.CoreGui.RektskyNotificationGui

local function createnotification(title, text, delay2, toggled)
    spawn(function()
        if Guitwo:FindFirstChild("Background") then Guitwo:FindFirstChild("Background"):Destroy() end
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(0, 100, 0, 115)
        frame.Position = UDim2.new(0.5, 0, 0, -115)
        frame.BorderSizePixel = 0
        frame.AnchorPoint = Vector2.new(0.5, 0)
        frame.BackgroundTransparency = 0.5
        frame.BackgroundColor3 = Color3.new(0, 0, 0)
        frame.Name = "Background"
        frame.Parent = Guitwo
        local frameborder = Instance.new("Frame")
        frameborder.Size = UDim2.new(1, 0, 0, 8)
        frameborder.BorderSizePixel = 0
        frameborder.BackgroundColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frameborder.Parent = frame
        local frametitle = Instance.new("TextLabel")
        frametitle.Font = Enum.Font.SourceSansLight
        frametitle.BackgroundTransparency = 1
        frametitle.Position = UDim2.new(0, 0, 0, 30)
        frametitle.TextColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frametitle.Size = UDim2.new(1, 0, 0, 28)
        frametitle.Text = "          "..title
        frametitle.TextSize = 24
        frametitle.TextXAlignment = Enum.TextXAlignment.Left
        frametitle.TextYAlignment = Enum.TextYAlignment.Top
        frametitle.Parent = frame
        local frametext = Instance.new("TextLabel")
        frametext.Font = Enum.Font.SourceSansLight
        frametext.BackgroundTransparency = 1
        frametext.Position = UDim2.new(0, 0, 0, 68)
        frametext.TextColor3 = Color3.new(1, 1, 1)
        frametext.Size = UDim2.new(1, 0, 0, 28)
        frametext.Text = "          "..text
        frametext.TextSize = 24
        frametext.TextXAlignment = Enum.TextXAlignment.Left
        frametext.TextYAlignment = Enum.TextYAlignment.Top
        frametext.Parent = frame
        local textsize = game:GetService("TextService"):GetTextSize(frametitle.Text, frametitle.TextSize, frametitle.Font, Vector2.new(100000, 100000))
        local textsize2 = game:GetService("TextService"):GetTextSize(frametext.Text, frametext.TextSize, frametext.Font, Vector2.new(100000, 100000))
        if textsize2.X > textsize.X then textsize = textsize2 end
        frame.Size = UDim2.new(0, textsize.X + 38, 0, 115)
        pcall(function()
            frame:TweenPosition(UDim2.new(0.5, 0, 0, 20), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.15)
            game:GetService("Debris"):AddItem(frame, delay2 + 0.15)
        end)
    end)
end

WorldSection:NewToggle("Grass", "Grass", function(v)
    local Guitwo = game.CoreGui.RektskyNotificationGui

local function createnotification(title, text, delay2, toggled)
    spawn(function()
        if Guitwo:FindFirstChild("Background") then Guitwo:FindFirstChild("Background"):Destroy() end
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(0, 100, 0, 115)
        frame.Position = UDim2.new(0.5, 0, 0, -115)
        frame.BorderSizePixel = 0
        frame.AnchorPoint = Vector2.new(0.5, 0)
        frame.BackgroundTransparency = 0.5
        frame.BackgroundColor3 = Color3.new(0, 0, 0)
        frame.Name = "Background"
        frame.Parent = Guitwo
        local frameborder = Instance.new("Frame")
        frameborder.Size = UDim2.new(1, 0, 0, 8)
        frameborder.BorderSizePixel = 0
        frameborder.BackgroundColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frameborder.Parent = frame
        local frametitle = Instance.new("TextLabel")
        frametitle.Font = Enum.Font.SourceSansLight
        frametitle.BackgroundTransparency = 1
        frametitle.Position = UDim2.new(0, 0, 0, 30)
        frametitle.TextColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frametitle.Size = UDim2.new(1, 0, 0, 28)
        frametitle.Text = "          "..title
        frametitle.TextSize = 24
        frametitle.TextXAlignment = Enum.TextXAlignment.Left
        frametitle.TextYAlignment = Enum.TextYAlignment.Top
        frametitle.Parent = frame
        local frametext = Instance.new("TextLabel")
        frametext.Font = Enum.Font.SourceSansLight
        frametext.BackgroundTransparency = 1
        frametext.Position = UDim2.new(0, 0, 0, 68)
        frametext.TextColor3 = Color3.new(1, 1, 1)
        frametext.Size = UDim2.new(1, 0, 0, 28)
        frametext.Text = "          "..text
        frametext.TextSize = 24
        frametext.TextXAlignment = Enum.TextXAlignment.Left
        frametext.TextYAlignment = Enum.TextYAlignment.Top
        frametext.Parent = frame
        local textsize = game:GetService("TextService"):GetTextSize(frametitle.Text, frametitle.TextSize, frametitle.Font, Vector2.new(100000, 100000))
        local textsize2 = game:GetService("TextService"):GetTextSize(frametext.Text, frametext.TextSize, frametext.Font, Vector2.new(100000, 100000))
        if textsize2.X > textsize.X then textsize = textsize2 end
        frame.Size = UDim2.new(0, textsize.X + 38, 0, 115)
        pcall(function()
            frame:TweenPosition(UDim2.new(0.5, 0, 0, 20), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.15)
            game:GetService("Debris"):AddItem(frame, delay2 + 0.15)
        end)
    end)
end
createnotification("Notification", "Grass has been Enabled", 2, true) -- false is off true is on

    if v then
        game.Lighting.Ambient = Color3.fromRGB(0,255,0)
        game.Lighting.OutdoorAmbient = Color3.fromRGB(0, 0, 0)
        
    else
		local Guitwo = game.CoreGui.RektskyNotificationGui

local function createnotification(title, text, delay2, toggled)
    spawn(function()
        if Guitwo:FindFirstChild("Background") then Guitwo:FindFirstChild("Background"):Destroy() end
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(0, 100, 0, 115)
        frame.Position = UDim2.new(0.5, 0, 0, -115)
        frame.BorderSizePixel = 0
        frame.AnchorPoint = Vector2.new(0.5, 0)
        frame.BackgroundTransparency = 0.5
        frame.BackgroundColor3 = Color3.new(0, 0, 0)
        frame.Name = "Background"
        frame.Parent = Guitwo
        local frameborder = Instance.new("Frame")
        frameborder.Size = UDim2.new(1, 0, 0, 8)
        frameborder.BorderSizePixel = 0
        frameborder.BackgroundColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frameborder.Parent = frame
        local frametitle = Instance.new("TextLabel")
        frametitle.Font = Enum.Font.SourceSansLight
        frametitle.BackgroundTransparency = 1
        frametitle.Position = UDim2.new(0, 0, 0, 30)
        frametitle.TextColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frametitle.Size = UDim2.new(1, 0, 0, 28)
        frametitle.Text = "          "..title
        frametitle.TextSize = 24
        frametitle.TextXAlignment = Enum.TextXAlignment.Left
        frametitle.TextYAlignment = Enum.TextYAlignment.Top
        frametitle.Parent = frame
        local frametext = Instance.new("TextLabel")
        frametext.Font = Enum.Font.SourceSansLight
        frametext.BackgroundTransparency = 1
        frametext.Position = UDim2.new(0, 0, 0, 68)
        frametext.TextColor3 = Color3.new(1, 1, 1)
        frametext.Size = UDim2.new(1, 0, 0, 28)
        frametext.Text = "          "..text
        frametext.TextSize = 24
        frametext.TextXAlignment = Enum.TextXAlignment.Left
        frametext.TextYAlignment = Enum.TextYAlignment.Top
        frametext.Parent = frame
        local textsize = game:GetService("TextService"):GetTextSize(frametitle.Text, frametitle.TextSize, frametitle.Font, Vector2.new(100000, 100000))
        local textsize2 = game:GetService("TextService"):GetTextSize(frametext.Text, frametext.TextSize, frametext.Font, Vector2.new(100000, 100000))
        if textsize2.X > textsize.X then textsize = textsize2 end
        frame.Size = UDim2.new(0, textsize.X + 38, 0, 115)
        pcall(function()
            frame:TweenPosition(UDim2.new(0.5, 0, 0, 20), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.15)
            game:GetService("Debris"):AddItem(frame, delay2 + 0.15)
        end)
    end)
end



createnotification("Notification", "Grass has been Disabled", 2, false)
        game.Lighting.Ambient = Color3.fromRGB(91, 91, 91)
            game.Lighting.OutdoorAmbient = Color3.fromRGB(201, 201, 201)
    end
end)


WorldSection:NewToggle("Blood", "Blood", function(v)
    local Guitwo = game.CoreGui.RektskyNotificationGui

local function createnotification(title, text, delay2, toggled)
    spawn(function()
        if Guitwo:FindFirstChild("Background") then Guitwo:FindFirstChild("Background"):Destroy() end
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(0, 100, 0, 115)
        frame.Position = UDim2.new(0.5, 0, 0, -115)
        frame.BorderSizePixel = 0
        frame.AnchorPoint = Vector2.new(0.5, 0)
        frame.BackgroundTransparency = 0.5
        frame.BackgroundColor3 = Color3.new(0, 0, 0)
        frame.Name = "Background"
        frame.Parent = Guitwo
        local frameborder = Instance.new("Frame")
        frameborder.Size = UDim2.new(1, 0, 0, 8)
        frameborder.BorderSizePixel = 0
        frameborder.BackgroundColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frameborder.Parent = frame
        local frametitle = Instance.new("TextLabel")
        frametitle.Font = Enum.Font.SourceSansLight
        frametitle.BackgroundTransparency = 1
        frametitle.Position = UDim2.new(0, 0, 0, 30)
        frametitle.TextColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frametitle.Size = UDim2.new(1, 0, 0, 28)
        frametitle.Text = "          "..title
        frametitle.TextSize = 24
        frametitle.TextXAlignment = Enum.TextXAlignment.Left
        frametitle.TextYAlignment = Enum.TextYAlignment.Top
        frametitle.Parent = frame
        local frametext = Instance.new("TextLabel")
        frametext.Font = Enum.Font.SourceSansLight
        frametext.BackgroundTransparency = 1
        frametext.Position = UDim2.new(0, 0, 0, 68)
        frametext.TextColor3 = Color3.new(1, 1, 1)
        frametext.Size = UDim2.new(1, 0, 0, 28)
        frametext.Text = "          "..text
        frametext.TextSize = 24
        frametext.TextXAlignment = Enum.TextXAlignment.Left
        frametext.TextYAlignment = Enum.TextYAlignment.Top
        frametext.Parent = frame
        local textsize = game:GetService("TextService"):GetTextSize(frametitle.Text, frametitle.TextSize, frametitle.Font, Vector2.new(100000, 100000))
        local textsize2 = game:GetService("TextService"):GetTextSize(frametext.Text, frametext.TextSize, frametext.Font, Vector2.new(100000, 100000))
        if textsize2.X > textsize.X then textsize = textsize2 end
        frame.Size = UDim2.new(0, textsize.X + 38, 0, 115)
        pcall(function()
            frame:TweenPosition(UDim2.new(0.5, 0, 0, 20), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.15)
            game:GetService("Debris"):AddItem(frame, delay2 + 0.15)
        end)
    end)
end

createnotification("Notification", "Blood has been Enabled", 2, true) -- false is off true is on
    if v then
         game.Lighting.Ambient = Color3.fromRGB(255,0,0)
            game.Lighting.OutdoorAmbient = Color3.fromRGB(0, 0, 0)
        
    else
		local Guitwo = game.CoreGui.RektskyNotificationGui

local function createnotification(title, text, delay2, toggled)
    spawn(function()
        if Guitwo:FindFirstChild("Background") then Guitwo:FindFirstChild("Background"):Destroy() end
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(0, 100, 0, 115)
        frame.Position = UDim2.new(0.5, 0, 0, -115)
        frame.BorderSizePixel = 0
        frame.AnchorPoint = Vector2.new(0.5, 0)
        frame.BackgroundTransparency = 0.5
        frame.BackgroundColor3 = Color3.new(0, 0, 0)
        frame.Name = "Background"
        frame.Parent = Guitwo
        local frameborder = Instance.new("Frame")
        frameborder.Size = UDim2.new(1, 0, 0, 8)
        frameborder.BorderSizePixel = 0
        frameborder.BackgroundColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frameborder.Parent = frame
        local frametitle = Instance.new("TextLabel")
        frametitle.Font = Enum.Font.SourceSansLight
        frametitle.BackgroundTransparency = 1
        frametitle.Position = UDim2.new(0, 0, 0, 30)
        frametitle.TextColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frametitle.Size = UDim2.new(1, 0, 0, 28)
        frametitle.Text = "          "..title
        frametitle.TextSize = 24
        frametitle.TextXAlignment = Enum.TextXAlignment.Left
        frametitle.TextYAlignment = Enum.TextYAlignment.Top
        frametitle.Parent = frame
        local frametext = Instance.new("TextLabel")
        frametext.Font = Enum.Font.SourceSansLight
        frametext.BackgroundTransparency = 1
        frametext.Position = UDim2.new(0, 0, 0, 68)
        frametext.TextColor3 = Color3.new(1, 1, 1)
        frametext.Size = UDim2.new(1, 0, 0, 28)
        frametext.Text = "          "..text
        frametext.TextSize = 24
        frametext.TextXAlignment = Enum.TextXAlignment.Left
        frametext.TextYAlignment = Enum.TextYAlignment.Top
        frametext.Parent = frame
        local textsize = game:GetService("TextService"):GetTextSize(frametitle.Text, frametitle.TextSize, frametitle.Font, Vector2.new(100000, 100000))
        local textsize2 = game:GetService("TextService"):GetTextSize(frametext.Text, frametext.TextSize, frametext.Font, Vector2.new(100000, 100000))
        if textsize2.X > textsize.X then textsize = textsize2 end
        frame.Size = UDim2.new(0, textsize.X + 38, 0, 115)
        pcall(function()
            frame:TweenPosition(UDim2.new(0.5, 0, 0, 20), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.15)
            game:GetService("Debris"):AddItem(frame, delay2 + 0.15)
        end)
    end)
end



createnotification("Notification", "Blood has been Disabled", 2, false)
        game.Lighting.Ambient = Color3.fromRGB(91, 91, 91)
            game.Lighting.OutdoorAmbient = Color3.fromRGB(201, 201, 201)
    end
end)

WorldSection:NewToggle("RektskyAmbience", "RektskyAmbience", function(v)
local Guitwo = game.CoreGui.RektskyNotificationGui

local function createnotification(title, text, delay2, toggled)
    spawn(function()
        if Guitwo:FindFirstChild("Background") then Guitwo:FindFirstChild("Background"):Destroy() end
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(0, 100, 0, 115)
        frame.Position = UDim2.new(0.5, 0, 0, -115)
        frame.BorderSizePixel = 0
        frame.AnchorPoint = Vector2.new(0.5, 0)
        frame.BackgroundTransparency = 0.5
        frame.BackgroundColor3 = Color3.new(0, 0, 0)
        frame.Name = "Background"
        frame.Parent = Guitwo
        local frameborder = Instance.new("Frame")
        frameborder.Size = UDim2.new(1, 0, 0, 8)
        frameborder.BorderSizePixel = 0
        frameborder.BackgroundColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frameborder.Parent = frame
        local frametitle = Instance.new("TextLabel")
        frametitle.Font = Enum.Font.SourceSansLight
        frametitle.BackgroundTransparency = 1
        frametitle.Position = UDim2.new(0, 0, 0, 30)
        frametitle.TextColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frametitle.Size = UDim2.new(1, 0, 0, 28)
        frametitle.Text = "          "..title
        frametitle.TextSize = 24
        frametitle.TextXAlignment = Enum.TextXAlignment.Left
        frametitle.TextYAlignment = Enum.TextYAlignment.Top
        frametitle.Parent = frame
        local frametext = Instance.new("TextLabel")
        frametext.Font = Enum.Font.SourceSansLight
        frametext.BackgroundTransparency = 1
        frametext.Position = UDim2.new(0, 0, 0, 68)
        frametext.TextColor3 = Color3.new(1, 1, 1)
        frametext.Size = UDim2.new(1, 0, 0, 28)
        frametext.Text = "          "..text
        frametext.TextSize = 24
        frametext.TextXAlignment = Enum.TextXAlignment.Left
        frametext.TextYAlignment = Enum.TextYAlignment.Top
        frametext.Parent = frame
        local textsize = game:GetService("TextService"):GetTextSize(frametitle.Text, frametitle.TextSize, frametitle.Font, Vector2.new(100000, 100000))
        local textsize2 = game:GetService("TextService"):GetTextSize(frametext.Text, frametext.TextSize, frametext.Font, Vector2.new(100000, 100000))
        if textsize2.X > textsize.X then textsize = textsize2 end
        frame.Size = UDim2.new(0, textsize.X + 38, 0, 115)
        pcall(function()
            frame:TweenPosition(UDim2.new(0.5, 0, 0, 20), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.15)
            game:GetService("Debris"):AddItem(frame, delay2 + 0.15)
        end)
    end)
end

createnotification("Notification", "RektskyAmbienceed has been Enabled", 4, true)
    if v then
        wait(0.5)
            game.Lighting.Ambient = Color3.fromRGB(0, 255, 255)
            game.Lighting.OutdoorAmbient = Color3.fromRGB(0, 0, 0)
    else
		local Guitwo = game.CoreGui.RektskyNotificationGui

local function createnotification(title, text, delay2, toggled)
    spawn(function()
        if Guitwo:FindFirstChild("Background") then Guitwo:FindFirstChild("Background"):Destroy() end
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(0, 100, 0, 115)
        frame.Position = UDim2.new(0.5, 0, 0, -115)
        frame.BorderSizePixel = 0
        frame.AnchorPoint = Vector2.new(0.5, 0)
        frame.BackgroundTransparency = 0.5
        frame.BackgroundColor3 = Color3.new(0, 0, 0)
        frame.Name = "Background"
        frame.Parent = Guitwo
        local frameborder = Instance.new("Frame")
        frameborder.Size = UDim2.new(1, 0, 0, 8)
        frameborder.BorderSizePixel = 0
        frameborder.BackgroundColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frameborder.Parent = frame
        local frametitle = Instance.new("TextLabel")
        frametitle.Font = Enum.Font.SourceSansLight
        frametitle.BackgroundTransparency = 1
        frametitle.Position = UDim2.new(0, 0, 0, 30)
        frametitle.TextColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frametitle.Size = UDim2.new(1, 0, 0, 28)
        frametitle.Text = "          "..title
        frametitle.TextSize = 24
        frametitle.TextXAlignment = Enum.TextXAlignment.Left
        frametitle.TextYAlignment = Enum.TextYAlignment.Top
        frametitle.Parent = frame
        local frametext = Instance.new("TextLabel")
        frametext.Font = Enum.Font.SourceSansLight
        frametext.BackgroundTransparency = 1
        frametext.Position = UDim2.new(0, 0, 0, 68)
        frametext.TextColor3 = Color3.new(1, 1, 1)
        frametext.Size = UDim2.new(1, 0, 0, 28)
        frametext.Text = "          "..text
        frametext.TextSize = 24
        frametext.TextXAlignment = Enum.TextXAlignment.Left
        frametext.TextYAlignment = Enum.TextYAlignment.Top
        frametext.Parent = frame
        local textsize = game:GetService("TextService"):GetTextSize(frametitle.Text, frametitle.TextSize, frametitle.Font, Vector2.new(100000, 100000))
        local textsize2 = game:GetService("TextService"):GetTextSize(frametext.Text, frametext.TextSize, frametext.Font, Vector2.new(100000, 100000))
        if textsize2.X > textsize.X then textsize = textsize2 end
        frame.Size = UDim2.new(0, textsize.X + 38, 0, 115)
        pcall(function()
            frame:TweenPosition(UDim2.new(0.5, 0, 0, 20), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.15)
            game:GetService("Debris"):AddItem(frame, delay2 + 0.15)
        end)
    end)
end

createnotification("Notification", "RektskyAmbienceed has been Disabled", 2, false)
        game.Lighting.Ambient = Color3.fromRGB(91, 91, 91)
            game.Lighting.OutdoorAmbient = Color3.fromRGB(201, 201, 201)
    end
end)
end

runcode(function()
	local wall = nil
	local spiderspeed = {["Value"] = 0}
	local Spider = Blatant:NewSection("Spider")
	Spider:NewToggle("Spider", "Allows you to climb up a wall", function(state)
		if state then
			BindToStepped("Spider", 1, function()
				local raycastparameters = RaycastParams.new()
				raycastparameters.FilterDescendantsInstances = {lplr.Character}
				local ray = workspace:Raycast(lplr.Character.Humanoid.LeftLeg.Position, lplr.Character.HumanoidRootPart.CFrame.LookVector * 1.3, raycastparameters)

				wall = ray and ray.Instance or nil
				if wall then
					lplr.Character.HumanoidRootPart.Velocity = Vector3.new(lplr.Character.HumanoidRootPart.Velocity.X or 0, spiderspeed["Value"], lplr.Character.HumanoidRootPart.Velocity.Z or 0)

					if lplr.Character.Humanoid:GetState() ~= Enum.HumanoidStateType.Climbing then
						lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Freefall)
					end
				end
			end)
		else
			UnbindFromStepped("Spider")
		end
	end)
	Spider:NewSlider("Speed", "Adjust spider speed", 50, 0, function(val) -- 500 (MaxValue) | 0 (MinValue)
		spiderspeed["Value"] = val
	end)
end)

PrivateSection:NewToggle("CustomMatchAntiCheatDisabler", "ToggleInfo", function(v)
    if v  then
        game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("/SetAC disabled", 'All')
        wait(0.1)
    else
        game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("/SetAC enabled", 'All')
        wait(0.1)
    end
end)

runcode(function()
	local antivoidp
end)

local AntiVoid = World:NewSection("AntiVoid")
AntiVoid:NewToggle("AntiVoid", "Give's you a second chance to get back on land", function(state)
	if state then
		antivoidp = Instance.new("Part", workspace)
		antivoidp.Name = "AntiVoid"
		antivoidp.CanCollide = true
		antivoidp.Size = Vector3.new(2048, 1, 2048)
		antivoidp.Anchored = true
		antivoidp.Transparency = 1 - (antivoidtransparent["Value"] / 100)
		antivoidp.Material = Enum.Material.Neon
		antivoidp.Color = Color3.fromHSV(antivoidcolor["Hue"], antivoidcolor["Sat"], antivoidcolor["Value"])
		antivoidp.Position = Vector3.new(0, 23.5, 0)
		antivoidp.Touched:connect(function(touchedvoid)
			if touchedvoid.Parent:FindFirstChild("Humanoid") and touchedvoid.Parent.Name == lplr.Name then
				lplr.Character.Humanoid.Jump = true
				lplr.Character.Humanoid:ChangeState("Jumping")
				wait(0.2)
				lplr.Character.Humanoid:ChangeState("Jumping")
				wait(0.2)
				lplr.Character.Humanoid:ChangeState("Jumping")
			end
		end)
	else
		if antivoidp then
			antivoidp:Remove()
		end
	end
end)

AntiVoid:NewColorPicker("Color", "Adjust antivoid color", Color3.fromHSV(antivoidcolor["Hue"], antivoidcolor["Sat"], antivoidcolor["Value"]), function(val)
	if antivoidp then
		antivoidp.Color = (val)
	end
end)

AntiVoid:NewSlider("Invisible 1-100", "Adjust antivoid transparency", 100, 0, function(val)
	if antivoidp then
		antivoidp.Transparency = 1 - (val / 100)
	end
end)

PrivateSection:NewButton("Infinite Yiff loader", "loads Infinite Yiff", function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end)


PrivateSection:NewButton("SytroNight - Private", "loads SytroNight - Private", function()
    --[[It Private Open Sounce Test you Can try It
but please credit to main owner and private owner is Nightmare Sans [NTD] , Vamp
if you do It
]]
if not isfile("KavoConfig.JSON") then writefile("NightXConfig.JSON","{}")
end
wait(0.55)
spawn(function()
	for i,v in pairs(game:GetService("Lighting"):GetChildren()) do
		if v:IsA("Atmosphere") or v:IsA("Sky") or v:IsA("PostEffect") then
			v:Remove()
		end
	end
	local sky = Instance.new("Sky")
	sky.StarCount = 5000
	sky.SkyboxUp = "rbxassetid://9468074724"
	sky.SkyboxLf = "rbxassetid://9468063157"
	sky.SkyboxFt = "rbxassetid://9468061027"
	sky.SkyboxBk = "rbxassetid://9468068462"
	sky.SkyboxDn = "rbxassetid://9468081097"
	sky.SkyboxRt = "rbxassetid://9468057091"
	sky.SunTextureId = ""
	sky.SunAngularSize = 11
	sky.MoonTextureId = ""
	sky.MoonAngularSize = 30
	sky.Parent = game:GetService("Lighting")
	local sunray = Instance.new("SunRaysEffect")
	sunray.Intensity = 0.03
	sunray.Parent = game:GetService("Lighting")
	local bloom = Instance.new("BloomEffect")
	bloom.Threshold = 2
	bloom.Intensity = 1
	bloom.Size = 2
	bloom.Parent = game:GetService("Lighting")
	local atmosphere = Instance.new("Atmosphere")
	atmosphere.Density = 0.3
	atmosphere.Offset = 0.25
	atmosphere.Color = Color3.fromRGB(198, 198, 198)
	atmosphere.Decay = Color3.fromRGB(104, 112, 124)
	atmosphere.Glare = 0
	atmosphere.Haze = 0
	atmosphere.Parent = game:GetService("Lighting")
end)
local colors = {
	SchemeColor = Color3.fromRGB(0,255,255),
	Background = Color3.fromRGB(0, 0, 0),
	Header = Color3.fromRGB(0, 0, 0),
	TextColor = Color3.fromRGB(255,255,255),
	ElementColor = Color3.fromRGB(20, 20, 20)
}
local kavoUi = loadstring(game:HttpGet("https://raw.githubusercontent.com/NTDCore/NightBedCommunityOfficial/main/Theme/Night/bed/lol/XD/Chill/long/kavo.lua"))()
local window = kavoUi.CreateLib("SytroNight - Private", "Private")
local entity = loadstring(game:HttpGet("https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/Libraries/entityHandler.lua", true))()

do
	local oldcharacteradded = entity.characterAdded
	entity.characterAdded = function(plr, char, localcheck)
		return oldcharacteradded(plr, char, localcheck, function() end)
	end
	entity.fullEntityRefresh()
end

local colorbox
local function makeRainbowText(text)
	spawn(function()
		colorbox = Color3.fromRGB(170,0,170)
		local x = 0
		while wait() do
			colorbox = Color3.fromHSV(x,1,1)
			x = x + 4.5/255
			if x >= 1 then
				x = 0
			end
		end
	end)
	spawn(function()
		repeat
			wait()
			text.TextColor3 = colorbox
		until true == false
	end)
end

local MainToggle = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")
local UICorner = Instance.new("UICorner")
local ToggleBtn = Instance.new("ImageButton")

MainToggle.Name = "MainToggle"
MainToggle.Parent = game.CoreGui
MainToggle.ResetOnSpawn = false

Frame.Parent = MainToggle
Frame.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
Frame.BackgroundTransparency = 0.200
Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.0109622413, 0, 0.0136186769, 0)
Frame.Size = UDim2.new(0, 149, 0, 149)

TextLabel.Parent = Frame
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.BorderSizePixel = 0
TextLabel.Position = UDim2.new(0.0402684584, 0, 0.798657715, 0)
TextLabel.Size = UDim2.new(0, 132, 0, 30)
TextLabel.Font = Enum.Font.SourceSansLight
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextScaled = true
TextLabel.TextSize = 14.000
TextLabel.TextWrapped = true
TextLabel.Text = "SytroNight - Private"
makeRainbowText(TextLabel, true)

UICorner.Parent = Frame

ToggleBtn.Name = "ToggleBtn"
ToggleBtn.Parent = Frame
ToggleBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ToggleBtn.BackgroundTransparency = 1.000
ToggleBtn.Position = UDim2.new(0.137143791, 0, 0.0700296983, 0)
ToggleBtn.Size = UDim2.new(0, 110, 0, 110)
ToggleBtn.Image = "rbxassetid://9423059734"
ToggleBtn.MouseButton1Down:connect(function()
  kavoUi:ToggleUI()
end)

repeat task.wait() until (entity.isAlive)

local players = game:GetService("Players")
local lplr = players.LocalPlayer
local oldchar = lplr.Character
local cam = workspace.CurrentCamera
local uis = game:GetService("UserInputService")
local KnitClient = debug.getupvalue(require(game.Players.LocalPlayer.PlayerScripts.TS.knit).setup, 6)
local Client = require(game:GetService("ReplicatedStorage").TS.remotes).default.Client
local InventoryUtil = require(game:GetService("ReplicatedStorage").TS.inventory["inventory-util"]).InventoryUtil
local itemstuff = debug.getupvalue(require(game:GetService("ReplicatedStorage").TS.item["item-meta"]).getItemMeta, 1)
local RenderStepTable = {}
local StepTable = {}
local connectioninfjump
local killauraswing = {["Enabled"] = true}
local killaurasound = {["Enabled"] = true}
local killaurahitdelay = {["Value"] = 2}
local killaurasoundval = {["Value"] = 1}
local speedval = {["Value"] = 1}
local testtogttt = {["Value"] = 20}
local ACC1
local CloneGodModeFulldisablertroll
local ACC2
local AnticheatBypass = {["Enabled"] = false}
local AnticheatBypassCombatCheck = {["Enabled"] = false}
local anticheatfunny = false
local anticheatfunnyyes = false
local antivoidtransparent = {["Value"] = 50}
local antivoidcolor = {["Hue"] = 0.93, ["Sat"] = 1, ["Value"] = 1}
local reachval = {["Value"] = 18}
local autoclick = {["Enabled"] = true}
local origC0 = game.ReplicatedStorage.Assets.Viewmodel.RightHand.RightWrist.C0
local killaurafirstpersonanim = {["Value"] = true}
local killauraanimval = {["Value"] = "Cool"}
local SprintCont = KnitClient.Controllers.SprintController
local SwordCont = KnitClient.Controllers.SwordController
local KnockbackTable = debug.getupvalue(require(game:GetService("ReplicatedStorage").TS.damage["knockback-util"]).KnockbackUtil.calculateKnockbackVelocity, 1)
local ClientHandler = Client


local function isAlive(plr)
	if plr then
		return plr and plr.Character and plr.Character.Parent ~= nil and plr.Character:FindFirstChild("HumanoidRootPart") and plr.Character:FindFirstChild("Head") and plr.Character:FindFirstChild("Humanoid")
	end
	return lplr and lplr.Character and lplr.Character.Parent ~= nil and lplr.Character:FindFirstChild("HumanoidRootPart") and lplr.Character:FindFirstChild("Head") and lplr.Character:FindFirstChild("Humanoid")
end

local function runcode(func)
	func()
end

local AnticheatBypassNumbers = {
	TPSpeed = 0.1,
	TPCombat = 0.3,
	TPLerp = 0.4,
	TPCheck = 15
}

local realchar
local clone
local function clonemake()
    realchar = lplr.Character
    realchar.Archivable = true
    clone = realchar:Clone()
    clone.Parent = workspace
    lplr.Character = clone
end

local clonetwo
local function secondclonemake()
    clonetwo = realchar:Clone()
    clonetwo.Parent = workspace
end

spawn(function()
    while wait(1) do
        matchState = clntstorehandlr:getState().Game.matchState
    end
end)

local function getremote(tab)
    for i,v in pairs(tab) do
        if v == "Client" then
            return tab[i + 1]
        end
    end
    return ""
end

function hash(p1)
    local hashmod = require(game:GetService("ReplicatedStorage").TS["remote-hash"]["remote-hash-util"])
    local toret = hashmod.RemoteHashUtil:prepareHashVector3(p1)
    return toret
end
  
local function playsound(id, volume) 
	local sound = Instance.new("Sound")
	sound.Parent = workspace
	sound.SoundId = id
	sound.PlayOnRemove = true 
	if volume then 
		sound.Volume = volume
	end
	sound:Destroy()
end

local function playanimation(id) 
	if isAlive() then 
		local animation = Instance.new("Animation")
		animation.AnimationId = id
		local animatior = lplr.Character.Humanoid.Animator
		animatior:LoadAnimation(animation):Play()
	end
end

function isNumber(str)
	if tonumber(str) ~= nil or str == 'inf' then
		return true
	end
end

function getinv(plr)
	local plr = plr or lplr
	local thingy, thingytwo = pcall(function() return InventoryUtil.getInventory(plr) end)
	return (thingy and thingytwo or {
		items = {},
		armor = {},
		hand = nil
	})
end

function getsword()
	local sd
	local higherdamage
	local swordslots
	local swords = getinv().items
	for i, v in pairs(swords) do
		if v.itemType:lower():find("sword") or v.itemType:lower():find("blade") then
			if higherdamage == nil or itemstuff[v.itemType].sword.damage > higherdamage then
				sd = v
				higherdamage = itemstuff[v.itemType].sword.damage
				swordslots = i
			end
		end
	end
	return sd, swordslots
end

local function getremote(tab)
	for i,v in pairs(tab) do
		if v == "Client" then
			return tab[i + 1]
		end
	end
	return ""
end

local function hvFunc(cock)
	return {hashedval = cock}
end

local function targetCheck(plr, check)
	return (check and plr.Character.Humanoid.Health > 0 and plr.Character:FindFirstChild("ForceField") == nil or check == false)
end

local function isPlayerTargetable(plr, target)
	return plr ~= lplr and plr and isAlive(plr) and targetCheck(plr, target)
end

local function GetAllNearestHumanoidToPosition(distance, amount)
	local returnedplayer = {}
	local currentamount = 0
	if entity.isAlive then -- alive check
		for i, v in pairs(game.Players:GetChildren()) do -- loop through players
			if isPlayerTargetable((v), true, true, v.Character ~= nil) and v.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChild("Head") and currentamount < amount then -- checks
				local mag = (lplr.Character.HumanoidRootPart.Position - v.Character:FindFirstChild("HumanoidRootPart").Position).magnitude
				if mag <= distance then -- mag check
					table.insert(returnedplayer, v)
					currentamount = currentamount + 1
				end
			end
		end
		for i2,v2 in pairs(game:GetService("CollectionService"):GetTagged("Monster")) do -- monsters
			if v2:FindFirstChild("HumanoidRootPart") and currentamount < amount and v2.Name ~= "Duck" then -- no duck
				local mag = (lplr.Character.HumanoidRootPart.Position - v2.HumanoidRootPart.Position).magnitude
				if mag <= distance then -- magcheck
					table.insert(returnedplayer, {Name = (v2 and v2.Name or "Monster"), UserId = 1443379645, Character = v2}) -- monsters are npcs so I have to create a fake player for target info
					currentamount = currentamount + 1
				end
			end
		end
	end
	return returnedplayer -- table of attackable entities
end

local function BindToRenderStep(name, num, func)
	if RenderStepTable[name] == nil then
		RenderStepTable[name] = game:GetService("RunService").RenderStepped:connect(func)
	end
end
local function UnbindFromRenderStep(name)
	if RenderStepTable[name] then
		RenderStepTable[name]:Disconnect()
		RenderStepTable[name] = nil
	end
end

local function BindToStepped(name, num, func)
	if StepTable[name] == nil then
		StepTable[name] = game:GetService("RunService").Stepped:connect(func)
	end
end
local function UnbindFromStepped(name)
	if StepTable[name] then
		StepTable[name]:Disconnect()
		StepTable[name] = nil
	end
end

local attackentitycont = Client:Get(getremote(debug.getconstants(getmetatable(KnitClient.Controllers.SwordController)["attackEntity"])))
local rgfejd = false
local DistVal = {["Value"] = 18}
function KillauraRemote()
	for i,v in pairs(game.Players:GetChildren()) do
		if v.Character and v.Name ~= game.Players.LocalPlayer.Name and v.Character:FindFirstChild("HumanoidRootPart") then
			local mag = (v.Character.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
			if mag <= DistVal["Value"] and v.Team ~= game.Players.LocalPlayer.Team and v.Character:FindFirstChild("Humanoid") then
				if v.Character.Humanoid.Health > 0 then
					rgfejd = true
					local GBW = getsword()
					local selfPosition = lplr.Character.HumanoidRootPart.Position + (DistVal["Value"] > 14 and (lplr.Character.HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).magnitude > 14 and (CFrame.lookAt(lplr.Character.HumanoidRootPart.Position, v.Character.HumanoidRootPart.Position).lookVector * 4) or Vector3.new(0, 0, 0))
					local Entity = v.Character
					local target = v.Character:GetPrimaryPartCFrame().Position
					attackentitycont:CallServer({
						["chargedAttack"] = {["chargeRatio"] = 1},
						["weapon"] = GBW ~= nil and GBW.tool,
						["entityInstance"] = Entity,
						["validate"] = {["targetPosition"] = {["value"] = target,
							["hash"] = hvFunc(target)},
						["raycast"] = {
							["cameraPosition"] = hvFunc(cam.CFrame.Position), 
							["cursorDirection"] = hvFunc(Ray.new(cam.CFrame.Position, v.Character:GetPrimaryPartCFrame().Position).Unit.Direction)
						},
						["selfPosition"] = {["value"] = selfPosition,
							["hash"] = hvFunc(selfPosition)
						}
						}
					})
					if killaurasound["Enabled"] then
						playsound("rbxassetid://6760544639", killaurasoundval["Value"])
					end
					if killauraswing["Enabled"] then
						playanimation("rbxassetid://4947108314")
					end
				end
			else
				rgfejd = false
			end
		end
	end
end

local itemtab = debug.getupvalue(require(game:GetService("ReplicatedStorage").TS.item["item-meta"]).getItemMeta, 1)
local CombatConstant = require(game:GetService("ReplicatedStorage").TS.combat["combat-constant"]).CombatConstant
local function getEquipped()
	local typetext = ""
	local obj = (entity.isAlive and lplr.Character:FindFirstChild("HandInvItem") and lplr.Character.HandInvItem.Value or nil)
	if obj then
		if obj.Name:find("sword") or obj.Name:find("blade") or obj.Name:find("baguette") or obj.Name:find("scythe") or obj.Name:find("dao") then
			typetext = "sword"
		end
		if obj.Name:find("wool") or itemtab[obj.Name]["block"] then
			typetext = "block"
		end
		if obj.Name:find("bow") then
			typetext = "bow"
		end
	end
	return {["Object"] = obj, ["Type"] = typetext}
end

local Credits = window:NewTab("Credits")
local Combat = window:NewTab("Combat")
local Blatant = window:NewTab("Blatant")
local Render = window:NewTab("Render")
local Utility = window:NewTab("Utility")
local World = window:NewTab("World")
local Private = window:NewTab("Private")
local UI = window:NewTab("Ui")

local Credits = Credits:NewSection("Credits")
Credits:NewButton("Our discord", "discord", function()
    setclipboard("https://discord.gg/n3gKv7wx9w")
end)
Credits:NewLabel("Credits UI: Kavo ui")
Credits:NewLabel("Credits InfYield: FlyJump")
Credits:NewLabel("Credits 7GrandDad: Velocity")
Credits:NewLabel("Credits 7GrandDad: CFrame speed")
Credits:NewLabel("Credits Moerii: killaura")
Credits:NewLabel("Credits Moerii: bednuker")
Credits:NewLabel("Special thanks to Moerii: for Killaura")
Credits:NewLabel("Special thanks to Moerii: for BedNuker")
Credits:NewLabel("Special thanks to Vamp: For creating the script")

local Reach = Combat:NewSection("Reach")
Reach:NewToggle("Reach", "Extend your attack range", function(state)
	if state then
		CombatConstant.RAYCAST_SWORD_CHARACTER_DISTANCE = (reachval["Value"] - 0.0001)
	else
		CombatConstant.RAYCAST_SWORD_CHARACTER_DISTANCE = 14.4
	end
end)

Reach:NewSlider("Range 18-1", "", 18, 1, function(val) -- 500 (MaxValue) | 0 (MinValue)
	reachval["Value"] = val
end)

local Sprint = Combat:NewSection("Sprint")
Sprint:NewToggle("Sprint", "Automatically on your sprint", function(state)
	if state then
		BindToStepped("Sprint", 1, function()
			if SprintCont.sprinting == false then
				SprintCont:startSprinting()
			end
		end)
	else
		UnbindFromStepped("Sprint")
		SprintCont:stopSprinting()
	end
end)

local NoFall = Combat:NewSection("NoFallDamage")
NoFall:NewToggle("NoFallDamage", "Prevents taking fall damage", function(state)
	if state then
		local NoFall = {["Enabled"] = true}
		local oldfall

		spawn(function()
			repeat task.wait(0.5)
				ClientHandler:Get("GroundHit"):SendToServer()
			until NoFall["Enabled"] == false
		end)
	end
end)

local Velocity = Combat:NewSection("Velocity")
Velocity:NewToggle("Velocity", "Prevents taking a knockback", function(state)
	if state then
		KnockbackTable["kbDirectionStrength"] = 0
		KnockbackTable["kbUpwardStrength"] = 0
	else
		KnockbackTable["kbDirectionStrength"] = 100
		KnockbackTable["kbUpwardStrength"] = 100
	end
end)

local cloneval = false
local CloneGodModeFulldisablertroll
local CloneGodModeFulldisablertroll = Private:NewSection("CloneGodModeFulldisablertroll")
CloneGodModeFulldisablertroll:NewToggle("CloneGodModeFulldisablertroll", "You can troll ppl XD and kill too", function(state)
   if state then
       cloneval = state
            if cloneval then
                spawn(function()
                    isclone = true
                    clonemake()
                    speedd = 200
                    connectionnnn = game:GetService("RunService").Heartbeat:connect(function()
                        local velo = clone.Humanoid.MoveDirection * speedd
                        clone.HumanoidRootPart.Velocity = Vector3.new(velo.x, lplr.Character.HumanoidRootPart.Velocity.y, velo.z)
                    end)
                end)
                repeat task.wait() until (matchState == 2)
                funiclonegodmodedisab:Toggle()
            else
                clone:remove()
                lplr.Character = realchar
                realchar.Humanoid:ChangeState("Dead")
                isclone = false
                connectionnnn:Disconnect()
                return
            end
   end
end)

local Speed = Blatant:NewSection("Speed")
Speed:NewToggle("CFrame", "", function(state)
	if state then
		BindToStepped("CFrameWalkSpeed", 1, function(time, delta)
			if entity.isAlive then
				local newpos = (lplr.Character.Humanoid.MoveDirection  * (speedval["Value"] - lplr.Character.Humanoid.WalkSpeed)) * delta

				local raycastparameters = RaycastParams.new()
				raycastparameters.FilterDescendantsInstances = {lplr.Character}
				local ray = workspace:Raycast(lplr.Character.HumanoidRootPart.Position, newpos, raycastparameters)
				if ray then newpos = (ray.Position - lplr.Character.HumanoidRootPart.Position) end
				lplr.Character.HumanoidRootPart.CFrame = lplr.Character.HumanoidRootPart.CFrame + newpos
			end
		end)
	else
		UnbindFromStepped("CFrameWalkSpeed")
	end
end)

Speed:NewSlider("Speed 1-45", "Adjust CFrame speed", 45, 1, function(s)
	speedval["Value"] = s
end)

local Aura = Blatant:NewSection("KillAura")
Aura:NewToggle("KillAura", "Autoswing the sword if someone is near you", function(state)
	if state then
		BindToStepped("Killaura", 1, function()
			if entity.isAlive then
				KillauraRemote()
			end
		end)
	else
		UnbindFromStepped("Killaura")
	end
end)

Aura:NewSlider("Distance 1-20", "Increase killaura distance", 20, 1, function(val)
	DistVal["Value"] = val
end)

Aura:NewToggle("No Swing", "Disable killaura swing", function(state)
	if state then
		if killauraswing["Enabled"] == true then
			killauraswing["Enabled"] = false
		end
	else
		if killauraswing["Enabled"] == false then
			killauraswing["Enabled"] = true
		end
	end
end)

Aura:NewSlider("Sound 1-0", "Adjust killaura sound", 1, 0, function(val)
	killaurasoundval["Value"] = val
end)

function animfunc(id)
    local Animator = hmd:WaitForChild("Animator")
    local Animation = Instance.new("Animation", char)
    Animation.AnimationId = "rbxassetid://"..id
    Animation.Parent = char

    local PlayAnim = Animator:LoadAnimation(Animation)
    PlayAnim:Play()
end

function getbedsxd()
    local beds = {}
    local blocks = game:GetService("Workspace").Map.Blocks
    for _,Block in pairs(blocks:GetChildren()) do
        if Block.Name == "bed" and Block.Covers.BrickColor ~= game.Players.LocalPlayer.Team.TeamColor then
            table.insert(beds,Block)
        end
    end
    return beds
end

function getbedsblocks()
    local blockstb = {}
    local blocks = game:GetService("Workspace").Map.Blocks
    for i,v in pairs(blocks:GetChildren()) do
        if v:IsA("Part") then
            table.insert(blockstb,v)
        end
    end
    return blockstb
end

function blocks(bed)
    local aboveblocks = 0
    local Blocks = getbedsblocks()
    for _,Block in pairs(Blocks) do
        if Block.Position.X == bed.X and Block.Position.Z == bed.Z and Block.Name ~= "bed" and (Block.Position.Y - bed.Y) <= 9 and Block.Position.Y > bed.Y then
            aboveblocks = aboveblocks + 1
        end
    end
    return aboveblocks
end

function nuker()
    local beds = getbedsxd()
    for _,bed in pairs(beds) do
        local bedmagnitude = (bed.Position - game.Players.LocalPlayer.Character.PrimaryPart.Position).Magnitude
        if bedmagnitude < 27 then
            local upnum = blocks(bed.Position)
            local x = math.round(bed.Position.X/3)
            local y = math.round(bed.Position.Y/3) + upnum
            local z = math.round(bed.Position.Z/3)
            game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.DamageBlock:InvokeServer({
                ["blockRef"] = {
                    ["blockPosition"] = Vector3.new(x,y,z)
                },
                ["hitPosition"] = Vector3.new(x,y,z),
                ["hitNormal"] = Vector3.new(x,y,z),
            })
        end
    end
end

function funinuker()
    if (not isclone) then
        local beds = getbedsxd()
        for _,bed in pairs(beds) do
            local bedmagnitude = (bed.Position - game.Players.LocalPlayer.Character.PrimaryPart.Position).Magnitude
            if bedmagnitude < 27 then
                game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged[landmineremote]:FireServer({
                    ["invisibleLandmine"] = bed
                })
            end
        end
    else
        local beds = getbedsxd()
        for _,bed in pairs(beds) do
            local bedmagnitude = (bed.Position - clone.PrimaryPart.Position).Magnitude
            if bedmagnitude < 27 then
                game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged[landmineremote]:FireServer({
                    ["invisibleLandmine"] = bed
                })
            end
        end
    end
end

local BNuker = Blatant:NewSection("BedNuker")
BNuker:NewToggle("BedNuker", "Auto break bed and covers", function(state)
	if state then
		local bedrekterval = state
        if bedrekterval then
            spawn(function()
                repeat
                    wait()
                    if entity.isAlive then
                        wait(0.25)
                        if (not bedrekterval) then return end
                        nuker()
                    end
                until (not bedrekterval)
            end)
        end
    end
end)

local gamesound = require(game:GetService("ReplicatedStorage").TS.sound["game-sound"]).GameSound
local MCSound = Blatant:NewSection("MCSound")
MCSound:NewToggle("MCSound", "MCSound", function(state)
    if state then
      getgenv().mcsounds = state
        if getgenv().mcsounds then
          spawn(function()
                lplr.leaderstats.Bed:GetPropertyChangedSignal("Value"):Connect(yesyesbed)
            end)
            spawn(function()
                Client:WaitFor("BedwarsBedBreak"):andThen(function(p13)
                    p13:Connect(function(p14)
                        local sound = Instance.new("Sound")
                        sound.Parent = workspace
                        sound.SoundId = getcustomassetfunc("rektsky/sound/mc/bedbreak.mp3")
                        sound:Play()
                        wait(4)
                        sound:remove()
                    end)
                end)
            end)
      spawn(function()
            local oldsounds = gamesound
            local newsounds = gamesound
            newsounds.UI_CLICK = "rbxassetid://535716488"
            newsounds.PICKUP_ITEM_DROP = getcustomassetfunc("rektsky/sound/mc/pickup.mp3")
            newsounds.KILL = "rbxassetid://1053296915"
            newsounds.ERROR_NOTIFICATION = ""
            newsounds.DAMAGE_1 = "rbxassetid://6361963422"
            newsounds.DAMAGE = "rbxassetid://6361963422"
            newsounds.DAMAGE_2 = "rbxassetid://6361963422"
            newsounds.DAMAGE_3 = "rbxassetid://6361963422"
            newsounds.SWORD_SWING_1 = ""
            newsounds.SWORD_SWING_2 = ""
            newsounds.BEDWARS_PURCHASE_ITEM = getcustomassetfunc("rektsky/sound/mc/buyitem.mp3")
            newsounds.STATIC_HIT = "rbxassetid://6361963422"
            newsounds.STONE_BREAK = "rbxassetid://6496157434"
            newsounds.WOOL_BREAK = getcustomassetfunc("rektsky/sound/mc/woolbreak.mp3")
            newsounds.WOOD_BREAK = getcustomassetfunc("rektsky/sound/mc/breakwood.mp3")
            newsounds.GLASS_BREAK = getcustomassetfunc("rektsky/sound/mc/glassbreak.mp3")
            newsounds.TNT_HISS_1 = getcustomassetfunc("rektsky/sound/mc/tnthiss.mp3")
            newsounds.TNT_EXPLODE_1 = getcustomassetfunc("rektsky/sound/mc/tntexplode.mp3")
            gamesound = newsounds
          end)
        else
            gamesound = oldsounds
    end
  end
end)
--- AutoToxic
function yesoksussybed()
    if lplr.leaderstats.Bed.Value ~= "✅" then
        game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("Who ever broke my bed, i have your location", 'All')
    end
end

local Insults = Private:NewSection("Insults")
Insults:NewToggle("Insults [AutoToxic]", "amogus", function(state)
      if state then
        spawn(function()  
                getgenv().autotoxicval = state
            Client:WaitFor("EntityDeathEvent"):andThen(function(p6)
                p6:Connect(function(p7)
                    if p7.fromEntity == lplr.Character then
                        if not getgenv().autotoxicval then return end
                        if getgenv().autotoxicval then
                            local susplr = game.Players:GetPlayerFromCharacter(p7.entityInstance)
                            local toxicmessages = {"Hey, "..susplr.Name..", you should really get RektSky, one of the best gaming chairs! thank me later!!", "Dude you're awfull at this game get better "..susplr.Name.."!", susplr.Name.." you don't get it, you nedd to TURN ON kill aura velocity speed and all that stuff you dumb", "well, "..susplr.Name..", that was the LITERAL easiest kill, RektSky got a nice gaming chair", "try harder "..susplr.Name..", you're so bad", "cope "..susplr.Name, "omg guys vbedwar haker!!!11", "get better noob "..susplr.Name, "me when the "..susplr.Name.." is sus", "me when the "..susplr.Name.." is so sussy", "RektSky is just great!", "ez "..susplr.Name, "L "..susplr.Name, "Bow to me noob, slave "..susplr.Name, "rektsky = best", "me when the rektsky", "omg!!11& bedwar haker!111 hE IS HACIGN OMG SOTP HACKING "..susplr.Name, "shoutout to my boi "..susplr.Name}
                            local randomtoxicmessage = toxicmessages[math.random(1,#toxicmessages)]
                            if last ~= randomtoxicmessage and secondlast ~= randomtoxicmessage and thirdlast ~= randomtoxicmessage then
                                game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(randomtoxicmessage, 'All')
                                thirdlast = secondlast
                                secondlast = last
                                last = randomtoxicmessage
                            else
                                local susplr = game.Players:GetPlayerFromCharacter(p7.entityInstance)
                                local toxicmessages = {"Hey, "..susplr.Name..", you should really get RektSky, one of the best gaming chairs! thank me later!!", "Dude you're awfull at this game get better "..susplr.Name.."!", susplr.Name.." you don't get it, you nedd to TURN ON kill aura velocity speed and all that stuff you dumb", "well, "..susplr.Name..", that was the LITERAL easiest kill, RektSky got a nice gaming chair", "try harder "..susplr.Name..", you're so bad", "cope "..susplr.Name, "omg guys vbedwar haker!!!11", "get better noob "..susplr.Name, "me when the "..susplr.Name.." is sus", "me when the "..susplr.Name.." is so sussy", "RektSky is just great!", "ez "..susplr.Name, "L "..susplr.Name, "Bow to me noob, slave "..susplr.Name, "rektsky = best", "me when the rektsky", "omg!!11& bedwar haker!111 hE IS HACIGN OMG SOTP HACKING "..susplr.Name, "shoutout to my boi "..susplr.Name}
                                local randomtoxicmessage = toxicmessages[math.random(1,#toxicmessages)]
                                if last ~= randomtoxicmessage and secondlast ~= randomtoxicmessage and thirdlast ~= randomtoxicmessage then
                                    game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(randomtoxicmessage, 'All')
                                    thirdlast = secondlast
                                    secondlast = last
                                    last = randomtoxicmessage
                                end
                            end
                        end
                    end
                end)        
            end)
        end)
        spawn(function()
            getgenv().valspeed = state
            if getgenv().valspeed then
                spawn(function()
                    Client:WaitFor("BedwarsBedBreak"):andThen(function(p13)
                        p13:Connect(function(p14)
                            if p14.player.UserId == lplr.UserId then
                                local team = queuemeta[clntstorehandlr:getState().Game.queueType or "bedwars_test"].teams[tonumber(p14.brokenBedTeam.id)]
                                local teamname = team and team.displayName:lower() or "white"
                                game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("yooo cool bed "..teamname.." :)", 'All')
                            end
                        end)
                    end)
                end)
            end
        end)
        spawn(function()
            lplr.leaderstats.Bed:GetPropertyChangedSignal("Value"):Connect(yesoksussybed)
        end)
      end
    end)

function yesoksussybed()
    if lplr.leaderstats.Bed.Value ~= "✅" then
        game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("Who ever broke my bed, i have your location", 'All')
    end
end

local AutoToxic = Private:NewSection("atrocity")
AutoToxic:NewToggle("AutoToxic", "amogus", function(state)
      if state then
        spawn(function()  
                getgenv().autotoxicval = state
            Client:WaitFor("EntityDeathEvent"):andThen(function(p6)
                p6:Connect(function(p7)
                    if p7.fromEntity == lplr.Character then
                        if not getgenv().autotoxicval then return end
                        if getgenv().autotoxicval then
                            local susplr = game.Players:GetPlayerFromCharacter(p7.entityInstance)
                            local toxicmessages = {"dude, "..susplr.Name.."Please Go get Sytronight you so bad ", "get better "..susplr.Name.."!", susplr.Name.."imagine No Sytronight ", "Get sytroNigth if you want to better "..susplr.Name.."WOW SYTRONIGHT GZMING CHAIR IS SO GOOD", "Hecker?? "..susplr.Name..", L BOZO", "cap lol "..susplr.Name, "omg Am So Good Better than yoy mom", "noob "..susplr.Name, "hey bro "..susplr.Name.." Get SytroNight", "No Skid?? "..susplr.Name.." Well Good", "SytroNight is just good bro have god CHAIR", "ez L "..susplr.Name, "L "..susplr.Name, "Bow Spam? TRY IT HIT ME "..susplr.Name, "No Life??? Get SytroNighy", "SytroNight On top", "omg am just new guys please Am New "..susplr.Name, "shoutcut Lol "..susplr.Name}
                            local randomtoxicmessage = toxicmessages[math.random(1,#toxicmessages)]
                            if last ~= randomtoxicmessage and secondlast ~= randomtoxicmessage and thirdlast ~= randomtoxicmessage then
                                game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(randomtoxicmessage, 'All')
                                thirdlast = secondlast
                                secondlast = last
                                last = randomtoxicmessage
                            else
                                local susplr = game.Players:GetPlayerFromCharacter(p7.entityInstance)
                                local toxicmessages = {"dude, "..susplr.Name.."Please Go get Sytronight you so bad ", "get better "..susplr.Name.."!", susplr.Name.."imagine No Sytronight ", "Get sytroNigth if you want to better "..susplr.Name.."WOW SYTRONIGHT GZMING CHAIR IS SO GOOD", "Hecker?? "..susplr.Name..", L BOZO", "cap lol "..susplr.Name, "omg Am So Good Better than yoy mom", "noob "..susplr.Name, "hey bro "..susplr.Name.." Get SytroNight", "No Skid?? "..susplr.Name.." Well Good", "SytroNight is just good bro have god CHAIR", "ez L "..susplr.Name, "L "..susplr.Name, "Bow Spam? TRY IT HIT ME "..susplr.Name, "No Life??? Get SytroNighy", "SytroNight On top", "omg am just new guys please Am New "..susplr.Name, "shoutcut Lol "..susplr.Name}
                                local randomtoxicmessage = toxicmessages[math.random(1,#toxicmessages)]
                                if last ~= randomtoxicmessage and secondlast ~= randomtoxicmessage and thirdlast ~= randomtoxicmessage then
                                    game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(randomtoxicmessage, 'All')
                                    thirdlast = secondlast
                                    secondlast = last
                                    last = randomtoxicmessage
                                end
                            end
                        end
                    end
                end)        
            end)
        end)
        spawn(function()
            getgenv().valspeed = state
            if getgenv().valspeed then
                spawn(function()
                    Client:WaitFor("BedwarsBedBreak"):andThen(function(p13)
                        p13:Connect(function(p14)
                            if p14.player.UserId == lplr.UserId then
                                local team = queuemeta[clntstorehandlr:getState().Game.queueType or "bedwars_test"].teams[tonumber(p14.brokenBedTeam.id)]
                                local teamname = team and team.displayName:lower() or "white"
                                game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("wait SytroBed GIVE ME "..teamname.." :>>>", 'All')
                            end
                        end)
                    end)
                end)
            end
        end)
        spawn(function()
            lplr.leaderstats.Bed:GetPropertyChangedSignal("Value"):Connect(yesoksussybed)
        end)
      end
    end)

local Infjump = Blatant:NewSection("InfJump")
Infjump:NewToggle("Infjump", "Allows you to hold space to fly up", function(state)
	if state then
		local InfJump = {["Enabled"] = true}
		connectioninfjump = uis.JumpRequest:connect(function(jump)
			if InfJump["Enabled"] then
				lplr.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")
			end
		end)
	else
		connectioninfjump:Disconnect()
	end
end)

runcode(function()
	local wall = nil
	local spiderspeed = {["Value"] = 0}
	local Spider = Blatant:NewSection("Spider")
	Spider:NewToggle("Spider", "Allows you to climb up a wall", function(state)
		if state then
			BindToStepped("Spider", 1, function()
				local raycastparameters = RaycastParams.new()
				raycastparameters.FilterDescendantsInstances = {lplr.Character}
				local ray = workspace:Raycast(lplr.Character.Humanoid.LeftLeg.Position, lplr.Character.HumanoidRootPart.CFrame.LookVector * 1.3, raycastparameters)

				wall = ray and ray.Instance or nil
				if wall then
					lplr.Character.HumanoidRootPart.Velocity = Vector3.new(lplr.Character.HumanoidRootPart.Velocity.X or 0, spiderspeed["Value"], lplr.Character.HumanoidRootPart.Velocity.Z or 0)

					if lplr.Character.Humanoid:GetState() ~= Enum.HumanoidStateType.Climbing then
						lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Freefall)
					end
				end
			end)
		else
			UnbindFromStepped("Spider")
		end
	end)
	Spider:NewSlider("Speed", "Adjust spider speed", 100, 0, function(val) -- 500 (MaxValue) | 0 (MinValue)
		spiderspeed["Value"] = val
	end)
end)

local FixCam = Utility:NewSection("FixCam/RestoreCam")
FixCam:NewButton("FixCam", "fix camera bug on mobile", function()
	cam.CameraType = Enum.CameraType.Fixed
	cam.CameraType = Enum.CameraType.Custom
end)

	
local Flight = Utility:NewSection("Flight")
Flight:NewToggle("Flight [LongJunp]", "test", function(state)
	if state then
		game.Workspace.Gravity = 0
	else
		game.Workspace.Gravity = 196
	end
end)

local colorbox
local function makeRainbowText(text)
    spawn(function()
        colorbox = Color3.fromRGB(170,0,170)
        local x = 0
        while wait() do
            colorbox = Color3.fromHSV(x,1,1)
            x = x + 4.5/255
            if x >= 1 then
                x = 0
            end
        end
    end)
    spawn(function()
        repeat
            wait()
            text.TextColor3 = colorbox
        until true == false
    end)
end

local function makeRainbowFrame(frame)
    spawn(function()
        repeat
            wait()
            frame.BackgroundColor3 = colorbox
        until true == false
    end)
end

local ESPFolder
local ESP = Render:NewSection("ESP")
ESP:NewToggle("ESP", "coming next update", function(state)
	if state then
		local thing
        local espval = state
        if espval then
            spawn(function()
                ESPFolder = Instance.new("Folder")
                ESPFolder.Name = "ESPFolder"
                ESPFolder.Parent = ScreenGuitwo
                repeat
                    task.wait()
                    if (not espval) then break end
                    for i,plr in pairs(game.Players:GetChildren()) do
                        if ESPFolder:FindFirstChild(plr.Name) then
                            thing = ESPFolder[plr.Name]
                            thing.Visible = false
                        else
                            thing = Instance.new("ImageLabel")
                            thing.BackgroundTransparency = 1
                            thing.BorderSizePixel = 0
                            thing.Image = getcustomassetthingylol("rektsky/assets/esppic.png")
                            thing.Visible = false
                            thing.Name = plr.Name
                            thing.Parent = ESPFolder
                            thing.Size = UDim2.new(0, 256, 0, 256)
                        end
                        
                        if isAlive(plr) and plr ~= lplr and plr.Team ~= tostring(lplr.Team) then
                            local rootPos, rootVis = cam:WorldToViewportPoint(plr.Character.HumanoidRootPart.Position)
                            local rootSize = (plr.Character.HumanoidRootPart.Size.X * 1200) * (cam.ViewportSize.X / 1920)
                            local headPos, headVis = cam:WorldToViewportPoint(plr.Character.HumanoidRootPart.Position + Vector3.new(0, 1 + (plr.Character.Humanoid.RigType == Enum.HumanoidRigType.R6 and 2 or plr.Character.Humanoid.HipHeight), 0))
                            local legPos, legVis = cam:WorldToViewportPoint(plr.Character.HumanoidRootPart.Position - Vector3.new(0, 1 + (plr.Character.Humanoid.RigType == Enum.HumanoidRigType.R6 and 2 or plr.Character.Humanoid.HipHeight), 0))
                            rootPos = rootPos
                            if rootVis then
                                thing.Visible = rootVis
                                thing.Size = UDim2.new(0, rootSize / rootPos.Z, 0, headPos.Y - legPos.Y)
                                thing.Position = UDim2.new(0, rootPos.X - thing.Size.X.Offset / 2, 0, (rootPos.Y - thing.Size.Y.Offset / 2) - 36)
                            end
                        end
                    end
                until (not espval)
            end)
            game.Players.PlayerRemoving:connect(function(plr)
                if ESPFolder:FindFirstChild(plr.Name) then
                    ESPFolder[plr.Name]:Remove()
                end
            end)
        else
            ESPFolder:remove()
            return
        end
    end
end)

local LowGravity = Private:NewSection("LowGravity")
LowGravity:NewToggle("LowGravity", "LowGravity", function(state)
       if state then
           game.Workspace.Gravity = 10
      else
        game.Workspace.Gravity = 196
       end
end)
 
local chinahattrail
local chinahatenabled = false
local ChinaHat = World:NewSection("ChinaHat")
ChinaHat:NewToggle("ChinaHat", "China Hat Boi", function(state)
       if state then
             chinahatenabled = state
        if chinahatenabled then
			spawn(function()
                repeat
                    task.wait(0.3)
                    if (not chinahatenabled) then return end
                    if entity.isAlive then
                        if chinahattrail == nil or chinahattrail.Parent == nil then
                            chinahattrail = Instance.new("Part")
                            chinahattrail.CFrame = lplr.Character.Head.CFrame * CFrame.new(0, 1.1, 0)
                            chinahattrail.Size = Vector3.new(3, 0.7, 3)
                            chinahattrail.Name = "ChinaHat"
                            chinahattrail.Material = Enum.Material.Neon
                            chinahattrail.CanCollide = false
                            chinahattrail.Transparency = 0.3
                            local chinahatmesh = Instance.new("SpecialMesh")
                            chinahatmesh.Parent = chinahattrail
                            chinahatmesh.MeshType = "FileMesh"
                            chinahatmesh.MeshId = "http://www.roblox.com/asset/?id=1778999"
                            chinahatmesh.Scale = Vector3.new(3, 0.6, 3)
                            local chinahatweld = Instance.new("WeldConstraint")
                            chinahatweld.Name = "WeldConstraint"
                            chinahatweld.Parent = chinahattrail
                            chinahatweld.Part0 = lplr.Character.Head
                            chinahatweld.Part1 = chinahattrail
                            chinahattrail.Parent = workspace.Camera
                        else
                            chinahattrail.Parent = workspace.Camera
                            chinahattrail.CFrame = lplr.Character.Head.CFrame * CFrame.new(0, 1.1, 0)
                            chinahattrail.LocalTransparencyModifier = ((cam.CFrame.Position - cam.Focus.Position).Magnitude <= 0.6 and 1 or 0)
                            if chinahattrail:FindFirstChild("WeldConstraint") then
                                chinahattrail.WeldConstraint.Part0 = lplr.Character.Head
                            end
                        end
                    else
                        if chinahattrail then 
                            chinahattrail:remove()
                            chinahattrail = nil
                        end
                    end
                until (not chinahatenabled)
            end)
        else
            if chinahattrail then
                chinahattrail:Remove()
                chinahattrail = nil
            end
        end
    end
end)

runcode(function()
	local function Cape(char, texture)
		for i,v in pairs(char:GetDescendants()) do
			if v.Name == "Cape" then
				v:Remove()
			end
		end
		local hum = char:WaitForChild("Humanoid")
		if char:FindFirstChild("Torso") then
			torso = char.Torso
		else
			torso = char.UpperTorso
		end
		local p = Instance.new("Part", torso.Parent)
		p.Name = "Cape"
		p.Anchored = false
		p.CanCollide = false
		p.TopSurface = 0
		p.BottomSurface = 0
	  p.Color = Color3.fromRGB(255,255,255)
		p.FormFactor = "Custom"
		p.Size = Vector3.new(0.2,0.2,0.2)
		p.Transparency = 0
		local decal = Instance.new("Decal", p)
		decal.Texture = "http://www.roblox.com/asset/?id=9608953346"
		decal.Face = "Back"
		local msh = Instance.new("BlockMesh", p)
		msh.Scale = Vector3.new(9,17.5,0.5)
		local motor = Instance.new("Motor", p)
		motor.Part0 = p
		motor.Part1 = torso
		motor.MaxVelocity = 0.01
		motor.C0 = CFrame.new(0,2,0) * CFrame.Angles(0,math.rad(90),0)
		motor.C1 = CFrame.new(0,1,0.45) * CFrame.Angles(0,math.rad(90),0)
		local wave = false
		repeat wait(1/44)
			decal.Transparency = torso.Transparency
			local ang = 0.1
			local oldmag = torso.Velocity.magnitude
			local mv = 0.002
			if wave then
				ang = ang + ((torso.Velocity.magnitude/10) * 0.05) + 0.05
				wave = false
			else
				wave = true
			end
			ang = ang + math.min(torso.Velocity.magnitude/11, 0.5)
			motor.MaxVelocity = math.min((torso.Velocity.magnitude/111), 0.04) --+ mv
			motor.DesiredAngle = -ang
			if motor.CurrentAngle < -0.2 and motor.DesiredAngle > -0.2 then
				motor.MaxVelocity = 0.04
			end
			repeat wait() until motor.CurrentAngle == motor.DesiredAngle or math.abs(torso.Velocity.magnitude - oldmag) >= (torso.Velocity.magnitude/10) + 1
			if torso.Velocity.magnitude < 0.1 then
				wait(0.1)
			end
		until not p or p.Parent ~= torso.Parent
	end
	local Cape = Render:NewSection("Cape")
	Cape:NewToggle("Cape", "Wear a cape on the back side of character", function(state)
		if state then
			lplr.CharacterAdded:Connect(function(char)
				if char ~= oldchar then
					spawn(function()
						pcall(function()

							Cape(char, "rbxthumb://type=Asset&id=" .. 9824791700 .. "&w=420&h=420")
						end)
					end)
				end
			end)
			spawn(function()
				if lplr.Character and lplr.Character ~= oldchar then
					spawn(function()
						pcall(function()
							Cape(lplr.Character, "rbxthumb://type=Asset&id=" .. 9824791700 .. "&w=420&h=420")
						end)
					end)
				end
			end)
		else
			if lplr.Character then
				for i,v in pairs(lplr.Character:GetDescendants()) do
					if v.Name == "Cape" then
						v:Remove()
					end
				end
			end
		end
	end)
end)



runcode(function()
	local antivoidp
end)

local AntiVoid = World:NewSection("AntiVoid")
AntiVoid:NewToggle("AntiVoid", "Give's you a second chance to get back on land", function(state)
	if state then
		antivoidp = Instance.new("Part", workspace)
		antivoidp.Name = "AntiVoid"
		antivoidp.CanCollide = true
		antivoidp.Size = Vector3.new(2048, 1, 2048)
		antivoidp.Anchored = true
		antivoidp.Transparency = 1 - (antivoidtransparent["Value"] / 100)
		antivoidp.Material = Enum.Material.Neon
		antivoidp.Color = Color3.fromHSV(antivoidcolor["Hue"], antivoidcolor["Sat"], antivoidcolor["Value"])
		antivoidp.Position = Vector3.new(0, 23.5, 0)
		antivoidp.Touched:connect(function(touchedvoid)
			if touchedvoid.Parent:FindFirstChild("Humanoid") and touchedvoid.Parent.Name == lplr.Name then
				lplr.Character.Humanoid.Jump = true
				lplr.Character.Humanoid:ChangeState("Jumping")
				wait(0.2)
				lplr.Character.Humanoid:ChangeState("Jumping")
				wait(0.2)
				lplr.Character.Humanoid:ChangeState("Jumping")
			end
		end)
	else
		if antivoidp then
			antivoidp:Remove()
		end
	end
end)

AntiVoid:NewColorPicker("Color", "Adjust antivoid color", Color3.fromHSV(antivoidcolor["Hue"], antivoidcolor["Sat"], antivoidcolor["Value"]), function(val)
	if antivoidp then
		antivoidp.Color = (val)
	end
end)

AntiVoid:NewSlider("Invisible 1-100", "Adjust antivoid transparency", 100, 0, function(val)
	if antivoidp then
		antivoidp.Transparency = 1 - (val / 100)
	end
end)


runcode(function()
local antivoidpart
end)

local AntiVoidV2 = World:NewSection("AntiVoid V2")
AntiVoidV2:NewToggle("AntiVoidV2", "Give's you a second chance to get back on land", function(state)
    if state then
            local antivoidpart = Instance.new("Part", Workspace)
            antivoidpart.Name = "AntiVoidV2"
            antivoidpart.Size = Vector3.new(2100, 0.5, 2000)
            antivoidpart.Position = Vector3.new(160.5, 25, 247.5)
            antivoidpart.Transparency = 0.4
            antivoidpart.Anchored = true
            antivoidpart.Touched:connect(function(touchedvoid)
                if touchedvoid.Parent:FindFirstChild("Humanoid") and touchedvoid.Parent.Name == lplr.Name then
                    game.Players.LocalPlayer.Character.Humanoid:ChangeState("Jumping")
                    wait(0.2)
                    game.Players.LocalPlayer.Character.Humanoid:ChangeState("Jumping")
                    wait(0.2)
                    game.Players.LocalPlayer.Character.Humanoid:ChangeState("Jumping")
                end
            end)
        else
            if antivoidpart then
			antivoidpart:Remove()
			end
        end
end)


                        
local TpAura
local tpauralmao
local TpAura = Private:NewSection("TpAura")
TpAura:NewToggle("TpAura", "tp killed", function(state)
	if state then
		TpAura = state
        repeat task.wait() until (matchState == 1)
        secondclonemake()
        if matchState == 1 then
            spawn(function()
                if TpAura and entity.isAlive then
                    if entity.isAlive then
                        repeat
                            wait()
                            if (not TpAura) then return end
                            spawn(function()
                                wait()
                                local mouse = game.Players.LocalPlayer:GetMouse()
                                for i,v in pairs(game.Players:GetChildren()) do
                                    if v.Character and v.Name ~= game.Players.LocalPlayer.Name and v.Character:FindFirstChild("HumanoidRootPart") then
                                        local mag = (v.Character.HumanoidRootPart.Position - clonetwo.HumanoidRootPart.Position).Magnitude
                                        if mag <= 20 and v.Team ~= game.Players.LocalPlayer.Team and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health > 0 then
                                            if v.Character:FindFirstChild("Head") then
                                                game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged[landmineremote]:FireServer({
                                                    ["invisibleLandmine"] = v.Character.Head                                        
                                                })
                                            end
                                        end
                                    end
                                end 
                            end)
                            spawn(function()
                                local plrthing = GetAllNearestHumanoidToPosition(600, 1)
                                for i, plr in pairs(plrthing) do
                                    clonetwo.HumanoidRootPart.CFrame = plr.Character.HumanoidRootPart.CFrame
                                    wait(0.6)
                                    clonetwo.HumanoidRootPart.CFrame = clone.HumanoidRootPart.CFrame
                                    wait(0.6)
                                end
                            end)
                            spawn(function()
                                repeat task.wait() until (matchState == 2)
                                tpauralmao:Toggle()
                            end)
                        until (not TpAura)
                    end
                else
                    clonetwo:remove()
                    return
                end
            end)
        end
    end
end)

local shopthingyshopshop = debug.getupvalue(require(game:GetService("ReplicatedStorage").TS.games.bedwars.shop["bedwars-shop"]).BedwarsShop.getShopItem, 2)
local oldnexttier
local oldtiered
local bypassstpidshoptiers = false
local ShopTierBypass = Private:NewSection("ShopTierBypass")
ShopTierBypass:NewToggle("ShopTierBypass", "unlock everything in shop", function(state)
  if state then
   if (bypassstpidshoptiers) then
            for i,v in pairs(shopthingyshopshop) do
                oldtiered = oldtiered or v.tiered
                oldnexttier = oldnexttier or v.nextTier
            end
            for i,v in pairs(shopthingyshopshop) do
                v.tiered = nil
                v.nextTier = nil
            end
        else
            for i,v in pairs(shopthingyshopshop) do
                v.tiered = oldtiered
                v.nextTier = oldnexttier
            end
        end
    end
end)

local longjumpval = false
local gravityval = {["Value"] = 0}
local longjumpdelay = {["Value"] = 0.1}
local LongJump = Private:NewSection("LongJump")
LongJump:NewToggle("LongJump", "Air Lock and Walking", function(state)
         if state then
            longjumpval = state
            if longjumpval then
                workspace.Gravity = gravityval["Value"]
                spawn(function()
                    repeat
                        if (not longjumpval) then return end
                        lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Freefall)
                        wait(longjumpdelay["Value"])
                        lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Running)
                        wait(longjumpdelay["Value"])
                        lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Climbing)
                        wait(longjumpdelay["Value"])
                        lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Swimming)
                        wait(longjumpdelay["Value"])
                        lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Landed)
                        wait(longjumpdelay["Value"])
                    until (not longjumpval)
                end)
            else
                workspace.Gravity = 196.19999694824
                return
            end
        end
end)

local OldBedwars = World:NewSection("OldBedwars")
OldBedwars:NewToggle("OldBedwars","Old Texture bedwars", function(callback)
     if callback then
        local tabofblocks = '{"wool_blue":"rbxassetid://5089281898","wool_pink":"rbxassetid://6856183009","clay_pink":"rbxassetid://6856283410","grass":["rbxassetid://6812582110","rbxassetid://6812616868","rbxassetid://6812616868","rbxassetid://6812616868","rbxassetid://6812616868","rbxassetid://6812616868"],"snow":"rbxassetid://6874651192","wool_cyan":"rbxassetid://6177124865","red_sandstone":"rbxassetid://6708703895","wool_green":"rbxassetid://6177123316","clay_black":"rbxassetid://5890435474","sand":"rbxassetid://6187018940","wool_orange":"rbxassetid://6177122584","hickory_log":"rbxassetid://6879467811","wood_plank_birch":"rbxassetid://6768647328","clay_gray":"rbxassetid://7126965624","wood_plank_spruce":"rbxassetid://6768615964","brick":"rbxassetid://6782607284","clay_dark_brown":"rbxassetid://6874651325","stone_brick":"rbxassetid://6710700118","ceramic":"rbxassetid://6875522401","clay_blue":"rbxassetid://4991097126","wood_plank_maple":"rbxassetid://6768632085","diamond_block":"rbxassetid://6734061546","wood_plank_oak":"rbxassetid://6768575772","ice":"rbxassetid://6874651262","marble":"rbxassetid://6594536339","spruce_log":"rbxassetid://6874161124","oak_log":"rbxassetid://6879467811","clay_light_brown":"rbxassetid://6874651634","clay_dark_green":"rbxassetid://6812653448","marble_pillar":["rbxassetid://6909328433","rbxassetid://6909328433","rbxassetid://6909323822","rbxassetid://6909323822","rbxassetid://6909323822","rbxassetid://6909323822"],"slate_brick":"rbxassetid://6708836267","obsidian":"rbxassetid://6855476765","iron_block":"rbxassetid://6734050333","wool_red":"rbxassetid://5089281973","clay_purple":"rbxassetid://6856099740","clay_orange":"rbxassetid://7017703219","clay_red":"rbxassetid://6856283323","wool_yellow":"rbxassetid://6829151816","tnt":["rbxassetid://6889157997","rbxassetid://6889157997","rbxassetid://6855533421","rbxassetid://6855533421","rbxassetid://6855533421","rbxassetid://6855533421"],"clay_yellow":"rbxassetid://4991097283","clay_white":"rbxassetid://7017705325","wool_purple":"rbxassetid://6177125247","sandstone":"rbxassetid://6708657090","wool_white":"rbxassetid://5089287375","clay_light_green":"rbxassetid://6856099550","birch_log":"rbxassetid://6856088949","emerald_block":"rbxassetid://6856082835","clay":"rbxassetid://6856190168","stone":"rbxassetid://6812635290","slime_block":"rbxassetid://6869286145"}'
local blocktab = game:GetService("HttpService"):JSONDecode(tabofblocks)
local tabofimages = '{"clay_orange":"rbxassetid://7017703219","iron":"rbxassetid://6850537969","glass":"rbxassetid://6909521321","log_spruce":"rbxassetid://6874161124","ice":"rbxassetid://6874651262","marble":"rbxassetid://6594536339","zipline_base":"rbxassetid://7051148904","iron_helmet":"rbxassetid://6874272559","marble_pillar":"rbxassetid://6909323822","clay_dark_green":"rbxassetid://6763635916","wood_plank_birch":"rbxassetid://6768647328","watering_can":"rbxassetid://6915423754","emerald_helmet":"rbxassetid://6931675766","pie":"rbxassetid://6985761399","wood_plank_spruce":"rbxassetid://6768615964","diamond_chestplate":"rbxassetid://6874272898","wool_pink":"rbxassetid://6910479863","wool_blue":"rbxassetid://6910480234","wood_plank_oak":"rbxassetid://6910418127","diamond_boots":"rbxassetid://6874272964","clay_yellow":"rbxassetid://4991097283","tnt":"rbxassetid://6856168996","lasso":"rbxassetid://7192710930","clay_purple":"rbxassetid://6856099740","melon_seeds":"rbxassetid://6956387796","apple":"rbxassetid://6985765179","carrot_seeds":"rbxassetid://6956387835","log_oak":"rbxassetid://6763678414","emerald_chestplate":"rbxassetid://6931675868","wool_yellow":"rbxassetid://6910479606","emerald_boots":"rbxassetid://6931675942","clay_light_brown":"rbxassetid://6874651634","balloon":"rbxassetid://7122143895","cannon":"rbxassetid://7121221753","leather_boots":"rbxassetid://6855466456","melon":"rbxassetid://6915428682","wool_white":"rbxassetid://6910387332","log_birch":"rbxassetid://6763678414","clay_pink":"rbxassetid://6856283410","grass":"rbxassetid://6773447725","obsidian":"rbxassetid://6910443317","shield":"rbxassetid://7051149149","red_sandstone":"rbxassetid://6708703895","diamond_helmet":"rbxassetid://6874272793","wool_orange":"rbxassetid://6910479956","log_hickory":"rbxassetid://7017706899","guitar":"rbxassetid://7085044606","wool_purple":"rbxassetid://6910479777","diamond":"rbxassetid://6850538161","iron_chestplate":"rbxassetid://6874272631","slime_block":"rbxassetid://6869284566","stone_brick":"rbxassetid://6910394475","hammer":"rbxassetid://6955848801","ceramic":"rbxassetid://6910426690","wood_plank_maple":"rbxassetid://6768632085","leather_helmet":"rbxassetid://6855466216","stone":"rbxassetid://6763635916","slate_brick":"rbxassetid://6708836267","sandstone":"rbxassetid://6708657090","snow":"rbxassetid://6874651192","wool_red":"rbxassetid://6910479695","leather_chestplate":"rbxassetid://6876833204","clay_red":"rbxassetid://6856283323","wool_green":"rbxassetid://6910480050","clay_white":"rbxassetid://7017705325","wool_cyan":"rbxassetid://6910480152","clay_black":"rbxassetid://5890435474","sand":"rbxassetid://6187018940","clay_light_green":"rbxassetid://6856099550","clay_dark_brown":"rbxassetid://6874651325","carrot":"rbxassetid://3677675280","clay":"rbxassetid://6856190168","iron_boots":"rbxassetid://6874272718","emerald":"rbxassetid://6850538075","zipline":"rbxassetid://7051148904"}'
local icontab = game:GetService("HttpService"):JSONDecode(tabofimages)
spawn(function()
    repeat wait() until game.Workspace ~= nil 
    repeat wait() until game.Workspace:FindFirstChild("Map") ~= nil
    for i,v in pairs(game.Workspace.Map.Blocks:GetChildren()) do
        if blocktab[v.Name] then
            if type(blocktab[v.Name]) == "table" then
                for i2,v2 in pairs(v:GetDescendants()) do
                    if v2:IsA("Texture") then
                        if v2.Name == "Top" then
                            v2.Texture = blocktab[v.Name][1]
                            v2.Color3 = v.Name == "grass" and Color3.fromRGB(115, 255, 28) or Color3.fromRGB(255, 255, 255)
                        elseif v2.Name == "Bottom" then
                            v2.Texture = blocktab[v.Name][2]
                        else
                            v2.Texture = blocktab[v.Name][3]
                        end
                    end
                end
            else
                for i2,v2 in pairs(v:GetDescendants()) do
                    if v2:IsA("Texture") then
                        v2.Texture = blocktab[v.Name]
                    end
                end
            end
        end
    end
end)
game:GetService("CollectionService"):GetInstanceAddedSignal("block"):connect(function(v)
    if blocktab[v.Name] then
        if type(blocktab[v.Name]) == "table" then
            for i2,v2 in pairs(v:GetDescendants()) do
                if v2:IsA("Texture") then
                    if v2.Name == "Top" then
                        v2.Texture = blocktab[v.Name][1]
                        v2.Color3 = v.Name == "grass" and Color3.fromRGB(115, 255, 28) or Color3.fromRGB(255, 255, 255)
                    elseif v2.Name == "Bottom" then
                        v2.Texture = blocktab[v.Name][2]
                    else
                        v2.Texture = blocktab[v.Name][3]
                    end
                end
            end
            v.DescendantAdded:connect(function(v3)
                if v3:IsA("Texture") then
                    if v3.Name == "Top" then
                        v3.Texture = blocktab[v.Name][1]
                        v3.Color3 = v.Name == "grass" and Color3.fromRGB(115, 255, 28) or Color3.fromRGB(255, 255, 255)
                    elseif v3.Name == "Bottom" then
                        v3.Texture = blocktab[v.Name][2]
                    else
                        v3.Texture = blocktab[v.Name][3]
                    end
                end
            end)
        else
            for i2,v2 in pairs(v:GetDescendants()) do
                if v2:IsA("Texture") then
                    v2.Texture = blocktab[v.Name]
                end
            end
            v.DescendantAdded:connect(function(v3)
                if v3:IsA("Texture") then
                    v3.Texture = blocktab[v.Name]
                end
            end)
        end
    end
end)

for i,v in pairs(debug.getupvalue(require(game:GetService("ReplicatedStorage").TS.item["item-meta"]).getItemMeta, 1)) do 
    if icontab[i] then 
        v.image = icontab[i]
    end
end

sethiddenproperty(game.Lighting, "Technology", "ShadowMap")
game.Lighting.Ambient = Color3.fromRGB(69, 69, 69)
game.Lighting.Brightness = 3
game.Lighting.EnvironmentDiffuseScale = 1
game.Lighting.EnvironmentSpecularScale = 1
game.Lighting.OutdoorAmbient = Color3.fromRGB(69, 69, 69)
game.Lighting.ShadowSoftness = 0.2
game.Lighting.Atmosphere.Density = 0.1
game.Lighting.Atmosphere.Offset = 0.25
game.Lighting.Atmosphere.Color = Color3.fromRGB(198, 198, 198)
game.Lighting.Atmosphere.Decay = Color3.fromRGB(104, 112, 124)
game.Lighting.Atmosphere.Glare = 0
game.Lighting.Atmosphere.Haze = 0
game.Lighting.ClockTime = 13
game.Lighting.GeographicLatitude = 0
game.Lighting.GlobalShadows = true
game.Lighting.TimeOfDay = "13:00:00"
     else
       print("false")
   end
end)

local hackdetector = false
local HackerDetected = Private:NewSection("HackerDetected")
HackerDetected:NewToggle("HackerDetected", "idk", function(v)
     if v then
               hackdetector = v
            if hackdetector then
                repeat task.wait() until (matchState == 2)
                spawn(function()
                    repeat
                        task.wait()
                        if (not hackdetector) then return end
                        for i, v in pairs(game.Players:GetChildren()) do
                            if v:FindFirstChild("HumanoidRootPart") then
                                local oldpos = v.Character.HumanoidRootPart.Position
                                task.wait(0.5)
                                local newpos = Vector3.new(v.Character.HumanoidRootPart.Position.X, 0, v.Character.HumanoidRootPart.Position.Z)
                                local realnewpos = math.floor((newpos - Vector3.new(oldpos.X, 0, oldpos.Z)).magnitude) * 2
                                if realnewpos > 32 then
                                    game:GetService("StarterGui"):SetCore("SendNotification", {
                                        Title = v.Name.." is cheating",
                                        Text = tostring(math.floor((newpos - Vector3.new(oldpos.X, 0, oldpos.Z)).magnitude)),
                                        Duration = 5,
                                    })
                                end
                            end
                        end
                    until (not hackdetector)
                end)
            end
        end
      end)

local RektskyAmbience = Private:NewSection("RektskyAmbience")
RektskyAmbience:NewToggle("RektskyAmbience", "RektskyAmbience", function(state)
            if state then
            game.Lighting.Ambient = Color3.fromRGB(0, 255, 255)
            game.Lighting.OutdoorAmbient = Color3.fromRGB(0, 0, 0)
        else
            game.Lighting.Ambient = Color3.fromRGB(91, 91, 91)
            game.Lighting.OutdoorAmbient = Color3.fromRGB(201, 201, 201)
        end
end)
  
  local speednor = Private:NewSection("SpeedNormal")
  SpeedNormal:NewButton("Speednormal", "idk", function()
   function enter(player)
	wait(2)
	local plr = game.Workspace:FindFirstChild(player.Name)
	if plr then
		local char = plr
		char.Humanoid.WalkSpeed = 23
	end
end
game.Players.ChildAdded:connect(23)
end)
    
  local funikillallthingy
local MovementDisabled = Private:NewSection("MovementDisabled")
MovementDisabled:NewToggle("MovementDisabled", "MovementDisabled", function(state)
  if state then
     local amogusssvalue = state
        if amogusssvalue then
            pcall(function()
                for i = 1,15 do
                    for i, v in pairs(game.Players:GetChildren()) do
                        if v ~= lplr then
                            if v.Character.HumanoidRootPart then
                                game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged[landmineremote]:FireServer({
                                    ["invisibleLandmine"] = v                        
                                })
                            end
                        end
                    end
                end
            end)
            funikillallthingy:silentToggle()
        end
    end
end)

local flyrektsky
local flyrektsky = Private:NewSection("Fly [rektsky]")
flyrektsky:NewToggle("Fly", "you can Fly", function(state)
  if state then
    flyrektsky = state
            if flyrektsky then
                spawn(function()
                    repeat
                        task.wait()
                        if clone then
                            task.wait()
                            workspace.Gravity = 1
                            local SpaceHeld = uis:IsKeyDown(Enum.KeyCode.Space)
                            local ShiftHeld = uis:IsKeyDown(Enum.KeyCode.LeftShift)
                            if SpaceHeld then
                                clone.HumanoidRootPart.CFrame = clone.HumanoidRootPart.CFrame * CFrame.new(0, 15, 0)
                                task.wait()
                            end
                            if ShiftHeld then
                                clone.HumanoidRootPart.CFrame = clone.HumanoidRootPart.CFrame * CFrame.new(0, -15, 0)
                                task.wait()
                            end
                        else
                            task.wait()
                            workspace.Gravity = 1
                            local SpaceHeld = uis:IsKeyDown(Enum.KeyCode.Space)
                            local ShiftHeld = uis:IsKeyDown(Enum.KeyCode.LeftShift)
                            if SpaceHeld then
                                hrp.CFrame = hrp.CFrame * CFrame.new(0, 15, 0)
                                task.wait()
                            end
                            if ShiftHeld then
                                hrp.CFrame = hrp.CFrame * CFrame.new(0, -15, 0)
                                task.wait()
                            end
                        end
                    until (not flyrektsky)
                end)
            else
                conectthingylol:Disconnect()
            end
       end
end)

local oldpos = Vector3.new(0, 0, 0)
local function getScaffold(vec, diagonaltoggle)
    local realvec = Vector3.new(math.floor((vec.X / 3) + 0.5) * 3, math.floor((vec.Y / 3) + 0.5) * 3, math.floor((vec.Z / 3) + 0.5) * 3) 
    local newpos = (oldpos - realvec)
    local returedpos = realvec
    if entity.isAlive then
        local angle = math.deg(math.atan2(-lplr.Character.Humanoid.MoveDirection.X, -lplr.Character.Humanoid.MoveDirection.Z))
        local goingdiagonal = (angle >= 130 and angle <= 150) or (angle <= -35 and angle >= -50) or (angle >= 35 and angle <= 50) or (angle <= -130 and angle >= -150)
        if goingdiagonal and ((newpos.X == 0 and newpos.Z ~= 0) or (newpos.X ~= 0 and newpos.Z == 0)) and diagonaltoggle then
            return oldpos
        end
    end
    return realvec
end

local yes
local yestwo
local sussyfunnything
local sussything = false
local scafffold = Private:NewSection("scafffold")
scafffold:NewToggle("scaffold", "auto block if you walk", function(state)
    if state then
      sussythingy = state
        if (sussythingy) and entity.isAlive then
            spawn(function()
                yestwo = RunService.Heartbeat:Connect(function(step)
                    if (not sussythingy) then return end
                    local y = lplr.Character.HumanoidRootPart.Position.y
                    local x = lplr.Character.HumanoidRootPart.Position.x
                    local z = lplr.Character.HumanoidRootPart.Position.z
                    local blockpos = getScaffold((lplr.Character.Head.Position) + Vector3.new(1, -math.floor(lplr.Character.Humanoid.HipHeight * 3), 0) + lplr.Character.Humanoid.MoveDirection)
                    placeblockthing(blockpos, getwool())
                end)
            end)
        else
            yestwo:Disconnect()
        end
    end
  end)

local breakallbedsthing
local BreakAllBed = Private:NewSection("Break All Bed")
BreakAllBed:NewToggle("BreakAllBed", "Bed Everyone Break", function(state)
             local amogusvalue = state
             if amogusvalue then
            pcall(function()
                for i = 1,15 do
                    for i, v in pairs(game.Workspace.Map.Blocks:GetChildren()) do
                        if v.Name == "bed" then
                            game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged[landmineremote]:FireServer({
                                ["invisibleLandmine"] = v                    
                            })
                        end
                    end
                end
            end)
            breakallbedsthing:silentToggle()
        end
     end)

local UI = UI:NewSection("Colors")
for theme, color in pairs(colors) do
	UI:NewColorPicker(theme, "Change your "..theme, color, function(color3)
		kavoUi:ChangeColor(theme, color3)
	end)
end

end)


local TpAura
local tpauralmao
local TpAura = Private:NewSection("TpAura")
TpAura:NewToggle("TpAura", "tp killed", function(state)
	if state then
		TpAura = state
        repeat task.wait() until (matchState == 1)
        secondclonemake()
        if matchState == 1 then
            spawn(function()
                if TpAura and entity.isAlive then
                    if entity.isAlive then
                        repeat
                            wait()
                            if (not TpAura) then return end
                            spawn(function()
                                wait()
                                local mouse = game.Players.LocalPlayer:GetMouse()
                                for i,v in pairs(game.Players:GetChildren()) do
                                    if v.Character and v.Name ~= game.Players.LocalPlayer.Name and v.Character:FindFirstChild("HumanoidRootPart") then
                                        local mag = (v.Character.HumanoidRootPart.Position - clonetwo.HumanoidRootPart.Position).Magnitude
                                        if mag <= 20 and v.Team ~= game.Players.LocalPlayer.Team and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health > 0 then
                                            if v.Character:FindFirstChild("Head") then
                                                game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged[landmineremote]:FireServer({
                                                    ["invisibleLandmine"] = v.Character.Head                                        
                                                })
                                            end
                                        end
                                    end
                                end 
                            end)
                            spawn(function()
                                local plrthing = GetAllNearestHumanoidToPosition(600, 1)
                                for i, plr in pairs(plrthing) do
                                    clonetwo.HumanoidRootPart.CFrame = plr.Character.HumanoidRootPart.CFrame
                                    wait(0.6)
                                    clonetwo.HumanoidRootPart.CFrame = clone.HumanoidRootPart.CFrame
                                    wait(0.6)
                                end
                            end)
                            spawn(function()
                                repeat task.wait() until (matchState == 2)
                                tpauralmao:Toggle()
                            end)
                        until (not TpAura)
                    end
                else
                    clonetwo:remove()
                    return
                end
            end)
        end
    end
end)
