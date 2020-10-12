
    
Citizen.CreateThread(function()
    while true do
        MySQL.Async.fetchAll('SELECT * FROM livraisonvoiture', {}, function(result)
            for k, v in pairs(result) do
                if v.Minutes >= 120 then
                    MySQL.Async.execute("INSERT INTO concessionnaire (Voiture, Hangar, Status) VALUES ('" .. v.Voiture .. "', 2, 'range');", {}, function() end)
                    MySQL.Async.execute("DELETE FROM livraisonvoiture WHERE ID='" .. v.ID .. "';", {}, function() end)
                else
                    MySQL.Async.execute("UPDATE livraisonvoiture SET Minutes='" .. v.Minutes+1 .. "' WHERE ID='" .. v.ID .. "';", {}, function() end)
                end
            end
        end)
        Wait(60000)
    end
end)

RegisterServerEvent('InitialCore:GiveVehicle')
AddEventHandler('InitialCore:GiveVehicle', function(plavar, voiture, plaque)
   -- print('set')
    local PlayerSteamID = GetPlayerIdentifier(plavar)
    --[[MySQL.Async.execute("INSERT INTO garage (SteamID, Vehicule, Plaque, Data, Temps, Parking) VALUES ('" .. PlayerSteamID .. "', '" .. voiture .. "', '" .. plaque .. "', '{\"Couleur1\":0,\"Couleur2\":0,\"Nacree\":0}', 0, '');", {}, function()
        print('exec')
    end)]]
    MySQL.Async.execute("INSERT INTO garage (SteamID, Vehicule, Plaque, Data) VALUES ('" .. PlayerSteamID .. "', '" .. voiture .. "', '" .. plaque .. "', '{\"Couleur1\":0,\"Couleur2\":0,\"Nacree\":0}');", {}, function() 

    end)
end)

RegisterServerCallback('getInfoLivraisonConcess', function(source, callback)
    MySQL.Async.fetchAll('SELECT * FROM livraisonvoiture', {}, function(result)
        callback(result)
    end)
end)
RegisterServerCallback('getInfoHangarConcess', function(source, callback, type)
    MySQL.Async.fetchAll("SELECT * FROM concessionnaire WHERE Hangar='" .. type .. "'", {}, function(result)
        callback(result)
    end)
end)
RegisterServerCallback('getInfoCommandConcess', function(source, callback, type)
    MySQL.Async.fetchAll("SELECT * FROM livraisonvoiture", {}, function(result)
        callback(result)
    end)
end)
RegisterServerEvent('InitialCore:AddConcessCar')
AddEventHandler('InitialCore:AddConcessCar', function(nom)
    MySQL.Async.execute("INSERT INTO livraisonvoiture (Voiture, Minutes) VALUES ('" .. nom .. "', 1);", {}, function() end)
end)
RegisterServerCallback('getStatusVehicle', function(source, callback, id)
    MySQL.Async.fetchAll("SELECT Status, Hangar, TempPlaque FROM concessionnaire WHERE ID='" .. id .. "'", {}, function(result)
        if result[1] then
            callback(result[1].Status, result[1].Hangar, result[1].TempPlaque)
        else
            callback('invalid')
        end
    end)
end)

RegisterServerEvent('InitialCore:ChangeStatusHangar')
AddEventHandler('InitialCore:ChangeStatusHangar', function(ID, Status)
    if string.len(ID) < 8 then
        MySQL.Async.execute("UPDATE concessionnaire SET Status='" .. Status .. "' WHERE ID='" .. ID .. "';", {}, function() end)
    else
        MySQL.Async.execute("DELETE FROM `concessionnaire` WHERE TempPlaque='" .. ID .. "';", {}, function() end)
    end
end)
RegisterServerEvent('InitialCore:ChangeStatusAndChooseHangar')
AddEventHandler('InitialCore:ChangeStatusAndChooseHangar', function(ID, Status, Hangar)
    MySQL.Async.execute("UPDATE concessionnaire SET Status='" .. Status .. "', Hangar=" .. Hangar .. " WHERE ID='" .. ID .. "';", {}, function() end)
end)
RegisterServerEvent('InitialCore:SetVehicleToPlayer')
AddEventHandler('InitialCore:SetVehicleToPlayer', function(ID, Plaque)
    MySQL.Async.execute("UPDATE concessionnaire SET TempPlaque='" .. Plaque .. "' WHERE ID='" .. ID .. "';", {}, function() end)
end)
--[[RegisterServerEvent('InitialCore:DeleteConcessVehicle')
AddEventHandler('InitialCore:DeleteConcessVehicle', function(ID)
    MySQL.Async.execute("DELETE FROM concessionnaire WHERE ID='" .. ID .. "';", {}, function() end)
end)]]