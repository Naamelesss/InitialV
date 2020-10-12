------------------------------------------------------------------------------
--
-- Ce travail est sous liscence:
-- Creative Commons Attribution-NonCommercial-NoDerivatives-NoDistribution 4.0 International License.
--
------------------------------------------------------------------------------

RMenu.Add('chimiste', 'main',  RageUI.CreateMenu('Chimiste', '~b~Bienvenue à l\'école de Chimiste'))
RMenu.Add('chimiste', 'question',  RageUI.CreateMenu('Chimiste', '~b~Question #1'))
RMenu.Add('chimiste', 'q',  RageUI.CreateMenu('Chimiste', '~b~Question #2'))
RMenu.Add('chimiste', 'q1', RageUI.CreateSubMenu(RMenu:Get('chimiste', 'q'), "Chimiste", "~b~Question #3"))
RMenu.Add('chimiste', 'q2', RageUI.CreateSubMenu(RMenu:Get('chimiste', 'q1'), "Chimiste", "~b~Question #4"))
RMenu.Add('chimiste', 'q3', RageUI.CreateSubMenu(RMenu:Get('chimiste', 'q2'), "Chimiste", "~b~Question #5"))
RMenu.Add('chimiste', 'q4', RageUI.CreateSubMenu(RMenu:Get('chimiste', 'q3'), "Chimiste", "~b~Question #6"))
RMenu.Add('chimiste', 'q5', RageUI.CreateSubMenu(RMenu:Get('chimiste', 'q4'), "Chimiste", "~b~Question #7"))

RMenu.Add('chimiste', 'gg', RageUI.CreateSubMenu(RMenu:Get('chimiste', 'q5'), "Chimiste", "~b~Résultats")) -- right label reponse/10


local isMenuChimisteOpened = false

local reponse = 0 

local isopen = false

function OpenChimisteMenu()
    while isMenuChimisteOpened do
        Wait(1)

        if not RageUI.Visible(RMenu:Get('chimiste', 'main')) and not RageUI.Visible(RMenu:Get('chimiste', 'question')) and not RageUI.Visible(RMenu:Get('chimiste', 'q')) and not RageUI.Visible(RMenu:Get('chimiste', 'q1')) and not RageUI.Visible(RMenu:Get('chimiste', 'q2')) and not RageUI.Visible(RMenu:Get('chimiste', 'q3')) and not RageUI.Visible(RMenu:Get('chimiste', 'q4')) and not RageUI.Visible(RMenu:Get('chimiste', 'q5')) and not RageUI.Visible(RMenu:Get('chimiste', 'q6')) and not RageUI.Visible(RMenu:Get('chimiste', 'q7')) and not RageUI.Visible(RMenu:Get('chimiste', 'q8')) and not RageUI.Visible(RMenu:Get('chimiste', 'gg')) then
            isMenuChimisteOpened = false
        end

        if RageUI.Visible(RMenu:Get('chimiste', 'main')) or RageUI.Visible(RMenu:Get('chimiste', 'question')) or RageUI.Visible(RMenu:Get('chimiste', 'q')) or RageUI.Visible(RMenu:Get('chimiste', 'q1')) or RageUI.Visible(RMenu:Get('chimiste', 'q2')) or RageUI.Visible(RMenu:Get('chimiste', 'q3')) or RageUI.Visible(RMenu:Get('chimiste', 'q4')) or RageUI.Visible(RMenu:Get('chimiste', 'q5')) or RageUI.Visible(RMenu:Get('chimiste', 'q6')) or RageUI.Visible(RMenu:Get('chimiste', 'q7')) or RageUI.Visible(RMenu:Get('chimiste', 'gg')) then
            if IsControlJustPressed(0, 177) then
                isMenuChimisteOpened = false
                RageUI.CloseAll()
            end
        end

        
		RageUI.IsVisible(RMenu:Get('chimiste', 'main'), true, true, true, function()
            RageUI.Button("Passer la license", "Passer la license de chimiste pour 10000$.", { RightLabel = "10000$" }, true, function(Hovered, Active, Selected)
            end, RMenu:Get('chimiste', 'question'))
        end)

        RageUI.IsVisible(RMenu:Get('chimiste', 'question'), true, true, true, function()
            RageUI.Separator("[ Comment s'appelle la plante de coca qui sert à soigner ? ]")
            RageUI.Button("Erythroxylum coca", nil, {}, true, function(_, _, Selected)
                if Selected then
                    reponse = reponse + 1
                end
            end, RMenu:Get('chimiste', 'q'))

            RageUI.Button("Coca alcaloïde", nil, {}, true, function(_, _, Selected)
            end, RMenu:Get('chimiste', 'q'))

        end)

        RageUI.IsVisible(RMenu:Get('chimiste', 'q'), true, true, true, function()
            RageUI.Separator("[ Est-t-il possible de mélanger de l'acide sulfurique dilué")
            RageUI.Separator("et du permanganate de potassium ? ]")
            RageUI.Button("Non", nil, {}, true, function(_, _, Selected)
            end, RMenu:Get('chimiste', 'q1'))

            RageUI.Button("Oui", nil, {}, true, function(_, _, Selected)
                if Selected then
                    reponse = reponse + 1
                end
            end, RMenu:Get('chimiste', 'q1'))
        end)

        RageUI.IsVisible(RMenu:Get('chimiste', 'q1'), true, true, true, function()

            RageUI.Separator("[ Quel est la masse molaire du Cinnamate de méthylecgonine ? ]")

            RageUI.Button("329,39 g/mol", nil, {}, true, function(_, _, Selected)
                if Selected then
                    reponse = reponse + 1
                end
            end, RMenu:Get('chimiste', 'q2'))

            RageUI.Button("594,20 g/mol", nil, {}, true, function(_, _, Selected)
            end, RMenu:Get('chimiste', 'q2'))

            RageUI.Button("102,34 g/mol", nil, {}, true, function(_, _, Selected)
            end, RMenu:Get('chimiste', 'q2'))

        end)

        RageUI.IsVisible(RMenu:Get('chimiste', 'q2'), true, true, true, function()

            RageUI.Separator("[ La benzocaïne est un ]")

            RageUI.Button("Anesthésique local", nil, {}, true, function(_, _, Selected)
                if Selected then
                    reponse = reponse + 1
                end
            end, RMenu:Get('chimiste', 'q3'))
            
            RageUI.Button("Groupe chimique", nil, {}, true, function(_, _, Selected)
            end, RMenu:Get('chimiste', 'q3'))

            RageUI.Button("Végétal", nil, {}, true, function(_, _, Selected)
            end, RMenu:Get('chimiste', 'q3'))

        end)

        RageUI.IsVisible(RMenu:Get('chimiste', 'q3'), true, true, true, function()

            RageUI.Separator("[ Qu'est ce qu'un alcaloïde ? ]")

            RageUI.Button("Une réaction chimique", nil, {}, true, function(_, _, Selected)
            end, RMenu:Get('chimiste', 'q4'))

            RageUI.Button("Une solution de chlorure", nil, {}, true, function(_, _, Selected)
            end, RMenu:Get('chimiste', 'q4'))

            RageUI.Button("Une molécule a base azoté", nil, {}, true, function(_, _, Selected)
                if Selected then
                    reponse = reponse + 1
                end
            end, RMenu:Get('chimiste', 'q4'))

        end)


        RageUI.IsVisible(RMenu:Get('chimiste', 'q4'), true, true, true, function()

            RageUI.Separator("[ Qu'elle est la formule de l'ammoniac ? ]")

            RageUI.Button("NH3", nil, {}, true, function(_, _, Selected)
                if Selected then
                    reponse = reponse + 1
                end
            end, RMenu:Get('chimiste', 'q5'))

            RageUI.Button("AM2", nil, {}, true, function(_, _, Selected)
            end, RMenu:Get('chimiste', 'q5'))

            RageUI.Button("C13H16", nil, {}, true, function(_, _, Selected)
            end, RMenu:Get('chimiste', 'q5'))

        end)

        RageUI.IsVisible(RMenu:Get('chimiste', 'q5'), true, true, true, function()
            
            RageUI.Separator("[ Est t-il possible de mélanger du césium et de l'eau ? ]")

            RageUI.Button("Oui", nil, {}, true, function(_, _, Selected)
            end, RMenu:Get('chimiste', 'gg'))

            RageUI.Button("Non", nil, {}, true, function(_, _, Selected)
                if Selected then
                    reponse = reponse + 1
                    print(reponse)
                end
            end, RMenu:Get('chimiste', 'gg'))

        end)

------------------------------------------------------------
        --c
        --
        --c
------------------------------------------------------------

        RageUI.IsVisible(RMenu:Get('chimiste', 'gg'), true, true, true, function()

            if reponse >= 6 then -- 7 q au total

                RageUI.Separator("[ Félicitations ]")

                RageUI.Button("Récuperer sa license de chimie", nil, { RightLabel = "Vos réponses " .. reponse .. "/7" }, true, function(_, _, Selected)
                    if Selected then
                        reponse = 0
                        TriggerServerEvent("InitialCore:GiveChimiste")
                        AdvancedNotif('Tony', '~r~Félicitations~w~', "Vous avez reçu votre license de chimie", 'CHAR_MOLLY', 'CHAR_MOLLY') -- ##
                        RageUI.CloseAll()
                    end
                end)

            else

                RageUI.Separator("[ Malheureusement ]")

                RageUI.Button("Vous avez raté le test", nil, {}, true, function(_, _, Selected)
                    if Selected then
                        reponse = 0
                        AdvancedNotif('Tony', '~r~Dommage~w~', "Repassez la prochaine fois !", 'CHAR_MOLLY', 'CHAR_MOLLY') -- ##
                        RageUI.CloseAll()
                    end
                end)

            end

        end)


    end
end


CreateThread(function()
	RequestModel(GetHashKey("cs_molly"))
	while not HasModelLoaded(GetHashKey("cs_molly")) do
		Wait(200)
	end

	local ped = CreatePed(5, GetHashKey("cs_molly"), -2222.316, 304.42, 183.60, 118.14, false, false)
	FreezeEntityPosition(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    

    local blipuni = AddBlipForCoord(-2222.316, 304.42, 183.60)
	SetBlipSprite (blipuni, 409)
	SetBlipDisplay(blipuni, 4)
    SetBlipScale  (blipuni, 0.7)
    SetBlipColour(blipuni, 69)
	SetBlipAsShortRange(blipuni, true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Université")
	EndTextCommandSetBlipName(blipuni)
end)


CreateThread(function()
    while true do
        Wait(1)

        local plyCoords = GetEntityCoords(PlayerPedId())
        local dist = Vdist2(plyCoords.x, plyCoords.y, plyCoords.z, -2222.155, 304.33, 184.60)

        if dist <= 500 then
            if dist <= 2.5 then
                HelpNotif("Appuyez sur ~INPUT_PICKUP~ pour passer la license de ~g~chimiste")
                if IsControlJustPressed(0, 51) then
                    isMenuChimisteOpened = true
                    RageUI.Visible(RMenu:Get('chimiste', 'main'), not RageUI.Visible(RMenu:Get('chimiste', 'main')))
                    OpenChimisteMenu()
                end
            end
        else
            Wait(7500)
        end
    end
end)
