local LastID
RegisterNetEvent("InitInventaire:openPropertyInventory")
AddEventHandler("InitInventaire:openPropertyInventory", function(data)
    setPropertyInventoryData(data)
    openPropertyInventory()
end)

function refreshPropertyInventory()
    TriggerServerCallback("getCoffrePropriete", function(contenu)
        setPropertyInventoryData(contenu)
        local CoffreText2 = "Coffre " .. LastID
        SendNUIMessage(
            {
                action = "setInfoText",
                text = CoffreText2
            }
        )
    end, LastID)
end

function setPropertyInventoryData(inventory)
    items = {}

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
    end

    SendNUIMessage(
        {
            action = "setSecondInventoryItems",
            itemList = items
        }
    )
end

function openPropertyInventory()
    loadPlayerInventory()
    isInInventory = true

    SendNUIMessage(
        {
            action = "display",
            type = "property"
        }
    )

    SetNuiFocus(true, true)
end

RegisterNUICallback(
    "PutIntoProperty",
    function(data, cb)
        if IsPedSittingInAnyVehicle(playerPed) then
            return
        end

       --[[if type(data.number) == "number" and math.floor(data.number) == data.number then
            local count = tonumber(data.number)

            if data.item.type == "item_weapon" then
                count = GetAmmoInPedWeapon(PlayerPedId(), GetHashKey(data.item.name))
            end

            TriggerServerEvent("esx_property:putItem", ESX.GetPlayerData().identifier, data.item.type, data.item.name, count)
        end]]

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
                TriggerServerEvent("InitialCore:PutItemPropriete", LastID, data.item.ID, count, otherdata, data.item.Data)

                Wait(250)
                refreshPropertyInventory()
                loadPlayerInventory()

                cb("ok")
            end
        end
    end
)

RegisterNUICallback(
    "TakeFromProperty",
    function(data, cb)
        if IsPedSittingInAnyVehicle(playerPed) then
            return
        end
        --[[if type(data.number) == "number" and math.floor(data.number) == data.number then
            TriggerServerEvent("esx_property:getItem", ESX.GetPlayerData().identifier, data.item.type, data.item.name, tonumber(data.number))
        end]]
        if data.number <= data.item.Nombre then
            if 15.0 >= data.item.Poids*data.number+PoidsTotalPl then
                if type(data.number) == "number" and math.floor(data.number) == data.number then
                    --TriggerServerEvent("esx_trunk:getItem", trunkData.plate, data.item.type, data.item.name, tonumber(data.number), trunkData.max, trunkData.myVeh)
                    local count = tonumber(data.number)

                    if data.item.type == "item_weapon" then
                        count = GetAmmoInPedWeapon(PlayerPedId(), GetHashKey(data.item.name))
                    end
                    if data.item.type == 'argent' then
                        otherdata = 'argent'
                    end
                    TriggerServerEvent("InitialCore:RemoveItemPropriete", LastID, data.item.Nom, count, otherdata, data.item.Data)
                end

                --Wait(250)
                --loadPlayerInventory()
                --TriggerServerEvent('InitialCore:RefreshCoffreVehicle', trunkData.Plaque, GetVehicleClass(lastvehicle))

                Wait(250)
                refreshPropertyInventory()
                loadPlayerInventory()
                cb("ok")
            end
        end
    end
)

RegisterNetEvent('InitialCore:OpenCoffreProperties')
AddEventHandler('InitialCore:OpenCoffreProperties', function(isentreprise, id)
    LastID = id
    TriggerServerCallback("getCoffrePropriete", function(contenu)
        setPropertyInventoryData(contenu)
        openPropertyInventory()
        local CoffreText2 = "Coffre " .. id
        SendNUIMessage(
            {
                action = "setInfoText",
                text = CoffreText2
            }
        )
    end, LastID)
end)