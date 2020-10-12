RegisterServerEvent('InitialCore:GiveCode')
AddEventHandler('InitialCore:GiveCode', function()
    local SteamID = GetPlayerIdentifier(source)
    MySQL.Async.execute("UPDATE playerinfo SET Code='true' WHERE SteamID='" .. SteamID .. "';", {}, function() 
    end)
end)

RegisterServerCallback('getInfoAutoEcole', function(source, callback, calledid)
    local SteamID = GetPlayerIdentifier(source)
    if calledid == "code" then
        MySQL.Async.fetchAll("SELECT Code FROM playerinfo WHERE SteamID='" .. SteamID .. "'", { }, function(result)
            callback(result[1].Code)
        end)
    elseif calledid == "voiture" then
        MySQL.Async.fetchAll("SELECT PermisVoiture FROM playerinfo WHERE SteamID='" .. SteamID .. "'", { }, function(result)
            callback(result[1].PermisVoiture)
        end)
    elseif calledid == "moto" then
        MySQL.Async.fetchAll("SELECT PermisMoto FROM playerinfo WHERE SteamID='" .. SteamID .. "'", { }, function(result)
            callback(result[1].PermisMoto)
        end)
    elseif calledid == "camion" then
        MySQL.Async.fetchAll("SELECT PermisCamion FROM playerinfo WHERE SteamID='" .. SteamID .. "'", { }, function(result)
            callback(result[1].PermisCamion)
        end)
    end
end)

------------------

RegisterServerEvent('InitialCore:GivePermis')
AddEventHandler('InitialCore:GivePermis', function(vehicule)
    local SteamID = GetPlayerIdentifier(source)
    if vehicule == "voiture" then
        MySQL.Async.execute("UPDATE playerinfo SET PermisVoiture='true' WHERE SteamID='" .. SteamID .. "';", {}, function() 
        end)
    elseif vehicule == "moto" then
        MySQL.Async.execute("UPDATE playerinfo SET PermisMoto='true' WHERE SteamID='" .. SteamID .. "';", {}, function() 
        end)
    elseif vehicule == "camion" then
        MySQL.Async.execute("UPDATE playerinfo SET PermisCamion='true' WHERE SteamID='" .. SteamID .. "';", {}, function() 
        end)
    end
end)