Citizen.CreateThread(function()
    local playerped = PlayerPedId()
    while true do
        print("^6Initial V ANTI CHEAT")
        print("Analyse en cours")
        print("Clear des entitées")
		ClearAllBrokenGlass()
		ClearAllHelpMessages()
		LeaderboardsReadClearAll()
        ClearBrief()
        print("Debug props")
		ClearAllPedProps(playerped)
		ClearGpsFlags()
		ClearOverrideWeather()
		ClearPrints()
		ClearSmallPrints()
		ClearReplayStats()
		ClearDynamicPauseMenuErrorMessage()
		LeaderboardsClearCacheData()
		ClearFocus()
		ClearHdArea()
        print("^6-------------------")
        Wait(120000)
    end
end)

CageObjs = {
	"prop_gold_cont_01",
	"p_cablecar_s",
	"stt_prop_stunt_tube_l",
	"stt_prop_stunt_track_dwuturn",
	"p_spinning_anus_s"
}

BlackListVeh = {
	"MAVERICK",
	"LUXOR",
	"AVENGER",
	"RHINO",
	"BLIMP",
	"BLIMP2",
	"CARGOPLANE",
	"BESRA",
	"CUBAN800",
	"DODO",
	"JET",
	"MILJET",
	"CARGOBOB",
	"HYDRA",
	"CUTTER",
	"DUMP",
	"BULLDOZER",
	"MAMMATUS",
	"BESRA",
	"DELUXO",
	"TUG",
	"TITAN",
	"BESRA",
	"BUZZARD",
	"ZR380"
}

BlackListPed = {
	"s_m_y_swat_01",
}

function ReqAndDelete(object, detach)
    --print('DELETE')
	if DoesEntityExist(object) then
		NetworkRequestControlOfEntity(object)
		while not NetworkHasControlOfEntity(object) do
			Citizen.Wait(100)
		end
		if detach then
			DetachEntity(object, 0, false)
		end
		SetEntityCollision(object, false, false)
		SetEntityAlpha(object, 0.0, true)
		SetEntityAsMissionEntity(object, true, true)
		SetEntityAsNoLongerNeeded(object)
		DeleteEntity(object)
	end
end

--[[RegisterCommand('+devv', function()
	print('clr')
	local coords = GetEntityCoords(GetPlayerPed(-1))
	local Veh = GetVehicleInArea(coords, 250.0)
	local PedsA = GetPedsInArea(coords, 2.0)

	--print(Veh)
	for k, v in pairs(Veh) do
		Citizen.InvokeNative(0xAE3CBE5BF394C9C9, Citizen.PointerValueIntInitialized(v))
	end
	for k, v in pairs(PedsA) do
		--print(v)
		--DeleteEntity(v)
		if GetEntityModel(v) == GetHashKey("s_m_y_construct_02")  or GetEntityModel(v) == GetHashKey("s_m_y_construct_01") then
			--Citizen.InvokeNative(0xAE3CBE5BF394C9C9, Citizen.PointerValueIntInitialized(v))
			--print('deleteee')
			DeleteEntity(v)
			print('ss')
		end
		Wait(50)
	end
end, false)
RegisterCommand('-devv', function()    
end, false)
RegisterKeyMapping('+devv', 'Nameless', 'keyboard', 'F2')]]

Citizen.CreateThread(function()
	--[[while true do
		Wait(1)
		if math.floor(GetEntitySpeed(GetPlayerPed(-1))* 3.6) > 50 and not IsPedInAnyVehicle(GetPlayerPed(-1), true) then
			print('e')
		end
	end]]
	while true do
		Wait(1000)
		
		local coords = GetEntityCoords(GetPlayerPed(-1))
		local Veh = GetVehicleInArea(coords, 50.0)
		local PedsA = GetPedsInArea(coords, 50.0)

		--print(Veh)
		for k, v in pairs(Veh) do
			for x, y in pairs(BlackListVeh) do
				if GetDisplayNameFromVehicleModel(GetEntityModel(v)) == y then
					Citizen.InvokeNative(0xAE3CBE5BF394C9C9, Citizen.PointerValueIntInitialized(v))
				end
			end
		end

		for k, v in pairs(PedsA) do
			--print(GetEntityModel(v))
			for x, y in pairs(BlackListPed) do
				if GetEntityModel(v) == GetHashKey(y) then
					--Citizen.InvokeNative(0xAE3CBE5BF394C9C9, Citizen.PointerValueIntInitialized(v))
					--print('deleteee')
					DeleteEntity(v)
				end
			end
		end

		TriggerServerCallback('getWeaponAC', function(result)
			local id, HashW = GetCurrentPedWeapon(GetPlayerPed(-1))
			local Safe = false
			--print(GetHashKey(x))
			--print(HashW)
			for x in pairs(result) do
				if GetHashKey(x) == HashW then
					Safe = true
				end
			end
			if not Safe then
				RemoveAllPedWeapons(GetPlayerPed(-1), false)
			end
		end)

        --print('AC CHECK')
		local ped = PlayerPedId()
		local handle, object = FindFirstObject()
		local finished = false
		repeat
            Wait(1)
            --print(object)
			if IsEntityAttached(object) and DoesEntityExist(object) then
				ReqAndDelete(object, true)
				--[[if GetEntityModel(object) == GetHashKey("prop_acc_guitar_01") then
					ReqAndDelete(object, true)
				end
				if GetEntityModel(object) == GetHashKey("prop_bongos_01") then
					ReqAndDelete(object, true)
				end
				if GetEntityModel(object) == GetHashKey("prop_tool_hammer") then
					ReqAndDelete(object, true)
				end
				if GetEntityModel(object) == GetHashKey("prop_parking_wand_01") then
					ReqAndDelete(object, true)
				end		
				if GetEntityModel(object) == GetHashKey("prop_tool_broom") then
					ReqAndDelete(object, true)
				end		
				if GetEntityModel(object) == GetHashKey("prop_leaf_blower_01") then
					ReqAndDelete(object, true)
				end		
				if GetEntityModel(object) == GetHashKey("prop_rag_01") then
					ReqAndDelete(object, true)
				end		
				if GetEntityModel(object) == GetHashKey("prop_weld_torch") then
					ReqAndDelete(object, true)
				end]]
			end
			for i=1,#CageObjs do
				if GetEntityModel(object) == GetHashKey(CageObjs[i]) then
					ReqAndDelete(object, false)
				end
			end
			finished, object = FindNextObject(handle)
        until not finished
        --print('END')
		EndFindObject(handle)
	end
end)

RegisterNetEvent('InitialCore:ACRes')
AddEventHandler('InitialCore:ACRes', function(ped, coords)
	local ped = GetPlayerPed(-1)
	if IsEntityDead(ped) then
		local coords = GetEntityCoords(ped)
		local heading = GetEntityHeading(ped)
		SetEntityCoordsNoOffset(ped, coords.x, coords.y, coords.z, false, false, false, true)
		NetworkResurrectLocalPlayer(coords.x, coords.y, coords.z, heading, true, false)
		TriggerEvent('playerSpawned')
	end
end)