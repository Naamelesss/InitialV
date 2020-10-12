------------------------------------------------------------------------------
--
-- Ce travail est sous liscence:
-- Creative Commons Attribution-NonCommercial-NoDerivatives-NoDistribution 4.0 International License.
--
------------------------------------------------------------------------------

local scaleform
local bankForm
local curMenu
local displayatm = false
local Atm = {
    {prop = 'prop_atm_02'},
    {prop = 'prop_atm_03'},
    {prop = 'prop_fleeca_atm'},
    {prop = 'prop_atm_01'}
}
local withdrawAmount, depositAmount = {}, {}
local tempAmount
local tempAction

local LastComptePrincipalModif = {[1] = false}
local LastCompteEntrepriseModif = {[1] = false}
local CompteEmmeteur2

local p1 = 1
local s1 = 1
local e1 = 1
local BankOpen = false
local ComptePrincipales = {}
local CompteSecondaires = {}
local CompteEntreprises = {}
local CompteRecepteur
local MontantEnvoie
local Percent_ = 0.0

local ListDepenses = {250, 500, 750, 1000, 1250, 1500, 1750, 2000}
local ListDecouvert = {250, 500, 750, 1000, 1250, 1500, 1750, 2000}
local ListDepensesIndex
local ListDecouvertIndex
local CarteBloquee

RMenu.Add('bank', 'main', RageUI.CreateMenu("Banque", "~b~GESTION DES COMPTES"))
RMenu.Add('bank', 'gestioncompteprincipal', RageUI.CreateSubMenu(RMenu:Get('bank', 'main'), "Banque", "~b~GESTION DU COMPTE"))
RMenu.Add('bank', 'gestioncompteentreprise', RageUI.CreateSubMenu(RMenu:Get('bank', 'main'), "Banque", "~b~GESTION DU COMPTE ENTREPRISE"))
RMenu.Add('bank', 'transfertargent', RageUI.CreateSubMenu(RMenu:Get('bank', 'main'), "Banque", "~b~TRANSFERT D'ARGENT"))
RMenu.Add('bank', 'transfertargentselectrecepteur', RageUI.CreateSubMenu(RMenu:Get('bank', 'transfertargent'), "Banque", "~b~SÉLÉCTIONEZ LE COMPTE"))
RMenu.Add('bank', 'chargement', RageUI.CreateSubMenu(RMenu:Get('bank', 'transfertargentselectrecepteur'), "Banque", "~b~CHARGEMENT"))
RMenu:Get('bank', 'chargement').Closable = false
RMenu.Add('bank', 'chargement2', RageUI.CreateSubMenu(RMenu:Get('bank', 'main'), "Banque", "~b~CHARGEMENT"))
RMenu:Get('bank', 'chargement2').Closable = false

Citizen.CreateThread(function()
    --local plyPed = GetPlayerPed(-1)
    while true do
        Citizen.Wait(1)
        local coords = GetEntityCoords(GetPlayerPed(-1))
        local VDistP = Vdist2(coords.x, coords.y, coords.z, 247.105, 224.96, 106.28)
        if VDistP > 500.0 then
           Wait(5000)
        else
            if VDistP < 3.0 then
                HelpNotif('Appuyez sur ~INPUT_PICKUP~ pour intéragir avec Adam.')
                if IsControlJustPressed(1, 51) then
                    if not BankOpen then
                        RageUI.Visible(RMenu:Get('bank', 'main'), true)
                        BankOpen = true
                        TriggerEvent('InitialCore:LoadBankMenu')
                    end
                end
            end
        end
    end
end)

Citizen.CreateThread(function()
    BankBlip = AddBlipForCoord(235.343, 216.816, 106.286)
    SetBlipSprite(BankBlip, 108)
    SetBlipDisplay(BankBlip, 4)
    SetBlipScale(BankBlip, 0.7)
    SetBlipColour(BankBlip, 2)
    SetBlipAsShortRange(BankBlip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Pacific Standard Bank")
    EndTextCommandSetBlipName(BankBlip)

    --[[local handle, object = FindFirstObject()
    local finished = false
    repeat
        Wait(1)
        for k, v in pairs(Atm) do
            print(GetEntityModel(object))
            if GetEntityModel(object) == GetHashKey(v.prop) then
                ATMBlip = AddBlipForCoord(GetEntityCoords(object))
                SetBlipSprite(ATMBlip, 108)
                SetBlipDisplay(ATMBlip, 4)
                SetBlipScale(ATMBlip, 0.7)
                SetBlipColour(ATMBlip, 2)
                SetBlipAsShortRange(ATMBlip, true)
                BeginTextCommandSetBlipName("STRING")
                AddTextComponentString("Banque central")
                EndTextCommandSetBlipName(ATMBlip)
            end
        end
        finished, object = FindNextObject(handle)
    until not finished
    EndFindObject(handle)]]

    --print(GetEntityCoords(object).x)

    --local finished, object = FindNextObject(handle)
    --EndFindObject(handle)
end)

-- B2

function IsNearATM()
    local objects = {}
    for _,v in pairs(Atm) do
      table.insert(objects, v.prop)
    end
  
    local ped = GetPlayerPed(-1)
    local list = {}
  
    for _,v in pairs(objects) do
        local obj = GetClosestObjectOfType(GetEntityCoords(ped).x, GetEntityCoords(ped).y, GetEntityCoords(ped).z, 5.0, GetHashKey(v), false, true ,true)
        local dist = GetDistanceBetweenCoords(GetEntityCoords(ped), GetEntityCoords(obj), true)
        table.insert(list, {object = obj, distance = dist})
      end
  
      local closest = list[1]
      for _,v in pairs(list) do
        if v.distance < closest.distance then
          closest = v
        end
      end
  
      local distance = closest.distance
      local object = closest.object

      if distance < 1.3 then
        return true
      else
        return false
      end
end -- ##

RegisterNetEvent('InitialCore:UseCB')
AddEventHandler('InitialCore:UseCB', function(carte)
    if IsNearATM() then
        TriggerServerCallback("getInfoCompteCB", function(Compte2)
            local CBAccount = Compte2[1]
            CodeCarte = KeyboardInput("", 4)
            if CodeCarte == tostring(CBAccount.CodeCarte) then
                bankForm = AtmMainMenu("ATM", CBAccount.Argent)
                curMenu = "mainMenu"
                displayatm = true
                while displayatm do
                    Wait(0)
                    ShowCursorThisFrame()
                    local mouseX = GetDisabledControlNormal(2, 239)
                    local mouseY = GetDisabledControlNormal(2, 240)
                    BeginScaleformMovieMethod(bankForm, "SET_MOUSE_INPUT")
                    ScaleformMovieMethodAddParamFloat(mouseX)
                    ScaleformMovieMethodAddParamFloat(mouseY)
                    EndScaleformMovieMethod()

                    DrawScaleformMovie(bankForm, 0.485, 0.485, 1.0, 1.0, 255, 255, 255, 0, 0)
                    --DrawScaleformMovieFullscreen(bankForm, 255, 255, 255, 255)

                    DisableAllControlActions(1) 
                    --EnableControlAction(0, 249, true) -- Vocal key
                    --EnableControlAction(0, 245, true) -- Fivem chat
                    SetMouseCursorActiveThisFrame()
                    --SetNuiFocus(true, true)
                    if IsDisabledControlJustPressed(1, 237) then
                        BeginScaleformMovieMethod(bankForm, "SET_INPUT_SELECT")
                        EndScaleformMovieMethod()
                        BeginScaleformMovieMethod(bankForm, "GET_CURRENT_SELECTION")
                        local value = EndScaleformMovieMethodReturn()
                        while not IsScaleformMovieMethodReturnValueReady(value) do
                            Wait(0)
                        end
                        local cb = GetScaleformMovieMethodReturnValueInt(value)
                        OpenSubMenu(cb, CBAccount.Argent, CBAccount.CarteCredit, CBAccount.LogTransaction)
                    end
                    if IsDisabledControlJustPressed(1, 200) then
                        displayatm = false
                        curMenu = nil
                        SetScaleformMovieAsNoLongerNeeded(bankForm)
                        bankForm = nil
                    end
                end
                EnableAllControlActions(1)
                --SetNuiFocus(false, false)
            else
                AdvancedNotif('Banque', 'Erreur', 'Code invalide.', 'CHAR_WE', 'INITIALV')
            end
        end, carte)
    else
        AdvancedNotif('Banque', 'Erreur', 'Aucun ATM à proximité.', 'CHAR_WE', 'INITIALV')
    end
end)

function AddString(param)
	BeginTextCommandScaleformString(param)
	EndTextCommandScaleformString()
end
function SetDataSlot(scaleform, slotId, string, amount)
	BeginScaleformMovieMethod(scaleform, "SET_DATA_SLOT")
	ScaleformMovieMethodAddParamInt(tonumber(slotId))
	BeginTextCommandScaleformString(string)
	AddTextComponentFormattedInteger(amount, 1)
	EndTextCommandScaleformString()
	EndScaleformMovieMethod()
end
function AtmMainMenu(form, ArgentCompte)
	SetScaleformMovieAsNoLongerNeeded()
	local scaleform = RequestScaleformMovie(form) 

	while not HasScaleformMovieLoaded(scaleform) do Wait(1) end

	BeginScaleformMovieMethod(scaleform, "SET_DATA_SLOT_EMPTY")
	EndScaleformMovieMethod()

	BeginScaleformMovieMethod(scaleform, "SET_DATA_SLOT")
	ScaleformMovieMethodAddParamInt(0)
	AddString("MPATM_SER")
	EndScaleformMovieMethod()

	BeginScaleformMovieMethod(scaleform, "SET_DATA_SLOT")
	ScaleformMovieMethodAddParamInt(1)
	AddString("MPATM_DIDM")
	EndScaleformMovieMethod()

	BeginScaleformMovieMethod(scaleform, "SET_DATA_SLOT")
	ScaleformMovieMethodAddParamInt(2)
	AddString("MPATM_WITM")
	EndScaleformMovieMethod()

	BeginScaleformMovieMethod(scaleform, "SET_DATA_SLOT")
	ScaleformMovieMethodAddParamInt(3)
	AddString("MPATM_LOG")
	EndScaleformMovieMethod()
	
	BeginScaleformMovieMethod(scaleform, "SET_DATA_SLOT")
	ScaleformMovieMethodAddParamInt(4)
	AddString("MPATM_BACK")
	EndScaleformMovieMethod()


	BeginScaleformMovieMethod(scaleform, "DISPLAY_BALANCE")
	ScaleformMovieMethodAddParamTextureNameString("Solde")
	AddString("MPATM_ACBA")
	ScaleformMovieMethodAddParamInt(ArgentCompte)
	EndScaleformMovieMethod()
	BeginScaleformMovieMethod(scaleform, "DISPLAY_MENU")
	EndScaleformMovieMethod()

	return scaleform
end
function Deposit(scaleform, ArgentCompte)
	SetScaleformMovieAsNoLongerNeeded()
	local OptionDeposit = { [1] = 10, [2] = 25, [3] = 50, [5] = 100, [6] = 200, [7] = 500 }
	local scaleform = RequestScaleformMovie(scaleform) 

	while not HasScaleformMovieLoaded(scaleform) do Wait(1) end

	BeginScaleformMovieMethod(scaleform, "SET_DATA_SLOT_EMPTY")
	EndScaleformMovieMethod()

	BeginScaleformMovieMethod(scaleform, "SET_DATA_SLOT")
	ScaleformMovieMethodAddParamInt(0)
	AddString("MPATM_DITMT")
	EndScaleformMovieMethod()
		--[[ DO NOT PUT A VALUE HERE ]]
	BeginScaleformMovieMethod(scaleform, "SET_DATA_SLOT")
	ScaleformMovieMethodAddParamInt(4)
	AddString("MPATM_BACK")
	EndScaleformMovieMethod()
	--[[ DO NOT PUT A VALUE HERE ]]

	for k, v in pairs(OptionDeposit) do
		SetDataSlot(scaleform, k, "ESDOLLA", v)
		depositAmount[k] = v
	end

    --amount = PlayerCash
	--SetDataSlot(scaleform, k, "ESDOLLA", amount) -- ##
	--depositAmount[k] = amount

	BeginScaleformMovieMethod(scaleform, "DISPLAY_BALANCE")
	ScaleformMovieMethodAddParamTextureNameString("Versement")
	AddString("MPATM_ACBA")
	ScaleformMovieMethodAddParamInt(ArgentCompte)
	EndScaleformMovieMethod()
	BeginScaleformMovieMethod(scaleform, "DISPLAY_CASH_OPTIONS")
	EndScaleformMovieMethod()
	
	return scaleform
end
function Withdraw(scaleform, ArgentCompte)
	SetScaleformMovieAsNoLongerNeeded()
	local OptionDeposit = { [1] = 10, [2] = 25, [3] = 50, [5] = 100, [6] = 200, [7] = 500 }
	local scaleform = RequestScaleformMovie(scaleform) 

	while not HasScaleformMovieLoaded(scaleform) do Wait(1) end
	BeginScaleformMovieMethod(scaleform, "SET_DATA_SLOT_EMPTY")
	EndScaleformMovieMethod()

	BeginScaleformMovieMethod(scaleform, "SET_DATA_SLOT")
	ScaleformMovieMethodAddParamInt(0)
	AddString("MPATM_WITMT")
	EndScaleformMovieMethod()

	BeginScaleformMovieMethod(scaleform, "SET_DATA_SLOT")
	ScaleformMovieMethodAddParamInt(4)
	AddString("MPATM_BACK")
	EndScaleformMovieMethod()
	
	for k, v in pairs(OptionDeposit) do
		SetDataSlot(scaleform, k, "ESDOLLA", v)
		withdrawAmount[k] = v
	end

	BeginScaleformMovieMethod(scaleform, "DISPLAY_BALANCE")
	ScaleformMovieMethodAddParamTextureNameString("Retrait")
	AddString("MPATM_ACBA")
	ScaleformMovieMethodAddParamInt(ArgentCompte)
	EndScaleformMovieMethod()
	BeginScaleformMovieMethod(scaleform, "DISPLAY_CASH_OPTIONS")
	EndScaleformMovieMethod()

	return scaleform
end
function OperationsLogs(scaleform, ArgentCompte, transactionLog)
	SetScaleformMovieAsNoLongerNeeded()
	local scaleform = RequestScaleformMovie(scaleform) 

	while not HasScaleformMovieLoaded(scaleform) do Wait(1) end

	BeginScaleformMovieMethod(scaleform, "SET_DATA_SLOT_EMPTY")
	EndScaleformMovieMethod()

	BeginScaleformMovieMethod(scaleform, "SET_DATA_SLOT")
	ScaleformMovieMethodAddParamInt(0)
	AddString("MPATM_LOG")
	EndScaleformMovieMethod()

	BeginScaleformMovieMethod(scaleform, "SET_DATA_SLOT")
	ScaleformMovieMethodAddParamInt(1)
	AddString("MPATM_BACK")
	EndScaleformMovieMethod()

    --[[transactionLog = {[1] = {Type = 0, Montant = 450, Raison = 'Achat voiture'}, [2] = {Type = 0, Montant = 40, Raison = 'Facture Unicorn'},
    [3] = {Type = 1, Montant = 1300, Raison = 'Salaire couturier'},
    [4] = {Type = 1, Montant = 1300, Raison = 'Salaire couturier'},
    [5] = {Type = 1, Montant = 1300, Raison = 'Salaire couturier'},
    [6] = {Type = 1, Montant = 1300, Raison = 'Salaire couturier'},
    [7] = {Type = 1, Montant = 1300, Raison = 'Salaire couturier'},
    [8] = {Type = 1, Montant = 1300, Raison = 'Salaire couturier'},
    [9] = {Type = 1, Montant = 1300, Raison = 'Salaire couturier'},
    [10] = {Type = 1, Montant = 1300, Raison = 'Salaire couturier10'},
    [11] = {Type = 1, Montant = 1300, Raison = 'Salaire couturier11'},
    [12] = {Type = 1, Montant = 1300, Raison = 'Salaire couturier12'},
    [13] = {Type = 1, Montant = 1300, Raison = 'Salaire couturier13'},
    [14] = {Type = 1, Montant = 1300, Raison = 'Salaire couturier14'},
    [15] = {Type = 1, Montant = 1300, Raison = 'Salaire couturier15'},
    [16] = {Type = 1, Montant = 1300, Raison = 'Salaire couturier16'},
    [17] = {Type = 1, Montant = 1300, Raison = 'Salaire couturier17'},
    [18] = {Type = 1, Montant = 1300, Raison = 'Salaire couturier18'},
    }]]
    transactionLog = json.decode(transactionLog)
    -- ##
	if transactionLog[1] ~= nil and transactionLog[1] ~= {} then
		for i = 2, (#transactionLog+1), 1 do
			local i2 = i-1
			BeginScaleformMovieMethod(scaleform, "SET_DATA_SLOT")
			ScaleformMovieMethodAddParamInt(i)
			ScaleformMovieMethodAddParamInt(transactionLog[i2].Type) -- 0 FOR Debit | 1 for crédit
			ScaleformMovieMethodAddParamInt(transactionLog[i2].Montant)
			ScaleformMovieMethodAddParamTextureNameString(transactionLog[i2].Raison)
			EndTextCommandScaleformString()
			EndScaleformMovieMethod()
		end
	end

	BeginScaleformMovieMethod(scaleform, "DISPLAY_BALANCE")
	ScaleformMovieMethodAddParamTextureNameString("Historique des transactions")
	AddString("MPATM_ACBA")
	ScaleformMovieMethodAddParamInt(ArgentCompte)
	EndScaleformMovieMethod()
	BeginScaleformMovieMethod(scaleform, "DISPLAY_TRANSACTIONS")
	EndScaleformMovieMethod()


	return scaleform
end
function ConfirmationMenu(scaleform, type, amount, ArgentCompte)
	SetScaleformMovieAsNoLongerNeeded()
	local scaleform = RequestScaleformMovie(scaleform)
	while not HasScaleformMovieLoaded(scaleform) do
		Wait(0)
	end

	BeginScaleformMovieMethod(scaleform, "SET_DATA_SLOT_EMPTY")
	EndScaleformMovieMethod()

	BeginScaleformMovieMethod(scaleform, "SET_DATA_SLOT")
	ScaleformMovieMethodAddParamInt(0)
	if type == 0 then
		BeginTextCommandScaleformString("MPATC_CONFW")
	elseif type == 1 then
		BeginTextCommandScaleformString("MPATM_CONF")
	end
	AddTextComponentFormattedInteger(amount, 1)
	EndTextCommandScaleformString()
	EndScaleformMovieMethod()

	BeginScaleformMovieMethod(scaleform, "SET_DATA_SLOT")
	ScaleformMovieMethodAddParamInt(1)
	AddString("MO_YES")
	EndScaleformMovieMethod()

	BeginScaleformMovieMethod(scaleform, "SET_DATA_SLOT")
	ScaleformMovieMethodAddParamInt(2)
	AddString("MO_NO")
	EndScaleformMovieMethod()

	BeginScaleformMovieMethod(scaleform, "DISPLAY_BALANCE")
	ScaleformMovieMethodAddParamTextureNameString("Confirmation")
	AddString("MPATM_ACBA")
	ScaleformMovieMethodAddParamInt(ArgentCompte)
	EndScaleformMovieMethod()
	BeginScaleformMovieMethod(scaleform, "DISPLAY_MESSAGE")
	EndScaleformMovieMethod()
	return scaleform
end
function SuccessMenu(scaleform, ArgentCompte)
	SetScaleformMovieAsNoLongerNeeded()
	local scaleform = RequestScaleformMovie(scaleform)
	while not HasScaleformMovieLoaded(scaleform) do
		Wait(0)
	end
	
	BeginScaleformMovieMethod(scaleform, "SET_DATA_SLOT_EMPTY")
	EndScaleformMovieMethod()

	BeginScaleformMovieMethod(scaleform, "SET_DATA_SLOT")
	ScaleformMovieMethodAddParamInt(0)
	AddString("MPATM_TRANCOM")
	EndScaleformMovieMethod()

	BeginScaleformMovieMethod(scaleform, "SET_DATA_SLOT")
	ScaleformMovieMethodAddParamInt(1)
	AddString("MPATM_BACK")
	EndScaleformMovieMethod()


	BeginScaleformMovieMethod(scaleform, "DISPLAY_BALANCE")
	ScaleformMovieMethodAddParamTextureNameString("Succès")
	AddString("MPATM_ACBA")
	ScaleformMovieMethodAddParamInt(ArgentCompte)
	EndScaleformMovieMethod()
	BeginScaleformMovieMethod(scaleform, "DISPLAY_MESSAGE")
	EndScaleformMovieMethod()

	return scaleform
end
function PendingAction(scaleform)
	SetScaleformMovieAsNoLongerNeeded()
	local scaleform = RequestScaleformMovie(scaleform)
	while not HasScaleformMovieLoaded(scaleform) do
		Wait(0)
	end

	BeginScaleformMovieMethod(scaleform, "SET_DATA_SLOT_EMPTY")
	EndScaleformMovieMethod()

	BeginScaleformMovieMethod(scaleform, "SET_DATA_SLOT")
	ScaleformMovieMethodAddParamInt(0)
	AddString("MPATM_PEND")
	EndScaleformMovieMethod()

	BeginScaleformMovieMethod(scaleform, "DISPLAY_MESSAGE")
	EndScaleformMovieMethod()

	return scaleform
end
function ErrorMenu(scaleform, ArgentCompte)
	SetScaleformMovieAsNoLongerNeeded()
	local scaleform = RequestScaleformMovie(scaleform)
	while not HasScaleformMovieLoaded(scaleform) do
		Wait(0)
	end

	BeginScaleformMovieMethod(scaleform, "SET_DATA_SLOT_EMPTY")
	EndScaleformMovieMethod()

	BeginScaleformMovieMethod(scaleform, "SET_DATA_SLOT")
	ScaleformMovieMethodAddParamInt(0)
	if curMenu == "errorMenu1" then
		AddString("MPATM_NODO2")
	elseif curMenu == "errorMenu2" then
        AddString("MPATM_NODO")
	end
	EndScaleformMovieMethod()

	BeginScaleformMovieMethod(scaleform, "SET_DATA_SLOT")
	ScaleformMovieMethodAddParamInt(1)
	AddString("MPATM_BACK")
	EndScaleformMovieMethod()

	BeginScaleformMovieMethod(scaleform, "DISPLAY_BALANCE")
	ScaleformMovieMethodAddParamTextureNameString("Erreur")
	AddString("MPATM_ACBA")
	ScaleformMovieMethodAddParamInt(ArgentCompte)
	EndScaleformMovieMethod()
	BeginScaleformMovieMethod(scaleform, "DISPLAY_MESSAGE")
	EndScaleformMovieMethod()

	return scaleform
end
function ErrorMenu2(scaleform, ArgentCompte)
	SetScaleformMovieAsNoLongerNeeded()
	local scaleform = RequestScaleformMovie(scaleform)
	while not HasScaleformMovieLoaded(scaleform) do
		Wait(0)
	end

	BeginScaleformMovieMethod(scaleform, "SET_DATA_SLOT_EMPTY")
	EndScaleformMovieMethod()

	BeginScaleformMovieMethod(scaleform, "SET_DATA_SLOT")
	ScaleformMovieMethodAddParamInt(0)
    BeginTextCommandScaleformString("STRING")
    AddTextComponentScaleform("Dépenses maximum journalier atteint.")
	EndTextCommandScaleformString()
	EndScaleformMovieMethod()

	BeginScaleformMovieMethod(scaleform, "SET_DATA_SLOT")
	ScaleformMovieMethodAddParamInt(1)
	AddString("MPATM_BACK")
	EndScaleformMovieMethod()

	BeginScaleformMovieMethod(scaleform, "DISPLAY_BALANCE")
	ScaleformMovieMethodAddParamTextureNameString("Erreur")
	AddString("MPATM_ACBA")
	ScaleformMovieMethodAddParamInt(ArgentCompte)
	EndScaleformMovieMethod()
	BeginScaleformMovieMethod(scaleform, "DISPLAY_MESSAGE")
	EndScaleformMovieMethod()

	return scaleform
end

function OpenSubMenu(key, ArgentCompte, CarteCompte, LogTransaction)
    if curMenu == "mainMenu" then
        if key == 1 then
            SetScaleformMovieAsNoLongerNeeded(bankForm)
            bankForm = Deposit("ATM", ArgentCompte)
            curMenu = "subMenu"..key
        elseif key == 2 then -- ##
            SetScaleformMovieAsNoLongerNeeded(bankForm)
            bankForm = Withdraw("ATM", ArgentCompte)
            curMenu = "subMenu"..key
        elseif key == 3 then
            bankForm = OperationsLogs("ATM", ArgentCompte, LogTransaction)
            curMenu = "subMenu"..key
        elseif key == 4 then
            displayatm = false
            curMenu = nil
            SetScaleformMovieAsNoLongerNeeded(bankForm)
            bankForm = nil
            Wait(1000)
        end
    elseif curMenu == "subMenu1" or curMenu == "subMenu2" then
        if key == 4 then
            SetScaleformMovieAsNoLongerNeeded(bankForm)
            bankForm = AtmMainMenu("ATM", ArgentCompte)
            curMenu = "mainMenu"
        elseif curMenu == "subMenu1" then
            tempAmount = depositAmount[key]
            tempAction = 1
            bankForm = ConfirmationMenu("ATM", 1, tempAmount, ArgentCompte)
            curMenu = "confirmationSM"
        elseif curMenu == "subMenu2" then
            tempAmount = withdrawAmount[key]
            tempAction = 0
            bankForm = ConfirmationMenu("ATM", 0, tempAmount, ArgentCompte)
            curMenu = "confirmationSM"
        end
    elseif curMenu == "subMenu3" then
        if key == 1 then
            SetScaleformMovieAsNoLongerNeeded(bankForm)
            bankForm = AtmMainMenu("ATM", ArgentCompte)
            curMenu = "mainMenu"
        end
    elseif curMenu == "confirmationSM" then
        if key == 1 then
            -- 0 RETIRER 1 DEPOSER
            local amount, action =  tempAmount, tempAction
            TriggerServerCallback("transactionATM", function(isaccepted, raison)
                bankForm = PendingAction("ATM")
                Wait(2000)
                if isaccepted then
                    SetScaleformMovieAsNoLongerNeeded(bankForm)
                    if action == 1 then
                        ArgentCompte = ArgentCompte+amount
                        bankForm = SuccessMenu("ATM", ArgentCompte)
                    else
                        ArgentCompte = ArgentCompte-amount
                        bankForm = SuccessMenu("ATM", ArgentCompte)
                    end
                    curMenu = "successMenu"
                elseif raison == 1 then
                    if action == 1 then
                        curMenu = "errorMenu2"
				        SetScaleformMovieAsNoLongerNeeded(bankForm)
                        bankForm = ErrorMenu("ATM", ArgentCompte)
                    else
                        curMenu = "errorMenu1"
				        SetScaleformMovieAsNoLongerNeeded(bankForm)
                        bankForm = ErrorMenu("ATM", ArgentCompte)
                    end
                elseif raison == 2 then
                    curMenu = "errorMenu1"
				    SetScaleformMovieAsNoLongerNeeded(bankForm)
                    bankForm = ErrorMenu2("ATM", ArgentCompte)
                end
            end, CarteCompte, amount, action)
            tempAmount, tempAction = nil, nil
        elseif key == 2 then
            if tempAction == 1 then
                SetScaleformMovieAsNoLongerNeeded(bankForm)
                bankForm = Deposit("ATM", ArgentCompte)
                curMenu = "subMenu1"
            else
                SetScaleformMovieAsNoLongerNeeded(bankForm)
                bankForm = Withdraw("ATM", ArgentCompte)
                curMenu = "subMenu2"
            end
            tempAmount, tempAction = nil, nil
        end
    elseif curMenu == "errorMenu1" then
        SetScaleformMovieAsNoLongerNeeded(bankForm)
        bankForm = Withdraw("ATM", ArgentCompte)
        curMenu = "subMenu2"
    elseif curMenu == "errorMenu2" then
        SetScaleformMovieAsNoLongerNeeded(bankForm)
        bankForm = Deposit("ATM", ArgentCompte)
        curMenu = "subMenu1"
    elseif curMenu == "successMenu" then
        SetScaleformMovieAsNoLongerNeeded(bankForm)
        bankForm = AtmMainMenu("ATM", ArgentCompte)
        curMenu = "mainMenu"
    end
end
-- B2

AddEventHandler('InitialCore:ReloadBankGes', function()
    Wait(250)
    TriggerServerCallback("getCompteBanque", function(Compte2, ID)
        CompteEntreprises = {}
        ComptePrincipales = {}
        CompteSecondaires = {}
        Compte = Compte2
        p1 = 1
        s1 = 1
        e1 = 1
        for k in pairs(Compte) do
            if Compte[k].Type == "Compte entreprise" then
                CompteEntreprises[e1] = Compte[k]
                e1 = e1+1
            elseif Compte[k].SteamID == ID then
                ComptePrincipales[p1] =  Compte[k]
                p1 = p1+1
            else
                CompteSecondaires[s1] =  Compte[k]
                s1 = s1+1
            end
        end
    end)
end)

AddEventHandler('InitialCore:LoadBankMenu', function()
    TriggerServerCallback("getCompteBanque", function(Compte2, ID)
        CompteEntreprises = {}
        ComptePrincipales = {}
        CompteSecondaires = {}
        Compte = Compte2
        p1 = 1
        s1 = 1
        e1 = 1
        for k in pairs(Compte) do
            if Compte[k].Type == "Compte entreprise" then
                CompteEntreprises[e1] = Compte[k]
                e1 = e1+1
            elseif Compte[k].SteamID == ID then
                ComptePrincipales[p1] =  Compte[k]
                p1 = p1+1
            else
                CompteSecondaires[s1] =  Compte[k]
                s1 = s1+1
            end
        end
    end)
    while BankOpen do
        Citizen.Wait(1)
        if not RageUI.Visible(RMenu:Get('bank', 'main')) and not RageUI.Visible(RMenu:Get('bank', 'gestioncompteprincipal')) and not RageUI.Visible(RMenu:Get('bank', 'gestioncompteentreprise')) and not RageUI.Visible(RMenu:Get('bank', 'transfertargent')) and not RageUI.Visible(RMenu:Get('bank', 'transfertargentselectrecepteur')) and not RageUI.Visible(RMenu:Get('bank', 'chargement')) and not RageUI.Visible(RMenu:Get('bank', 'chargement2')) then
            BankOpen = false
        end
        RageUI.IsVisible(RMenu:Get('bank', 'main'), true, true, true, function()
            RageUI.Separator("[ Compte(s) Ouvert ]")
            if #ComptePrincipales > 0 then
                for k in pairs(ComptePrincipales) do
                    RageUI.Button("Compte N°" .. ComptePrincipales[k].IBAN, "DESC", { RightLabel = ComptePrincipales[k].Argent .. "$" }, true, function(_,_,Selected)
                        if Selected then
                            local DataComte = json.decode(ComptePrincipales[k].DataCompte)
                            if DataComte.maxDepenses == 250 then
                                ListDepensesIndex = 1
                            elseif DataComte.maxDepenses == 500 then
                                ListDepensesIndex = 2
                            elseif DataComte.maxDepenses == 750 then
                                ListDepensesIndex = 3
                            elseif DataComte.maxDepenses == 1000 then
                                ListDepensesIndex = 4
                            elseif DataComte.maxDepenses == 1250 then
                                ListDepensesIndex = 5
                            elseif DataComte.maxDepenses == 1500 then
                                ListDepensesIndex = 6
                            elseif DataComte.maxDepenses == 1750 then
                                ListDepensesIndex = 7
                            elseif DataComte.maxDepenses == 2000 then
                                ListDepensesIndex = 8
                            end
                            if DataComte.maxDecouvert == 250 then
                                ListDecouvertIndex = 1
                            elseif DataComte.maxDecouvert == 500 then
                                ListDecouvertIndex = 2
                            elseif DataComte.maxDecouvert == 750 then
                                ListDecouvertIndex = 3
                            elseif DataComte.maxDecouvert == 1000 then
                                ListDecouvertIndex = 4
                            elseif DataComte.maxDecouvert == 1250 then
                                ListDecouvertIndex = 5
                            elseif DataComte.maxDecouvert == 1500 then
                                ListDecouvertIndex = 6
                            elseif DataComte.maxDecouvert == 1750 then
                                ListDecouvertIndex = 7
                            elseif DataComte.maxDecouvert == 2000 then
                                ListDecouvertIndex = 8
                            end
                            LastCompteEntrepriseModif = {[1] = false}
                            LastComptePrincipalModif = { ComptePrincipales[k].IBAN, ComptePrincipales[k].Argent, ComptePrincipales[k].CarteCredit, ComptePrincipales[k].CBBloquee, DataComte.depenses, ComptePrincipales[k].CodeCarte}
                        end
                    end, RMenu:Get('bank', 'gestioncompteprincipal'))
                end
            else
                RageUI.Button("Vous ne disposez actuellement d'aucun compte", "DESC", { }, true, function(_,_,Selected)
                end)
            end
            RageUI.Separator("[ Compte(s) Professionnel ]")
            if #CompteEntreprises > 0 then
                for k in pairs(CompteEntreprises) do
                    RageUI.Button("Compte N°" .. CompteEntreprises[k].IBAN, "DESC", { RightLabel = CompteEntreprises[k].Argent .. "$" }, true, function(_,_,Selected)
                        if Selected then
                            LastComptePrincipalModif = {[1] = false}
                            LastCompteEntrepriseModif = { CompteEntreprises[k].IBAN, CompteEntreprises[k].Argent, ComptePrincipales[k].CarteCredit, CompteEntreprises[k].CBBloquee, CompteEntreprises[k].CodeCarte}
                        end
                    end, RMenu:Get('bank', 'gestioncompteentreprise'))
                end
            else
                RageUI.Button("Vous ne disposez actuellement d'aucun compte", "DESC", { }, true, function(_,_,Selected)
                end)
            end
            RageUI.Separator("[ Compte(s) co-propriétaire(s) ]")
            if #CompteSecondaires > 0 then
                for k in pairs(CompteSecondaires) do
                    RageUI.Button("Compte N°" .. CompteSecondaires[k].IBAN, "DESC", { RightLabel = CompteSecondaires[k].Argent .. "$" }, true, function(_,_,Selected)
                    end)
                end
            else
                RageUI.Button("Vous ne disposez actuellement d'aucun compte", "DESC", { }, true, function(_,_,Selected)
                end)
            end
            RageUI.Separator("[ Options ]")
            RageUI.Button("Crée un compte personnel", "DESC", { RightLabel = #ComptePrincipales .. "/2" }, true, function(_,_,Selected)
                if Selected then
                    if #ComptePrincipales < 2 then
                        Percent_ = 0.0
                        RageUI.Visible(RMenu:Get('bank', 'chargement2'), true)
                        TriggerServerEvent('InitialCore:CreateCompteBank', false, 1)
                    else
                        AdvancedNotif('Banque', 'Erreur', 'Vous avez déjà atteint le nombre maximum de compte banquaire personnel.', 'CHAR_WE', 'INITIALV')
                    end
                end
            end)
            RageUI.Button("Crée un compte entreprise", "DESC", { RightLabel = #CompteEntreprises .. "/1" }, true, function(_,_,Selected)
                if Selected then
                    if #CompteEntreprises < 1 then
                        Percent_ = 0.0
                        RageUI.Visible(RMenu:Get('bank', 'chargement2'), true)
                        TriggerServerEvent('InitialCore:CreateCompteBank', true, 1)
                    else
                        AdvancedNotif('Banque', 'Erreur', 'Vous avez déjà atteint le nombre maximum de compte banquaire entreprise.', 'CHAR_WE', 'INITIALV')
                    end
                end
            end)
        end)
        RageUI.IsVisible(RMenu:Get('bank', 'gestioncompteprincipal'), true, true, true, function()
            if LastComptePrincipalModif then
                RageUI.Separator("[ Compte N°" .. LastComptePrincipalModif[1] .. " ]")
                RageUI.Button("Solde :", "DESC", { RightLabel = LastComptePrincipalModif[2] .. "$" }, true, function(_,_,Selected)
                end)
                RageUI.Button("Dépenses aujourd'hui :", "DESC", { RightLabel = LastComptePrincipalModif[5] .. "$" }, true, function(_,_,Selected)
                end)
                RageUI.Button("Transferer de l'argent", "DESC", { RightLabel = ">" }, true, function(_,_,Selected)
                end, RMenu:Get('bank', 'transfertargent'))
                RageUI.Button("Recevoir sa carte banquaire", "DESC", { RightLabel = ">" }, true, function(_,_,Selected)
                    if Selected then
                        TriggerServerCallback("receiveCB", function(Code)
                            if Code then
                                TriggerServerEvent('InitialCore:GiveItem', GetPlayerServerId(PlayerId()), "CarteCredit", 1, Code)
                                TriggerServerEvent('InitialCore:LockCreditCard', Code)
                                AdvancedNotif('Banque', 'Carte banquaire', 'Vous avez reçu votre nouvelle carte banquaire (' .. Code .. ').', 'CHAR_WE', 'INITIALV')
                            else
                                AdvancedNotif('Banque', 'Erreur', 'Vous avez déjà reçu la carte banquaire lié à ce compte.', 'CHAR_WE', 'INITIALV')
                            end
                        end, LastComptePrincipalModif[1])
                    end
                end)
                RageUI.Button("Code de la carte :", "DESC", { RightLabel = LastComptePrincipalModif[6] }, true, function(_,_,Selected)
                end)
                if LastComptePrincipalModif[4] == 'false' then
                    RageUI.Button("Bloquer la carte actuelle", "DESC", { RightLabel = ">" }, true, function(_,_,Selected)
                        if Selected then
                            TriggerServerEvent('InitialCore:BlockCreditCard', LastComptePrincipalModif[3], true)
                            AdvancedNotif('Banque', 'Gestion du compte', 'La carte banquaire ' .. LastComptePrincipalModif[3] .. ' a été bloquée.', 'CHAR_WE', 'INITIALV')
                            LastComptePrincipalModif[4] = 'true'
                        end
                    end)
                else
                    RageUI.Button("Débloquer la carte actuelle", "DESC", { RightLabel = ">" }, true, function(_,_,Selected)
                        if Selected then
                            TriggerServerEvent('InitialCore:BlockCreditCard', LastComptePrincipalModif[3], false)
                            AdvancedNotif('Banque', 'Gestion du compte', 'La carte banquaire ' .. LastComptePrincipalModif[3] .. ' a été débloquée.', 'CHAR_WE', 'INITIALV')
                            LastComptePrincipalModif[4] = 'false'
                        end
                    end)
                end
                RageUI.List("Dépenses maximum (24H)", ListDepenses, ListDepensesIndex or 1, "DESC", {}, true, function(Hovered, Active, Selected, Index)
                    if ListDepensesIndex ~= Index then
                        ListDepensesIndex = Index
                    end
                    if Selected then
                        TriggerServerEvent('InitialCore:ChangeDepenseMaxAccount', LastComptePrincipalModif[1], ListDepenses[Index])
                        AdvancedNotif('Banque', 'Gestion du compte', 'Dépenses maximum (24h) modifié.', 'CHAR_WE', 'INITIALV')
                        TriggerEvent('InitialCore:ReloadBankGes')
                    end
                end)
                RageUI.List("Plafond de découvert", ListDecouvert, ListDecouvertIndex or 1, "DESC", {}, true, function(Hovered, Active, Selected, Index)
                    if ListDecouvertIndex ~= Index then
                        ListDecouvertIndex = Index
                    end
                    if Selected then
                        TriggerServerEvent('InitialCore:ChangeDecouvertMaxAccount', LastComptePrincipalModif[1], ListDecouvert[Index])
                        AdvancedNotif('Banque', 'Gestion du compte', 'Plafond modifié.', 'CHAR_WE', 'INITIALV')
                        TriggerEvent('InitialCore:ReloadBankGes')
                    end
                end)
            end
        end)
        RageUI.IsVisible(RMenu:Get('bank', 'gestioncompteentreprise'), true, true, true, function()
            if LastCompteEntrepriseModif then
                RageUI.Separator("[ Compte N°" .. LastCompteEntrepriseModif[1] .. " ]")
                RageUI.Button("Solde :", "DESC", { RightLabel = LastCompteEntrepriseModif[2] .. "$" }, true, function(_,_,Selected)
                end)
                --RageUI.Button("Dépenses aujourd'hui :", "DESC", { RightLabel = LastCompteEntrepriseModif[5] .. "$" }, true, function(_,_,Selected)
                --end)
                RageUI.Button("Transferer de l'argent", "DESC", { RightLabel = ">" }, true, function(_,_,Selected)
                end, RMenu:Get('bank', 'transfertargent'))
                RageUI.Button("Recevoir sa carte banquaire", "DESC", { RightLabel = ">" }, true, function(_,_,Selected)
                    if Selected then
                        TriggerServerCallback("receiveCB", function(Code)
                            if Code then
                                TriggerServerEvent('InitialCore:GiveItem', GetPlayerServerId(PlayerId()), "CarteCredit", 1, Code)
                                TriggerServerEvent('InitialCore:LockCreditCard', Code)
                                AdvancedNotif('Banque', 'Carte banquaire', 'Vous avez reçu votre nouvelle carte banquaire (' .. Code .. ').', 'CHAR_WE', 'INITIALV')
                            else
                                AdvancedNotif('Banque', 'Erreur', 'Vous avez déjà reçu la carte banquaire lié à ce compte.', 'CHAR_WE', 'INITIALV')
                            end
                        end, LastCompteEntrepriseModif[1])
                    end
                end)
                RageUI.Button("Code de la carte :", "DESC", { RightLabel = LastCompteEntrepriseModif[5] }, true, function(_,_,Selected)
                end)
                if LastCompteEntrepriseModif[4] == 'false' then
                    RageUI.Button("Bloquer la carte actuelle", "DESC", { RightLabel = ">" }, true, function(_,_,Selected)
                        if Selected then
                            TriggerServerEvent('InitialCore:BlockCreditCard', LastCompteEntrepriseModif[3], true)
                            AdvancedNotif('Banque', 'Gestion du compte', 'La carte banquaire ' .. LastCompteEntrepriseModif[3] .. ' a été bloquée.', 'CHAR_WE', 'INITIALV')
                            LastCompteEntrepriseModif[4] = 'true'
                        end
                    end)
                else
                    RageUI.Button("Débloquer la carte actuelle", "DESC", { RightLabel = ">" }, true, function(_,_,Selected)
                        if Selected then
                            TriggerServerEvent('InitialCore:BlockCreditCard', LastCompteEntrepriseModif[3], false)
                            AdvancedNotif('Banque', 'Gestion du compte', 'La carte banquaire ' .. LastCompteEntrepriseModif[3] .. ' a été débloquée.', 'CHAR_WE', 'INITIALV')
                            LastCompteEntrepriseModif[4] = 'false'
                        end
                    end)
                end
                --[[RageUI.List("Dépenses maximum (24H)", ListDepenses, ListDepensesIndex or 1, "DESC", {}, true, function(Hovered, Active, Selected, Index)
                    if ListDepensesIndex ~= Index then
                        ListDepensesIndex = Index
                    end
                    if Selected then
                        TriggerServerEvent('InitialCore:ChangeDepenseMaxAccount', LastCompteEntrepriseModif[1], ListDepenses[Index])
                        AdvancedNotif('Banque', 'Gestion du compte', 'Dépenses maximum (24h) modifié.', 'CHAR_WE', 'INITIALV')
                        TriggerEvent('InitialCore:ReloadBankGes')
                    end
                end)
                RageUI.List("Plafond de découvert", ListDecouvert, ListDecouvertIndex or 1, "DESC", {}, true, function(Hovered, Active, Selected, Index)
                    if ListDecouvertIndex ~= Index then
                        ListDecouvertIndex = Index
                    end
                    if Selected then
                        TriggerServerEvent('InitialCore:ChangeDecouvertMaxAccount', LastCompteEntrepriseModif[1], ListDecouvert[Index])
                        AdvancedNotif('Banque', 'Gestion du compte', 'Plafond modifié.', 'CHAR_WE', 'INITIALV')
                        TriggerEvent('InitialCore:ReloadBankGes')
                    end
                end)]]
            end
        end)
        RageUI.IsVisible(RMenu:Get('bank', 'transfertargent'), true, true, true, function()
            print(LastComptePrincipalModif)
            print(LastCompteEntrepriseModif)
            if LastComptePrincipalModif[1] then
                CompteEmmeteur2 = LastComptePrincipalModif[1]
            elseif LastCompteEntrepriseModif[1] then
                CompteEmmeteur2 = LastCompteEntrepriseModif[1]
            end
            RageUI.Button("Compte émetteur", "DESC", { RightLabel = CompteEmmeteur2 }, true, function(_,_,Selected)
            end)
            RageUI.Button("Compte récepteur", "DESC", { RightLabel = CompteRecepteur or "Choisir >" }, true, function(_,_,Selected)
            end, RMenu:Get('bank', 'transfertargentselectrecepteur'))
            if MontantEnvoie then
                RageUI.Button("Montant", "DESC", { RightLabel = MontantEnvoie .. "$" }, true, function(_,_,Selected)
                    if Selected then
                        MontantEnvoie = KeyboardInput("", 30)
                    end
                end)
            else
                RageUI.Button("Montant", "DESC", { RightLabel = "Choisir >" }, true, function(_,_,Selected)
                    if Selected then
                        MontantEnvoie = KeyboardInput("", 30)
                    end
                end)
            end
            RageUI.Button("Valider", "DESC", { RightLabel = ">", Color = { BackgroundColor = {66, 135, 245}, HightLightColor = {0, 98, 255}} }, true, function(_,_,Selected)
                if Selected then
                    if CompteRecepteur and MontantEnvoie and tonumber(MontantEnvoie) > 0 then
                        TriggerServerCallback("validateTransaction", function(isvalide, raison)
                            if isvalide then
                                Percent_ = 0.0
                                LastComptePrincipalModif = {[1] = false}
                                LastCompteEntrepriseModif = {[1] = false}
                                CompteRecepteur = nil
                                MontantEnvoie = nil
                                RageUI.Visible(RMenu:Get('bank', 'chargement'), true)
                            elseif raison == 1 then
                                AdvancedNotif('Banque', 'Erreur', 'Plafond de découvert atteint.', 'CHAR_WE', 'INITIALV')
                            elseif raison == 2 then
                                AdvancedNotif('Banque', 'Erreur', 'Dépenses maximum journalier atteint.', 'CHAR_WE', 'INITIALV')
                            end
                        end, CompteEmmeteur2, CompteRecepteur, tonumber(MontantEnvoie))
                    else
                        AdvancedNotif('Banque', 'Erreur', 'Veuillez choisir un compte récepteur & un montant valide.', 'CHAR_WE', 'INITIALV')
                    end
                end
            end)
        end)
        --[[RageUI.IsVisible(RMenu:Get('bank', 'transfertargententreprise'), true, true, true, function()
            RageUI.Button("Compte émetteur", "DESC", { RightLabel = LastCompteEntrepriseModif[1] }, true, function(_,_,Selected)
            end)
            RageUI.Button("Compte récepteur", "DESC", { RightLabel = CompteRecepteur or "Choisir >" }, true, function(_,_,Selected)
            end, RMenu:Get('bank', 'transfertargentselectrecepteur'))
            if MontantEnvoie then
                RageUI.Button("Montant", "DESC", { RightLabel = MontantEnvoie .. "$" }, true, function(_,_,Selected)
                    if Selected then
                        MontantEnvoie = KeyboardInput("", 30)
                    end
                end)
            else
                RageUI.Button("Montant", "DESC", { RightLabel = "Choisir >" }, true, function(_,_,Selected)
                    if Selected then
                        MontantEnvoie = KeyboardInput("", 30)
                    end
                end)
            end
            RageUI.Button("Valider", "DESC", { RightLabel = ">", Color = { BackgroundColor = {66, 135, 245}, HightLightColor = {0, 98, 255}} }, true, function(_,_,Selected)
                if Selected then
                    if CompteRecepteur and MontantEnvoie and tonumber(MontantEnvoie) > 0 then
                        TriggerServerCallback("validateTransaction", function(isvalide, raison)
                            if isvalide then
                                Percent_ = 0.0
                                LastCompteEntrepriseModif = nil
                                CompteRecepteur = nil
                                MontantEnvoie = nil
                                RageUI.Visible(RMenu:Get('bank', 'chargement'), true)
                            elseif raison == 1 then
                                AdvancedNotif('Banque', 'Erreur', 'Plafond de découvert atteint.', 'CHAR_WE', 'INITIALV')
                            elseif raison == 2 then
                                AdvancedNotif('Banque', 'Erreur', 'Dépenses maximum journalier atteint.', 'CHAR_WE', 'INITIALV')
                            end
                        end, LastCompteEntrepriseModif[1], CompteRecepteur, tonumber(MontantEnvoie))
                    else
                        AdvancedNotif('Banque', 'Erreur', 'Veuillez choisir un compte récepteur & un montant valide.', 'CHAR_WE', 'INITIALV')
                    end
                end
            end)
        end)]]
        RageUI.IsVisible(RMenu:Get('bank', 'transfertargentselectrecepteur'), true, true, true, function()
            if ComptePrincipales then
                if LastComptePrincipalModif == nil then
                    LastComptePrincipalModif = {[1] = false}
                end
                for k in pairs(ComptePrincipales) do
                    if ComptePrincipales[k].IBAN ~= LastComptePrincipalModif[1] then
                        RageUI.Button(ComptePrincipales[k].IBAN, "DESC", { RightLabel = ComptePrincipales[k].Argent .. "$" }, true, function(_,_,Selected)
                            if Selected then
                                CompteRecepteur = ComptePrincipales[k].IBAN
                                RageUI.GoBack()
                            end
                        end)
                    end
                end
            end
            --print(CompteEntreprises[1].IBAN)
            if CompteEntreprises then
                if LastCompteEntrepriseModif == nil then
                    LastCompteEntrepriseModif = {[1] = false}
                end
                for k in pairs(CompteEntreprises) do
                    if CompteEntreprises[k].IBAN ~= LastCompteEntrepriseModif[1] then
                        RageUI.Button(CompteEntreprises[k].IBAN, "DESC", { RightLabel = CompteEntreprises[k].Argent .. "$" }, true, function(_,_,Selected)
                            if Selected then
                                CompteRecepteur = CompteEntreprises[k].IBAN
                                RageUI.GoBack()
                            end
                        end)
                    end
                end
            end
            if CompteSecondaires then
                for k in pairs(CompteSecondaires) do
                    if CompteSecondaires[k].IBAN ~= LastComptePrincipalModif[1] then
                        RageUI.Button(CompteSecondaires[k].IBAN, "DESC", { RightLabel = CompteSecondaires[k].Argent .. "$" }, true, function(_,_,Selected)
                            if Selected then
                                CompteRecepteur = CompteSecondaires[k].IBAN
                                RageUI.GoBack()
                            end
                        end)
                    end
                end
            end
        end)
        RageUI.IsVisible(RMenu:Get('bank', 'chargement'), true, true, true, function()
            RageUI.PercentagePanel(Percent_ or 0.0, "Transfert en cours (" .. math.floor(Percent_*100) .. "%)", "", "", function(Hovered, Active, Percent)
                if Percent_ < 1.0 then
                    Percent_ = Percent_+0.005
                else
                    TriggerServerCallback("getCompteBanque", function(Compte2, ID)
                        CompteEntreprises = {}
                        ComptePrincipales = {}
                        CompteSecondaires = {}
                        Compte = Compte2
                        p1 = 1
                        s1 = 1
                        e1 = 1
                        for k in pairs(Compte) do
                            if Compte[k].Type == "Compte entreprise" then
                                CompteEntreprises[e1] = Compte[k]
                                e1 = e1+1
                            elseif Compte[k].SteamID == ID then
                                ComptePrincipales[p1] =  Compte[k]
                                p1 = p1+1
                            else
                                CompteSecondaires[s1] =  Compte[k]
                                s1 = s1+1
                            end
                        end
                    end)
                    RageUI.Visible(RMenu:Get('bank', 'main'), true)
                    AdvancedNotif('Banque', 'Confirmation', 'Transfert bien effectué.', 'CHAR_WE', 'INITIALV')
                end
            end)
        end)
        RageUI.IsVisible(RMenu:Get('bank', 'chargement2'), true, true, true, function()
            RageUI.PercentagePanel(Percent_ or 0.0, "Création du compte (" .. math.floor(Percent_*100) .. "%)", "", "", function(Hovered, Active, Percent)
                if Percent_ < 1.0 then
                    Percent_ = Percent_+0.005
                else
                    TriggerServerCallback("getCompteBanque", function(Compte2, ID)
                        CompteEntreprises = {}
                        ComptePrincipales = {}
                        CompteSecondaires = {}
                        Compte = Compte2
                        p1 = 1
                        s1 = 1
                        e1 = 1
                        for k in pairs(Compte) do
                            if Compte[k].Type == "Compte entreprise" then
                                CompteEntreprises[e1] = Compte[k]
                                e1 = e1+1
                            elseif Compte[k].SteamID == ID then
                                ComptePrincipales[p1] =  Compte[k]
                                p1 = p1+1
                            else
                                CompteSecondaires[s1] =  Compte[k]
                                s1 = s1+1
                            end
                        end
                    end)
                    RageUI.Visible(RMenu:Get('bank', 'main'), true)
                    AdvancedNotif('Banque', 'Confirmation', 'Création du compte bien effectué.', 'CHAR_WE', 'INITIALV')
                end
            end)
        end)
    end
end)