------------------------------------------------------------------------------
--
-- Ce travail est sous liscence:
-- Creative Commons Attribution-NonCommercial-NoDerivatives-NoDistribution 4.0 International License.
--
------------------------------------------------------------------------------

local metier
local niveaumetier
local enService = false

local serviceblip = false

local InCam = false

local SelectedCarPrev

local impacts = 0

local function RefreshBlipsMineur()
    if DoesBlipExist(RecolteBlip) then
        RemoveBlip(RecolteBlip)
    end
    if DoesBlipExist(TraitementPierreBlip) then
        RemoveBlip(TraitementPierreBlip)
    end
    if DoesBlipExist(VentePierreBlip) then
        RemoveBlip(VentePierreBlip)
    end 
    if DoesBlipExist(VestiaireBlip) then
        RemoveBlip(VestiaireBlip)
    end 
    if metier == 'mineur' then
        VestiaireBlip = AddBlipForCoord(1077.96, -1972.60, 31.47)
        SetBlipSprite(VestiaireBlip, 618)
        SetBlipDisplay(VestiaireBlip, 4)
        SetBlipScale(VestiaireBlip, 0.75)
        SetBlipColour(VestiaireBlip, 46)
        SetBlipAsShortRange(VestiaireBlip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString("~y~Vestiaire")
        EndTextCommandSetBlipName(VestiaireBlip)
    end

    if metier == 'mineur' and enService then

        RecolteBlip = AddBlipForCoord(2969.44, 2776.54, 38.38)
        SetBlipSprite(RecolteBlip, 618)
        SetBlipDisplay(RecolteBlip, 4)
        SetBlipScale(RecolteBlip, 0.75)
        SetBlipColour(RecolteBlip, 46)
        SetBlipAsShortRange(RecolteBlip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString("~y~Récolte de pierre")
        EndTextCommandSetBlipName(RecolteBlip)
       
        TraitementPierreBlip = AddBlipForCoord(1109.42, -2007.91, 31.04)
        SetBlipSprite(TraitementPierreBlip, 618)
        SetBlipDisplay(TraitementPierreBlip, 4)
        SetBlipScale(TraitementPierreBlip, 0.75)
        SetBlipColour(TraitementPierreBlip, 46)
        SetBlipAsShortRange(TraitementPierreBlip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString("~y~Fonderie")
        EndTextCommandSetBlipName(TraitementPierreBlip)

        VentePierreBlip = AddBlipForCoord(1174.4018, -3288.85, 4.88)
        SetBlipSprite(VentePierreBlip, 618)
        SetBlipDisplay(VentePierreBlip, 4)
        SetBlipScale(VentePierreBlip, 0.75)
        SetBlipColour(VentePierreBlip, 46)
        SetBlipAsShortRange(VentePierreBlip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString("~y~Vente de fragments")
        EndTextCommandSetBlipName(VentePierreBlip)
    end
end


RegisterNetEvent('InitialCore:LoadJob')
AddEventHandler('InitialCore:LoadJob', function(metier2, niveaumetier2)
    metier = metier2
    niveaumetier = niveaumetier2
    RefreshBlipsMineur()
end)

local ZoneMineur = {
    {x= 1077.96, y= -1972.60, z= 31.47, type= "vestiairemineur"},
    {x= 1074.577, y= -2009.02, z= 32.08, type= "coffremineur"},
    {x= 2969.44, y= 2776.54, z= 38.38, type= "récoltepierre"},
    {x= 1109.42, y= -2007.91, z= 31.04, type= "traitementpierre"},
    {x= 1173.68, y= -3288.82, z= 5.88, type= "ventepierre"}, 
    {x= 1058.7, y= -1965.42, z= 31.01, type= "camion"},
    {x= 1059.51, y= -1976.76, z= 31.01, type= "delete"},
}


RMenu.Add('vestiairemineur', 'main',  RageUI.CreateMenu('Vestiaire', '~b~Vestiaire des mineurs'))
RMenu.Add('mineur', 'camion',  RageUI.CreateMenu('Garage', '~b~Garage des mineurs'))
RMenu.Add('vestiairemineur', 'tenues', RageUI.CreateSubMenu(RMenu:Get('vestiairemineur', 'main'), "Vestiaire", "~b~Tenues"))

local IsAnim = false

local function StartRecoltePierre()
    IsAnim = true
    CreateThread(function()
        while impacts < 5 do
            Wait(1)
		    local ped = PlayerPedId()
            RequestAnimDict("melee@large_wpn@streamed_core")
            Wait(100)
            TaskPlayAnim(ped, 'melee@large_wpn@streamed_core', 'ground_attack_on_spot', 8.0, 8.0, -1, 80, 0, 0, 0, 0)
            SetEntityHeading(ped, 165.71)
            if impacts == 0 then
                pickaxe = CreateObject(GetHashKey("prop_tool_pickaxe"), 0, 0, 0, true, true, true) 
                AttachEntityToEntity(pickaxe, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 57005), 0.12, -0.02, -0.02, -90.0, 0.0, 0.0, true, true, false, true, 1, true) --50.0, 180.0
            end  
            Wait(2100)
           -- ClearPedTasks(ped)
            --print(impacts)
            TriggerServerEvent('InitialCore:GiveItem', GetPlayerServerId(PlayerId()), "pierre", 1) 
            impacts = impacts + 1
            if impacts == 5 then
                Wait(400)
                IsAnim = false
                DetachEntity(pickaxe, 1, true)
                DeleteEntity(pickaxe)
                DeleteObject(pickaxe)
                mineActive = false
                impacts = 0
                break
            end
        end
    end)

end

local function StartTraitement()

    TriggerServerCallback("InitialCore:hasObject", function(hasPierre, montant)       
        if hasPierre then
            if enService then
                if montant >= 10 then
                    TriggerServerEvent('InitialCore:DeleteItem', GetPlayerServerId(PlayerId()), "pierre", 10)

                    RequestAnimDict("amb@prop_human_bum_bin@idle_a")                    
                    Citizen.Wait(100)
                    FreezeEntityPosition(PlayerPedId(), true)
                    SetEntityHeading(PlayerPedId(), 231.74)
                    AdvancedNotif("Mineur", "Fonte de la pierre", "Vous avez mis 10 pierres dans la fonderie.", "CHAR_WE", "INITIALV")
                    TaskPlayAnim(PlayerPedId(), 'amb@prop_human_bum_bin@idle_a', 'idle_a', 8.0, 8.0, -1, 81, 0, 0, 0, 0)
                    Citizen.Wait(15900)
                    ClearPedTasks(PlayerPedId())

                    local Var = math.random(1, 3)
                    if Var == 1 then
                        TriggerServerEvent('InitialCore:GiveItem', GetPlayerServerId(PlayerId()), "for", math.random(1, 2))
                    end

                    local Var = math.random(1, 2)
                    if Var == 1 then
                        TriggerServerEvent('InitialCore:GiveItem', GetPlayerServerId(PlayerId()), "ffer", math.random(1, 2))
                    end

        --            local Var = math.random(1, 2)
        --            if Var == 1 then
        --                TriggerServerEvent('InitialCore:GiveItem', GetPlayerServerId(PlayerId()), "fsoufre", math.random(1, 2))
        --            end

                    local Var = math.random(1, 15)
                    if Var == 7 then
                        TriggerServerEvent('InitialCore:GiveItem', GetPlayerServerId(PlayerId()), "pdiamant", math.random(1, 2))
                    end

                    FreezeEntityPosition(PlayerPedId(), false)

                else
                    AdvancedNotif("Mineur", "Erreur", "Vous n'avez pas assez de pierres (minimum 10).", "CHAR_WE", "INITIALV")
                end
            else
                AdvancedNotif("Mineur", "Erreur", "Vous n'êtes pas en service.", "CHAR_WE", "INITIALV")
            end
        else
            AdvancedNotif("Mineur", "Erreur", "Vous n'avez aucune pierre !", "CHAR_WE", "INITIALV")
        end
    end, 'pierre')
end

local function StartVente()

    if not haspdiamant and not hasffer and not hasFor then
        AdvancedNotif("Mike", "Eh mec !", "Ta rien sur toi là !", "CHAR_PROPERTY_BAR_AIRPORT", "CHAR_PROPERTY_BAR_AIRPORT")
    else
        AdvancedNotif("Mike", "Hey !", "Tu viens pour les fragments ? Dépose tout !", "CHAR_PROPERTY_BAR_AIRPORT", "CHAR_PROPERTY_BAR_AIRPORT")
    end

    TriggerServerCallback("InitialCore:hasObject", function(hasFor, montant)
        if hasFor then 
            TriggerServerEvent('InitialCore:DeleteItem', GetPlayerServerId(PlayerId()), "for", montant)
            TriggerServerEvent('InitialCore:GiveMoney', GetPlayerServerId(PlayerId()), montant * 20)
        end
    end, 'for')

    TriggerServerCallback("InitialCore:hasObject", function(hasffer, montant)
        if hasffer then
            TriggerServerEvent('InitialCore:DeleteItem', GetPlayerServerId(PlayerId()), "ffer", montant)
            TriggerServerEvent('InitialCore:GiveMoney', GetPlayerServerId(PlayerId()), montant * 10)
        end
    end, 'ffer')

    TriggerServerCallback("InitialCore:hasObject", function(haspdiamant, montant)
        if haspdiamant then
            TriggerServerEvent('InitialCore:DeleteItem', GetPlayerServerId(PlayerId()), "pdiamant", montant)
            TriggerServerEvent('InitialCore:GiveMoney', GetPlayerServerId(PlayerId()), montant * 500)
        end
    end, 'pdiamant')

end

CreateThread(function()
    RequestModel(GetHashKey("s_m_y_construct_02"))
    while not HasModelLoaded(GetHashKey("s_m_y_construct_02")) do
        Wait(200)
    end
    local pietonacheteur = CreatePed(5, GetHashKey("s_m_y_construct_02"), 1174.4018, -3288.85, 4.88, 92.80, false, false)
    FreezeEntityPosition(pietonacheteur, true)
    SetEntityInvincible(pietonacheteur, true)
    SetBlockingOfNonTemporaryEvents(pietonacheteur, true)


    RequestModel(GetHashKey("s_m_y_construct_01"))
    while not HasModelLoaded(GetHashKey("s_m_y_construct_01")) do
        Wait(200)
    end
    local pietoncamion = CreatePed(5, GetHashKey("s_m_y_construct_01"), 1058.76, -1965.42, 30.01, 255.48, false, false)
    FreezeEntityPosition(pietoncamion, true)
    SetEntityInvincible(pietoncamion, true)
    SetBlockingOfNonTemporaryEvents(pietoncamion, true)
   

    RequestModel(48339065)
    while not HasModelLoaded(48339065) do
        Wait(200)
    end
    local veh = CreateVehicle(48339065, 1179.50, -3289.00, 5.64, 91.21, false, false)
    SetEntityAsMissionEntity(veh, true, false)
    SetVehicleHasBeenOwnedByPlayer(veh, true)
    SetVehicleOnGroundProperly(veh)
    --FreezeEntityPosition(veh, true)

    SetVehicleDoorsLocked(veh, 2)
end)

CreateThread(function()
    while true do
        Wait(1)

        RageUI.IsVisible(RMenu:Get('vestiairemineur', 'main'), true, true, true, function()
            RageUI.Button("Prendre son service", "Se mettre en service, vous receverez tous les appels.", {}, true, function(_, _, Selected)
                if Selected then
                    enService = true
                    RefreshBlipsMineur()
                    AdvancedNotif("Mineur", "Prise de service", "Vous êtes en service.", "CHAR_WE", "INITIALV")
                end
            end)
            RageUI.Button("Quitter son service", "Quitter son service, vous ne receverez pas les appels.", {}, true, function(_, _, Selected)
                if Selected then
                    enService = false
                    RefreshBlipsMineur()
                    AdvancedNotif("Mineur", "Fin de service", "Vous n'êtes plus en service.", "CHAR_WE", "INITIALV")
                end
            end)
        end)

        RageUI.IsVisible(RMenu:Get('mineur', 'camion'), true, true, true, function()
            RageUI.Button("Camion mineur", "Camion des mineurs lors de la prise de service.", {}, true, function(_, Active, Selected)
                if Active and SelectedCarPrev ~= 2 then
                    SelectedCarPrev = 2
                    if DoesEntityExist(CarMion) then
                        DeleteEntity(CarMion)
                    end
                    while not HasModelLoaded(GetHashKey("TipTruck")) do
                        RequestModel(GetHashKey("TipTruck"))
                        Wait(200)
                    end
                    CarMion = CreateVehicle(GetHashKey("TipTruck"), 1063.68, -1969.25, 31.01, 336.88, false)
                end
                if Selected then
                    if DoesEntityExist(CarMion) then
                        DeleteEntity(CarMion)
                    end
                    while not HasModelLoaded(GetHashKey("TipTruck")) do
                        RequestModel(GetHashKey("TipTruck"))
                        Wait(200)
                    end
                    local FinalMion = CreateVehicle(GetHashKey("TipTruck"), 1063.68, -1969.25, 31.01, 336.88, true)
                    RageUI:CloseAll()
                end
            end)
        end)

        local plyCoords = GetEntityCoords(GetPlayerPed(-1))

        for k in pairs(ZoneMineur) do
            local dist2 = Vdist2(plyCoords.x, plyCoords.y, plyCoords.z, ZoneMineur[k].x, ZoneMineur[k].y, ZoneMineur[k].z)
 
            if dist2 <= 2.5 then
                if metier == 'mineur' then
                --if true then
                    HelpNotif("Appuyez sur ~INPUT_TALK~ pour interagir.")
                    if IsControlJustPressed(1,51) then
                        if ZoneMineur[k].type == 'vestiairemineur' then
                            RageUI.Visible(RMenu:Get('vestiairemineur', 'main'), not RageUI.Visible(RMenu:Get('vestiairemineur', 'main')))
                        elseif ZoneMineur[k].type == 'coffremineur' then
                            TriggerEvent('InitialCore:OpenCoffreProperties', true, 'ltdCoffre')
                        elseif ZoneMineur[k].type == 'récoltepierre' then
                            if not IsAnim then
                                StartRecoltePierre()
                            else
                                AdvancedNotif("Mineur", "Erreur", "Vous êtes déjà en train de miner.", "CHAR_WE", "INITIALV")
                            end
                        elseif ZoneMineur[k].type == 'traitementpierre' then
                            StartTraitement()
                        elseif ZoneMineur[k].type == 'ventepierre' then
                            StartVente()
                        elseif ZoneMineur[k].type == 'camion' then
                            if enService then
                                RageUI.Visible(RMenu:Get('mineur', 'camion'), not RageUI.Visible(RMenu:Get('mineur', 'camion')))
                                if not InCam then
                                    InCam = true
                                    CamCamion = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", 1072.69, -1958.98, 35.01, -25.0, 0.0, 135.0, 75.0, false, 0)
                                    SetCamActive(CamCamion, true)
                                    RenderScriptCams(true, true, 500, true, true)
                                end
                            else
                                AdvancedNotif("Mineur", "Erreur", "Vous n'êtes pas en service.", "CHAR_WE", "INITIALV")
                            end
                        elseif ZoneMineur[k].type == 'delete' then
                            if IsPedInAnyVehicle(PlayerPedId(), false) then
                                AdvancedNotif("Mineur", "Rendre le véhicule", "Appuyez sur ~g~[E]~w~ pour rendre le camion.", "CHAR_WE", "INITIALV")
                                local timer = 500
                                while timer > 0 do
                                    Wait(1)
                                    if IsControlJustPressed(0, 51) then
                                        if DoesEntityExist(GetVehiclePedIsIn(PlayerPedId(), false)) then
                                            DeleteEntity(GetVehiclePedIsIn(PlayerPedId(), false))
                                        end
                                    end
                                    timer = timer - 1
                                end
                            else
                                AdvancedNotif("Mineur", "Erreur", "Vous n'êtes pas dans un véhicule.", "CHAR_WE", "INITIALV")
                            end
                        end
                    end
                end
            end
        end

        if not RageUI.Visible(RMenu:Get('mineur', 'camion')) and InCam then
            InCam = false
            SetCamActive(CamCamion, false)
            RenderScriptCams(false, true, 500, true, true)
            DestroyCam(CamCamion)
            CamCamion = nil
            if DoesEntityExist(CarMion) then
                DeleteEntity(CarMion)
            end
            SelectedCarPrev = nil
        end
    end
end)