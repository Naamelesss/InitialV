RegisterServerCallback('getInfoQuartie', function(source, callback, Quartie)
    MySQL.Async.fetchAll("SELECT XP FROM illegal WHERE Quartie = '" .. Quartie .. "'", { }, function(result)
        if result[1] then
            callback(true, result[1].XP)
        else
            callback(false)
        end
    end)
end)

RegisterServerCallback('changeRepQuartie', function(source, callback, Quartie, Montant)

    MySQL.Async.fetchAll("SELECT XP FROM illegal WHERE Quartie = '" .. Quartie .. "'", { }, function(result)
        MySQL.Async.execute("UPDATE illegal SET XP='" .. result[1].XP+Montant .. "' WHERE Quartie='" .. Quartie .. "';", {}, function()
            callback(result[1].XP+Montant)
        end)
    end)
end)