------------------------------------------------------------------------------
--
-- Ce travail est sous liscence:
-- Creative Commons Attribution-NonCommercial-NoDerivatives-NoDistribution 4.0 International License.
--
------------------------------------------------------------------------------

--local Var
local VarTemp = false
local Refresh = false
local CarC = {}
local InCarType = false

local Zone = {
    {
        ID = 1,
        Zone = {x = -327.73, y = -934.12, z = 31.08, Radius = 3800.0},
        Fourriere = {x = -280.970, y = -888.038, z = 31.318, Radius = 1.5, Type = 'fourriere'},
        FourriereSortie = {x= -292.275, y = -893.476, z = 31.080, h = 259.752},
		Prix = 1000,
		Entree  = {x = -279.25, y = -890.39, z = 30.08},
		--maxcar = 30,
    },
    {
        ID = 2,
        Zone = {x = 227.317, y = -780.575, z = 30.729, Radius = 400.0, Type = 'garage'},--1150
        Fourriere = {x = 213.583, y = -809.060, z = 31.014, Radius = 1.5, Type = 'fourriere'},
        FourriereSortie = {x= 227.416, y = -803.671, z = 30.576, h = 151.972},
		Prix = 1000,
		Entree  = {x = -279.25, y = -890.39, z = 30.08},
		--maxcar = 30,
	},
}

local function RefreshParking(PID)
    for k, v in pairs(CarC) do
        DeleteVehicle(v.HashID)
    end
    TriggerServerCallback('InitialCore:RefreshParking', function(veh)
        for k, v in pairs(veh) do
            local Coords = json.decode(v.Coords)
            RequestModel(GetHashKey(v.Vehicule))  
            while not HasModelLoaded(GetHashKey(v.Vehicule)) do
                Citizen.Wait(100)
            end
            CarC[k] = {}
            CarC[k].Coords = Coords
            CarC[k].Plaque = v.Plaque
            CarC[k].HashID = CreateVehicle(GetHashKey(v.Vehicule), Coords.x, Coords.y, Coords.z, Coords.h, false)
            SetEntityAsMissionEntity(CarC[k].HashID, true, false)
            SetVehicleHasBeenOwnedByPlayer(CarC[k].HashID, true)
            --SetVehicleNeedsToBeHotwired(CarC[k].HashID, false)
            FreezeEntityPosition(CarC[k].HashID, true)
            SetVehRadioStation(CarC[k].HashID, 'OFF')
            SetVehicleNumberPlateText(CarC[k].HashID, v.Plaque)
            local Custom = json.decode(v.Data)
            SetVehicleCustom(CarC[k].HashID, Custom)
            SetModelAsNoLongerNeeded(GetHashKey(v.Vehicule))
            --print(Coords.x)
        end
    end, PID)
end

RMenu.Add('parking', 'main', RageUI.CreateMenu("Parking", "~b~FOURRIERE"))

CreateThread(function()
    for k, v in pairs(Zone) do
		local tempBlip = AddBlipForCoord(v.Zone.x, v.Zone.y, v.Zone.z)
        SetBlipSprite(tempBlip, 523)
        SetBlipDisplay(tempBlip, 4)
        SetBlipScale(tempBlip, 0.7)
		SetBlipColour(tempBlip, 11)
		SetBlipAsShortRange(tempBlip, true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString("Parking public")
        EndTextCommandSetBlipName(tempBlip)
	end

    while true do
        Wait(1)
        local plyCoords = GetEntityCoords(GetPlayerPed(-1))
        for k, v in pairs(Zone) do
            local dist = Vdist2(plyCoords.x, plyCoords.y, plyCoords.z, v.Zone.x, v.Zone.y, v.Zone.z)
            local dist2 = Vdist2(plyCoords.x, plyCoords.y, plyCoords.z, v.Fourriere.x, v.Fourriere.y, v.Fourriere.z)
            if dist2 <= 1.5 then
                HelpNotif("Appuyez sur ~INPUT_PICKUP~ pour intéragir.")
                if IsControlJustPressed(1, 38) then
                    local VehVar
                    TriggerServerCallback('InitialCore:GetAllVeh', function(veh)
                        VehVar = veh
                    end)
                    RageUI.Visible(RMenu:Get('parking', 'main'), true)
                    local IsPakingFourriereOpened = true
                    while IsPakingFourriereOpened do
                        Wait(1)
                        if not RageUI.Visible(RMenu:Get('parking', 'main')) then
                            IsPakingFourriereOpened = false
                        end
                        RageUI.IsVisible(RMenu:Get('parking', 'main'), true, true, true, function()
                            RageUI.Separator('Véhicule disponible')
                            if not VehVar then
                                RageUI.Button("Aucun", "DESC", {}, true, function(_,_,Selected)
                                end)
                            else
                                for x, h in pairs(VehVar) do
                                    RageUI.Button(h.Vehicule, "DESC", { RightLabel = h.Plaque }, true, function(_,_,Selected)
                                        if Selected then
                                            RageUI.CloseAll()
                                            RequestModel(GetHashKey(h.Vehicule))  
                                            while not HasModelLoaded(GetHashKey(h.Vehicule)) do
                                                Citizen.Wait(100)
                                            end
                                            
                                            local tempVeh = CreateVehicle(GetHashKey(h.Vehicule), v.FourriereSortie.x, v.FourriereSortie.y, v.FourriereSortie.z, v.FourriereSortie.h, true)
                                            SetEntityAsMissionEntity(tempVeh, true, false)
                                            SetVehicleHasBeenOwnedByPlayer(tempVeh, true)
                                            SetVehicleNeedsToBeHotwired(tempVeh, false)
                                            SetVehRadioStation(tempVeh, 'OFF')
                                            SetVehicleNumberPlateText(tempVeh, h.Plaque)
                                            local Custom = json.decode(h.Data)
                                            --Custom.Couleur1 = 50
                                            SetVehicleCustom(tempVeh, Custom)
                                            SetModelAsNoLongerNeeded(GetHashKey(h.Vehicule))
                                        end
                                    end)
                                end
                            end
                        end)
                    end

                end
            end
            if dist <= v.Zone.Radius+2000.0 then
                if not Refresh then
                    Refresh = true
                    TriggerServerCallback('InitialCore:RefreshParking', function(veh)
                        for k, v in pairs(veh) do
                            print(v.Coords)
                            local Coords = json.decode(v.Coords)
                            RequestModel(GetHashKey(v.Vehicule))  
                            while not HasModelLoaded(GetHashKey(v.Vehicule)) do
                                Citizen.Wait(100)
                            end
                            CarC[k] = {}
                            CarC[k].Coords = Coords
                            CarC[k].Plaque = v.Plaque
                            CarC[k].HashID = CreateVehicle(GetHashKey(v.Vehicule), Coords.x, Coords.y, Coords.z, Coords.h, false)
                            SetEntityAsMissionEntity(CarC[k].HashID, true, false)
                            SetVehicleHasBeenOwnedByPlayer(CarC[k].HashID, true)
                            --SetVehicleNeedsToBeHotwired(CarC[k].HashID, false)
                            FreezeEntityPosition(CarC[k].HashID, true)
                            SetVehRadioStation(CarC[k].HashID, 'OFF')
                            SetVehicleNumberPlateText(CarC[k].HashID, v.Plaque)
                            local Custom = json.decode(v.Data)
                            SetVehicleCustom(CarC[k].HashID, Custom)
                            SetModelAsNoLongerNeeded(GetHashKey(v.Vehicule))
                            --print(Coords.x)
                        end
                    end, v.ID)
                end
                VarTemp = true
                if dist <= v.Zone.Radius then
                    --[[RageUI.Text({
                       message = "Zone parking",
                        time_display = 1
                    })]]
                    if IsPedInAnyVehicle(GetPlayerPed(-1), false) then
                        if InCarType then
                            if InCarType == "ar" then
                                HelpNotif("Appuyez sur ~INPUT_PICKUP~ pour valider l'emplacement de votre véhicule.")
                                if IsControlJustPressed(1, 38) then
                                    local VarPlaque = GetVehicleNumberPlateText(GetVehiclePedIsIn(GetPlayerPed(-1), false))
                                    TriggerServerCallback('InitialCore:CanStockVeh', function(CanEnterVeh)
                                        if CanEnterVeh then
                                            DoScreenFadeOut(1000)
                                            Wait(1000)
                                            local VehHID = GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsIn(GetPlayerPed(-1), false)))
                                            local x2, y2, z2 = table.unpack(GetEntityCoords(GetPlayerPed(-1)))
                                            local Pos = {x = x2, y = y2, z = z2, h = GetEntityHeading(GetPlayerPed(-1))}
                                            DeleteVehicle(GetVehiclePedIsIn(GetPlayerPed(-1), false))
                                            TriggerServerEvent('InitialCore:ChangeStatusVeh', "rentre", VarPlaque, v.ID, json.encode(Pos))

                                            Wait(500)

                                            RefreshParking(v.ID)
                                            InCarType = "as"
                                            --[[RequestModel(GetHashKey(VehHID))  
                                            while not HasModelLoaded(GetHashKey(VehHID)) do
                                                Citizen.Wait(100)
                                            end
                                            
                                            local tempVeh = CreateVehicle(GetHashKey(VehHID), Pos.x, Pos.y, Pos.z, Pos.h, false)
                                            SetEntityAsMissionEntity(tempVeh, true, false)
                                            SetVehicleHasBeenOwnedByPlayer(tempVeh, true)
                                            FreezeEntityPosition(tempVeh, true)
                                            SetVehicleNeedsToBeHotwired(tempVeh, false)
                                            SetVehRadioStation(tempVeh, 'OFF')
                                            SetVehicleNumberPlateText(tempVeh, VarPlaque)
                                            SetModelAsNoLongerNeeded(GetHashKey(VehHID))

                                            TaskWarpPedIntoVehicle(GetPlayerPed(-1), tempVeh, -1)]]
                                            
                                            --Wait(500)
                                            DoScreenFadeIn(1000)
                                        else
                                            AdvancedNotif('Initial V', 'Parking', 'Vous ne pouvez pas rentrer un véhicule qui n\'est pas à vous', 'CHAR_WE', 'INITIALV')
                                        end
                                    end, VarPlaque)
                                end
                            else
                                HelpNotif("Appuyez sur ~INPUT_PICKUP~ pour sortir votre véhicule.")
                                if IsControlJustPressed(1, 38) then
                                    DoScreenFadeOut(1000)
                                    Wait(1000)
                                    --local VehHID = GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsIn(GetPlayerPed(-1), false)))
                                    local VehHID = GetEntityModel(GetVehiclePedIsIn(GetPlayerPed(-1), false))
                                    local VarPlaque = GetVehicleNumberPlateText(GetVehiclePedIsIn(GetPlayerPed(-1), false))
                                    local Coords = GetEntityCoords(GetPlayerPed(-1))
                                    local Heading = GetEntityHeading(GetPlayerPed(-1))
                                    --print()
                                    DeleteVehicle(GetVehiclePedIsIn(GetPlayerPed(-1), false))

                                    TriggerServerCallback('InitialCore:GetVehData', function(data)
                                        RequestModel(VehHID)  
                                        while not HasModelLoaded(VehHID) do
                                            Citizen.Wait(100)
                                        end
                                        
                                        local tempVeh = CreateVehicle(VehHID, Coords.x, Coords.y, Coords.z, Heading, true)
                                        SetEntityAsMissionEntity(tempVeh, true, false)
                                        SetVehicleHasBeenOwnedByPlayer(tempVeh, true)
                                        SetVehicleNeedsToBeHotwired(tempVeh, false)
                                        SetVehRadioStation(tempVeh, 'OFF')
                                        SetVehicleNumberPlateText(tempVeh, VarPlaque)
                                       -- print(data)
                                        local Custom = json.decode(data)
                                        SetVehicleCustom(tempVeh, Custom)
                                        SetModelAsNoLongerNeeded(VehHID)

                                        TaskWarpPedIntoVehicle(GetPlayerPed(-1), tempVeh, -1)

                                        print(VarPlaque)

                                        TriggerServerEvent('InitialCore:ChangeStatusVeh', "sortir", VarPlaque)
                                        Wait(500)
                                        InCarType = "ar"
                                        DoScreenFadeIn(1000)
                                    end, VarPlaque)
                                end
                            end
                        else
                            local Valid = false
                            for k, v in pairs(CarC) do
                                if v.Plaque == GetVehicleNumberPlateText(GetVehiclePedIsIn(GetPlayerPed(-1), false)) then
                                    InCarType = "as"
                                    Valid = true
                                end
                            end
                            if not Valid then
                                InCarType = "ar"
                            end
                        end
                    else
                        if InCarType then
                            InCarType = false
                        end
                    end
                    --[[for k, v in pairs(CarC) do
                        DrawText3D(v.Coords.x, v.Coords.y, v.Coords.z+1.1, "Appuyez sur [E] dans le véhicule pour le sortir.", 2.0, 6)
                    end]]
                end
            end
        end
        if not VarTemp then
            Wait(5000)
            if Refresh then
                Refresh = false
                for k, v in pairs(CarC) do
                    DeleteVehicle(v.HashID)
                end
            end
        end
        VarTemp = false
    end
end)