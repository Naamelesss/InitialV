RegisterServerEvent('esx_hifi:remove_hifi')
AddEventHandler('esx_hifi:remove_hifi', function(coords)
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer.getInventoryItem('hifi').count < xPlayer.getInventoryItem('hifi').limit then
		xPlayer.addInventoryItem('hifi', 1)
	end
	TriggerClientEvent('esx_hifi:stop_music', -1, coords)
end)

RegisterServerEvent('esx_hifi:play_music')
AddEventHandler('esx_hifi:play_music', function(id, coords)
	TriggerClientEvent('esx_hifi:play_music', -1, id, coords)
end)

RegisterServerEvent('esx_hifi:stop_music')
AddEventHandler('esx_hifi:stop_music', function(coords)
	TriggerClientEvent('esx_hifi:stop_music', -1, coords)
end)

RegisterServerEvent('esx_hifi:setVolume')
AddEventHandler('esx_hifi:setVolume', function(volume, coords)
	TriggerClientEvent('esx_hifi:setVolume', -1, volume, coords)
end)
