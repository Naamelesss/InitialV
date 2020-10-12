RegisterServerCallback('getAdminGrade', function(source, callback)
    local SteamID = GetPlayerIdentifier(source)
    MySQL.Async.fetchAll("SELECT GradeAdmin FROM playerinfo WHERE SteamID = '" .. SteamID .. "'", { }, function(result)
        callback(result[1].GradeAdmin)
    end)
end)

RegisterServerCallback('getItemsInDB', function(source, callback)
    MySQL.Async.fetchAll("SELECT * FROM itemslist", { }, function(result)
        callback(result)
    end)
end)

RegisterServerCallback('getNameInDB', function(source, callback, LastId)
    local SteamID = GetPlayerIdentifier(source)
    MySQL.Async.fetchAll("SELECT Nom, Prenom FROM playerinfo WHERE SteamID = '" .. SteamID .. "'", { }, function(result)
        callback(result[1])
    end)
end)

RegisterServerCallback('getJobInDb', function(source, callback, LastId)
    local SteamID = GetPlayerIdentifier(LastId)
    MySQL.Async.fetchAll("SELECT Metier FROM playerinfo WHERE SteamID = '" .. SteamID .. "'", { }, function(result)
        callback(result[1].Metier)
    end)
end)


function SendToDiscord(webhook, msg)
    PerformHttpRequest(webhook, function(err, text, header)
    end, 'POST', json.encode({username = author, content = msg}), {['Content-Type'] = 'application/json'})
end

RegisterServerEvent("InitialAdmin:ClearBugs2")
AddEventHandler("InitialAdmin:ClearBugs2", function()
    TriggerClientEvent("InitialAdmin:ClearBugs", -1)
end)

RegisterServerEvent("InitialAdmin:Kick")
AddEventHandler("InitialAdmin:Kick", function(player, raisondukick)
    DropPlayer(player, "Kick par le modérateur " .. GetPlayerName(source) .. ". Raison(s): " .. raisondukick)
    SendToDiscord("https://discordapp.com/api/webhooks/692785813188247653/3vDwsUgA9QHqjgcuYLfv5jz967F87LTvB8RGp5SQa1M3hz3P1JYOHK0OVrKkttzs6A8j", "**" .. GetPlayerName(player) .. "** a été kick ```" .. raisondukick .. ".```")
end)

RegisterServerEvent("InitialAdmin:Annonce")
AddEventHandler("InitialAdmin:Annonce", function(annoncetxt)
    TriggerClientEvent("InitialAdmin:AnnonceC", -1, annoncetxt)
    SendToDiscord("https://discordapp.com/api/webhooks/723349081673695253/TyWVKvjbxnSp1c7mEG5aQ6Geo2XX9Cjtd71AhHHZAaFh7jY5oA-lcleNxz9TTovEaRRP", "**" .. GetPlayerName(source) .. "** à passé l'annonce ```" .. annoncetxt .. ".```")
end)

local function ExtractIdentifiers(src)
    local identifiers = {
        steam = "",
        ip = "",
        discord = "",
        license = "",
        xbl = "",
        live = ""
    }

    --Loop over all identifiers
    for i = 0, GetNumPlayerIdentifiers(src) - 1 do
        local id = GetPlayerIdentifier(src, i)

        --Convert it to a nice table.
        if string.find(id, "steam") then
            identifiers.steam = id
        elseif string.find(id, "ip") then
            identifiers.ip = id
        elseif string.find(id, "discord") then
            identifiers.discord = id
        elseif string.find(id, "license") then
            identifiers.license = id
        elseif string.find(id, "xbl") then
            identifiers.xbl = id
        elseif string.find(id, "live") then
            identifiers.live = id
        end
    end

    return identifiers
end

RegisterServerEvent("InitialAdmin:Ban")
AddEventHandler("InitialAdmin:Ban", function(player, raison)
    if not raison then raison = "Sans raison" end
    local IDS = ExtractIdentifiers(player)
    local SteamDec = tostring(tonumber(IDS.steam:gsub("steam:", ""), 16));
    local Type = Type2 or "false"
    local Other = Other2 or "false"
    MySQL.Async.execute("INSERT INTO blacklist (Steam, SteamLink, SteamName, DiscordUID, DiscordTag, GameLicense, ID, BanType, Other) VALUES ('" .. IDS.steam .. "', '" .. "https://steamcommunity.com/profiles/" .. SteamDec .. "', '" .. GetPlayerName(player) .. "', '" .. IDS.discord:gsub('discord:', '') .. "', '<@" .. IDS.discord:gsub('discord:', '') .. ">', '" .. IDS.license .. "', '" .. tostring(player) .. "', 'Modérateur', '" .. raison .. "');", {}, function() 
        DropPlayer(player, 'Vous avez été blacklist d\'Initial V (Raisons : ' .. raison .. ')')
    end)
end)

RegisterServerEvent("InitialAdmin:Warn")
AddEventHandler("InitialAdmin:Warn", function(player, raison, montant)
    local SteamID = GetPlayerIdentifier(player)
    TriggerClientEvent("InitialAdmin:SendMessageC", player, "Vous avez reçu un avertissement du staff. Raison: " .. raison)
    SendToDiscord("https://discordapp.com/api/webhooks/692785813188247653/3vDwsUgA9QHqjgcuYLfv5jz967F87LTvB8RGp5SQa1M3hz3P1JYOHK0OVrKkttzs6A8j", "**" .. GetPlayerName(source) .. "** a averti **" .. GetPlayerName(player) .. "** Raison :**" .. raison .. "**.")   
    MySQL.Async.execute("UPDATE playerinfo SET Warn='" .. montant .. "' WHERE SteamID='" .. SteamID .. "'", {}, function() end)
end)

RegisterServerEvent("InitialAdmin:SendMessage")
AddEventHandler("InitialAdmin:SendMessage", function(player, msg)
    --print(player)
    TriggerClientEvent("InitialAdmin:SendMessageC", player, msg)
end)

RegisterServerEvent("InitialAdmin:ReviveAll")
AddEventHandler("InitialAdmin:ReviveAll", function()
    TriggerClientEvent("InitialAdmin:ReviveAllC", -1)
end)

RegisterServerEvent("InitialAdmin:Log")
AddEventHandler("InitialAdmin:Log", function(webhook, msg)
    SendToDiscord(webhook, msg)
end)

RegisterServerCallback('InitialAdmin:getGradeMetier', function(source, callback, metier)
    MySQL.Async.fetchAll("SELECT Data FROM Metier WHERE Nom = '" .. metier .. "'", {}, function(result)
        --print(result[1].Data)
        if result[1] ~= nil then
            callback(json.decode(result[1].Data))
        else
            callback({"-"})
        end
    end)
end)

RegisterServerEvent("InitialAdmin:Reset")
AddEventHandler("InitialAdmin:Reset", function(player, raison)
    TriggerEvent("InitialAdmin:Log", "https://discordapp.com/api/webhooks/738917275477868724/H4FmKprFdLimQ_6_cxQ9ja60HdeMtNU_Nafoy6Jg-gwBHeKCkEh2nJYgWBcZX06vpScs", GetPlayerName(player) .. " à été mort rp par " .. GetPlayerName(source) .. ". Raisons :" .. raison)
    DropPlayer(player, "Mort RP, reconnectez vous pour faire votre nouveau personnage. Modérateur qui vous à Mort RP: " .. GetPlayerName(source))
    local SteamID = GetPlayerIdentifier(player, 0)
    MySQL.Sync.execute("DELETE * FROM playerinfo WHERE SteamID=" .. SteamID .. "", {['@resetid'] = resetid})
end)

RegisterServerCallback('getMoneyInDb', function(source, callback, LastId)
    local SteamID = GetPlayerIdentifier(LastId)
    MySQL.Async.fetchAll("SELECT Argent FROM playerinfo WHERE SteamID = '" .. SteamID .. "'", { }, function(result)
        callback(result[1].Argent)
    end)
end)