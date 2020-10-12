--[[RegisterServerCallback('InitialCore:GetParking', function(source, callback)
    local SteamID = GetPlayerIdentifier(source)
    print(SteamID)
    MySQL.Async.fetchAll("SELECT * FROM garage WHERE SteamID= '" .. SteamID .. "'", { }, function(result)
        callback(result)
    end)
end)]]

RegisterServerCallback('InitialCore:RefreshParking', function(source, callback, parking)
    local SteamID = GetPlayerIdentifier(source)
    MySQL.Async.fetchAll("SELECT * FROM garage WHERE SteamID= '" .. SteamID .. "' AND Parking='" .. parking .. "'", { }, function(result)
        callback(result)
    end)
end)

RegisterServerCallback('InitialCore:CanStockVeh', function(source, callback, plate)
    MySQL.Async.fetchAll("SELECT * FROM garage WHERE Plaque= '" .. plate .. "'", { }, function(result)
        if result[1] ~= nil then
            callback(true)
        else
            callback(false)
        end
    end)
end)

RegisterServerCallback('InitialCore:GetAllVeh', function(source, callback)
    local SteamID = GetPlayerIdentifier(source)
    MySQL.Async.fetchAll("SELECT * FROM garage WHERE SteamID= '" .. SteamID .. "' AND Parking=''", { }, function(result)
        callback(result)
        --print(result[1].Plaque)
    end)
end)

RegisterServerCallback('InitialCore:GetVehData', function(source, callback, plaque)
    print(plaque)
    local SteamID = GetPlayerIdentifier(source)
    MySQL.Async.fetchAll("SELECT Data FROM garage WHERE SteamID= '" .. SteamID .. "' AND Plaque='" .. plaque .. "'", { }, function(result)
        callback(result[1].Data)
        --print(result[1].Data .. 'data')
        --print(result[1].Plaque)
    end)
end)

RegisterServerEvent('InitialCore:ChangeStatusVeh')
AddEventHandler('InitialCore:ChangeStatusVeh', function(Action, Plaque, Parking, Coords)
    if Action == "sortir" then
        MySQL.Async.execute("UPDATE garage SET Parking='', Coords ='' WHERE Plaque='" .. Plaque .. "';", {}, function() end)
    else
        --print(Coords)
        MySQL.Async.execute("UPDATE garage SET Parking='" .. Parking .. "', Coords ='" .. Coords .. "' WHERE Plaque='" .. Plaque .. "';", {}, function() end)
    end
end)