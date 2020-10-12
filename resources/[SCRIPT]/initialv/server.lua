local PedList

RegisterServerEvent('InitialCore:RecupPlayerIDCardInfo')
AddEventHandler('InitialCore:RecupPlayerIDCardInfo', function()
    local PlayerSteamID = GetPlayerIdentifier(source)
    MySQL.Async.fetchAll("SELECT * FROM playerinfo WHERE SteamID='" ..  PlayerSteamID .. "'", {}, function(idcardinfo)
        local IDHash = math.random(100000000, 999999999)
        local IDHash2 = "IDCard#" .. tostring(IDHash)
        MySQL.Async.execute("INSERT INTO `initialv`.`idcard` (HashID, Prenom, Nom, DateNaissance, Nationalite, Sexe, Taille) VALUES ('" .. IDHash2 .. "', '" .. idcardinfo[1].Prenom .. "', '" .. idcardinfo[1].Nom .. "', '" .. idcardinfo[1].DateNaissance .. "', '" .. "NULLNATIONALITE" .. "', '" .. idcardinfo[1].Sexe .. "', '" .. idcardinfo[1].Taille .. "')", {}, function()
            print("^0[^1InitialCore^0] ^2Création de la table : (Carte d'identité) " .. PlayerSteamID .. "^0")
        end)
        MySQL.Async.execute("INSERT INTO `initialv`.`itemslist` (HashID, Nom, Poids) VALUES ('" .. IDHash2 .. "', 'Carte d''identité', '0.020')", {}, function()
            print("^0[^1InitialCore^0] ^2Création de la table : (Carte d'identité/item) " .. PlayerSteamID .. "^0")
        end)
    end)
end)

RegisterServerEvent('InitialCore:RecupInfoHangar')
AddEventHandler('InitialCore:RecupInfoHangar', function(HashID)
    _source = source
    MySQL.Async.fetchAll("SELECT * FROM batiments WHERE ID='" ..  HashID .. "'", {}, function(result)
       TriggerClientEvent('InitialCore:RecupInfoHangarC', _source, result[1].Equipement, result[1].Pousse)
    end)
end)

RegisterServerEvent('InitialCore:SetJob')
AddEventHandler('InitialCore:SetJob', function(type, job, niveau, player)
    if type == 1 then
        local PlayerSteamID = GetPlayerIdentifier(source)
        MySQL.Async.execute("UPDATE playerinfo SET Metier='" .. job .. "', NiveauMetier='" .. niveau .. "'  WHERE SteamID='" .. PlayerSteamID .. "'", {}, function()
            print("^0[^1InitialCore^0] ^2Changement Metier : " .. PlayerSteamID .. " (" .. job .. ")^0")
        end)
        TriggerClientEvent('InitialCore:LoadJob', source, job, "1")
    elseif type == 2 then
        MySQL.Async.execute("UPDATE playerinfo SET Metier='" .. job .. "', NiveauMetier='" .. niveau .. "'  WHERE SteamID='" .. GetPlayerIdentifier(player, 0) .. "'", {}, function()
            print("^0[^1InitialCore^0] ^2Changement Metier : " .. player .. " (" .. job .. ")^0")
        end)
        for k, v in pairs(GetPlayers()) do
            if GetPlayerIdentifier(k, 0) == player then
                TriggerClientEvent('InitialCore:LoadJob', k, job, niveau)
                break
            end
        end
    elseif type == 3 then
        MySQL.Async.execute("UPDATE playerinfo SET Metier='" .. job .. "', NiveauMetier='" .. niveau .. "'  WHERE SteamID='" .. player .. "'", {}, function()
            print("^0[^1InitialCore^0] ^2Changement Metier : " .. player .. " (" .. job .. ")^0")
        end)
        for k, v in pairs(GetPlayers()) do
            if GetPlayerIdentifier(k, 0) == player then
                TriggerClientEvent('InitialCore:LoadJob', k, job, niveau)
                break
            end
        end
    end
end)

RegisterServerEvent('InitialCore:RecupInfoLicenseDarmes')
AddEventHandler('InitialCore:RecupInfoLicenseDarmes', function()
    src = source
    local PlayerSteamID = GetPlayerIdentifier(src)
    MySQL.Async.fetchAll("SELECT LicenseDarmes FROM playerinfo WHERE SteamID='" ..  PlayerSteamID .. "'", {}, function(result)
       TriggerClientEvent('InitialCore:RecupInfoLicenseDarmesC', src, result[1].LicenseDarmes)
    end)
end)

-- DEV
local IDAAAA = 0
RegisterServerEvent('alpha:setcoffre')
AddEventHandler('alpha:setcoffre', function(x, y, z)
local randomid = math.random(0, 1000000)
local nameofbox = 'Coffre' .. randomid
  --Treasure2 = {
	--	Name = "boxb",
	--	Pos = {x = 3521.36, y = 2528.47, z = 7.53}
	--},

    --{x= 26.9295, y= -1348.2445, z= 29.4970-0.98, type= "fruit"},
--print('zz')
--SendWebhook("```{x= " .. x .. ", y= " .. y .. ", z= " .. z .. "},```")
IDAAAA = IDAAAA+1
--SendWebhook("```{id = " .. IDAAAA .. ", use = 10, type = \"plantedeweed\", x= " .. x .. ", y= " .. y .. ", z= " .. z .. ", r = 1.0},```")
SendWebhook("```{x= " .. x .. ", y= " .. y .. ", z= " .. z .. ", type= \"\"},```")
--xgGShs5641sq = {id = 1, use = 10, type = "xgGShs5641sq", x = -495.108, y = 5549.455, z = 73.185, r = 1.0}

end)

function SendWebhook(message)
	webhook = "https://discordapp.com/api/webhooks/701442303545573460/m4zoLcguOakqWCyw6GZvSu3V38Rsa38oT7XuPPyBPDofL4-6xRA-bfA1JSsq-NJ6cEJZ"
	if webhook ~= "none" then
		PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
	end
end

MySQL.ready(function()
    MySQL.Async.fetchAll("SELECT * FROM ped", {}, function(pedlist)
      PedList = pedlist
    end)
end)

RegisterServerCallback('getPedUsed', function(source, callback)
    callback(PedList)
end)

RegisterServerCallback('getArgent', function(source, callback, entreprise)
    print(entreprise)
    if not entreprise then
        print('ne')
        MySQL.Async.fetchAll("SELECT Argent FROM playerinfo WHERE SteamID='" ..  GetPlayerIdentifier(source) .. "'", {}, function(resultgetinv)
            callback(resultgetinv[1].Argent)
        end)
    else
        print('ye')
        MySQL.Async.fetchAll("SELECT Argent FROM banque_account WHERE Entreprise='" ..  entreprise .. "'", {}, function(resultgetinv)
            callback(resultgetinv[1].Argent)
        end)
    end
end)

RegisterServerCallback('getEmployees', function(source, callback, entreprise)
    MySQL.Async.fetchAll("SELECT SteamID, Prenom, Nom, NiveauMetier FROM playerinfo WHERE Metier='" ..  entreprise .. "'", {}, function(resultgetplayer)
        callback(resultgetplayer)
    end)
end)

RegisterServerCallback('getJobGrade', function(source, callback, entreprise)
    MySQL.Async.fetchAll("SELECT Data FROM metier WHERE Nom='" ..  entreprise .. "'", {}, function(resultgetdata)
        callback(resultgetdata[1].Data)
    end)
end)

RegisterServerEvent('InitialCore:AddFunction')
AddEventHandler('InitialCore:AddFunction', function(entreprise, fonction)
    MySQL.Async.fetchAll("SELECT Data FROM metier WHERE Nom='" ..  entreprise .. "'", {}, function(resultgetdata)
        local resultdecode = json.decode(resultgetdata[1].Data)
        table.insert(resultdecode, fonction)
        MySQL.Async.execute("UPDATE metier SET Data='" .. json.encode(resultdecode) .. "' WHERE Nom='" .. entreprise .. "'", {}, function()
        end)
    end)
end)

RegisterServerEvent('InitialCore:RemoveFunction')
AddEventHandler('InitialCore:RemoveFunction', function(entreprise, id)
    MySQL.Async.fetchAll("SELECT Data FROM metier WHERE Nom='" ..  entreprise .. "'", {}, function(resultgetdata)
        local resultdecode = json.decode(resultgetdata[1].Data)
        table.remove(resultdecode, id)
        MySQL.Async.execute("UPDATE metier SET Data='" .. json.encode(resultdecode) .. "' WHERE Nom='" .. entreprise .. "'", {}, function()
        end)
    end)
end)

RegisterServerEvent('InitialCore:AddPhoneWSteamID')
AddEventHandler('InitialCore:AddPhoneWSteamID', function(num)
    local PlayerSteamID = GetPlayerIdentifier(source, 0)
    MySQL.Async.execute("INSERT INTO phone (SteamID, Phone) VALUES ('" .. PlayerSteamID .. "', '" .. num .. "');", {}, function()
    end)
end)