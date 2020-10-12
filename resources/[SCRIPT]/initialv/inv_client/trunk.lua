local IC
local TotalPoidsCr
local CoffreText
local lastvehicle
local PoidsCoffreMax = {}
PoidsCoffreMax[0] = 30.0
PoidsCoffreMax[1] = 60.0
PoidsCoffreMax[2] = 80.0
PoidsCoffreMax[3] = 50.0
PoidsCoffreMax[4] = 40.0
PoidsCoffreMax[5] = 20.0
PoidsCoffreMax[6] = 20.0
PoidsCoffreMax[7] = 10.0
PoidsCoffreMax[8] = 2.0
PoidsCoffreMax[9] = 100.0
PoidsCoffreMax[10] = 150.0
PoidsCoffreMax[11] = 100.0
PoidsCoffreMax[12] = 150.0
PoidsCoffreMax[13] = 1.0
PoidsCoffreMax[14] = 100.0
PoidsCoffreMax[15] = 50.0
PoidsCoffreMax[16] = 1000.0
PoidsCoffreMax[17] = 50.0
PoidsCoffreMax[18] = 50.0
PoidsCoffreMax[19] = 50.0

local lastPlate

RegisterNetEvent('InitialCore:GetIC')
AddEventHandler('InitialCore:GetIC', function(IC2)
    IC = IC2
    print(IC.Items.pain.Poids)
end)

local trunkData = nil

RegisterNetEvent("InitInventaire:openTrunkInventory")
AddEventHandler("InitInventaire:openTrunkInventory", function(data, inventory, blackMoney, weapons)
    blackMoney = 0
    weapons = nil
    setTrunkInventoryData(data, blackMoney, inventory, weapons)
    openTrunkInventory()
end)

local function RefreshCoffreVehicle(data, Plaque, vehType)
    items = {}
    TotalPoidsCr = 0
    local TempPoids

    if data ~= nil then
        resultinventory = {}
        for key, value in pairs(data) do
            --print(key)
            --print(value)
            if data[key].Montant <= 0 then
                data[key].Montant = nil
            else
                resultinventory[key] = {}
                resultinventory[key].Nom = key
                resultinventory[key].Nombre = value.Montant
                if key:sub(1, 7) == 'CarteCr' then
                    resultinventory[key].Poids = 0.050
                    TempPoids = 0.050
                elseif key:sub(1, 7) == 'Vetemen' then
                    resultinventory[key].Poids = 0.100
                    TempPoids = 0.100
                elseif key:sub(1, 6) == 'argent' then
                    resultinventory[key].Poids = 0.00001*value.Montant
                    TempPoids = 0.001
                elseif key:sub(1, 7) == 'WEAPON_' then
                    resultinventory[key].Poids = 1.0
                    TempPoids = 1.0
                else
                    resultinventory[key].Poids = IC.Items[key].Poids
                    TempPoids = IC.Items[key].Poids
                end
                TotalPoidsCr = value.Montant*TempPoids+TotalPoidsCr
                resultinventory[key].Type = "item_standard"
                table.insert(items, resultinventory[key])
            end
        end
    end
    TriggerServerEvent('InitialCore:RefreshCoffreText')
    SendNUIMessage(
        {
            action = "setSecondInventoryItems",
            itemList = items
        }
    )
    text = "Coffre (" .. Plaque .. ")<br>Capacité : " .. TotalPoidsCr .. "/" .. PoidsCoffreMax[vehType]
    CoffreText = text
    SendNUIMessage(
        {
            action = "setInfoText",
            text = CoffreText
        }
    )
end

RegisterNetEvent("InitialCore:refreshTrunkInventory")
AddEventHandler("InitialCore:refreshTrunkInventory", function(data, Plaque, vehType)
    RefreshCoffreVehicle(data, Plaque, vehType)
end)

function setTrunkInventoryData(vehiclePlaque, blackMoney, inventory, weapons, data)
    trunkData = data

    print(vehiclePlaque)
    
    --[[SendNUIMessage(
        {
            action = "setInfoText",
            text = data.text
        }
    )

    items = {}

    if blackMoney > 0 then
        accountData = {
            label = _U("black_money"),
            count = blackMoney,
            type = "item_account",
            name = "black_money",
            usable = false,
            rare = false,
            limit = -1,
            canRemove = false
        }
        table.insert(items, accountData)
    end

    if inventory ~= nil then
        resultinventory = {}
        for key, value in pairs(inventory) do
            if inventory[key].Montant <= 0 then
                inventory[key].Montant = nil
            else
                resultinventory[key] = {}
                resultinventory[key].Nom = key
                resultinventory[key].Nombre = value.Montant
                if key:sub(1, 7) == 'CarteCr' then
                    resultinventory[key].Poids = 0.050
                elseif key:sub(1, 7) == 'Vetemen' then
                    resultinventory[key].Poids = 0.100
                elseif key:sub(1, 6) == 'argent' then
                    resultinventory[key].Poids = 0.001
                elseif key:sub(1, 7) == 'WEAPON_' then
                    resultinventory[key].Poids = 1.500
                else
                    resultinventory[key].Poids = IC.Items[key].Poids
                end
                resultinventory[key].Type = "item_standard"
                table.insert(items, resultinventory[key])
            end
        end
    end

    if Config.IncludeWeapons and weapons ~= nil then
        for key, value in pairs(weapons) do
            local weaponHash = GetHashKey(weapons[key].name)
            if weapons[key].name ~= "WEAPON_UNARMED" then
                table.insert(
                    items,
                    {
                        label = weapons[key].label,
                        count = weapons[key].ammo,
                        limit = -1,
                        type = "item_weapon",
                        name = weapons[key].name,
                        usable = false,
                        rare = false,
                        canRemove = false
                    }
                )
            end
        end
    end]]
    print(lastPlate)
    RefreshCoffreTrunk()
    openTrunkInventory()
    --SendNUIMessage({
    --    action = "setSecondInventoryItems",
    --    itemList = items
    --})
end

function RefreshCoffreTrunk()

    TriggerServerCallback('InitInventaire:getOtherInventory', function(PlayerInventoryResult, PlayerArmesResult, PlayerMoneyResult)
        items = PlayerInventoryResult
        PlayerArmes = PlayerArmesResult
        PlayerMoney = PlayerMoneyResult
        PoidsTotalPl = 0
        if PlayerMoney then
            argentData = {
                ID = "argent",
                Nom = "Argent",
                Poids = 0.001*PlayerMoney,
                Nombre = PlayerMoney,
            }
        

            table.insert(items, argentData)

        end
        --[[if PlayerArmes then
            for k, v in pairs(PlayerArmes) do
                --print(k)
                --print(v.Nombre)
                armesData = {
                    ID = v.ID,
                    Nom = v.Nom,
                    Poids = 1.500,
                    Nombre = v.Nombre,
                }
                table.insert(items, armesData)
            end
        end]]

        for k, v in pairs (items) do
            PoidsTotalPl = PoidsTotalPl+v.Poids*v.Nombre
        end
        --print("PlayerInventory")
        --[[SendNUIMessage(
        {
            action = "setItems",
            itemList = PlayerInventory
        })]]
        SendNUIMessage({
            action = "setSecondInventoryItems",
            itemList = items
        })
        --RefreshCoffreVehicle(items, vehiclePlaque, 15)
    end, lastPlate)

end

function openTrunkInventory()
    loadPlayerInventory()
    isInInventory = true

    SendNUIMessage(
        {
            action = "display",
            type = "trunk"
        }
    )

    SetNuiFocus(true, true)
end

RegisterNUICallback("PutIntoTrunk", function(data, cb)
        if IsPedSittingInAnyVehicle(playerPed) then
            return
        end
        local otherdata = false
        --[[for k, v in pairs (data.item) do
            print(k)
            print(v)
        end]]
        --if trunkData.max >= data.item.Poids*data.number then
            if data.number <= data.item.Nombre then
                if type(data.number) == "number" and math.floor(data.number) == data.number then
                    local count = tonumber(data.number)
                    if data.item.ID:sub(1, 7) == 'WEAPON_' then
                       --[[count = GetAmmoInPedWeapon(PlayerPedId(), GetHashKey(data.item.ID))
                        if count == 0 then
                            count = 1
                        end]] 
                        local retval, PlayerWeaponInHand = GetCurrentPedWeapon(GetPlayerPed(-1), 1)
                        if PlayerWeaponInHand == GetHashKey(data.item.ID) then
                            GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_UNARMED"), 0, false, true)
                        end
                    end
                    if data.item.type == "argent" then
                        otherdata = 'argent'
                    end
                    --print(trunkData.Plaque)
                    --print(data.item.Type) -- N
                    --print(data.item.Nom)
                    --print(count)
                    --print(trunkData.max)
                    --print(trunkData.myVeh) -- N
                    --print(data.item.ID)
                    --print(json.encode(data.item.Data))
                    TriggerServerEvent("InitialCore:PutItemCoffreVehicle", lastPlate, data.item.ID, count, otherdata, data.item.Data)
                end

                Wait(250)
                loadPlayerInventory()
                --TriggerServerEvent('InitialCore:RefreshCoffreVehicle', lastPlate, GetVehicleClass(lastvehicle))
                RefreshCoffreTrunk()

                cb("ok")
            end
        --end
    end
)

RegisterNUICallback(
    "TakeFromTrunk",
    function(data, cb)
        if IsPedSittingInAnyVehicle(playerPed) then
            return
        end
       --[[ for k, v in pairs (data.item) do
            print(k)
            print(v)
        end]]
        if data.item.ID:sub(1, 7) == "WEAPON_" then
            data.item.Poids = 1.0
        end
        print(data.item.Poids)
        print(data.item.Poids*data.number+PoidsTotalPl)
      --  local otherdata
        if data.number <= data.item.Nombre then
            if 15.0 >= data.item.Poids*data.number+PoidsTotalPl then
                print('1')
                if type(data.number) == "number" and math.floor(data.number) == data.number then
                    --TriggerServerEvent("esx_trunk:getItem", trunkData.plate, data.item.type, data.item.name, tonumber(data.number), trunkData.max, trunkData.myVeh)
                    local count = tonumber(data.number)
                   --[[ if data.item.type == "item_weapon" then
                        count = GetAmmoInPedWeapon(PlayerPedId(), GetHashKey(data.item.name))
                    end
                    if data.item.type == 'argent' then
                        otherdata = 'argent'
                    end]]
                    if data.item.ID:sub(1, 7) == "WEAPON_" then
                   --     print(data.item.Data.Munition)
                        TriggerServerEvent('InitialCore:GiveWeapon', GetPlayerServerId(PlayerId()), data.item.ID, 1, data.item.Data.Munition, data.item.Data.HashID)
                        TriggerServerEvent("InitialCore:RemoveItemCoffreVehicle", lastPlate, data.item.Nom, count, data.item.Data, data.item.ID, data.item.IDTable)
                    else
                        TriggerServerEvent("InitialCore:RemoveItemCoffreVehicle", lastPlate, data.item.ID, count, data.item.Data)
                    end
                end

                Wait(250)
                loadPlayerInventory()
                --TriggerServerEvent('InitialCore:RefreshCoffreVehicle', lastPlate, GetVehicleClass(lastvehicle))
                RefreshCoffreTrunk()
                cb("ok")
            else
                AdvancedNotif('Initial V', 'Inventaire', 'Votre inventaire est plein.', 'CHAR_WE', 'INITIALV')
            end
        end
    end
)

local function VehicleInFront()
    local pos = GetEntityCoords(GetPlayerPed(-1))
    local entityWorld = GetOffsetFromEntityInWorldCoords(GetPlayerPed(-1), 0.0, 4.0, 0.0)
    local rayHandle = CastRayPointToPoint(pos.x, pos.y, pos.z, entityWorld.x, entityWorld.y, entityWorld.z, 10, GetPlayerPed(-1), 0)
    local a, b, c, d, result = GetRaycastResult(rayHandle)
    return result
end

local function openCoffreInventory()
    local playerPed = GetPlayerPed(-1)
  
    if not IsPedInAnyVehicle(playerPed) then
        local vehicle = VehicleInFront()
        lastvehicle = vehicle
        vehiclePlaque = GetVehicleNumberPlateText(vehicle)
        local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
        local closecar = GetClosestVehicle(x, y, z, 4.0, 0, 71)
  
        local vehicledooropen = GetVehicleDoorLockStatus(closecar)
        if vehicledooropen then
            --TriggerServerEvent('InitialCore:GetCoffreVehicle', vehiclePlaque, GetVehicleClass(vehicle))
            lastPlate = vehiclePlaque
            Wait(50)
            if vehiclePlaque ~= nil then
                setTrunkInventoryData(vehiclePlaque, false, false, false)
            end
        end
    end
end

RegisterNetEvent('InitialCore:OpenCoffreVehicule')
AddEventHandler('InitialCore:OpenCoffreVehicule', function(result, Plaque, vehType)
    TotalPoidsCr = 0
    local TempPoids
    for k, v in pairs(result) do
        print(k)
        print(v.Montant)
        if k:sub(1, 7) == 'CarteCr' then
            TempPoids = 0.050
        elseif k:sub(1, 7) == 'Vetemen' then
            TempPoids = 0.100
        elseif k:sub(1, 6) == 'argent' then
            TempPoids = 0.001
        elseif k:sub(1, 7) == 'WEAPON_' then
            TempPoids = 1.500
        else
            TempPoids = IC.Items[k].Poids
        end
        TotalPoidsCr = v.Montant*TempPoids+TotalPoidsCr
        --print(v.Poids)
    end
    text = "Coffre (" .. Plaque .. ")<br>Capacité : " .. TotalPoidsCr .. "/" .. PoidsCoffreMax[vehType]
    CoffreText = text
    data = {Plaque = Plaque, max = PoidsCoffreMax[vehType], text = text}
    TriggerEvent("InitInventaire:openTrunkInventory", data, result)
end)

RegisterCommand('+coffrevehicule', function()
    openCoffreInventory()
end, false)
RegisterCommand('-coffrevehicule', function()
end, false)

RegisterKeyMapping('+coffrevehicule', 'Ouvrir le coffre du véhicule (désactivé)', 'keyboard', 'F3')