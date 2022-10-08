getgenv().AutoTap = false;
getgenv().AutoRe = false;
getgenv().BuyPets = false;
getgenv().orbs = false;
getgenv().AutoBuyShop = false;
local pass = false
local min = true
local max = false
local playerHead = game.Players.LocalPlayer.Character.Head 
if game.PlaceId == 5490351219 then
	local nukeMod = require(game:GetService("Players").tdmcdskmk.PlayerScripts.Aero.Controllers.BossController)
	local clickMod = require(game:GetService("Players").LocalPlayer.PlayerScripts.Aero.Controllers.UI.Click)
	print("hacks injected if it doesnt work please contact gHoSt FaCe#2856")
	function unlockGamePasses()
		if not pass then
			local pass = true
			local gamepassMod = require(game:GetService("ReplicatedStorage").Aero.Shared.Gamepasses)
			gamepassMod.HasPassOtherwisePrompt = function() return true end
			print("passes unlocked")
		end
	end
	function colectOrbs()
		spawn(function ()
			while getgenv().orbs do
					for i,v in pairs(game:GetService("Workspace").ScriptObjects:GetDescendants()) do
						for i,v in pairs(game:GetService("Workspace").ScriptObjects.VIPPortal:GetDescendants()) do
							if v.Name == "TouchInterest" then
								v.Name = "hell"
							end
						end

						if v.Name == "TouchInterest" and v.Parent then
							firetouchinterest(playerHead, v.Parent, 0)
							wait()
							firetouchinterest(playerHead, v.Parent, 1)
					end		
			end			end		
		end)
	end
	function notHello()
		if not getgenv().orbs then
			for i,v in pairs(game:GetService("Workspace").ScriptObjects.VIPPortal:GetDescendants()) do
				if v.Name == "TouchInterest" then
					v.Name = "hell"
				end
			end
		end
	end


	function AutoBuy(buy)
		while getgenv().AutoBuyShop do 
			local args = {
				[1] = buy
			}
			game:GetService("ReplicatedStorage").Aero.AeroRemoteServices.UpgradeService.BuyUpgrade:FireServer(unpack(args))
			wait()
		end
	end



	function DoTap()
		spawn(function()
			while getgenv().AutoTap do
				clickMod:Click()
				wait()
			end
		end)
	end
	function DoRe(num)
		spawn(function()
			while getgenv().AutoRe do
				local args = {
					[1] = num
				}
				game:GetService("ReplicatedStorage").Aero.AeroRemoteServices.RebirthService.BuyRebirths:FireServer(unpack(args))
				wait()
			end
		end)
	end
	function BuyPets(Type)
		spawn(function()
			while getgenv().BuyPets do
				game:GetService("ReplicatedStorage").Aero.AeroRemoteServices.EggService.Purchase:FireServer(Type)
				wait()
			end
		end)
	end
	function PlayerPOS()
		local Player = game.Players.LocalPlayer
		if Player.Character then
			return Player.Character.HumanoidRootPart.Position;
		end
		return false;
	end
	function tpTo(PlaceCFrame)
		local Player = game.Players.LocalPlayer
		if Player.Character then
			Player.Character.HumanoidRootPart.CFrame = PlaceCFrame
		end
	end
	tpTo(game:GetService("Workspace").Chests.daily1.Root.CFrame)
	function tpWorld(world)
		if game:GetService("Workspace").Worlds:FindFirstChild(world) then
			tpTo(game:GetService("Workspace").Worlds[world].Teleport.CFrame)
		end
	end
	local library = loadstring((game:HttpGet('https://raw.githubusercontent.com/508droid/AikaV3rm-UI-Lib/main/Lib.lua')))()
	local w = library:CreateWindow("Farming") -- Creates the window
	local b = w:CreateFolder("Farming") 
	local p = library:CreateWindow("Teleport")
	local q = library:CreateWindow("Eggs")
	local t = library:CreateWindow("Other")
	local g = library:CreateWindow("About")
	local a = g:CreateFolder("Destroy ui")
	local r = g:CreateFolder("Made by me")
	local cp = t:CreateFolder("Orbs")
	local cc = t:CreateFolder("Unlock Gamepasses")
	local d = q:CreateFolder("Eggs")
	local c = p:CreateFolder("Tp")  
	b:Toggle("Auto Click",function(bool)
		getgenv().AutoTap = bool 
		if bool then
			DoTap()
		end
	end)
	local selEggs;
	d:Dropdown("selected eggs",{"lava","desert","ocean","winter","toxic","candy","forest","storm","blocky","space","dominus","infinity","future","city","moon","fire",},true,function(val) --true/false, replaces the current title "Dropdown" with the option that t
	   selEggs = val;
	end)
	d:Toggle("Auto Buy Pets",function(bool)
		getgenv().BuyPets = bool 
		if bool then
			BuyPets(selEggs)
		end
	end)
	local selUpgrades
	b:Dropdown("selected Upgrades",{"ClickMultiply","CursorDamage","Health","JumpPower","PetStorage","WalkSpeed"},true,function(val) --true/false, replaces the current title "Dropdown" with the option that t
	   selUpgrades = val;
	end)
	b:Toggle("Auto Buy Upgrades",function(bool)
		getgenv().AutoBuyShop = bool 
		if bool then
			AutoBuy(selUpgrades)
		end
	end)
	cp:Toggle("Auto collect orbs",function(bool)
		getgenv().orbs = bool 
		if bool then
			colectOrbs()
		end
		notHello()
	end)
	cc:Button("sum passes will not work",function()
		unlockGamePasses()	
	end)
	local selWorld;
	c:Dropdown("selected Worlds",{"Lava","Desert","Ocean","Winter","Toxic","Candy","Forest","Storm","Blocks","Space","Dominus","Infinity","Future","City","Moon","Fire",},true,function(val) --true/false, replaces the current title "Dropdown" with the option that t
	   selWorld = val;
	end)
	c:Button("Teleport Selected",function()
		if selWorld then
			tpWorld(selWorld)
		end
	end)
	local selRe;
	b:Dropdown("selected Rebirths",{"1","10","100","1000","10000","100000","1000000"},true,function(val) --true/false, replaces the current title "Dropdown" with the option that t
	   selRe = val;
	end)	
	b:Toggle("Selected Rebirth",function(bool)
		getgenv().AutoRe = bool 
		if bool and selRe then
			DoRe(selRe)
		end
	end)
a:DestroyGui()

else
	print("Error not the right game!")
end
