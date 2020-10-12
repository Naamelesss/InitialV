local charset = {} do
    for c = 65, 90  do table.insert(charset, string.char(c)) end
end

local function randomString(length)
    if not length or length <= 0 then return '' end
    math.randomseed(os.clock()^5)
    return randomString(length - 1) .. charset[math.random(1, #charset)]
end

RegisterServerCallback('getCompteBanque', function(source, callback)
    local SteamID = GetPlayerIdentifier(source)
    MySQL.Async.fetchAll("SELECT * FROM banque_account WHERE SteamID = '" .. SteamID .. "' OR CoSteamID = '" .. SteamID .. "'", { }, function(result)
        callback(result, SteamID)
    end)
end)

RegisterServerCallback('getInfoCompteCB', function(source, callback, codecarte)
    local SteamID = GetPlayerIdentifier(source)
    MySQL.Async.fetchAll("SELECT * FROM banque_account WHERE CarteCredit = '" .. codecarte .. "'", { }, function(result)
        callback(result)
    end)
end)

RegisterServerCallback('validateTransaction', function(source, callback, envoie, recep, montant)
    MySQL.Async.fetchAll("SELECT Argent, DataCompte FROM banque_account WHERE IBAN= '" .. envoie .. "'", { }, function(result)
        MySQL.Async.fetchAll("SELECT Argent FROM banque_account WHERE IBAN= '" .. recep .. "'", { }, function(result2)
            local DataDecompiled = json.decode(result[1].DataCompte)
            if DataDecompiled.maxDecouvert*-1 <= result[1].Argent-montant then
                if DataDecompiled.depenses+montant <= DataDecompiled.maxDepenses then
                    MySQL.Async.execute("UPDATE banque_account SET Argent='" .. result[1].Argent-montant .. "' WHERE IBAN='" .. envoie .. "';", {}, function() end)
                    InsertLogsAccount(envoie, 0, montant, "Transaction entre compte")
                    MySQL.Async.execute("UPDATE banque_account SET Argent='" .. result2[1].Argent+montant .. "' WHERE IBAN='" .. recep .. "';", {}, function() end)
                    InsertLogsAccount(recep, 1, montant, "Transaction entre compte")
                    AddDepenseAccount(envoie, montant)
                    callback(true)
                else
                    callback(false, 2)
                end
            else
                callback(false, 1)
            end
        end)
    end)
end)

RegisterServerCallback('validateFacture', function(source, callback, type, compte, montant, entreprise, codecarte2)
    if type == 2 then
        MySQL.Async.fetchAll("SELECT Argent, IBAN, DataCompte, CodeCarte FROM banque_account WHERE CarteCredit= '" .. compte .. "'", { }, function(result)
            MySQL.Async.fetchAll("SELECT Argent, IBAN FROM banque_account WHERE Entreprise= '" .. entreprise .. "'", { }, function(result2)
                local DataDecompiled = json.decode(result[1].DataCompte)
                print(compte)
                if DataDecompiled.maxDecouvert*-1 <= result[1].Argent-montant then
                    if DataDecompiled.maxDepenses >= montant then
                        if result[1].CodeCarte == codecarte2 then
                            MySQL.Async.execute("UPDATE banque_account SET Argent='" .. result[1].Argent-montant .. "' WHERE CarteCredit='" .. compte .. "';", {}, function()
                                InsertLogsAccount(result[1].IBAN, 0, montant, "Facture " .. entreprise)
                            end)
                            MySQL.Async.execute("UPDATE banque_account SET Argent='" .. result2[1].Argent+montant .. "' WHERE Entreprise='" .. entreprise .. "';", {}, function() 
                                InsertLogsAccount(result2[1].IBAN, 1, montant, "Facture entreprise")
                            end)
                            AddDepenseAccount(result[1].IBAN, montant)
                            callback(true)
                        else
                            callback(false, 1)
                        end
                    else
                        callback(false, 2)
                    end
                else
                    callback(false, 3)
                end
            end)
        end)
    elseif type == 3 then
        MySQL.Async.fetchAll("SELECT Argent, DataCompte FROM banque_account WHERE IBAN= '" .. compte .. "'", { }, function(result)
            MySQL.Async.fetchAll("SELECT Argent, IBAN FROM banque_account WHERE Entreprise= '" .. entreprise .. "'", { }, function(result2)
                local DataDecompiled = json.decode(result[1].DataCompte)
                print(compte)
                if DataDecompiled.maxDecouvert*-1 <= result[1].Argent-montant then
                    MySQL.Async.execute("UPDATE banque_account SET Argent='" .. result[1].Argent-montant .. "' WHERE IBAN='" .. compte .. "';", {}, function()
                        InsertLogsAccount(compte, 0, montant, "Facture " .. entreprise)
                    end)
                    MySQL.Async.execute("UPDATE banque_account SET Argent='" .. result2[1].Argent+montant .. "' WHERE Entreprise='" .. entreprise .. "';", {}, function() 
                        InsertLogsAccount(result2[1].IBAN, 1, montant, "Facture entreprise")
                    end)
                    AddDepenseAccount(compte, montant)
                    callback(true)
                else
                    callback(false)
                end
            end)
        end)
    end
end)

RegisterServerEvent('InitialCore:GiveArgentBank')
AddEventHandler('InitialCore:GiveArgentBank', function(isentreprise, compte, montant)
    if isentreprise then
        MySQL.Async.fetchAll("SELECT Argent, IBAN FROM banque_account WHERE Entreprise= '" .. compte .. "'", { }, function(result)
            MySQL.Async.execute("UPDATE banque_account SET Argent='" .. result[1].Argent+montant .. "' WHERE Entreprise='" .. compte .. "';", {}, function() 
                InsertLogsAccount(result[1].IBAN, 1, montant, "Facture entreprise")
            end)
        end)
    end
end)

RegisterServerEvent('InitialCore:RemoveArgentBank')
AddEventHandler('InitialCore:RemoveArgentBank', function(isentreprise, compte, montant)
    if isentreprise then
        MySQL.Async.fetchAll("SELECT Argent, IBAN FROM banque_account WHERE Entreprise= '" .. compte .. "'", { }, function(result)
            MySQL.Async.execute("UPDATE banque_account SET Argent='" .. result[1].Argent-montant .. "' WHERE Entreprise='" .. compte .. "';", {}, function() 
                InsertLogsAccount(result[1].IBAN, 1, montant, "Achat entreprise")
            end)
        end)
    end
end)

RegisterServerCallback('receiveCB', function(source, callback, IDCompte)
    MySQL.Async.fetchAll("SELECT CarteCredit, CBDonnee FROM banque_account WHERE IBAN= '" .. IDCompte .. "'", { }, function(result)
        if result[1].CBDonnee == nil then
            callback(result[1].CarteCredit)
        else
            callback(false)
        end
    end)
end)

RegisterServerEvent('InitialCore:LockCreditCard')
AddEventHandler('InitialCore:LockCreditCard', function(CodeCB)
    MySQL.Async.execute("UPDATE banque_account SET CBDonnee='true' WHERE CarteCredit='" .. CodeCB .. "';", {}, function() end)
end)

RegisterServerEvent('InitialCore:BlockCreditCard')
AddEventHandler('InitialCore:BlockCreditCard', function(CodeCB, isblocked)
    if isblocked then
        MySQL.Async.execute("UPDATE banque_account SET CBBloquee='true' WHERE CarteCredit='" .. CodeCB .. "';", {}, function() end)
    else
        MySQL.Async.execute("UPDATE banque_account SET CBBloquee='false' WHERE CarteCredit='" .. CodeCB .. "';", {}, function() end)
    end
end)

RegisterServerEvent('InitialCore:CreateCompteBank')
AddEventHandler('InitialCore:CreateCompteBank', function(entrepriseaccount, strenghtaccount)
    src = source
    local SteamID = GetPlayerIdentifier(src)
    if not entrepriseaccount then
        Type = 'Compte personnel'
    else
        Type = 'Compte entreprise'
    end
    local IBAN = "US18-3000-" .. math.random(1000, 9999) .. "-" .. math.random(1000, 9999) .. "-" .. math.random(10, 99) .. randomString(1) .. math.random(1, 9) .. "-" .. math.random(1000, 9999) .. "-" .. math.random(100, 999)
    if strenghtaccount == 1 then
        DataAccount = '{"depenses":0,"maxDepenses":500,"maxDecouvert":1500}'
    end
    CarteCredit = "3177-" .. math.random(1000, 9999) .. "-" .. math.random(1000, 9999) .. "-" .. math.random(1000, 9999)
    CodeCarte = math.random(1000, 9999)
    MySQL.Async.execute("INSERT INTO banque_account (Type, SteamID, Argent, IBAN, DataCompte, CarteCredit, CodeCarte) VALUES ('" .. Type .. "', '" .. SteamID .. "', '0', '" .. IBAN .. "', '" .. DataAccount .. "', '" .. CarteCredit .. "', '" .. CodeCarte .. "');", {}, function() end)
end)

RegisterServerEvent('InitialCore:ChangeDepenseMaxAccount')
AddEventHandler('InitialCore:ChangeDepenseMaxAccount', function(IBAN, Montant)
    MySQL.Async.fetchAll("SELECT DataCompte FROM banque_account WHERE IBAN='" .. IBAN .. "'", { }, function(result)
        local decoded = json.decode(result[1].DataCompte)
        decoded.maxDepenses = Montant
        local encoded = json.encode(decoded)
        MySQL.Async.execute("UPDATE banque_account SET DataCompte='" .. encoded .. "' WHERE IBAN='" .. IBAN .. "'", {}, function() end)
    end)
end)

RegisterServerEvent('InitialCore:ChangeDecouvertMaxAccount')
AddEventHandler('InitialCore:ChangeDecouvertMaxAccount', function(IBAN, Montant)
    MySQL.Async.fetchAll("SELECT DataCompte FROM banque_account WHERE IBAN='" .. IBAN .. "'", { }, function(result)
        local decoded = json.decode(result[1].DataCompte)
        decoded.maxDecouvert = Montant
        local encoded = json.encode(decoded)
        MySQL.Async.execute("UPDATE banque_account SET DataCompte='" .. encoded .. "' WHERE IBAN='" .. IBAN .. "'", {}, function() end)
    end)
end)

RegisterServerCallback('transactionATM', function(source, callback, CarteCompte, Montant, Type)
    local SteamID = GetPlayerIdentifier(source)
    if Type == 1 then
        MySQL.Async.fetchAll("SELECT Argent FROM playerinfo WHERE SteamID='" .. SteamID .. "'", { }, function(result)
            MySQL.Async.fetchAll("SELECT Argent, IBAN FROM banque_account WHERE CarteCredit='" .. CarteCompte .. "'", { }, function(result2)
                if result[1].Argent >= Montant then
                    MySQL.Async.execute("UPDATE playerinfo SET Argent='" .. result[1].Argent-Montant .. "' WHERE SteamID='" .. SteamID .. "';", {}, function() end)
                    MySQL.Async.execute("UPDATE banque_account SET Argent='" .. result2[1].Argent+Montant .. "' WHERE CarteCredit='" .. CarteCompte .. "';", {}, function() end)
                    InsertLogsAccount(result2[1].IBAN, 1, Montant, "Dépot ATM")
                    callback(true)
                else
                    callback(false, 1)
                end
            end)
        end)
    else
        MySQL.Async.fetchAll("SELECT Argent FROM playerinfo WHERE SteamID='" .. SteamID .. "'", { }, function(result)
            MySQL.Async.fetchAll("SELECT Argent, IBAN, DataCompte FROM banque_account WHERE CarteCredit='" .. CarteCompte .. "'", { }, function(result2)
                local DataCompte2 = json.decode(result2[1].DataCompte)
                if result2[1].Argent >= Montant then
                    if DataCompte2.depenses+Montant <= DataCompte2.maxDepenses then
                        MySQL.Async.execute("UPDATE playerinfo SET Argent='" .. result[1].Argent+Montant .. "' WHERE SteamID='" .. SteamID .. "';", {}, function() end)
                        MySQL.Async.execute("UPDATE banque_account SET Argent='" .. result2[1].Argent-Montant .. "' WHERE CarteCredit='" .. CarteCompte .. "';", {}, function() end)
                        InsertLogsAccount(result2[1].IBAN, 0, Montant, "Retrait ATM")
                        AddDepenseAccount(result2[1].IBAN, Montant)
                        callback(true)
                    else
                        callback(false, 2)
                    end
                else
                    callback(false, 1)
                end
            end)
        end)
    end
end)

-- LOG TRANSFERT ARGENT

function InsertLogsAccount(IBAN, Type2, Montant2, Raison2)
    MySQL.Async.fetchAll("SELECT LogTransaction FROM banque_account WHERE IBAN= '" .. IBAN .. "'", { }, function(result)
        local ResultLogTransac = json.decode(result[1].LogTransaction)
        table.insert(ResultLogTransac, 1, {Type = Type2, Montant = Montant2, Raison = Raison2})
        if #ResultLogTransac > 14 then
            table.remove(ResultLogTransac, 15)
        end
        MySQL.Async.execute("UPDATE banque_account SET LogTransaction='" .. json.encode(ResultLogTransac) .. "' WHERE IBAN='" .. IBAN .. "';", {}, function() end)
    end)
end

-- SYSTEME DEPENSE 24H

function AddDepenseAccount(IBAN, Montant2)
    MySQL.Async.fetchAll("SELECT DataCompte FROM banque_account WHERE IBAN= '" .. IBAN .. "'", { }, function(result)
        local ResultData = json.decode(result[1].DataCompte)
        ResultData.depenses = ResultData.depenses+Montant2
        MySQL.Async.execute("UPDATE banque_account SET DataCompte='" .. json.encode(ResultData) .. "' WHERE IBAN='" .. IBAN .. "';", {}, function() end)
    end)
end

-- RESET/24H

function ResetBankDepenses()
    MySQL.Async.fetchAll('SELECT * FROM banque_account', {}, function(result)
        for i = 1, #result do
            local metadata = json.decode(result[i].DataCompte)
            metadata.depenses = 0
            local finalmetadata = json.encode(metadata)
            MySQL.Async.execute("UPDATE banque_account SET DataCompte='" .. finalmetadata .. "' WHERE IBAN='" .. result[i].IBAN .. "';", {}, function() end)
        end
        TriggerClientEvent('InitialCore:AdvancedNotif', -1, 'Banque', 'Information', 'Vos dépenses quotidiennes ont été remises à zero.', 'CHAR_WE', 'INITIALV')
    end)
end
  
TriggerEvent('cron:runAt', 23, 00, ResetBankDepenses)

--[[Citizen.CreateThread(function()
    test = {{t1 = 1}, {t1 = 2}}
    
    table.insert(test, 1, {t1 = 0})
    table.remove(test, 3)
    for k in pairs(test) do
        print(test[k].t1)
    end
end)]]
  
RegisterServerCallback('getCompteBanquaire', function(source, callback)
    local SteamID = GetPlayerIdentifier(source)
    MySQL.Async.fetchAll("SELECT IBAN FROM banque_account WHERE SteamID='" .. SteamID .. "'", { }, function(result) 
        callback(result)
    end)
end)