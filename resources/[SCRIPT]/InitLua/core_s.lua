print("^2##################################################")
print("^2#                                                #")
print("^2#                                                #")
print("^2#                                                #")
print("^2#                  ^1InitialCore                   ^2#")
print("^2#              ^1Version 0.4 Started               ^2#")
print("^2#                                                #")
print("^2#                                                #")
print("^2#                                                #")
print("^2##################################################^0")

SetGameType("Serious RolePlay")

local ArmesNom = {}
ArmesNom.WEAPON_KNIFE = 'Couteau'
ArmesNom.WEAPON_SWITCHBLADE = 'Couteau a cran d\'arret'
ArmesNom.WEAPON_FLASHLIGHT = 'Lampe torche'
ArmesNom.WEAPON_BAT = 'Batte'
ArmesNom.WEAPON_MACHETE = 'Machette'
ArmesNom.WEAPON_SNSPISTOL = 'Pétoire'
ArmesNom.WEAPON_PISTOL = 'Pistolet'
ArmesNom.WEAPON_COMBATPISTOL = 'Pistolet de combat'

--[[

"WEAPON_KNIFE", "WEAPON_NIGHTSTICK", "WEAPON_HAMMER", "WEAPON_BAT", "WEAPON_GOLFCLUB",  
    "WEAPON_CROWBAR", "WEAPON_PISTOL", "WEAPON_COMBATPISTOL", "WEAPON_APPISTOL", "WEAPON_PISTOL50",  
    "WEAPON_MICROSMG", "WEAPON_SMG", "WEAPON_ASSAULTSMG", "WEAPON_ASSAULTRIFLE",  
    "WEAPON_CARBINERIFLE", "WEAPON_ADVANCEDRIFLE", "WEAPON_MG", "WEAPON_COMBATMG", "WEAPON_PUMPSHOTGUN",  
    "WEAPON_SAWNOFFSHOTGUN", "WEAPON_ASSAULTSHOTGUN", "WEAPON_BULLPUPSHOTGUN", "WEAPON_STUNGUN", "WEAPON_SNIPERRIFLE",  
    "WEAPON_HEAVYSNIPER", "WEAPON_GRENADELAUNCHER", "WEAPON_GRENADELAUNCHER_SMOKE", "WEAPON_RPG", "WEAPON_MINIGUN",  
    "WEAPON_GRENADE", "WEAPON_STICKYBOMB", "WEAPON_SMOKEGRENADE", "WEAPON_BZGAS", "WEAPON_MOLOTOV",  
    "WEAPON_FIREEXTINGUISHER", "WEAPON_PETROLCAN", "WEAPON_FLARE", "WEAPON_SNSPISTOL", "WEAPON_SPECIALCARBINE",  
    "WEAPON_HEAVYPISTOL", "WEAPON_BULLPUPRIFLE", "WEAPON_HOMINGLAUNCHER", "WEAPON_PROXMINE", "WEAPON_SNOWBALL",  
    "WEAPON_VINTAGEPISTOL", "WEAPON_DAGGER", "WEAPON_FIREWORK", "WEAPON_MUSKET", "WEAPON_MARKSMANRIFLE",  
    "WEAPON_HEAVYSHOTGUN", "WEAPON_GUSENBERG", "WEAPON_HATCHET", "WEAPON_RAILGUN", "WEAPON_COMBATPDW",  
    "WEAPON_KNUCKLE", "WEAPON_MARKSMANPISTOL", "WEAPON_FLASHLIGHT", "WEAPON_MACHETE", "WEAPON_MACHINEPISTOL",  
    "WEAPON_SWITCHBLADE", "WEAPON_REVOLVER", "WEAPON_COMPACTRIFLE", "WEAPON_DBSHOTGUN", "WEAPON_FLAREGUN",  
    "WEAPON_AUTOSHOTGUN", "WEAPON_BATTLEAXE", "WEAPON_COMPACTLAUNCHER", "WEAPON_MINISMG", "WEAPON_PIPEBOMB",  
    "WEAPON_POOLCUE", "WEAPON_SWEEPER", "WEAPON_WRENCH"  

]]

IC = {}
IC.Items = {}

MySQL.ready(function()
    MySQL.Async.fetchAll("SELECT * FROM itemslist", {}, function(result)
        for k,v in ipairs(result) do
			IC.Items[v.HashID] = {
				Nom = v.Nom,
				Poids = v.Poids
            }
            --print(IC.Items["IDCard#639126586"].Nom)
        end
        --print(IC.Items["clevoiture"].Nom)
    end)
end)


--[[local Deferal1 = '{"type": "AdaptiveCard","version": "1.0","body": [{"type": "ColumnSet","columns": [{"type": "Column","width": "auto","items": [{"type": "Image","altText": "","url": "https://media.discordapp.net/attachments/694167508315537408/694237134386757692/initialV.gif","size": "Medium","horizontalAlignment": "Left"}]},{"type": "Column","width": "stretch","items": [{"type": "TextBlock","text": "Initial V","size": "ExtraLarge","weight": "Bolder","horizontalAlignment": "Left"},{"type": "TextBlock","text": "Connexion en cours..."}]}]},{"type": "TextBlock","text": "Vérification IP en cours...","size": "ExtraLarge","weight": "Lighter","color": "Attention"},],"$schema": "http://adaptivecards.io/schemas/adaptive-card.json"}'

AddEventHandler('playerConnecting', function(name, setCallback, deferrals)
    deferrals.defer()
    deferrals.presentCard(JSON.stringify(Deferal1))
end)]]--

AddEventHandler('playerConnecting', function(name, skr, d)
    src = source
    local steamid  = false
    local license  = false
    local discord  = false
    local ip       = false

    --"INSERT INTO connexion (Date, Heure, SteamID, IP, Discord, License) VALUES (" .. os.date("%x") .. ", " .. os.date("%X") .. ", " .. steamid .. ", " .. ip .. ", " .. discord .. ", " .. license .. ");"

    d.defer()
    d.presentCard([==[{"type":"AdaptiveCard","version":"1.0","body":[{"type":"ColumnSet","columns":[{"type":"Column","width":"auto","items":[{"type":"Image","altText":"","url":"https://media.discordapp.net/attachments/694167508315537408/694237134386757692/initialV.gif","size":"Medium"}]},{"type":"Column","width":"stretch","items":[{"type":"TextBlock","text":"Initial V","weight":"Bolder","size":"ExtraLarge"},{"type":"TextBlock","text":"Whitelist"}]}]},{"type":"TextBlock","text":"Initialisation de la connexion au proxy...","size":"ExtraLarge","weight":"Lighter"}],"$schema":"http://adaptivecards.io/schemas/adaptive-card.json"}]==], function(data, rawData)
    end)
    -- PROXY
    --Wait(100)
    for k,v in pairs(GetPlayerIdentifiers(src)) do
        if string.sub(v, 1, string.len("steam:")) == "steam:" then
          steamid = v
        elseif string.sub(v, 1, string.len("license:")) == "license:" then
          license = v
        elseif string.sub(v, 1, string.len("ip:")) == "ip:" then
          ip = v
        elseif string.sub(v, 1, string.len("discord:")) == "discord:" then
          discord = v
        end
    end
    Wait(50)

    if steamid and license and ip and discord then
        MySQL.Async.execute("INSERT INTO connexion (Date, Heure, SteamID, IP, Discord, License) VALUES ('" .. os.date("%x") .. "', '" .. os.date("%X") .. "', '" .. steamid .. "', '" .. ip .. "', '" .. discord .. "', '" .. license .. "');", {}, function()
            print("^0[^1InitialCore^0] ^2Connexion : " .. steamid .. " (" .. ip .. "$)^0")
        end)
    elseif not steamid then
        d.presentCard([==[{"type":"AdaptiveCard","version":"1.0","body":[{"type":"ColumnSet","columns":[{"type":"Column","width":"auto","items":[{"type":"Image","altText":"","url":"https://media.discordapp.net/attachments/694167508315537408/694237134386757692/initialV.gif","size":"Medium"}]},{"type":"Column","width":"stretch","items":[{"type":"TextBlock","text":"Initial V","weight":"Bolder","size":"ExtraLarge"},{"type":"TextBlock","text":"Whitelist"}]}]},{"type":"TextBlock","text":"Steam non détecté, veuillez réessayer...","size":"ExtraLarge","weight":"Lighter"}],"$schema":"http://adaptivecards.io/schemas/adaptive-card.json"}]==], function(data, rawData)
        end)
        while true do
            Wait(60000)
        end
    elseif not ip then
        d.presentCard([==[{"type":"AdaptiveCard","version":"1.0","body":[{"type":"ColumnSet","columns":[{"type":"Column","width":"auto","items":[{"type":"Image","altText":"","url":"https://media.discordapp.net/attachments/694167508315537408/694237134386757692/initialV.gif","size":"Medium"}]},{"type":"Column","width":"stretch","items":[{"type":"TextBlock","text":"Initial V","weight":"Bolder","size":"ExtraLarge"},{"type":"TextBlock","text":"Whitelist"}]}]},{"type":"TextBlock","text":"Connexion au proxy échoué, veuillez réessayer...","size":"ExtraLarge","weight":"Lighter"}],"$schema":"http://adaptivecards.io/schemas/adaptive-card.json"}]==], function(data, rawData)
        end)
        while true do
            Wait(60000)
        end
    end

    Wait(50)

    d.presentCard([==[{"type":"AdaptiveCard","version":"1.0","body":[{"type":"ColumnSet","columns":[{"type":"Column","width":"auto","items":[{"type":"Image","altText":"","url":"https://media.discordapp.net/attachments/694167508315537408/694237134386757692/initialV.gif","size":"Medium"}]},{"type":"Column","width":"stretch","items":[{"type":"TextBlock","text":"Initial V","weight":"Bolder","size":"ExtraLarge"},{"type":"TextBlock","text":"Whitelist"}]}]},{"type":"TextBlock","text":"Vérification de votre IP...","size":"ExtraLarge","weight":"Lighter"}],"$schema":"http://adaptivecards.io/schemas/adaptive-card.json"}]==], function(data, rawData)
    end)
    -- VERIF IP
    Wait(300)
    d.presentCard([==[{"type":"AdaptiveCard","version":"1.0","body":[{"type":"ColumnSet","columns":[{"type":"Column","width":"auto","items":[{"type":"Image","altText":"","url":"https://media.discordapp.net/attachments/694167508315537408/694237134386757692/initialV.gif","size":"Medium"}]},{"type":"Column","width":"stretch","items":[{"type":"TextBlock","text":"Initial V","weight":"Bolder","size":"ExtraLarge"},{"type":"TextBlock","text":"Whitelist"}]}]},{"type":"TextBlock","text":"Validé...","size":"ExtraLarge","weight":"Lighter"}],"$schema":"http://adaptivecards.io/schemas/adaptive-card.json"}]==], function(data, rawData)
    end)
    -- VERIF IP VALIDE
    Wait(50)
    d.presentCard([==[{"type":"AdaptiveCard","version":"1.0","body":[{"type":"ColumnSet","columns":[{"type":"Column","width":"auto","items":[{"type":"Image","altText":"","url":"https://media.discordapp.net/attachments/694167508315537408/694237134386757692/initialV.gif","size":"Medium"}]},{"type":"Column","width":"stretch","items":[{"type":"TextBlock","text":"Initial V","weight":"Bolder","size":"ExtraLarge"},{"type":"TextBlock","text":"Whitelist"}]}]},{"type":"TextBlock","text":"Vérification de la whitelist...","size":"ExtraLarge","weight":"Lighter"}],"$schema":"http://adaptivecards.io/schemas/adaptive-card.json"}]==], function(data, rawData)
    end)
    -- VERIF WL
    Wait(350)
    MySQL.Async.fetchAll("SELECT Steam FROM blacklist WHERE Steam='" .. steamid .. "'", {}, function(result)
        if not result[1] then
            --d.done()
            MySQL.Async.fetchAll("SELECT SteamID FROM whitelist WHERE SteamID='" .. steamid .. "'", {}, function(result2)
                if result2[1] ~= nil then
                    d.presentCard([==[{"type":"AdaptiveCard","version":"1.0","body":[{"type":"ColumnSet","columns":[{"type":"Column","width":"auto","items":[{"type":"Image","altText":"","url":"https://media.discordapp.net/attachments/694167508315537408/694237134386757692/initialV.gif","size":"Medium"}]},{"type":"Column","width":"stretch","items":[{"type":"TextBlock","text":"Initial V","weight":"Bolder","size":"ExtraLarge"},{"type":"TextBlock","text":"Whitelist"}]}]},{"type":"TextBlock","text":"Validé...","size":"ExtraLarge","weight":"Lighter"}],"$schema":"http://adaptivecards.io/schemas/adaptive-card.json"}]==], function(data, rawData)
                    end)
                    -- VALIDE WL
                    Wait(350)
                    d.presentCard([==[{"type":"AdaptiveCard","version":"1.0","body":[{"type":"ColumnSet","columns":[{"type":"Column","width":"auto","items":[{"type":"Image","altText":"","url":"https://media.discordapp.net/attachments/694167508315537408/694237134386757692/initialV.gif","size":"Medium"}]},{"type":"Column","width":"stretch","items":[{"type":"TextBlock","text":"Initial V","weight":"Bolder","size":"ExtraLarge"},{"type":"TextBlock","text":"Whitelist"}]}]},{"type":"TextBlock","text":"Initialisation de la connexion au serveur...","size":"ExtraLarge","weight":"Lighter"}],"$schema":"http://adaptivecards.io/schemas/adaptive-card.json"}]==], function(data, rawData)
                    end)
                    -- ENTREE SUR LE SERV
                    Wait(350)
                    d.done()
                else
                    d.presentCard([==[{"type":"AdaptiveCard","version":"1.0","body":[{"type":"ColumnSet","columns":[{"type":"Column","width":"auto","items":[{"type":"Image","altText":"","url":"https://media.discordapp.net/attachments/694167508315537408/694237134386757692/initialV.gif","size":"Medium"}]},{"type":"Column","width":"stretch","items":[{"type":"TextBlock","text":"Initial V","weight":"Bolder","size":"ExtraLarge"},{"type":"TextBlock","text":"Whitelist"}]}]},{"type":"TextBlock","text":"Vous n'êtes pas whitelist, si vous souhaitez passer votre candidature merci de vous rendre sur ce discord : discord.gg/am9eYNe","size":"Small","weight":"Lighter"}],"$schema":"http://adaptivecards.io/schemas/adaptive-card.json"}]==], function(data, rawData)
                    end)
                end
            end)
        else
            Wait(350)
            d.presentCard([==[{"type":"AdaptiveCard","version":"1.0","body":[{"type":"ColumnSet","columns":[{"type":"Column","width":"auto","items":[{"type":"Image","altText":"","url":"https://media.discordapp.net/attachments/694167508315537408/694237134386757692/initialV.gif","size":"Medium"}]},{"type":"Column","width":"stretch","items":[{"type":"TextBlock","text":"Initial V","weight":"Bolder","size":"ExtraLarge"},{"type":"TextBlock","text":"Whitelist"}]}]},{"type":"TextBlock","text":"Vous êtes blacklist du serveur.","size":"ExtraLarge","weight":"Lighter"}],"$schema":"http://adaptivecards.io/schemas/adaptive-card.json"}]==], function(data, rawData)
            end)
        end
    end)
    --d.done()
end)

RegisterNetEvent('InitialCoreS:OnPlayerJoin')
AddEventHandler('InitialCoreS:OnPlayerJoin', function()
    _source = source
    PlayerSteamID = GetPlayerIdentifier(_source)
    MySQL.Async.fetchAll("SELECT SteamID FROM playerinfo WHERE SteamID='" ..  PlayerSteamID .. "'", {}, function(playerinfo)
        if playerinfo[1] == nil then
            MySQL.Async.execute("INSERT INTO playerinfo (`SteamID`) VALUES ('" .. PlayerSteamID .. "')", {}, function()
                print("^0[^1InitialCore^0] ^2Création de la table : " .. PlayerSteamID .. "^0")
                TriggerEvent('InitialCore:GiveMoney', _source, math.random(500, 1500))
                TriggerClientEvent('InitialCore:CharacterCreator', _source)
            end)
            --TriggerEvent('InitialCore:TransferMoney', "CONSOLE", _source, 100)
        end
    end)
    TriggerClientEvent('InitialCore:GetIC', source, IC)
end)

-- CHARGEMENT PERSO

RegisterNetEvent('InitialCore:LoadPlayer')
AddEventHandler('InitialCore:LoadPlayer', function()
    _source = source
    PlayerSteamID = GetPlayerIdentifier(_source)
    MySQL.Async.fetchAll("SELECT * FROM playerinfo WHERE SteamID='" ..  PlayerSteamID .. "'", {}, function(loadplayerinfo)
        if loadplayerinfo[1] == nil then
            TriggerClientEvent('InitialCore:InfoCallback', _source, false)
            --TriggerClientEvent('InitialCore:CharacterCreator', source) -- ##
            print("^0[^1InitialCore^0] ^2Création du joueur : " .. PlayerSteamID .. "^0")
        else
            if loadplayerinfo[1].Skin == nil then
                TriggerClientEvent('InitialCore:InfoCallback', _source, false)
                TriggerClientEvent('InitialCore:CharacterCreator', _source)
                print("^0[^1InitialCore^0] ^2Création du joueur : " .. PlayerSteamID .. "^0")
            else
                TriggerClientEvent('InitialCore:InfoCallback', _source, json.decode(loadplayerinfo[1].Position))
                TriggerClientEvent('InitialCore:LoadPlayerClient', _source, loadplayerinfo[1].Argent, loadplayerinfo[1].VieJoueur)
                TriggerClientEvent('InitialCore:LoadJob', _source, loadplayerinfo[1].Metier, loadplayerinfo[1].NiveauMetier)
                print("^0[^1InitialCore^0] ^2Chargement du joueur : " .. PlayerSteamID .. "(Argent : " .. loadplayerinfo[1].Argent .. ", Vie : " .. loadplayerinfo[1].VieJoueur .. ", Position : ###, Metier : " .. loadplayerinfo[1].Metier .. ", Niveau metier : " .. loadplayerinfo[1].NiveauMetier .. ")^0")
            end
        end
    end)
end)

RegisterServerEvent('InitialCore:GetPlayerInvS')
AddEventHandler('InitialCore:GetPlayerInvS', function()
    local _source = source
    local PlayerSteamID = GetPlayerIdentifier(source)
    --print(PlayerSteamID)
    MySQL.Async.fetchAll("SELECT Inventaire, Armes, Argent FROM playerinfo WHERE SteamID='" ..  PlayerSteamID .. "'", {}, function(resultgetinv)
        PlayerArgentFinal = resultgetinv[1].Argent

        if resultgetinv[1] ~= nil then
            local PlayerInvFinal = {}
            local PlayerArmesFinal = {}
            if resultgetinv[1].Inventaire ~= nil then
                --print('## ' .. resultgetinv[1].Inventaire)

                PlayerInv = json.decode(resultgetinv[1].Inventaire)

                for k in pairs (PlayerInv) do
                    --print( PlayerInv[k] )
                    if k:sub(1, 7) == 'CarteCr' then 
                        table.insert(PlayerInvFinal, {
                            ID = k,
                            Nom = "Carte de crédit",
                            Poids = 0.050,
                            Nombre = PlayerInv[k].Montant,
                            Data = PlayerInv[k].Data
                        })
                    elseif k:sub(1, 7) == 'Vetemen' then 
                        table.insert(PlayerInvFinal, {
                            ID = k,
                            Nom = "Vêtement",
                            Poids = 0.050,
                            Nombre = PlayerInv[k].Montant,
                            Data = PlayerInv[k].Data
                        })
                    elseif k:sub(1, 7) == 'CleVoit' then
                        table.insert(PlayerInvFinal, {
                            ID = k,
                            Nom = IC.Items["CleVoiture"].Nom,
                            Poids = IC.Items["CleVoiture"].Poids,
                            Nombre = PlayerInv[k].Montant,
                            Data = PlayerInv[k].Data
                        })
                    elseif k:sub(1, 7) == 'facture' then
                        table.insert(PlayerInvFinal, {
                            ID = k,
                            Nom = "Facture",
                            Poids = 0.001,
                            Nombre = PlayerInv[k].Montant,
                            Data = PlayerInv[k].Data
                        })
                    elseif k:sub(1, 7) == 'patedec' then
                        table.insert(PlayerInvFinal, {
                            ID = k,
                            Nom = "Pâte de coca (100 g)",
                            Poids = 0.100,
                            Nombre = PlayerInv[k].Montant,
                            Data = PlayerInv[k].Data
                        })
                    elseif k:sub(1, 7) == 'Telepho' then
                        table.insert(PlayerInvFinal, {
                            ID = k,
                            Nom = "Téléphone",
                            Poids = 0.600,
                            Nombre = PlayerInv[k].Montant,
                            Data = PlayerInv[k].Data
                        })
                    else
                        table.insert(PlayerInvFinal, {
                            --print(k),
                            ID = k,
                            Nom = IC.Items[k].Nom,
                            Poids = IC.Items[k].Poids,
                            Nombre = PlayerInv[k].Montant,
                            Data = PlayerInv[k].Data
                        })
                    end

                end

                --for k in pairs (PlayerInvFinal[1]) do
                 --   print( k )
                --end

                
                --print("cc ! " .. PlayerInvFinal[1].ID)
                --print("cc ! " .. PlayerInvFinal[1].Nom)
                --print("cc ! " .. PlayerInvFinal[1].Nombre)
                --print("cc ! " .. PlayerInvFinal[1].Poids)
                --print("cc ! " .. PlayerInvFinal[2].ID)
                --print("cc ! " .. PlayerInvFinal[2].Nom)
                --print("cc ! " .. PlayerInvFinal[2].Nombre)
                --print("cc ! " .. PlayerInvFinal[2].Poids)
            end

            if resultgetinv[1].Armes ~= nil then

                PlayerArmes = json.decode(resultgetinv[1].Armes)

                --print('## ' .. PlayerInv)

                for k in pairs (PlayerArmes) do
                    --print( PlayerInv[k] )
                    --print(ArmesNom[PlayerArmes[k].ID])
                    table.insert(PlayerArmesFinal, {
                        ID = PlayerArmes[k].ID,
                        Nom = ArmesNom[PlayerArmes[k].ID],
                        --Poids = IC.Items[k].Poids,
                        --Nombre = PlayerArmes[k].Montant,
                        Data = PlayerArmes[k].Data
					})

                end
                --print(PlayerArmesFinal)
                --for k, v in pairs(PlayerArmes) do
                --    print(v.ID)
                --    for a, b in pairs(v) do
                        --print(a .. "é")
                      --  print(b)
                --    end
                --end
                --for k in pairs (PlayerInvFinal[1]) do
                 --   print( k )
                --end

                
                --print("cc ! " .. PlayerInvFinal[1].ID)
                --print("cc ! " .. PlayerInvFinal[1].Nom)
                --print("cc ! " .. PlayerInvFinal[1].Nombre)
                --print("cc ! " .. PlayerInvFinal[1].Poids)
                --print("cc ! " .. PlayerInvFinal[2].ID)
                --print("cc ! " .. PlayerInvFinal[2].Nom)
                --print("cc ! " .. PlayerInvFinal[2].Nombre)
                --print("cc ! " .. PlayerInvFinal[2].Poids)

            end
            TriggerClientEvent('InitialCore:GetPlayerInv', _source, PlayerInvFinal, PlayerArmesFinal, PlayerArgentFinal)
        end
    end)
end)

RegisterServerCallback('getItem', function(source, callback, item)
    local PlayerSteamID = GetPlayerIdentifier(source)
    MySQL.Async.fetchAll("SELECT Inventaire FROM playerinfo WHERE SteamID='" ..  PlayerSteamID .. "'", {}, function(resultgetinv)

        if resultgetinv[1] ~= nil then
            local PlayerInvFinal = {}
            if resultgetinv[1].Inventaire ~= nil then
                PlayerInv = json.decode(resultgetinv[1].Inventaire)
                for k in pairs (PlayerInv) do
                    if item == "CarteCredit" and k:sub(1, 7) == "CarteCr" then
                        table.insert(PlayerInvFinal, {
                            ID = k,
                            Nom = "Carte de crédit",
                            Poids = 0.050,
                            Nombre = PlayerInv[k].Montant,
                            Data = PlayerInv[k].Data
                        })
                    --[[else
                        if k == item then
                            table.insert(PlayerInvFinal, {
                                print(k),
                                ID = k,
                                Nom = IC.Items[k].Nom,
                                Poids = IC.Items[k].Poids,
                                Nombre = PlayerInv[k].Montant,
                                Data = PlayerInv[k].Data
                            })
                        end]]
                    end
                end
                callback(PlayerInvFinal)
            end
        end
    end)
end)

-- SYNCHRO

RegisterNetEvent('InitialCore:SavePlayerServer')
AddEventHandler('InitialCore:SavePlayerServer', function(PlayerLife, PlayerCoords)
    PlayerSteamID = GetPlayerIdentifier(source)
    --[[MySQL.Async.execute("UPDATE playerinfo SET Argent=" .. PlayerMoney .. " WHERE SteamID='" .. PlayerSteamID .. "'", {}, function()
        print("^0[^1InitialCore^0] ^2Synchronisation : " .. PlayerSteamID .. " (" .. PlayerMoney .. "$)^0")
    end)]]
    MySQL.Async.execute("UPDATE playerinfo SET VieJoueur=" .. PlayerLife .. " WHERE SteamID='" .. PlayerSteamID .. "'", {}, function()
        --print("^0[^1InitialCore^0] ^2Synchronisation : " .. PlayerSteamID .. " (Vie : " .. PlayerLife .. ")^0")
    end)
    MySQL.Async.execute("UPDATE playerinfo SET Position='" .. PlayerCoords .. "' WHERE SteamID='" .. PlayerSteamID .. "'", {}, function()
        --print("^0[^1InitialCore^0] ^2Synchronisation : " .. PlayerSteamID .. " (Coords : " .. PlayerCoords .. ")^0")
    end)
    print("^0[^1InitialCore^0] ^2Synchronisation : " .. PlayerSteamID .. "^0")
end)

    --for i = 1, #GetPlayers() do
    --    print(GetPlayers()[i])
    --    Player = GetPlayerIdentifier(GetPlayers()[i])
    --    print(test)
    --end