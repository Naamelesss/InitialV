RegisterServerEvent('InitialCore:RevivePlayerS')
AddEventHandler('InitialCore:RevivePlayerS', function(player, coords, heading, vector)
    TriggerClientEvent('InitialCore:RevivePlayer', player, coords, heading, vector)
end)

RegisterServerEvent('InitialCore:AlertEMS')
AddEventHandler('InitialCore:AlertEMS', function(header, sub, message, isappel, appelid, coords)
    TriggerClientEvent('InitialCore:AlertEMSC', -1, header, sub, message, isappel, appelid, coords)
end)

RegisterServerEvent('InitialCore:RespondAppelEMS')
AddEventHandler('InitialCore:RespondAppelEMS', function(appelid)
    TriggerClientEvent('InitialCore:RespondAppelEMSC', appelid)
end)