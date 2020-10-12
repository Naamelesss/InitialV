------------------------------------------------------------------------------
--
-- Ce travail est sous liscence:
-- Creative Commons Attribution-NonCommercial-NoDerivatives-NoDistribution 4.0 International License.
--
------------------------------------------------------------------------------

gestionhangarMenu = NativeUI.CreateMenu("","Gestion Hangar")
_menuPool:Add(gestionhangarMenu)

local HangarID
local Equipement
local Pousse
local BlockAction

AddEventHandler('InitialCore:StartWeedChangementPetitHangar', function()
    local EnRoute = false
    local plyPed = GetPlayerPed(-1)
    local EnRoute = true
    ClearGpsMultiRoute()
    ClearAllBlipRoutes()
    RouteBlip = AddBlipForCoord(2196.141, 5606.529, 52.515)
    SetBlipColour(RouteBlip, 6)
    SetBlipRoute(RouteBlip, 1)
    SetBlipRouteColour(RouteBlip, 6)
    AdvancedNotif('Initial V', '~r~Hangar', 'Allez au point sur la carte avec un camion (Mule) pour allez chercher les équipements.', 'CHAR_WE', 'INITIALV')
    while EnRoute do
        Wait(0)
        local coords = GetEntityCoords(plyPed)
        if Vdist2(coords.x, coords.y, coords.z, 2196.141, 5606.529, 53.515) <= 10.0 then
            if GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsIn(plyPed, false))) == 'MULE' then
                HelpNotif('Appuyez sur ~INPUT_PICKUP~ pour charger les équipements.')
                if IsControlJustPressed(1, 38) then
                    ClearGpsMultiRoute()
                    ClearAllBlipRoutes()
                    RemoveBlip(RouteBlip)
                    EnRoute = false
                end
            else
                HelpNotif('Vous devez être dans une Mule pour pouvoir prendre tout les équipements.')
            end
        end
    end
    EnRoute = true
    RouteBlip = AddBlipForCoord(-22.031, 217.197, 106.582)
    SetBlipColour(RouteBlip, 6)
    SetBlipRoute(RouteBlip, 1)
    SetBlipRouteColour(RouteBlip, 6)
    AdvancedNotif('Initial V', '~r~Hangar', 'Retournez à votre hangar pour déposer et installer les équipements.', 'CHAR_WE', 'INITIALV')
    while EnRoute do
        Wait(0)
        local coords = GetEntityCoords(plyPed)
        if Vdist2(coords.x, coords.y, coords.z, -22.031, 217.197, 106.582) <= 10.0 then
            if GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsIn(plyPed, false))) == 'MULE' then
                HelpNotif('Appuyez sur ~INPUT_PICKUP~ pour décharger et installer les équipements dans votre hangar.')
                if IsControlJustPressed(1, 38) then
                    ClearGpsMultiRoute()
                    ClearAllBlipRoutes()
                    RemoveBlip(RouteBlip)
                    EnRoute = false
                end
            else
                HelpNotif('Vous devez être dans votre Mule pour pouvoir déposer tout les équipements.')
            end
        end
    end
    DoScreenFadeOut(1000)
    Wait(1500)
    BlockAction = true
    TriggerEvent('InitialCore:BlockActionAnimHangar')
    TriggerEvent('InitialCore:SpawnWeedPetitHangar')

    local CamH = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", 1105.110, -3099.356, -38.0, 0.00, 0.00, 90.0, 75.00, false, 0)
    SetCamActive(CamH, true)
    RenderScriptCams(true, false, 50, true, true)

	SetEntityVisible(GetPlayerPed(-1), false, 0)
    DisplayRadar(false)
        
    local CamH2 = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", 1088.5, -3099.356, -38.0, 0.00, 0.00, 90.0, 75.00, false, 0)

    --1105.110
    --1088.5

    Wait(1000)

    SetCamActiveWithInterp(CamH2, CamH, 20000, true, true)

    Wait(500)
    DoScreenFadeIn(1000)

    PlaySoundFrontend(-1, "CHARACTER_SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", false)
    PlaySoundFrontend(-1, "PROPERTY_PURCHASE", "HUD_AWARDS", 1)

    Wait(17500)
    DoScreenFadeOut(1000)
    
end)

AddEventHandler('InitialCore:BlockActionAnimHangar', function()
    while BlockAction do
        Wait(0)
        DisableAllControlActions(0)
    end
end)

local function ProgressionHangarMenu(menu, Pousse)
    local EtatPlantation = NativeUI.CreateItem("Etat plantation", "")
    local PercentageItemEtatPlantation = NativeUI.CreatePercentagePanel("Pousse :", Pousse .. "%", "")
    menu:AddItem(EtatPlantation)
    EtatPlantation:AddPanel(PercentageItemEtatPlantation)
end

local function RammasserPousse(menu)
        local RamasserPousseItem = NativeUI.CreateItem("Ramasser vos plantations", "Ramasser vos plantations.")
        menu:AddItem(RamasserPousseItem)
        menu.OnItemSelect = function(menu, item)
        if item == RamasserPousseItem then
            
        end
    end
end

local function GestionHangarMenu(menu)
    local InstallNewObject = _menuPool:AddSubMenu(menu, "Nouvelle installation", "Changer l'installation du hangar.")
    InstallNewObject.Item:RightLabel(">>>")
    
    local InstallWeed = NativeUI.CreateItem("Hangar à weed", "Installer des plantations de weed dans votre\nhangar.")
    InstallNewObject.SubMenu:AddItem(InstallWeed)
    local InstallCokePlante = NativeUI.CreateItem("Hangar à coke (plantation)", "Installer des plantations de cocaïne dans votre hangar.")
    InstallNewObject.SubMenu:AddItem(InstallCokePlante)
    local InstallCokeTraitement = NativeUI.CreateItem("Hangar à coke (traitement)", "Installer un laboratoire de traitement de cocaïne dans votre hangar.")
    InstallNewObject.SubMenu:AddItem(InstallCokeTraitement)

    InstallNewObject.SubMenu.OnItemSelect = function(menu, item)
        if item == InstallWeed then
            if Equipement == 'weed' then
                AdvancedNotif('Initial V', '~r~Hangar', 'Vous avez déjà une installation de weed dans votre hangar.', 'CHAR_WE', 'INITIALV')
            else
                TriggerEvent('InitialCore:StartWeedChangementPetitHangar')
            end
        elseif item == InstallCokePlante then
            if Equipement == 'cokeplant' then
                AdvancedNotif('Initial V', '~r~Hangar', 'Vous avez déjà une plantation de cocaïne dans votre hangar.', 'CHAR_WE', 'INITIALV')
            end
        end
     end
end

RegisterNetEvent('InitialProperties:OpenGestionMenu')
AddEventHandler('InitialProperties:OpenGestionMenu', function(HangarID)
    TriggerServerEvent('InitialCore:RecupInfoHangar', HangarID)
    gestionhangarMenu:Clear()
    print(Equipement)
    print(Pousse)
    Wait(250)
    if Equipement == 'weed' or Equipement == 'cokeplant' then
        while Pousse == nil do
            Wait(10)
        end
        ProgressionHangarMenu(gestionhangarMenu, Pousse)
        if Pousse == '100' then
            RammasserPousse(gestionhangarMenu)
        end
    end
    GestionHangarMenu(gestionhangarMenu)
    _menuPool:RefreshIndex()
    gestionhangarMenu:Visible(not gestionhangarMenu:Visible())
end)

RegisterNetEvent('InitialCore:RecupInfoHangarC')
AddEventHandler('InitialCore:RecupInfoHangarC', function(Equipement2, Pousse2)
    Equipement = Equipement2
    Pousse = Pousse2
end)

-- DEV

function ShowNotification( text )
    SetNotificationTextEntry("STRING")
    AddTextComponentSubstringPlayerName(text)
    DrawNotification(false, false)
end

--[[RegisterCommand('car', function(source, args, rawCommand)
    local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 8.0, 0.5))
    local veh = args[1]
    if veh == nil then veh = "adder" end
    vehiclehash = GetHashKey(veh)
    RequestModel(vehiclehash)
    
    Citizen.CreateThread(function() 
        local waiting = 0
        while not HasModelLoaded(vehiclehash) do
            waiting = waiting + 100
            Citizen.Wait(100)
            if waiting > 5000 then
                ShowNotification("~r~Could not load the vehicle model in time, a crash was prevented.")
                break
            end
        end
        CreateVehicle(vehiclehash, x, y, z, GetEntityHeading(PlayerPedId())+90, 1, 0)
    end)
end)]]

RegisterCommand('TESTDEV', function(source, args, rawCommand)
    TriggerEvent('InitialCore:StartWeedChangementPetitHangar')
end)