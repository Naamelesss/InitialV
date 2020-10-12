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

local function sendToDisc(title, message, footer)
    local embed = {}
    embed = {
        {
            ["color"] = 16711680, -- GREEN = 65280 --- RED = 16711680
            ["title"] = "**".. title .."**",
            ["description"] = "" .. message ..  "",
            ["footer"] = {
            ["text"] = footer,
            },
        }
    }
    PerformHttpRequest('https://discordapp.com/api/webhooks/691278633263824907/gYFt30nf-lpLknm3XQKPxIYv439KChvHU66RiSKWIATzd9QJE2nnWj8pmnn1TVRdrD5G', function(err, text, headers) end, 'POST', json.encode({username = name, embeds = embed}), { ['Content-Type'] = 'application/json' })
end

local function BanPlayer(ID, Type2, Other2)
    local IDS = ExtractIdentifiers(ID)
    local SteamDec = tostring(tonumber(IDS.steam:gsub("steam:", ""), 16));
    local Type = Type2 or "false"
    local Other = Other2 or "false"
    MySQL.Async.execute("INSERT INTO blacklist (Steam, SteamLink, SteamName, DiscordUID, DiscordTag, GameLicense, ID, BanType, Other) VALUES ('" .. IDS.steam .. "', '" .. "https://steamcommunity.com/profiles/" .. SteamDec .. "', '" .. GetPlayerName(ID) .. "', '" .. IDS.discord:gsub('discord:', '') .. "', '<@" .. IDS.discord:gsub('discord:', '') .. ">', '" .. IDS.license .. "', '" .. tostring(ID) .. "', '" .. Type .. "', '" .. Other .. "');", {}, function() 
        DropPlayer(ID, 'Vous avez été blacklist d\'Initial V (Raison : cheats)')
    end)
end

for i=1, #BlacklistedEvents, 1 do
    RegisterServerEvent(BlacklistedEvents[i])
    AddEventHandler(BlacklistedEvents[i], function()
        local id = source;
        local ids = ExtractIdentifiers(id);
        local steam = ids.steam:gsub("steam:", "");
        local steamDec = tostring(tonumber(steam,16));
        steam = "https://steamcommunity.com/profiles/" .. steamDec;
        --local gameLicense = ids.license;
        local gameLicense = ids.license:gsub("license:", "");   
        local discord = ids.discord;
--        if Config.BanComponents.AntiBlacklistedEvent then 
            --BanPlayer(id, "Lua execution: "..BlacklistedEvents[i]);
            sendToDisc("[BANNED] CONFIRMED HACKER",
            'Event used : **' .. BlacklistedEvents[i] .. '**\n' ..
            'ID : **' .. tostring(id) .. '**\n' ..
            'Steam Name : **' .. GetPlayerName(id) .. '**\n' ..
            'Steam: **' .. steam .. '**\n' ..
            'GameLicense: **' .. gameLicense .. '**\n' ..
            'Discord Tag: **<@' .. discord:gsub('discord:', '') .. '>**\n' ..
            'Discord UID: **' .. discord:gsub('discord:', '') .. '**\n');
        --else 
            --[[sendToDisc("CONFIRMED HACKER [Tried executing `".. BlacklistedEvents[i] .."`]: _[" .. tostring(id) .. "] " .. GetPlayerName(id) .. "_", 
            'Steam: **' .. steam .. '**\n' ..
            'GameLicense: **' .. gameLicense .. '**\n' ..
            'Discord Tag: **<@' .. discord:gsub('discord:', '') .. '>**\n' ..
            'Discord UID: **' .. discord:gsub('discord:', '') .. '**\n');]]
       -- end
        --DropPlayer(id, "Lua execution: "..BlacklistedEvents[i],true)

        BanPlayer(source, 'Events', BlacklistedEvents[i])
    end)
end

local BlockedExplosions = {1, 2, 4, 5, 25, 32, 33, 35, 36, 37, 38}

AddEventHandler("explosionEvent", function(sender, ev)
    for _, v in ipairs(BlockedExplosions) do
        if ev.explosionType == v then
            print(sender)
            --print(ev)
		    --print(GetPlayerName(sender), json.encode(ev))
            CancelEvent()
            Wait(1000)
            TriggerClientEvent('InitialCore:ACRes', -1)
            Wait(1000)
            TriggerClientEvent('InitialCore:ACRes', -1)
            Wait(1000)
            TriggerClientEvent('InitialCore:ACRes', -1)
            return
            BanPlayer(sender, 'Explosion', json.encode(ev))
        end
    end
end)


RegisterServerCallback('getWeaponAC', function(source, callback)
    local SteamID = GetPlayerIdentifier(source)
    MySQL.Async.fetchAll("SELECT Armes FROM playerinfo WHERE SteamID='" .. SteamID .. "'", { }, function(result)
        if result[1] then
            callback(json.decode(result[1].Armes))
        else
            callback({})
        end
    end)
end)