RegisterServerEvent('InitialCore:SaveMaison')
AddEventHandler('InitialCore:SaveMaison', function(Type, Interieur, Entree, Sortie, PrixAchat, PrixLocation, IsAppartement)
    if not IsAppartement then
        MySQL.Async.execute("INSERT INTO batiments (Type, Interieur, Entree, Sortie, PrixAchat, PrixLocation) VALUES ('" .. Type .. "', '" .. Interieur .. "', '" .. json.encode(Entree) .. "', '" .. json.encode(Sortie) .. "', '" .. PrixAchat .. "', '" .. PrixLocation .. "');", {}, function() end)
    else
        MySQL.Async.execute("INSERT INTO batiments (Type, Interieur, Entree, Sortie, PrixAchat, PrixLocation, Proprietaire) VALUES ('" .. Type .. "', '" .. Interieur .. "', '" .. json.encode(Entree) .. "', " .. json.encode(Sortie) .. ", '" .. PrixAchat .. "', '" .. PrixLocation .. "', '[false, false, false, false, false, false, false, false, false, false]');", {}, function() end)
    end
end)

RegisterServerCallback('getProperty', function(source, callback)
    MySQL.Async.fetchAll("SELECT * FROM batiments", {}, function(result)
        for k in pairs(result) do
            result[k].Entree = json.decode(result[k].Entree)
            result[k].Sortie = json.decode(result[k].Sortie)
        end
        callback(result, GetPlayerIdentifier(source))
    end)
end)

RegisterNetEvent('InitialProperties:Sonnerie')
AddEventHandler('InitialProperties:Sonnerie', function(hashsonnette, Coords)
	TriggerClientEvent('InitialProperties:SonnerieC', -1, hashsonnette, source, Coords)
end)

RegisterNetEvent('InitialProperties:AcceptSonette')
AddEventHandler('InitialProperties:AcceptSonette', function(type, idjoin, idplayer, HashIDEntered, Coords)
--	print(idplayer)
--	print(type)
--	print(idjoin)
	TriggerClientEvent('instance:join', idplayer, type, idjoin)
	TriggerClientEvent('InitialProperties:EnterApresSonetteC', idplayer, HashIDEntered, Coords)
end)