------------------------------------------------------------------------------
--
-- Ce travail est sous liscence:
-- Creative Commons Attribution-NonCommercial-NoDerivatives-NoDistribution 4.0 International License.
--
------------------------------------------------------------------------------

RMenu.Add('agentimmobilier', 'creator', RageUI.CreateMenu("Agent immobilier", "~b~CREATION D'APPARTEMENT/MAISON"))
RMenu.Add('agentimmobilier', 'appartementcreator', RageUI.CreateSubMenu(RMenu:Get('agentimmobilier', 'creator'), "Agent immobilier", "~b~CREATION D'APPARTEMENT/MAISON"))
RMenu.Add('propriete', 'infomaison', RageUI.CreateMenu("Propriété", "~b~INFORMATION"))
RMenu.Add('propriete', 'infoappartement', RageUI.CreateMenu("Propriété", "~b~INFORMATION"))
RMenu.Add('propriete', 'infoappartementselected', RageUI.CreateSubMenu(RMenu:Get('propriete', 'infoappartement'), "Propriété", "~b~INFORMATION"))

local Batiments = {}

RegisterCommand('+openimmo', function()
    --RageUI.Visible(RMenu:Get('agentimmobilier', 'creator'), true)
    --OpenMenuCreator()
end, false)
RegisterCommand('-openimmo', function()    
	
end, false)
RegisterKeyMapping('+openimmo', 'Menu Immo', 'keyboard', '3')

local self = {
    Entree = false,
    IndexPropriete = 1,
    Interieur = {"apa_v_mp_h_01_a", "apa_v_mp_h_01_c", "Low End Apartment"},
    CoordsInt = {[1] = {x = -786.8663, y = 315.7642, z = 217.6385}, [2] = {x = -786.9563, y = 315.6229, z = 187.9136}, [3] = {x = 261.4586, y = -998.8196, z = -99.00863}},
    CoordsPrev = {[1] = {x = -790.027, y = 324.839, z = 217.6385, h = 330.0}, [2] = {x = -790.027, y = 324.839, z = 187.9136, h = 330.0}, [3] = {x = 265.838, y = -1000.654, z = -98.508, h = 50.0}},
    IsCameraIntActive = false,
    Cam = nil,
    LastPos = false,
    TypePropriete = {"Maison", "Appartement"},
    TypeProprieteSelected = 1,
    PrixAchat = false,
    PrixLocation = false,
    AppartementEdit = {"Appartement n°1", "Appartement n°2", "Appartement n°3", "Appartement n°4", "Appartement n°5", "Appartement n°6", "Appartement n°7", "Appartement n°8", "Appartement n°9", "Appartement n°10"},
    AppartementEditSelected = 1,

    SelectedInteriorApt = {1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
    InteriorApt = {false, false, false, false, false, false, false, false, false, false},
    InteriorAptCoords = {false, false, false, false, false, false, false, false, false, false},
    PrixAchatApt = {false, false, false, false, false, false, false, false, false, false},
    PrixLocationApt = {false, false, false, false, false, false, false, false, false, false}
}

local MenuCreatorOpen = false

function OpenMenuCreator()
    MenuCreatorOpen = true
    while MenuCreatorOpen do
        Wait(1)
        if not RageUI.Visible(RMenu:Get('agentimmobilier', 'creator')) and not RageUI.Visible(RMenu:Get('agentimmobilier', 'appartementcreator')) then
			MenuCreatorOpen = false
		end
        RageUI.IsVisible(RMenu:Get('agentimmobilier', 'creator'), true, true, true, function()
            RageUI.List("Type", self.TypePropriete, self.TypeProprieteSelected, "Choisisez le type de propriété.", {}, true, function(Hovered, Active, Selected, Index)
                if Index ~= self.TypeProprieteSelected then
                    self.TypeProprieteSelected = Index
                end
            end)
            if self.Entree then
                --print(self.Entree.x)
                DrawMarker(27, self.Entree.x, self.Entree.y, self.Entree.z-0.98, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 0, 0, 255, 150)
                RageUI.Button("Placer le point d'entrée", "Placer le point d'entrée de la propriété.", { RightBadge = RageUI.BadgeStyle.Tick }, true, function(Hovered, Active, Selected)
                    if Selected then
                        local x,y,z = table.unpack(GetEntityCoords(GetPlayerPed(-1)))
                        self.Entree = {x = x, y = y, z = z}
                    end
                end)          
            else
                RageUI.Button("Placer le point d'entrée", "Placer le point d'entrée de la propriété.", { RightLabel = ">" }, true, function(Hovered, Active, Selected)
                    if Selected then
                        local x,y,z = table.unpack(GetEntityCoords(GetPlayerPed(-1)))
                        self.Entree = {x = x, y = y, z = z}
                    end
                end)
            end
            if self.TypeProprieteSelected == 1 then
                RageUI.List("Intérieur", self.Interieur, self.IndexPropriete, "Choisisez l'intérieur du batiment.", {}, true, function(Hovered, Active, Selected, Index)
                    if Index ~= self.IndexPropriete then
                        self.IndexPropriete = Index
                        SetEntityCoords(GetPlayerPed(-1), self.CoordsPrev[Index].x, self.CoordsPrev[Index].y, self.CoordsPrev[Index].z)
                        SetCamCoord(self.Cam, self.CoordsPrev[Index].x, self.CoordsPrev[Index].y, self.CoordsPrev[Index].z)
                        SetCamRot(self.Cam, 0.0, 0.0, self.CoordsPrev[Index].h)
                    end
                    if Active and not self.IsCameraIntActive then
                        DoScreenFadeOut(1000)
                        Wait(1000)
                        self.LastPos = GetEntityCoords(GetPlayerPed(-1))
                        SetEntityVisible(GetPlayerPed(-1), false, 0)
                        SetEntityCoords(GetPlayerPed(-1), self.CoordsPrev[Index].x, self.CoordsPrev[Index].y, self.CoordsPrev[Index].z)
                        self.IsCameraIntActive = true
                        self.Cam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", self.CoordsPrev[Index].x, self.CoordsPrev[Index].y, self.CoordsPrev[Index].z, 0.0, 0.0, self.CoordsPrev[Index].h, 90.00, false, 0)
                        SetCamActive(self.Cam, true)
                        RenderScriptCams(true, false, 1, true, true) 
                        DoScreenFadeIn(1000)
                    elseif not Active and self.IsCameraIntActive then
                        DoScreenFadeOut(1000)
                        Wait(1000)
                        SetEntityVisible(GetPlayerPed(-1), true, 0)
                        SetEntityCoords(GetPlayerPed(-1), self.LastPos)
                        self.IsCameraIntActive = false
                        RenderScriptCams(false, false, 1, true, true) 
                        SetCamActive(self.Cam, false)
                        DestroyCam(self.Cam)
                        self.Cam = nil
                        DoScreenFadeIn(1000)
                    end
                end)
                RageUI.Button("Prix d'achat", "Choisisez le prix d'achat de la propriété.", { RightLabel = self.PrixAchat or ">" }, true, function(Hovered, Active, Selected)
                    if Selected then
                        self.PrixAchat = KeyboardInput("", 10)
                    end
                end)      
                RageUI.Button("Prix de location", "Choisisez le prix de location à la semaine de la propriété.", { RightLabel = self.PrixLocation or ">" }, true, function(Hovered, Active, Selected)
                    if Selected then
                        self.PrixLocation = KeyboardInput("", 10)
                    end
                end)   
            else
                RageUI.Button("Gestion des appartements", "Gerez le prix ainsi que l'intérieur de chaque appartement.", { RightLabel = ">" }, true, function(Hovered, Active, Selected)
                end, RMenu:Get('agentimmobilier', 'appartementcreator'))     
            end
            RageUI.Button("Valider", "Valider & mettre en vente cette propriété.", {}, true, function(Hovered, Active, Selected)
                if Selected then
                    if self.TypePropriete[self.TypeProprieteSelected] == 'Maison' then
                        if self.Entree and self.Interieur and self.PrixAchat and self.PrixLocation then
                            TriggerServerEvent('InitialCore:SaveMaison', self.TypePropriete[self.TypeProprieteSelected], self.Interieur[self.IndexPropriete], self.Entree, self.CoordsInt[self.IndexPropriete], self.PrixAchat, self.PrixLocation)
                            RageUI.GoBack()
                            Wait(2000)
                            TriggerServerCallback("getProperty", function(Propertys, SteamID2)
                                Batiments = Propertys
                            end)
                        else
                            AdvancedNotif('Création de propriété.', '~r~Erreur.', 'Vous devez remplir tout les champs.', 'CHAR_WE', 'INITIALV')
                        end
                    elseif self.TypePropriete[self.TypeProprieteSelected] == 'Appartement' then
                        --if self.Entree and self.InteriorApt[1] and self.PrixAchatApt[1] and self.InteriorAptCoords[1] and self.PrixLocationApt[1] then
                            TriggerServerEvent('InitialCore:SaveMaison', self.TypePropriete[self.TypeProprieteSelected], json.encode(self.InteriorApt), self.Entree, json.encode(self.InteriorAptCoords), json.encode(self.PrixAchatApt), json.encode(self.PrixLocationApt), true)
                        --else
                            --AdvancedNotif('Création de propriété.', '~r~Erreur.', 'Vous devez remplir tout les champs.', 'CHAR_WE', 'INITIALV')
                        --end
                    end
                end
            end)    
        end)
        RageUI.IsVisible(RMenu:Get('agentimmobilier', 'appartementcreator'), true, true, true, function()
            RageUI.List("Appartement", self.AppartementEdit, self.AppartementEditSelected, "Choisisez le type de propriété.", {}, true, function(Hovered, Active, Selected, Index)
                if Index ~= self.AppartementEditSelected then
                    self.AppartementEditSelected = Index
                end
            end)
            RageUI.List("Intérieur", self.Interieur, self.SelectedInteriorApt[self.AppartementEditSelected], "Choisisez l'intérieur du batiment.", {}, true, function(Hovered, Active, Selected, Index)
                if Index ~= self.SelectedInteriorApt[self.AppartementEditSelected] then
                    self.SelectedInteriorApt[self.AppartementEditSelected] = Index
                    self.InteriorApt[self.AppartementEditSelected] = self.Interieur[self.SelectedInteriorApt[self.AppartementEditSelected]]
                    self.InteriorAptCoords[self.AppartementEditSelected] = self.CoordsInt[self.SelectedInteriorApt[self.AppartementEditSelected]]
                    SetEntityCoords(GetPlayerPed(-1), self.CoordsPrev[Index].x, self.CoordsPrev[Index].y, self.CoordsPrev[Index].z)
                    SetCamCoord(self.Cam, self.CoordsPrev[Index].x, self.CoordsPrev[Index].y, self.CoordsPrev[Index].z)
                    SetCamRot(self.Cam, 0.0, 0.0, self.CoordsPrev[Index].h)
                end
                if Active and not self.IsCameraIntActive then
                    DoScreenFadeOut(1000)
                    Wait(1000)
                    self.LastPos = GetEntityCoords(GetPlayerPed(-1))
                    SetEntityVisible(GetPlayerPed(-1), false, 0)
                    SetEntityCoords(GetPlayerPed(-1), self.CoordsPrev[Index].x, self.CoordsPrev[Index].y, self.CoordsPrev[Index].z)
                    self.IsCameraIntActive = true
                    self.Cam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", self.CoordsPrev[Index].x, self.CoordsPrev[Index].y, self.CoordsPrev[Index].z, 0.0, 0.0, self.CoordsPrev[Index].h, 90.00, false, 0)
                    SetCamActive(self.Cam, true)
                    RenderScriptCams(true, false, 1, true, true) 

                    self.InteriorApt[self.AppartementEditSelected] = self.Interieur[self.SelectedInteriorApt[self.AppartementEditSelected]]
                    self.InteriorAptCoords[self.AppartementEditSelected] = self.CoordsInt[self.SelectedInteriorApt[self.AppartementEditSelected]]
                    
                    DoScreenFadeIn(1000)
                elseif not Active and self.IsCameraIntActive then
                    DoScreenFadeOut(1000)
                    Wait(1000)
                    SetEntityVisible(GetPlayerPed(-1), true, 0)
                    SetEntityCoords(GetPlayerPed(-1), self.LastPos)
                    self.IsCameraIntActive = false
                    RenderScriptCams(false, false, 1, true, true) 
                    SetCamActive(self.Cam, false)
                    DestroyCam(self.Cam)
                    self.Cam = nil
                    DoScreenFadeIn(1000)
                end
            end)
            RageUI.Button("Prix d'achat", "Choisisez le prix d'achat de la propriété.", { RightLabel = self.PrixAchatApt[self.AppartementEditSelected] or ">" }, true, function(Hovered, Active, Selected)
                if Selected then
                    self.PrixAchatApt[self.AppartementEditSelected] = KeyboardInput("", 10)
                end
            end)      
            RageUI.Button("Prix de location", "Choisisez le prix de location à la semaine de la propriété.", { RightLabel = self.PrixLocationApt[self.AppartementEditSelected] or ">" }, true, function(Hovered, Active, Selected)
                if Selected then
                    self.PrixLocationApt[self.AppartementEditSelected] = KeyboardInput("", 10)
                end
            end)   
        end)
    end
end

-- ###################################################### PROPERTYSYS ######################################################

local self2 = {
    Entered = false,
    ID = false,
    Type = false,
    Status = false,
    CoordsVisite = false,
    PrixAchat = false,
    PrixLocation = false,
    NomRue = false,
    InfoAppart = false,
    InfoAppartIndex = false
}

local SteamID

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)
        TriggerServerCallback("getProperty", function(Propertys, SteamID2)
            SteamID = SteamID2
            Batiments = Propertys
            for i=1, #Batiments, 1 do
                if Batiments[i].Proprietaire == SteamID then
                    local Blip = AddBlipForCoord(Batiments[i].Entree.x, Batiments[i].Entree.y, Batiments[i].Entree.z)
                    SetBlipSprite(Blip, 40)
                    SetBlipDisplay(Blip, 4)
                    SetBlipScale(Blip, 0.7)
                    SetBlipColour(Blip, 18)
                    SetBlipAsShortRange(Blip, true)
                    BeginTextCommandSetBlipName("STRING")
                    AddTextComponentString("Propriété acquise")
                    EndTextCommandSetBlipName(Blip)
                end
            end
        end)
        break
    end
end)

local letSleep = 0

Citizen.CreateThread(function()
	while true do
		Wait(5)
		local coords = GetEntityCoords(PlayerPedId())
		if Batiments[1] ~= nil then
			for i=1, #Batiments, 1 do
				local BatimentsMarker = Batiments[i]
				--isInMarker = false

-- ###################################
				local distance = GetDistanceBetweenCoords(coords, BatimentsMarker.Entree.x, BatimentsMarker.Entree.y, BatimentsMarker.Entree.z, true)
                if distance < 50.0 then
				    letSleep = letSleep+1
                    DrawMarker(27, BatimentsMarker.Entree.x, BatimentsMarker.Entree.y, BatimentsMarker.Entree.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 0, 0, 255, 25, false, true, 2, false, nil, nil, false)
                
                    if distance < 1.0 then
                        if BatimentsMarker.Type == 'Maison' then
                            if SteamID == BatimentsMarker.Proprietaire then
                                HelpNotif("Appuyez sur ~INPUT_PICKUP~ pour entrer dans votre propriété.")
                                if IsControlJustPressed(1, 38) then
                                    self2.ID = BatimentsMarker.HashID
                                    CreateEnterPropperty(self2.ID, BatimentsMarker.Sortie)
                                end
                            else
                                HelpNotif("Appuyez sur ~INPUT_PICKUP~ pour voir les informations sur la propriété.")
                                if IsControlJustPressed(1, 38) then
                                    self2.ID = BatimentsMarker.HashID
                                    self2.CoordsVisite = BatimentsMarker.Sortie
                                    self2.NomRue = GetStreetNameFromHashKey(GetStreetNameAtCoord(coords.x, coords.y, coords.z))
                                    if BatimentsMarker.Proprietaire then
                                        self2.Status = "Vendu"
                                    else
                                        self2.Type = BatimentsMarker.Type
                                        self2.Status = "En vente"
                                        self2.PrixAchat = BatimentsMarker.PrixAchat
                                        self2.PrixLocation = BatimentsMarker.PrixLocation
                                    end
                                    RageUI.Visible(RMenu:Get('propriete', 'infomaison'), true)
                                    OpenMenuMaison()
                                end
                            end
                        elseif BatimentsMarker.Type == 'Appartement' then
                            HelpNotif("Appuyez sur ~INPUT_PICKUP~ pour voir les infos de l'appartement.")
                            if IsControlJustPressed(1, 38) then
                                self2.ID = BatimentsMarker.HashID
                                --    CreateEnterPropperty(self2.ID, BatimentsMarker.Sortie)
                                self2.NomRue = GetStreetNameFromHashKey(GetStreetNameAtCoord(coords.x, coords.y, coords.z))
                                self2.InfoAppart = BatimentsMarker
                                if not self2.InfoAppart.Decompiled then
                                    self2.InfoAppart.Decompiled = true
                                    self2.InfoAppart.Interieur = json.decode(self2.InfoAppart.Interieur)
                                    --print(self2.InfoAppart.Proprietaire)
                                    self2.InfoAppart.Proprietaire = json.decode(self2.InfoAppart.Proprietaire)
                                    --print(self2.InfoAppart.Sortie)
                                   -- self2.InfoAppart.Sortie = json.decode(self2.InfoAppart.Sortie)
                                    --print(self2.InfoAppart.Sortie)
                                    self2.InfoAppart.PrixAchat = json.decode(self2.InfoAppart.PrixAchat)
                                    self2.InfoAppart.PrixLocation = json.decode(self2.InfoAppart.PrixLocation)
                                end
                                RageUI.Visible(RMenu:Get('propriete', 'infoappartement'), true)
                            end
                        end
                    end
                end
-- ###################################
                if self2.Entered and self2.ID == BatimentsMarker.HashID then
                    local distance
                    if not self2.InfoAppartIndex then
                        distance = GetDistanceBetweenCoords(coords, BatimentsMarker.Sortie.x, BatimentsMarker.Sortie.y, BatimentsMarker.Sortie.z, true)
                    else
                        distance = GetDistanceBetweenCoords(coords, BatimentsMarker.Sortie[self2.InfoAppartIndex].x, BatimentsMarker.Sortie[self2.InfoAppartIndex].y, BatimentsMarker.Sortie[self2.InfoAppartIndex].z, true)
                    end
                    --print(distance)
                    if distance < 50.0 then
                        letSleep = letSleep+1
                        if distance < 1.0 then
                            HelpNotif("Appuyez sur ~INPUT_PICKUP~ pour sortir de la propriété.")
                            if IsControlJustPressed(1, 38) then
                                ExitProperty(BatimentsMarker.Entree)
                            end
                        end
                        if not self2.InfoAppartIndex then
                            DrawMarker(27, BatimentsMarker.Sortie.x, BatimentsMarker.Sortie.y, BatimentsMarker.Sortie.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 0, 0, 255, 25, false, true, 2, false, nil, nil, false)
                        else
                            DrawMarker(27, BatimentsMarker.Sortie[self2.InfoAppartIndex].x, BatimentsMarker.Sortie[self2.InfoAppartIndex].y, BatimentsMarker.Sortie[self2.InfoAppartIndex].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 0, 0, 255, 25, false, true, 2, false, nil, nil, false)
                        end
                    end
                end
-- ###################################
				--[[local distance = GetDistanceBetweenCoords(coords, BatimentsMarker.CoordsGes.x, BatimentsMarker.CoordsGes.y, BatimentsMarker.CoordsGes.z, true)

				if distance < 50.0 then
					--DrawMarker(20, BatimentsMarker.CoordsGes.x, BatimentsMarker.CoordsGes.y, BatimentsMarker.CoordsGes.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.MarkerSize.x, Config.MarkerSize.y, Config.MarkerSize.z, 0, 0, 255, 100, false, true, 2, false, nil, nil, false)
					letSleep = letSleep+1
				end

				if distance < 1.0 then
					isInMarker      = true
					currentProperty = BatimentsMarker.ID
					currentPart     = 'gestion'
					HelpNotif("Appuyez sur ~INPUT_PICKUP~ pour gérer votre propriété.")
				end]]
-- ###################################

				--[[if isInMarker then
					if IsControlJustPressed(1, 38) then
						if currentPart == 'gestion' then
							TriggerEvent('InitialProperties:OpenGestionMenu', currentProperty)
							break
						elseif currentPart == 'sonette' then
							PlaySoundFrontend(-1, "DOOR_BUZZ", "MP_PLAYER_APARTMENT", 0)
							TriggerServerEvent('InitialProperties:Sonnerie', currentProperty)
							AdvancedNotif('Initial V', '~r~Propriété', 'Vous venez de sonner à la porte d\'entrée.', 'CHAR_WE', 'INITIALV')
							break
						end
						DoScreenFadeOut(1000)
						Wait(1500)
						if currentPart == 'enter' then
							IsPlayerEntered = true
							HashIDEntered = currentProperty
							TriggerEvent('instance:create', 'propriete', currentProperty, {property = BatimentsMarker.Nom, owner = GetPlayerServerId(PlayerId())})
							if BatimentsMarker.Equipement == 'weed' then
								TriggerEvent('InitialCore:SpawnWeedPetitHangar')
							end
							SetEntityCoords(GetPlayerPed(-1), BatimentsMarker.Sortie.x, BatimentsMarker.Sortie.y, BatimentsMarker.Sortie.z)
						elseif currentPart == 'exit' then 
							IsPlayerEntered = false
							HashIDEntered = nil
							SetEntityCoords(GetPlayerPed(-1), BatimentsMarker.Entree.x, BatimentsMarker.Entree.y, BatimentsMarker.Entree.z)
						end
						Wait(1500)
						DoScreenFadeIn(1000)
					end
				end]]
                --print(letSleep)
                --print(letSleep)
            end
            if letSleep <= 0 then
                --print('sleep')
                Citizen.Wait(5000)
            end
            letSleep = 0
		end
	end
end)

function ExitProperty(Coords)
    DoScreenFadeOut(1000)
    Wait(1000)
    self2.ID = false
    self2.Status = false
    self2.CoordsVisite = false
    self2.Entered = false
    self2.PrixAchat = false
    self2.PrixLocation = false
    self2.NomRue = false
    self2.Type = false
    self2.InfoAppart = false
    self2.InfoAppartIndex = false
    TriggerEvent('instance:leave')
    SetEntityCoords(GetPlayerPed(-1), Coords.x, Coords.y, Coords.z)
    Wait(500)
    DoScreenFadeIn(1000)
end

TriggerEvent('instance:registerType', 'propriete')
RegisterNetEvent('instance:onCreate')
AddEventHandler('instance:onCreate', function(instance)
    if instance.type == 'propriete' then
        TriggerEvent('instance:enter', instance)
    end
end)

function CreateEnterPropperty(ID, Coords)
    DoScreenFadeOut(1000)
    Wait(1000)
    self2.Entered = true
    TriggerEvent('instance:create', 'propriete', ID, {property = ID, owner = GetPlayerServerId(PlayerId())})
    SetEntityCoords(GetPlayerPed(-1), Coords.x, Coords.y, Coords.z)
    Wait(500)
    DoScreenFadeIn(1000)
end

local MenuMaisonOpen = false

function OpenMenuMaison()
    MenuMaisonOpen = true
    while MenuMaisonOpen do
        Citizen.Wait(1)
        --[[
            RMenu.Add('agentimmobilier', 'creator', RageUI.CreateMenu("Agent immobilier", "~b~CREATION D'APPARTEMENT/MAISON"))
            RMenu.Add('agentimmobilier', 'appartementcreator', RageUI.CreateSubMenu(RMenu:Get('agentimmobilier', 'creator'), "Agent immobilier", "~b~CREATION D'APPARTEMENT/MAISON"))
            RMenu.Add('propriete', 'infomaison', RageUI.CreateMenu("Propriété", "~b~INFORMATION"))
            RMenu.Add('propriete', 'infoappartement', RageUI.CreateMenu("Propriété", "~b~INFORMATION"))
            RMenu.Add('propriete', 'infoappartementselected', RageUI.CreateSubMenu(RMenu:Get('propriete', 'infoappartement'), "Propriété", "~b~INFORMATION"))
        ]]
        if not RageUI.Visible(RMenu:Get('propriete', 'infomaison')) and not RageUI.Visible(RMenu:Get('propriete', 'infoappartement')) and not RageUI.Visible(RMenu:Get('propriete', 'infoappartementselected')) then
			MenuMaisonOpen = false
		end
        RageUI.IsVisible(RMenu:Get('propriete', 'infomaison'), true, true, true, function()
            RageUI.Separator("Nom de la rue : " .. self2.NomRue)
            if self2.Status == 'En vente' then
                RageUI.Button("Type de propriété : ", "DESC", { RightLabel = self2.Type }, true, function(Hovered, Active, Selected)
                end) 
            end
            RageUI.Button("Status de la propriété :", "DESC", { RightLabel = self2.Status }, true, function(Hovered, Active, Selected)
            end)   
            if self2.Status == 'En vente' then
                RageUI.Button("Prix d'achat de la propriété : ", "DESC", { RightLabel = self2.PrixAchat .. "$" }, true, function(Hovered, Active, Selected)
                end) 
                RageUI.Button("Prix de location de la propriété :", "DESC", { RightLabel = self2.PrixLocation .. "$/semaine" }, true, function(Hovered, Active, Selected)
                end)  
                RageUI.Button("Visiter la propriété", "DESC", { RightLabel = ">" }, true, function(Hovered, Active, Selected)
                    if Selected then
                        CreateEnterPropperty(math.random(1000000, 9000000), self2.CoordsVisite)
                    end
                end) 
            else
                RageUI.Button("Sonner à la propriété", "DESC", { RightLabel = ">" }, true, function(Hovered, Active, Selected)
                    if Selected then
                        PlaySoundFrontend(-1, "DOOR_BUZZ", "MP_PLAYER_APARTMENT", 0)
                        TriggerServerEvent('InitialProperties:Sonnerie', self2.ID)
                        AdvancedNotif('Initial V', '~r~Propriété', 'Vous venez de sonner à la porte d\'entrée.', 'CHAR_WE', 'INITIALV')
                    end
                end)  
            end
        end)

        RageUI.IsVisible(RMenu:Get('propriete', 'infoappartement'), true, true, true, function()
            RageUI.Separator("Nom de la rue : " .. self2.NomRue)
            for i = 1, #self2.InfoAppart.Interieur do
                --print(self2.InfoAppart.Sortie[1])
                if self2.InfoAppart.Sortie[i] then
                    RageUI.Button("Info sur l'appartement : ", "DESC", { RightLabel =  "n°" .. i }, true, function(Hovered, Active, Selected)
                        if Selected then
                            self2.InfoAppartIndex = i
                        end
                    end, RMenu:Get('propriete', 'infoappartementselected')) 
                end
            end
        end)

        RageUI.IsVisible(RMenu:Get('propriete', 'infoappartementselected'), true, true, true, function()    
            RageUI.Separator("Info sur l'appartement n°" .. self2.InfoAppartIndex)
            if self2.InfoAppart.Proprietaire[self2.InfoAppartIndex] == SteamID then
                RageUI.Button("Entrez dans la propriété", "DESC", { RightLabel = ">" }, true, function(Hovered, Active, Selected)
                    if Selected then
                        CreateEnterPropperty(self2.ID, self2.InfoAppart.Sortie[self2.InfoAppartIndex])
                    end
                end) 
            else
                RageUI.Button("Type de propriété : ", "DESC", { RightLabel = self2.InfoAppart.Type }, true, function(Hovered, Active, Selected)
                end) 
                if not self2.InfoAppart.Proprietaire[self2.InfoAppartIndex] then
                    RageUI.Button("Status de la propriété : ", "DESC", { RightLabel = "En vente" }, true, function(Hovered, Active, Selected)
                    end)
                    RageUI.Button("Prix d'achat de la propriété : ", "DESC", { RightLabel = self2.InfoAppart.PrixAchat[self2.InfoAppartIndex] .. "$" }, true, function(Hovered, Active, Selected)
                    end) 
                    RageUI.Button("Prix de location de la propriété :", "DESC", { RightLabel = self2.InfoAppart.PrixLocation[self2.InfoAppartIndex] .. "$/semaine" }, true, function(Hovered, Active, Selected)
                    end)  
                    RageUI.Button("Visiter la propriété", "DESC", { RightLabel = ">" }, true, function(Hovered, Active, Selected)
                        if Selected then
                            CreateEnterPropperty(math.random(1000000, 9000000), self2.InfoAppart.Sortie[self2.InfoAppartIndex])
                        end
                    end)
                else
                    RageUI.Button("Status de la propriété : ", "DESC", { RightLabel = "Vendu" }, true, function(Hovered, Active, Selected)
                    end) 
                    RageUI.Button("Sonner à la propriété", "DESC", { RightLabel = ">" }, true, function(Hovered, Active, Selected)
                        if Selected then
                            PlaySoundFrontend(-1, "DOOR_BUZZ", "MP_PLAYER_APARTMENT", 0)
                            TriggerServerEvent('InitialProperties:Sonnerie', self2.ID, self2.InfoAppart.Sortie[self2.InfoAppartIndex])
                            AdvancedNotif('Initial V', '~r~Propriété', 'Vous venez de sonner à la porte d\'entrée.', 'CHAR_WE', 'INITIALV')
                        end
                    end) 
                end

                --RageUI.Button("Entrez dans la propriété", "DESC", { RightLabel = ">" }, true, function(Hovered, Active, Selected)
                    --if Selected then
                        --self2.InfoAppartIndex = i
                    --end
                --end) 
            end
        end)
    end
end

RegisterNetEvent('InitialProperties:SonnerieC')
AddEventHandler('InitialProperties:SonnerieC', function(HashSonette, PlayerID, Coords)
	if self2.ID == HashSonette and self2.Entered then
		AdvancedNotif('Initial V', '~r~Propriété', 'Quelqu\'un sonne à votre porte, appuyez sur [E] pour ouvrir.', 'CHAR_WE', 'INITIALV')
		PlaySoundFrontend(-1, "DOOR_BUZZ", "MP_PLAYER_APARTMENT", 0)
		local Timer = 1000
		Citizen.CreateThread(function()
			while Timer >= 0 do
				Wait(1)
				Timer = Timer - 1
				if IsControlJustPressed(1, 38) then
					TriggerServerEvent('InitialProperties:AcceptSonette', 'propriete', GetPlayerServerId(PlayerId()), PlayerID, self2.ID, Coords)
				end
			end
		end)
	end
end)

RegisterNetEvent('InitialProperties:EnterApresSonetteC')
AddEventHandler('InitialProperties:EnterApresSonetteC', function(HashIDEnteredC, Coords)
	for i=1, #Batiments, 1 do
		local BatimentsMarkerC = Batiments[i]
        if	BatimentsMarkerC.HashID == HashIDEnteredC then
            DoScreenFadeOut(1000)
            Wait(1000)
            self2.Entered = true
            if not Coords then
                SetEntityCoords(GetPlayerPed(-1), BatimentsMarkerC.Sortie.x, BatimentsMarkerC.Sortie.y, BatimentsMarkerC.Sortie.z)
            else
                SetEntityCoords(GetPlayerPed(-1), Coords.x, Coords.y, Coords.z)
            end
            Wait(500)
            DoScreenFadeIn(1000)
		end
	end
end)