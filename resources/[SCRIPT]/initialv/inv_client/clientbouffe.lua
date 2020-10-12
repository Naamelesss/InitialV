--local datastatus
--local prenom
--local nom
--local isalreadyeffect = false

--[[RegisterNetEvent('InitialCore:SendStatusInfoFirstJoin')
AddEventHandler('InitialCore:SendStatusInfoFirstJoin', function(data, prenom2, nom2)
	prenom = prenom2
	nom = nom2
    datastatus = data
	ActualiseStatusBar()
	if datastatus.faim <= 10 then
		AdvancedNotif('Initial V', '~r~' .. prenom .. ' ' .. nom, 'Vous avez faim, vous commencez à vous sentir mal.', 'CHAR_WE', 'INITIALV')
		if not isalreadyeffect then
			isalreadyeffect = true
			ShakeGameplayCam('HAND_SHAKE', 2.0)
		end
	end
	if datastatus.soif <= 10 then
		AdvancedNotif('Initial V', '~r~' .. prenom .. ' ' .. nom, 'Vous avez soif, vous commencez à vous sentir mal.', 'CHAR_WE', 'INITIALV')
		if not isalreadyeffect then
			isalreadyeffect = true
			ShakeGameplayCam('HAND_SHAKE', 2.0)
		end
	end
end)

RegisterNetEvent('InitialCore:SendStatusInfo')
AddEventHandler('InitialCore:SendStatusInfo', function(data)
    datastatus = data
	ActualiseStatusBar()
	if datastatus.faim <= 10 then
		AdvancedNotif('Initial V', '~r~' .. prenom .. ' ' .. nom, 'Vous avez faim, vous commencez à vous sentir mal.', 'CHAR_WE', 'INITIALV')
		if not isalreadyeffect then
			isalreadyeffect = true
			ShakeGameplayCam('HAND_SHAKE', 2.0)
		end
	end
	if datastatus.soif <= 10 then
		AdvancedNotif('Initial V', '~r~' .. prenom .. ' ' .. nom, 'Vous avez soif, vous commencez à vous sentir mal.', 'CHAR_WE', 'INITIALV')
		if not isalreadyeffect then
			isalreadyeffect = true
			ShakeGameplayCam('HAND_SHAKE', 2.0)
		end
	end
end)]]

function GetStatusData()
	local status = {}
	TriggerServerCallback('InitialCore:LoadStatus', function(datastatus)
		table.insert(status, {
			name    = 'faim',
			val     = datastatus.faim,
			color   = '#e68a00'
		})
		table.insert(status, {
			name    = 'soif',
			val     = datastatus.soif,
			color   = '#00779e'
		})
	end)
	while not status[1] do
		Wait(100)
	end
	return status
end

RegisterNetEvent('InitialCore:ResetShakeCamEffect')
AddEventHandler('InitialCore:ResetShakeCamEffect', function()
	ShakeGameplayCam('HAND_SHAKE', 0.0)
end)