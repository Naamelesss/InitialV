local targetPlayer
local targetPlayerName

RegisterNetEvent("InitInventaire:openPlayerInventory")
AddEventHandler("InitInventaire:openPlayerInventory", function(target, playerName)
	--PlayerData = ESX.GetPlayerData()
	--if PlayerData.job and PlayerData.job.name == 'police' or PlayerData.job.name == 'ambulance' then
        	targetPlayer = target
        	--targetPlayerName = playerName
        	setPlayerInventoryData()
            openPlayerInventory()
            TriggerServerEvent('InitialCore:SearchAlert', targetPlayer)
	--else
	--	ESX.ShowNotification('Bad boy. -nertigel')
		-- add discord log if you would like to fag
	--end
end)

RegisterNetEvent('InitialCore:SearchAlertC')
AddEventHandler('InitialCore:SearchAlertC', function()
    AdvancedNotif('Initial V', '~r~Inventaire', 'Quelq\'un vous fouille.', 'CHAR_WE', 'INITIALV')
end)

function refreshPlayerInventory()
    setPlayerInventoryData()
end

local PlayerInventory
local PlayerArmes
local PlayerMoney

function setPlayerInventoryData()
    --print('szs')
    TriggerServerCallback('InitInventaire:getPlayerOtherInventory', function(PlayerInventoryResult, PlayerArmesResult, PlayerMoneyResult)
        PlayerInventory = PlayerInventoryResult
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
        

            table.insert(PlayerInventory, argentData)

        end
        if PlayerArmes then
            for k, v in pairs(PlayerArmes) do
                --print(k)
                --print(v.Nombre)
                armesData = {
                    ID = v.ID,
                    Nom = v.Nom,
                    Poids = 1.500,
                    Nombre = v.Nombre,
                }
                table.insert(PlayerInventory, armesData)
            end
        end

        for k, v in pairs (PlayerInventory) do
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
            itemList = PlayerInventory
        })
    end, targetPlayer)

    --[[
    ESX.TriggerServerCallback("InitInventaire:getPlayerOtherInventory", function(data)
            SendNUIMessage(
                {
                    action = "setInfoText",
                    text = "<strong>" .. "player_inventory" .. "</strong><br>" .. targetPlayerName .. " (" .. targetPlayer .. ")"
                }
            )

            items = {}
            inventory = data.inventory
            accounts = data.accounts
            money = data.money
            weapons = data.weapons

            if Config.IncludeCash and money ~= nil and money > 0 then
                for key, value in pairs(accounts) do
                    moneyData = {
                        label = "cash",
                        name = "cash",
                        type = "item_money",
                        count = money,
                        usable = false,
                        rare = false,
                        limit = -1,
                        canRemove = true
                    }

                    table.insert(items, moneyData)
                end
            end

            if Config.IncludeAccounts and accounts ~= nil then
                for key, value in pairs(accounts) do
                    if not shouldSkipAccount(accounts[key].name) then
                        local canDrop = accounts[key].name ~= "bank"

                        if accounts[key].money > 0 then
                            accountData = {
                                label = accounts[key].label,
                                count = accounts[key].money,
                                type = "item_account",
                                name = accounts[key].name,
                                usable = false,
                                rare = false,
                                limit = -1,
                                canRemove = canDrop
                            }
                            table.insert(items, accountData)
                        end
                    end
                end
            end

            if inventory ~= nil then
                for key, value in pairs(inventory) do
                    if inventory[key].count <= 0 then
                        inventory[key] = nil
                    else
                        inventory[key].type = "item_standard"
                        table.insert(items, inventory[key])
                    end
                end
            end

            if Config.IncludeWeapons and weapons ~= nil then
                for key, value in pairs(weapons) do
                    local weaponHash = GetHashKey(weapons[key].name)
                    local playerPed = PlayerPedId()
                    if weapons[key].name ~= "WEAPON_UNARMED" then
                        local ammo = GetAmmoInPedWeapon(playerPed, weaponHash)
                        table.insert(
                            items,
                            {
                                label = weapons[key].label,
                                count = ammo,
                                limit = -1,
                                type = "item_weapon",
                                name = weapons[key].name,
                                usable = false,
                                rare = false,
                                canRemove = true
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
        end,
        targetPlayer
    )]]
end

function openPlayerInventory()
    loadPlayerInventory()
    isInInventory = true

    --setPlayerInventoryData()

    SendNUIMessage(
        {
            action = "display",
            type = "player"
        }
    )

    SetNuiFocus(true, true)
end

RegisterNUICallback("PutIntoPlayer", function(data, cb)
    print("caca")
    if IsPedSittingInAnyVehicle(playerPed) then
        return
    end

    if type(data.number) == "number" and math.floor(data.number) == data.number then
        local count = tonumber(data.number)

        if data.item.type == "item_weapon" then
            count = GetAmmoInPedWeapon(PlayerPedId(), GetHashKey(data.item.name))
        end

        TriggerServerEvent("InitInventaire:tradePlayerItem", GetPlayerServerId(PlayerId()), targetPlayer, data.item.type, data.item.name, count)
    end

    Wait(250)
    refreshPlayerInventory()
    loadPlayerInventory()

    cb("ok")
end)

RegisterNUICallback("TakeFromPlayer", function(data, cb)
    --[[print("caca qi pu")
    if IsPedSittingInAnyVehicle(playerPed) then
        return
    end
    
    if type(data.number) == "number" and math.floor(data.number) == data.number then
        local count = tonumber(data.number)

        if data.item.type == "item_weapon" then
            count = GetAmmoInPedWeapon(PlayerPedId(), GetHashKey(data.item.name))
        end

        TriggerServerEvent("InitInventaire:tradePlayerItem", targetPlayer, GetPlayerServerId(PlayerId()), data.item.type, data.item.name, count)
    end

    Wait(250)
    refreshPlayerInventory()
    loadPlayerInventory()

    cb("ok")]]

    local count = tonumber(data.number)

    if data.item.ID == "item_weapon" then
        count = GetAmmoInPedWeapon(PlayerPedId(), GetHashKey(data.item.name))
    end

    if data.item.Nombre >= count then
        if data.item.ID == "argent" then
            TriggerServerEvent('InitialCore:TransferMoney', GetPlayerServerId(PlayerId()), data.player, count)
        else
            TriggerServerEvent("InitialCore:TransferItem", targetPlayer, GetPlayerServerId(PlayerId()), data.item.ID, count)
        end
    else
        AdvancedNotif('Initial V', '~r~Inventaire', 'Vous n\'avez pas assez d\'objet dans votre inventaire.', 'CHAR_WE', 'INITIALV')
    end
    Wait(250)
    refreshPlayerInventory()
    loadPlayerInventory()

    --[[local count = tonumber(data.number)

        if data.item.ID == "item_weapon" then
            count = GetAmmoInPedWeapon(PlayerPedId(), GetHashKey(data.item.name))
        end

        if data.item.Nombre >= count then
            if data.item.ID == "argent" then
                TriggerServerEvent('InitialCore:TransferMoney', GetPlayerServerId(PlayerId()), data.player, count)
            else
                print(data.item.ID)
                TriggerServerEvent("InitialCore:TransferItem", GetPlayerServerId(PlayerId()), data.player, data.item.ID, count)
            end
        else
            AdvancedNotif('Initial V', '~r~Inventaire', 'Vous n\'avez pas assez d\'objet dans votre inventaire.', 'CHAR_WE', 'INITIALV')
        end

        Wait(1000)
        loadPlayerInventory()]]
end)
