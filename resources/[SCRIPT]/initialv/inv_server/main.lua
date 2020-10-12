RegisterServerEvent("InitInventaire:tradePlayerItem")
AddEventHandler("InitInventaire:tradePlayerItem", function(from, target, type, itemName, itemCount)
	print("ezzz")
	--[[local _source = from

	local sourceXPlayer = ESX.GetPlayerFromId(_source)
	local targetXPlayer = ESX.GetPlayerFromId(target)

	if type == "item_standard" then
		local sourceItem = sourceXPlayer.getInventoryItem(itemName)
		local targetItem = targetXPlayer.getInventoryItem(itemName)

		if itemCount > 0 and sourceItem.count >= itemCount then
			if targetItem.limit ~= -1 and (targetItem.count + itemCount) > targetItem.limit then
			else
				sourceXPlayer.removeInventoryItem(itemName, itemCount)
				TriggerClientEvent('b1g_notify:client:Notify', sourceXPlayer, { type = 'true', text = _U('item_removed') .. itemName})
				targetXPlayer.addInventoryItem(itemName, itemCount)
				TriggerClientEvent('b1g_notify:client:Notify', targetXPlayer, { type = 'true', text = _U('item_added') .. itemName})
			end
		end
	elseif type == "item_money" then
		if itemCount > 0 and sourceXPlayer.getMoney() >= itemCount then
			sourceXPlayer.removeMoney(itemCount)
			TriggerClientEvent('b1g_notify:client:Notify', sourceXPlayer, { type = 'true', text = _U('money_removed') .. itemCount})
			targetXPlayer.addMoney(itemCount)
			TriggerClientEvent('b1g_notify:client:Notify', targetXPlayer, { type = 'true', text = _U('money_added') .. itemCount})
		end
	elseif type == "item_account" then
		if itemCount > 0 and sourceXPlayer.getAccount(itemName).money >= itemCount then
			sourceXPlayer.removeAccountMoney(itemName, itemCount)
			TriggerClientEvent('b1g_notify:client:Notify', sourceXPlayer, { type = 'true', text = _U('money_removed') .. itemCount .. itemName})
			targetXPlayer.addAccountMoney(itemName, itemCount)
			TriggerClientEvent('b1g_notify:client:Notify', targetXPlayer, { type = 'true', text = _U('money_added') .. itemCount .. itemName})
		end
	elseif type == "item_weapon" then
		if not targetXPlayer.hasWeapon(itemName) then
			sourceXPlayer.removeWeapon(itemName)
			TriggerClientEvent('b1g_notify:client:Notify', sourceXPlayer, { type = 'true', text = _U('weapon_removed') .. itemName})
			targetXPlayer.addWeapon(itemName, itemCount)
			TriggerClientEvent('b1g_notify:client:Notify', targetXPlayer, { type = 'true', text = _U('waepon_added') .. itemName})
		end
	end]]
end)

RegisterServerEvent('InitialCore:InvSyncAmmo')
AddEventHandler('InitialCore:InvSyncAmmo', function(meta, ammo)
	local SteamID = GetPlayerIdentifier(source)
    MySQL.Async.fetchAll("SELECT Armes FROM playerinfo WHERE SteamID='" ..  SteamID .. "'", {}, function(resultgetinv)
        if resultgetinv[1] ~= nil then
            if resultgetinv[1].Armes ~= nil then
                local PlayerInv = json.decode(resultgetinv[1].Armes)
				--[[for k, v in pairs(PlayerInv) do
					for x, y in pairs(v) do
						print(y.ID)
						--if meta == y.Data.HashID then
						--	y.Data.Munition = ammo
						--end
					end
				end]]
				for k in pairs (PlayerInv) do
                    --print( PlayerInv[k] )
                    --print(ArmesNom[PlayerArmes[k].ID])
					if meta == PlayerInv[k].Data.HashID then
						PlayerInv[k].Data.Munition = ammo
					end
                end

                --print("vv" .. json.encode(PlayerInv))

                MySQL.Async.execute("UPDATE playerinfo SET Armes='" .. json.encode(PlayerInv) .. "' WHERE SteamID='" .. SteamID .. "'", {}, function()
                    --TriggerClientEvent('InitialCore:AdvancedNotif', donateur, 'Initial V', '~r~Inventaire', 'Vous avez donné ' .. montant .. ' ' .. item .. '.', 'CHAR_WE', 'INITIALV')
				end)
			end
		end
	end)
end)

RegisterServerEvent('InitialCore:GetCoffreVehicle')
AddEventHandler('InitialCore:GetCoffreVehicle', function(Plaque, vehType)
	src = source
	MySQL.Async.fetchAll("SELECT * FROM coffres WHERE Plaque='" ..  Plaque .. "'", {}, function(result)
		if result[1] ~= nil then
			TriggerClientEvent('InitialCore:OpenCoffreVehicule', src, json.decode(result[1].Contenu), Plaque, vehType)
		else
			MySQL.Async.execute("INSERT INTO coffres (Plaque, Contenu, VehiculeJoueur) VALUES ('" .. Plaque .. "', '{}', '1');", {}, function()
			end)
			TriggerClientEvent('InitialCore:OpenCoffreVehicule', src, json.decode('{}'), Plaque, vehType)
		end
    end)
end)

RegisterServerEvent('InitialCore:RefreshCoffreVehicle')
AddEventHandler('InitialCore:RefreshCoffreVehicle', function(Plaque, vehType)
	_src = source
	MySQL.Async.fetchAll("SELECT * FROM coffres WHERE Plaque='" ..  Plaque .. "'", {}, function(result)
		if result[1] ~= nil then
			TriggerClientEvent('InitialCore:refreshTrunkInventory', _src, json.decode(result[1].Contenu), Plaque, vehType)
		else
			MySQL.Async.execute("INSERT INTO coffres (Plaque, Contenu, VehiculeJoueur) VALUES ('" .. Plaque .. "', '{}', '1');", {}, function()
			end)
			TriggerClientEvent('InitialCore:refreshTrunkInventory', _src, json.decode('{}'), Plaque, vehType)
		end
    end)
end)

RegisterServerEvent('InitialCore:PutItemCoffreVehicle')
AddEventHandler('InitialCore:PutItemCoffreVehicle', function(Plaque, ID, Nombre, OtherData, Metadata2)
	local CoffreAAdd = {}
	if ID:sub(1, 7) ~= 'WEAPON_' then
		CoffreAAdd[ID] = {}
		CoffreAAdd[ID].Montant = Nombre
		if Metadata2 then
			CoffreAAdd[ID].Data = Metadata2
		end
	end
	if ID == 'argent' then
		TriggerEvent('InitialCore:RemoveMoney', source, Nombre)
	elseif ID:sub(1, 7) == 'WEAPON_' then
		TriggerEvent('InitialCore:DeleteWeapon', source, ID, Nombre, Metadata2.HashID)
	else
		TriggerEvent('InitialCore:DeleteItem', source, ID, Nombre)
	end

	MySQL.Async.fetchAll("SELECT Contenu FROM coffres WHERE Plaque='" ..  Plaque .. "'", {}, function(result)
		if result[1] then
			local InvVehiculeActuel = json.decode(result[1].Contenu)
			if ID:sub(1, 7) == 'WEAPON_' then
				--[[table.insert(InvVehiculeActuel, 1, {
                    ID = ID,
                    Data = {Munition = Metadata2.Munition, HashID = Metadata2.HashID}
				})]]
			--	print(json.encode(InvVehiculeActuel))
			--	table.insert(InvVehiculeActuel, ID)
				InvVehiculeActuel[math.random(1, 9999999)] = {Nom = ID, Data = Metadata2}
				--print(json.encode(InvVehiculeActuel))
			else
				if InvVehiculeActuel[ID] == nil then
					InvVehiculeActuel[ID] = {}
				end
				if InvVehiculeActuel[ID].Montant ~= nil then
					InvVehiculeActuel[ID].Montant = InvVehiculeActuel[ID].Montant + Nombre
				else
					InvVehiculeActuel[ID] = {}
					InvVehiculeActuel[ID].Montant = Nombre
				end
				if Metadata2 then
					InvVehiculeActuel[ID].Data = Metadata2
				end
			end
			MySQL.Async.execute("UPDATE coffres SET Contenu='" .. json.encode(InvVehiculeActuel) .. "' WHERE Plaque='" .. Plaque .. "'", {}, function()
			end)
		else
			if ID:sub(1, 7) == 'WEAPON_' then
				--[[table.insert(CoffreAAdd, 1, 'test' = {
                    ID = ID,
                    Data = {Munition = Metadata2.Munition, HashID = Metadata2.HashID}
				})]]
				--table.insert(CoffreAAdd, 1, ID)
				CoffreAAdd[math.random(1, 9999999)] = {Nom = ID, Data = Metadata2}
				--print(CoffreAAdd[1])
			end
			MySQL.Async.execute("INSERT INTO coffres (Plaque, Contenu, VehiculeJoueur) VALUES ('" .. Plaque .. "', '" .. json.encode(CoffreAAdd) .. "', '1')" , {}, function()
			end)
		end
	end)
end)

RegisterServerEvent('InitialCore:RemoveItemCoffreVehicle')
AddEventHandler('InitialCore:RemoveItemCoffreVehicle', function(Plaque, ID, Nombre, Metadata2, IDHash, TableID)
	local CoffreARem = {}
	if not IDHash then
		IDHash = 'lul'
	end
	if IDHash:sub(1, 7) ~= 'WEAPON_' then
		CoffreARem[ID] = {}
		CoffreARem[ID].Montant = Nombre
		if Metadata2 then
			CoffreARem[ID].Data = Metadata2
		end
		if ID == 'argent' then
			TriggerEvent('InitialCore:GiveMoney', source, Nombre)
		else
			TriggerEvent('InitialCore:GiveItem', source, ID, Nombre, Metadata2)
		end
	end

	print('#############')
	print(Plaque)
	print(ID)
	print(Nombre)
	print(Metadata2)
	print(IDHash)
	print(TableID)
	print('#############')

	MySQL.Async.fetchAll("SELECT Contenu FROM coffres WHERE Plaque='" ..  Plaque .. "'", {}, function(result)
		if result[1].Contenu ~= '{}' then
			local InvVehiculeActuel = json.decode(result[1].Contenu)
			print(IDHash:sub(1, 7))
			if IDHash:sub(1, 7) == 'WEAPON_' then 
				print('wearemove')
				for k, v in pairs(InvVehiculeActuel) do
					print(TableID)
					print(k)
					if k == TableID then
						print('success')
						InvVehiculeActuel[TableID] = nil
						--print(json.encode(InvVehiculeActuel))
					end
				end
			else
				print("ccrem")
				if InvVehiculeActuel[ID] == nil then
					InvVehiculeActuel[ID] = {}
				end
				if InvVehiculeActuel[ID].Montant ~= nil then
					InvVehiculeActuel[ID].Montant = InvVehiculeActuel[ID].Montant - Nombre
				else
					InvVehiculeActuel[ID] = {}
					InvVehiculeActuel[ID].Montant = Nombre
				end
				if Metadata2 then
					InvVehiculeActuel[ID].Data = Metadata2
				end
			end
			MySQL.Async.execute("UPDATE coffres SET Contenu='" .. json.encode(InvVehiculeActuel) .. "' WHERE Plaque='" .. Plaque .. "'", {}, function()
			end)
		else
		--	MySQL.Async.execute("UPDATE coffres SET Contenu='" .. json.encode(CoffreARem) .. "' WHERE Plaque='" .. Plaque .. "'" , {}, function()
		--	end)
		end
	end)
end)

RegisterServerCallback('getCoffrePropriete', function(source, callback, id)
	MySQL.Async.fetchAll("SELECT Contenu FROM coffreproperties WHERE Nom='" ..  id .. "'", {}, function(result)
		callback(json.decode(result[1].Contenu))
	end)
end)

RegisterServerEvent('InitialCore:PutItemPropriete')
AddEventHandler('InitialCore:PutItemPropriete', function(IDP, ID, Nombre, OtherData, Metadata2)
	local CoffreAAdd = {}
	CoffreAAdd[ID] = {}
	CoffreAAdd[ID].Montant = Nombre
	if Metadata2 then
		CoffreAAdd[ID].Data = Metadata2
	end
	if ID == 'argent' then
		TriggerEvent('InitialCore:RemoveMoney', source, Nombre)
	elseif ID:sub(1, 7) == 'WEAPON_' then
		TriggerEvent('InitialCore:DeleteWeapon', source, ID, Nombre)
	else
		TriggerEvent('InitialCore:DeleteItem', source, ID, Nombre)
	end

	MySQL.Async.fetchAll("SELECT Contenu FROM coffreproperties WHERE Nom='" ..  IDP .. "'", {}, function(result)
		if result[1].Contenu ~= '{}' then
			local InvVehiculeActuel = json.decode(result[1].Contenu)
			if InvVehiculeActuel[ID] == nil then
				InvVehiculeActuel[ID] = {}
			end
			if InvVehiculeActuel[ID].Montant ~= nil then
				InvVehiculeActuel[ID].Montant = InvVehiculeActuel[ID].Montant + Nombre
			else
				InvVehiculeActuel[ID] = {}
				InvVehiculeActuel[ID].Montant = Nombre
			end
			if Metadata2 then
				InvVehiculeActuel[ID].Data = Metadata2
			end
			MySQL.Async.execute("UPDATE coffreproperties SET Contenu='" .. json.encode(InvVehiculeActuel) .. "' WHERE Nom='" .. IDP .. "'", {}, function()
			end)
		else
			MySQL.Async.execute("UPDATE coffreproperties SET Contenu='" .. json.encode(CoffreAAdd) .. "' WHERE Nom='" .. IDP .. "'" , {}, function()
			end)
		end
	end)
end)

RegisterServerEvent('InitialCore:RemoveItemPropriete')
AddEventHandler('InitialCore:RemoveItemPropriete', function(IDP, ID, Nombre, OtherData, Metadata2)
	local CoffreARem = {}
	CoffreARem[ID] = {}
	CoffreARem[ID].Montant = Nombre
	if Metadata2 then
		CoffreARem[ID].Data = Metadata2
	end
	if ID == 'argent' then
		TriggerEvent('InitialCore:GiveMoney', source, Nombre)
	elseif ID:sub(1, 7) == 'WEAPON_' then
		TriggerEvent('InitialCore:GiveWeapon', source, ID, Nombre)
	else
		TriggerEvent('InitialCore:GiveItem', source, ID, Nombre, Metadata2)
	end

	MySQL.Async.fetchAll("SELECT Contenu FROM coffreproperties WHERE Nom='" ..  IDP .. "'", {}, function(result)
		if result[1].Contenu ~= '{}' then
			local InvVehiculeActuel = json.decode(result[1].Contenu)
			if InvVehiculeActuel[ID] == nil then
				InvVehiculeActuel[ID] = {}
			end
			if InvVehiculeActuel[ID].Montant ~= nil then
				InvVehiculeActuel[ID].Montant = InvVehiculeActuel[ID].Montant - Nombre
			else
				InvVehiculeActuel[ID] = {}
				InvVehiculeActuel[ID].Montant = Nombre
			end
			if Metadata2 then
				InvVehiculeActuel[ID].Data = Metadata2
			end
			MySQL.Async.execute("UPDATE coffreproperties SET Contenu='" .. json.encode(InvVehiculeActuel) .. "' WHERE Nom='" .. IDP .. "'", {}, function()
			end)
		else
			MySQL.Async.execute("UPDATE coffreproperties SET Contenu='" .. json.encode(CoffreARem) .. "' WHERE Nom='" .. IDP .. "'" , {}, function()
			end)
		end
	end)
end)

-- FOUILLE

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

RegisterServerCallback('InitInventaire:getPlayerOtherInventory', function(source, callback, targetid)
    local PlayerSteamID = GetPlayerIdentifier(targetid)
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

                    table.insert(PlayerArmesFinal, {
                        ID = k,
                        Nom = ArmesNom[k],
                        --Poids = IC.Items[k].Poids,
                        Nombre = PlayerArmes[k].Montant
					})

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
			callback(PlayerInvFinal, PlayerArmesFinal, PlayerArgentFinal)
		end
	end)
end)

local ArmesNom = {}
ArmesNom.WEAPON_KNIFE = 'Couteau'
ArmesNom.WEAPON_SWITCHBLADE = 'Couteau a cran d\'arret'
ArmesNom.WEAPON_FLASHLIGHT = 'Lampe torche'
ArmesNom.WEAPON_BAT = 'Batte'
ArmesNom.WEAPON_MACHETE = 'Machette'
ArmesNom.WEAPON_SNSPISTOL = 'Pétoire'
ArmesNom.WEAPON_PISTOL = 'Pistolet'
ArmesNom.WEAPON_COMBATPISTOL = 'Pistolet de combat'


RegisterServerCallback('InitInventaire:getOtherInventory', function(source, callback, plate)
    --local PlayerSteamID = GetPlayerIdentifier(targetid)
	MySQL.Async.fetchAll("SELECT Contenu FROM coffres WHERE Plaque='" ..  plate .. "'", {}, function(resultgetinv)
		if not resultgetinv[1] then
			resultgetinv[1] = {}
			resultgetinv[1].Contenu = {}
			resultgetinv[1].Contenu = json.encode(resultgetinv[1].Contenu)
		end
        --PlayerArgentFinal = resultgetinv[1].Argent

        if resultgetinv[1] ~= nil then
            local PlayerInvFinal = {}
            local PlayerArmesFinal = {}
            if resultgetinv[1].Contenu ~= nil then
                --print('## ' .. resultgetinv[1].Inventaire)

                PlayerInv = json.decode(resultgetinv[1].Contenu)

                for k, v in pairs (PlayerInv) do
					--print( PlayerInv[k].Montant )
					--print(v.Nom)

					print(v.Nom)

					if v.Nom then
						if v.Nom:sub(1, 7) == 'WEAPON_' then
							table.insert(PlayerInvFinal, {
								ID = v.Nom,
								Nom = ArmesNom[v.Nom],
								Poids = 1500,
								Nombre = 1,
								Data = v.Data,
								IDTable = k
							})
						end
					else
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
						elseif k:sub(1, 6) == 'argent' then
							table.insert(PlayerInvFinal, {
								ID = "argent",
								Nom = "Argent",
								Poids = 1*PlayerInv[k].Montant,
								Nombre = PlayerInv[k].Montant
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

       --[[     if resultgetinv[1].Armes ~= nil then

                PlayerArmes = json.decode(resultgetinv[1].Armes)

                --print('## ' .. PlayerInv)

                for k in pairs (PlayerArmes) do
                    --print( PlayerInv[k] )

                    table.insert(PlayerArmesFinal, {
                        ID = k,
                        Nom = ArmesNom[k],
                        --Poids = IC.Items[k].Poids,
                        Nombre = PlayerArmes[k].Montant
					})

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

			end]]
			callback(PlayerInvFinal, PlayerArmesFinal, PlayerArgentFinal)
		end
	end)
end)

RegisterServerEvent('InitialCore:SearchAlert')
AddEventHandler('InitialCore:SearchAlert', function(player)
	TriggerClientEvent('InitialCore:SearchAlertC', player)
end)