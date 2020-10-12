local metier
local niveaumetier
local enService = false
local enCourse = 0

local SelectedCarPrev


local CurrentCheckPoint = 0
local lastcheckpoints = -1
local CurrentBlip           = nil

local finished = false


local CheckPoints = {

	{
        Pos = {x = -1321.90, y = 103.70, z = 56.61},
        Action = function()
        end
	},

	{
        Pos = {x = -1289.38, y = 100.21, z = 55.48}, 
        Action = function()
        end
	},

	{
        Pos = {x = -1255.31, y = 81.01, z = 53.12},
        Action = function()
        end
	},

	{
        Pos = {x = -1190.37, y = 44.31, z = 53.13},
        Action = function()
        end
	},

	{
        Pos = {x = -1137.55, y = 14.27, z = 49.45},
        Action = function()
        end
	},

	{
        Pos = {x = -1108.899, y = -27.48, z = 49.40},
        Action = function()
        end
	},

	{
        Pos = {x = -1070.73, y = -45.62, z = 47.88},
        Action = function()
        end
	},

	{
        Pos = {x = -1022.65, y = -77.48, z = 43.73},
        Action = function()
        end
	},

	{
        Pos = {x = -1025.51, y = -99.93, z = 42.35},
        Action = function()
        end
	},

	{
        Pos = {x = -1074.03, y = -80.16, z = 43.15},
        Action = function()
        end
	},
	
	{
        Pos = {x = -1125.19, y = -68.96, z = 43.67},
        Action = function()
        end
    },
    
    {
        Pos = {x = -1170.21, y = -81.83, z = 45.10},
        Action = function()
        end
    },
    
    {
        Pos = {x = -1195.55, y = -69.12, z = 44.82},
        Action = function()
        end
    },

    {
        Pos = {x = -1257.42, y = -33.4, z = 46.71},
        Action = function()
        end
    },

    {
        Pos = {x = -1274.20, y = 10.51, z = 49.22},
        Action = function()
        end
    },

    {
        Pos = {x = -1303.00, y = 62.22, z = 52.92},
        Action = function()
        end
    },

	{
        Pos = {x = -1341.389, y = 120.76, z = 54.36},
        Action = function()
            finished = true
        end
	},
}

local function RefreshBlipsMower()
    if DoesBlipExist(paysagisteBlip) then
        RemoveBlip(paysagisteBlip)
    end
    if metier == 'paysagiste' then
        paysagisteBlip = AddBlipForCoord(-1348.006, 120.53, 56.39)
        SetBlipSprite(paysagisteBlip, 650)
        SetBlipDisplay(paysagisteBlip, 4)
        SetBlipScale(paysagisteBlip, 0.75)
        SetBlipColour(paysagisteBlip, 25)
        SetBlipAsShortRange(paysagisteBlip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString("~y~Vestiaire Paysagiste")
        EndTextCommandSetBlipName(paysagisteBlip)
    end
end

RMenu.Add('vestiairemower', 'main',  RageUI.CreateMenu('Paysagiste', '~b~Actions paysagiste'))

RegisterNetEvent('InitialCore:LoadJob')
AddEventHandler('InitialCore:LoadJob', function(metier2, niveaumetier2)
    metier = metier2
    niveaumetier = niveaumetier2
    RefreshBlipsMower()
end)

CreateThread(function()
    RequestModel(GetHashKey("cs_davenorton"))
    while not HasModelLoaded(GetHashKey("cs_davenorton")) do
        Wait(200)
    end
    local dfevenortaon = CreatePed(5, GetHashKey("cs_davenorton"), -1348.006, 120.53, 55.49, 284.12, false, false)
    FreezeEntityPosition(dfevenortaon, true)
    SetEntityInvincible(dfevenortaon, true)
    SetBlockingOfNonTemporaryEvents(dfevenortaon, true)
end)

CreateThread(function()
    while true do
        Wait(1)       

            local plyCoords = GetEntityCoords(PlayerPedId())
            local dist2 = Vdist2(plyCoords.x, plyCoords.y, plyCoords.z, -1348.006, 120.53, 56.39)
 
            if dist2 <= 2.5 then
                if metier == 'paysagiste' then
                    HelpNotif("Appuyez sur ~INPUT_TALK~ pour interagir.")
                    if IsControlJustPressed(1,51) then
                        if enCourse == 0 then
                            RageUI.Visible(RMenu:Get('vestiairemower', 'main'), not RageUI.Visible(RMenu:Get('vestiairemower', 'main')))
                            if not InCam then
                                InCam = true
                                CamdeFDP = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", -1343.22, 126.52, 56.24, 2.71, 0.0, 10.0, 60.0, false, 0)
                                SetCamActive(CamdeFDP, true)
                                RenderScriptCams(true, true, 500, true, true)
                            end
                        elseif enCourse == 2 then
                            AdvancedNotif("Dave", "Merci !", "Voilà votre argent.", "CHAR_DAVE", "CHAR_DAVE")             
                            TriggerServerEvent('InitialCore:GiveMoney', PlayerPedId(), 50)
                            enCourse = 0
                        end
                    end
                end
            end

            while enCourse == 1 do
                Wait(0)
                local nextCheckPoint = CurrentCheckPoint + 1

                if nextCheckPoint == 18 then
                    AdvancedNotif("Initial V", "Bien !", "Allez voir Dave", "CHAR_WE", "INITIALV")
                    DeleteEntity(GetVehiclePedIsIn(PlayerPedId(), false))
                    if DoesBlipExist(CurrentBlip) then
                        RemoveBlip(CurrentBlip)
                    end
                    CurrentCheckPoint = 0
                    enCourse = 2
                    finished = true
                else
                    if CurrentCheckPoint ~= LastCheckPoint then
                        if DoesBlipExist(CurrentBlip) then
                            RemoveBlip(CurrentBlip)
                        end
                        CurrentBlip = AddBlipForCoord(CheckPoints[nextCheckPoint].Pos.x, CheckPoints[nextCheckPoint].Pos.y, CheckPoints[nextCheckPoint].Pos.z)
                        SetBlipRoute(CurrentBlip, 1)
    
                        LastCheckPoint = CurrentCheckPoint
                    end
                    
                    local distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), CheckPoints[nextCheckPoint].Pos.x, CheckPoints[nextCheckPoint].Pos.y, CheckPoints[nextCheckPoint].Pos.z, true)
    
                    if distance <= 90.0 then
                        DrawMarker(36, CheckPoints[nextCheckPoint].Pos.x, CheckPoints[nextCheckPoint].Pos.y, CheckPoints[nextCheckPoint].Pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.5, 1.5, 1.5, 102, 204, 102, 100, false, true, 2, false, false, false, false)
                    end
    
                    if distance <= 3.0 then
                        CheckPoints[nextCheckPoint].Action()
                        CurrentCheckPoint = CurrentCheckPoint + 1
                    end
                end                
            end


        RageUI.IsVisible(RMenu:Get('vestiairemower', 'main'), true, true, true, function()

            RageUI.Button("Véhicule de service", "Véhicule de service.", {}, true, function(_, Active, Selected)
                if Active and SelectedCarPrev ~= 2 then
                    SelectedCarPrev = 2
                    if DoesEntityExist(CarMower) then
                        DeleteEntity(CarMower)
                    end
                    while not HasModelLoaded(GetHashKey("Mower")) do
                        RequestModel(GetHashKey("Mower"))
                        Wait(200)
                    end
                    CarMower = CreateVehicle(GetHashKey("Mower"), -1344.12, 131.76, 56.23, 273.52, false)
                end
                if Selected then
                    if DoesEntityExist(CarMower) then
                        DeleteEntity(CarMower)
                    end
                    while not HasModelLoaded(GetHashKey("Mower")) do
                        RequestModel(GetHashKey("Mower"))
                        Wait(200)
                    end
                    local FinalMion = CreateVehicle(GetHashKey("Mower"), -1344.12, 131.76, 56.23, 273.52, true)
                    local Custom = {}
                    Custom.Moteur = 3
                    Custom.Turbo = true
                    SetVehicleCustom(FinalMion, Custom)
                    RageUI:CloseAll()
                    enCourse = 1
                    AdvancedNotif("Dave", "Bien !", "Prennez la tondeuse et tondez le terrian !", "CHAR_DAVE", "CHAR_DAVE")
                end 
            end)

        end)

        
        if not RageUI.Visible(RMenu:Get('vestiairemower', 'main')) and InCam then
            InCam = false
            SetCamActive(CamdeFDP, false)
            RenderScriptCams(false, true, 500, true, true)
            DestroyCam(CamdeFDP)
            CamdeFDP = nil
            if DoesEntityExist(CarMower) then
                DeleteEntity(CarMower)
            end
            SelectedCarPrev = nil
        end

    end
end)



