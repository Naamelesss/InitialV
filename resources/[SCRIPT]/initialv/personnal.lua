------------------------------------------------------------------------------
--
-- Ce travail est sous liscence:
-- Creative Commons Attribution-NonCommercial-NoDerivatives-NoDistribution 4.0 International License.
--
------------------------------------------------------------------------------

_menuPool = NativeUI.CreatePool()

--[[personalMenu = NativeUI.CreateMenu("","Menu personnel")
--invactMenu = NativeUI.CreateMenu("","Inventaire")
_menuPool:Add(personalMenu)
--_menuPool:Add(invactMenu)

Citizen.CreateThread(function()
	NetworkSetTalkerProximity(0.1)

    Wait(6000)
    
	NetworkSetTalkerProximity(8.0)
end)

local Pressed = nil

CinematicCamCommand = "CinematicCam"
CinematicCamMaxHeight = 0.4
CinematicCamBool = false

w = 0

function SubMenu(menu)

    local GestionArmeMenu = _menuPool:AddSubMenu(menu, "Gestion arme", "Ajouter/enlever des accessoires sur votre arme.")
    GestionArmeMenu.Item:RightLabel(">>>")
    local PortefeuilleMenu = _menuPool:AddSubMenu(menu, "Portefeuille", "Afficher votre portefeuille et les actions associés.")
    PortefeuilleMenu.Item:RightLabel(">>>")
    local MenuEmote = NativeUI.CreateItem("Ouvrir le menu animations", "Emotes, styles de marches, expressions faciales, actions, annuler emotes")
    MenuEmote:RightLabel(">>>")
    personalMenu:AddItem(MenuEmote)
    local MiscMenu = _menuPool:AddSubMenu(menu, "Autre", "Autres actions.")
    MiscMenu.Item:RightLabel(">>>")

    personalMenu.OnItemSelect = function(menu, item)
        if item == MenuEmote then
            _menuPool:CloseAllMenus()
            TriggerEvent('InitialCore:OpenEmoteMenu')
        end
    end

    local Unequipall = NativeUI.CreateItem("Enlever tout les accessoires", "Enlever tout les accessoires de votre arme")
    GestionArmeMenu.SubMenu:AddItem(Unequipall)
    local SavePlayer = NativeUI.CreateColouredItem("Sauvegarder votre personnage", "Sauvegarde votre personnage, à faire avant de se déconnecter", Colours.BlueLight, Colours.BlueDark)
    MiscMenu.SubMenu:AddItem(SavePlayer)
    local boostfpsforplayer = NativeUI.CreateItem("Boost de FPS et Debug perso", "Cet outil permet de booster légerment vos FPS ig et de vous débloquer si vous êtes coincé")
    MiscMenu.SubMenu:AddItem(boostfpsforplayer)
    local bandesnoirs = NativeUI.CreateItem("Mode cinématique", "Activer/Désactiver les bandes noires")
    MiscMenu.SubMenu:AddItem(bandesnoirs)
    local RecMenu = _menuPool:AddSubMenu(MiscMenu.SubMenu, "Options d'enregistrement", "Fonctionne avec Rockstar Editor")
    RecMenu.Item:RightLabel(">>>")
    local Record = NativeUI.CreateItem("Enregistrer", "Commencer l'enregistrement de votre jeux")
    local stoprecordsave = NativeUI.CreateItem("Arreter de filmer et enregistrer", "Arreter l'enregistrement et sauvegarder dans Rockstar Editor")
    local stoprecordanddontsave = NativeUI.CreateItem("Arreter de filmer et ne pas enregistrer", "Arreter de filmer et ne pas enregistrer dans Rockstar Editor")
    local leavesession = NativeUI.CreateItem("~r~Quitter la session pour ouvrir Rockstar Editor~w~", "Changement de session en solo pour pouvoir ouvrir vos clips dans ∑ Rockstar Editor")
    RecMenu.SubMenu:AddItem(Record)
    RecMenu.SubMenu:AddItem(stoprecordsave)
    RecMenu.SubMenu:AddItem(stoprecordanddontsave)
    RecMenu.SubMenu:AddItem(leavesession)

    GestionArmeMenu.SubMenu.OnItemSelect = function(menu, item)
        if item == Unequipall then
            print('aa')
        end
    end

    RecMenu.SubMenu.OnItemSelect = function(menu, item)
        if item == Record then
            StartRecording(1)
        elseif item == stoprecordsave then
            if IsRecording() then
                StopRecordingAndSaveClip()
            else
                AdvancedNotif('Initial V', '~r~Erreur enregistrement', '~r~Tu ne filmes pas !', 'CHAR_WE', 'INITIALV')
          end
        elseif item == stoprecordanddontsave then
            if IsRecording() then
            StopRecordingAndDiscardClip()
            AdvancedNotif('Initial V', '~r~Enregistrement', '~o~Clip supprimé', 'CHAR_WE', 'INITIALV')
            else
            AdvancedNotif('Initial V', '~r~Erreur enregistrement', '~r~Tu ne filmes pas !', 'CHAR_WE', 'INITIALV')
        end
        elseif item == leavesession then
            _menuPool:CloseAllMenus()
            PlaySoundFrontend(-1, "TIMER", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
            AdvancedNotif('Initial V', '~r~Session', 'Vous etes en train de quitter le serveur, vous pourrez entrer dans le~y~ ∑ Rockstar Editor.', 'CHAR_WE', 'INITIALV')
            Wait(3000)
            AdvancedNotif('Initial V', '~r~Serveur', 'Désactivation des ressources de ~r~InitialV', 'CHAR_WE', 'INITIALV')
            ClearAllHelpMessages()
            StopAllAlarms(true)
            Wait(2500)
            AdvancedNotif('Initial V', '~r~Session', 'Vous avez quitter la session. \nVous pouvez maintenant allez dans le ~y~∑ Rockstar Editor', 'CHAR_WE', 'INITIALV')
            NetworkSessionEnd(true, true)
        end
    end
    
    MiscMenu.SubMenu.OnItemSelect = function(menu, item)
        if item == SavePlayer then
            TriggerEvent('InitialCore:SavePlayer')
            AdvancedNotif('Menu personnel', '~r~Synchronisation', 'Synchronisation de votre personnage.', 'CHAR_WE', 'INITIALV')
        end
        if item == bandesnoirs then
            CinematicCamBool = not CinematicCamBool
            CinematicCamDisplay(CinematicCamBool)
        end
        if item == boostfpsforplayer then
            local ped = GetPlayerPed(-1)
            ClearAllBrokenGlass()
            ShowNotification("~g~Suppression de toutes les vitres cassées.")
            ClearAllHelpMessages()
            LeaderboardsReadClearAll()
            LeaderboardsClearCacheData()
            ShowNotification("~g~Leaderboard clear.")
            ClearBrief()
            ClearGpsFlags()
            ClearOverrideWeather()
            ClearPrints()
            ClearSmallPrints()
            ShowNotification("~g~Prints clear.")
            ClearDynamicPauseMenuErrorMessage()
            ClearFocus()
            ClearHdArea()
            ShowNotification("~g~Erreurs clear.")
            ClearPedSecondaryTask(ped)
            ClearPedTasksImmediately(ped)
            ClearAllPedProps(ped)       
            ShowNotification("~g~Personnage debug.")     
            end
        end




    --#####################################--
    --              DEV FUNC               --
    

    local DevMenu = _menuPool:AddSubMenu(menu, "Developpement Tools", "Developpement Tools.")
    DevMenu.Item:SetRightBadge(BadgeStyle.Lock)
    --DevMenu.Item:RightLabel(">>>")

    local CreateInstance = NativeUI.CreateItem("/// Créer une instance ///", "")
    DevMenu.SubMenu:AddItem(CreateInstance)
    local InviteInstance = NativeUI.CreateItem("/// Inviter dans une instance ///", "")
    DevMenu.SubMenu:AddItem(InviteInstance)
    local DeleteInstance = NativeUI.CreateItem("/// Supprimer l'instance ///", "")
    DevMenu.SubMenu:AddItem(DeleteInstance)
    local Noclip = NativeUI.CreateItem("// Noclip //", "")
    DevMenu.SubMenu:AddItem(Noclip)
    local GodMode = NativeUI.CreateItem("// GodMode //", "")
    DevMenu.SubMenu:AddItem(GodMode)
    local SpawnObject = NativeUI.CreateItem("/// SpawnObject ///", "")
    DevMenu.SubMenu:AddItem(SpawnObject)
    local DelObject = NativeUI.CreateItem("/// DelObject ///", "")
    DevMenu.SubMenu:AddItem(DelObject)
    local Coords = NativeUI.CreateItem("/// Afficher les coordonées ///", "")
    DevMenu.SubMenu:AddItem(Coords)
    local endclock = NativeUI.CreateItem("/// Freeze le temps ///", "")
    DevMenu.SubMenu:AddItem(endclock)
    local boostfps = NativeUI.CreateItem("Boost FPS", "")
    DevMenu.SubMenu:AddItem(boostfps)
    local radar = NativeUI.CreateItem("// Radar On/Off //", "")
    DevMenu.SubMenu:AddItem(radar)
    local tpm = NativeUI.CreateItem("// TPM //", "")
    DevMenu.SubMenu:AddItem(tpm)


    TriggerEvent('instance:registerType', 'hangar')

    RegisterNetEvent('instance:onCreate')
    AddEventHandler('instance:onCreate', function(instance)
        if instance.type == 'hangar' then
            TriggerEvent('instance:enter', instance)
        end
    end)


    DevMenu.SubMenu.OnItemSelect = function(menu, item)
        if item == CreateInstance then
            --[[exports['screenshot-basic']:requestScreenshot(function(data)
                print(data)
                local resp = json.decode(data)
                print(resp.files[1].url)
                TriggerEvent('chat:addMessage', { template = '<img src="{0}" style="max-width: 300px;" />', args = { data } })
            end)]]

            --exports['screenshot-basic']:requestScreenshotUpload('http://ns3151533.ip-54-37-244.eu/InitialCore/screenshot-modul/up.php', 'files', function(data)
            --    local resp = json.decode(data)
            --    print(resp)
            --    TriggerEvent('chat:addMessage', { template = '<img src="{0}" style="max-width: 300px;" />', args = { resp.files[1].url } })
            --end)

            --TriggerEvent('instance:registerType')

            --TriggerEvent('instance:create', 'garage', 1)
            -----------------TriggerEvent('instance:create', 'hangar', 2, {property = 'Hangar', owner = GetPlayerServerId(PlayerId())})

            --TriggerEvent('instance:create', 'property', {property = 'enter', host = 'steam:1100001085fe617'})

  --[[          test, test2 = GetClosestPlayer()
            print(GetPlayerServerId(test))
            print(test2)
        end
        if item == InviteInstance then
            TriggerEvent('instance:invite', 'hangar', 6)
        end
        if item == DeleteInstance then
            --TriggerEvent('instance:leave')

            TriggerEvent('instance:close')

        end
        if item == SpawnObject then
            print('spawnobjectlog')
                    coords = GetEntityCoords(GetPlayerPed(-1), true)
                    print(coords.x)
                    print(coords.y)
                    print(coords.z)
                    
            -- bkr_prop_weed_01_small_01c
            -- bkr_prop_weed_01_small_01a
            -- bkr_prop_weed_01_small_01b


                    hash = GetHashKey("prop_pallet_01a")
                    hash2 = GetHashKey("bkr_prop_weed_med_01a")
                    hash3 = GetHashKey("bkr_prop_weed_table_01a")

                    RequestModel(hash)
                    RequestModel(hash2)
                    while (not HasModelLoaded(hash)) and (not HasModelLoaded(hash2)) and (not HasModelLoaded(hash3)) do
                       Wait(10)
                    end
            
                    object = CreateObject(hash, 1088.75, -3096.5, -37.965, false, false, true)
                    object = CreateObject(hash, 1091.32, -3096.5, -37.965, false, false, true)
                    object = CreateObject(hash, 1095.05, -3096.5, -37.965, false, false, true)
                    object = CreateObject(hash, 1097.6, -3096.5, -37.965, false, false, true)
                    object = CreateObject(hash, 1101.30, -3096.5, -37.965, false, false, true)
                    object = CreateObject(hash, 1103.85, -3096.5, -37.965, false, false, true)
                    
                    object = CreateObject(hash2, 1088.75, -3096.5, -37.965+0.25-2.5, false, false, true)
                    object = CreateObject(hash2, 1088.75-0.5, -3096.5+0.5, -37.965+0.25-2.5, false, false, true)
                    object = CreateObject(hash2, 1088.75+0.5, -3096.5+0.5, -37.965+0.25-2.5, false, false, true)
                    object = CreateObject(hash2, 1088.75-0.5, -3096.5-0.5, -37.965+0.25-2.5, false, false, true)
                    object = CreateObject(hash2, 1088.75+0.5, -3096.5-0.5, -37.965+0.25-2.5, false, false, true)
                    object = CreateObject(hash2, 1088.75, -3096.5, -37.965+0.25-2.3-2.5, false, false, true)
                    object = CreateObject(hash2, 1088.75-0.5, -3096.5+0.5, -37.965+0.25-2.3-2.5, false, false, true)
                    object = CreateObject(hash2, 1088.75+0.5, -3096.5+0.5, -37.965+0.25-2.3-2.5, false, false, true)
                    object = CreateObject(hash2, 1088.75-0.5, -3096.5-0.5, -37.965+0.25-2.3-2.5, false, false, true)
                    object = CreateObject(hash2, 1088.75+0.5, -3096.5-0.5, -37.965+0.25-2.3-2.5, false, false, true)

                    object = CreateObject(hash2, 1091.32, -3096.5, -37.965+0.25-2.5, false, false, true)
                    object = CreateObject(hash2, 1091.32-0.5, -3096.5+0.5, -37.965+0.25-2.5, false, false, true)
                    object = CreateObject(hash2, 1091.32+0.5, -3096.5+0.5, -37.965+0.25-2.5, false, false, true)
                    object = CreateObject(hash2, 1091.32-0.5, -3096.5-0.5, -37.965+0.25-2.5, false, false, true)
                    object = CreateObject(hash2, 1091.32+0.5, -3096.5-0.5, -37.965+0.25-2.5, false, false, true)
                    object = CreateObject(hash2, 1091.32, -3096.5, -37.965+0.25-2.3-2.5, false, false, true)
                    object = CreateObject(hash2, 1091.32-0.5, -3096.5+0.5, -37.965+0.25-2.3-2.5, false, false, true)
                    object = CreateObject(hash2, 1091.32+0.5, -3096.5+0.5, -37.965+0.25-2.3-2.5, false, false, true)
                    object = CreateObject(hash2, 1091.32-0.5, -3096.5-0.5, -37.965+0.25-2.3-2.5, false, false, true)
                    object = CreateObject(hash2, 1091.32+0.5, -3096.5-0.5, -37.965+0.25-2.3-2.5, false, false, true)

                    object = CreateObject(hash2, 1095.05, -3096.5, -37.965+0.25-2.5, false, false, true)
                    object = CreateObject(hash2, 1095.05-0.5, -3096.5+0.5, -37.965+0.25-2.5, false, false, true)
                    object = CreateObject(hash2, 1095.05+0.5, -3096.5+0.5, -37.965+0.25-2.5, false, false, true)
                    object = CreateObject(hash2, 1095.05-0.5, -3096.5-0.5, -37.965+0.25-2.5, false, false, true)
                    object = CreateObject(hash2, 1095.05+0.5, -3096.5-0.5, -37.965+0.25-2.5, false, false, true)
                    object = CreateObject(hash2, 1095.05, -3096.5, -37.965+0.25-2.3-2.5, false, false, true)
                    object = CreateObject(hash2, 1095.05-0.5, -3096.5+0.5, -37.965+0.25-2.3-2.5, false, false, true)
                    object = CreateObject(hash2, 1095.05+0.5, -3096.5+0.5, -37.965+0.25-2.3-2.5, false, false, true)
                    object = CreateObject(hash2, 1095.05-0.5, -3096.5-0.5, -37.965+0.25-2.3-2.5, false, false, true)
                    object = CreateObject(hash2, 1095.05+0.5, -3096.5-0.5, -37.965+0.25-2.3-2.5, false, false, true)

                    object = CreateObject(hash2, 1097.6, -3096.5, -37.965+0.25-2.5, false, false, true)
                    object = CreateObject(hash2, 1097.6-0.5, -3096.5+0.5, -37.965+0.25-2.5, false, false, true)
                    object = CreateObject(hash2, 1097.6+0.5, -3096.5+0.5, -37.965+0.25-2.5, false, false, true)
                    object = CreateObject(hash2, 1097.6-0.5, -3096.5-0.5, -37.965+0.25-2.5, false, false, true)
                    object = CreateObject(hash2, 1097.6+0.5, -3096.5-0.5, -37.965+0.25-2.5, false, false, true)
                    object = CreateObject(hash2, 1097.6, -3096.5, -37.965+0.25-2.3-2.5, false, false, true)
                    object = CreateObject(hash2, 1097.6-0.5, -3096.5+0.5, -37.965+0.25-2.3-2.5, false, false, true)
                    object = CreateObject(hash2, 1097.6+0.5, -3096.5+0.5, -37.965+0.25-2.3-2.5, false, false, true)
                    object = CreateObject(hash2, 1097.6-0.5, -3096.5-0.5, -37.965+0.25-2.3-2.5, false, false, true)
                    object = CreateObject(hash2, 1097.6+0.5, -3096.5-0.5, -37.965+0.25-2.3-2.5, false, false, true)

                    object = CreateObject(hash2, 1101.30, -3096.5, -37.965+0.25-2.5, false, false, true)
                    object = CreateObject(hash2, 1101.30-0.5, -3096.5+0.5, -37.965+0.25-2.5, false, false, true)
                    object = CreateObject(hash2, 1101.30+0.5, -3096.5+0.5, -37.965+0.25-2.5, false, false, true)
                    object = CreateObject(hash2, 1101.30-0.5, -3096.5-0.5, -37.965+0.25-2.5, false, false, true)
                    object = CreateObject(hash2, 1101.30+0.5, -3096.5-0.5, -37.965+0.25-2.5, false, false, true)
                    object = CreateObject(hash2, 1101.30, -3096.5, -37.965+0.25-2.3-2.5, false, false, true)
                    object = CreateObject(hash2, 1101.30-0.5, -3096.5+0.5, -37.965+0.25-2.3-2.5, false, false, true)
                    object = CreateObject(hash2, 1101.30+0.5, -3096.5+0.5, -37.965+0.25-2.3-2.5, false, false, true)
                    object = CreateObject(hash2, 1101.30-0.5, -3096.5-0.5, -37.965+0.25-2.3-2.5, false, false, true)
                    object = CreateObject(hash2, 1101.30+0.5, -3096.5-0.5, -37.965+0.25-2.3-2.5, false, false, true)

                    object = CreateObject(hash2, 1103.85, -3096.5, -37.965+0.25-2.5, false, false, true)
                    object = CreateObject(hash2, 1103.85-0.5, -3096.5+0.5, -37.965+0.25-2.5, false, false, true)
                    object = CreateObject(hash2, 1103.85+0.5, -3096.5+0.5, -37.965+0.25-2.5, false, false, true)
                    object = CreateObject(hash2, 1103.85-0.5, -3096.5-0.5, -37.965+0.25-2.5, false, false, true)
                    object = CreateObject(hash2, 1103.85+0.5, -3096.5-0.5, -37.965+0.25-2.5, false, false, true)
                    object = CreateObject(hash2, 1103.85, -3096.5, -37.965+0.25-2.3-2.5, false, false, true)
                    object = CreateObject(hash2, 1103.85-0.5, -3096.5+0.5, -37.965+0.25-2.3-2.5, false, false, true)
                    object = CreateObject(hash2, 1103.85+0.5, -3096.5+0.5, -37.965+0.25-2.3-2.5, false, false, true)
                    object = CreateObject(hash2, 1103.85-0.5, -3096.5-0.5, -37.965+0.25-2.3-2.5, false, false, true)
                    object = CreateObject(hash2, 1103.85+0.5, -3096.5-0.5, -37.965+0.25-2.3-2.5, false, false, true)

                    object = CreateObject(hash3, 1097.25, -3103.13, -39.999, false, false, true)
                    object = CreateObject(hash3, 1097.25-2.17, -3103.13, -39.999, false, false, true)

                    object = CreateObject(hash3, 1091.56, -3103.13, -39.999, false, false, true)
                    object = CreateObject(hash3, 1091.56-2.17, -3103.13, -39.999, false, false, true)

                    --PlaceObjectOnGroundProperly(object) -- This function doesn't seem to work.
        end
        if item == DelObject then
            --DeleteObject(object)
            --ClearGpsMultiRoute()
            --StartGpsMultiRoute(6, false, true)
            --AddPointToGpsMultiRoute(-1000.0, 100.0, 1000.0)
            --AddPointToGpsMultiRoute(-2000.0, 100.0, 2000.0)
            --SetGpsMultiRouteRender(true)

            --SetNewWaypoint(100.0, 500.0)

            --BLIP_1 = AddBlipForCoord(1000.0,  0.00)
            --SetBlipSprite(BLIP_1, 50)
            --SetBlipRoute(BLIP_1,  true)
            ----SetBlipRouteColour(BLIP_1, 6)
            --SetNewWaypoint(BLIP_1, true)

            --RouteBlip = AddBlipForCoord(245.4, -68.471, 69.421)
            --SetBlipColour(RouteBlip, 6)
            --SetBlipRoute(RouteBlip, 1)
            --SetBlipRouteColour(RouteBlip, 6)
        end
        if item == tpm then
            local WaypointHandle = GetFirstBlipInfoId(8)
            if DoesBlipExist(WaypointHandle) then
                local waypointCoords = GetBlipInfoIdCoord(WaypointHandle)

                for height = 1, 1000 do
                    SetPedCoordsKeepVehicle(PlayerPedId(), waypointCoords["x"], waypointCoords["y"], height + 0.0)

                    local foundGround, zPos = GetGroundZFor_3dCoord(waypointCoords["x"], waypointCoords["y"], height + 0.0)

                    if foundGround then
                        SetPedCoordsKeepVehicle(PlayerPedId(), waypointCoords["x"], waypointCoords["y"], height + 0.0)

                        break
                    end
                    Citizen.Wait(15)
                end
            end
        end
        if item == Noclip then
            noclip = true
            while noclip do
                Wait(0)
                TriggerEvent("InitialCore:HelpNotif", "Appuyez sur ~INPUT_PICKUP~ pour enlever le noclip.")
                if IsControlJustPressed(0, 51) then
                    local ped = GetPlayerPed(-1)
                    noclip = false
                    SetEntityVelocity(ped, 1.0, 1.0, 1.0)
                end
            end
        end
        if item == radar then
                if IsRadarHidden() then
                DisplayRadar(true)
                 else 
                DisplayRadar(false)
               end
            end
        if item == endclock then
            PauseClock(true)
            TriggerEvent("InitialCore:HelpNotif", "Appuyez sur ~INPUT_PICKUP~ pour enlever la pause du temps.")
        if IsControlJustPressed(0, 51) then
            PauseClock(false)
          end
        end
        if item == GodMode then
            local ped = GetPlayerPed(-1)
            SetEntityInvincible(ped, true)
            ShowNotification("~g~Vous êtes invincible")
        end
        if item == boostfps then
            ClearAllBrokenGlass()
            ShowNotification("~g~Suppression de toutes les vitres cassées.")
            ClearAllHelpMessages()
            LeaderboardsReadClearAll()
            ShowNotification("~g~Leaderboard clear.")
            ClearBrief()
            ClearGpsFlags()
            ClearOverrideWeather()
            ClearPrints()
            ClearSmallPrints()
            ShowNotification("~g~Prints clear.")
            ClearDynamicPauseMenuErrorMessage()
            LeaderboardsClearCacheData()
            ClearFocus()
            ClearHdArea()
            ShowNotification("~g~Erreurs clear.")
        end
        if item == Coords then
                Pressed = true
                while Pressed do
                Citizen.Wait(0)
                local ped = GetPlayerPed(-1)
                local x,y,z = table.unpack(GetEntityCoords(ped))
                local h = GetEntityHeading(ped) 
                local r = GetEntityRotation(ped)
                DrawText3D(x+0.1,y,z+0.5,"~r~Coords:  ~w~"..x.." ~o~| ~w~" ..y.. " ~o~| ~w~"..z.. " ~o~| ~w~"..h, 0.4)
                print("Coords:  ^1X: "..x.." | ^3Y: " ..y.. " | ^4Z: "..z.. " | ^7H: "..h)
                HelpNotif("Appuyez sur ~INPUT_PICKUP~ pour enlever les coordonées.")
                if IsControlJustPressed(0, 51) then
                    Pressed = false
                end
            end
        end
    end
end
    
    

    --              DEV FUNC               --
    --#####################################--
 ]]
function DrawText3D(x, y, z, text, scale)
	local onScreen, _x, _y = World3dToScreen2d(x, y, z)
	local pX, pY, pZ = table.unpack(GetGameplayCamCoords())
 
	SetTextScale(scale, scale)
	SetTextFont(6)
	SetTextProportional(1)
	SetTextEntry("STRING")
	SetTextCentre(1)
	SetTextColour(255, 255, 255, 255)
 
	AddTextComponentString(text)
	DrawText(_x, _y)
end
--[[
Citizen.CreateThread(function()
    local noclip_speed = 0.5
	while true do
		Citizen.Wait(0)
		if noclip then
			local ped = GetPlayerPed(-1)
			local x,y,z = getPosition()
			local dx,dy,dz = getCamDirection()
			local speed = noclip_speed

			-- reset du velocity
			SetEntityVelocity(ped, 0.0001, 0.0001, 0.0001)

		-- aller vers le haut
		if IsControlPressed(0,32) then 
			x = x+speed*dx
			y = y+speed*dy
			z = z+speed*dz
		end

		-- aller vers le bas
		if IsControlPressed(0,269) then 
			x = x-speed*dx
			y = y-speed*dy
			z = z-speed*dz
		end

		SetEntityCoordsNoOffset(ped,x,y,z,true,true,true)
		end
	end
end)
function getPosition()
	local x,y,z = table.unpack(GetEntityCoords(GetPlayerPed(-1),true))
	return x,y,z
end
function getCamDirection()
	local heading = GetGameplayCamRelativeHeading()+GetEntityHeading(GetPlayerPed(-1))
	local pitch = GetGameplayCamRelativePitch()

	local x = -math.sin(heading*math.pi/180.0)
	local y = math.cos(heading*math.pi/180.0)
	local z = math.sin(pitch*math.pi/180.0)

	local len = math.sqrt(x*x+y*y+z*z)
	if len ~= 0 then
		x = x/len
		y = y/len
		z = z/len
	end

	return x,y,z
end

RegisterCommand('+personalmenu', function()
    -- test

    local test = RequestScaleformMovie('INSTRUCTIONAL_BUTTONS')
    while not HasScaleformMovieLoaded(test) do 
        Citizen.Wait(0) 
    end
    PushScaleformMovieFunction('SET_DATA_SLOT', 0)

    --PushScaleformMovieFunctionParameterString("test").
    PushScaleformMovieFunction(test, "SET_DATA_SLOT")
    PushScaleformMovieFunctionParameterInt(1)
	--PushScaleformMovieFunctionParameterBool(true)
	PopScaleformMovieFunctionVoid()




    personalMenu:Clear()
    SubMenu(personalMenu)
    _menuPool:RefreshIndex()
    --personalMenu:Visible(not personalMenu:Visible())
end, false)
RegisterCommand('-personalmenu', function()
end, false)

RegisterKeyMapping('+personalmenu', 'Ouvrir le menu personnel', 'keyboard', 'F5')

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        _menuPool:ProcessMenus()
        --_menuPool:ControlDisablingEnabled(false)
    end
end)

function ShowNotification(message, hudColorIndex)
    if hudColorIndex then ThefeedNextPostBackgroundColor(hudColorIndex) end
    SetNotificationTextEntry("STRING")
    AddTextComponentString(message)
    DrawNotification(true, false)
end


Citizen.CreateThread(function() -- [[Requests the minimap scaleform and actually calls the rect function allong with the hud components function.]]

   --[[ minimap = RequestScaleformMovie("minimap")

    if not HasScaleformMovieLoaded(minimap) then
        RequestScaleformMovie(minimap)
        while not HasScaleformMovieLoaded(minimap) do 
            Wait(1)
        end
    end

    while true do
        Citizen.Wait(1)
        if w > 0 then
            DrawRects()
        end
        if CinematicCamBool then
            DESTROYHudComponents()
        end
    end
end)

local function DESTROYHudComponents()
    for i = 0, 22, 1 do
        if IsHudComponentActive(i) then
            HideHudComponentThisFrame(i)
        end
    end
end

local function DrawRects() -- [[Draw the Black Rects]]
    --DrawRect(0.0, 0.0, 2.0, w, 0, 0, 0, 255)
    --DrawRect(0.0, 1.0, 2.0, w, 0, 0, 0, 255)
--end

--[[local function DisplayHealthArmour(int) -- [[Thanks to GlitchDetector for this function.]]
    --[[BeginScaleformMovieMethod(minimap, "SETUP_HEALTH_ARMOUR")
    ScaleformMovieMethodAddParamInt(int)
    EndScaleformMovieMethod()
end

local function CinematicCamDisplay(bool) -- [[Handles Displaying Radar, Body Armour and the rects themselves.]]
    --[[SetRadarBigmapEnabled(true, false)
    Wait(0)
    SetRadarBigmapEnabled(false, false)
    if bool then
        DisplayRadar(false)
        DisplayHealthArmour(3)
        for i = 0, CinematicCamMaxHeight, 0.01 do 
            Wait(10)
            w = i
        end
    else
        DisplayRadar(true)
        DisplayHealthArmour(0)
        for i = CinematicCamMaxHeight, 0, -0.01 do
            Wait(10)
            w = i
        end 
    end
end    
 ]]

RegisterCommand("kords", function()
        local Pressed = true
        while Pressed do
        Citizen.Wait(0)
        local ped = GetPlayerPed(-1)
        local x,y,z = table.unpack(GetEntityCoords(ped))
        local h = GetEntityHeading(ped) 
        local r = GetEntityRotation(ped)
        DrawText3D(x+0.1,y,z+0.5,"~r~Coords:  ~w~"..x.." ~o~| ~w~" ..y.. " ~o~| ~w~"..z.. " ~o~| ~w~"..h, 0.4)
        print("Coords:  ^1X: "..x.." | ^3Y: " ..y.. " | ^4Z: "..z.. " | ^7H: "..h)
        HelpNotif("Appuyez sur ~INPUT_PICKUP~ pour enlever les coordonées.")
        if IsControlJustPressed(0, 51) then
            Pressed = false
        end
    end
end)
--[[
RegisterCommand("tpm", function()    
    local WaypointHandle = GetFirstBlipInfoId(8)
    if DoesBlipExist(WaypointHandle) then
        local waypointCoords = GetBlipInfoIdCoord(WaypointHandle)

        for height = 1, 1000 do
            SetPedCoordsKeepVehicle(PlayerPedId(), waypointCoords["x"], waypointCoords["y"], height + 0.0)

            local foundGround, zPos = GetGroundZFor_3dCoord(waypointCoords["x"], waypointCoords["y"], height + 0.0)

            if foundGround then
                SetPedCoordsKeepVehicle(PlayerPedId(), waypointCoords["x"], waypointCoords["y"], height + 0.0)

                break
            end
            Citizen.Wait(15)
        end
    end
end)]]

local metier
local niveaumetier

RegisterNetEvent('InitialCore:LoadJob')
AddEventHandler('InitialCore:LoadJob', function(metier2, niveaumetier2)
    --print('LJ')
    metier = metier2
    niveaumetier = niveaumetier2
end)

RegisterCommand('+menumetier', function()
    openMenuMetier()
end, false)
RegisterCommand('-menumetier', function()
end, false)

RegisterKeyMapping('+menumetier', 'Ouvrir le menu métier', 'keyboard', 'F6')

function openMenuMetier()
    --print('"ad')
    print(metier)
    if metier == 'lsmc' then
        OpenMenuEMS(true)
    elseif metier == 'police' then
        --print("MP")
        --TriggerEvent('InitialCore:MenuPolice')
      --  MenuPolice("menupolice")
        RageUI.Visible(RMenu:Get('police', 'main'), true)
        PoliceMenu()
    elseif metier == 'concessionnaire' then
        OpenMenuConcess()
    --    print('MC')
    end
end

RMenu.Add('facture', 'main', RageUI.CreateMenu("Facture", "~b~PAIEMENT"))
RMenu.Add('facture', 'iban', RageUI.CreateSubMenu(RMenu:Get('facture', 'main'), "Facture", "~b~MOYEN DE PAIEMENT"))
RMenu.Add('facture', 'cb', RageUI.CreateSubMenu(RMenu:Get('facture', 'main'), "Facture", "~b~MOYEN DE PAIEMENT"))

local ListTP = {"Espèces", "Carte Banquaire", "Virement Banquaire"}
local dataCompteIBAN
local dataCOmteCB

local CodeCarte

local MenuFactureOpen = false

RegisterNetEvent('InitialCore:UseFacture')
AddEventHandler('InitialCore:UseFacture', function(data, item)
    print('0')
    if not MenuFactureOpen then
        print('1')
        MenuFactureOpen = true
        if not data.Paye then
            data.MoyenPaiement = nil
            CodeCarte = nil
        end
        if data.TypePaiement == 1 then
            data.MoyenPaiement = 'cash'
        end
        print('2')
        TriggerServerCallback('getCompteBanquaire', function(data2)
            dataCompteIBAN = data2
        end)
        TriggerServerCallback('getItem', function(dataitems)
            dataCOmteCB = dataitems
        end, "CarteCredit")
        print('3')
        RageUI.Visible(RMenu:Get('facture', 'main'), true)
        while MenuFactureOpen do
            Citizen.Wait(1)
            if not RageUI.Visible(RMenu:Get('facture', 'main')) and not RageUI.Visible(RMenu:Get('facture', 'iban')) and not RageUI.Visible(RMenu:Get('facture', 'cb')) then
                MenuFactureOpen = false
            end
            RageUI.IsVisible(RMenu:Get('facture', 'main'), true, true, true, function()
                RageUI.Button("Facture :", "DESC", { RightLabel = "#" .. data.HashID }, true, function(_,_,Selected)
                end)
                RageUI.Button("Entreprise :", "DESC", { RightLabel = data.Entreprise }, true, function(_,_,Selected)
                end)
                RageUI.Button("Raison :", "DESC", { RightLabel = data.Raison }, true, function(_,_,Selected)
                end)
                RageUI.Button("Nom + Prénom :", "DESC", { RightLabel = data.NomPrenom }, true, function(_,_,Selected)
                end)
                RageUI.Button("Montant :", "DESC", { RightLabel = data.Montant .. "$" }, true, function(_,_,Selected)
                end)
                RageUI.Button("Type de paiement :", "DESC", { RightLabel = ListTP[data.TypePaiement] }, true, function(_,_,Selected)
                end)

                if not data.Paye then
                    if data.TypePaiement == 2 then
                        RageUI.Button("Moyen de paiement :", "DESC", { RightLabel = data.MoyenPaiement }, true, function(_,_,Selected)
                        end, RMenu:Get('facture', 'cb'))
                        if data.MoyenPaiement then
                            RageUI.Button("Code de la carte :", "DESC", { RightLabel = CodeCarte or ">" }, true, function(_,_,Selected)
                                if Selected then
                                    CodeCarte = KeyboardInput("", 4)
                                    CodeCarte = tonumber(CodeCarte)
                                end
                            end)
                        end
                    elseif data.TypePaiement == 3 then
                        RageUI.Button("Moyen de paiement :", "DESC", { RightLabel = data.MoyenPaiement }, true, function(_,_,Selected)
                        end, RMenu:Get('facture', 'iban'))
                    end
                    RageUI.Button("Status : ", "DESC", { RightLabel = "En attente de paiement" }, true, function(_,_,Selected)
                    end)
                    RageUI.Button("Payer", "DESC", {}, true, function(_,_,Selected)
                        if Selected then
                            if data.MoyenPaiement then
                                if data.TypePaiement == 1 then
                                    TriggerServerCallback('getArgent', function(argent)
                                        if argent >= data.Montant then
                                            data.Paye = true
                                            TriggerServerEvent('InitialCore:GiveArgentBank', true, data.Entreprise, data.Montant)
                                            TriggerServerEvent('InitialCore:RemoveMoney', GetPlayerServerId(PlayerId()), data.Montant)
                                            TriggerServerEvent('InitialCore:ChangeData', item, data)
                                            MenuFactureOpen = false
                                            AdvancedNotif('Facture', 'Paiement', 'Paiement effectué.', 'CHAR_WE', 'INITIALV')
                                        end
                                    end)
                                elseif data.TypePaiement == 2 then
                                    TriggerServerCallback('validateFacture', function(isvalidate, raison)
                                        if isvalidate then
                                            --TriggerServerEvent("InitialCore:DeleteItemPlayer", GetPlayerServerId(PlayerId()), item, 1)
                                            data.Paye = true
                                            --TriggerServerEvent('InitialCore:GiveItem', GetPlayerServerId(PlayerId()), "facture", 1, data)
                                            TriggerServerEvent('InitialCore:ChangeData', item, data)
                                            MenuFactureOpen = false
                                            AdvancedNotif('Facture', 'Paiement', 'Paiement effectué.', 'CHAR_WE', 'INITIALV')
                                        else
                                            if raison == 1 then
                                                AdvancedNotif('Facture', 'Paiement', 'Paiement refusé (mauvais code).', 'CHAR_WE', 'INITIALV')
                                            elseif raison == 2 then
                                                AdvancedNotif('Facture', 'Paiement', 'Paiement refusé (dépenses max journalière atteint).', 'CHAR_WE', 'INITIALV')
                                            elseif raison == 3 then
                                                AdvancedNotif('Facture', 'Paiement', 'Paiement refusé (découvert max atteint).', 'CHAR_WE', 'INITIALV')
                                            end
                                        end
                                    end, data.TypePaiement, data.MoyenPaiement, data.Montant, data.Entreprise, CodeCarte)
                                elseif data.TypePaiement == 3 then
                                    TriggerServerCallback('validateFacture', function(isvalidate)
                                        if isvalidate then
                                            --TriggerServerEvent("InitialCore:DeleteItemPlayer", GetPlayerServerId(PlayerId()), item, 1)
                                            data.Paye = true
                                            --TriggerServerEvent('InitialCore:GiveItem', GetPlayerServerId(PlayerId()), "facture", 1, data)
                                            TriggerServerEvent('InitialCore:ChangeData', item, data)
                                            MenuFactureOpen = false
                                            AdvancedNotif('Facture', 'Paiement', 'Paiement effectué.', 'CHAR_WE', 'INITIALV')
                                        end
                                    end, data.TypePaiement, data.MoyenPaiement, data.Montant, data.Entreprise)
                                end
                            else
                                AdvancedNotif('Facture', 'Erreur', 'Vous devez choisir un moyen de paiement.', 'CHAR_WE', 'INITIALV')
                            end
                        end
                    end)
                else
                    if data.TypePaiement ~= 1 then
                        RageUI.Button("Moyen de paiement :", "DESC", { RightLabel = data.MoyenPaiement }, true, function(_,_,Selected)
                        end)
                    end
                    RageUI.Button("Status : ", "DESC", { RightLabel = "Payé" }, true, function(_,_,Selected)
                    end)
                end
            end)
            RageUI.IsVisible(RMenu:Get('facture', 'iban'), true, true, true, function()
                for k, v in pairs(dataCompteIBAN) do
                    RageUI.Button("Compte :", "DESC", { RightLabel = v.IBAN }, true, function(_,_,Selected)
                        if Selected then
                            data.MoyenPaiement = v.IBAN
                            RageUI.GoBack()
                        end
                    end)
                end
            end)
            RageUI.IsVisible(RMenu:Get('facture', 'cb'), true, true, true, function()
                for k, v in pairs(dataCOmteCB) do
                    RageUI.Button("Carte :", "DESC", { RightLabel = v.Data }, true, function(_,_,Selected)
                        if Selected then
                            data.MoyenPaiement = v.Data
                            RageUI.GoBack()
                        end
                    end)
                end
            end)
        end
    end
end)