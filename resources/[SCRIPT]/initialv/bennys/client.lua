CreateThread(function()
    local Blip = AddBlipForCoord(-211.993, -1324.225, 30.890)
    SetBlipSprite(Blip, 446)
    SetBlipDisplay(Blip, 4)
    SetBlipScale(Blip, 0.7)
    SetBlipColour(Blip, 0)
    SetBlipAsShortRange(Blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Benny's")
    EndTextCommandSetBlipName(Blip)
end)

local metier
local niveaumetier

RegisterNetEvent('InitialCore:LoadJob')
AddEventHandler('InitialCore:LoadJob', function(metier2, niveaumetier2)
    metier = metier2
    niveaumetier = niveaumetier2
    ReloadBennysPoint()
end)

local CarToCustom

function ReloadBennysPoint()
    while metier == 'bennys' do
        Wait(1)
        local dist = Vdist2(GetEntityCoords(GetPlayerPed(-1)), -205.626, -1314.99, 30.247)
        if dist <= 1500.0 then
            if dist <= 5.0 then
                local Ply = GetPlayerPed(-1)
                if IsPedSittingInAnyVehicle(Ply) then
                    local Veh = GetVehiclePedIsUsing(Ply)
                    if DoesEntityExist(Veh) and GetPedInVehicleSeat(Veh, -1) == Ply and (IsThisModelACar(GetEntityModel(Veh)) or IsThisModelABike(GetEntityModel(Veh))) then
                        --print(math.abs(GetEntityHeading(Veh)-359.792))
                        if math.abs(GetEntityHeading(Veh)-179.395) <= 90 and IsVehicleStopped(Veh) then
                            HelpNotif('Appuyez sur ~INPUT_PICKUP~ pour intéragir.')
                            if IsControlJustPressed(1, 38) then
                                TriggerServerCallback('InitialCore:BennysIsLock', function(IsLock)
                                    if not IsLock then
                                        TriggerServerEvent('InitialCore:BennysLock', true)
                                        SetPlayerControl(Ply, false, 256)

                                        CarToCustom = Veh

                                        SetEntityCoordsNoOffset(Veh, -205.626, -1314.99, 30.247)
                                        SetEntityHeading(Veh, 179.395)
                                        SetVehicleOnGroundProperly(Veh)
                                        SetVehicleLights(Veh, 2)
                                        SetVehicleInteriorlight(Veh, true)
                                       -- SetVehicleDoorsLocked(Veh, 0) -- ## 4
                                    --	SetPlayerInvincible(GetPlayerIndex(),true)
                                        SetEntityInvincible(Veh, true)
                                        SetVehRadioStation(Veh, "OFF")
                                        
                                        --gameplaycam = GetRenderingCam()
                                        --SetupInsideCam()
                                        --Citizen.Wait(50)
                                        
                                        --, y = , z = , heading = 37.082
                                        ---215.518, y = -1329.135, z = 30.89, heading = 329.092

                                        GarageCam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", -210.897, -1328.935, 31.5, -15.0, 0.0, 12.0, 50.00, false, 0)
                                        SetCamActive(GarageCam, true)
                                        RenderScriptCams(true, true, 4000, true, true) 

                                        TaskVehicleDriveToCoord(Ply, Veh, -212.368, -1325.486, 30.176, 3.0, 1.0, GetEntityModel(Veh), 16777216, 0.1, true)

                                        Wait(5500)

                                        --FreezeEntityPosition(Veh, true) -- ## 
                                        --SetEntityCollision(Veh, false, false) -- ## 
                                        SetPlayerControl(Ply, true)

                                        OpenMenuBennys()
                                    else
                                        AdvancedNotif('Benny\'s', 'Erreur', 'Quelqu\'un utilise déjà le Benny\'s', 'CHAR_WE', 'INITIALV')
                                    end
                                end)
                            end
                        end
                    end
                end
            end
        else
            Wait(3000)
        end
    end
end

local self = {
    Moteur = 1500,
    Turbo = 800,
    Frein = 200,
    Transmission = 1000
}

RMenu.Add('bennys', 'main', RageUI.CreateMenu("Benny's", "~b~MENU"))
RMenu.Add('bennys', 'moteur', RageUI.CreateSubMenu(RMenu:Get('bennys', 'main'), "Benny's", "~b~MOTEUR"))
RMenu.Add('bennys', 'turbo', RageUI.CreateSubMenu(RMenu:Get('bennys', 'main'), "Benny's", "~b~TURBO"))
RMenu.Add('bennys', 'frein', RageUI.CreateSubMenu(RMenu:Get('bennys', 'main'), "Benny's", "~b~FREIN"))
RMenu.Add('bennys', 'transmission', RageUI.CreateSubMenu(RMenu:Get('bennys', 'main'), "Benny's", "~b~TRANSMISSION"))
RMenu.Add('bennys', 'suspension', RageUI.CreateSubMenu(RMenu:Get('bennys', 'main'), "Benny's", "~b~SUSPENSION"))

RMenu.Add('bennys', 'couleur', RageUI.CreateSubMenu(RMenu:Get('bennys', 'main'), "Benny's", "~b~COULEUR"))
RMenu.Add('bennys', 'couleurprincipal', RageUI.CreateSubMenu(RMenu:Get('bennys', 'couleur'), "Benny's", "~b~COULEUR PRINCIPAL"))
RMenu.Add('bennys', 'couleursecondaire', RageUI.CreateSubMenu(RMenu:Get('bennys', 'couleur'), "Benny's", "~b~COULEUR SECONDAIRE"))

function OpenMenuBennys()
    local IsBennysMenuOpened = true
    RageUI.Visible(RMenu:Get('bennys', 'main'), true)
    while IsBennysMenuOpened do
        Wait(1)
        RageUI.IsVisible(RMenu:Get('bennys', 'main'), true, true, true, function()
            RageUI.Separator("Performances")

            RageUI.Button("Moteur", "DESC", {}, true, function(_, Active, Selected)
            end, RMenu:Get('bennys', 'moteur'))
            RageUI.Button("Turbo", "DESC", {}, true, function(_, Active, Selected)
            end, RMenu:Get('bennys', 'turbo'))
            RageUI.Button("Frein", "DESC", {}, true, function(_, Active, Selected)
            end, RMenu:Get('bennys', 'frein'))
            RageUI.Button("Transmission", "DESC", {}, true, function(_, Active, Selected)
            end, RMenu:Get('bennys', 'transmission'))
            RageUI.Button("Suspension", "DESC", {}, true, function(_, Active, Selected)
            end, RMenu:Get('bennys', 'suspension'))

            RageUI.Separator("Esthétique")

            RageUI.Button("Peinture", "DESC", {}, true, function(_, Active, Selected)
            end)
            --RageUI.Button("Suspension", "DESC", {}, true, function(_, Active, Selected)
            --end)
        end)

        RageUI.IsVisible(RMenu:Get('bennys', 'moteur'), true, true, true, function()
            for i = 1, GetNumVehicleMods(CarToCustom, 11)-1 do
                if GetVehicleMod(CarToCustom, 11) == i then
                    RageUI.Button("Moteur niveau " .. i, "DESC", { RightBadge = RageUI.BadgeStyle.Tick }, true, function(_, Active, Selected)
                    end)
                else
                    RageUI.Button("Moteur niveau " .. i, "DESC", { RightLabel = self.Moteur*i .. "$" }, true, function(_, Active, Selected)
                        if Selected then
                            SetVehicleModKit(CarToCustom, 0)
                            SetVehicleMod(CarToCustom, 11, i, false)
                        end
                    end)
                end
            end
        end)
        RageUI.IsVisible(RMenu:Get('bennys', 'turbo'), true, true, true, function()
            if IsToggleModOn(CarToCustom, 18) then
                RageUI.Button("Turbo", "DESC", { RightBadge = RageUI.BadgeStyle.Tick }, true, function(_, Active, Selected)
                end)
            else
                RageUI.Button("Turbo", "DESC", { RightLabel = self.Turbo .. "$" }, true, function(_, Active, Selected)
                    if Selected then
                        SetVehicleModKit(CarToCustom, 0)
                        ToggleVehicleMod(CarToCustom, 18, true)
                    end
                end)
            end
        end)
        RageUI.IsVisible(RMenu:Get('bennys', 'frein'), true, true, true, function()
            for i = 1, GetNumVehicleMods(CarToCustom, 12)-1 do
                if GetVehicleMod(CarToCustom, 12) == i then
                    RageUI.Button("Frein niveau " .. i, "DESC", { RightBadge = RageUI.BadgeStyle.Tick }, true, function(_, Active, Selected)
                    end)
                else
                    RageUI.Button("Frein niveau " .. i, "DESC", { RightLabel = self.Frein*i .. "$" }, true, function(_, Active, Selected)
                        if Selected then
                            SetVehicleModKit(CarToCustom, 0)
                            SetVehicleMod(CarToCustom, 12, i, false)
                        end
                    end)
                end
            end
        end)
        RageUI.IsVisible(RMenu:Get('bennys', 'transmission'), true, true, true, function()
            for i = 1, GetNumVehicleMods(CarToCustom, 13)-1 do
                if GetVehicleMod(CarToCustom, 13) == i then
                    RageUI.Button("Transmission niveau " .. i, "DESC", { RightBadge = RageUI.BadgeStyle.Tick }, true, function(_, Active, Selected)
                    end)
                else
                    RageUI.Button("Transmission niveau " .. i, "DESC", { RightLabel = self.Transmission*i .. "$" }, true, function(_, Active, Selected)
                        if Selected then
                            SetVehicleModKit(CarToCustom, 0)
                            SetVehicleMod(CarToCustom, 13, i, false)
                        end
                    end)
                end
            end
        end)
        RageUI.IsVisible(RMenu:Get('bennys', 'suspension'), true, true, true, function()
            for i = 1, GetNumVehicleMods(CarToCustom, 15)-1 do
                if GetVehicleMod(CarToCustom, 15) == i then
                    RageUI.Button("Suspension niveau " .. i, "DESC", { RightBadge = RageUI.BadgeStyle.Tick }, true, function(_, Active, Selected)
                    end)
                else
                    RageUI.Button("Suspension niveau " .. i, "DESC", {}, true, function(_, Active, Selected)
                        if Selected then
                            SetVehicleModKit(CarToCustom, 0)
                            SetVehicleMod(CarToCustom, 15, i, false)
                        end
                    end)
                end
            end
        end)
    end
end