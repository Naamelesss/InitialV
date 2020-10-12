local BennysInUse = false

RegisterServerCallback('InitialCore:BennysIsLock', function(source, callback)
    callback(BennysInUse) 
end)

RegisterServerEvent('InitialCore:BennysLock')
AddEventHandler('InitialCore:BennysLock', function(val)
    BennysInUse = val
end)