------------------------------------------------------------------------------
--
-- Ce travail est sous liscence:
-- Creative Commons Attribution-NonCommercial-NoDerivatives-NoDistribution 4.0 International License.
--
------------------------------------------------------------------------------

local metier
local niveaumetier
local MenuPoliceOpen = false

local EnService = false

RegisterNetEvent('InitialCore:LoadJob')
AddEventHandler('InitialCore:LoadJob', function(metier2, niveaumetier2)
    metier = metier2
    niveaumetier = niveaumetier2
    ReloadPolicePoint()
end)

local PoliceZone = {
    --{x = 314.799, y = -601.648, z = 43.292, zone = "vestiaire"},
    {x = -1077.123, y = -842.172, z = 4.884, zone = "garage"} -- HEADING : 165.214
}
local WaitTime = 0
local InCam = false
local SelectedCarPrev

CreateThread(function()
    local Blip = AddBlipForCoord(-1089.866, -813.019, 19.035)
    SetBlipSprite(Blip, 60)
    SetBlipDisplay(Blip, 4)
    SetBlipScale(Blip, 0.7)
    SetBlipColour(Blip, 3)
    SetBlipAsShortRange(Blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Vespucci - Commissiariat de police")
    EndTextCommandSetBlipName(Blip)

    -- A ENLEVER

    local Blip = AddBlipForCoord(722.44, -1088.87, 22.19)
    SetBlipSprite(Blip, 402)
    SetBlipDisplay(Blip, 4)
    SetBlipScale(Blip, 0.7)
    SetBlipColour(Blip, 28)
    SetBlipAsShortRange(Blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("LS Repairs")
    EndTextCommandSetBlipName(Blip)

    local Blip = AddBlipForCoord(128.173, -1297.462, 29.269)
    SetBlipSprite(Blip, 121)
    SetBlipDisplay(Blip, 4)
    SetBlipScale(Blip, 0.7)
    SetBlipColour(Blip, 61)
    SetBlipAsShortRange(Blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Unicorn")
    EndTextCommandSetBlipName(Blip)

 --[[   local Blip = AddBlipForCoord(-832.780, -2350.912, 14.570)
    SetBlipSprite(Blip, 326)
    SetBlipDisplay(Blip, 4)
    SetBlipScale(Blip, 0.7)
    SetBlipColour(Blip, 69)
    SetBlipAsShortRange(Blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Touchdown Car Rentals")
    EndTextCommandSetBlipName(Blip)]]
end)

function ReloadPolicePoint()
    while metier == 'police' do
        Wait(1)
        for k, v in pairs(PoliceZone) do
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
                                GarageCam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", -1072.923, -847.103, 6.5, -25.0, 0.0, 75.0, 75.00, false, 0)
                                SetCamActive(GarageCam, true)
                                RenderScriptCams(true, true, 500, true, true) 
                            end
                            RageUI.Visible(RMenu:Get('police', 'garage'), true)
                            PoliceMenu()
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

RMenu.Add('police', 'main', RageUI.CreateMenu("Police", "~b~MENU"))
RMenu.Add('police', 'service', RageUI.CreateSubMenu(RMenu:Get('police', 'main'), "Police", "~b~PRISE DE SERVICE"))
RMenu.Add('police', 'interaction', RageUI.CreateSubMenu(RMenu:Get('police', 'main'), "Police", "~b~INTERACTION CITOYENS"))

RMenu.Add('police', 'garage', RageUI.CreateMenu("Police", "~b~GARAGE"))

function PoliceMenu()
    if MenuPoliceOpen then
        return
    end
    MenuPoliceOpen = true
    while MenuPoliceOpen do
        Wait(1)
        if not RageUI.Visible(RMenu:Get('police', 'garage')) and InCam then
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
        if not RageUI.Visible(RMenu:Get('police', 'main')) and not RageUI.Visible(RMenu:Get('police', 'interaction')) and not RageUI.Visible(RMenu:Get('police', 'garage')) and not RageUI.Visible(RMenu:Get('police', 'service')) then
            MenuPoliceOpen = false
        end
        RageUI.IsVisible(RMenu:Get('police', 'garage'), true, true, true, function()
            RageUI.Separator("Voiture de police")
            RageUI.Button("Voiture 1", "DESC", {}, true, function(_, Active, Selected)
                if Active and SelectedCarPrev ~= 1 then
                    SelectedCarPrev = 1
                    if DoesEntityExist(CarPrev) then
                        DeleteEntity(CarPrev)
                    end
                    while not HasModelLoaded(GetHashKey("police")) do
                        RequestModel(GetHashKey("police"))
                        Wait(100)
                    end
                    CarPrev = CreateVehicle(GetHashKey("police"), -1078.226, -845.158, 4.884, 215.464, false)
                end
                if Selected then
                    if DoesEntityExist(CarPrev) then
                        DeleteEntity(CarPrev)
                    end
                    while not HasModelLoaded(GetHashKey("police")) do
                        RequestModel(GetHashKey("police"))
                        Wait(100)
                    end
                    local FinalCar = CreateVehicle(GetHashKey("police"), -1078.226, -845.158, 4.884, 215.464, true)
                    RageUI:GoBack()
                end
            end)
            RageUI.Button("Voiture 2", "DESC", {}, true, function(_, Active, Selected)
                if Active and SelectedCarPrev ~= 2 then
                    SelectedCarPrev = 2
                    if DoesEntityExist(CarPrev) then
                        DeleteEntity(CarPrev)
                    end
                    while not HasModelLoaded(GetHashKey("police2")) do
                        RequestModel(GetHashKey("police2"))
                        Wait(100)
                    end
                    CarPrev = CreateVehicle(GetHashKey("police2"), -1078.226, -845.158, 4.884, 215.464, false)
                end
                if Selected then
                    if DoesEntityExist(CarPrev) then
                        DeleteEntity(CarPrev)
                    end
                    while not HasModelLoaded(GetHashKey("police2")) do
                        RequestModel(GetHashKey("police2"))
                        Wait(100)
                    end
                    local FinalCar = CreateVehicle(GetHashKey("police2"), -1078.226, -845.158, 4.884, 215.464, true)
                    RageUI:GoBack()
                end
            end)
            RageUI.Button("Voiture 3", "DESC", {}, true, function(_, Active, Selected)
                if Active and SelectedCarPrev ~= 3 then
                    SelectedCarPrev = 3
                    if DoesEntityExist(CarPrev) then
                        DeleteEntity(CarPrev)
                    end
                    while not HasModelLoaded(GetHashKey("police3")) do
                        RequestModel(GetHashKey("police3"))
                        Wait(100)
                    end
                    CarPrev = CreateVehicle(GetHashKey("police3"), -1078.226, -845.158, 4.884, 215.464, false)
                end
                if Selected then
                    if DoesEntityExist(CarPrev) then
                        DeleteEntity(CarPrev)
                    end
                    while not HasModelLoaded(GetHashKey("police3")) do
                        RequestModel(GetHashKey("police3"))
                        Wait(100)
                    end
                    local FinalCar = CreateVehicle(GetHashKey("police3"), -1078.226, -845.158, 4.884, 215.464, true)
                    RageUI:GoBack()
                end
            end)
            RageUI.Separator("4x4 de police")
            RageUI.Button("4x4 1", "DESC", {}, true, function(_, Active, Selected)
                if Active and SelectedCarPrev ~= 7 then
                    SelectedCarPrev = 7
                    if DoesEntityExist(CarPrev) then
                        DeleteEntity(CarPrev)
                    end
                    while not HasModelLoaded(GetHashKey("pscout")) do
                        RequestModel(GetHashKey("pscout"))
                        Wait(100)
                    end
                    CarPrev = CreateVehicle(GetHashKey("pscout"), -1078.226, -845.158, 4.884, 215.464, false)
                end
                if Selected then
                    if DoesEntityExist(CarPrev) then
                        DeleteEntity(CarPrev)
                    end
                    while not HasModelLoaded(GetHashKey("pscout")) do
                        RequestModel(GetHashKey("pscout"))
                        Wait(100)
                    end
                    local FinalCar = CreateVehicle(GetHashKey("pscout"), -1078.226, -845.158, 4.884, 215.464, true)
                    RageUI:GoBack()
                end
            end)
            RageUI.Separator("Banalisé de police")
            RageUI.Button("Banalisé 1", "DESC", {}, true, function(_, Active, Selected)
                if Active and SelectedCarPrev ~= 4 then
                    SelectedCarPrev = 4
                    if DoesEntityExist(CarPrev) then
                        DeleteEntity(CarPrev)
                    end
                    while not HasModelLoaded(GetHashKey("police4")) do
                        RequestModel(GetHashKey("police4"))
                        Wait(100)
                    end
                    CarPrev = CreateVehicle(GetHashKey("police4"), -1078.226, -845.158, 4.884, 215.464, false)
                end
                if Selected then
                    if DoesEntityExist(CarPrev) then
                        DeleteEntity(CarPrev)
                    end
                    while not HasModelLoaded(GetHashKey("police4")) do
                        RequestModel(GetHashKey("police4"))
                        Wait(100)
                    end
                    local FinalCar = CreateVehicle(GetHashKey("police4"), -1078.226, -845.158, 4.884, 215.464, true)
                    RageUI:GoBack()
                end
            end)
            RageUI.Button("Banalisé 2", "DESC", {}, true, function(_, Active, Selected)
                if Active and SelectedCarPrev ~= 5 then
                    SelectedCarPrev = 5
                    if DoesEntityExist(CarPrev) then
                        DeleteEntity(CarPrev)
                    end
                    while not HasModelLoaded(GetHashKey("polmerit2")) do
                        RequestModel(GetHashKey("polmerit2"))
                        Wait(100)
                    end
                    CarPrev = CreateVehicle(GetHashKey("polmerit2"), -1078.226, -845.158, 4.884, 215.464, false)
                end
                if Selected then
                    if DoesEntityExist(CarPrev) then
                        DeleteEntity(CarPrev)
                    end
                    while not HasModelLoaded(GetHashKey("polmerit2")) do
                        RequestModel(GetHashKey("polmerit2"))
                        Wait(100)
                    end
                    local FinalCar = CreateVehicle(GetHashKey("polmerit2"), -1078.226, -845.158, 4.884, 215.464, true)
                    RageUI:GoBack()
                end
            end)
            RageUI.Separator("Fourgon de police")
            RageUI.Button("Fourgon 1", "DESC", {}, true, function(_, Active, Selected)
                if Active and SelectedCarPrev ~= 6 then
                    SelectedCarPrev = 6
                    if DoesEntityExist(CarPrev) then
                        DeleteEntity(CarPrev)
                    end
                    while not HasModelLoaded(GetHashKey("polspeedo")) do
                        RequestModel(GetHashKey("polspeedo"))
                        Wait(100)
                    end
                    CarPrev = CreateVehicle(GetHashKey("polspeedo"), -1078.226, -845.158, 4.884, 215.464, false)
                end
                if Selected then
                    if DoesEntityExist(CarPrev) then
                        DeleteEntity(CarPrev)
                    end
                    while not HasModelLoaded(GetHashKey("polspeedo")) do
                        RequestModel(GetHashKey("polspeedo"))
                        Wait(100)
                    end
                    local FinalCar = CreateVehicle(GetHashKey("polspeedo"), -1078.226, -845.158, 4.884, 215.464, true)
                    RageUI:GoBack()
                end
            end)
        end)
        RageUI.IsVisible(RMenu:Get('police', 'main'), true, true, true, function()
            RageUI.Button("Prise de service", "DESC", { RightLabel = '>' }, true, function(_,_,Selected)
            end, RMenu:Get('police', 'service'))
            RageUI.Button("Intéraction avec un citoyen", "DESC", { RightLabel = '>' }, true, function(_,_,Selected)
            end, RMenu:Get('police', 'interaction'))
        end)
        RageUI.IsVisible(RMenu:Get('police', 'service'), true, true, true, function()
            RageUI.Checkbox("Service", "DESC", EnService, { Style = RageUI.CheckboxStyle.Tick }, function(Hovered, Selected, Active, Checked)
                if Selected and Checked ~= EnService then
                    EnService = Checked
                    if EnService then
                        AdvancedNotif('LSPD', 'Service', "Vous êtes en service, vous recevez désormais tous les appels.", 'CHAR_WE', 'LSPD')
                    else
                        AdvancedNotif('LSPD', 'Service', "Vous n'êtes plus en service, vous ne recevez plus les appels.", 'CHAR_WE', 'LSPD')
                    end
                end
            end)
        end)
        RageUI.IsVisible(RMenu:Get('police', 'interaction'), true, true, true, function()
            RageUI.Button("Fouiller la personne à proximité", "DESC", { RightLabel = '>' }, true, function(_,_,Selected)
                if Selected then
                    local PlyPed, PlyRadius = GetClosestPlayer()
                    if PlyRadius <= 1.5 then
                        TriggerEvent('InitInventaire:openPlayerInventory', GetPlayerServerId(PlyPed))
                    end
                end
            end)
        end)
    end
end

RegisterNetEvent('InitialCore:NotifPoliceC')
AddEventHandler('InitialCore:NotifPoliceC', function(header, sub, msg, isappel, appelid, coords)
    if metier == 'police' and EnService then
        AdvancedNotif(header, sub, msg, 'CHAR_WE', 'LSPD')
        if isappel then
            local TimerA = 0
            while TimerA <= 830 do
                Wait(1)
                TimerA = TimerA+1
                if IsControlJustPressed(1, 38) then
                    TimerA = 830
                    AdvancedNotif('LSPD', 'Appel', 'Vous avez accepté l\'appel, un point a été placée sur votre GPS.', 'CHAR_WE', 'LSPD')
                    TriggerServerEvent('InitialCore:RespondAppelPolice', appelid)
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

RegisterNetEvent('InitialCore:RespondAppelPoliceC')
AddEventHandler('InitialCore:RespondAppelPoliceC', function()
    AdvancedNotif('LSPD', 'Appel', 'Quelq\'un a pris votre appel.', 'CHAR_WE', 'LSPD')
end)