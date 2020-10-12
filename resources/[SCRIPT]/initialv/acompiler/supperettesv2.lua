------------------------------------------------------------------------------
--
-- Ce travail est sous liscence:
-- Creative Commons Attribution-NonCommercial-NoDerivatives-NoDistribution 4.0 International License.
--
------------------------------------------------------------------------------

local metier
local niveaumetier
local enService = false

RegisterNetEvent('InitialCore:LoadJob')
AddEventHandler('InitialCore:LoadJob', function(metier2, niveaumetier2)
    metier = metier2
    niveaumetier = niveaumetier2
end)

local ZoneLTD = {
    {x= -709.06, y= -907.20, z= 19.21, type= "vestiaire"},
    {x= -709.67, y= -904.0, z= 19.21, type= "coffre"},
}

RMenu.Add('vestiaireltd', 'main',  RageUI.CreateMenu('Vestiaire', '~b~Vestiaire du LTD'))
RMenu.Add('ltd', 'f6',  RageUI.CreateMenu('LTD', '~b~Menu LTD'))
RMenu.Add('ltd', 'facture',  RageUI.CreateSubMenu(RMenu:Get('ltd', 'f6'), 'LTD', '~b~Facture LTD'))
RMenu.Add('ltd', 'typepaiement', RageUI.CreateSubMenu(RMenu:Get('ltd', 'facture'), "LTD", "~b~Type de paiement"))


local FactureLTD = {}
FactureLTD.HashID = nil
FactureLTD.Entreprise = "LTD"
FactureLTD.Raison = nil
FactureLTD.NomPrenom = nil
FactureLTD.TypePaiement = nil
FactureLTD.MoyenPaiement = nil
FactureLTD.Montant = nil
FactureLTD.Paye = false

local ListTP = {"Espèces", "Carte Banquaire", "Virement Banquaire"}

local isMenuOpened = false

function OpenLTDMenu()
    while isMenuOpened do
        
        Wait(1)

		if not RageUI.Visible(RMenu:Get('ltd', 'facture')) and not RageUI.Visible(RMenu:Get('ltd', 'f6')) and not RageUI.Visible(RMenu:Get('ltd', 'typepaiement')) then
			isMenuOpened = false
        end

        RageUI.IsVisible(RMenu:Get('ltd', 'f6'), true, true, true, function()

            RageUI.Button("Créer une facture", "Créer une facture pour la personne la plus proche.", { RightLabel = ">" }, true, function(_, _, Selected)
            end, RMenu:Get('ltd', 'facture'))

        end)

        RageUI.IsVisible(RMenu:Get('ltd', 'facture'), true, true, true, function()

            RageUI.Button("Entreprise :", nil, { RightLabel = "LTD" }, true, function(_,_,Selected)
            end)

            RageUI.Button("Nom + Prénom :", nil, { RightLabel = FactureLTD.NomPrenom or ">" }, true, function(_,_,Selected)
                if Selected then
                    FactureLTD.NomPrenom = KeyboardInput("", 30)
                end
            end)

            RageUI.Button("Type de paiement :", nil, { RightLabel = ListTP[FactureLTD.TypePaiement] or ">" }, true, function(_,_,Selected)
            end, RMenu:Get('ltd', 'typepaiement'))

            if FactureLTD.Montant then
                RageUI.Button("Montant :", nil, { RightLabel = FactureLTD.Montant .. "$" }, true, function(_,_,Selected)
                    if Selected then
                        FactureLTD.Montant = KeyboardInput("", 30)
                        FactureLTD.Montant = tonumber(FactureLTD.Montant)
                    end
                end)
            else
                RageUI.Button("Montant :", nil, { RightLabel = ">" }, true, function(_,_,Selected)
                    if Selected then
                        FactureLTD.Montant = KeyboardInput("", 30)
                        FactureLTD.Montant = tonumber(FactureLTD.Montant)
                    end
                end)
            end

            RageUI.Button("Valider", nil, {}, true, function(_,_,Selected)
                if Selected then
                    if FactureLTD.Raison and FactureLTD.NomPrenom and FactureLTD.TypePaiement and FactureLTD.Montant then
                        FactureLTD.HashID = math.random(10000, 99999)
                        TriggerServerEvent('InitialCore:GiveItem', GetPlayerServerId(PlayerId()), "facture", 1, FactureLTD)
                        FactureLTD.HashID = nil
                        FactureLTD.Raison = nil
                        FactureLTD.NomPrenom = nil
                        FactureLTD.TypePaiement = nil
                        FactureLTD.Montant = nil
                        RageUI.CloseAll()
                    else
                        AdvancedNotif('LTD', 'Facture', 'Vous devez remplir tout les champs.', 'CHAR_WE', 'LTD')
                    end
                end
            end)

        end)

        RageUI.IsVisible(RMenu:Get('ltd', 'typepaiement'), true, true, true, function()
            RageUI.List("Type de paiement", ListTP, ListTPIndex or 1, nil, {}, true, function(Hovered, Active, Selected, Index)
                if ListTPIndex ~= Index then
                    ListTPIndex = Index
                    FactureLTD.TypePaiement = Index
                end
            end)
        end)

    end
end

Citizen.CreateThread(function()
    while true do
        Wait(1)

        RageUI.IsVisible(RMenu:Get('vestiaireltd', 'main'), true, true, true, function()
            RageUI.Button("Prendre son service", "Se mettre en service, vous receverez tous les appels.", {}, true, function(_, _, Selected)
                if Selected then
                    enService = true
                    AdvancedNotif("LTD", "Prise de service", "Vous êtes en service.", "CHAR_WE", "ltd")
                end
            end)
            RageUI.Button("Quitter son service", "Quitter son service, vous ne receverez pas les appels.", {}, true, function(_, _, Selected)
                if Selected then
                    enService = false
                    AdvancedNotif("LTD", "Fin de service", "Vous n'êtes plus en service.", "CHAR_WE", "ltd")
                end
            end)
        end)

        local plyCoords = GetEntityCoords(GetPlayerPed(-1))
        local dist = Vdist2(plyCoords.x, plyCoords.y, plyCoords.z, -707.52, -915.60, 19.21)

        if dist <= 500 then
            if dist <= 2.0 then
                HelpNotif("Appuyez sur ~INPUT_TALK~ pour appeler un employé.")
                if IsControlJustPressed(0, 51) then
                    PlaySoundFrontend(-1, "WAYPOINT_SET", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
                    TriggerServerEvent('InitialCore:NotifAppelLTD')
                    AdvancedNotif("LTD", "Appel", "Vous avez appelé un employé du LTD.", "CHAR_WE", "LTD")
                end
            end
        else
            Wait(7000)
        end

        for k in pairs(ZoneLTD) do
            local dist2 = Vdist2(plyCoords.x, plyCoords.y, plyCoords.z, ZoneLTD[k].x, ZoneLTD[k].y, ZoneLTD[k].z)
 
            if dist2 <= 500 then
                if dist2 <= 1.5 then
                    HelpNotif("Appuyez sur ~INPUT_TALK~ pour interagir.")
                    if IsControlJustPressed(1,51) then
                        if ZoneLTD[k].type == 'vestiaire' then
                            RageUI.Visible(RMenu:Get('vestiaireltd', 'main'), not RageUI.Visible(RMenu:Get('vestiaireltd', 'main')))
                        elseif ZoneLTD[k].type == 'coffre' then
                            TriggerEvent('InitialCore:OpenCoffreProperties', true, 'ltdCoffre')
                        end
                    end
                end
            else
                Wait(7500)
            end
        end
    end
end)

RegisterNetEvent('InitialCore:NotifAppelLTDC')
AddEventHandler('InitialCore:NotifAppelLTDC', function()
    if metier == 'ltd' and enService then
        AdvancedNotif("LTD", "Appel", "Un client a besoin d'un vendeur au LTD\n[~g~Y~w~] Accepter.", "CHAR_WE", "LTD")
        local Time = 10000
        while Time >= 0 do
            Citizen.Wait(1)
            Time = Time-1
            if IsControlJustPressed(0, 246) then
                AdvancedNotif("LTD", "Appel", "Vous avez accepté l'appel\nUn point GPS a été mis.", "CHAR_WE", "ltd")
                TriggerServerEvent('InitialCore:AppelAcceptedLtd')
                SetNewWaypoint(-708.29, -913.11)
                Time = 0
            end
        end
    end
end)

RegisterNetEvent('InitialCore:AppelAcceptedLTDC')
AddEventHandler('InitialCore:AppelAcceptedLTDC', function(NomJoueur)
    if metier == 'ltd' and enService then
        AdvancedNotif("LTD", "Appel", "~g~" .. NomJoueur .. "~w~ a accepté l'appel.", "CHAR_WE", "ltd")
    end
end)

Citizen.CreateThread(function()
    LTDBlip = AddBlipForCoord(-708.29, -913.11, 30.689)
    SetBlipSprite(LTDBlip, 59)
    SetBlipDisplay(LTDBlip, 4)
    SetBlipScale(LTDBlip, 0.75)
    SetBlipColour(LTDBlip, 1)
    SetBlipAsShortRange(LTDBlip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("LTD")
    EndTextCommandSetBlipName(LTDBlip)
end)

RegisterCommand('+f6ltd', function()
	if not isMenuOpened then
        isMenuOpened = true
        RageUI.Visible(RMenu:Get('ltd', 'f6'), not RageUI.Visible(RMenu:Get('ltd', 'f6')))
        OpenLTDMenu()
	end
end, false)

RegisterCommand('-f6ltd', function()

end, false)

RegisterKeyMapping('+f6ltd', 'Menu metier LTD', 'keyboard', 'F6')