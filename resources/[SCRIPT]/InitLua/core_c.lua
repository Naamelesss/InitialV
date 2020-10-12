------------------------------------------------------------------------------
--
-- Ce travail est sous liscence:
-- Creative Commons Attribution-NonCommercial-NoDerivatives-NoDistribution 4.0 International License.
--
------------------------------------------------------------------------------

-- RICH PRESENCE

Citizen.CreateThread(function()
    local PlayerIdP = GetPlayerServerId(PlayerId())
    while true do
        players = {}
        for _,player in ipairs(GetActivePlayers()) do 
            table.insert(players, player)
        end
        Citizen.InvokeNative(GetHashKey("ADD_TEXT_ENTRY"), 'FE_THDR_GTAO', '~r~InitialV WL~t~| ~w~Discord : eWHqM23~t~ | ~r~ID: ' .. PlayerIdP .. " ~t~| ~w  ~Joueurs: " .. #players .. "/300 ~t~")
        SetRichPresence(GetPlayerName(PlayerId()) .. " - ".. #players .. "/300")
        SetDiscordAppId(735513520300621855)
        SetDiscordRichPresenceAsset('initialv')
        SetDiscordRichPresenceAssetText('Initial V')
        SetDiscordRichPresenceAssetSmall('discord')
        SetDiscordRichPresenceAssetSmallText('discord.gg/eWHqM23')
        AddTextEntry('PM_PANE_LEAVE', '~r~Retourner sur la liste des serveurs.');
        AddTextEntry('PM_PANE_QUIT', '~r~Quitter FiveM');
        AddTextEntry('PM_SCR_MAP', '~w~Carte de Los Santos')
        AddTextEntry('PM_SCR_GAM', '~r~Prendre l\'avion')
        AddTextEntry('PM_SCR_INF', '~w~Logs')
        AddTextEntry('PM_SCR_STA', '~r~Statistiques')
        AddTextEntry('PM_SCR_SET', '~w~Paramètres')
        AddTextEntry('PM_SCR_GAL', '~r~Galerie')
        AddTextEntry('PM_SCR_RPL', '~w~Éditeur ∑')
        
        AddTextEntry('PM_PANE_KEYS', '~r~Configuration des touches')
        AddTextEntry('PM_PANE_AUD', 'Audio et son')
        AddTextEntry('PM_PANE_GTAO', 'GTA 5 Online')
        AddTextEntry('PM_PANE_CFX', 'Initial~r~ V')

        Citizen.Wait(60000)
    end
end)

-- ON JOIN
local iSPlayerLoaded = false
local iSJoined = false
local isFirstJoin = false
local spawnPosition

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        TriggerEvent('InitialCore:LoadupScreenC')
        TriggerServerEvent('InitialCoreS:OnPlayerJoin')
        TriggerEvent('InitialCoreC:OnPlayerJoin')
        DisplayRadar(false)
        AdvancedNotif('Initial V', '~r~Synchronisation', 'Chargement de votre personnage.', 'CHAR_WE', 'INITIALV')
        --TriggerServerEvent('InitialSkin:LoadSkin')
        --TriggerServerEvent('InitialCore:LoadStatusInfoS')
        LoadingPlayer()
        NetworkSetFriendlyFireOption(true)
        SetCanAttackFriendly(PlayerPedId(), true, true)
        break
    end
end)

RegisterNetEvent('InitialCore:InfoCallback')
AddEventHandler('InitialCore:InfoCallback', function(spawnPosition2)
    if spawnPosition2 then
        spawnPosition = spawnPosition2
    else
        isFirstJoin = true
    end
    iSPlayerLoaded = true
end)

local function TransCam()
	while not iSPlayerLoaded do
		Citizen.Wait(10000)
		val1 = math.random(-1500, 500) + 0.5
		val2 = math.random(-1500, 500) + 0.5
		val3 = math.random(359) + 0.5
		DoScreenFadeOut(500)
		Wait(500)
		SetCamCoord(cam, val1, val2, 235.0)
		SetCamRot(cam, -10.0, 0.0, val3, 2)
		SetCamFov(cam, 90.0)
		Wait(100)
		DoScreenFadeIn(500)
	end
end

AddEventHandler('InitialCore:LoadupScreenC', function()
	cam = CreateCam("DEFAULT_SCRIPTED_FLY_CAMERA", true)
	PlaySoundFrontend(-1, "CHARACTER_SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", false)		
	SetCamActive(cam, true)
	FreezeEntityPosition(PlayerPedId(), true)
	SetEntityVisible(GetPlayerPed(-1), false, 0)
	DisplayRadar(false)
	val1 = math.random(-1500, 500) + 0.5
	val2 = math.random(-1500, 500) + 0.5
	val3 = math.random(359) + 0.5
	DoScreenFadeOut(500)
	Wait(500)
	RenderScriptCams(true, true, 50, true, true)		
	SetCamCoord(cam, val1, val2, 235.0)
	SetCamRot(cam, -10.0, 0.0, val3, 2)
	SetCamFov(cam, 90.0)
	Wait(100)
	DoScreenFadeIn(500)

	TriggerEvent('InitialCore:LoadupScreen2C')
	TransCam()
end)

AddEventHandler('InitialCore:LoadupScreen2C', function()
    while not iSPlayerLoaded and not NetworkIsSessionActive() do
		Wait(0)
        DrawTextOnScreen(0.85, 0.55, 1.0, 1.0, 0.6, "Chargement de votre personnage...", 255, 255, 255, 255, false)
    end
    if not isFirstJoin then
        while not iSJoined do
            Citizen.Wait(0)
            DrawTextOnScreen(0.80, 0.55, 1.0, 1.0, 0.6, "Appuyez sur ~g~ESPACE~w~ pour valider votre entrée", 255, 255, 255, 255, false)
            if IsControlJustPressed(0, 76) then
                if DoesCamExist(cam) then
                    SetCamActive(cam, false)
                    DoScreenFadeOut(1000)
                    Wait(1000)
                    FreezeEntityPosition(PlayerPedId(), false)
                    SetEntityVisible(GetPlayerPed(-1), true, 0)
  --                  Wait(500)
                    RenderScriptCams(false, true, 50, true, true)
                    LoadSkinAfterEsp()
            --		DisplayRadar(true)
                    cam = nil
                    iSJoined = true	
                    print('end')			
                end
                SetEntityCoords(GetPlayerPed(-1), spawnPosition.x, spawnPosition.y, spawnPosition.z)
            end
        end
    else
        if DoesCamExist(cam) then
            SetCamActive(cam, false)
            DoScreenFadeOut(500)
            FreezeEntityPosition(PlayerPedId(), false)
            SetEntityVisible(GetPlayerPed(-1), true, 0)
            Wait(500)
            RenderScriptCams(false, true, 50, true, true)
            DoScreenFadeIn(500)
    --		DisplayRadar(true)
            cam = nil
            iSJoined = true				
        end
    end
end)

-- ajout chaques 30s
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(30000)
        N_0xf4f2c0d4ee209e20() -- Disable the pedestrian idle camera
        N_0x9e4cfff989258472() -- Disable the vehicle idle camera
    end
end)

-- PARAMETRE PLAYER

SetIgnoreLowPriorityShockingEvents(PlayerId(), true)
SetPlayerCanBeHassledByGangs(PlayerId(), false) 
SetPoliceIgnorePlayer(PlayerId(), true)
SetEveryoneIgnorePlayer(PlayerId(), true)
SetRelationshipBetweenGroups(1, GetHashKey("AMBIENT_GANG_HILLBILLY"), GetHashKey('PLAYER'))
SetRelationshipBetweenGroups(1, GetHashKey("AMBIENT_GANG_BALLAS"), GetHashKey('PLAYER'))
SetRelationshipBetweenGroups(1, GetHashKey("AMBIENT_GANG_MEXICAN"), GetHashKey('PLAYER'))
SetRelationshipBetweenGroups(1, GetHashKey("AMBIENT_GANG_FAMILY"), GetHashKey('PLAYER'))
SetRelationshipBetweenGroups(1, GetHashKey("AMBIENT_GANG_MARABUNTE"), GetHashKey('PLAYER'))
SetRelationshipBetweenGroups(1, GetHashKey("AMBIENT_GANG_SALVA"), GetHashKey('PLAYER'))
SetRelationshipBetweenGroups(1, GetHashKey("GANG_1"), GetHashKey('PLAYER'))
SetRelationshipBetweenGroups(1, GetHashKey("GANG_2"), GetHashKey('PLAYER'))
SetRelationshipBetweenGroups(1, GetHashKey("GANG_9"), GetHashKey('PLAYER'))
SetRelationshipBetweenGroups(1, GetHashKey("GANG_10"), GetHashKey('PLAYER'))
SetRelationshipBetweenGroups(1, GetHashKey("FIREMAN"), GetHashKey('PLAYER'))

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        SetPedConfigFlag(PlayerPedId(), 35, false) -- Enleve le port du casque obligé sur une moto 
        CancelCurrentPoliceReport()
        DisableControlAction(0, 37, true) -- weapon wheel
        HideHudComponentThisFrame(19) -- weapon wheel
        HideHudComponentThisFrame(20) -- weapon wheel
        DisablePlayerVehicleRewards(PlayerId())
        SetPlayerHealthRechargeMultiplier(PlayerId(), 0.0)      
        StartAudioScene("CHARACTER_CHANGE_IN_SKY_SCENE")
        local playerPed = GetPlayerPed(-1)
        local playerLocalisation = GetEntityCoords(playerPed)
        ClearAreaOfCops(playerLocalisation.x, playerLocalisation.y, playerLocalisation.z, 50.0)
        if GetPlayerWantedLevel(PlayerId()) ~= 0 then
            SetPlayerWantedLevel(PlayerId(), 0, false)
            SetPlayerWantedLevelNow(PlayerId(), false)
        end
        if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), 1856.10,3679.10,33.7, true ) < 90 then
            ClearAreaOfPeds(1856.10,3679.10,33.7, 58.0, 0)
        end
        local ped = GetPlayerPed(-1)
        local veh = GetVehiclePedIsIn(ped, false)
        if GetVehicleClass(veh) == 17 then -- police boost
            SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(ped, false), 42.0)                             
        end
        if IsPedInAnyVehicle(PlayerPedId(), false) then
            if GetVehicleEngineHealth(GetVehiclePedIsIn(ped, false)) < 800 then
                SetVehicleEngineHealth(GetVehiclePedIsIn(ped, false), 0)
            end
        end
        for i = 1, 12 do
			EnableDispatchService(i, false)
        end
        RemoveAllPickupsOfType(0xDF711959) -- carbine rifle DROP
        RemoveAllPickupsOfType(0xF9AFB48F) -- pistol DROP
        RemoveAllPickupsOfType(0xA9355DCD) -- pumpshotgun DROP
        if IsControlJustPressed(1, 200) then
            TriggerEvent('InitialCore:SavePlayer')
        end
        if IsControlJustPressed(1, 169) then
            TriggerEvent('InitialCore:SavePlayer')
        end
    end
end)

AddEventHandler('onClientMapStart', function()    
    exports.spawnmanager:spawnPlayer()
    Wait(3000)
    exports.spawnmanager:setAutoSpawn(false)
end)

-- CHARGEMENT PERSO

function LoadingPlayer()
    TriggerServerEvent('InitialCore:LoadPlayer')
end

RegisterNetEvent('InitialCore:LoadPlayerClient')
AddEventHandler('InitialCore:LoadPlayerClient', function(PlayerMoney, PlayerLife)
    print("Chargement personnage (argent) : " .. PlayerMoney .. "$")
    print("Chargement personnage (vie) : " .. PlayerLife)
    --print("Chargement personnage (position) : " .. PlayerPos.x .. PlayerPos.y .. PlayerPos.z)
    Wait(500)
    StatSetInt("MP0_WALLET_BALANCE", PlayerMoney, true)
    Wait(500)
    SetEntityHealth(GetPlayerPed(-1), PlayerLife)
    --SetEntityCoords(GetPlayerPed(-1), PlayerPos.x, PlayerPos.y, PlayerPos.z)
end)

-- SYNCHRO

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(60000)
        TriggerEvent('InitialCore:SavePlayer')
    end
end)

RegisterNetEvent('InitialCore:SavePlayer')
AddEventHandler('InitialCore:SavePlayer', function()
    local PlyCoords = GetEntityCoords(GetPlayerPed(-1), true)
    local PlyCoordsTable = {}
    PlyCoordsTable.x = PlyCoords.x
    PlyCoordsTable.y = PlyCoords.y
    PlyCoordsTable.z = PlyCoords.z
    --local ret, PlayerMoney = StatGetInt("MP0_WALLET_BALANCE", -1)
    local PlayerLife = GetEntityHealth(GetPlayerPed(-1))
    TriggerServerEvent('InitialCore:SavePlayerServer', PlayerLife, json.encode(PlyCoordsTable))
end)

-- TEST

--Citizen.CreateThread(function()
--    while true do
--        Citizen.Wait(100)
--        StatSetInt("BANK_BALANCE", 50500, true);
--        money, money2 = StatGetInt("MP0_WALLET_BALANCE", -1)
--        money2 = money2+100
--        StatSetInt("MP0_WALLET_BALANCE", money2, true)
--        PlaySound(-1, "LOCAL_PLYR_CASH_COUNTER_INCREASE", "DLC_HEISTS_GENERAL_FRONTEND_SOUNDS", 0, 0, 1)
--   end
--end)

--[[
Citizen.CreateThread(function()
    while true do
        StatSetInt("MP0_STRENGTH", 1, true)
        print(StatGetInt("MP0_STRENGTH", -1))
        SetEntityCoords(GetPlayerPed(-1), 287.509, -919.824, 28.266)

        money, money2 = StatGetInt("MP0_WALLET_BALANCE", -1)
        Citizen.Wait(5000)
        print(money)
        print(money2)
        money2 = money2+100
        --print(GetPedMoney(GetPlayerPed(-1)))
        --SetPedMoney(GetPlayerPed(-1), money2)
        StatSetInt("MP0_WALLET_BALANCE", money2, true)
        break
    end
end)]]