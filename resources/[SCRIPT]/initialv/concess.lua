------------------------------------------------------------------------------
--
-- Ce travail est sous liscence:
-- Creative Commons Attribution-NonCommercial-NoDerivatives-NoDistribution 4.0 International License.
--
------------------------------------------------------------------------------

local metier
local niveaumetier
local ConcessZone = {
    {x= -31.9732, y= -1113.8717, z= 26.4223, type= "bureau"},
    {x= -31.3015, y= -1106.4788, z= 26.4223, type= "bureau"},
    {x= -52.358, y= -1063.403, z= 27.645, type= "hangar1", name='Petit hangar'},
    {x= 197.934, y= -1005.717, z= -99.000, type= "sortiehangar1"},
    {x= -255.167, y= -2586.289, z= 6.0, type= "hangar2", name='Grand hangar'},
    {x= 404.837, y= -978.641, z= -99.004, type= "sortiehangar2"}
}
Citizen.CreateThread(function()
    local BlipConcessP = AddBlipForCoord(-44.325, -1097.196, 26.422)
    SetBlipSprite(BlipConcessP, 227)
    SetBlipDisplay(BlipConcessP, 4)
    SetBlipScale(BlipConcessP, 0.7)
    SetBlipColour(BlipConcessP, 4)
    SetBlipAsShortRange(BlipConcessP, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString('Concessionnaire')
    EndTextCommandSetBlipName(BlipConcessP)
end)
local function RefreshBlips()
    if DoesBlipExist(BlipConcess) then
        RemoveBlip(BlipConcess)
    end
    if metier == 'concessionnaire' then
        for k in pairs(ConcessZone) do
            if ConcessZone[k].name then
                local BlipConcess = AddBlipForCoord(ConcessZone[k].x, ConcessZone[k].y, ConcessZone[k].z)
                SetBlipSprite(BlipConcess, 357)
                SetBlipDisplay(BlipConcess, 4)
                SetBlipScale(BlipConcess, 0.7)
                SetBlipColour(BlipConcess, 4)
                SetBlipAsShortRange(BlipConcess, true)
                BeginTextCommandSetBlipName("STRING")
                AddTextComponentString(ConcessZone[k].name)
                EndTextCommandSetBlipName(BlipConcess)
            end
        end
    end
end
RegisterNetEvent('InitialCore:LoadJob')
AddEventHandler('InitialCore:LoadJob', function(metier2, niveaumetier2)
    metier = metier2
    niveaumetier = niveaumetier2
    RefreshBlips()
    RefreshConcessFunction()
end)

local LivraisonVoiture
local VoitureHangar
local LastIDVoiture
local LastNomVoiture
local LastStatusVoiture
local LastTimeLivraison
local LastInfoLivraison
--local ConcessMenuType
local MenuConcessOpen = false
local PlayersInArea

local ListEmployee
local LastEmployeeGes
local ListGrades

local InfoFacture = {}
InfoFacture.HashID = nil
InfoFacture.Entreprise = "Concessionnaire"
InfoFacture.Raison = nil
InfoFacture.NomPrenom = nil
InfoFacture.TypePaiement = nil
InfoFacture.MoyenPaiement = nil
InfoFacture.Montant = nil
InfoFacture.Paye = false

local ListTP = {"Espèces", "Carte Banquaire", "Virement Banquaire"}

local ConcessJSON2 = LoadResourceFile(GetCurrentResourceName(), "concess_voiture.json")
ConcessJSON = json.decode(ConcessJSON2)

local charset = {} do
    for c = 65, 90  do table.insert(charset, string.char(c)) end
end

local function randomString(length)
    if not length or length <= 0 then return '' end
    --math.randomseed(os.clock()^5)
    return randomString(length - 1) .. charset[math.random(1, #charset)]
end

TriggerEvent('instance:registerType', 'garageentrepise')
RegisterNetEvent('instance:onCreate')
AddEventHandler('instance:onCreate', function(instance)
    print(instance.data.property)
    --for k, v in pairs (instance) do
   --     print(k)
    --    print(v)
    --end
    if instance.type == 'garageentrepise' then
        TriggerEvent('instance:enter', instance)
    end
end)
--TriggerEvent('instance:create', 'garageentrepise', 'concessionnaire', {property = 'g_sousterrain_1', owner = GetPlayerServerId(PlayerId())})

function OpenMenuConcess()
    TriggerServerCallback("getInfoLivraisonConcess", function(LivraisonVoiture2)
        LivraisonVoiture = LivraisonVoiture2
        RageUI.Visible(RMenu:Get('concessionnaire', 'main'), true)
        --ConcessMenuType = 'main'
        MenuConcess()
    end)
end

local VoitureSpawnZone1 = {
    [1] = {x= 192.0, y= -998.5, z= -99.0, h = 180.0},
    [2] = {x= 194.5, y= -998.5, z= -99.0, h = 180.0},
    [3] = {x= 197.0, y= -998.5, z= -99.0, h = 180.0},
    [4] = {x= 199.5, y= -998.5, z= -99.0, h = 180.0},
    [5] = {x= 202.0, y= -998.5, z= -99.0, h = 180.0},
    [6] = {x= 204.5, y= -998.5, z= -99.0, h = 180.0}
}
local VoitureSpawnZone2 = {
    [1] = {x= 417.44003295898, y= -977.27398681641, z= -99.004180908203, h = 100.0},
    [2] = {x= 417.20162963867, y= -971.05773925781, z= -99.004104614258, h = 100.0},
    [3] = {x= 417.32943725586, y= -964.93609619141, z= -99.004112243652, h = 100.0},
    [4] = {x= 417.28897094727, y= -958.65295410156, z= -99.004188537598, h = 100.0},
    [5] = {x= 417.39959716797, y= -952.31964111328, z= -99.004104614258, h = 100.0},
    [6] = {x= 417.57656860352, y= -945.96051025391, z= -99.004180908203, h = 100.0},
    [7] = {x= 417.29925537109, y= -939.99365234375, z= -99.004104614258, h = 100.0},
    [8] = {x= 409.36587524414, y= -971.26440429688, z= -99.004112243652, h = 100.0},
    [9] = {x= 409.75225830078, y= -964.80236816406, z= -99.004112243652, h = 100.0},
    [10] = {x= 409.69305419922, y= -958.85180664063, z= -99.004112243652, h = 100.0},
    [11] = {x= 409.70031738281, y= -952.28820800781, z= -99.004112243652, h = 100.0},
    [12] = {x= 409.66958618164, y= -945.95391845703, z= -99.004112243652, h = 100.0},
    [13] = {x= 409.84829711914, y= -939.96112060547, z= -99.004112243652, h = 100.0},
    [14] = {x= 400.47384643555, y= -971.07769775391, z= -99.004173278809, h = 260.0},
    [15] = {x= 400.44287109375, y= -965.20977783203, z= -99.004173278809, h = 260.0},
    [16] = {x= 400.44281005859, y= -958.62738037109, z= -99.004173278809, h = 260.0},
    [17] = {x= 400.61782836914, y= -952.63427734375, z= -99.004173278809, h = 260.0},
    [18] = {x= 400.41256713867, y= -946.32202148438, z= -99.004173278809, h = 260.0},
    [19] = {x= 400.61724853516, y= -940.21557617188, z= -99.004173278809, h = 260.0},
    [20] = {x= 392.01538085938, y= -971.28796386719, z= -99.004119873047, h = 260.0},
    [21] = {x= 391.79998779297, y= -965.14611816406, z= -99.004119873047, h = 260.0},
    [22] = {x= 391.89538574219, y= -958.66882324219, z= -99.004119873047, h = 260.0},
    [23] = {x= 391.66519165039, y= -952.42828369141, z= -99.004119873047, h = 260.0},
    [24] = {x= 391.9430847168, y= -946.3203125, z= -99.004119873047, h = 260.0},
    [25] = {x= 391.91217041016, y= -940.21826171875, z= -99.004119873047, h = 260.0}
}

--function PoliceJob() -- ##
function RefreshConcessFunction()
    --DoScreenFadeIn(1000)
    --while metier == 'police' do -- ##
    while metier == 'concessionnaire' do
        Citizen.Wait(1)
        ConcessZoneShopTemp = 0
        local distatest = 1.5
        local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)

        for k in pairs(ConcessZone) do
            local dist = Vdist2(plyCoords.x, plyCoords.y, plyCoords.z, ConcessZone[k].x, ConcessZone[k].y, ConcessZone[k].z)
            --print(dist)
            if dist <= distatest then
                ConcessZoneShopTemp = 0
                if dist > 500.0 then
                    ConcessZoneShopTemp = 1
                end
                HelpNotif("Appuyez sur ~INPUT_TALK~ pour interagir.")
                if IsControlJustPressed(1, 51) then
                    --if ConcessZone[k].type == 'vestiaire' and not MenuPoliceOpen then -- ##
                    if ConcessZone[k].type == 'bureau' then
                        OpenMenuConcess()
                    elseif ConcessZone[k].type == 'hangar1' then
                        --SetEntityCoords(PlayerPedId(), 197.934, -1005.716, -99.000, 0.0, 0.0, 0.0, true)
                        --[[TriggerServerCallback("getInfoHangarConcess", function(VoitureHangar2)
                            VoitureHangar = VoitureHangar2
                            RageUI.Visible(RMenu:Get('concessionnaire', 'hangar'), true)
                            ConcessMenuType = ConcessZone[k].type
                            MenuConcess()
                        end, 1)]]
                        local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)
                        if vehicle ~= 0 then
                            local a, b = GetVehicleNumberPlateText(vehicle):gsub("%s+", "")
                            TriggerServerCallback("getStatusVehicle", function(StatusVehicle, HangarVehicle)
                                --print(Nombre)
                                --print(IsVehicleSorti .. "--------------ccasssss")
                                if StatusVehicle == 'invalid' then
                                    AdvancedNotif('Concessionnaire', 'Hangar', 'Ceci n\'est pas votre véhicule.', 'CHAR_WE', 'INITIALV')
                                else
                                    if HangarVehicle == 1 then
                                        TriggerServerEvent('InitialCore:ChangeStatusHangar', a, 'range')
                                            --RageUI.Visible(RMenu:Get('concessionnaire', 'hangar'), true)
                                            --ConcessMenuType = ConcessZone[k].type
                                            --MenuConcess()
                                        Wait(100)
                                        TriggerServerCallback("getInfoHangarConcess", function(VoitureHangar2)
                                            TriggerEvent('instance:create', 'garageentrepise', 'concessionnaire', {property = 'g_sousterrain_1', owner = GetPlayerServerId(PlayerId())})
                                            DoScreenFadeOut(1000)
                                            Wait(1000)
                                            DeleteVehicle(vehicle)
                                            SetEntityCoords(PlayerPedId(), 197.934, -1005.716, -99.000, 0.0, 0.0, 0.0, true)
                                            Wait(500)
                                            VoitureHangar = VoitureHangar2
                                            for k, v in pairs (VoitureHangar) do
                                                if v.Status == 'range' then
                                                    if DoesEntityExist(VoitureHangar[k].HashVoiture) then
                                                        SetEntityAsMissionEntity(VoitureHangar[k].HashVoiture, false, true)
                                                        DeleteVehicle(VoitureHangar[k].HashVoiture)
                                                    end
                                                    RequestModel(GetHashKey(VoitureHangar[k].Voiture))  
                                                    while not HasModelLoaded(GetHashKey(VoitureHangar[k].Voiture)) do
                                                        Citizen.Wait(100)
                                                        print(VoitureHangar[k].Voiture)
                                                    end
                                                    VoitureHangar[k].HashVoiture = CreateVehicle(GetHashKey(VoitureHangar[k].Voiture), VoitureSpawnZone1[k].x, VoitureSpawnZone1[k].y, VoitureSpawnZone1[k].z, VoitureSpawnZone1[k].h, false, false)
                                                    SetVehicleColours(VoitureHangar[k].HashVoiture, 0, 0)
                                                    SetEntityAsMissionEntity(VoitureHangar[k].HashVoiture, true, false)
                                                    SetVehicleHasBeenOwnedByPlayer(VoitureHangar[k].HashVoiture, true)
                                                    SetVehicleNeedsToBeHotwired(VoitureHangar[k].HashVoiture, false)
                                                    SetVehRadioStation(VoitureHangar[k].HashVoiture, 'OFF')
                                                    SetVehicleNumberPlateText(VoitureHangar[k].HashVoiture, v.TempPlaque or v.ID)
                                                    SetModelAsNoLongerNeeded(GetHashKey(VoitureHangar[k].Voiture))
                                                end
                                            end
                                            DoScreenFadeIn(1000)
                                        end, 1)
                                    elseif HangarVehicle == 2 then
                                            --RageUI.Visible(RMenu:Get('concessionnaire', 'hangar'), true)
                                            --ConcessMenuType = ConcessZone[k].type
                                            --MenuConcess()
                                        --Wait(100)
                                        TriggerServerCallback("getInfoHangarConcess", function(VoitureHangar2)
                                            if #VoitureHangar2 < 6 then
                                                TriggerServerEvent('InitialCore:ChangeStatusAndChooseHangar', a, 'range', 1)
                                                Wait(100)
                                                TriggerServerCallback("getInfoHangarConcess", function(VoitureHangar2)
                                                    TriggerEvent('instance:create', 'garageentrepise', 'concessionnaire', {property = 'g_sousterrain_1', owner = GetPlayerServerId(PlayerId())})
                                                    DoScreenFadeOut(1000)
                                                    Wait(1000)
                                                    DeleteVehicle(vehicle)
                                                    SetEntityCoords(PlayerPedId(), 197.934, -1005.716, -99.000, 0.0, 0.0, 0.0, true)
                                                    Wait(500)
                                                    VoitureHangar = VoitureHangar2
                                                    for k, v in pairs (VoitureHangar) do
                                                        if v.Status == 'range' then
                                                            if DoesEntityExist(VoitureHangar[k].HashVoiture) then
                                                                SetEntityAsMissionEntity(VoitureHangar[k].HashVoiture, false, true)
                                                                DeleteVehicle(VoitureHangar[k].HashVoiture)
                                                            end
                                                            RequestModel(GetHashKey(VoitureHangar[k].Voiture))  
                                                            while not HasModelLoaded(GetHashKey(VoitureHangar[k].Voiture)) do
                                                                Citizen.Wait(100)
                                                                print(VoitureHangar[k].Voiture)
                                                            end
                                                            VoitureHangar[k].HashVoiture = CreateVehicle(GetHashKey(VoitureHangar[k].Voiture), VoitureSpawnZone1[k].x, VoitureSpawnZone1[k].y, VoitureSpawnZone1[k].z, VoitureSpawnZone1[k].h, false, false)
                                                            SetVehicleColours(VoitureHangar[k].HashVoiture, 0, 0)
                                                            SetEntityAsMissionEntity(VoitureHangar[k].HashVoiture, true, false)
                                                            SetVehicleHasBeenOwnedByPlayer(VoitureHangar[k].HashVoiture, true)
                                                            SetVehicleNeedsToBeHotwired(VoitureHangar[k].HashVoiture, false)
                                                            SetVehRadioStation(VoitureHangar[k].HashVoiture, 'OFF')
                                                            SetVehicleNumberPlateText(VoitureHangar[k].HashVoiture, v.TempPlaque or v.ID)
                                                            SetModelAsNoLongerNeeded(GetHashKey(VoitureHangar[k].Voiture))
                                                        end
                                                    end
                                                    DoScreenFadeIn(1000)
                                                end, 1)
                                            else
                                                AdvancedNotif('Concessionnaire', 'Hangar', 'Votre hangar est plein.', 'CHAR_WE', 'INITIALV')
                                            end
                                        end, 1)
                                    end
                                end
                            end, a)
                        else
                            TriggerServerCallback("getInfoHangarConcess", function(VoitureHangar2)
                                TriggerEvent('instance:create', 'garageentrepise', 'concessionnaire', {property = 'g_sousterrain_1', owner = GetPlayerServerId(PlayerId())})
                                DoScreenFadeOut(1000)
                                Wait(1000)
                                SetEntityCoords(PlayerPedId(), 197.934, -1005.716, -99.000, 0.0, 0.0, 0.0, true)
                                Wait(500)
                                VoitureHangar = VoitureHangar2
                                for k, v in pairs (VoitureHangar) do
                                    if v.Status == 'range' then
                                        if DoesEntityExist(VoitureHangar[k].HashVoiture) then
                                            SetEntityAsMissionEntity(VoitureHangar[k].HashVoiture, false, true)
                                            DeleteVehicle(VoitureHangar[k].HashVoiture)
                                        end
                                        RequestModel(GetHashKey(VoitureHangar[k].Voiture))  
                                        while not HasModelLoaded(GetHashKey(VoitureHangar[k].Voiture)) do
                                            Citizen.Wait(100)
                                            print(VoitureHangar[k].Voiture)
                                        end
                                        VoitureHangar[k].HashVoiture = CreateVehicle(GetHashKey(VoitureHangar[k].Voiture), VoitureSpawnZone1[k].x, VoitureSpawnZone1[k].y, VoitureSpawnZone1[k].z, VoitureSpawnZone1[k].h, false, false)
                                        SetVehicleColours(VoitureHangar[k].HashVoiture, 0, 0)
                                        SetEntityAsMissionEntity(VoitureHangar[k].HashVoiture, true, false)
                                        SetVehicleHasBeenOwnedByPlayer(VoitureHangar[k].HashVoiture, true)
                                        SetVehicleNeedsToBeHotwired(VoitureHangar[k].HashVoiture, false)
                                        SetVehRadioStation(VoitureHangar[k].HashVoiture, 'OFF')
                                        SetVehicleNumberPlateText(VoitureHangar[k].HashVoiture, v.TempPlaque or v.ID)
                                        SetModelAsNoLongerNeeded(GetHashKey(VoitureHangar[k].Voiture))
                                    end
                                end
                                DoScreenFadeIn(1000)
                            end, 1)
                        end
                    elseif ConcessZone[k].type == 'sortiehangar1' then
                        --SetEntityCoords(PlayerPedId(), -52.358, -1063.403, 27.645, 0.0, 0.0, 0.0, true)
                        local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)
                        local a, b
                        local VehicleModel
                        local VehicleNameLabel
                        DoScreenFadeOut(1000)
                        Wait(1000)
                        TriggerEvent('instance:leave')
                        SetPedCoordsKeepVehicle(PlayerPedId(), -52.358, -1063.403, 27.645-0.98)
                        Wait(500)
                        if vehicle ~= 0 then
                            a, b = GetVehicleNumberPlateText(vehicle):gsub("%s+", "")
                            TriggerServerEvent('InitialCore:ChangeStatusHangar', a, 'sorti')
                            VehicleModel = GetEntityModel(vehicle)
                            --print(VehicleModel)
                            --VehicleNameLabel = GetDisplayNameFromVehicleModel(VehicleModel)
                            RequestModel(VehicleModel)
                            while not HasModelLoaded(VehicleModel) do
                                print(VehicleNameLabel)
                                Citizen.Wait(100)
                            end
                            --Wait(500)
                            local vehicle = CreateVehicle(VehicleModel, -52.358, -1063.403, 27.645-0.98, 90.0, true, false)
                            SetVehicleColours(vehicle, 0, 0)
                            --TaskEnterVehicle(GetPlayerPed(-1), vehicle, 20000,-1, 1.5, 16, 0)
                            --Wait(500)
                            SetEntityAsMissionEntity(vehicle, true, false)
                            SetVehicleHasBeenOwnedByPlayer(vehicle, true)
                            SetVehicleNeedsToBeHotwired(vehicle, false)
                            SetVehRadioStation(vehicle, 'OFF')
                            SetVehicleNumberPlateText(vehicle, a)
                            --TaskEnterVehicle(GetPlayerPed(-1), vehicle, 20000,-1, 1.5, 16, 0)
                            SetModelAsNoLongerNeeded(VehicleModel)
                           -- Wait(500)
                            --Wait(500)
                        end
                        DoScreenFadeIn(1000)
                        if VoitureHangar then
                            for k, v in pairs (VoitureHangar) do
                                if DoesEntityExist(VoitureHangar[k].HashVoiture) and VoitureHangar[k].ID then
                                    SetEntityAsMissionEntity(VoitureHangar[k].HashVoiture, false, true)
                                    DeleteVehicle(VoitureHangar[k].HashVoiture)
                                end
                            end
                        end
                    elseif ConcessZone[k].type == 'hangar2' then
                        --print('1')


                        --[[local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)
                        if vehicle ~= 0 then
                            local a, b = GetVehicleNumberPlateText(vehicle):gsub("%s+", "")
                            TriggerServerCallback("getStatusVehicle", function(StatusVehicle)
                                --print(IsVehicleSorti .. "--------------ccasssss")
                                if StatusVehicle == 'invalid' then
                                    AdvancedNotif('Concessionnaire', 'Hangar', 'Ceci n\'est pas votre véhicule.', 'CHAR_WE', 'INITIALV')
                                else
                                    TriggerServerEvent('InitialCore:ChangeStatusHangar', a, 'range')
                                        --RageUI.Visible(RMenu:Get('concessionnaire', 'hangar'), true)
                                        --ConcessMenuType = ConcessZone[k].type
                                        --MenuConcess()
                                    Wait(100)
                                    TriggerServerCallback("getInfoHangarConcess", function(VoitureHangar2)
                                        TriggerEvent('instance:create', 'garageentrepise', 'concessionnaire', {property = 'g_sousterrain_1', owner = GetPlayerServerId(PlayerId())})
                                        DoScreenFadeOut(1000)
                                        Wait(1000)
                                        DeleteVehicle(vehicle)
                                        SetEntityCoords(PlayerPedId(), 404.837, -978.641, -99.004-0.98, 0.0, 0.0, 0.0, true)
                                        Wait(500)
                                        VoitureHangar = VoitureHangar2
                                        for k, v in pairs (VoitureHangar) do
                                            if v.Status == 'range' then
                                                if DoesEntityExist(VoitureHangar[k].HashVoiture) then
                                                    SetEntityAsMissionEntity(VoitureHangar[k].HashVoiture, false, true)
                                                    DeleteVehicle(VoitureHangar[k].HashVoiture)
                                                end
                                                RequestModel(GetHashKey(VoitureHangar[k].Voiture))  
                                                while not HasModelLoaded(GetHashKey(VoitureHangar[k].Voiture)) do
                                                    Citizen.Wait(100)
                                                    print(VoitureHangar[k].Voiture)
                                                end
                                                VoitureHangar[k].HashVoiture = CreateVehicle(GetHashKey(VoitureHangar[k].Voiture), VoitureSpawnZone2[k].x, VoitureSpawnZone2[k].y, VoitureSpawnZone2[k].z, VoitureSpawnZone2[k].h, false, false)
                                                SetEntityAsMissionEntity(VoitureHangar[k].HashVoiture, true, false)
                                                SetVehicleHasBeenOwnedByPlayer(VoitureHangar[k].HashVoiture, true)
                                                SetVehicleNeedsToBeHotwired(VoitureHangar[k].HashVoiture, false)
                                                SetVehRadioStation(VoitureHangar[k].HashVoiture, 'OFF')
                                                SetVehicleNumberPlateText(VoitureHangar[k].HashVoiture, v.ID)
                                                SetModelAsNoLongerNeeded(GetHashKey(VoitureHangar[k].Voiture))
                                            end
                                        end
                                        DoScreenFadeIn(1000)
                                    end, 2)
                                end
                            end, a)
                        else
                            TriggerServerCallback("getInfoHangarConcess", function(VoitureHangar2)
                                TriggerEvent('instance:create', 'garageentrepise', 'concessionnaire', {property = 'g_sousterrain_1', owner = GetPlayerServerId(PlayerId())})
                                DoScreenFadeOut(1000)
                                Wait(1000)
                                SetEntityCoords(PlayerPedId(), 404.837, -978.641, -99.004-0.98, 0.0, 0.0, 0.0, true)
                                Wait(500)
                                VoitureHangar = VoitureHangar2
                                for k, v in pairs (VoitureHangar) do
                                    if v.Status == 'range' then
                                        if DoesEntityExist(VoitureHangar[k].HashVoiture) then
                                            SetEntityAsMissionEntity(VoitureHangar[k].HashVoiture, false, true)
                                            DeleteVehicle(VoitureHangar[k].HashVoiture)
                                        end
                                        RequestModel(GetHashKey(VoitureHangar[k].Voiture))  
                                        while not HasModelLoaded(GetHashKey(VoitureHangar[k].Voiture)) do
                                            Citizen.Wait(100)
                                            print(VoitureHangar[k].Voiture)
                                        end
                                        VoitureHangar[k].HashVoiture = CreateVehicle(GetHashKey(VoitureHangar[k].Voiture), VoitureSpawnZone2[k].x, VoitureSpawnZone2[k].y, VoitureSpawnZone2[k].z, VoitureSpawnZone2[k].h, false, false)
                                        SetEntityAsMissionEntity(VoitureHangar[k].HashVoiture, true, false)
                                        SetVehicleHasBeenOwnedByPlayer(VoitureHangar[k].HashVoiture, true)
                                        SetVehicleNeedsToBeHotwired(VoitureHangar[k].HashVoiture, false)
                                        SetVehRadioStation(VoitureHangar[k].HashVoiture, 'OFF')
                                        SetVehicleNumberPlateText(VoitureHangar[k].HashVoiture, v.ID)
                                        SetModelAsNoLongerNeeded(GetHashKey(VoitureHangar[k].Voiture))
                                    end
                                end
                                DoScreenFadeIn(1000)
                            end, 2)
                        end]]


                        local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)
                        if vehicle ~= 0 then
                            local a, b = GetVehicleNumberPlateText(vehicle):gsub("%s+", "")
                            TriggerServerCallback("getStatusVehicle", function(StatusVehicle, HangarVehicle)
                                --print(Nombre)
                                --print(IsVehicleSorti .. "--------------ccasssss")
                                --print(HangarVehicle)
                                if StatusVehicle == 'invalid' then
                                    AdvancedNotif('Concessionnaire', 'Hangar', 'Ceci n\'est pas votre véhicule.', 'CHAR_WE', 'INITIALV')
                                else
                                    if HangarVehicle == 2 then
                                        TriggerServerEvent('InitialCore:ChangeStatusHangar', a, 'range')
                                            --RageUI.Visible(RMenu:Get('concessionnaire', 'hangar'), true)
                                            --ConcessMenuType = ConcessZone[k].type
                                            --MenuConcess()
                                        Wait(100)
                                        TriggerServerCallback("getInfoHangarConcess", function(VoitureHangar2)
                                            TriggerEvent('instance:create', 'garageentrepise', 'concessionnaire', {property = 'g_sousterrain_1', owner = GetPlayerServerId(PlayerId())})
                                            DoScreenFadeOut(1000)
                                            Wait(1000)
                                            DeleteVehicle(vehicle)
                                            SetEntityCoords(PlayerPedId(), 404.837, -978.641, -99.004-0.98, 0.0, 0.0, 0.0, true)
                                            Wait(500)
                                            VoitureHangar = VoitureHangar2
                                            for k, v in pairs (VoitureHangar) do
                                                if v.Status == 'range' then
                                                    if DoesEntityExist(VoitureHangar[k].HashVoiture) then
                                                        SetEntityAsMissionEntity(VoitureHangar[k].HashVoiture, false, true)
                                                        DeleteVehicle(VoitureHangar[k].HashVoiture)
                                                    end
                                                    RequestModel(GetHashKey(VoitureHangar[k].Voiture))  
                                                    while not HasModelLoaded(GetHashKey(VoitureHangar[k].Voiture)) do
                                                        Citizen.Wait(100)
                                                        print(VoitureHangar[k].Voiture)
                                                    end
                                                    VoitureHangar[k].HashVoiture = CreateVehicle(GetHashKey(VoitureHangar[k].Voiture), VoitureSpawnZone2[k].x, VoitureSpawnZone2[k].y, VoitureSpawnZone2[k].z, VoitureSpawnZone2[k].h, false, false)
                                                    SetVehicleColours(VoitureHangar[k].HashVoiture, 0, 0)
                                                    SetEntityAsMissionEntity(VoitureHangar[k].HashVoiture, true, false)
                                                    SetVehicleHasBeenOwnedByPlayer(VoitureHangar[k].HashVoiture, true)
                                                    SetVehicleNeedsToBeHotwired(VoitureHangar[k].HashVoiture, false)
                                                    SetVehRadioStation(VoitureHangar[k].HashVoiture, 'OFF')
                                                    SetVehicleNumberPlateText(VoitureHangar[k].HashVoiture, v.TempPlaque or v.ID)
                                                    SetModelAsNoLongerNeeded(GetHashKey(VoitureHangar[k].Voiture))
                                                end
                                            end
                                            DoScreenFadeIn(1000)
                                        end, 2)
                                    elseif HangarVehicle == 1 then
                                            --RageUI.Visible(RMenu:Get('concessionnaire', 'hangar'), true)
                                            --ConcessMenuType = ConcessZone[k].type
                                            --MenuConcess()
                                        --Wait(100)
                                        TriggerServerCallback("getInfoHangarConcess", function(VoitureHangar2)
                                            print(#VoitureHangar2)
                                            if #VoitureHangar2 < 25 then
                                                TriggerServerEvent('InitialCore:ChangeStatusAndChooseHangar', a, 'range', 2)
                                                Wait(100)
                                                TriggerServerCallback("getInfoHangarConcess", function(VoitureHangar2)
                                                    TriggerEvent('instance:create', 'garageentrepise', 'concessionnaire', {property = 'g_sousterrain_1', owner = GetPlayerServerId(PlayerId())})
                                                    DoScreenFadeOut(1000)
                                                    Wait(1000)
                                                    DeleteVehicle(vehicle)
                                                    SetEntityCoords(PlayerPedId(), 404.837, -978.641, -99.004-0.98, 0.0, 0.0, 0.0, true)
                                                    Wait(500)
                                                    VoitureHangar = VoitureHangar2
                                                    for k, v in pairs (VoitureHangar) do
                                                        if v.Status == 'range' then
                                                            if DoesEntityExist(VoitureHangar[k].HashVoiture) then
                                                                SetEntityAsMissionEntity(VoitureHangar[k].HashVoiture, false, true)
                                                                DeleteVehicle(VoitureHangar[k].HashVoiture)
                                                            end
                                                            RequestModel(GetHashKey(VoitureHangar[k].Voiture))  
                                                            while not HasModelLoaded(GetHashKey(VoitureHangar[k].Voiture)) do
                                                                Citizen.Wait(100)
                                                                print(VoitureHangar[k].Voiture)
                                                            end
                                                            VoitureHangar[k].HashVoiture = CreateVehicle(GetHashKey(VoitureHangar[k].Voiture), VoitureSpawnZone2[k].x, VoitureSpawnZone2[k].y, VoitureSpawnZone2[k].z, VoitureSpawnZone2[k].h, false, false)
                                                            SetVehicleColours(VoitureHangar[k].HashVoiture, 0, 0)
                                                            SetEntityAsMissionEntity(VoitureHangar[k].HashVoiture, true, false)
                                                            SetVehicleHasBeenOwnedByPlayer(VoitureHangar[k].HashVoiture, true)
                                                            SetVehicleNeedsToBeHotwired(VoitureHangar[k].HashVoiture, false)
                                                            SetVehRadioStation(VoitureHangar[k].HashVoiture, 'OFF')
                                                            SetVehicleNumberPlateText(VoitureHangar[k].HashVoiture, v.TempPlaque or v.ID)
                                                            SetModelAsNoLongerNeeded(GetHashKey(VoitureHangar[k].Voiture))
                                                        end
                                                    end
                                                    DoScreenFadeIn(1000)
                                                end, 2)
                                            else
                                                AdvancedNotif('Concessionnaire', 'Hangar', 'Votre hangar est plein.', 'CHAR_WE', 'INITIALV')
                                            end
                                        end, 2)
                                    end
                                end
                            end, a)
                        else
                            TriggerServerCallback("getInfoHangarConcess", function(VoitureHangar2)
                                TriggerEvent('instance:create', 'garageentrepise', 'concessionnaire', {property = 'g_sousterrain_1', owner = GetPlayerServerId(PlayerId())})
                                DoScreenFadeOut(1000)
                                Wait(1000)
                                SetEntityCoords(PlayerPedId(), 404.837, -978.641, -99.004-0.98, 0.0, 0.0, 0.0, true)
                                Wait(500)
                                VoitureHangar = VoitureHangar2
                                for k, v in pairs (VoitureHangar) do
                                    if v.Status == 'range' then
                                        if DoesEntityExist(VoitureHangar[k].HashVoiture) then
                                            SetEntityAsMissionEntity(VoitureHangar[k].HashVoiture, false, true)
                                            DeleteVehicle(VoitureHangar[k].HashVoiture)
                                        end
                                        RequestModel(GetHashKey(VoitureHangar[k].Voiture))  
                                        while not HasModelLoaded(GetHashKey(VoitureHangar[k].Voiture)) do
                                            Citizen.Wait(100)
                                            print(VoitureHangar[k].Voiture)
                                        end
                                        VoitureHangar[k].HashVoiture = CreateVehicle(GetHashKey(VoitureHangar[k].Voiture), VoitureSpawnZone2[k].x, VoitureSpawnZone2[k].y, VoitureSpawnZone2[k].z, VoitureSpawnZone2[k].h, false, false)
                                        SetVehicleColours(VoitureHangar[k].HashVoiture, 0, 0)
                                        SetEntityAsMissionEntity(VoitureHangar[k].HashVoiture, true, false)
                                        SetVehicleHasBeenOwnedByPlayer(VoitureHangar[k].HashVoiture, true)
                                        SetVehicleNeedsToBeHotwired(VoitureHangar[k].HashVoiture, false)
                                        SetVehRadioStation(VoitureHangar[k].HashVoiture, 'OFF')
                                        SetVehicleNumberPlateText(VoitureHangar[k].HashVoiture, v.TempPlaque or v.ID)
                                        SetModelAsNoLongerNeeded(GetHashKey(VoitureHangar[k].Voiture))
                                    end
                                end
                                DoScreenFadeIn(1000)
                            end, 2)
                        end
                    elseif ConcessZone[k].type == 'sortiehangar2' then
                        local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)
                        local a, b
                        local VehicleModel
                        local VehicleNameLabel
                        DoScreenFadeOut(1000)
                        Wait(1000)
                        TriggerEvent('instance:leave')
                        SetPedCoordsKeepVehicle(PlayerPedId(), -255.167, -2586.289, 6.0-0.98)
                        Wait(500)
                        if vehicle ~= 0 then
                            a, b = GetVehicleNumberPlateText(vehicle):gsub("%s+", "")
                            TriggerServerEvent('InitialCore:ChangeStatusHangar', a, 'sorti')
                            VehicleModel = GetEntityModel(vehicle)
                            --print(VehicleModel)
                            --VehicleNameLabel = GetDisplayNameFromVehicleModel(VehicleModel)
                            RequestModel(VehicleModel)
                            while not HasModelLoaded(VehicleModel) do
                                print(VehicleNameLabel)
                                Citizen.Wait(100)
                            end
                            --Wait(500)
                            local vehicle = CreateVehicle(VehicleModel, -255.167, -2586.289, 6.0-0.98, 90.0, true, false)
                            --TaskEnterVehicle(GetPlayerPed(-1), vehicle, 20000,-1, 1.5, 16, 0)
                            --Wait(500)
                            SetVehicleColours(vehicle, 0, 0)
                            SetEntityAsMissionEntity(vehicle, true, false)
                            SetVehicleHasBeenOwnedByPlayer(vehicle, true)
                            SetVehicleNeedsToBeHotwired(vehicle, false)
                            SetVehRadioStation(vehicle, 'OFF')
                            SetVehicleNumberPlateText(vehicle, a)
                            --TaskEnterVehicle(GetPlayerPed(-1), vehicle, 20000,-1, 1.5, 16, 0)
                            SetModelAsNoLongerNeeded(VehicleModel)
                           -- Wait(500)
                            --Wait(500)
                        end
                        DoScreenFadeIn(1000)
                        if VoitureHangar then
                            for k, v in pairs (VoitureHangar) do
                                if DoesEntityExist(VoitureHangar[k].HashVoiture) and VoitureHangar[k].ID then
                                    SetEntityAsMissionEntity(VoitureHangar[k].HashVoiture, false, true)
                                    DeleteVehicle(VoitureHangar[k].HashVoiture)
                                end
                            end
                        end
                    end
                end
            end
        end
        if ConcessZoneShopTemp == 1 then
            Wait(5000)
        end
    end
end

RMenu.Add('concessionnaire', 'main', RageUI.CreateMenu("Concessionnaire", "~b~MENU PRINCIPALE"))
RMenu.Add('concessionnaire', 'achatvoiture', RageUI.CreateSubMenu(RMenu:Get('concessionnaire', 'main'), "Concessionnaire", "~b~ACHAT VOITURE"))
RMenu.Add('concessionnaire', 'berlines', RageUI.CreateSubMenu(RMenu:Get('concessionnaire', 'achatvoiture'), "Concessionnaire", "~b~ACHAT VOITURE"))
RMenu.Add('concessionnaire', 'compactes', RageUI.CreateSubMenu(RMenu:Get('concessionnaire', 'achatvoiture'), "Concessionnaire", "~b~ACHAT VOITURE"))

RMenu.Add('concessionnaire', 'coupees', RageUI.CreateSubMenu(RMenu:Get('concessionnaire', 'achatvoiture'), "Concessionnaire", "~b~ACHAT VOITURE"))
RMenu.Add('concessionnaire', 'grossecylindrees', RageUI.CreateSubMenu(RMenu:Get('concessionnaire', 'achatvoiture'), "Concessionnaire", "~b~ACHAT VOITURE"))
RMenu.Add('concessionnaire', 'sportive', RageUI.CreateSubMenu(RMenu:Get('concessionnaire', 'achatvoiture'), "Concessionnaire", "~b~ACHAT VOITURE"))
RMenu.Add('concessionnaire', 'sportiveclasique', RageUI.CreateSubMenu(RMenu:Get('concessionnaire', 'achatvoiture'), "Concessionnaire", "~b~ACHAT VOITURE"))
RMenu.Add('concessionnaire', 'supersportive', RageUI.CreateSubMenu(RMenu:Get('concessionnaire', 'achatvoiture'), "Concessionnaire", "~b~ACHAT VOITURE"))
RMenu.Add('concessionnaire', 'suv', RageUI.CreateSubMenu(RMenu:Get('concessionnaire', 'achatvoiture'), "Concessionnaire", "~b~ACHAT VOITURE"))
RMenu.Add('concessionnaire', 'toutterrain', RageUI.CreateSubMenu(RMenu:Get('concessionnaire', 'achatvoiture'), "Concessionnaire", "~b~ACHAT VOITURE"))
RMenu.Add('concessionnaire', 'moto', RageUI.CreateSubMenu(RMenu:Get('concessionnaire', 'achatvoiture'), "Concessionnaire", "~b~ACHAT VOITURE"))
RMenu.Add('concessionnaire', 'van', RageUI.CreateSubMenu(RMenu:Get('concessionnaire', 'achatvoiture'), "Concessionnaire", "~b~ACHAT VOITURE"))

RMenu.Add('concessionnaire', 'infolivraison', RageUI.CreateSubMenu(RMenu:Get('concessionnaire', 'main'), "Concessionnaire", "~b~INFORMATION LIVRAISON"))
RMenu.Add('concessionnaire', 'facture', RageUI.CreateSubMenu(RMenu:Get('concessionnaire', 'main'), "Concessionnaire", "~b~FACTURES"))
RMenu.Add('concessionnaire', 'typepaiement', RageUI.CreateSubMenu(RMenu:Get('concessionnaire', 'facture'), "Concessionnaire", "~b~TYPE PAIEMENT"))

RMenu.Add('concessionnaire', 'attribuervehicle', RageUI.CreateSubMenu(RMenu:Get('concessionnaire', 'main'), "Concessionnaire", "~b~ATTRIBUER UN VEHICULE"))
RMenu.Add('concessionnaire', 'hangar1', RageUI.CreateSubMenu(RMenu:Get('concessionnaire', 'attribuervehicle'), "Concessionnaire", "~b~PETIT HANGAR"))
RMenu.Add('concessionnaire', 'hangar2', RageUI.CreateSubMenu(RMenu:Get('concessionnaire', 'attribuervehicle'), "Concessionnaire", "~b~GRAND HANGAR"))

RMenu.Add('concessionnaire', 'gestion', RageUI.CreateSubMenu(RMenu:Get('concessionnaire', 'main'), "Concessionnaire", "~b~GESTION ENTREPRISE"))
RMenu.Add('concessionnaire', 'grade', RageUI.CreateSubMenu(RMenu:Get('concessionnaire', 'gestion'), "Concessionnaire", "~b~FONCTIONS"))
RMenu.Add('concessionnaire', 'employee', RageUI.CreateSubMenu(RMenu:Get('concessionnaire', 'gestion'), "Concessionnaire", "~b~EMPLOYES"))
RMenu.Add('concessionnaire', 'gesemployee', RageUI.CreateSubMenu(RMenu:Get('concessionnaire', 'employee'), "Concessionnaire", "~b~GESTION EMPLOYE"))
RMenu.Add('concessionnaire', 'gesemployeefonction', RageUI.CreateSubMenu(RMenu:Get('concessionnaire', 'gesemployee'), "Concessionnaire", "~b~SELECTION FONCTION"))

--RMenu.Add('concessionnaire', 'hangar', RageUI.CreateMenu("Concessionnaire", "~b~MENU HANGAR"))
--RMenu.Add('concessionnaire', 'gestionvoiturehangar', RageUI.CreateSubMenu(RMenu:Get('concessionnaire', 'hangar'), "Concessionnaire", "~b~GESTION VOITURE"))

function MenuConcess()
    LastInfoLivraison = 0
    if not MenuConcessOpen then
        MenuConcessOpen = true
        while MenuConcessOpen do
            Citizen.Wait(1)

            --[[

            RMenu.Add('concessionnaire', 'coupees', RageUI.CreateSubMenu(RMenu:Get('concessionnaire', 'achatvoiture'), "Concessionnaire", "~b~ACHAT VOITURE"))
            RMenu.Add('concessionnaire', 'grossecylindrees', RageUI.CreateSubMenu(RMenu:Get('concessionnaire', 'achatvoiture'), "Concessionnaire", "~b~ACHAT VOITURE"))
            RMenu.Add('concessionnaire', 'sportive', RageUI.CreateSubMenu(RMenu:Get('concessionnaire', 'achatvoiture'), "Concessionnaire", "~b~ACHAT VOITURE"))
            RMenu.Add('concessionnaire', 'sportiveclasique', RageUI.CreateSubMenu(RMenu:Get('concessionnaire', 'achatvoiture'), "Concessionnaire", "~b~ACHAT VOITURE"))
            RMenu.Add('concessionnaire', 'supersportive', RageUI.CreateSubMenu(RMenu:Get('concessionnaire', 'achatvoiture'), "Concessionnaire", "~b~ACHAT VOITURE"))
            RMenu.Add('concessionnaire', 'suv', RageUI.CreateSubMenu(RMenu:Get('concessionnaire', 'achatvoiture'), "Concessionnaire", "~b~ACHAT VOITURE"))
            RMenu.Add('concessionnaire', 'toutterrain', RageUI.CreateSubMenu(RMenu:Get('concessionnaire', 'achatvoiture'), "Concessionnaire", "~b~ACHAT VOITURE"))
            RMenu.Add('concessionnaire', 'moto', RageUI.CreateSubMenu(RMenu:Get('concessionnaire', 'achatvoiture'), "Concessionnaire", "~b~ACHAT VOITURE"))
            RMenu.Add('concessionnaire', 'van', RageUI.CreateSubMenu(RMenu:Get('concessionnaire', 'achatvoiture'), "Concessionnaire", "~b~ACHAT VOITURE"))

            ]]

            if not RageUI.Visible(RMenu:Get('concessionnaire', 'main')) and not RageUI.Visible(RMenu:Get('concessionnaire', 'achatvoiture')) and not RageUI.Visible(RMenu:Get('concessionnaire', 'berlines')) and not RageUI.Visible(RMenu:Get('concessionnaire', 'compactes')) and not RageUI.Visible(RMenu:Get('concessionnaire', 'coupees')) and not RageUI.Visible(RMenu:Get('concessionnaire', 'grossecylindrees')) and not RageUI.Visible(RMenu:Get('concessionnaire', 'sportive')) and not RageUI.Visible(RMenu:Get('concessionnaire', 'sportiveclasique')) and not RageUI.Visible(RMenu:Get('concessionnaire', 'supersportive')) and not RageUI.Visible(RMenu:Get('concessionnaire', 'suv')) and not RageUI.Visible(RMenu:Get('concessionnaire', 'toutterrain')) and not RageUI.Visible(RMenu:Get('concessionnaire', 'moto')) and not RageUI.Visible(RMenu:Get('concessionnaire', 'van')) and not RageUI.Visible(RMenu:Get('concessionnaire', 'infolivraison')) and not RageUI.Visible(RMenu:Get('concessionnaire', 'facture')) and not RageUI.Visible(RMenu:Get('concessionnaire', 'typepaiement')) and not RageUI.Visible(RMenu:Get('concessionnaire', 'attribuervehicle')) and not RageUI.Visible(RMenu:Get('concessionnaire', 'hangar1')) and not RageUI.Visible(RMenu:Get('concessionnaire', 'hangar2')) and not RageUI.Visible(RMenu:Get('concessionnaire', 'gestion')) and not RageUI.Visible(RMenu:Get('concessionnaire', 'grade')) and not RageUI.Visible(RMenu:Get('concessionnaire', 'employee')) and not RageUI.Visible(RMenu:Get('concessionnaire', 'gesemployee')) and not RageUI.Visible(RMenu:Get('concessionnaire', 'gesemployeefonction')) then
                MenuConcessOpen = false
            end
            --if ConcessMenuType == 'main' then
                RageUI.IsVisible(RMenu:Get('concessionnaire', 'main'), true, true, true, function()
                    RageUI.Button("Commander une voiture", "DESC", { RightLabel = ">" }, true, function(_,_,Selected)
                    end, RMenu:Get('concessionnaire', 'achatvoiture'))
                    RageUI.Button("Information sur les livraisons actuelle", "DESC", { RightLabel = ">" }, true, function(_,_,Selected)
                    end, RMenu:Get('concessionnaire', 'infolivraison'))
                    RageUI.Button("Créer une facture", "DESC", { RightLabel = ">" }, true, function(_,_,Selected)
                    end, RMenu:Get('concessionnaire', 'facture'))
                    RageUI.Button("Attribuer un véhicule", "DESC", { RightLabel = ">" }, true, function(_,_,Selected)
                    end, RMenu:Get('concessionnaire', 'attribuervehicle'))
                    if niveaumetier == 1000 then
                        RageUI.Button("Gestion entreprise", "DESC", { RightLabel = ">" }, true, function(_,_,Selected)
                        end, RMenu:Get('concessionnaire', 'gestion'))
                    end
                end)
                RageUI.IsVisible(RMenu:Get('concessionnaire', 'achatvoiture'), true, true, true, function()
                    RageUI.Button("Berlines", "DESC", { RightLabel = ">" }, true, function(_,_,Selected)
                    end, RMenu:Get('concessionnaire', 'berlines'))
                    RageUI.Button("Compactes", "DESC", { RightLabel = ">" }, true, function(_,_,Selected)
                    end, RMenu:Get('concessionnaire', 'compactes'))

                    RageUI.Button("Coupées", "DESC", { RightLabel = ">" }, true, function(_,_,Selected)
                    end, RMenu:Get('concessionnaire', 'coupees'))
                    RageUI.Button("Grosse Cylindrées", "DESC", { RightLabel = ">" }, true, function(_,_,Selected)
                    end, RMenu:Get('concessionnaire', 'grossecylindrees'))

                    RageUI.Button("Sportive", "DESC", { RightLabel = ">" }, true, function(_,_,Selected)
                    end, RMenu:Get('concessionnaire', 'sportive'))
                    RageUI.Button("Sportive Clasique", "DESC", { RightLabel = ">" }, true, function(_,_,Selected)
                    end, RMenu:Get('concessionnaire', 'sportiveclasique'))
                    RageUI.Button("SuperSportive", "DESC", { RightLabel = ">" }, true, function(_,_,Selected)
                    end, RMenu:Get('concessionnaire', 'supersportive'))

                    RageUI.Button("SUV", "DESC", { RightLabel = ">" }, true, function(_,_,Selected)
                    end, RMenu:Get('concessionnaire', 'suv'))
                    RageUI.Button("Tout-Terrain", "DESC", { RightLabel = ">" }, true, function(_,_,Selected)
                    end, RMenu:Get('concessionnaire', 'toutterrain'))
                    RageUI.Button("Moto", "DESC", { RightLabel = ">" }, true, function(_,_,Selected)
                    end, RMenu:Get('concessionnaire', 'moto'))
                    RageUI.Button("Van", "DESC", { RightLabel = ">" }, true, function(_,_,Selected)
                    end, RMenu:Get('concessionnaire', 'van'))
                end)
                RageUI.IsVisible(RMenu:Get('concessionnaire', 'berlines'), true, true, true, function()
                    for k, v in pairs (ConcessJSON[1].Berlines) do
                        RageUI.Button(v.Nom, "DESC", { RightLabel = v.Prix .. "$" }, true, function(_,_,Selected)
                            if Selected then
                                TriggerServerCallback('getArgent', function(argent)
                                    if argent >= v.Prix then
                                        TriggerServerCallback("getInfoHangarConcess", function(VoitureHangar2)
                                            TriggerServerCallback("getInfoCommandConcess", function(InfoLivraison)
                                                if #InfoLivraison+#VoitureHangar2 < 25 then
                                                    TriggerServerEvent('InitialCore:RemoveArgentBank', true, 'Concessionnaire', v.Prix)
                                                    TriggerServerEvent('InitialCore:AddConcessCar', k)
                                                    AdvancedNotif('Concessionnaire', 'Commande de voiture', 'La voiture ' .. v.Nom .. ' a été commandé chez votre fournisseur.', 'CHAR_WE', 'INITIALV')
                                                else
                                                    AdvancedNotif('Concessionnaire', 'Commande de voiture', 'Place insuffisante dans votre hangar de stockage.', 'CHAR_WE', 'INITIALV')
                                                end
                                            end)
                                        end, 2)
                                    else
                                        AdvancedNotif('Concessionnaire', 'Commande de voiture', 'Solde d\'entreprise insuffisant.', 'CHAR_WE', 'INITIALV')
                                    end
                                end, 'Concessionnaire')
                            end
                        end)
                    end
                end)
                RageUI.IsVisible(RMenu:Get('concessionnaire', 'compactes'), true, true, true, function()
                    for k, v in pairs (ConcessJSON[1].Compactes) do
                        RageUI.Button(v.Nom, "DESC", { RightLabel = v.Prix .. "$" }, true, function(_,_,Selected)
                            if Selected then
                                TriggerServerCallback('getArgent', function(argent)
                                    if argent >= v.Prix then
                                        TriggerServerCallback("getInfoHangarConcess", function(VoitureHangar2)
                                            TriggerServerCallback("getInfoCommandConcess", function(InfoLivraison)
                                                if #InfoLivraison+#VoitureHangar2 < 25 then
                                                    TriggerServerEvent('InitialCore:RemoveArgentBank', true, 'Concessionnaire', v.Prix)
                                                    TriggerServerEvent('InitialCore:AddConcessCar', k)
                                                    AdvancedNotif('Concessionnaire', 'Commande de voiture', 'La voiture ' .. v.Nom .. ' a été commandé chez votre fournisseur.', 'CHAR_WE', 'INITIALV')
                                                else
                                                    AdvancedNotif('Concessionnaire', 'Commande de voiture', 'Place insuffisante dans votre hangar de stockage.', 'CHAR_WE', 'INITIALV')
                                                end
                                            end)
                                        end, 2)
                                    else
                                        AdvancedNotif('Concessionnaire', 'Commande de voiture', 'Solde d\'entreprise insuffisant.', 'CHAR_WE', 'INITIALV')
                                    end
                                end, 'Concessionnaire')
                            end
                        end)
                    end
                end)
                RageUI.IsVisible(RMenu:Get('concessionnaire', 'coupees'), true, true, true, function()
                    for k, v in pairs (ConcessJSON[1].Coupees) do
                        RageUI.Button(v.Nom, "DESC", { RightLabel = v.Prix .. "$" }, true, function(_,_,Selected)
                            if Selected then
                                TriggerServerCallback('getArgent', function(argent)
                                    if argent >= v.Prix then
                                        TriggerServerCallback("getInfoHangarConcess", function(VoitureHangar2)
                                            TriggerServerCallback("getInfoCommandConcess", function(InfoLivraison)
                                                if #InfoLivraison+#VoitureHangar2 < 25 then
                                                    TriggerServerEvent('InitialCore:RemoveArgentBank', true, 'Concessionnaire', v.Prix)
                                                    TriggerServerEvent('InitialCore:AddConcessCar', k)
                                                    AdvancedNotif('Concessionnaire', 'Commande de voiture', 'La voiture ' .. v.Nom .. ' a été commandé chez votre fournisseur.', 'CHAR_WE', 'INITIALV')
                                                else
                                                    AdvancedNotif('Concessionnaire', 'Commande de voiture', 'Place insuffisante dans votre hangar de stockage.', 'CHAR_WE', 'INITIALV')
                                                end
                                            end)
                                        end, 2)
                                    else
                                        AdvancedNotif('Concessionnaire', 'Commande de voiture', 'Solde d\'entreprise insuffisant.', 'CHAR_WE', 'INITIALV')
                                    end
                                end, 'Concessionnaire')
                            end
                        end)
                    end
                end)
                RageUI.IsVisible(RMenu:Get('concessionnaire', 'grossecylindrees'), true, true, true, function()
                    for k, v in pairs (ConcessJSON[1].GrosseCylindrees) do
                        RageUI.Button(v.Nom, "DESC", { RightLabel = v.Prix .. "$" }, true, function(_,_,Selected)
                            if Selected then
                                TriggerServerCallback('getArgent', function(argent)
                                    if argent >= v.Prix then
                                        TriggerServerCallback("getInfoHangarConcess", function(VoitureHangar2)
                                            TriggerServerCallback("getInfoCommandConcess", function(InfoLivraison)
                                                if #InfoLivraison+#VoitureHangar2 < 25 then
                                                    TriggerServerEvent('InitialCore:RemoveArgentBank', true, 'Concessionnaire', v.Prix)
                                                    TriggerServerEvent('InitialCore:AddConcessCar', k)
                                                    AdvancedNotif('Concessionnaire', 'Commande de voiture', 'La voiture ' .. v.Nom .. ' a été commandé chez votre fournisseur.', 'CHAR_WE', 'INITIALV')
                                                else
                                                    AdvancedNotif('Concessionnaire', 'Commande de voiture', 'Place insuffisante dans votre hangar de stockage.', 'CHAR_WE', 'INITIALV')
                                                end
                                            end)
                                        end, 2)
                                    else
                                        AdvancedNotif('Concessionnaire', 'Commande de voiture', 'Solde d\'entreprise insuffisant.', 'CHAR_WE', 'INITIALV')
                                    end
                                end, 'Concessionnaire')
                            end
                        end)
                    end
                end)
                RageUI.IsVisible(RMenu:Get('concessionnaire', 'sportive'), true, true, true, function()
                    for k, v in pairs (ConcessJSON[1].Sportive) do
                        RageUI.Button(v.Nom, "DESC", { RightLabel = v.Prix .. "$" }, true, function(_,_,Selected)
                            if Selected then
                                TriggerServerCallback('getArgent', function(argent)
                                    if argent >= v.Prix then
                                        TriggerServerCallback("getInfoHangarConcess", function(VoitureHangar2)
                                            TriggerServerCallback("getInfoCommandConcess", function(InfoLivraison)
                                                if #InfoLivraison+#VoitureHangar2 < 25 then
                                                    TriggerServerEvent('InitialCore:RemoveArgentBank', true, 'Concessionnaire', v.Prix)
                                                    TriggerServerEvent('InitialCore:AddConcessCar', k)
                                                    AdvancedNotif('Concessionnaire', 'Commande de voiture', 'La voiture ' .. v.Nom .. ' a été commandé chez votre fournisseur.', 'CHAR_WE', 'INITIALV')
                                                else
                                                    AdvancedNotif('Concessionnaire', 'Commande de voiture', 'Place insuffisante dans votre hangar de stockage.', 'CHAR_WE', 'INITIALV')
                                                end
                                            end)
                                        end, 2)
                                    else
                                        AdvancedNotif('Concessionnaire', 'Commande de voiture', 'Solde d\'entreprise insuffisant.', 'CHAR_WE', 'INITIALV')
                                    end
                                end, 'Concessionnaire')
                            end
                        end)
                    end
                end)
                RageUI.IsVisible(RMenu:Get('concessionnaire', 'sportiveclasique'), true, true, true, function()
                    for k, v in pairs (ConcessJSON[1].SportiveClasique) do
                        RageUI.Button(v.Nom, "DESC", { RightLabel = v.Prix .. "$" }, true, function(_,_,Selected)
                            if Selected then
                                TriggerServerCallback('getArgent', function(argent)
                                    if argent >= v.Prix then
                                        TriggerServerCallback("getInfoHangarConcess", function(VoitureHangar2)
                                            TriggerServerCallback("getInfoCommandConcess", function(InfoLivraison)
                                                if #InfoLivraison+#VoitureHangar2 < 25 then
                                                    TriggerServerEvent('InitialCore:RemoveArgentBank', true, 'Concessionnaire', v.Prix)
                                                    TriggerServerEvent('InitialCore:AddConcessCar', k)
                                                    AdvancedNotif('Concessionnaire', 'Commande de voiture', 'La voiture ' .. v.Nom .. ' a été commandé chez votre fournisseur.', 'CHAR_WE', 'INITIALV')
                                                else
                                                    AdvancedNotif('Concessionnaire', 'Commande de voiture', 'Place insuffisante dans votre hangar de stockage.', 'CHAR_WE', 'INITIALV')
                                                end
                                            end)
                                        end, 2)
                                    else
                                        AdvancedNotif('Concessionnaire', 'Commande de voiture', 'Solde d\'entreprise insuffisant.', 'CHAR_WE', 'INITIALV')
                                    end
                                end, 'Concessionnaire')
                            end
                        end)
                    end
                end)
                RageUI.IsVisible(RMenu:Get('concessionnaire', 'supersportive'), true, true, true, function()
                    for k, v in pairs (ConcessJSON[1].SuperSportive) do
                        RageUI.Button(v.Nom, "DESC", { RightLabel = v.Prix .. "$" }, true, function(_,_,Selected)
                            if Selected then
                                TriggerServerCallback('getArgent', function(argent)
                                    if argent >= v.Prix then
                                        TriggerServerCallback("getInfoHangarConcess", function(VoitureHangar2)
                                            TriggerServerCallback("getInfoCommandConcess", function(InfoLivraison)
                                                if #InfoLivraison+#VoitureHangar2 < 25 then
                                                    TriggerServerEvent('InitialCore:RemoveArgentBank', true, 'Concessionnaire', v.Prix)
                                                    TriggerServerEvent('InitialCore:AddConcessCar', k)
                                                    AdvancedNotif('Concessionnaire', 'Commande de voiture', 'La voiture ' .. v.Nom .. ' a été commandé chez votre fournisseur.', 'CHAR_WE', 'INITIALV')
                                                else
                                                    AdvancedNotif('Concessionnaire', 'Commande de voiture', 'Place insuffisante dans votre hangar de stockage.', 'CHAR_WE', 'INITIALV')
                                                end
                                            end)
                                        end, 2)
                                    else
                                        AdvancedNotif('Concessionnaire', 'Commande de voiture', 'Solde d\'entreprise insuffisant.', 'CHAR_WE', 'INITIALV')
                                    end
                                end, 'Concessionnaire')
                            end
                        end)
                    end
                end)
                RageUI.IsVisible(RMenu:Get('concessionnaire', 'suv'), true, true, true, function()
                    for k, v in pairs (ConcessJSON[1].SUV) do
                        RageUI.Button(v.Nom, "DESC", { RightLabel = v.Prix .. "$" }, true, function(_,_,Selected)
                            if Selected then
                                TriggerServerCallback('getArgent', function(argent)
                                    if argent >= v.Prix then
                                        TriggerServerCallback("getInfoHangarConcess", function(VoitureHangar2)
                                            TriggerServerCallback("getInfoCommandConcess", function(InfoLivraison)
                                                if #InfoLivraison+#VoitureHangar2 < 25 then
                                                    TriggerServerEvent('InitialCore:RemoveArgentBank', true, 'Concessionnaire', v.Prix)
                                                    TriggerServerEvent('InitialCore:AddConcessCar', k)
                                                    AdvancedNotif('Concessionnaire', 'Commande de voiture', 'La voiture ' .. v.Nom .. ' a été commandé chez votre fournisseur.', 'CHAR_WE', 'INITIALV')
                                                else
                                                    AdvancedNotif('Concessionnaire', 'Commande de voiture', 'Place insuffisante dans votre hangar de stockage.', 'CHAR_WE', 'INITIALV')
                                                end
                                            end)
                                        end, 2)
                                    else
                                        AdvancedNotif('Concessionnaire', 'Commande de voiture', 'Solde d\'entreprise insuffisant.', 'CHAR_WE', 'INITIALV')
                                    end
                                end, 'Concessionnaire')
                            end
                        end)
                    end
                end)
                RageUI.IsVisible(RMenu:Get('concessionnaire', 'toutterrain'), true, true, true, function()
                    for k, v in pairs (ConcessJSON[1].ToutTerrain) do
                        RageUI.Button(v.Nom, "DESC", { RightLabel = v.Prix .. "$" }, true, function(_,_,Selected)
                            if Selected then
                                TriggerServerCallback('getArgent', function(argent)
                                    if argent >= v.Prix then
                                        TriggerServerCallback("getInfoHangarConcess", function(VoitureHangar2)
                                            TriggerServerCallback("getInfoCommandConcess", function(InfoLivraison)
                                                if #InfoLivraison+#VoitureHangar2 < 25 then
                                                    TriggerServerEvent('InitialCore:RemoveArgentBank', true, 'Concessionnaire', v.Prix)
                                                    TriggerServerEvent('InitialCore:AddConcessCar', k)
                                                    AdvancedNotif('Concessionnaire', 'Commande de voiture', 'La voiture ' .. v.Nom .. ' a été commandé chez votre fournisseur.', 'CHAR_WE', 'INITIALV')
                                                else
                                                    AdvancedNotif('Concessionnaire', 'Commande de voiture', 'Place insuffisante dans votre hangar de stockage.', 'CHAR_WE', 'INITIALV')
                                                end
                                            end)
                                        end, 2)
                                    else
                                        AdvancedNotif('Concessionnaire', 'Commande de voiture', 'Solde d\'entreprise insuffisant.', 'CHAR_WE', 'INITIALV')
                                    end
                                end, 'Concessionnaire')
                            end
                        end)
                    end
                end)
                RageUI.IsVisible(RMenu:Get('concessionnaire', 'moto'), true, true, true, function()
                    for k, v in pairs (ConcessJSON[1].Moto) do
                        RageUI.Button(v.Nom, "DESC", { RightLabel = v.Prix .. "$" }, true, function(_,_,Selected)
                            if Selected then
                                TriggerServerCallback('getArgent', function(argent)
                                    if argent >= v.Prix then
                                        TriggerServerCallback("getInfoHangarConcess", function(VoitureHangar2)
                                            TriggerServerCallback("getInfoCommandConcess", function(InfoLivraison)
                                                if #InfoLivraison+#VoitureHangar2 < 25 then
                                                    TriggerServerEvent('InitialCore:RemoveArgentBank', true, 'Concessionnaire', v.Prix)
                                                    TriggerServerEvent('InitialCore:AddConcessCar', k)
                                                    AdvancedNotif('Concessionnaire', 'Commande de voiture', 'La voiture ' .. v.Nom .. ' a été commandé chez votre fournisseur.', 'CHAR_WE', 'INITIALV')
                                                else
                                                    AdvancedNotif('Concessionnaire', 'Commande de voiture', 'Place insuffisante dans votre hangar de stockage.', 'CHAR_WE', 'INITIALV')
                                                end
                                            end)
                                        end, 2)
                                    else
                                        AdvancedNotif('Concessionnaire', 'Commande de voiture', 'Solde d\'entreprise insuffisant.', 'CHAR_WE', 'INITIALV')
                                    end
                                end, 'Concessionnaire')
                            end
                        end)
                    end
                end)
                RageUI.IsVisible(RMenu:Get('concessionnaire', 'van'), true, true, true, function()
                    for k, v in pairs (ConcessJSON[1].Van) do
                        RageUI.Button(v.Nom, "DESC", { RightLabel = v.Prix .. "$" }, true, function(_,_,Selected)
                            if Selected then
                                TriggerServerCallback('getArgent', function(argent)
                                    if argent >= v.Prix then
                                        TriggerServerCallback("getInfoHangarConcess", function(VoitureHangar2)
                                            TriggerServerCallback("getInfoCommandConcess", function(InfoLivraison)
                                                if #InfoLivraison+#VoitureHangar2 < 25 then
                                                    TriggerServerEvent('InitialCore:RemoveArgentBank', true, 'Concessionnaire', v.Prix)
                                                    TriggerServerEvent('InitialCore:AddConcessCar', k)
                                                    AdvancedNotif('Concessionnaire', 'Commande de voiture', 'La voiture ' .. v.Nom .. ' a été commandé chez votre fournisseur.', 'CHAR_WE', 'INITIALV')
                                                else
                                                    AdvancedNotif('Concessionnaire', 'Commande de voiture', 'Place insuffisante dans votre hangar de stockage.', 'CHAR_WE', 'INITIALV')
                                                end
                                            end)
                                        end, 2)
                                    else
                                        AdvancedNotif('Concessionnaire', 'Commande de voiture', 'Solde d\'entreprise insuffisant.', 'CHAR_WE', 'INITIALV')
                                    end
                                end, 'Concessionnaire')
                            end
                        end)
                    end
                end)
                RageUI.IsVisible(RMenu:Get('concessionnaire', 'infolivraison'), true, true, true, function()
                    for k, v in pairs (LivraisonVoiture) do
                        RageUI.Button(v.Voiture, "DESC", {  }, true, function(_,Active ,Selected)
                            if Active and k ~= LastInfoLivraison then
                                LastInfoLivraison = k
                                LastTimeLivraison = v.Minutes*100/120/100
                                print(LastTimeLivraison)
                            end
                        end)
                    end
                end, function()
                    if #LivraisonVoiture > 0 then
                        RageUI.PercentagePanel(LastTimeLivraison, "Info livraison (" .. math.floor(LastTimeLivraison*100) .."%)", nil, nil, function(Hovered, Active, Percent)
                        end)
                    end
                end)
                RageUI.IsVisible(RMenu:Get('concessionnaire', 'facture'), true, true, true, function()
                    RageUI.Button("Entreprise :", "DESC", { RightLabel = "Concessionnaire" }, true, function(_,_,Selected)
                    end)
                    RageUI.Button("Raison :", "DESC", { RightLabel = InfoFacture.Raison or ">" }, true, function(_,_,Selected)
                        if Selected then
                            InfoFacture.Raison = KeyboardInput("", 30)
                        end
                    end)
                    RageUI.Button("Nom + Prénom :", "DESC", { RightLabel = InfoFacture.NomPrenom or ">" }, true, function(_,_,Selected)
                        if Selected then
                            InfoFacture.NomPrenom = KeyboardInput("", 30)
                        end
                    end)
                    RageUI.Button("Type de paiement :", "DESC", { RightLabel = ListTP[InfoFacture.TypePaiement] or ">" }, true, function(_,_,Selected)
                    end, RMenu:Get('concessionnaire', 'typepaiement'))
                    if InfoFacture.Montant then
                        RageUI.Button("Montant :", "DESC", { RightLabel = InfoFacture.Montant .. "$" }, true, function(_,_,Selected)
                            if Selected then
                                InfoFacture.Montant = KeyboardInput("", 30)
                                InfoFacture.Montant = tonumber(InfoFacture.Montant)
                            end
                        end)
                    else
                        RageUI.Button("Montant :", "DESC", { RightLabel = ">" }, true, function(_,_,Selected)
                            if Selected then
                                InfoFacture.Montant = KeyboardInput("", 30)
                                InfoFacture.Montant = tonumber(InfoFacture.Montant)
                            end
                        end)
                    end
                    RageUI.Button("Valider", "DESC", {}, true, function(_,_,Selected)
                        if Selected then
                            if InfoFacture.Raison and InfoFacture.NomPrenom and InfoFacture.TypePaiement and InfoFacture.Montant then
                                InfoFacture.HashID = math.random(10000, 99999)
                                TriggerServerEvent('InitialCore:GiveItem', GetPlayerServerId(PlayerId()), "facture", 1, InfoFacture)
                                InfoFacture.HashID = nil
                                InfoFacture.Raison = nil
                                InfoFacture.NomPrenom = nil
                                InfoFacture.TypePaiement = nil
                                InfoFacture.Montant = nil
                                RageUI.GoBack()
                            else
                                AdvancedNotif('Concessionnaire', 'Facture', 'Vous devez remplir tout les champs.', 'CHAR_WE', 'INITIALV')
                            end
                        end
                    end)
                end)
                RageUI.IsVisible(RMenu:Get('concessionnaire', 'attribuervehicle'), true, true, true, function()
                    RageUI.Button("Petit hangar", "DESC", { RightLabel = ">" }, true, function(_,_,Selected)
                        if Selected then
                            TriggerServerCallback("getInfoHangarConcess", function(VoitureHangar2)
                                VoitureHangar = VoitureHangar2
                            end, 1)
                        end
                    end, RMenu:Get('concessionnaire', 'hangar1'))
                    RageUI.Button("Grand hangar", "DESC", { RightLabel = ">" }, true, function(_,_,Selected)
                        if Selected then
                            TriggerServerCallback("getInfoHangarConcess", function(VoitureHangar2)
                                VoitureHangar = VoitureHangar2
                            end, 2)
                        end
                    end, RMenu:Get('concessionnaire', 'hangar2'))
                end)
                RageUI.IsVisible(RMenu:Get('concessionnaire', 'hangar1'), true, true, true, function()
                    if VoitureHangar then
                        for k, v in pairs (VoitureHangar) do
                            if v.TempPlaque then
                                v.TempPlaque = 'Attribué'
                            end
                            RageUI.Button(v.Voiture, "DESC", { RightLabel = v.TempPlaque or ''}, true, function(_,_,Selected)
                                if Selected then
                                    TriggerServerCallback("getStatusVehicle", function(StatusVehicle, HangarVehicle, HavePlaque)
                                        --print(HavePlaque)
                                        if not HavePlaque then
                                            local pID, Dist = GetClosestPlayer()
                                            if Dist <= 2.5 and pID ~= -1 then
                                                RageUI.CloseAll()
                                                local PlaqueJ = math.random(10, 99) .. randomString(3) .. math.random(100, 999)
                                                --print(PlaqueJ)
                                               -- print('TriggerServerEvent(\'InitialCore:GiveVehicle\', GetPlayerServerId(pID), v.Voiture, PlaqueJ)')
                                                TriggerServerEvent('InitialCore:GiveVehicle', GetPlayerServerId(pID), v.Voiture, PlaqueJ)
                                                Wait(500)
                                                TriggerServerEvent('InitialCore:GiveItem', GetPlayerServerId(pID), "CleVoiture", 1, PlaqueJ)
                                                Wait(500)
                                                TriggerServerEvent('InitialCore:SetVehicleToPlayer', v.ID, PlaqueJ)
                                                --[[TriggerServerCallback("getInfoHangarConcess", function(VoitureHangar2)
                                                    VoitureHangar = VoitureHangar2
                                                end, 1)]]
                                            else
                                                AdvancedNotif('Concessionnaire', 'Véhicule', 'Personne à proximité.', 'CHAR_WE', 'INITIALV')
                                            end
                                        else
                                            AdvancedNotif('Concessionnaire', 'Véhicule', 'Ce véhicule est déjà attribuer.', 'CHAR_WE', 'INITIALV')
                                        end
                                    end, v.ID)
                                end
                            end)
                        end
                    end
                end)
                RageUI.IsVisible(RMenu:Get('concessionnaire', 'hangar2'), true, true, true, function()
                    if VoitureHangar then
                        for k, v in pairs (VoitureHangar) do
                            if v.TempPlaque then
                                v.TempPlaque = 'Attribué'
                            end
                            RageUI.Button(v.Voiture, "DESC", { RightLabel = v.TempPlaque or ''}, true, function(_,_,Selected)
                                if Selected then
                                    TriggerServerCallback("getStatusVehicle", function(StatusVehicle, HangarVehicle, HavePlaque)
                                        --print(HavePlaque)
                                        if not HavePlaque then
                                            local pID, Dist = GetClosestPlayer()
                                            if Dist <= 2.5 and pID ~= -1 then
                                                RageUI.CloseAll()
                                                local PlaqueJ = math.random(10, 99) .. randomString(3) .. math.random(100, 999)
                                                --print(PlaqueJ)
                                                print('TriggerServerEvent(\'InitialCore:GiveVehicle\', GetPlayerServerId(pID), v.Voiture, PlaqueJ)')
                                                TriggerServerEvent('InitialCore:GiveVehicle', GetPlayerServerId(pID), v.Voiture, PlaqueJ)
                                                Wait(500)
                                                TriggerServerEvent('InitialCore:GiveItem', GetPlayerServerId(pID), "CleVoiture", 1, PlaqueJ)
                                                Wait(500)
                                                TriggerServerEvent('InitialCore:SetVehicleToPlayer', v.ID, PlaqueJ)
                                                --[[TriggerServerCallback("getInfoHangarConcess", function(VoitureHangar2)
                                                    VoitureHangar = VoitureHangar2
                                                end, 1)]]
                                            else
                                                AdvancedNotif('Concessionnaire', 'Véhicule', 'Personne à proximité.', 'CHAR_WE', 'INITIALV')
                                            end
                                        else
                                            AdvancedNotif('Concessionnaire', 'Véhicule', 'Ce véhicule est déjà attribuer.', 'CHAR_WE', 'INITIALV')
                                        end
                                    end, v.ID)
                                end
                            end)
                        end
                    end
                end)
                RageUI.IsVisible(RMenu:Get('concessionnaire', 'typepaiement'), true, true, true, function()
                    RageUI.List("Type de paiement", ListTP, ListTPIndex or 1, "DESC", {}, true, function(Hovered, Active, Selected, Index)
                        if ListTPIndex ~= Index then
                            ListTPIndex = Index
                            InfoFacture.TypePaiement = Index
                        end
                    end)
                end)
                RageUI.IsVisible(RMenu:Get('concessionnaire', 'gestion'), true, true, true, function()
                    RageUI.Button("Recruter la personne à proximité", "DESC", { RightLabel = ">" }, true, function(_,_,Selected)
                        if Selected then
                            local pID, Dist = GetClosestPlayer()
                            if Dist <= 1.5 and pID ~= -1 then
                                TriggerServerEvent('InitialCore:SetJob', 2, 'concessionnaire', 1, GetPlayerServerId(pID))
                            else
                                AdvancedNotif('Concessionnaire', 'Gestion recrutement', 'Personne à proximité.', 'CHAR_WE', 'INITIALV')
                            end
                        end
                    end)
                    RageUI.Button("Gestion employées", "DESC", { RightLabel = ">" }, true, function(_,_,Selected)
                        if Selected then
                            TriggerServerCallback('getEmployees', function(list)
                                ListEmployee = list
                            end, "concessionnaire")
                            TriggerServerCallback('getJobGrade', function(list)
                                ListGrades = json.decode(list)
                            end, "concessionnaire")
                        end
                    end, RMenu:Get('concessionnaire', 'employee'))
                    RageUI.Button("Gestion fonctions", "DESC", { RightLabel = ">" }, true, function(_,_,Selected)
                        if Selected then
                            TriggerServerCallback('getJobGrade', function(list)
                                ListGrades = json.decode(list)
                            end, "concessionnaire")
                        end
                    end, RMenu:Get('concessionnaire', 'grade'))
                end)
                RageUI.IsVisible(RMenu:Get('concessionnaire', 'grade'), true, true, true, function()
                    RageUI.Button("Ajouter une fonction", "DESC", { RightLabel = ">" }, true, function(_,_,Selected)
                        if Selected then
                            local ResultFuncAdd = KeyboardInput("", 30)
                            TriggerServerEvent('InitialCore:AddFunction', 'concessionnaire', ResultFuncAdd)
                            Wait(100)
                            TriggerServerCallback('getJobGrade', function(list)
                                ListGrades = json.decode(list)
                            end, "concessionnaire")
                        end
                    end)
                    RageUI.Button("Retirer une fonction", "DESC", { RightLabel = ">" }, true, function(_,_,Selected)
                        if Selected then
                            local ResultFuncRem = KeyboardInput("Veuillez entrez l'ID", 30)
                            ResultFuncRem = tonumber(ResultFuncRem)
                            if type(ResultFuncRem) == 'number' then
                                if ResultFuncRem <= #ListGrades then
                                    TriggerServerEvent('InitialCore:RemoveFunction', 'concessionnaire', ResultFuncRem)
                                    Wait(100)
                                    TriggerServerCallback('getJobGrade', function(list)
                                        ListGrades = json.decode(list)
                                    end, "concessionnaire")
                                else
                                    AdvancedNotif('Concessionnaire', 'Gestion fonctions', 'ID de la fonction incorrect.', 'CHAR_WE', 'INITIALV')
                                end
                            else
                                AdvancedNotif('Concessionnaire', 'Gestion fonctions', 'ID de la fonction incorrect.', 'CHAR_WE', 'INITIALV')
                            end
                        end
                    end)
                    RageUI.Separator("[ List des fonctions ]")
                    if ListGrades then
                        for k in pairs (ListGrades) do
                            RageUI.Button(ListGrades[k] .. ' (ID : ' .. k .. ')', "DESC", { RightLabel = ">" }, true, function(_,_,Selected)
                            end)
                        end
                    else
                        RageUI.Button("Aucune fonction", "DESC", { RightLabel = ">" }, true, function(_,_,Selected)
                        end)
                    end
                end)
                RageUI.IsVisible(RMenu:Get('concessionnaire', 'employee'), true, true, true, function()
                    if ListEmployee then
                        for k in pairs (ListEmployee) do
                            local NomGrade = ListGrades[ListEmployee[k].NiveauMetier] or "Erreur..."
                            RageUI.Button(ListEmployee[k].Prenom .. " " .. ListEmployee[k].Nom .. " (" .. NomGrade .. ")", "DESC", { RightLabel = ">" }, true, function(_,_,Selected)
                                if Selected then
                                    LastEmployeeGes = ListEmployee[k]
                                end
                            end, RMenu:Get('concessionnaire', 'gesemployee'))
                        end
                    end
                end)
                RageUI.IsVisible(RMenu:Get('concessionnaire', 'gesemployee'), true, true, true, function()
                    RageUI.Button("Changer la fonction", "DESC", {}, true, function(_,_,Selected)
                        if Selected then
                            TriggerServerCallback('getJobGrade', function(list)
                                ListGrades = json.decode(list)
                            end, "concessionnaire")
                        end
                    end, RMenu:Get('concessionnaire', 'gesemployeefonction'))
                    RageUI.Button("Licensier", "DESC", {}, true, function(_,_,Selected)
                        if Selected then
                            RageUI.GoBack()
                            AdvancedNotif('Concessionnaire', 'Gestion employées', 'Vous avez licensié ' .. LastEmployeeGes.Prenom .. ' ' .. LastEmployeeGes.Nom .. '.', 'CHAR_WE', 'INITIALV')
                            TriggerServerEvent('InitialCore:SetJob', 3, 'aucun', 1, LastEmployeeGes.SteamID)
                            TriggerServerCallback('getEmployees', function(list)
                                ListEmployee = list
                            end, "concessionnaire")
                        end
                    end)
                end)
                RageUI.IsVisible(RMenu:Get('concessionnaire', 'gesemployeefonction'), true, true, true, function()
                    for k in pairs (ListGrades) do
                        RageUI.Button(ListGrades[k], "DESC", { RightLabel = ">" }, true, function(_,_,Selected)
                            if Selected then
                                RageUI.GoBack()
                                AdvancedNotif('Concessionnaire', 'Gestion employées', 'Vous avez mis ' .. LastEmployeeGes.Prenom .. ' ' .. LastEmployeeGes.Nom .. ' : ' .. ListGrades[k] .. '.', 'CHAR_WE', 'INITIALV')
                                TriggerServerEvent('InitialCore:SetJob', 3, 'concessionnaire', k, LastEmployeeGes.SteamID)
                                TriggerServerCallback('getEmployees', function(list)
                                    ListEmployee = list
                                end, "concessionnaire")
                            end
                        end)
                    end
                end)
            --[[elseif ConcessMenuType == 'hangar1' then
                RageUI.IsVisible(RMenu:Get('concessionnaire', 'hangar'), true, true, true, function()
                    for k, v in pairs (VoitureHangar) do
                        RageUI.Button(v.Voiture .. ' (' .. v.Status .. ')', "DESC", {  }, true, function(_,_,Selected)
                            if Selected then
                                LastIDVoiture = v.ID
                                LastNomVoiture = v.Voiture
                                LastStatusVoiture = v.Status
                            end
                        end, RMenu:Get('concessionnaire', 'gestionvoiturehangar'))
                    end
                end)
                RageUI.IsVisible(RMenu:Get('concessionnaire', 'gestionvoiturehangar'), true, true, true, function()
                    RageUI.Separator("[ Gestion voiture (" .. LastNomVoiture .. ") ]")
                    RageUI.Button("Sortir", "DESC", {  }, true, function(_,_,Selected)
                        if Selected then
                            if LastStatusVoiture == 'range' then
                                print('1')
                                TriggerServerEvent('InitialCore:ChangeStatusHangar', LastIDVoiture, 'sorti')
                                print('2')
                                RequestModel(GetHashKey(LastNomVoiture))  
                                print('3b')
                                while not HasModelLoaded(GetHashKey(LastNomVoiture)) do
                                    Citizen.Wait(100)
                                    print('3')
                                end
                                print('4')
                                local car = CreateVehicle(GetHashKey(LastNomVoiture), 1219.647, -3223.151, 6.0, 10.0, true, false)
                                print('5')
                                SetVehicleNumberPlateText(car, LastIDVoiture)
                                SetModelAsNoLongerNeeded(GetHashKey(LastNomVoiture))
                                print('6')
                                TriggerServerCallback("getInfoHangarConcess", function(VoitureHangar2)
                                    VoitureHangar = VoitureHangar2
                                end, 1)
                                RageUI.GoBack()
                            else
                                AdvancedNotif('Concessionnaire', 'Hangar', 'Véhicule déjà sorti.', 'CHAR_WE', 'INITIALV')
                            end
                        end
                    end)
                    RageUI.Button("Ranger", "DESC", {  }, true, function(_,_,Selected)
                        if Selected then
                            --DeleteVehicle(GetClosestVehicle(1219.647, -3223.151, 6.0, 30.0, 0, 70))
                            --print(GetClosestVehicle(1219.647, -3223.151, 6.0, 30.0, 0, 70))
                            --[[player = GetPlayerPed(-1)
                            local pos = GetEntityCoords(player)
                            local entityWorld = GetOffsetFromEntityInWorldCoords(player, 0.0, 20.0, 0.0)
                        
                            local rayHandle = CastRayPointToPoint(pos.x, pos.y, pos.z, entityWorld.x, entityWorld.y, entityWorld.z, 10, player, 0)
                            local a, b, c, d, vehicleHandle = GetRaycastResult(rayHandle)
                            DeleteVehicle(rayHandle)]]
                            --[[local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)
                            if vehicle ~= 0 then
                                local a, b = GetVehicleNumberPlateText(vehicle):gsub("%s+", "")
                                print(type(a))
                                print(type(LastIDVoiture))
                                if tonumber(a) == LastIDVoiture then
                                    DeleteVehicle(vehicle)
                                    print('deleteveh')
                                else
                                    AdvancedNotif('Concessionnaire', 'Hangar', 'Mauvais véhicule.', 'CHAR_WE', 'INITIALV')
                                end
                            else
                                AdvancedNotif('Concessionnaire', 'Hangar', 'Vous n\'êtes pas dans un véhicule.', 'CHAR_WE', 'INITIALV')
                            end
                            --[[if LastStatusVoiture == 'sorti' then
                                local car1 = GetClosestVehicle(1219.647, -3223.151, 6.0, 10.0, 0)
                                if car1 then
                                    local car2 = GetVehicleNumberPlateText(car1)
                                    print(car2)
                                    if car2 then
                                        car23, car24 = car2:gsub("%s+", "")
                                        print(car23)
                                        print(LastIDVoiture)
                                        if tostring(car23) == tostring(LastIDVoiture) then
                                            TriggerServerEvent('InitialCore:ChangeStatusHangar', LastIDVoiture, 'range')
                                            print(car1)
                                            car1 = DeleteVehicle()
                                            TriggerServerCallback("getInfoHangarConcess", function(VoitureHangar2)
                                                VoitureHangar = VoitureHangar2
                                            end, 1)
                                            RageUI.GoBack()
                                        else
                                            AdvancedNotif('Concessionnaire', 'Hangar', 'Ce véhicule ne vous appartient pas.', 'CHAR_WE', 'INITIALV')
                                        end
                                    end
                                end
                            else
                                AdvancedNotif('Concessionnaire', 'Hangar', 'Véhicule déjà rentré.', 'CHAR_WE', 'INITIALV')
                            end]]
                    --[[end
                    end)
                    RageUI.Button("Attribuer le véhicule", "DESC", {  }, true, function(_,_,Selected)
                        if Selected then
                            if LastStatusVoiture == 'range' then
                                local pID, Dist = GetClosestPlayer()
                                if Dist <= 1.5 and pID ~= -1 then
                                    RequestModel(GetHashKey(LastNomVoiture))  
                                    while not HasModelLoaded(GetHashKey(LastNomVoiture)) do
                                        Citizen.Wait(100)
                                    end
                                    local VehD = CreateVehicle(GetHashKey(LastNomVoiture), 1218.57, -3234.67, 5.52, 10.0, true, false)
                                    SetModelAsNoLongerNeeded(GetHashKey(LastNomVoiture))

                                    TriggerServerEvent('InitialCore:GiveVehicle', GetPlayerServerId(pID), LastNomVoiture, GetVehicleNumberPlateText(VehD))
                                    TriggerServerEvent('InitialCore:GiveItem', GetPlayerServerId(pID), "CleVoiture", 1, GetVehicleNumberPlateText(VehD))
                                    TriggerServerEvent('InitialCore:DeleteConcessVehicle', LastIDVoiture)
                                    TriggerServerCallback("getInfoHangarConcess", function(VoitureHangar2)
                                        VoitureHangar = VoitureHangar2
                                    end, 1)
                                    RageUI.GoBack()
                                else
                                    AdvancedNotif('Concessionnaire', 'Hangar', 'Personne à proximité.', 'CHAR_WE', 'INITIALV')
                                end
                            else
                                AdvancedNotif('Concessionnaire', 'Hangar', 'Le véhicule doit être rangé.', 'CHAR_WE', 'INITIALV')
                            end
                        end
                    end)
                end)
            elseif ConcessMenuType == 'hangar2' then

            end]]
        end
    end
end