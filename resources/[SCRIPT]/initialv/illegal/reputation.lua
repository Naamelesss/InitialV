------------------------------------------------------------------------------
--
-- Ce travail est sous liscence:
-- Creative Commons Attribution-NonCommercial-NoDerivatives-NoDistribution 4.0 International License.
--
------------------------------------------------------------------------------

local PosWidth = -1130.0
local PosHeight = -200.0

local SpriteIndex = {
    Items = {"cannabis", "cocaine", "meth", "heroine"},
    Labels = {"Cannabis", "Cocaïne", "Meth", "Heroine"},
    Index = 1,
    Sprites = {"mp_specitem_weed", "mp_specitem_coke", "mp_specitem_meth", "mp_specitem_heroin"},
    Count = 0,
    PrixDeVente = 10,
    PrixMoyen = {10, 80, 40, 40},
    AchatMoyen = 0,
    NombreDrogue = {0, 0, 0, 0},
    NiveauQuartie = 1,
    XPQuartie = 1
}
local MenuOpened = false
local Quartie
local isPressed = false
local pressedTime = 0
local inVente_ = false

RegisterCommand('+menurep', function()
    if not inVente_ then
        if not MenuOpened then
            local PlyPos = GetEntityCoords(PlayerPedId())
            Quartie = GetLabelText(GetNameOfZone(PlyPos.x, PlyPos.y, PlyPos.z))

            TriggerServerCallback("InitialCore:hasObject", function(hasObject, Nombre)
                if hasObject then
                    SpriteIndex.NombreDrogue[1] = Nombre
                else
                    SpriteIndex.NombreDrogue[1] = 0
                end
            end, 'cannabis')
            TriggerServerCallback("InitialCore:hasObject", function(hasObject, Nombre)
                if hasObject then
                    SpriteIndex.NombreDrogue[2] = Nombre
                else
                    SpriteIndex.NombreDrogue[2] = 0
                end
            end, 'cocaine')
            TriggerServerCallback("InitialCore:hasObject", function(hasObject, Nombre)
                if hasObject then
                    SpriteIndex.NombreDrogue[3] = Nombre
                else
                    SpriteIndex.NombreDrogue[3] = 0
                end
            end, 'meth')
            TriggerServerCallback("InitialCore:hasObject", function(hasObject, Nombre)
                if hasObject then
                    SpriteIndex.NombreDrogue[4] = Nombre
                else
                    SpriteIndex.NombreDrogue[4] = 0
                end
            end, 'heroine')

            TriggerServerCallback("getInfoQuartie", function(isQuartieLegal, XP)
                if isQuartieLegal then
                    SpriteIndex.XPQuartie = XP
                    if SpriteIndex.XPQuartie >= 1 and SpriteIndex.XPQuartie <= 9999 then
                        SpriteIndex.NiveauQuartie = 1
                    elseif SpriteIndex.XPQuartie >= 10000 and SpriteIndex.XPQuartie <= 19999 then
                        SpriteIndex.NiveauQuartie = 2
                    elseif SpriteIndex.XPQuartie >= 20000 and SpriteIndex.XPQuartie <= 29999 then
                        SpriteIndex.NiveauQuartie = 3
                    elseif SpriteIndex.XPQuartie >= 30000 and SpriteIndex.XPQuartie <= 39999 then
                        SpriteIndex.NiveauQuartie = 4
                    elseif SpriteIndex.XPQuartie >= 40000 and SpriteIndex.XPQuartie <= 49999 then
                        SpriteIndex.NiveauQuartie = 5
                    end
                    PlaySoundFrontend(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
                    MenuOpened = true
                    openMenuRep()
                else
                    AdvancedNotif('Gestion vente illégal.', '~r~Erreur.', 'Vous n\'êtes pas dans un quartier.', 'CHAR_WE', 'INITIALV')
                end
            end, Quartie)
        end
    else
        inVente_ = false
        AdvancedNotif('Gestion vente illégal.', '~r~Recherche de client.', 'Vous avez terminé la recherche de clients.', 'CHAR_WE', 'INITIALV')
    end
end, false)
RegisterCommand('-menurep', function()
end, false)

RegisterKeyMapping('+menurep', 'Rép', 'keyboard', 'F2')

function openMenuRep()
    while MenuOpened do
        Citizen.Wait(1)
        local aUp = 150
        local aDown = 150
        local aLeft = 150
        local aRight = 150

        RenderSprite("shared", "bggradient_16x512", 1200.0+PosWidth, 225+PosHeight, 370, 500, 255, 255, 255, 255)
        RenderRectangle(1200.0+PosWidth, 225+PosHeight, 370, 40,255,255,255,255)
        RenderText("GESTION VENTE",1385.0+PosWidth, 230+PosHeight,2,0.4,0,0,0,255, "Center")
        RenderSprite("mpinventory", SpriteIndex.Sprites[SpriteIndex.Index], 1230.0+PosWidth, 288.0+PosHeight, 90, 90, 0, 255, 255, 255, 255)
        RenderText(SpriteIndex.Labels[SpriteIndex.Index], 1330.0+PosWidth, 315+PosHeight, 1,0.6,255,255,255,255)
        if IsControlPressed(0, 172) then
            aUp = 255
        end
        if IsControlPressed(0, 173) then
            aDown = 255
        end
        if IsControlPressed(0, 174) then
            aLeft = 255
        end
        if IsControlPressed(0, 175) then
            aRight = 255
        end
        RenderSprite("basejumping", "arrow_pointer", 1520.0+PosWidth, 298+PosHeight, 40, 40, 0, 255, 255, 255, aUp)
        RenderSprite("basejumping", "arrow_pointer", 1520.0+PosWidth, 378+PosHeight, 40, -40, 0, 255, 255, 255, aDown)
        RenderSprite("commonmenu", "arrowleft", 1140.0+PosWidth, 463+PosHeight, 40, 40, 0, 255, 255, 255, aLeft)
        RenderSprite("commonmenu", "arrowright", 1590.0+PosWidth, 463+PosHeight, 40, 40, 0, 255, 255, 255, aRight)
        RenderText("Prix de vente", 1210.0+PosWidth, 470+PosHeight,0,0.28,255,255,255,255)
        RenderText("~g~$" .. SpriteIndex.PrixDeVente, 1565.0+PosWidth, 470+PosHeight,0,0.28,255,255,255,255,"Right")
        RenderText("Prix moyen sur le marché", 1210.0+PosWidth, 500+PosHeight,0,0.28,255,255,255,255)
        RenderText("~g~$" .. SpriteIndex.PrixMoyen[SpriteIndex.Index], 1565.0+PosWidth, 500+PosHeight,0,0.28,255,255,255,255,"Right")
        RenderText("Unité", 1210.0+PosWidth, 530+PosHeight,0,0.28,255,255,255,255)
        RenderText(SpriteIndex.NombreDrogue[SpriteIndex.Index], 1565.0+PosWidth, 530+PosHeight,0,0.28,255,255,255,255,"Right")
        RenderText("Gains", 1210.0+PosWidth, 560+PosHeight,0,0.28,255,255,255,255)
        RenderText("~g~" .. SpriteIndex.NombreDrogue[SpriteIndex.Index]*SpriteIndex.PrixDeVente .. "$", 1565.0+PosWidth, 560+PosHeight,0,0.28,255,255,255,255,"Right")
        RenderSprite("commonmenu", "shop_box_tick", 1340.0+PosWidth, 614+PosHeight, 80, 80, 0, 255, 255, 255, 255)

        RenderSprite("shared", "bggradient_16x512", 1200.0+PosWidth, 700+PosHeight, 370, 200, 255, 255, 255, 255)
        RenderRectangle(1200.0+PosWidth, 700+PosHeight, 370, 40,255,255,255,255)
        local PlyPos = GetEntityCoords(PlayerPedId())
        if GetLabelText(GetNameOfZone(PlyPos.x, PlyPos.y, PlyPos.z)) ~= Quartie then
            MenuOpened = false
            AdvancedNotif('Gestion vente illégal.', '~r~Erreur.', 'Vous vous êtes éloigné de la zone.', 'CHAR_WE', 'INITIALV')
        end
        RenderText("REPUTATION " .. Quartie, 1385.0+PosWidth, 705+PosHeight, 2,0.4,0,0,0,255, "Center")
        --print(GetLabelText(GetNameOfZone(PlyPos.x, PlyPos.y, PlyPos.z)))
        RenderSprite("timerbars", "damagebarfill_128", 1290.0+PosWidth, 800+PosHeight, 200, 20, 0, 255, 255, 255, 100)
        local Width = 1
        if SpriteIndex.XPQuartie >= 1 and SpriteIndex.XPQuartie <= 9999 then
            Width = SpriteIndex.XPQuartie*100/10000
        elseif SpriteIndex.XPQuartie >= 10000 and SpriteIndex.XPQuartie <= 19999 then
            Width = SpriteIndex.XPQuartie-10000
            Width = Width*100/10000
            Width = Width*2
        elseif SpriteIndex.XPQuartie >= 20000 and SpriteIndex.XPQuartie <= 29999 then
            Width = SpriteIndex.XPQuartie-20000
            Width = Width*100/10000
            Width = Width*2
            --Width = SpriteIndex.XPQuartie*100/30000
        elseif SpriteIndex.XPQuartie >= 30000 and SpriteIndex.XPQuartie <= 39999 then
            Width = SpriteIndex.XPQuartie-30000
            Width = Width*100/10000
            Width = Width*2
            --Width = SpriteIndex.XPQuartie*100/40000
        elseif SpriteIndex.XPQuartie >= 40000 and SpriteIndex.XPQuartie <= 49999 then
            Width = SpriteIndex.XPQuartie-40000
            Width = Width*100/10000
            Width = Width*2
            --Width = SpriteIndex.XPQuartie*100/50000
        end

        --print(Width)
        RenderSprite("timerbars", "damagebarfill_128", 1290.0+PosWidth, 800+PosHeight, Width, 20, 0, 255, 255, 255, 255)
        RenderSprite("mprankbadge", "globe", 1225.0+PosWidth, 780+PosHeight, 64, 64, 0, 200, 200, 200, 100)
        RenderText(SpriteIndex.NiveauQuartie, 1255.0+PosWidth, 787+PosHeight,0,0.60,255,255,255,255,"Center")
        RenderText("Prochain niveau ~g~".. SpriteIndex.XPQuartie .."~s~/~y~10000", 1385.0+PosWidth, 820+PosHeight,0,0.20,255,255,255,255, "Center")
        RenderSprite("mprankbadge", "globe", 1490.0+PosWidth, 780+PosHeight, 64, 64, 0, 200, 200, 200, 100)
        RenderText(SpriteIndex.NiveauQuartie+1, 1520.0+PosWidth, 787+PosHeight,0,0.60,255,255,255,255,"Center")

        MenuVenteControl()
    end
end

function MenuVenteControl()
    if IsControlPressed(0, 172) then
        if not isPressed then
            isPressed = true
            pressedTime = 10
            PlaySoundFrontend(-1, "NAV_LEFT_RIGHT", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
            SpriteIndex.Index = SpriteIndex.Index+1
            if SpriteIndex.Index == 5 then
                SpriteIndex.Index = 1
            end
            SpriteIndex.PrixDeVente = SpriteIndex.PrixMoyen[SpriteIndex.Index]
        end
    end
    if IsControlPressed(0, 173) then
        if not isPressed then
            isPressed = true
            pressedTime = 10
            PlaySoundFrontend(-1, "NAV_LEFT_RIGHT", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
            SpriteIndex.Index = SpriteIndex.Index-1
            if SpriteIndex.Index == 0 then
                SpriteIndex.Index = 4
            end
            SpriteIndex.PrixDeVente = SpriteIndex.PrixMoyen[SpriteIndex.Index]
        end
    end
    if IsControlPressed(0, 174) then
        if not isPressed then
            isPressed = true
            pressedTime = 10
            PlaySoundFrontend(-1, "NAV_LEFT_RIGHT", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
            SpriteIndex.PrixDeVente = SpriteIndex.PrixDeVente-1
        end
    end
    if IsControlPressed(0, 175) then
        if not isPressed then
            isPressed = true
            pressedTime = 10
            PlaySoundFrontend(-1, "NAV_LEFT_RIGHT", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
            SpriteIndex.PrixDeVente = SpriteIndex.PrixDeVente+1
        end
    end
    if IsControlPressed(0, 177) then
        MenuOpened = false
        PlaySoundFrontend(-1, "BACK", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
    end
    if IsControlPressed(0, 176) then
        if SpriteIndex.NombreDrogue[SpriteIndex.Index] >= 1 then
            MenuOpened = false
            PlaySoundFrontend(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
            AdvancedNotif('Gestion vente illégal.', '~r~Recherche de client.', 'Vous avez débuté la recherche de clients, pour terminer appuyez sur F2.', 'CHAR_WE', 'INITIALV')
            inVente_ = true
            inVente()
        else
            AdvancedNotif('Gestion vente illégal.', '~r~Erreur.', 'Vous n\'avez plus ce type de drogue.', 'CHAR_WE', 'INITIALV')
        end
    end
    if isPressed then
        pressedTime = pressedTime-1
        if pressedTime <= 0 then
            pressedTime = 0
            isPressed = false
        end
    end
end
local oldped = false
function inVente()
    while inVente_ do
        Citizen.Wait(1)
        playerPed = GetPlayerPed(-1)
        RenderText("Recherche de clients en cours", 960, 1020, 2, 0.5, 150,0,0,255, "Center")
        local PlyPos = GetEntityCoords(PlayerPedId())
        if GetLabelText(GetNameOfZone(PlyPos.x, PlyPos.y, PlyPos.z)) ~= Quartie then
            inVente_ = false
            AdvancedNotif('Gestion vente illégal.', '~r~Erreur.', 'Vous vous êtes éloigné de la zone.', 'CHAR_WE', 'INITIALV')
        end
        local handle, ped = FindFirstPed()
        repeat
            success, ped = FindNextPed(handle)
            local pos = GetEntityCoords(ped)
            local distance = Vdist2(pos.x, pos.y, pos.z, PlyPos.x, PlyPos.y, PlyPos.z)
            if not IsPedInAnyVehicle(playerPed) then
                if DoesEntityExist(ped) then
                    if not IsPedDeadOrDying(ped) then
                        if not IsPedInAnyVehicle(ped) then
                            local pedType = GetPedType(ped)
                            if pedType ~= 28 and not IsPedAPlayer(ped) then
                                currentped = pos
                                if distance <= 2 and ped ~= playerPed and ped ~= oldped then
                                    --DrawText3Ds(pos.x, pos.y, pos.z, GuTu.Text['press'])
                                    HelpNotif("Appuyez sur ~INPUT_PICKUP~ pour intéragir")
                                    if IsControlJustPressed(1, 38) then
                                        ToggleCancelEmote(false)
                                        ClearPedTasksImmediately(ped)
                                        ClearPedTasksImmediately(playerPed)

                                        --FreezeEntityPosition(ped, true)
                                        --FreezeEntityPosition(playerPed, true)

                                        oldped = ped

                                        local p1 = GetEntityCoords(playerPed, true)
                                        local p2 = GetEntityCoords(ped, true)

                                        local dx = p2.x - p1.x
                                        local dy = p2.y - p1.y

                                        local heading = GetHeadingFromVector_2d(dx, dy)
                                        SetEntityHeading(playerPed, heading)

                                        local p1 = GetEntityCoords(ped, true)
                                        local p2 = GetEntityCoords(playerPed, true)

                                        local dx = p2.x - p1.x
                                        local dy = p2.y - p1.y

                                        local heading = GetHeadingFromVector_2d(dx, dy)
                                        SetEntityHeading(ped, heading)

                                        --SetEntityHeading(ped, 180)
                                        local PlyPos = GetEntityCoords(PlayerPedId())
                                        local PedPos = GetEntityCoords(ped, true)
                                        TaskLookAtCoord(ped, PlyPos.x, PlyPos.y, PlyPos.z, -1, 2048, 3)
                                        TaskLookAtCoord(playerPed, PedPos.x, PedPos.y, PedPos.z, -1, 2048, 3)
                                        TaskStandStill(ped, 100.0)
                                        TaskStandStill(playerPed, 100.0)
                                        SetEntityAsMissionEntity(ped)
                                        
                                        -- ####################################################

                                        RequestAnimDict("facials@gen_male@variations@normal")
                                        RequestAnimDict("mp_facial")
                                        RequestAnimDict("mp_common")

                                        local timerConv = 100
                                        PlayFacialAnim(GetPlayerPed(-1), "mic_chatter", "mp_facial")
                                        while timerConv >= 0 do
                                            Citizen.Wait(1)
                                            timerConv = timerConv-1
                                            DrawText3D(PlyPos.x, PlyPos.y, PlyPos.z+1.2, "Yo mec, bien ou quoi?", 1.2, 6)
                                        end
                                        PlayFacialAnim(GetPlayerPed(-1), "mood_normal_1", "facials@gen_male@variations@normal")
                                        local PedPos = GetEntityCoords(ped)
                                        local timerConv = 100
                                        PlayFacialAnim(ped, "mic_chatter", "mp_facial")
                                        while timerConv >= 0 do
                                            Citizen.Wait(1)
                                            timerConv = timerConv-1
                                            DrawText3D(PedPos.x, PedPos.y, PedPos.z+1.2, "Tranquille, je peut t'aider?", 1.2, 6)
                                        end
                                        PlayFacialAnim(ped, "mood_normal_1", "facials@gen_male@variations@normal")
                                        local timerConv = 100
                                        PlayFacialAnim(GetPlayerPed(-1), "mic_chatter", "mp_facial")
                                        while timerConv >= 0 do
                                            Citizen.Wait(1)
                                            timerConv = timerConv-1
                                            DrawText3D(PlyPos.x, PlyPos.y, PlyPos.z+1.2, "Je vend de la cam a un bon prix si t'est inttereser", 1.2, 6)
                                        end
                                        PlayFacialAnim(GetPlayerPed(-1), "mood_normal_1", "facials@gen_male@variations@normal")
                                        local timerConv = 100
                                        PlayFacialAnim(ped, "mic_chatter", "mp_facial")
                                        while timerConv >= 0 do
                                            Citizen.Wait(1)
                                            timerConv = timerConv-1
                                            DrawText3D(PedPos.x, PedPos.y, PedPos.z+1.2, "Dit moi le prix", 1.2, 6)
                                        end
                                        PlayFacialAnim(ped, "mood_normal_1", "facials@gen_male@variations@normal")
                                        local timerConv = 100
                                        PlayFacialAnim(GetPlayerPed(-1), "mic_chatter", "mp_facial")
                                        while timerConv >= 0 do
                                            Citizen.Wait(1)
                                            timerConv = timerConv-1
                                            DrawText3D(PlyPos.x, PlyPos.y, PlyPos.z+1.2, "C'est " .. SpriteIndex.PrixDeVente .. "$ le gramme", 1.2, 6)
                                        end
                                        PlayFacialAnim(GetPlayerPed(-1), "mood_normal_1", "facials@gen_male@variations@normal")

                                        local chance1 = math.random(1, 12)
                                        local prixchance2 = SpriteIndex.PrixDeVente-SpriteIndex.PrixMoyen[SpriteIndex.Index]
                                        --print(prixchance2)
                                        local chance2 = math.random(1, 10)
                                        --print(chance2)
                                        --chance1 = 1
                                        if chance1 <= SpriteIndex.NiveauQuartie then
                                            if chance2 > prixchance2 then
                                                local nombre = 1
                                                TriggerServerCallback("InitialCore:hasObject", function(hasObject, Nombre)
                                                    if hasObject then
                                                        SpriteIndex.NombreDrogue[SpriteIndex.Index] = Nombre
                                                        if Nombre >= 4 then
                                                            local nombrechance = math.random(1, 11)
                                                            if nombrechance >= 7 then
                                                                nombre = 1
                                                            elseif nombrechance >= 4 then
                                                                nombre = 2
                                                            elseif nombrechance >= 2 then
                                                                nombre = 3
                                                            else
                                                                nombre = 4
                                                            end
                                                        else
                                                            nombre = 1
                                                        end
                                                    end
                                                end, SpriteIndex.Items[SpriteIndex.Index])
                                                local timerConv = 100
                                                PlayFacialAnim(ped, "mic_chatter", "mp_facial")
                                                while timerConv >= 0 do
                                                    Citizen.Wait(1)
                                                    timerConv = timerConv-1
                                                    DrawText3D(PedPos.x, PedPos.y, PedPos.z+1.2, "Ça me vas, je prend " .. nombre .. " gramme(s)", 1.2, 6)
                                                end
                                                PlayFacialAnim(ped, "mood_normal_1", "facials@gen_male@variations@normal")
                                                TaskPlayAnim(playerPed, "mp_common", "givetake1_a", 8.0, 8.0, -1)
                                                TaskPlayAnim(ped, "mp_common", "givetake1_a", 8.0, 8.0, -1)
                                                Wait(2000)
                                                TriggerServerEvent('InitialCore:DeleteItem', GetPlayerServerId(PlayerId()), SpriteIndex.Items[SpriteIndex.Index], nombre)
                                                TriggerServerEvent('InitialCore:GiveMoney', GetPlayerServerId(PlayerId()), SpriteIndex.PrixDeVente*nombre)
                                                TriggerServerCallback("changeRepQuartie", function(XP)

                                                    local calc = SpriteIndex.NiveauQuartie-1
                                                    CreateRankBar(calc*10000, SpriteIndex.NiveauQuartie*10000, SpriteIndex.XPQuartie, SpriteIndex.XPQuartie+130, SpriteIndex.NiveauQuartie, false)

                                                    --CreateRankBar(SpriteIndex.NiveauQuartie-1*10000, SpriteIndex.NiveauQuartie*10000, SpriteIndex.XPQuartie, SpriteIndex.XPQuartie+130, SpriteIndex.NiveauQuartie, false)
                                                end, Quartie, 130)
                                                Wait(500)
                                                if SpriteIndex.NombreDrogue[SpriteIndex.Index]-nombre <= 0 then
                                                    inVente_ = false
                                                    AdvancedNotif('Gestion vente illégal.', '~r~Erreur.', 'Vous n\'avez plus ce type de drogue sur vous, fin de la vente.', 'CHAR_WE', 'INITIALV')
                                                end
                                            else
                                                local timerConv = 100
                                                PlayFacialAnim(ped, "mic_chatter", "mp_facial")
                                                while timerConv >= 0 do
                                                    Citizen.Wait(1)
                                                    timerConv = timerConv-1
                                                    DrawText3D(PedPos.x, PedPos.y, PedPos.z+1.2, "C'est trop chèr, je vais me fournir ailleur", 1.2, 6)
                                                end
                                                PlayFacialAnim(ped, "mood_normal_1", "facials@gen_male@variations@normal")

                                                TriggerServerCallback("changeRepQuartie", function(XP)
                                                    --print(XP)
                                                    --CreateRankBar(SpriteIndex.XPQuartie, SpriteIndex.NiveauQuartie*10000, SpriteIndex.XPQuartie, SpriteIndex.XPQuartie-50.0, SpriteIndex.NiveauQuartie, true)
                                                    --CreateRankBar(150, 800, 175, 700, 5)

                                                    --[[local calc2 = SpriteIndex.NiveauQuartie*10000
                                                    local calc = SpriteIndex.XPQuartie*100
                                                    calc = calc/calc2
                                                    calc = calc+100

                                                    print(calc)]]

                                                    --[[local Width = 1
                                                    if SpriteIndex.XPQuartie >= 1 and SpriteIndex.XPQuartie <= 9999 then
                                                        Width = SpriteIndex.XPQuartie*100/10000
                                                    elseif SpriteIndex.XPQuartie >= 10000 and SpriteIndex.XPQuartie <= 19999 then
                                                        Width = SpriteIndex.XPQuartie-10000
                                                        Width = Width*100/10000
                                                        Width = Width*2
                                                    elseif SpriteIndex.XPQuartie >= 20000 and SpriteIndex.XPQuartie <= 29999 then
                                                        Width = SpriteIndex.XPQuartie-20000
                                                        Width = Width*100/10000
                                                        Width = Width*2
                                                        --Width = SpriteIndex.XPQuartie*100/30000
                                                    elseif SpriteIndex.XPQuartie >= 30000 and SpriteIndex.XPQuartie <= 39999 then
                                                        Width = SpriteIndex.XPQuartie-30000
                                                        Width = Width*100/10000
                                                        Width = Width*2
                                                        --Width = SpriteIndex.XPQuartie*100/40000
                                                    elseif SpriteIndex.XPQuartie >= 40000 and SpriteIndex.XPQuartie <= 49999 then
                                                        Width = SpriteIndex.XPQuartie-40000
                                                        Width = Width*100/10000
                                                        Width = Width*2
                                                        --Width = SpriteIndex.XPQuartie*100/50000
                                                    end]]

                                                    local calc = SpriteIndex.NiveauQuartie-1
                                                    CreateRankBar(calc*10000, SpriteIndex.NiveauQuartie*10000, SpriteIndex.XPQuartie, SpriteIndex.XPQuartie-390, SpriteIndex.NiveauQuartie, true)
                                                    print('##############')
                                                    print(calc*10000)
                                                    print(SpriteIndex.NiveauQuartie*10000)
                                                    print(SpriteIndex.XPQuartie)
                                                    print(SpriteIndex.XPQuartie-390)
                                                    print('##############')

                                                    --CreateRankBar(10000, 20000, 15000, 17500, 5)
                                                end, Quartie, -390)
                                            end
                                        else
                                            local timerConv = 100
                                            PlayFacialAnim(ped, "mic_chatter", "mp_facial")
                                            while timerConv >= 0 do
                                                Citizen.Wait(1)
                                                timerConv = timerConv-1
                                                DrawText3D(PedPos.x, PedPos.y, PedPos.z+1.2, "J'ai pas confiance en toi", 1.2, 6)
                                            end
                                            PlayFacialAnim(ped, "mood_normal_1", "facials@gen_male@variations@normal")
                                        end

                                        -- ####################################################

                                        ClearPedTasksImmediately(ped)
                                        ClearPedTasksImmediately(playerPed)
                                        ToggleCancelEmote(true)
                                        SetPedAsNoLongerNeeded(oldped)
                                    end
                                end
                            end
                        end
                    end
                end
            end
            
        until not success
        EndFindPed(handle)
    end
end

function CreateRankBar(XP_StartLimit_RankBar, XP_EndLimit_RankBar, playersPreviousXP, playersCurrentXP, CurrentPlayerLevel, TakingAwayXP)
	RankBarColor = 116
	if TakingAwayXP then
		RankBarColor = 6
	end
	

	if not HasHudScaleformLoaded(19) then
        RequestHudScaleform(19)
		while not HasHudScaleformLoaded(19) do
			Wait(1)
		end
    end

	BeginScaleformMovieMethodHudComponent(19, "SET_COLOUR")
	PushScaleformMovieFunctionParameterInt(RankBarColor)
    EndScaleformMovieMethodReturn()

    BeginScaleformMovieMethodHudComponent(19, "SET_RANK_SCORES")
    PushScaleformMovieFunctionParameterInt(XP_StartLimit_RankBar)
    PushScaleformMovieFunctionParameterInt(XP_EndLimit_RankBar)
    PushScaleformMovieFunctionParameterInt(playersPreviousXP)
    PushScaleformMovieFunctionParameterInt(playersCurrentXP)
    PushScaleformMovieFunctionParameterInt(CurrentPlayerLevel)
    PushScaleformMovieFunctionParameterInt(100)
	--PushScaleformMovieFunctionParameterInt(8)
    EndScaleformMovieMethodReturn()
end

--[[function inVente()
    while inVente_ do
        Citizen.Wait(1)
        RenderText("Recherche de clients en cours", 960, 1020, 2, 0.5, 150,0,0,255, "Center")
        local PlyPos = GetEntityCoords(PlayerPedId())
        if GetLabelText(GetNameOfZone(PlyPos.x, PlyPos.y, PlyPos.z)) ~= Quartie then
            inVente_ = false
            AdvancedNotif('Gestion vente illégal.', '~r~Erreur.', 'Vous vous êtes éloigné de la zone.', 'CHAR_WE', 'INITIALV')
        end
        local valid, ped = GetClosestPed(PlyPos.x, PlyPos.y, PlyPos.z, 2.5, 1, 0, 0, 0, 26)
        --print(valid)
        if valid then
            --TaskPlayAnim(id,"random@shop_gunstore","_greeting", 1.0, -1.0, 4000, 0, 1, true, true, true)
            HelpNotif("Appuyez sur AA~~ pour intéragir")
            if IsControlJustPressed(0, 38) then
                --ClearPedTasks(ped)
                --ClearPedSecondaryTask(ped)
                --TaskLookAtCoord(ped, PlyPos.x, PlyPos.y, PlyPos.z, -1, 2048, 3)
                --TaskLookAtCoord(GetPlayerPed(-1), PedPos.x, PedPos.y, PedPos.z, -1, 2048, 3)

               -- TaskGoToEntity(GetPlayerPed(-1), ped, 5000, 1.0, 100, 1073741824, 0)

                --Wait(250)

                local p1 = GetEntityCoords(GetPlayerPed(-1), true)
                local p2 = GetEntityCoords(ped, true)

                local dx = p2.x - p1.x
                local dy = p2.y - p1.y

                local heading = GetHeadingFromVector_2d(dx, dy)

                --SetPedDesiredHeading(GetPlayerPed(-1), GetHeadingFromVector_2d(PedPos.x, PedPos.y))
                SetPedDesiredHeading(GetPlayerPed(-1), heading)

                local p1 = GetEntityCoords(ped, true)
                local p2 = GetEntityCoords(GetPlayerPed(-1), true)

                local dx = p2.x - p1.x
                local dy = p2.y - p1.y

                local heading = GetHeadingFromVector_2d(dx, dy)

                SetPedDesiredHeading(ped, heading)
               -- print(GetHeadingFromVector_2d(PedPos.x, PedPos.y))

               --TaskLookAtCoord(ped, PlyPos.x, PlyPos.y, PlyPos.z, -1, 2048, 3)
               --TaskLookAtCoord(GetPlayerPed(-1), PedPos.x, PedPos.y, PedPos.z, -1, 2048, 3)

                TaskStandStill(ped, 100.0)
                TaskStandStill(GetPlayerPed(-1), 100.0)
                SetEntityAsMissionEntity(ped)

                --SetPedDesiredHeading(GetPlayerPed(-1), PlayerRotation)

                RequestAnimDict("facials@gen_male@variations@normal")
                RequestAnimDict("mp_facial")
                RequestAnimDict("mp_common")
               -- RequestAnimDict("special_ped@andy_moon@trevor_1@trevor_1a")

                Wait(500)

                local timerConv = 100
                PlayFacialAnim(GetPlayerPed(-1), "mic_chatter", "mp_facial")
                --TaskPlayAnim(GetPlayerPed(-1), "special_ped@andy_moon@trevor_1@trevor_1a", "andy_ig_4_imspeakingthetruth_0", 1.0, -1.0, 100, 0, 1, true, true, true)
                while timerConv >= 0 do
                    Citizen.Wait(1)
                    timerConv = timerConv-1
                    DrawText3D(PlyPos.x, PlyPos.y, PlyPos.z+0.9, "Yo mec, bien ou quoi?", 1.2, 1)
                end
                PlayFacialAnim(GetPlayerPed(-1), "mood_normal_1", "facials@gen_male@variations@normal")
                local PedPos = GetEntityCoords(ped)
                local timerConv = 100
                PlayFacialAnim(ped, "mic_chatter", "mp_facial")
                while timerConv >= 0 do
                    Citizen.Wait(1)
                    timerConv = timerConv-1
                    DrawText3D(PedPos.x, PedPos.y, PedPos.z+0.9, "Tranquille, je peut t'aider?", 1.2, 1)
                end
                PlayFacialAnim(ped, "mood_normal_1", "facials@gen_male@variations@normal")
                local timerConv = 100
                PlayFacialAnim(GetPlayerPed(-1), "mic_chatter", "mp_facial")
                while timerConv >= 0 do
                    Citizen.Wait(1)
                    timerConv = timerConv-1
                    DrawText3D(PlyPos.x, PlyPos.y, PlyPos.z+0.9, "Je vend de la cam a un bon prix si t'est inttereser", 1.2, 1)
                end
                PlayFacialAnim(GetPlayerPed(-1), "mood_normal_1", "facials@gen_male@variations@normal")
                local timerConv = 100
                PlayFacialAnim(ped, "mic_chatter", "mp_facial")
                while timerConv >= 0 do
                    Citizen.Wait(1)
                    timerConv = timerConv-1
                    DrawText3D(PedPos.x, PedPos.y, PedPos.z+0.9, "Dit moi le prix", 1.2, 1)
                end
                PlayFacialAnim(ped, "mood_normal_1", "facials@gen_male@variations@normal")
                local timerConv = 100
                PlayFacialAnim(GetPlayerPed(-1), "mic_chatter", "mp_facial")
                while timerConv >= 0 do
                    Citizen.Wait(1)
                    timerConv = timerConv-1
                    DrawText3D(PlyPos.x, PlyPos.y, PlyPos.z+0.9, "C'est " .. SpriteIndex.PrixDeVente .. "$ le gramme", 1.2, 1)
                end
                PlayFacialAnim(GetPlayerPed(-1), "mood_normal_1", "facials@gen_male@variations@normal")


                local chance1 = math.random(1, 12)
                print(chance1)
                chance1 = 1
                if chance1 <= SpriteIndex.NiveauQuartie then
                    local timerConv = 100
                    PlayFacialAnim(ped, "mic_chatter", "mp_facial")
                    while timerConv >= 0 do
                        Citizen.Wait(1)
                        timerConv = timerConv-1
                        DrawText3D(PedPos.x, PedPos.y, PedPos.z+0.9, "Ça me vas, envoie la cam", 1.2, 1)
                    end
                    PlayFacialAnim(ped, "mood_normal_1", "facials@gen_male@variations@normal")
                    TaskPlayAnim(GetPlayerPed(-1), "mp_common", "givetake1_a", 8.0, 8.0, -1)
                    TaskPlayAnim(ped, "mp_common", "givetake1_a", 8.0, 8.0, -1)
                else
                    local timerConv = 100
                    PlayFacialAnim(ped, "mic_chatter", "mp_facial")
                    while timerConv >= 0 do
                        Citizen.Wait(1)
                        timerConv = timerConv-1
                        DrawText3D(PedPos.x, PedPos.y, PedPos.z+0.9, "J'ai pas confiance en toi", 1.2, 1)
                    end
                    PlayFacialAnim(ped, "mood_normal_1", "facials@gen_male@variations@normal")
                end
                

                --Wait(250)

                

                --################### SetPedAsNoLongerNeeded(ped)




                --TaskLookAtEntity(ped, GetPlayerPed(-1), 100.0, 2048, 3)
                print(ped)
            end
        end
    end
end]]

function DrawText3D(x,y,z, text, scl, font) 

    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)
 
    local scale = (1/dist)*scl
    local fov = (1/GetGameplayCamFov())*100
    local scale = scale*fov
   
    if onScreen then
        SetTextScale(0.0*scale, 1.1*scale)
        SetTextFont(font)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 255)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x,_y)
    end
end