-- Server Callback

ServerCallbacks = {}

RegisterServerEvent('trigger_server_callback')
AddEventHandler('trigger_server_callback', function(name, requestId, ...)
    local _source = source
    TriggerServerCallback(name, requestID, _source, function(...)
        TriggerClientEvent('server_callback', _source, requestId, ...)
    end, ...)
end)

RegisterServerCallback = function(name, cb)
    ServerCallbacks[name] = cb
end

TriggerServerCallback = function(name, requestId, source, cb, ...)
    if ServerCallbacks[name] ~= nil then
        ServerCallbacks[name](source, cb, ...)
    else
    end
end

-- PLAYER

local SteamDon
local SteamRec
local SteamDonObj
local SteamRecObj

-- ARGENT

RegisterServerEvent('InitialCore:GiveMoney')
AddEventHandler('InitialCore:GiveMoney', function(joueur, montant)
    local SteamDon = GetPlayerIdentifier(joueur)
    MySQL.Async.fetchAll("SELECT Argent FROM playerinfo WHERE SteamID='" ..  SteamDon .. "'", {}, function(moneyinfo)
        local MoneyToMovePlayer = moneyinfo[1].Argent + montant
        TriggerClientEvent('InitialCore:ModifArgent', joueur, MoneyToMovePlayer)
        MySQL.Async.execute("UPDATE playerinfo SET Argent=" .. MoneyToMovePlayer .. " WHERE SteamID='" .. SteamDon .. "'", {}, function() end)
    end)
        
    print("^0[^1InitialCore^0] ^2Give d'argent : " .. SteamDon .. " (" .. montant .. "$)^0")
end)

RegisterServerEvent('InitialCore:TransferMoney')
AddEventHandler('InitialCore:TransferMoney', function(donateur, receveur, montant)
    local SteamDon = GetPlayerIdentifier(donateur)
    local SteamRem = GetPlayerIdentifier(receveur)
    MySQL.Async.fetchAll("SELECT Argent FROM playerinfo WHERE SteamID='" ..  SteamDon .. "'", {}, function(moneyinfo)
        local MoneyToMovePlayer = moneyinfo[1].Argent - montant
        TriggerClientEvent('InitialCore:ModifArgent', donateur, MoneyToMovePlayer)
        MySQL.Async.execute("UPDATE playerinfo SET Argent=" .. MoneyToMovePlayer .. " WHERE SteamID='" .. SteamDon .. "'", {}, function() end)
    end)
    MySQL.Async.fetchAll("SELECT Argent FROM playerinfo WHERE SteamID='" ..  SteamRem .. "'", {}, function(moneyinfo)
        local MoneyToMovePlayer = moneyinfo[1].Argent + montant
        TriggerClientEvent('InitialCore:ModifArgent', receveur, MoneyToMovePlayer)
        MySQL.Async.execute("UPDATE playerinfo SET Argent=" .. MoneyToMovePlayer .. " WHERE SteamID='" .. SteamRem .. "'", {}, function() end)
    end)
        
    print("^0[^1InitialCore^0] ^2Transfert d'argent : " .. SteamDon .. " vers " .. SteamRec .. " (" .. montant .. "$)^0")
end)

RegisterServerEvent('InitialCore:RemoveMoney')
AddEventHandler('InitialCore:RemoveMoney', function(joueur, montant)
    local SteamRem = GetPlayerIdentifier(joueur)
    MySQL.Async.fetchAll("SELECT Argent FROM playerinfo WHERE SteamID='" ..  SteamRem .. "'", {}, function(moneyinfo)
        local MoneyToMovePlayer = moneyinfo[1].Argent - montant
        TriggerClientEvent('InitialCore:ModifArgent', joueur, MoneyToMovePlayer)
        MySQL.Async.execute("UPDATE playerinfo SET Argent=" .. MoneyToMovePlayer .. " WHERE SteamID='" .. SteamRem .. "'", {}, function() end)
    end)
        
    print("^0[^1InitialCore^0] ^2Retrait d'argent : " .. SteamRem .. " (" .. montant .. "$)^0")
end)

-- ITEM

RegisterServerEvent('InitialCore:GiveItem')
AddEventHandler('InitialCore:GiveItem', function(player, item, nombre, data)
    local SteamID = GetPlayerIdentifier(player)
    MySQL.Async.fetchAll("SELECT Inventaire FROM playerinfo WHERE SteamID='" ..  SteamID .. "'", {}, function(resultgetinv)
        if resultgetinv[1] ~= nil then
            if resultgetinv[1].Inventaire ~= nil then
                local PlayerInv = json.decode(resultgetinv[1].Inventaire)

                
                if data then
                    local metadataid = math.random(1, 999)
                    local itemid = item .. metadataid
                    if not PlayerInv[itemid] then PlayerInv[itemid] = {} PlayerInv[itemid].Montant = 0 end
                    PlayerInv[itemid].Montant = PlayerInv[itemid].Montant+nombre
                    PlayerInv[itemid].Data = data
                else
                    if not PlayerInv[item] then PlayerInv[item] = {} PlayerInv[item].Montant = 0 end
                    PlayerInv[item].Montant = PlayerInv[item].Montant+nombre
                end

                MySQL.Async.execute("UPDATE playerinfo SET Inventaire='" .. json.encode(PlayerInv) .. "' WHERE SteamID='" .. SteamID .. "'", {}, function()
                    --TriggerClientEvent('InitialCore:AdvancedNotif', donateur, 'Initial V', '~r~Inventaire', 'Vous avez donné ' .. montant .. ' ' .. item .. '.', 'CHAR_WE', 'INITIALV')
                end)
            end
        end
    end)
    --print("^0[^1InitialCore^0] ^2Transfert d'objet : " .. SteamDon .. " vers " .. SteamRec .. " (" .. montant .. "$)^0")
end)

RegisterServerEvent('InitialCore:TransferItem')
AddEventHandler('InitialCore:TransferItem', function(donateur, receveur, item, montant)
    --Wait(100)
    local DataItem = false
    SteamDonObj = GetPlayerIdentifier(donateur)
    SteamRecObj = GetPlayerIdentifier(receveur)

    MySQL.Async.fetchAll("SELECT Inventaire FROM playerinfo WHERE SteamID='" ..  SteamDonObj .. "'", {}, function(resultgetinv)
        if resultgetinv[1] ~= nil then
            if resultgetinv[1].Inventaire ~= nil then
                local PlayerInvDona = json.decode(resultgetinv[1].Inventaire)
                PlayerInvDona[item].Montant = PlayerInvDona[item].Montant-montant
                if PlayerInvDona[item].Data then
                    DataItem = PlayerInvDona[item].Data
                end
                MySQL.Async.execute("UPDATE playerinfo SET Inventaire='" .. json.encode(PlayerInvDona) .. "' WHERE SteamID='" .. SteamDonObj .. "'", {}, function()
                    TriggerClientEvent('InitialCore:AdvancedNotif', donateur, 'Initial V', '~r~Inventaire', 'Vous avez donné ' .. montant .. ' ' .. item .. '.', 'CHAR_WE', 'INITIALV')
                end)

                MySQL.Async.fetchAll("SELECT Inventaire FROM playerinfo WHERE SteamID='" ..  SteamRecObj .. "'", {}, function(resultgetinv2)
                    if resultgetinv2[1] ~= nil then
                        if resultgetinv2[1].Inventaire ~= nil then
            
                            local PlayerInvRece = json.decode(resultgetinv2[1].Inventaire)
            
                            if PlayerInvRece[item] then
                                PlayerInvRece[item].Montant = PlayerInvRece[item].Montant+montant
                            else
                                PlayerInvRece[item] = {}
                                PlayerInvRece[item].Montant = montant
                            end
                            if DataItem then
                                PlayerInvRece[item].Data = DataItem
                            end
            
                            MySQL.Async.execute("UPDATE playerinfo SET Inventaire='" .. json.encode(PlayerInvRece) .. "' WHERE SteamID='" .. SteamRecObj .. "'", {}, function()
                                TriggerClientEvent('InitialCore:AdvancedNotif', receveur, 'Initial V', '~r~Inventaire', 'Quelqu\'un vous as donné ' .. montant .. ' ' .. item .. '.', 'CHAR_WE', 'INITIALV')
                            end)
                        end
                    end
                end) 
            end
        end
    end)
    --print("^0[^1InitialCore^0] ^2Transfert d'objet : " .. SteamDon .. " vers " .. SteamRec .. " (" .. montant .. "$)^0")
end)

RegisterServerEvent('InitialCore:ChangeData')
AddEventHandler('InitialCore:ChangeData', function(item, data)
    local SteamID = GetPlayerIdentifier(source)
    --print(item)
    --print(data)
    --print('caca')
    MySQL.Async.fetchAll("SELECT Inventaire FROM playerinfo WHERE SteamID='" ..  SteamID .. "'", {}, function(resultgetinv)
        if resultgetinv[1] ~= nil then
            if resultgetinv[1].Inventaire ~= nil then
                local PlayerInv = json.decode(resultgetinv[1].Inventaire)
                PlayerInv[item].Data = data
                MySQL.Async.execute("UPDATE playerinfo SET Inventaire='" .. json.encode(PlayerInv) .. "' WHERE SteamID='" .. SteamID .. "'", {}, function()
                    --TriggerClientEvent('InitialCore:AdvancedNotif', donateur, 'Initial V', '~r~Inventaire', 'Vous avez donné ' .. montant .. ' ' .. item .. '.', 'CHAR_WE', 'INITIALV')
                end)
            end
        end
    end)
    --print("^0[^1InitialCore^0] ^2Transfert d'objet : " .. SteamDon .. " vers " .. SteamRec .. " (" .. montant .. "$)^0")
end)

RegisterServerEvent('InitialCore:DeleteItem')
AddEventHandler('InitialCore:DeleteItem', function(player, item, nombre)
    local SteamID = GetPlayerIdentifier(player)
    MySQL.Async.fetchAll("SELECT Inventaire FROM playerinfo WHERE SteamID='" ..  SteamID .. "'", {}, function(resultgetinv)
        if resultgetinv[1] ~= nil then
            if resultgetinv[1].Inventaire ~= nil then
                local PlayerInv = json.decode(resultgetinv[1].Inventaire)
                PlayerInv[item].Montant = PlayerInv[item].Montant-nombre
                MySQL.Async.execute("UPDATE playerinfo SET Inventaire='" .. json.encode(PlayerInv) .. "' WHERE SteamID='" .. SteamID .. "'", {}, function()
                    --TriggerClientEvent('InitialCore:AdvancedNotif', donateur, 'Initial V', '~r~Inventaire', 'Vous avez donné ' .. montant .. ' ' .. item .. '.', 'CHAR_WE', 'INITIALV')
                end)
            end
        end
    end)
    --print("^0[^1InitialCore^0] ^2Transfert d'objet : " .. SteamDon .. " vers " .. SteamRec .. " (" .. montant .. "$)^0")
end)

--[[RegisterServerEvent('InitialCore:GiveWeapon')
AddEventHandler('InitialCore:GiveWeapon', function(player, item, nombre, data)
    local SteamID = GetPlayerIdentifier(player)
    MySQL.Async.fetchAll("SELECT Armes FROM playerinfo WHERE SteamID='" ..  SteamID .. "'", {}, function(resultgetinv)
        if resultgetinv[1] ~= nil then
            if resultgetinv[1].Armes ~= nil then
                local PlayerInv = json.decode(resultgetinv[1].Armes)

                
                if data then
                    local metadataid = math.random(1, 999)
                    local itemid = item .. metadataid
                    if not PlayerInv[itemid] then PlayerInv[itemid] = {} PlayerInv[itemid].Montant = 0 end
                    PlayerInv[itemid].Montant = PlayerInv[itemid].Montant+nombre
                    PlayerInv[itemid].Data = data
                else
                    if not PlayerInv[item] then PlayerInv[item] = {} PlayerInv[item].Montant = 0 end
                    PlayerInv[item].Montant = PlayerInv[item].Montant+nombre
                end

                MySQL.Async.execute("UPDATE playerinfo SET Armes='" .. json.encode(PlayerInv) .. "' WHERE SteamID='" .. SteamID .. "'", {}, function()
                    --TriggerClientEvent('InitialCore:AdvancedNotif', donateur, 'Initial V', '~r~Inventaire', 'Vous avez donné ' .. montant .. ' ' .. item .. '.', 'CHAR_WE', 'INITIALV')
                end)
            end
        end
    end)
    --print("^0[^1InitialCore^0] ^2Transfert d'objet : " .. SteamDon .. " vers " .. SteamRec .. " (" .. montant .. "$)^0")
end)]]

RegisterServerEvent('InitialCore:GiveWeapon')
AddEventHandler('InitialCore:GiveWeapon', function(player, item, nombre, munition, hashid)
    local SteamID = GetPlayerIdentifier(player)
    MySQL.Async.fetchAll("SELECT Armes FROM playerinfo WHERE SteamID='" ..  SteamID .. "'", {}, function(resultgetinv)
        if resultgetinv[1] ~= nil then
            if resultgetinv[1].Armes ~= nil then
                local PlayerInv = json.decode(resultgetinv[1].Armes)

                --local InsertVar = 

                table.insert(PlayerInv, 1, {
                    ID = item,
                    Data = {Munition = munition or 0, HashID = hashid or math.random(10000, 9999999)}
                })

                --print("vv" .. json.encode(PlayerInv))

                MySQL.Async.execute("UPDATE playerinfo SET Armes='" .. json.encode(PlayerInv) .. "' WHERE SteamID='" .. SteamID .. "'", {}, function()
                    --TriggerClientEvent('InitialCore:AdvancedNotif', donateur, 'Initial V', '~r~Inventaire', 'Vous avez donné ' .. montant .. ' ' .. item .. '.', 'CHAR_WE', 'INITIALV')
                end)

                --[[if data then
                    local metadataid = math.random(1, 999)
                    local itemid = item .. metadataid
                    if not PlayerInv[itemid] then PlayerInv[itemid] = {} PlayerInv[itemid].Montant = 0 end
                    PlayerInv[itemid].Montant = PlayerInv[itemid].Montant+nombre
                    PlayerInv[itemid].Data = data
                else
                    if not PlayerInv[item] then PlayerInv[item] = {} PlayerInv[item].Montant = 0 end
                    PlayerInv[item].Montant = PlayerInv[item].Montant+nombre
                end

                MySQL.Async.execute("UPDATE playerinfo SET Armes='" .. json.encode(PlayerInv) .. "' WHERE SteamID='" .. SteamID .. "'", {}, function()
                    --TriggerClientEvent('InitialCore:AdvancedNotif', donateur, 'Initial V', '~r~Inventaire', 'Vous avez donné ' .. montant .. ' ' .. item .. '.', 'CHAR_WE', 'INITIALV')
                end)]]
            end
        end
    end)
    --print("^0[^1InitialCore^0] ^2Transfert d'objet : " .. SteamDon .. " vers " .. SteamRec .. " (" .. montant .. "$)^0")
end)

--[[RegisterServerEvent('InitialCore:TransferWeapon')
AddEventHandler('InitialCore:TransferWeapon', function(donateur, receveur, item, montant)
    --Wait(100)
    local DataItem = false
    SteamDonObj = GetPlayerIdentifier(donateur)
    SteamRecObj = GetPlayerIdentifier(receveur)

    MySQL.Async.fetchAll("SELECT Armes FROM playerinfo WHERE SteamID='" ..  SteamDonObj .. "'", {}, function(resultgetinv)
        if resultgetinv[1] ~= nil then
            if resultgetinv[1].Inventaire ~= nil then
                local PlayerInvDona = json.decode(resultgetinv[1].Inventaire)
                PlayerInvDona[item].Montant = PlayerInvDona[item].Montant-montant
                if PlayerInvDona[item].Data then
                    DataItem = PlayerInvDona[item].Data
                end
                MySQL.Async.execute("UPDATE playerinfo SET Inventaire='" .. json.encode(PlayerInvDona) .. "' WHERE SteamID='" .. SteamDonObj .. "'", {}, function()
                    TriggerClientEvent('InitialCore:AdvancedNotif', donateur, 'Initial V', '~r~Inventaire', 'Vous avez donné ' .. montant .. ' ' .. item .. '.', 'CHAR_WE', 'INITIALV')
                end)

                MySQL.Async.fetchAll("SELECT Inventaire FROM playerinfo WHERE SteamID='" ..  SteamRecObj .. "'", {}, function(resultgetinv2)
                    if resultgetinv2[1] ~= nil then
                        if resultgetinv2[1].Inventaire ~= nil then
            
                            local PlayerInvRece = json.decode(resultgetinv2[1].Inventaire)
            
                            if PlayerInvRece[item] then
                                PlayerInvRece[item].Montant = PlayerInvRece[item].Montant+montant
                            else
                                PlayerInvRece[item] = {}
                                PlayerInvRece[item].Montant = montant
                            end
                            if DataItem then
                                PlayerInvRece[item].Data = DataItem
                            end
            
                            MySQL.Async.execute("UPDATE playerinfo SET Inventaire='" .. json.encode(PlayerInvRece) .. "' WHERE SteamID='" .. SteamRecObj .. "'", {}, function()
                                TriggerClientEvent('InitialCore:AdvancedNotif', receveur, 'Initial V', '~r~Inventaire', 'Quelqu\'un vous as donné ' .. montant .. ' ' .. item .. '.', 'CHAR_WE', 'INITIALV')
                            end)
                        end
                    end
                end) 
            end
        end
    end)
    --print("^0[^1InitialCore^0] ^2Transfert d'objet : " .. SteamDon .. " vers " .. SteamRec .. " (" .. montant .. "$)^0")
end)]]

RegisterServerEvent('InitialCore:DeleteWeapon')
AddEventHandler('InitialCore:DeleteWeapon', function(player, item, nombre, metadataid)
    local SteamID = GetPlayerIdentifier(player)
    MySQL.Async.fetchAll("SELECT Armes FROM playerinfo WHERE SteamID='" ..  SteamID .. "'", {}, function(resultgetinv)
        if resultgetinv[1] ~= nil then
            if resultgetinv[1].Armes ~= nil then
                local PlayerInv = json.decode(resultgetinv[1].Armes)
                for k, v in pairs(PlayerInv) do
                    if v.Data.HashID == metadataid then
                        table.remove(PlayerInv, k)
                        --PlayerInv[item].Montant = PlayerInv[item].Montant-nombre
                        MySQL.Async.execute("UPDATE playerinfo SET Armes='" .. json.encode(PlayerInv) .. "' WHERE SteamID='" .. SteamID .. "'", {}, function()
                            --   TriggerClientEvent('InitialCore:AdvancedNotif', donateur, 'Initial V', '~r~Inventaire', 'Vous avez donné ' .. nombre .. ' ' .. item .. '.', 'CHAR_WE', 'INITIALV')
                        end)
                    end
                end
            end
        end
    end)
    --print("^0[^1InitialCore^0] ^2Transfert d'objet : " .. SteamDon .. " vers " .. SteamRec .. " (" .. montant .. "$)^0")
end)

--[[RegisterServerEvent('InitialCore:TransferArmeToPlayer')
AddEventHandler('InitialCore:TransferArmeToPlayer', function(donateur, receveur, arme, montant)

    if donateur ~= "CONSOLE" then
        SteamDonArme = GetPlayerIdentifier(donateur)
    else
        SteamDonArme = "CONSOLE"
    end
    if receveur ~= "CONSOLE" then
        SteamRecArme = GetPlayerIdentifier(receveur)
    else
        SteamRecArme = "CONSOLE"
    end

    MySQL.Async.fetchAll("SELECT Armes FROM playerinfo WHERE SteamID='" ..  SteamDonArme .. "'", {}, function(resultgetarme)
        if resultgetarme[1] ~= nil then
            if resultgetarme[1].Armes ~= nil then
                local PlayerInv = json.decode(resultgetarme[1].Armes)

                PlayerInv[arme] = PlayerInv[arme]-montant

                MySQL.Async.execute("UPDATE playerinfo SET Armes='" .. json.encode(PlayerInv) .. "' WHERE SteamID='" .. SteamDonArme .. "'", {}, function()
                    TriggerClientEvent('InitialCore:AdvancedNotif', donateur, 'Initial V', '~r~Armes', 'Vous avez donné ' .. montant .. ' ' .. arme .. '.', 'CHAR_WE', 'INITIALV')
                end)
            end
        end
    end)

    MySQL.Async.fetchAll("SELECT Armes FROM playerinfo WHERE SteamID='" ..  SteamRecArme .. "'", {}, function(resultgetarme)
        if resultgetarme[1] ~= nil then
            if resultgetarme[1].Armes ~= nil then
                local PlayerInv = json.decode(resultgetarme[1].Armes)

                    if PlayerInv[arme] ~= nil then
                        PlayerInv[arme] = PlayerInv[arme]+montant
                    else
                        PlayerInv[arme] = 1
                    end

                MySQL.Async.execute("UPDATE playerinfo SET Armes='" .. json.encode(PlayerInv) .. "' WHERE SteamID='" .. SteamRecArme .. "'", {}, function()
                    TriggerClientEvent('InitialCore:AdvancedNotif', receveur, 'Initial V', '~r~Armes', 'Quelqu\'un vous as donné ' .. montant .. ' ' .. arme .. '.', 'CHAR_WE', 'INITIALV')
                end)
            end
        end
    end)
end)

RegisterServerEvent('InitialCore:DeleteItemPlayer')
AddEventHandler('InitialCore:DeleteItemPlayer', function(joueur, item, montant)

    --Wait(100)

    local SteamID = GetPlayerIdentifier(joueur)

    MySQL.Async.fetchAll("SELECT Inventaire FROM playerinfo WHERE SteamID='" ..  SteamID .. "'", {}, function(resultgetinv)
        if resultgetinv[1] ~= nil then
            if resultgetinv[1].Inventaire ~= nil then
                local PlayerInv = json.decode(resultgetinv[1].Inventaire)

                PlayerInv[item] = PlayerInv[item]-montant

                MySQL.Async.execute("UPDATE playerinfo SET Inventaire='" .. json.encode(PlayerInv) .. "' WHERE SteamID='" .. SteamID .. "'", {}, function()
                end)
            end
        end
    end)
        
    --print("^0[^1InitialCore^0] ^2Transfert d'objet : " .. SteamDon .. " vers " .. SteamRec .. " (" .. montant .. "$)^0")
end)]]

RegisterServerCallback('InitialCore:hasObject', function(source, callback, ID)
    local PlayerSteamID = GetPlayerIdentifier(source)
    MySQL.Async.fetchAll("SELECT Inventaire FROM playerinfo WHERE SteamID='" ..  PlayerSteamID .. "'", {}, function(resultgetinv)
        if resultgetinv[1] ~= nil then
            if resultgetinv[1].Inventaire ~= nil then
                PlayerInv = json.decode(resultgetinv[1].Inventaire)
                local hasObjectVar = false
                for k in pairs (PlayerInv) do
                    if k == ID and PlayerInv[k].Montant > 0 then
                        callback(true, PlayerInv[k].Montant)
                        hasObjectVar = true
                        break
                    end
                end
                if not hasObjectVar then
                    callback(false)
                end
            else
                callback(false)
            end
        else
            callback(false)
        end
    end)
end)

RegisterServerCallback('InitialCore:getMoney', function(source, callback)
    local PlayerSteamID = GetPlayerIdentifier(source)
    MySQL.Async.fetchAll("SELECT Argent FROM playerinfo WHERE SteamID='" ..  PlayerSteamID .. "'", {}, function(moneyinfo)
        callback(moneyinfo[1].Argent)
    end)
end)