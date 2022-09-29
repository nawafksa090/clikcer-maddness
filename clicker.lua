getgenv().AutoTap = false;
getgenv().AutoRe = false;
getgenv().BuyPets = false;
getgenv().Tp = false;

if game.PlaceId == 5490351219 then

	--b:Label("Pretty Useless NGL",{
	--   TextSize = 25; -- Self Explaining
	--   TextColor = Color3.fromRGB(255,255,255); -- Self Explaining
	--   BgColor = Color3.fromRGB(69,69,69); -- Self Explaining
		
	--}) 

	--b:Slider("Slider",{
		--min = 10; -- min value of the slider
	--  max = 50; -- max value of the slider
	--  precise = true; -- max 2 decimals
	--},function(value)
	--  print(value)
	--end)

	--b:Dropdown("Dropdown",{"A","B","C"},true,function(mob) --true/false, replaces the current title "Dropdown" with the option that t
	--   print(mob)
	--end)

	--b:Bind("Bind",Enum.KeyCode.C,function() --Default bind
	--   print("Yes")
	--end)

	--b:ColorPicker("ColorPicker",Color3.fromRGB(255,0,0),function(color) --Default color
	--  print(color)
	--end)

	--b:Box("Box","number",function(value) -- "number" or "string"
	-- print(value)
	--end)







	function DoTap()
		spawn(function()
			while getgenv().AutoTap do
				local args = {
					[1] = 1
				}

				game:GetService("ReplicatedStorage").Aero.AeroRemoteServices.ClickService.Click:FireServer(unpack(args))
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
	--function PlayerPOS()
		--local Player = game.Players.LocalPlayer
		--if Player.Character then
		--	return Player.Character.HumanoidRootPart.Position;
		--end
	--	return false;
	--end
	function tpTo(PlaceCFrame)
		local Player = game.Players.LocalPlayer
		if Player.Character then
			Player.Character.HumanoidRootPart.CFrame = PlaceCFrame
		end
	end
	function tpWorld(world)
		if game:GetService("Workspace").Worlds:FindFirstChild(world) then
			tpTo(game:GetService("Workspace").Worlds[world].Teleport.CFrame)
		end
	end

	local library = loadstring((game:HttpGet('https://raw.githubusercontent.com/508droid/AikaV3rm-UI-Lib/main/Lib.lua')))()
	local w = library:CreateWindow("farming") -- Creates the window
	local b = w:CreateFolder("Farming") 
	local p = library:CreateWindow("Teleport")
	local q = library:CreateWindow("Eggs")
	local g = library:CreateWindow("About")
	local a = g:CreateFolder("Destroy ui")
	local r = g:CreateFolder("Made by ur_mum")
	local d = q:CreateFolder("Eggs")
	local c = p:CreateFolder("Tp") 

	b:Toggle("Auto Click",function(bool)
		getgenv().AutoTap = bool 
		print("Auto Tap is: ", bool)
		if bool then
			DoTap()
		end
	end)

	d:Toggle("Auto Buy Pets (basic)",function(bool)
		getgenv().BuyPets = bool 
		print("Auto buy pets is: ", bool)
		if bool then
			BuyPets('basic')
		end
	end)

	c:Button("Teleport lava",function()
	tpWorld("Lava")
	end)
	c:Button("Teleport desert",function()
	tpWorld("Desert")
	end)
	c:Button("Teleport ocean",function()
	tpWorld("Ocean")
	end)
	c:Button("Teleport winter",function()
	tpWorld("Winter")
	end)
	c:Button("Teleport toxic",function()
	tpWorld("Toxic")
	end)
	c:Button("Teleport candy",function()
	tpWorld("Candy")
	end)
	c:Button("Teleport forest",function()
	tpWorld("Forest")
	end)
	c:Button("Teleport storm",function()
	tpWorld("Storm")
	end)
	c:Button("Teleport blocks",function()
	tpWorld("Blocks")
	end)
	c:Button("Teleport space",function()
	tpWorld("Space")
	end)
	c:Button("Teleport dominus",function()
	tpWorld("Dominus")
	end)
	c:Button("Teleport infinity",function()
	tpWorld("Infinity")
	end)
	c:Button("Teleport future",function()
	tpWorld("Future")
	end)
	c:Button("Teleport city",function()
	tpWorld("City")
	end)
	c:Button("Teleport moon",function()
	tpWorld("Moon")
	end)
	c:Button("Teleport fire",function()
	tpWorld("Fire")
	end)
	b:Toggle("Auto Rebirth",function(bool)
		getgenv().AutoRe = bool 
		print("Auto Rebirth is: ", bool)
		if bool then
			DoRe(10)
		end
	end)
a:DestroyGui()

else
	print("Error not the right game!")
end
