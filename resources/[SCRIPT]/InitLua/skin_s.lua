RegisterServerEvent('InitialCoreS:SavePerso')
AddEventHandler('InitialCoreS:SavePerso', function(skin2)
    _source = source
    local skinencoded = json.encode(skin2)
    PlayerSteamID = GetPlayerIdentifier(_source)
    MySQL.Async.execute("UPDATE playerinfo SET Skin='" .. skinencoded .. "' WHERE SteamID='" .. PlayerSteamID .. "'", {}, function()
        --print("^0[^1InitialCore^0] ^2 Sauvegarde du skin : " .. PlayerSteamID)
    end)
end)

RegisterServerEvent('InitialCoreS:SaveIDCard')
AddEventHandler('InitialCoreS:SaveIDCard', function(idcard)
    PlayerSteamID = GetPlayerIdentifier(source)
    MySQL.Async.execute("UPDATE playerinfo SET Prenom='" .. idcard.Prenom .. "', Nom='" .. idcard.Nom .. "', Taille='" .. idcard.Taille .. "', DateNaissance='" .. idcard.DateDeNaissance .. "', Sexe='" .. idcard.Sexe .. "' WHERE SteamID='" .. PlayerSteamID .. "'", {}, function()
        --print("^0[^1InitialCore^0] ^2 Sauvegarde de la carte d'identité : " .. PlayerSteamID)
    end)
end)

RegisterServerCallback('getPlayerSkin', function(source, callback)
    local PlayerSteamID = GetPlayerIdentifier(source)
    MySQL.Async.fetchAll("SELECT Skin FROM playerinfo WHERE SteamID='" ..  PlayerSteamID .. "'", {}, function(playerskin)
        if playerskin[1] ~= nil then
            if playerskin[1].Skin ~= nil then
                Skin = json.decode(playerskin[1].Skin)
                callback(Skin)
            else
                callback(false)
            end
        end
    end)
end)

RegisterServerEvent('InitialCore:BlockPed')
AddEventHandler('InitialCore:BlockPed', function(ped)
    MySQL.Async.execute("UPDATE ped SET Utilise='true' WHERE Nom='" .. ped .. "'", {}, function()
        --print("^0[^1InitialCore^0] ^2 Bloquage du ped : " .. ped)
    end)
end)