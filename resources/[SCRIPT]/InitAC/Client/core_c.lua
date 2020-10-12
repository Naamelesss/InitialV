-- ON JOIN

Citizen.CreateThread(function()
    while NetworkIsPlayerActive(PlayerId()) do
        Citizen.Wait(0)
        TriggerServerEvent('InitialCoreS:OnPlayerJoin')
        TriggerEvent('InitialCoreC:OnPlayerJoin')
        DisplayRadar(false)
        AdvancedNotif('Initial V', 'Synchronisation', 'Chargement de votre personnage.', 'CHAR_WE', 'INITIALV')
        break
    end
end)