Citizen.CreateThread(function()
	while true do
        local players = GetPlayers()

        for _, playerId in ipairs(players) do
            local PlayerIdentifier = GetPlayerIdentifier(playerId)

            MySQL.Async.fetchAll('SELECT Status FROM playerinfo WHERE SteamID = @identifier', {
                ['@identifier'] = PlayerIdentifier
            }, function(result)
                local data

                if result[1].Status then
                    if result[1].Status == '{}' then
                    data = json.decode('{"faim":50, "soif":50}')
                    else
                    data = json.decode(result[1].Status)
                    end
                end

                if data.faim > 0 then
                    data.faim = data.faim-0.70
                end
                if data.soif > 0 then
                    data.soif = data.soif-1
                end

                MySQL.Async.execute("UPDATE playerinfo SET Status='" .. json.encode(data) .. "' WHERE SteamID='" .. PlayerIdentifier .. "'", {}, function()
                end)

                --TriggerClientEvent('InitialCore:SendStatusInfo', playerId, data)
            end)
        end
        Citizen.Wait(1.44 * 1000 * 60)
        --Citizen.Wait(1000)
    end
end)

RegisterServerEvent('InitialCore:StatusAdd')
AddEventHandler('InitialCore:StatusAdd', function(type, percent)
    src = source
    local PlayerIdentifier = GetPlayerIdentifier(src)
    MySQL.Async.fetchAll('SELECT Status FROM playerinfo WHERE SteamID = @identifier', {
        ['@identifier'] = PlayerIdentifier
    }, function(result)
        local data

        if result[1].Status then
            if result[1].Status == '{}' then
            data = json.decode('{"faim":50, "soif":50}')
            else
            data = json.decode(result[1].Status)
            end
        end
        
        if type == 'faim' then
            data.faim = data.faim+percent
        elseif type == 'soif' then
            data.soif = data.soif+percent
        end

        if data.faim > 100 then
            data.faim = 100
        end
        if data.soif > 100 then
            data.soif = 100
        end

        MySQL.Async.execute("UPDATE playerinfo SET Status='" .. json.encode(data) .. "' WHERE SteamID='" .. PlayerIdentifier .. "'", {}, function()
        end)

        TriggerClientEvent('InitialCore:SendStatusInfo', src, data)
    end)
end)

--[[RegisterServerEvent('InitialCore:LoadStatusInfoS')
AddEventHandler('InitialCore:LoadStatusInfoS', function()
    _source = source
    local PlayerIdentifier = GetPlayerIdentifier(_source)
    MySQL.Async.fetchAll('SELECT Status, Prenom, Nom FROM playerinfo WHERE SteamID = @identifier', {
        ['@identifier'] = PlayerIdentifier
    }, function(result)
        local data

        if result[1] then
            if result[1].Status == '{}' then
            data = json.decode('{"faim":50, "soif":50}')
            else
            data = json.decode(result[1].Status)
            end
            TriggerClientEvent('InitialCore:SendStatusInfoFirstJoin', _source, data, result[1].Prenom, result[1].Nom)
        else
            data = {}
            data.faim = 50
            data.soif = 50
            MySQL.Async.execute("UPDATE playerinfo SET Status='{\"faim\":50, \"soif\":50}' WHERE SteamID='" .. PlayerIdentifier .. "'", {}, function() end)
            TriggerClientEvent('InitialCore:SendStatusInfoFirstJoin', _source, data, "", "")
        end
    end)
end)]]

RegisterServerCallback('InitialCore:LoadStatus', function(source, callback)
    local PlayerIdentifier = GetPlayerIdentifier(source)
    MySQL.Async.fetchAll('SELECT Status FROM playerinfo WHERE SteamID = @identifier', {
        ['@identifier'] = PlayerIdentifier
    }, function(result)
        local data
        if result[1] then
            if result[1].Status == '{}' then
            data = json.decode('{"faim":50, "soif":50}')
            else
            data = json.decode(result[1].Status)
            end
            callback(data)
        else
            data = {}
            data.faim = 50
            data.soif = 50
            MySQL.Async.execute("UPDATE playerinfo SET Status='{\"faim\":50, \"soif\":50}' WHERE SteamID='" .. PlayerIdentifier .. "'", {}, function() end)
            callback(data)
        end
    end)
end)