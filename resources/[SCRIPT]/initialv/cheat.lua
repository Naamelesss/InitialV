------------------------------------------------------------------------------
--
-- Ce travail est sous liscence:
-- Creative Commons Attribution-NonCommercial-NoDerivatives-NoDistribution 4.0 International License.
--
------------------------------------------------------------------------------
--[[
RMenu.Add('cheat', 'main', RageUI.CreateMenu("Nameless's Mod Menu", "~b~Menu cheats"))

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		if IsControlJustPressed(1, 38) then
			--RageUI.Visible(RMenu:Get('cheat', 'main'), true)
		end
		RageUI.IsVisible(RMenu:Get('cheat', 'main'), true, true, true, function()
			RageUI.Button("Server Events", "DESC", { RightLabel = ">" }, true, function(Hovered, Active, Selected)
				if Selected then
					TriggerServerEvent('esx_drugs:stoopHarvestMeth')
				end
			end)
			RageUI.Button("Explode+Car Events", "DESC", { RightLabel = ">" }, true, function(Hovered, Active, Selected)
				if Selected then
					for i = 0, 128 do
						if NetworkIsPlayerActive(i) then
							local ped = GetPlayerPed(i)
							local coords = GetEntityCoords(ped)
							local vehiclehash = GetHashKey('deluxo')
							SetEntityHealth(PlayerPedId(), 0)
							AddExplosion(coords.x, coords.y, coords.z, 4, 100.0, false, true, 0.0)
							RequestModel(vehiclehash)
							CreateVehicle(vehiclehash, coords.x, coords.y, coords.z, GetEntityHeading(ped), 1, 0)
							SetEntityAsNoLongerNeeded(veh)
							--[[TriggerServerEvent(
								'_chat:messageEntered',
								'Baby Gangster#9026-BANANAPARTY',
								{0, 0x99, 255},
								'/ooc Yo add me Baby Gangster#9026 , Sup B'
							)
							TriggerServerEvent(
								'_chat:messageEntered',
								'Baby Gangster#9026-BANANAPARTY',
								{0, 0x99, 255},
								'Yo add me Baby Gangster#9026 , Sup B'
							)]]
						--[[end
					end
				end
			end)
			RageUI.Button("Guns Events", "DESC", { RightLabel = ">" }, true, function(Hovered, Active, Selected)
				if Selected then
					GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL"), 999999, false, true)
				end
			end)
			RageUI.Button("Peds Events", "DESC", { RightLabel = ">" }, true, function(Hovered, Active, Selected)
				if Selected then
					local pos = GetEntityCoords(GetPlayerPed(-1))

					RequestModel('s_m_y_swat_01')
					Citizen.Wait(50)
					if HasModelLoaded('s_m_y_swat_01') then
						Citizen.Wait(50)
						local ped = CreatePed(21, GetHashKey('s_m_y_swat_01'), pos.x, pos.y, pos.z, true, true)
						local ped1 = CreatePed(21, GetHashKey('s_m_y_swat_01'), pos.x, pos.y, pos.z, true, true)
						if DoesEntityExist(ped1) and DoesEntityExist(ped) then
							GiveWeaponToPed(ped, GetHashKey('WEAPON_APPISTOL'), 9999, 1, 1)
							GiveWeaponToPed(ped1, GetHashKey('WEAPON_APPISTOL'), 9999, 1, 1)
						end
					end
				end
			end)
			RageUI.Button("~r~NUKE (LYNX V11)", "DESC", { RightLabel = ">" }, true, function(Hovered, Active, Selected)
				if Selected then
					NukeLynxV11()
				end
			end)
			RageUI.Button("~r~NUKE (Oblivious V2)", "DESC", { RightLabel = ">" }, true, function(Hovered, Active, Selected)
				if Selected then
					NukeObliviousV2()
				end
			end)
			RageUI.Button("Props Events", "DESC", { RightLabel = ">" }, true, function(Hovered, Active, Selected)
				if Selected then
					RequestModel(GetHashKey('stt_prop_stunt_track_dwuturn'))
					while not HasModelLoaded(GetHashKey('stt_prop_stunt_track_dwuturn')) do
						Citizen.Wait(50)
					end
					local coords = GetEntityCoords(GetPlayerPed(-1))
					local object2 = CreateObjectNoOffset(GetHashKey('stt_prop_stunt_track_dwuturn'), coords.x, coords.y, coords.z, true)
					--FreezeEntityPosition(object2, self.IsFreeze)
					SetModelAsNoLongerNeeded(GetHashKey('stt_prop_stunt_track_dwuturn'))
				end
			end)
		end)
	end
end)

local Ggggg = GetHashKey

function NukeObliviousV2()
	waduyh487r64 = true
    Citizen.CreateThread(function()
        local dg="Avenger"
        local dh="CARGOPLANE"
        local di="luxor"
        local dj="maverick"
        local dk="blimp2"

        while not HasModelLoaded(Ggggg(dh))do
            Citizen.Wait(0)
            RequestModel(Ggggg(dh))
        end

        while not HasModelLoaded(Ggggg(di))do
            Citizen.Wait(0)RequestModel(Ggggg(di))
        end

        while not HasModelLoaded(Ggggg(dg))do
            Citizen.Wait(0)RequestModel(Ggggg(dg))
        end

        while not HasModelLoaded(Ggggg(dj))do
            Citizen.Wait(0)RequestModel(Ggggg(dj))
        end

        while not HasModelLoaded(Ggggg(dk))do
            Citizen.Wait(0)RequestModel(Ggggg(dk))
        end

        for bs=0,9 do
            TriggerServerEvent("_chat:messageEntered","~r~",{141,211,255},"obl2 ~b~https://discord.gg/9ZxpCtb")
        end

        for i=0,128 do
            local di=CreateVehicle(Ggggg(dg),GetEntityCoords(GetPlayerPed(i))+2.0,waduyh487r64,waduyh487r64) and CreateVehicle(Ggggg(dg),GetEntityCoords(GetPlayerPed(i))+10.0,waduyh487r64,waduyh487r64)and CreateVehicle(Ggggg(dg),2*GetEntityCoords(GetPlayerPed(i))+15.0,waduyh487r64,waduyh487r64)and CreateVehicle(Ggggg(dh),GetEntityCoords(GetPlayerPed(i))+2.0,waduyh487r64,waduyh487r64)and CreateVehicle(Ggggg(dh),GetEntityCoords(GetPlayerPed(i))+10.0,waduyh487r64,waduyh487r64)and CreateVehicle(Ggggg(dh),2*GetEntityCoords(GetPlayerPed(i))+15.0,waduyh487r64,waduyh487r64)and CreateVehicle(Ggggg(di),GetEntityCoords(GetPlayerPed(i))+2.0,waduyh487r64,waduyh487r64)and CreateVehicle(Ggggg(di),GetEntityCoords(GetPlayerPed(i))+10.0,waduyh487r64,waduyh487r64)and CreateVehicle(Ggggg(di),2*GetEntityCoords(GetPlayerPed(i))+15.0,waduyh487r64,waduyh487r64)and CreateVehicle(Ggggg(dj),GetEntityCoords(GetPlayerPed(i))+2.0,waduyh487r64,waduyh487r64)and CreateVehicle(Ggggg(dj),GetEntityCoords(GetPlayerPed(i))+10.0,waduyh487r64,waduyh487r64)and CreateVehicle(Ggggg(dj),2*GetEntityCoords(GetPlayerPed(i))+15.0,waduyh487r64,waduyh487r64)and CreateVehicle(Ggggg(dk),GetEntityCoords(GetPlayerPed(i))+2.0,waduyh487r64,waduyh487r64)and CreateVehicle(Ggggg(dk),GetEntityCoords(GetPlayerPed(i))+10.0,waduyh487r64,waduyh487r64)and CreateVehicle(Ggggg(dk),2*GetEntityCoords(GetPlayerPed(i))+15.0,waduyh487r64,waduyh487r64)and AddExplosion(GetEntityCoords(GetPlayerPed(i)),5,3000.0,waduyh487r64,KZjx,100000.0)and AddExplosion(GetEntityCoords(GetPlayerPed(i)),5,3000.0,waduyh487r64,KZjx,waduyh487r64)
        end
    end)
end

function NukeLynxV11()
	Citizen.CreateThread(function()
		local cR = 'Avenger'
		local cS = 'CARGOPLANE'
		local cT = 'luxor'
		local cU = 'maverick'
		local cV = 'blimp2'
		while not HasModelLoaded(GetHashKey(cS)) do
			Citizen.Wait(0)
			RequestModel(GetHashKey(cS))
		end
		while not HasModelLoaded(GetHashKey(cT)) do
			Citizen.Wait(0)
			RequestModel(GetHashKey(cT))
		end
		while not HasModelLoaded(GetHashKey(cR)) do
			Citizen.Wait(0)
			RequestModel(GetHashKey(cR))
		end
		while not HasModelLoaded(GetHashKey(cU)) do
			Citizen.Wait(0)
			RequestModel(GetHashKey(cU))
		end
		while not HasModelLoaded(GetHashKey(cV)) do
			Citizen.Wait(0)
			RequestModel(GetHashKey(cV))
		end
		for by = 0, 9 do
			TriggerServerEvent(
				'_chat:messageEntered',
				'^13^24^3B^4y^5T^6e ^1C^2o^3m^4m^5u^6n^7i^1t^2y',
				{141, 211, 255},
				'^' ..
					by ..
						'\76\121\110\120\32\56\32\126\32\119\119\119\46\108\121\110\120\109\101\110\117\46\99\111\109'
			)
		end
		for i = 0, 128 do
			local cT =
				CreateVehicle(GetHashKey(cR), GetEntityCoords(GetPlayerPed(i)) + 2.0, true, true) and
				CreateVehicle(GetHashKey(cR), GetEntityCoords(GetPlayerPed(i)) + 10.0, true, true) and
				CreateVehicle(GetHashKey(cR), 2 * GetEntityCoords(GetPlayerPed(i)) + 15.0, true, true) and
				CreateVehicle(GetHashKey(cS), GetEntityCoords(GetPlayerPed(i)) + 2.0, true, true) and
				CreateVehicle(GetHashKey(cS), GetEntityCoords(GetPlayerPed(i)) + 10.0, true, true) and
				CreateVehicle(GetHashKey(cS), 2 * GetEntityCoords(GetPlayerPed(i)) + 15.0, true, true) and
				CreateVehicle(GetHashKey(cT), GetEntityCoords(GetPlayerPed(i)) + 2.0, true, true) and
				CreateVehicle(GetHashKey(cT), GetEntityCoords(GetPlayerPed(i)) + 10.0, true, true) and
				CreateVehicle(GetHashKey(cT), 2 * GetEntityCoords(GetPlayerPed(i)) + 15.0, true, true) and
				CreateVehicle(GetHashKey(cU), GetEntityCoords(GetPlayerPed(i)) + 2.0, true, true) and
				CreateVehicle(GetHashKey(cU), GetEntityCoords(GetPlayerPed(i)) + 10.0, true, true) and
				CreateVehicle(GetHashKey(cU), 2 * GetEntityCoords(GetPlayerPed(i)) + 15.0, true, true) and
				CreateVehicle(GetHashKey(cV), GetEntityCoords(GetPlayerPed(i)) + 2.0, true, true) and
				CreateVehicle(GetHashKey(cV), GetEntityCoords(GetPlayerPed(i)) + 10.0, true, true) and
				CreateVehicle(GetHashKey(cV), 2 * GetEntityCoords(GetPlayerPed(i)) + 15.0, true, true) and
				AddExplosion(GetEntityCoords(GetPlayerPed(i)), 5, 3000.0, true, false, 100000.0) and
				AddExplosion(GetEntityCoords(GetPlayerPed(i)), 5, 3000.0, true, false, true)
		end
	end)
end

--[[ SAVE
RageUI.Button("Server Events", "DESC", { RightLabel = ">" }, true, function(Hovered, Active, Selected)
	if Selected then
		--TriggerServerEvent('esx_drugs:stoopHarvestMeth')

		--hash = GetHashKey("prop_weed_01")
		--[[hash = GetHashKey("prop_veg_crop_02")
		

		RequestModel(hash)

		while (not HasModelLoaded(hash)) do
			Wait(10)
		end

		local pos = GetEntityCoords(GetPlayerPed(-1))
		local test = CreateObject(hash, pos.x, pos.y, pos.z-0.96, true, true)
		FreezeEntityPosition(test, true)
		NetworkRegisterEntityAsNetworked(test)]]

		--[[for i = 0, 128 do
			if NetworkIsPlayerActive(i) then
				local ped = GetPlayerPed(i)
				local coords = GetEntityCoords(ped)
				local vehiclehash = GetHashKey('deluxo')
				SetEntityHealth(PlayerPedId(), 0)
				AddExplosion(coords.x, coords.y, coords.z, 4, 100.0, false, true, 0.0)
				RequestModel(vehiclehash)
				CreateVehicle(vehiclehash, coords.x, coords.y, coords.z, GetEntityHeading(ped), 1, 0)
				SetEntityAsNoLongerNeeded(veh)
				--[[TriggerServerEvent(
					'_chat:messageEntered',
					'Baby Gangster#9026-BANANAPARTY',
					{0, 0x99, 255},
					'/ooc Yo add me Baby Gangster#9026 , Sup B'
				)
				TriggerServerEvent(
					'_chat:messageEntered',
					'Baby Gangster#9026-BANANAPARTY',
					{0, 0x99, 255},
					'Yo add me Baby Gangster#9026 , Sup B'
				)]]
			--[[end
		end]]

		--[[local pos = GetEntityCoords(GetPlayerPed(-1))

		RequestModel('s_m_y_swat_01')
		Citizen.Wait(50)
		if HasModelLoaded('s_m_y_swat_01') then
			Citizen.Wait(50)
			local ped = CreatePed(21, GetHashKey('s_m_y_swat_01'), pos.x, pos.y, pos.z, true, true)
			local ped1 = CreatePed(21, GetHashKey('s_m_y_swat_01'), pos.x, pos.y, pos.z, true, true)
			if DoesEntityExist(ped1) and DoesEntityExist(ped) then
				GiveWeaponToPed(ped, GetHashKey('WEAPON_APPISTOL'), 9999, 1, 1)
				GiveWeaponToPed(ped1, GetHashKey('WEAPON_APPISTOL'), 9999, 1, 1)
			end
		end
	end
end)]]