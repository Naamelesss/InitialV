local PlayerInventory
local PlayerArmes
local PlayerMoney

local Keys = {
    ["ESC"] = 322,
    ["F1"] = 288,
    ["F2"] = 289,
    ["F3"] = 170,
    ["F5"] = 166,
    ["F6"] = 167,
    ["F7"] = 168,
    ["F8"] = 169,
    ["F9"] = 56,
    ["F10"] = 57,
    ["~"] = 243,
    ["1"] = 157,
    ["2"] = 158,
    ["3"] = 160,
    ["4"] = 164,
    ["5"] = 165,
    ["6"] = 159,
    ["7"] = 161,
    ["8"] = 162,
    ["9"] = 163,
    ["-"] = 84,
    ["="] = 83,
    ["BACKSPACE"] = 177,
    ["TAB"] = 37,
    ["Q"] = 44,
    ["W"] = 32,
    ["E"] = 38,
    ["R"] = 45,
    ["T"] = 245,
    ["Y"] = 246,
    ["U"] = 303,
    ["P"] = 199,
    ["["] = 39,
    ["]"] = 40,
    ["ENTER"] = 18,
    ["CAPS"] = 137,
    ["A"] = 34,
    ["S"] = 8,
    ["D"] = 9,
    ["F"] = 23,
    ["G"] = 47,
    ["H"] = 74,
    ["K"] = 311,
    ["L"] = 182,
    ["LEFTSHIFT"] = 21,
    ["Z"] = 20,
    ["X"] = 73,
    ["C"] = 26,
    ["V"] = 0,
    ["B"] = 29,
    ["N"] = 249,
    ["M"] = 244,
    [","] = 82,
    ["."] = 81,
    ["LEFTCTRL"] = 36,
    ["LEFTALT"] = 19,
    ["SPACE"] = 22,
    ["RIGHTCTRL"] = 70,
    ["HOME"] = 213,
    ["PAGEUP"] = 10,
    ["PAGEDOWN"] = 11,
    ["DELETE"] = 178,
    ["LEFT"] = 174,
    ["RIGHT"] = 175,
    ["TOP"] = 27,
    ["DOWN"] = 173,
    ["NENTER"] = 201,
    ["N4"] = 108,
    ["N5"] = 60,
    ["N6"] = 107,
    ["N+"] = 96,
    ["N-"] = 97,
    ["N7"] = 117,
    ["N8"] = 61,
    ["N9"] = 118
}

isInInventory = false

RegisterCommand('+inventaire', function()
    openInventory()
end, false)
RegisterCommand('-inventaire', function()
end, false)

RegisterKeyMapping('+inventaire', 'Ouvrir l\'inventaire', 'keyboard', 'TAB')

function openInventory()
    loadPlayerInventory()
    isInInventory = true
    TriggerEvent('InitialCore:BoucleInventoryBlockedKey')
    SendNUIMessage(
        {
            action = "display",
            type = "normal"
        }
    )
    SendNUIMessage({
        update = true,
        status = GetStatusData()
    })
    SetNuiFocus(true, true)
end

function ActualiseStatusBar()
    SendNUIMessage({
        update = true,
        status = GetStatusData()
    })
end

RegisterNetEvent("InitInventaire:doClose")
AddEventHandler("InitInventaire:doClose", function()
    closeInventory()
end)

function closeInventory()
    isInInventory = false
    SendNUIMessage(
        {
            action = "hide"
        }
    )
    SetNuiFocus(false, false)
end

RegisterNUICallback(
    "NUIFocusOff",
    function()
        closeInventory()
    end
)

RegisterNUICallback(
    "GetNearPlayers",
    function(data, cb)
        local playerPed = PlayerPedId()
        local players = GetPlayersInArea(GetEntityCoords(playerPed), 3.0)
        local foundPlayers = false
        local elements = {}

        for i = 1, #players, 1 do
            if players[i] ~= PlayerId() then
                foundPlayers = true

                table.insert(
                    elements,
                    {
                        label = GetPlayerName(players[i]),
                        player = GetPlayerServerId(players[i])
                    }
                )
            end
        end

        if not foundPlayers then
            print('aucun joueur a proximite')
            --exports['b1g_notify']:Notify('false', _U("players_nearby"))
        else
            SendNUIMessage(
                {
                    action = "nearPlayers",
                    foundAny = foundPlayers,
                    players = elements,
                    item = data.item
                }
            )
        end

        cb("ok")
    end
)

local LastHashIDGun = 0
local LastHashGTA = 0

local function AmmoUpdate()
    print('ammuupdate start')
    while LastHashIDGun ~= 0 do
        Wait(5000)
        TriggerServerEvent('InitialCore:InvSyncAmmo', LastHashIDGun, GetAmmoInPedWeapon(GetPlayerPed(-1), GetHashKey(LastHashGTA)))
    end
    LastHashGTA = 0
    print('ammuupdate stop')
end

RegisterNUICallback("UseItem", function(data, cb)

    local retval, PlayerWeaponInHand = GetCurrentPedWeapon(GetPlayerPed(-1), 1)

    --print(data.item.ID)

    if data.item.ID:sub(1, 7) == 'WEAPON_' then
        --print('change')
        if PlayerWeaponInHand ~= GetHashKey(data.item.ID) then
            GiveWeaponToPed(GetPlayerPed(-1), GetHashKey(data.item.ID), 0, false, true)
            SetPedAmmo(GetPlayerPed(-1), GetHashKey(data.item.ID), data.item.Data.Munition)
            LastHashIDGun = data.item.Data.HashID
            LastHashGTA = data.item.ID
            --print(LastHashIDGun)
            AmmoUpdate()
        else
            GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_UNARMED"), 0, false, true)
            LastHashIDGun = 0
        end
        --else
           -- AdvancedNotif('Initial V', '~r~Inventaire', 'Vous devez ranger votre arme d\'abord.', 'CHAR_WE', 'INITIALV')
        --end
            
    else
        TriggerEvent("InitialCore:useItem", data.item.ID, data.item.Data)
    end
    if shouldCloseInventory(data.item.Nom) then --##/
        closeInventory()
    else
        Citizen.Wait(250)
        loadPlayerInventory()
    end

    cb("ok")
end)

RegisterNUICallback("DropItem", function(data, cb)
    if IsPedSittingInAnyVehicle(playerPed) then
        return
    end

    print(data.item.Nombre)
    if type(data.number) == "number" and math.floor(data.number) == data.number then
        if data.item.Nombre >= data.number then
            TriggerServerEvent("InitialCore:DeleteItemPlayer", GetPlayerServerId(PlayerId()), data.item.ID, data.number)
        else
            AdvancedNotif('Initial V', '~r~Inventaire', 'Vous n\'avez pas assez d\'objet dans votre inventaire.', 'CHAR_WE', 'INITIALV')
        end
    end

    Wait(250)
    loadPlayerInventory()

    cb("ok")
end)

RegisterNUICallback("GiveItem", function(data, cb)
    local playerPed = PlayerPedId()
    local players, nearbyPlayer = GetPlayersInArea(GetEntityCoords(playerPed), 3.0)
    local foundPlayer = false
    for i = 1, #players, 1 do
        if players[i] ~= PlayerId() then
            if GetPlayerServerId(players[i]) == data.player then
                foundPlayer = true
            end
        end
    end

    if foundPlayer then
        local count = tonumber(data.number)

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
        loadPlayerInventory()
    else
        -- NO NEARBY
    end
    cb("ok")
end)

function shouldCloseInventory(itemName)
    for index, value in ipairs(Config.CloseUiItems) do
        if value == itemName then
            return true
        end
    end

    return false
end

function shouldSkipAccount(accountName)
    for index, value in ipairs(Config.ExcludeAccountsList) do
        if value == accountName then
            return true
        end
    end

    return false
end

RegisterNetEvent('InitialCore:GetPlayerInv')
AddEventHandler('InitialCore:GetPlayerInv', function(PlayerInventoryResult, PlayerArmesResult, PlayerMoneyResult)
    PlayerInventory = PlayerInventoryResult
    PlayerArmes = PlayerArmesResult
    PlayerMoney = PlayerMoneyResult
    PoidsTotalPl = 0

    argentData = {
        ID = "argent",
        Nom = "Argent",
        Poids = 0.00001*PlayerMoney,
        Nombre = PlayerMoney,
    }

    table.insert(PlayerInventory, argentData)

    for k, v in pairs(PlayerArmes) do
        --print(k)
        --print(v.Data.Munition)
        --for y, u in pairs(v) do
            --print(y)
            --print(u)
        --end
        --print(k)
        --print(v.ID)
        --print(v.ID)
        --print(v.Nom)
        --print(v.Data)
        armesData = {
            ID = v.ID,
            Nom = v.Nom,
            Poids = 1.000,
            Nombre = 1,
            Data = v.Data
        }
        --print(Data)
        table.insert(PlayerInventory, armesData)
    end

    --[[for key, value in pairs(weapons) do
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
    end]]
    for k, v in pairs (PlayerInventory) do
        PoidsTotalPl = PoidsTotalPl+v.Poids*v.Nombre
    end
    print(PoidsTotalPl)
    MessagePoids = "Poids de l'inventaire : " .. PoidsTotalPl .. "/15 kg"
    SendNUIMessage(
    {
        action = "setPoidsPl",
        PoidsPl = MessagePoids
    })
    SendNUIMessage(
    {
        action = "setItems",
        itemList = PlayerInventory
    })
end)

function loadPlayerInventory()
    TriggerServerEvent('InitialCore:GetPlayerInvS')
    --[[ESX.TriggerServerCallback(
        "InitInventaire:getPlayerInventory",
        function(data)
            items = {}
            inventory = data.inventory
            accounts = data.accounts
            money = data.money
            weapons = data.weapons

            if Config.IncludeCash and money ~= nil and money > 0 then
                moneyData = {
                    label = _U("cash"),
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
                    action = "setItems",
                    itemList = items
                }
            )
        end,
        GetPlayerServerId(PlayerId())
    )]]
end

AddEventHandler('InitialCore:BoucleInventoryBlockedKey', function()
    while true do
        Wait(1)
        if isInInventory then
            local playerPed = PlayerPedId()
            DisableControlAction(0, 1, true) -- Disable pan
            DisableControlAction(0, 2, true) -- Disable tilt
            DisableControlAction(0, 24, true) -- Attack
            DisableControlAction(0, 257, true) -- Attack 2
            DisableControlAction(0, 25, true) -- Aim
            DisableControlAction(0, 263, true) -- Melee Attack 1
            DisableControlAction(0, Keys["W"], true) -- W
            DisableControlAction(0, Keys["A"], true) -- A
            DisableControlAction(0, 31, true) -- S (fault in Keys table!)
            DisableControlAction(0, 30, true) -- D (fault in Keys table!)

            DisableControlAction(0, Keys["R"], true) -- Reload
            DisableControlAction(0, Keys["SPACE"], true) -- Jump
            DisableControlAction(0, Keys["Q"], true) -- Cover
            DisableControlAction(0, Keys["TAB"], true) -- Select Weapon
            DisableControlAction(0, Keys["F"], true) -- Also 'enter'?

            DisableControlAction(0, Keys["F1"], true) -- Disable phone
            DisableControlAction(0, Keys["F2"], true) -- Inventory
            DisableControlAction(0, Keys["F3"], true) -- Animations
            DisableControlAction(0, Keys["F6"], true) -- Job

            DisableControlAction(0, Keys["V"], true) -- Disable changing view
            DisableControlAction(0, Keys["C"], true) -- Disable looking behind
            DisableControlAction(0, Keys["X"], true) -- Disable clearing animation
            DisableControlAction(2, Keys["P"], true) -- Disable pause screen

            DisableControlAction(0, 59, true) -- Disable steering in vehicle
            DisableControlAction(0, 71, true) -- Disable driving forward in vehicle
            DisableControlAction(0, 72, true) -- Disable reversing in vehicle

            DisableControlAction(2, Keys["LEFTCTRL"], true) -- Disable going stealth

            DisableControlAction(0, 47, true) -- Disable weapon
            DisableControlAction(0, 264, true) -- Disable melee
            DisableControlAction(0, 257, true) -- Disable melee
            DisableControlAction(0, 140, true) -- Disable melee
            DisableControlAction(0, 141, true) -- Disable melee
            DisableControlAction(0, 142, true) -- Disable melee
            DisableControlAction(0, 143, true) -- Disable melee
            DisableControlAction(0, 75, true) -- Disable exit vehicle
            DisableControlAction(27, 75, true) -- Disable exit vehicle
        end
    end
end)