RMenu.Add('location', 'main', RageUI.CreateMenu("Location", "~b~VEHICULE"))

CreateThread(function()
   --[[ local LocBlip = AddBlipForCoord(-832.780, -2350.912, 14.570)
    SetBlipSprite(LocBlip, 408)
    SetBlipDisplay(LocBlip, 4)
    SetBlipScale(LocBlip, 0.7)
    SetBlipColour(LocBlip, 4)
    SetBlipAsShortRange(LocBlip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Job Center")
    EndTextCommandSetBlipName(LocBlip)]]

    local Blip = AddBlipForCoord(-832.780, -2350.912, 14.570)
    SetBlipSprite(Blip, 326)
    SetBlipDisplay(Blip, 4)
    SetBlipScale(Blip, 0.7)
    SetBlipColour(Blip, 69)
    SetBlipAsShortRange(Blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Touchdown Car Rentals")
    EndTextCommandSetBlipName(Blip)
end)

local InCam = false

local CarPrev

local SelectedCarPrev

CreateThread(function()
    while true do
        Wait(1)
        local VDistP = Vdist2(GetEntityCoords(GetPlayerPed(-1)), -832.780, -2350.912, 14.570)
        if VDistP < 500.0 then
            if VDistP < 10.0 then
                HelpNotif('Appuyez sur ~INPUT_PICKUP~ pour accéder au Job Center.')
                if IsControlJustPressed(1, 38) then
                    RageUI.Visible(RMenu:Get('location', 'main'), true)
                    InCam = true
                    GarageCam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", -819.734, -2347.636, 17.5, -25.0, 0.0, 100.0, 40.00, false, 0)
                    SetCamActive(GarageCam, true)
                    RenderScriptCams(true, true, 1500, true, true) 
                    local IsLocMenuOpen = true
                    while IsLocMenuOpen do
                        Wait(1)
                        if not RageUI.Visible(RMenu:Get('location', 'main')) then
                            IsLocMenuOpen = false
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
                        RageUI.IsVisible(RMenu:Get('location', 'main'), true, true, true, function()
                            ---826.104, -2349.091, 14.570
                            RageUI.Button("Chino", "DESC", { RightLabel = "100$" }, true, function(_, Active, Selected)
                                if Active and SelectedCarPrev ~= 1 then
                                    SelectedCarPrev = 1
                                    if DoesEntityExist(CarPrev) then
                                        DeleteEntity(CarPrev)
                                    end
                                    while not HasModelLoaded(GetHashKey("chino")) do
                                        RequestModel(GetHashKey("chino"))
                                        Wait(100)
                                    end
                                    CarPrev = CreateVehicle(GetHashKey("chino"), -826.104, -2349.091, 14.570, 241.0, false)
                                end
                                if Selected then
                                    TriggerServerCallback('InitialCore:getMoney', function(money)
                                        if money >= 100 then
                                            if DoesEntityExist(CarPrev) then
                                                DeleteEntity(CarPrev)
                                            end
                                            while not HasModelLoaded(GetHashKey("chino")) do
                                                RequestModel(GetHashKey("chino"))
                                                Wait(100)
                                            end
                                            local FinalCar = CreateVehicle(GetHashKey("chino"), -826.104, -2349.091, 14.570, 241.0, true)
                                            TriggerServerEvent('InitialCore:RemoveMoney', GetPlayerServerId(PlayerId()), 100)
                                            AdvancedNotif('Location', 'TCR', 'Vous avez loué un chino.', 'CHAR_WE', 'INITIALV')
                                            RageUI:GoBack()
                                        else
                                            AdvancedNotif("Location", "Erreur", "Vous n'avez pas assez d'argent.", "CHAR_WE", "INITIALV")
                                        end
                                    end)
                                end
                            end)
                            RageUI.Button("Zombie", "DESC", { RightLabel = "100$" }, true, function(_, Active, Selected)
                                if Active and SelectedCarPrev ~= 2 then
                                    SelectedCarPrev = 2
                                    if DoesEntityExist(CarPrev) then
                                        DeleteEntity(CarPrev)
                                    end
                                    while not HasModelLoaded(GetHashKey("zombiea")) do
                                        RequestModel(GetHashKey("zombiea"))
                                        Wait(100)
                                    end
                                    CarPrev = CreateVehicle(GetHashKey("zombiea"), -826.104, -2349.091, 14.570, 241.0, false)
                                end
                                if Selected then
                                    TriggerServerCallback('InitialCore:getMoney', function(money)
                                        if money >= 100 then
                                            if DoesEntityExist(CarPrev) then
                                                DeleteEntity(CarPrev)
                                            end
                                            while not HasModelLoaded(GetHashKey("zombiea")) do
                                                RequestModel(GetHashKey("zombiea"))
                                                Wait(100)
                                            end
                                            local FinalCar = CreateVehicle(GetHashKey("zombiea"), -826.104, -2349.091, 14.570, 241.0, true)
                                            TriggerServerEvent('InitialCore:RemoveMoney', GetPlayerServerId(PlayerId()), 100)
                                            AdvancedNotif('Location', 'TCR', 'Vous avez loué un zombie.', 'CHAR_WE', 'INITIALV')
                                            RageUI:GoBack()
                                        else
                                            AdvancedNotif("Location", "Erreur", "Vous n'avez pas assez d'argent.", "CHAR_WE", "INITIALV")
                                        end
                                    end)
                                end
                            end)
                            RageUI.Button("Blista", "DESC", { RightLabel = "100$" }, true, function(_, Active, Selected)
                                if Active and SelectedCarPrev ~= 3 then
                                    SelectedCarPrev = 3
                                    if DoesEntityExist(CarPrev) then
                                        DeleteEntity(CarPrev)
                                    end
                                    while not HasModelLoaded(GetHashKey("blista2")) do
                                        RequestModel(GetHashKey("blista2"))
                                        Wait(100)
                                    end
                                    CarPrev = CreateVehicle(GetHashKey("blista2"), -826.104, -2349.091, 14.570, 241.0, false)
                                end
                                if Selected then
                                    TriggerServerCallback('InitialCore:getMoney', function(money)
                                        if money >= 100 then
                                            if DoesEntityExist(CarPrev) then
                                                DeleteEntity(CarPrev)
                                            end
                                            while not HasModelLoaded(GetHashKey("blista2")) do
                                                RequestModel(GetHashKey("blista2"))
                                                Wait(100)
                                            end
                                            local FinalCar = CreateVehicle(GetHashKey("blista2"), -826.104, -2349.091, 14.570, 241.0, true)
                                            TriggerServerEvent('InitialCore:RemoveMoney', GetPlayerServerId(PlayerId()), 100)
                                            AdvancedNotif('Location', 'TCR', 'Vous avez loué une blista.', 'CHAR_WE', 'INITIALV')
                                            RageUI:GoBack()
                                        else
                                            AdvancedNotif("Location", "Erreur", "Vous n'avez pas assez d'argent.", "CHAR_WE", "INITIALV")
                                        end
                                    end)
                                end
                            end)
                            RageUI.Button("Baller", "DESC", { RightLabel = "100$" }, true, function(_, Active, Selected)
                                if Active and SelectedCarPrev ~= 4 then
                                    SelectedCarPrev = 4
                                    if DoesEntityExist(CarPrev) then
                                        DeleteEntity(CarPrev)
                                    end
                                    while not HasModelLoaded(GetHashKey("baller2")) do
                                        RequestModel(GetHashKey("baller2"))
                                        Wait(100)
                                    end
                                    CarPrev = CreateVehicle(GetHashKey("baller2"), -826.104, -2349.091, 14.570, 241.0, false)
                                end
                                if Selected then
                                    TriggerServerCallback('InitialCore:getMoney', function(money)
                                        if money >= 100 then
                                            if DoesEntityExist(CarPrev) then
                                                DeleteEntity(CarPrev)
                                            end
                                            while not HasModelLoaded(GetHashKey("baller2")) do
                                                RequestModel(GetHashKey("baller2"))
                                                Wait(100)
                                            end
                                            local FinalCar = CreateVehicle(GetHashKey("baller2"), -826.104, -2349.091, 14.570, 241.0, true)
                                            TriggerServerEvent('InitialCore:RemoveMoney', GetPlayerServerId(PlayerId()), 100)
                                            AdvancedNotif('Location', 'TCR', 'Vous avez loué un baller.', 'CHAR_WE', 'INITIALV')
                                            RageUI:GoBack()
                                        else
                                            AdvancedNotif("Location", "Erreur", "Vous n'avez pas assez d'argent.", "CHAR_WE", "INITIALV")
                                        end
                                    end)
                                end
                            end)
                        end)
                    end
                end
            end
        else
            Wait(5000)
        end
    end
end)