------------------------------------------------------------------------------
--
-- Ce travail est sous liscence:
-- Creative Commons Attribution-NonCommercial-NoDerivatives-NoDistribution 4.0 International License.
--
------------------------------------------------------------------------------

local metier
local niveaumetier
local TimeNotif = 0
local DeadEffect = false
local isRevive = false
local EnService = false

local IsMenuEMSOpened = false

local lib1_char_a, lib2_char_a, lib1_char_b, lib2_char_b, anim_start, anim_pump, anim_success = 'mini@cpr@char_a@cpr_def', 'mini@cpr@char_a@cpr_str', 'mini@cpr@char_b@cpr_def', 'mini@cpr@char_b@cpr_str', 'cpr_intro', 'cpr_pumpchest', 'cpr_success'

local function SetKoPed(Vie)
    --print(HealthVar)
    --DisplayRadar(true)
    DoScreenFadeOut(150)
    Wait(150)
    SetTimecycleModifier("rply_vignette")
    DoScreenFadeIn(150)
    SetPedToRagdoll(GetPlayerPed(-1), 6000, 6000, 0, 0, 0, 0)
    Wait(6000)
    SetEntityHealth(GetPlayerPed(-1), Vie)
    DoScreenFadeOut(150)
    Wait(150)
    ClearTimecycleModifier()
    DoScreenFadeIn(150)
end

Citizen.CreateThread(function()
    RequestAnimDict(lib1_char_a)
    RequestAnimDict(lib2_char_a)
    RequestAnimDict(lib1_char_b)
    RequestAnimDict(lib2_char_b)

    local Blip = AddBlipForCoord(338.9399, -584.85, 28.89)
    SetBlipSprite(Blip, 61)
    SetBlipDisplay(Blip, 4)
    SetBlipScale(Blip, 0.7)
    SetBlipColour(Blip, 27)
    SetBlipAsShortRange(Blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Pillbox Hill - Centre Hospitalier")
    EndTextCommandSetBlipName(Blip)

    --Wait(5000)

    --Sexe = GetPedSkin().Sexe

    --[[local scaleform = RequestScaleformMovie("mp_big_message_freemode")
    while not HasScaleformMovieLoaded(scaleform) do
        Citizen.Wait(0)
    end
    
    BeginScaleformMovieMethod(scaleform, "SHOW_SHARD_WASTED_MP_MESSAGE")
    PushScaleformMovieMethodParameterString("SOME TEXT")
    PushScaleformMovieMethodParameterString("SOME MORE TEXT")
    PushScaleformMovieMethodParameterInt(5)
    EndScaleformMovieMethod()

    while true do
        Citizen.Wait(0)
        DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255)
    end]]

    --locksound = false

    --[[local scaleform = RequestScaleformMovie("mp_big_message_freemode")
    while not HasScaleformMovieLoaded(scaleform) do
        Citizen.Wait(0)
    end
    BeginScaleformMovieMethod(scaleform, "SHOW_SHARD_WASTED_MP_MESSAGE")
    PushScaleformMovieMethodParameterString("EMS")
    PushScaleformMovieMethodParameterString("Vous ete mor")
    PushScaleformMovieMethodParameterInt(5)
    EndScaleformMovieMethod()]]

    --local HealthVar = GetEntityMaxHealth(GetPlayerPed(-1))
    --HealthVar = HealthVar-20

    while true do
        Wait(1)
        --print(GetEntityHealth(GetPlayerPed(-1)))
        --print(IsPedInMeleeCombat(GetPlayerPed(-1)))
        --[[if GetEntityHealth(GetPlayerPed(-1)) < HealthVar then
            if IsPedInMeleeCombat(GetPlayerPed(-1)) then
                SetKoPed()
            end
        end]]

        if IsEntityDead(GetPlayerPed(-1)) or IsPedInMeleeCombat(GetPlayerPed(-1)) then
            if IsPedInMeleeCombat(GetPlayerPed(-1)) then
                --SetEntityInvincible(PlayerPedId(), true)
                local Vie = GetEntityHealth(GetPlayerPed(-1))
                local MaxHealth = GetEntityMaxHealth(GetPlayerPed(-1))
                local Timer = 0
                SetEntityHealth(GetPlayerPed(-1), 200)

                --print('s')
                while Timer < 300 do
                    Wait(1)
                    Timer = Timer+1
                    if GetEntityHealth(GetPlayerPed(-1)) <= MaxHealth-40 then
                    --print(GetEntityHealth(GetPlayerPed(-1)))
                        SetKoPed(Vie)
                        break
                    end
                end
                SetEntityHealth(GetPlayerPed(-1), Vie)
                --SetEntityInvincible(PlayerPedId(), false)

                
            elseif IsEntityDead(GetPlayerPed(-1)) then

                if not DeadEffect then
                    DeadEffect = true
                    PlaySoundFrontend(-1, "Bed", "WastedSounds", 1)
                    --StartScreenEffect("DeathFailOut", 0, 0)
                    ShakeGameplayCam("DEATH_FAIL_IN_EFFECT_SHAKE", 1.0)
                    SetTimecycleModifier("rply_vignette")
                end
                --DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255)
                --[[while not HasScaleformMovieLoaded(scaleform) do
                    scaleform = RequestScaleformMovie("MP_BIG_MESSAGE_FREEMODE")
                    BeginScaleformMovieMethod(scaleform, "SHOW_SHARD_WASTED_MP_MESSAGE")
                    PushScaleformMovieMethodParameterString("SOME TEXT")
                    PushScaleformMovieMethodParameterString("SOME MORE TEXT")
                    PushScaleformMovieMethodParameterInt(5)
                    EndScaleformMovieMethod()
                    Wait(100)
                end
                --[[EndTextComponent()
                PopScaleformMovieFunctionVoid()]]
                --DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255)

                --print('r')

                --[[StartScreenEffect("DeathFailOut", 0, 0)
                if not locksound then
                    PlaySoundFrontend(-1, "Bed", "WastedSounds", 1)
                    locksound = true
                end
                ShakeGameplayCam("DEATH_FAIL_IN_EFFECT_SHAKE", 1.0)
                SetTimecycleModifier("rply_vignette")
                
                

                if HasScaleformMovieLoaded(scaleform) then
                    Citizen.Wait(0)

                    EndTextComponent()
                    PopScaleformMovieFunctionVoid()

                    Citizen.Wait(500)

                    PlaySoundFrontend(-1, "TextHit", "WastedSounds", 1)d
                end
                    
                StopScreenEffect("DeathFailOut")
                locksound = false]]



                if TimeNotif >= 830 then
                    AdvancedNotif('Personnage', 'Côma', 'Appuyez sur [E] pour appeler les LSMC', 'CHAR_WE', 'LSMC')
                    TimeNotif = 0
                else
                    TimeNotif = TimeNotif+1
                end
                if IsControlJustPressed(1, 38) then
                    isRevive = false
                    AdvancedNotif('Personnage', 'Côma', 'Vous avez appelé les LSMC', 'CHAR_WE', 'LSMC')
                    TriggerServerEvent('InitialCore:AlertEMS', 'LSMC', 'Urgence', 'Appel d\'urgence, appuyez sur [E] pour accepter.', true, GetPlayerServerId(PlayerId()), GetEntityCoords(GetPlayerPed(-1)))
                    local Timer2 = 0
                    while not isRevive and Timer2 < 360000 do -- 600000
                        Wait(1)
                        Timer2 = Timer2+1
                        --print(Timer2)
                        if Timer2 == 360000 then
                            --print('UNITE X')
                            local Ply = GetPlayerPed(-1)
                            local PlyPos = GetEntityCoords(Ply)
                           -- local inFrontOfPlayer = GetOffsetFromEntityInWorldCoords(Ply, 0.0, 5.0, 0.0)
                           -- local targetVeh = GetTargetVehicle(Ply, inFrontOfPlayer)

                            RequestModel(GetHashKey("ambulance"))
                            RequestModel(GetHashKey("s_m_m_doctor_01"))
                            while not HasAnimDictLoaded("cellphone@") do
                                RequestAnimDict("cellphone@")
                                Wait(100)
                            end

                            while not HasModelLoaded(GetHashKey("ambulance")) and RequestModel(GetHashKey("ambulance")) or not HasModelLoaded(GetHashKey("s_m_m_doctor_01")) and RequestModel(GetHashKey("s_m_m_doctor_01")) do
                                RequestModel(GetHashKey("ambulance"))
                                RequestModel(GetHashKey("s_m_m_doctor_01"))
                                Wait(100)
                            end

                            if DoesEntityExist(Ply) and IsEntityDead(Ply) then
                               -- SpawnVehicle(playerPos.x, playerPos.y, playerPos.x, vehhash, driverhash)
                               --SpawnVehicle(x, y, z, vehhash, driverhash)  

                                local found, spawnPos, spawnHeading = GetClosestVehicleNodeWithHeading(PlyPos.x + math.random(-40, 40), PlyPos.y + math.random(-40, 40), PlyPos.z, 0, 3, 0)
                                if found and HasModelLoaded(GetHashKey("ambulance")) and HasModelLoaded(GetHashKey("s_m_m_doctor_01")) then
                                    local tempVeh = CreateVehicle(GetHashKey("ambulance"), spawnPos, spawnHeading, true, false)
                                    ClearAreaOfVehicles(GetEntityCoords(tempVeh), 5000, false, false, false, false, false);  
                                    SetVehicleOnGroundProperly(tempVeh)
                                    local tempPed = CreatePedInsideVehicle(tempVeh, 26, GetHashKey("s_m_m_doctor_01"), -1, true, false)
                                    
                                    --[[mechBlip = AddBlipForEntity(mechVeh)
                                    SetBlipFlashes(mechBlip, true)  
                                    SetBlipColour(mechBlip, 5)]]

                                    --[[Citizen.CreateThread(function()
                                        TaskPlayAnim(Ply, "cellphone@", "cellphone_call_in", 1.5, 2.0, -1, 50, 2.0, 0, 0, 0 )
                                        Wait(6000)
                                        ClearPedTasks(Ply)
                                    end)]]

                                    --GoToTarget(GetEntityCoords(targetVeh).x, GetEntityCoords(targetVeh).y, GetEntityCoords(targetVeh).z, mechVeh, mechPed, vehhash, targetVeh)

                                    --function GoToTarget(x, y, z, vehicle, driver, vehhash, player)

                                    TaskVehicleDriveToCoord(tempPed, tempVeh, GetEntityCoords(Ply), 17.0, 0, GetHashKey("ambulance"), 1074528293, 1, true)
                                    local EnRoute = true
                                    while EnRoute do
                                        Wait(500)
                                        local distanceToTarget = GetDistanceBetweenCoords(PlyPos, GetEntityCoords(tempVeh), true)
                                        --print(distanceToTarget)
                                        if distanceToTarget < 20.0 then
                                            while EnRoute do
                                                Wait(500)
                                                TaskVehicleTempAction(tempPed, tempVeh, 27, 6000)
                                                SetVehicleUndriveable(tempVeh, true)
                                                --GoToTargetWalking(player, vehicle, driver)
                                                TaskGoToCoordAnyMeans(tempPed, PlyPos, 2.0, 0, 0, 786603, 0xbf800000)
                                                local distanceToTarget = GetDistanceBetweenCoords(PlyPos, GetEntityCoords(tempPed), true)
                                                --print(distanceToTarget)
                                                local noRunRange = false 
                                                if distanceToTarget <= 10.0 and not noRunRange then
                                                    TaskGoToCoordAnyMeans(tempPed, PlyPos, 1.0, 0, 0, 786603, 0xbf800000)
                                                    noRunRange = true
                                                end
                                                if distanceToTarget <= 2.0 then
                                                    --SetVehicleUndriveable(player, true)
                                                    TaskTurnPedToFaceCoord(tempPed, PlyPos, -1)
                                                    RequestAnimDict("mini@cpr@char_a@cpr_str")
                                                    while not HasAnimDictLoaded("mini@cpr@char_a@cpr_str") do
                                                        Wait(100)
                                                    end
                                                    TaskPlayAnim(tempPed, "mini@cpr@char_a@cpr_str", "cpr_pumpchest", 1.0, 1.0, -1, 9, 1.0, 0, 0, 0)
                                                    Wait(9000)
                                                    DoScreenFadeOut(1000)
                                                    Wait(1000)
                                                    EnRoute = false
                                                end
                                            end
                                        end
                                    end
                                    ClearPedTasks(tempPed)
                                    TaskVehicleDriveWander(tempPed, tempVeh, 17.0, 1074528293)
                                    SetEntityAsNoLongerNeeded(tempVeh)
                                    SetPedAsNoLongerNeeded(tempPed)
                                    NetworkResurrectLocalPlayer(353.388, -580.281, 43.281, 69.405, true, false)
                                    ClearTimecycleModifier()
                                    TimeNotif = 0
                                    Wait(500)
                                    AdvancedNotif('LSMC', 'Réanimation', 'Une équipe médical vous a pris en charge.', 'CHAR_WE', 'LSMC')
                                    DoScreenFadeIn(1000)
                                end
                            end
                        end
                    end
                end
            end
        else
            Wait(1000)
        end
    end
end)

RegisterNetEvent('InitialCore:LoadJob')
AddEventHandler('InitialCore:LoadJob', function(metier2, niveaumetier2)
    metier = metier2
    niveaumetier = niveaumetier2
    if metier == 'lsmc' then
        RefreshJobEMS()
    end
end)

local function RespawnPedEMS(Coords, Heading, Vector)
    --[[SetEntityCoordsNoOffset(ped, coords.x, coords.y, coords.z, false, false, false, true)
    NetworkResurrectLocalPlayer(coords.x, coords.y, coords.z, heading, true, false)
    TriggerEvent('playerSpawned')]]
    ToggleCancelEmote(false)
    local playerPed = PlayerPedId()
    SetCurrentPedWeapon(playerPed, GetHashKey("WEAPON_UNARMED"), true)
    ClampGameplayCamPitch(0.0, -90.0)
    local x, y, z = table.unpack(Coords + Vector)
    print(x)
    NetworkResurrectLocalPlayer(x, y, z, Heading, true, false)
    TimeNotif = 0
    SetEntityHeading(playerPed, Heading - 270.0)

    TaskPlayAnim(playerPed, lib1_char_b, anim_start, 8.0, 8.0, -1, 0, 0, false, false, false)
    Wait(15800-900)
    for i=1, 15, 1 do
        Wait(900)
        TaskPlayAnim(playerPed, lib2_char_b, anim_pump, 8.0, 8.0, -1, 0, 0, false, false, false)
    end
    TaskPlayAnim(playerPed, lib2_char_b, anim_success, 8.0, 8.0, -1, 0, 0, false, false, false)
    Wait(29000-1500)
    DoScreenFadeOut(1000)
    Wait(1000)
    ClearTimecycleModifier()
    ClearPedTasksImmediately(GetPlayerPed(-1))
    ToggleCancelEmote(true)
    isRevive = true
    DeadEffect = false
    Wait(500)
    DoScreenFadeIn(1000)
end

RegisterNetEvent('InitialCore:RevivePlayer')
AddEventHandler('InitialCore:RevivePlayer', function(Coords, Heading, Vector)
    RespawnPedEMS(Coords, Heading, Vector)
end)

RMenu.Add('ems', 'main', RageUI.CreateMenu("LSMC", "Menu métier"))
RMenu.Add('ems', 'interaction', RageUI.CreateSubMenu(RMenu:Get('ems', 'main'), "LSMC", "Intéraction"))
RMenu.Add('ems', 'prisedeservice', RageUI.CreateSubMenu(RMenu:Get('ems', 'main'), "LSMC", "Prise de service"))

RMenu.Add('ems', 'garage', RageUI.CreateMenu("LSMC", "Garage"))

RMenu.Add('ems', 'vestiaire', RageUI.CreateMenu("LSMC", "Vestiaire"))
RMenu.Add('ems', 'vestiairehomme', RageUI.CreateSubMenu(RMenu:Get('ems', 'vestiaire'), "LSMC", "Vestiaire homme"))
RMenu.Add('ems', 'vestiairefemme', RageUI.CreateSubMenu(RMenu:Get('ems', 'vestiaire'), "LSMC", "Vestiaire femme"))

local InCam = false
local GarageCam
local SelectedCarPrev
local CarPrev

local EMSZone = {
    {x = 314.799, y = -601.648, z = 43.292, zone = "vestiaire"},
    {x = 331.489, y = -568.345, z = 28.808, zone = "garage"} -- HEADING : 335.864
}
local WaitTime = 0

function RefreshJobEMS()
    while metier == 'lsmc' do
        Wait(1)

        for k, v in pairs(EMSZone) do
            local dist = Vdist2(GetEntityCoords(GetPlayerPed(-1)), v.x, v.y, v.z)
            if dist <= 400.0 then
                WaitTime = WaitTime+1
                if dist <= 1.5 then
                    HelpNotif('Appuyez sur ~INPUT_PICKUP~ pour intéragir.')
                    if IsControlJustPressed(1, 38) then
                        if v.zone == "garage" then
                            RageUI.Visible(RMenu:Get('ems', 'garage'), true)
                            if not InCam then
                                InCam = true
                                GarageCam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", 334.967, -564.573, 30.5, -25.0, 0.0, 200.0, 75.00, false, 0)
                                SetCamActive(GarageCam, true)
                                RenderScriptCams(true, true, 500, true, true) 
                            end
                            IsMenuEMSOpened = true
                            OpenMenuEMS()
                        else
                            RageUI.Visible(RMenu:Get('ems', 'vestiaire'), true)
                            IsMenuEMSOpened = true
                            OpenMenuEMS()
                        end
                    end
                end
            end
        end
        if WaitTime == 0 then
            Wait(2500)
        end
        WaitTime = 0
    end
end

--[[
    RMenu.Add('ems', 'main', RageUI.CreateMenu("LSMC", "Menu métier"))
    RMenu.Add('ems', 'interaction', RageUI.CreateSubMenu(RMenu:Get('ems', 'main'), "LSMC", "Intéraction"))
    RMenu.Add('ems', 'prisedeservice', RageUI.CreateSubMenu(RMenu:Get('ems', 'main'), "LSMC", "Prise de service"))

    RMenu.Add('ems', 'garage', RageUI.CreateMenu("LSMC", "Garage"))

    RMenu.Add('ems', 'vestiaire', RageUI.CreateMenu("LSMC", "Vestiaire"))
    RMenu.Add('ems', 'vestiairehomme', RageUI.CreateSubMenu(RMenu:Get('ems', 'vestiaire'), "LSMC", "Vestiaire homme"))
    RMenu.Add('ems', 'vestiairefemme', RageUI.CreateSubMenu(RMenu:Get('ems', 'vestiaire'), "LSMC", "Vestiaire femme"))
]]

function OpenMenuEMS(isf6)
    if isf6 then
        RageUI.Visible(RMenu:Get('ems', 'main'), true)
        IsMenuEMSOpened = true
    end
    while IsMenuEMSOpened do
        Wait(1)

        --if IsControlJustPressed(1, 38) then
            --RageUI.Visible(RMenu:Get('ems', 'main'), true)
        --end -- ## DEV

        if not RageUI.Visible(RMenu:Get('ems', 'main')) and not RageUI.Visible(RMenu:Get('ems', 'interaction')) and not RageUI.Visible(RMenu:Get('ems', 'prisedeservice')) and not RageUI.Visible(RMenu:Get('ems', 'garage')) and not RageUI.Visible(RMenu:Get('ems', 'vestiaire')) and not RageUI.Visible(RMenu:Get('ems', 'vestiairehomme')) and not RageUI.Visible(RMenu:Get('ems', 'vestiairefemme')) then
            IsMenuEMSOpened = false
        end

        if not RageUI.Visible(RMenu:Get('ems', 'garage')) and InCam then
            InCam = false
            SetCamActive(GarageCam, false)
            RenderScriptCams(false, true, 500, true, true) 
            DestroyCam(GarageCam)
            GarageCam = nil

            if DoesEntityExist(CarPrev) then
                DeleteEntity(CarPrev)
            end

            SelectedCarPrev = nil
        end

        RageUI.IsVisible(RMenu:Get('ems', 'vestiaire'), true, true, true, function()
            RageUI.Button("Homme", "DESC", { RightLabel = ">" }, true, function(_,_,Selected)
            end, RMenu:Get('ems', 'vestiairehomme'))
            RageUI.Button("Femme", "DESC", { RightLabel = ">" }, true, function(_,_,Selected)
            end, RMenu:Get('ems', 'vestiairefemme'))
        end)

        RageUI.IsVisible(RMenu:Get('ems', 'vestiairehomme'), true, true, true, function()
            RageUI.Button("Chemise", "Prendre la chemise de la tenue LSMC", {}, true, function(_,_,Selected)
                if Selected then
                    local Clothe = {}
                    Clothe.Type = "Haut"
                    Clothe.Sexe = 1
                    Clothe.ID = 223
                    Clothe.Torso1 = 250
                    Clothe.Torso2 = 1
                    TriggerServerEvent('InitialCore:GiveItem', GetPlayerServerId(PlayerId()), "Vetement", 1, Clothe)
                end
            end)
            RageUI.Button("Pantalon", "Prendre le pantalon de la tenue LSMC", {}, true, function(_,_,Selected)
                if Selected then
                    local Clothe2 = {}
                    Clothe2.Type = "Pantalon"
                    Clothe2.Sexe = 1
                    Clothe2.Pants1 = 96
                    Clothe2.Pants2 = 1
                    TriggerServerEvent('InitialCore:GiveItem', GetPlayerServerId(PlayerId()), "Vetement", 1, Clothe2)
                end
            end)
            RageUI.Button("Chaussure", "Prendre la paire de chaussure de la tenue LSMC", {}, true, function(_,_,Selected)
                if Selected then
                    local Clothe3 = {}
                    Clothe3.Type = "Chaussure"
                    Clothe3.Sexe = 1
                    Clothe3.Shoes1 = 56
                    Clothe3.Shoes2 = 1
                    TriggerServerEvent('InitialCore:GiveItem', GetPlayerServerId(PlayerId()), "Vetement", 1, Clothe3)
                end
            end)
            RageUI.Button("Stétoscope", "Prendre le stétoscope de la tenue LSMC", {}, true, function(_,_,Selected)
                if Selected then
                    local Clothe4 = {}
                    Clothe4.Type = "Accessoire"
                    Clothe4.Sexe = 1
                    Clothe4.ID = 126
                    TriggerServerEvent('InitialCore:GiveItem', GetPlayerServerId(PlayerId()), "Vetement", 1, Clothe4)
                end
            end)
            RageUI.Button("Carte", "Prendre la carte de la tenue LSMC", {}, true, function(_,_,Selected)
                if Selected then
                    local Clothe5 = {}
                    Clothe5.Type = "Accessoire"
                    Clothe5.Sexe = 1
                    Clothe5.ID = 127
                    TriggerServerEvent('InitialCore:GiveItem', GetPlayerServerId(PlayerId()), "Vetement", 1, Clothe5)
                end
            end)
        end)

        RageUI.IsVisible(RMenu:Get('ems', 'vestiairefemme'), true, true, true, function()
            RageUI.Button("Chemise", "Prendre la chemise de la tenue LSMC", {}, true, function(_,_,Selected)
                if Selected then
                    local Clothe = {}
                    Clothe.Type = "Haut"
                    Clothe.Sexe = 2
                    Clothe.ID = 255
                    Clothe.Torso1 = 258
                    Clothe.Torso2 = 1
                    TriggerServerEvent('InitialCore:GiveItem', GetPlayerServerId(PlayerId()), "Vetement", 1, Clothe)
                end
            end)
            RageUI.Button("Pantalon", "Prendre le pantalon de la tenue LSMC", {}, true, function(_,_,Selected)
                if Selected then
                    local Clothe2 = {}
                    Clothe2.Type = "Pantalon"
                    Clothe2.Sexe = 2
                    Clothe2.Pants1 = 99
                    Clothe2.Pants2 = 1
                    TriggerServerEvent('InitialCore:GiveItem', GetPlayerServerId(PlayerId()), "Vetement", 1, Clothe2)
                end
            end)
            RageUI.Button("Chaussure", "Prendre la paire de chaussure de la tenue LSMC", {}, true, function(_,_,Selected)
                if Selected then
                    local Clothe3 = {}
                    Clothe3.Type = "Chaussure"
                    Clothe3.Sexe = 2
                    Clothe3.Shoes1 = 24
                    Clothe3.Shoes2 = 1
                    TriggerServerEvent('InitialCore:GiveItem', GetPlayerServerId(PlayerId()), "Vetement", 1, Clothe3)
                end
            end)
            RageUI.Button("Stétoscope", "Prendre le stétoscope de la tenue LSMC", {}, true, function(_,_,Selected)
                if Selected then
                    local Clothe4 = {}
                    Clothe4.Type = "Accessoire"
                    Clothe4.Sexe = 2
                    Clothe4.ID = 96
                    TriggerServerEvent('InitialCore:GiveItem', GetPlayerServerId(PlayerId()), "Vetement", 1, Clothe4)
                end
            end)
            RageUI.Button("Carte", "Prendre la carte de la tenue LSMC", {}, true, function(_,_,Selected)
                if Selected then
                    local Clothe5 = {}
                    Clothe5.Type = "Accessoire"
                    Clothe5.Sexe = 2
                    Clothe5.ID = 97
                    TriggerServerEvent('InitialCore:GiveItem', GetPlayerServerId(PlayerId()), "Vetement", 1, Clothe5)
                end
            end)
        end)

        RageUI.IsVisible(RMenu:Get('ems', 'garage'), true, true, true, function()
            RageUI.Separator("Fourgon")
            RageUI.Button("Fourgon ULSA d'ambulance", "DESC", {}, true, function(_, Active, Selected)
                if Active and SelectedCarPrev ~= 1 then
                    SelectedCarPrev = 1
                    if DoesEntityExist(CarPrev) then
                        DeleteEntity(CarPrev)
                    end
                    while not HasModelLoaded(GetHashKey("ulsaems2")) do
                        RequestModel(GetHashKey("ulsaems2"))
                        Wait(100)
                    end
                    CarPrev = CreateVehicle(GetHashKey("ulsaems2"), 336.983, -572.203, 28.793, 339.691, false)
                end
                if Selected then
                    if DoesEntityExist(CarPrev) then
                        DeleteEntity(CarPrev)
                    end
                    while not HasModelLoaded(GetHashKey("ulsaems2")) do
                        RequestModel(GetHashKey("ulsaems2"))
                        Wait(100)
                    end
                    local FinalCar = CreateVehicle(GetHashKey("ulsaems2"), 336.983, -572.203, 28.793, 339.691, true)
                    RageUI:GoBack()
                end
            end)
            RageUI.Button("Fourgonette ULSA", "DESC", {}, true, function(_, Active, Selected)
                if Active and SelectedCarPrev ~= 2 then
                    SelectedCarPrev = 2
                    if DoesEntityExist(CarPrev) then
                        DeleteEntity(CarPrev)
                    end
                    while not HasModelLoaded(GetHashKey("ulsaems3")) do
                        RequestModel(GetHashKey("ulsaems3"))
                        Wait(100)
                    end
                    CarPrev = CreateVehicle(GetHashKey("ulsaems3"), 336.983, -572.203, 28.793, 339.691, false)
                end
                if Selected then
                    if DoesEntityExist(CarPrev) then
                        DeleteEntity(CarPrev)
                    end
                    while not HasModelLoaded(GetHashKey("ulsaems3")) do
                        RequestModel(GetHashKey("ulsaems3"))
                        Wait(100)
                    end
                    local FinalCar = CreateVehicle(GetHashKey("ulsaems3"), 336.983, -572.203, 28.793, 339.691, true)
                    RageUI:GoBack()
                end
            end)
            RageUI.Separator("Véhicule rapide")
            RageUI.Button("Scout ULSA de service", "DESC", {}, true, function(_, Active, Selected)
                if Active and SelectedCarPrev ~= 3 then
                    SelectedCarPrev = 3
                    if DoesEntityExist(CarPrev) then
                        DeleteEntity(CarPrev)
                    end
                    while not HasModelLoaded(GetHashKey("ulsaems")) do
                        RequestModel(GetHashKey("ulsaems"))
                        Wait(100)
                    end
                    CarPrev = CreateVehicle(GetHashKey("ulsaems"), 336.983, -572.203, 28.793, 339.691, false)
                end
                if Selected then
                    if DoesEntityExist(CarPrev) then
                        DeleteEntity(CarPrev)
                    end
                    while not HasModelLoaded(GetHashKey("ulsaems")) do
                        RequestModel(GetHashKey("ulsaems"))
                        Wait(100)
                    end
                    local FinalCar = CreateVehicle(GetHashKey("ulsaems"), 336.983, -572.203, 28.793, 339.691, true)
                    RageUI:GoBack()
                end
            end)
        end)

        RageUI.IsVisible(RMenu:Get('ems', 'main'), true, true, true, function()
            RageUI.Button("Prise de service", "DESC", {RightLabel = ">"}, true, function()
            end, RMenu:Get('ems', 'prisedeservice'))
            RageUI.Button("Intéraction avec un patient", "DESC", {RightLabel = ">"}, true, function()
            end, RMenu:Get('ems', 'interaction'))
        end)
        RageUI.IsVisible(RMenu:Get('ems', 'prisedeservice'), true, true, true, function()
            RageUI.Checkbox("Service", "DESC", EnService, { Style = RageUI.CheckboxStyle.Tick }, function(Hovered, Selected, Active, Checked)
                if Selected and Checked ~= EnService then
                    EnService = Checked
                    if EnService then
                        AdvancedNotif('LSMC', 'Service', "Vous êtes en service, vous recevez désormais tous les appels.", 'CHAR_WE', 'LSMC')
                    else
                        AdvancedNotif('LSMC', 'Service', "Vous n'êtes plus en service, vous ne recevez plus les appels.", 'CHAR_WE', 'LSMC')
                    end
                end
            end)
        end)
        RageUI.IsVisible(RMenu:Get('ems', 'interaction'), true, true, true, function()
            RageUI.Button("Réanimer", "DESC", {RightLabel = ">"}, true, function(_,_,Selected)
                if Selected then
                    local PlyRea, PlyRadius = GetClosestPlayer()
                    if PlyRadius <= 1.5 then
                        local playerPed = PlayerPedId()
                        if IsEntityDead(GetPlayerPed(PlyRea)) then
                            TriggerServerEvent('InitialCore:RevivePlayerS', GetPlayerServerId(PlyRea), GetEntityCoords(playerPed), GetEntityHeading(playerPed), GetEntityForwardVector(playerPed))
                            ToggleCancelEmote(false)
                            SetCurrentPedWeapon(playerPed, GetHashKey("WEAPON_UNARMED"), true)
                            TaskPlayAnim(playerPed, lib1_char_a, anim_start, 8.0, 8.0, -1, 0, 0, false, false, false)
                            Wait(15800 - 900)
                            for i=1, 15, 1 do -- 15
                                Wait(900)
                                TaskPlayAnim(playerPed, lib2_char_a, anim_pump, 8.0, 8.0, -1, 0, 0, false, false, false)
                            end
                            TaskPlayAnim(playerPed, lib2_char_a, anim_success, 8.0, 8.0, -1, 0, 0, false, false, false)
                            Wait(29000)
                            ClearPedTasksImmediately(GetPlayerPed(-1))
                            ToggleCancelEmote(true)
                        else
                            AdvancedNotif('LSMC', 'Erreur', 'La personne n\'est pas morte.', 'CHAR_WE', 'LSMC')
                        end
                    else
                        AdvancedNotif('LSMC', 'Erreur', 'Personne à proximité.', 'CHAR_WE', 'LSMC')
                    end
                end
            end)
        end)
    end
end

RegisterNetEvent('InitialCore:AlertEMSC')
AddEventHandler('InitialCore:AlertEMSC', function(header, sub, message, isappel, appelid, coords)
    if EnService and metier == "lsmc" then
        AdvancedNotif(header, sub, message, 'CHAR_WE', 'LSMC')
        if isappel then
            local TimerA = 0
            while TimerA <= 830 do
                Wait(1)
                TimerA = TimerA+1
                if IsControlJustPressed(1, 38) then
                    TimerA = 830
                    AdvancedNotif('LSMC', 'Appel', 'Vous avez accepté l\'appel, un point a été placée sur votre GPS.', 'CHAR_WE', 'LSMC')
                    TriggerServerEvent('InitialCore:RespondAppelEMS', appelid)
                    local RouteBlip = AddBlipForCoord(coords)
                    SetBlipColour(RouteBlip, 27)
                    SetBlipRoute(RouteBlip, 1)
                    SetBlipRouteColour(RouteBlip, 27)
                    while Vdist2(GetEntityCoords(GetPlayerPed(-1)), coords) >= 15.0 do
                        Wait(500)
                    end
                    ClearGpsMultiRoute()
                    ClearAllBlipRoutes()
                    RemoveBlip(RouteBlip)
                end
            end
        end
    end
end)

RegisterNetEvent('InitialCore:RespondAppelEMSC')
AddEventHandler('InitialCore:RespondAppelEMSC', function()
    AdvancedNotif('LSMC', 'Appel', 'Quelq\'un a pris votre appel.', 'CHAR_WE', 'LSMC')
end)