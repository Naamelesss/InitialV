------------------------------------------------------------------------------
--
-- Ce travail est sous liscence:
-- Creative Commons Attribution-NonCommercial-NoDerivatives-NoDistribution 4.0 International License.
--
------------------------------------------------------------------------------

local CanCancelEmote = true

-- Server Callback

ServerCallbacks = {}

CurrentRequestId = 0

TriggerServerCallback = function(name, cb, ...)
    ServerCallbacks[CurrentRequestId] = cb
    TriggerServerEvent('trigger_server_callback', name, CurrentRequestId, ...)
    if CurrentRequestId < 65535 then
        CurrentRequestId = CurrentRequestId + 1
    else
        CurrentRequestId = 0
    end
end

RegisterNetEvent('server_callback')
AddEventHandler('server_callback', function(requestId, ...)
    if ServerCallbacks[requestId] then
        ServerCallbacks[requestId](...)
    end
    ServerCallbacks[requestId] = nil
end)

-- Advanced Notif

function AdvancedNotif(title, subtitle, msg, img1, img2)
    SetNotificationTextEntry("STRING")
    AddTextComponentSubstringPlayerName(msg)
    SetNotificationMessage(img1, img2, true, 0, title, subtitle)
    DrawNotification(false, true)
end

RegisterNetEvent('InitialCore:AdvancedNotif')
AddEventHandler('InitialCore:AdvancedNotif', function(title, subtitle, msg, img1, img2)
    SetNotificationTextEntry("STRING")
    AddTextComponentSubstringPlayerName(msg)
    SetNotificationMessage(img1, img2, true, 0, title, subtitle)
    DrawNotification(false, true)
end)

-- Help Notification

function HelpNotif(msg)
    AddTextEntry('InitialCoreHelpNotification', msg)
	BeginTextCommandDisplayHelp('InitialCoreHelpNotification')
    EndTextCommandDisplayHelp(0, false, true, -1)
end

-- TEXT ON SCREEN

function DrawTextOnScreen(x, y, width, height, scale, text, r, g, b, a, outline)
    SetTextFont(0)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    if outline then
	    SetTextOutline()
	end
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/2, y - height/2 + 0.005)
end

-- FREEMODE MESSAGE

RegisterNetEvent('InitialCore:ScaleformNotif')
AddEventHandler('InitialCore:ScaleformNotif', function(title, msg, sec)
	local scaleform = ScaleformRequest('MP_BIG_MESSAGE_FREEMODE')

	BeginScaleformMovieMethod(scaleform, 'SHOW_SHARD_WASTED_MP_MESSAGE')
	PushScaleformMovieMethodParameterString(title)
	PushScaleformMovieMethodParameterString(msg)
	EndScaleformMovieMethod()

	while sec > 0 do
		Citizen.Wait(1)
		sec = sec - 0.01

		DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255)
	end

	SetScaleformMovieAsNoLongerNeeded(scaleform)
end)

function ScaleformRequest(movie)
	local scaleform = RequestScaleformMovie(movie)
	while not HasScaleformMovieLoaded(scaleform) do
		Citizen.Wait(0)
	end
	return scaleform
end

-- LOADING MESSAGE

function LoadingScreenMessage(message, time)
    AddTextEntry("CUSTOMLOADSTR", message)
    BeginTextCommandBusyspinnerOn("CUSTOMLOADSTR")
    EndTextCommandBusyspinnerOn(5)
    Wait(time)
    BusyspinnerOff()
end

-- PLAYER FUNC

RegisterNetEvent('InitialCore:ModifArgent')
AddEventHandler('InitialCore:ModifArgent', function(montantmodif)
	StatSetInt("MP0_WALLET_BALANCE", montantmodif, true)
	PlaySoundFrontend(-1, "LOCAL_PLYR_CASH_COUNTER_COMPLETE", "DLC_HEISTS_GENERAL_FRONTEND_SOUNDS", 0)
    print("(Argent recu) Liquide actuelle : " .. montantmodif)
end)

-- GET CLOSEST PLAYER

GetClosestPlayer = function(coords)
	local players, closestDistance, closestPlayer = GetPlayers(), -1, -1
	local coords, usePlayerPed = coords, false
	local playerPed, playerId = PlayerPedId(), PlayerId()

	if coords then
		coords = vector3(coords.x, coords.y, coords.z)
	else
		usePlayerPed = true
		coords = GetEntityCoords(playerPed)
	end

	for i=1, #players, 1 do
		local target = GetPlayerPed(players[i])

		if not usePlayerPed or (usePlayerPed and players[i] ~= playerId) then
			local targetCoords = GetEntityCoords(target)
			local distance = #(coords - targetCoords)

			if closestDistance == -1 or closestDistance > distance then
				closestPlayer = players[i]
				closestDistance = distance
			end
		end
	end

	return closestPlayer, closestDistance
end

GetPlayers = function()
    local players = {}

    for _,player in ipairs(GetActivePlayers()) do
        local ped = GetPlayerPed(player)

        if DoesEntityExist(ped) then
            table.insert(players, player)
        end
    end

    return players
end


GetPlayersInArea = function(coords, area)
	local players, playersInArea = GetPlayers(), {}
	coords = vector3(coords.x, coords.y, coords.z)

	for i=1, #players, 1 do
		local target = GetPlayerPed(players[i])
		local targetCoords = GetEntityCoords(target)

		if #(coords - targetCoords) <= area then
			table.insert(playersInArea, players[i])
		end
	end

	return playersInArea
end

GetPedsInArea = function(coords, area)
	local TableP = {}
    local TableID = 1
    local handle, ped = FindFirstPed()
        repeat
            TableP[TableID] = ped
            TableID = TableID+1
            success, ped = FindNextPed(handle)
        until not success
        EndFindPed(handle)

    return TableP
end

GetVehicleInArea = function(coords, area)
    local TableC = {}
    local TableID = 1
    local handle, veh = FindFirstVehicle()
        repeat
            TableC[TableID] = veh
            TableID = TableID+1
            success, veh = FindNextVehicle(handle)
        until not success
        EndFindVehicle(handle)

    return TableC
	--[[local players, playersInArea = GetPlayers(), {}
	coords = vector3(coords.x, coords.y, coords.z)

	for i=1, #players, 1 do
		local target = GetPlayerPed(players[i])
		local targetCoords = GetEntityCoords(target)

		if #(coords - targetCoords) <= area then
			table.insert(playersInArea, players[i])
		end
	end

	return playersInArea]]
end

KeyboardInput = function(inputText, maxLength)
    AddTextEntry('FMMC_KEY_TIP12', "")
    DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP12", "", inputText, "", "", "", maxLength)
    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
        Citizen.Wait(0)
    end
    if UpdateOnscreenKeyboard() ~= 2 then
        result = GetOnscreenKeyboardResult()
        Citizen.Wait(500)
        return result
    else
        Citizen.Wait(500)
        return nil
    end
end

function ToggleCancelEmote(toggle)
    CanCancelEmote = toggle
end

RegisterCommand('+cancelemote', function()
    print(CanCancelEmote)
    if CanCancelEmote then
	    if not IsPedGettingIntoAVehicle(GetPlayerPed(-1)) and not IsPedJumping(GetPlayerPed(-1)) then
            ClearPedTasks(GetPlayerPed(-1))
            print('clear task')
        end
    end
end, false)

RegisterCommand('-cancelemote', function()    
end, false)

RegisterKeyMapping('+cancelemote', 'Annuler l\'emote en cours', 'keyboard', 'X')

function SetVehicleCustom(vehicle, custom)
    if DoesEntityExist(vehicle) then
		local colorPrimary, colorSecondary = GetVehicleColours(vehicle)
		local pearlescentColor, wheelColor = GetVehicleExtraColours(vehicle)
        SetVehicleModKit(vehicle, 0)

        if custom.Plaque              then SetVehicleNumberPlateText(vehicle, custom.Plaque) end
        if custom.PlaqueColor         then SetVehicleNumberPlateTextIndex(vehicle, custom.PlaqueColor) end
        if custom.BodyHealth          then SetVehicleBodyHealth(vehicle, custom.BodyHealth + 0.0) end
        if custom.EngineHealth        then SetVehicleEngineHealth(vehicle, custom.EngineHealth + 0.0) end
        if custom.Essence             then SetVehicleFuelLevel(vehicle, custom.Essence + 0.0) end
        if custom.Salete              then SetVehicleDirtLevel(vehicle, custom.Salete + 0.0) end
        if custom.Couleur1            then SetVehicleColours(vehicle, custom.Couleur1, colorSecondary) end
        if custom.Couleur2            then SetVehicleColours(vehicle, custom.Couleur1 or colorPrimary, custom.Couleur2) end
        if custom.Nacree              then SetVehicleExtraColours(vehicle, custom.Nacree, wheelColor) end
        if custom.RouesColor          then SetVehicleExtraColours(vehicle, custom.Nacree or pearlescentColor, custom.RouesColor) end
        if custom.Roues               then SetVehicleWheelType(vehicle, custom.Roues) end
        if custom.FenetreTeint        then SetVehicleWindowTint(vehicle, custom.FenetreTeint) end

        if custom.NeonActive then
            SetVehicleNeonLightEnabled(vehicle, 0, custom.NeonActive[1])
            SetVehicleNeonLightEnabled(vehicle, 1, custom.NeonActive[2])
            SetVehicleNeonLightEnabled(vehicle, 2, custom.NeonActive[3])
            SetVehicleNeonLightEnabled(vehicle, 3, custom.NeonActive[4])
        end

        if custom.Extras then
            for extraId, enabled in pairs(custom.Extras) do
                if enabled then
                    SetVehicleExtra(vehicle, tonumber(extraId), 0)
                else
                    SetVehicleExtra(vehicle, tonumber(extraId), 1)
                end
            end
        end

        if custom.NeonColor          then SetVehicleNeonLightsColour(vehicle, custom.NeonColor[1], custom.NeonColor[2], custom.NeonColor[3]) end
        if custom.XenonColor         then SetVehicleXenonLightsColour(vehicle, custom.XenonColor) end -- ##
        if custom.modSmokeEnabled    then ToggleVehicleMod(vehicle, 20, true) end
        if custom.tyreSmokeColor     then SetVehicleTyreSmokeColor(vehicle, custom.tyreSmokeColor[1], custom.tyreSmokeColor[2], custom.tyreSmokeColor[3]) end
        if custom.modSpoilers        then SetVehicleMod(vehicle, 0, custom.modSpoilers, false) end
        if custom.modFrontBumper     then SetVehicleMod(vehicle, 1, custom.modFrontBumper, false) end
        if custom.modRearBumper      then SetVehicleMod(vehicle, 2, custom.modRearBumper, false) end
        if custom.modSideSkirt       then SetVehicleMod(vehicle, 3, custom.modSideSkirt, false) end
        if custom.modExhaust         then SetVehicleMod(vehicle, 4, custom.modExhaust, false) end
        if custom.modFrame           then SetVehicleMod(vehicle, 5, custom.modFrame, false) end
        if custom.modGrille          then SetVehicleMod(vehicle, 6, custom.modGrille, false) end
        if custom.modHood            then SetVehicleMod(vehicle, 7, custom.modHood, false) end
        if custom.modFender          then SetVehicleMod(vehicle, 8, custom.modFender, false) end
        if custom.modRightFender     then SetVehicleMod(vehicle, 9, custom.modRightFender, false) end
        if custom.modRoof            then SetVehicleMod(vehicle, 10, custom.modRoof, false) end
        if custom.Moteur             then SetVehicleMod(vehicle, 11, custom.Moteur, false) end
        if custom.modBrakes          then SetVehicleMod(vehicle, 12, custom.modBrakes, false) end
        if custom.Transmission       then SetVehicleMod(vehicle, 13, custom.Transmission, false) end
        if custom.modHorns           then SetVehicleMod(vehicle, 14, custom.modHorns, false) end
        if custom.Suspension         then SetVehicleMod(vehicle, 15, custom.Suspension, false) end
        if custom.modArmor           then SetVehicleMod(vehicle, 16, custom.modArmor, false) end
        if custom.Turbo              then ToggleVehicleMod(vehicle, 18, custom.Turbo) end
        if custom.modXenon           then ToggleVehicleMod(vehicle, 22, custom.modXenon) end
        if custom.modFrontWheels     then SetVehicleMod(vehicle, 23, custom.modFrontWheels, false) end
        if custom.modBackWheels      then SetVehicleMod(vehicle, 24, custom.modBackWheels, false) end
        if custom.modPlateHolder     then SetVehicleMod(vehicle, 25, custom.modPlateHolder, false) end
        if custom.modVanityPlate     then SetVehicleMod(vehicle, 26, custom.modVanityPlate, false) end
        if custom.modTrimA           then SetVehicleMod(vehicle, 27, custom.modTrimA, false) end
        if custom.modOrnaments       then SetVehicleMod(vehicle, 28, custom.modOrnaments, false) end
        if custom.modDashboard       then SetVehicleMod(vehicle, 29, custom.modDashboard, false) end
        if custom.modDial            then SetVehicleMod(vehicle, 30, custom.modDial, false) end
        if custom.modDoorSpeaker     then SetVehicleMod(vehicle, 31, custom.modDoorSpeaker, false) end
        if custom.modSeats           then SetVehicleMod(vehicle, 32, custom.modSeats, false) end
        if custom.modSteeringWheel   then SetVehicleMod(vehicle, 33, custom.modSteeringWheel, false) end
        if custom.modShifterLeavers  then SetVehicleMod(vehicle, 34, custom.modShifterLeavers, false) end
        if custom.modAPlate          then SetVehicleMod(vehicle, 35, custom.modAPlate, false) end
        if custom.modSpeakers        then SetVehicleMod(vehicle, 36, custom.modSpeakers, false) end
        if custom.modTrunk           then SetVehicleMod(vehicle, 37, custom.modTrunk, false) end
        if custom.modHydrolic        then SetVehicleMod(vehicle, 38, custom.modHydrolic, false) end
        if custom.modEngineBlock     then SetVehicleMod(vehicle, 39, custom.modEngineBlock, false) end
        if custom.modAirFilter       then SetVehicleMod(vehicle, 40, custom.modAirFilter, false) end
        if custom.modStruts          then SetVehicleMod(vehicle, 41, custom.modStruts, false) end
        if custom.modArchCover       then SetVehicleMod(vehicle, 42, custom.modArchCover, false) end
        if custom.modAerials         then SetVehicleMod(vehicle, 43, custom.modAerials, false) end
        if custom.modTrimB           then SetVehicleMod(vehicle, 44, custom.modTrimB, false) end
        if custom.modTank            then SetVehicleMod(vehicle, 45, custom.modTank, false) end
        if custom.modWindows         then SetVehicleMod(vehicle, 46, custom.modWindows, false) end

		if custom.modLivery then
			SetVehicleMod(vehicle, 48, custom.modLivery, false)
			SetVehicleLivery(vehicle, custom.modLivery)
		end
    end
end


--[[playtime = 0

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)
        playtime = playtime + 1
    end
end)

function TimeOnServer()
    if playtime > 59 and playtime < 120 then
        TriggerEvent("chat:addMessage", {
            args = {
                "Initial V",
                "Vous avez joué " .. math.floor((playtime/60)+0.5) .. " minute sur le serveur" 
            },
            color = { 255, 0, 0 }
        })
    elseif playtime > 59 then
        TriggerEvent("chat:addMessage", {
            args = {
                "Initial V",
                "Vous avez joué " .. math.floor((playtime/60)+0.5) .. " minutes sur le serveur"
            },
            color = { 255, 0, 0 }
        })
    else
        TriggerEvent("chat:addMessage", {
            args = {
                "Initial V",
                "Vous avez joué " .. playtime .. " secondes sur le serveur"
            },
            color = { 255, 0, 0 }
        })
    end    
end]]