local menuOpen = false
local wasOpen = false
local lastEntity = nil
local currentAction = nil
local currentData = nil

RegisterNetEvent('esx_hifi:place_hifi')
AddEventHandler('esx_hifi:place_hifi', function()
    startAnimation("anim@heists@money_grab@briefcase","put_down_case")
    Citizen.Wait(1000)
    ClearPedTasks(PlayerPedId())
    TriggerEvent('esx:spawnObject', 'prop_boombox_01')
end)

RegisterNetEvent('esx_hifi:play_music')
AddEventHandler('esx_hifi:play_music', function(id, object)
    if distance(object) < Config.distance then
        SendNUIMessage({
            transactionType = 'playSound',
            transactionData = id
        })

        Citizen.CreateThread(function()
            while true do
                Citizen.Wait(100)
                if distance(object) > Config.distance then
                    SendNUIMessage({
                        transactionType = 'stopSound'
                    })
                    break
                end
            end
        end)
    end
end)

RegisterNetEvent('esx_hifi:stop_music')
AddEventHandler('esx_hifi:stop_music', function(object)
    if distance(object) < Config.distance then
        SendNUIMessage({
            transactionType = 'stopSound'
        })
    end
end)

RegisterNetEvent('esx_hifi:setVolume')
AddEventHandler('esx_hifi:setVolume', function(volume, object)
    if distance(object) < Config.distance then
        SendNUIMessage({
            transactionType = 'volume',
            transactionData = volume
        })
    end
end)

function distance(object)
    local playerPed = PlayerPedId()
    local lCoords = GetEntityCoords(playerPed)
    local distance  = GetDistanceBetweenCoords(lCoords, object, true)
    return distance
end

function OpenhifiMenu()
    menuOpen = true
    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'hifi', {
        title   = 'La hifi a momo',
        align   = 'top-left',
        elements = {
            {label = _U('get_hifi'), value = 'get_hifi'},
            {label = _U('play_music'), value = 'play'},
            {label = _U('volume_music'), value = 'volume'},
            {label = _U('stop_music'), value = 'stop'}
        }
    }, function(data, menu)
        local playerPed = PlayerPedId()
        local lCoords = GetEntityCoords(playerPed)
        if data.current.value == 'get_hifi' then
            ESX.PlayerData = ESX.GetPlayerData()
            local alreadyOne = false
            for i=1, #ESX.PlayerData.inventory, 1 do
                if ESX.PlayerData.inventory[i].name == 'hifi' and ESX.PlayerData.inventory[i].count > 0 then
                    alreadyOne = true
                end
            end
            if not alreadyOne then
                NetworkRequestControlOfEntity(currentData)
                menu.close()
                menuOpen = false
                startAnimation("anim@heists@narcotics@trash","pickup")
                Citizen.Wait(700)
                SetEntityAsMissionEntity(currentData,false,true)
                DeleteEntity(currentData)
                ESX.Game.DeleteObject(currentData)
                if not DoesEntityExist(currentData) then
                    TriggerServerEvent('esx_hifi:remove_hifi', lCoords)
                    currentData = nil
                end
                Citizen.Wait(500)
                ClearPedTasks(PlayerPedId())
            else
                menu.close()
                menuOpen = false
                TriggerEvent('esx:showNotification', _U('hifi_alreadyOne'))
            end
        elseif data.current.value == 'play' then
            play(lCoords)
        elseif data.current.value == 'stop' then
            TriggerServerEvent('esx_hifi:stop_music', lCoords)
            menuOpen = false
            menu.close()
        elseif data.current.value == 'volume' then
            setVolume(lCoords)
        end
    end, function(data, menu)
        menuOpen = false
        menu.close()
    end)
end

function setVolume(coords)
    ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'setvolume',
        {
            title = _U('set_volume'),
        }, function(data, menu)
            local value = tonumber(data.value)
            if value < 0 or value > 100 then
                ESX.ShowNotification(_U('sound_limit'))
            else
                TriggerServerEvent('esx_hifi:setVolume', value, coords)
                menu.close()
            end
        end, function(data, menu)
            menu.close()
        end)
end


function play(coords)
    ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'play',
        {
            title = _U('play'),
        }, function(data, menu)
            TriggerServerEvent('esx_hifi:play_music', data.value, coords)
            menu.close()
        end, function(data, menu)
            menu.close()
        end)
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(500)

        local playerPed = PlayerPedId()
        local coords    = GetEntityCoords(playerPed)

        local closestDistance = -1
        local closestEntity   = nil

        local object = GetClosestObjectOfType(coords, 3.0, GetHashKey('prop_boombox_01'), false, false, false)

        if DoesEntityExist(object) then
            local objCoords = GetEntityCoords(object)
            local distance  = GetDistanceBetweenCoords(coords, objCoords, true)

            if closestDistance == -1 or closestDistance > distance then
                closestDistance = distance
                closestEntity   = object
            end
        end

        if closestDistance ~= -1 and closestDistance <= 3.0 then
            if lastEntity ~= closestEntity and not menuOpen then
                ESX.ShowHelpNotification(_U('hifi_help'))
                lastEntity = closestEntity
                currentAction = "music"
                currentData = closestEntity
            end
        else
            if lastEntity then
                lastEntity = nil
                currentAction = nil
                currentData = nil
            end
        end
    end
end)


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        if currentAction then
            if IsControlJustReleased(0, 38) and currentAction == 'music' then
                OpenhifiMenu()
            end
        end
    end
end)

RegisterCommand("electrique", function(source, args, rawCommand)
    TriggerServerEvent('esx_hifi:play_music', "KlJd_bI7DVo", GetEntityCoords(GetPlayerPed(-1)))
end, false)