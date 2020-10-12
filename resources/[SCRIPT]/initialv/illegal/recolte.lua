------------------------------------------------------------------------------
--
-- Ce travail est sous liscence:
-- Creative Commons Attribution-NonCommercial-NoDerivatives-NoDistribution 4.0 International License.
--
------------------------------------------------------------------------------

local Var = false
local VarTemp = 0
local InAnim = false

local CuveInfo

local TypeMenu

Citizen.CreateThread(function()
    while true do
        Wait(1)
        if IsControlJustPressed(0, 57) then
            local plyCoords = GetEntityCoords(GetPlayerPed(-1))
            TriggerServerEvent('alpha:setcoffre', plyCoords.x, plyCoords.y, plyCoords.z)
            print('ss')
        end -- ## DEV TOOLS
    end
    -- TEST
   --[[ while true do
        Wait(1)
        if IsControlJustPressed(1, 38) then
            animDict = 'anim@amb@business@weed@weed_inspecting_lo_med_hi@'
            animName = 'weed_spraybottle_crouch_spraying_02_inspector'
           --animDict = 'anim@amb@business@weed@weed_sorting_seated@'
           --animName = 'sorter_right_sort_v3_sorter02'
            while not HasAnimDictLoaded(animDict) do RequestAnimDict(animDict) Wait(100) end
            --TaskPlayAnim(animDict, animName, 8.0, 8.0, -1)
            TaskPlayAnim(GetPlayerPed(-1), animDict, animName, 1.0, 1.0, -1)
            print('end')
        end
    end]]

    -- TEST
    
    TriggerServerCallback('InitialCore:GetVar', function(Var2)
        Var = Var2

        --print(Var.xgGShs5641sq.x)
    end)

    while true do
        Wait(1)

        while not Var do
            Wait(500)
            --print('var')
        end
        local plyCoords = GetEntityCoords(GetPlayerPed(-1))
        for k, v in pairs(Var) do
            local dist = Vdist2(plyCoords.x, plyCoords.y, plyCoords.z, v.x, v.y, v.z)
            --print(dist)
            if dist <= 500 then
                --print(v.type)
                VarTemp = 1
                --print(dist)
                if dist <= v.r then
                  --  print('ok')
                    HelpNotif('Appuyez sur ~INPUT_PICKUP~ pour intéragir.')
                    if IsControlJustPressed(1, 38) then
                        if v.type == "feuilledecocaine" then
                            if not InAnim then
                                TriggerServerCallback('InitialCore:GetVarCanUse', function(CanUse)
                                    if CanUse then
                                        --[[while not HasAnimDictLoaded('mp_common') do
                                            RequestAnimDict("mp_common")
                                            Wait(100)
                                        end
                                        TaskPlayAnim(GetPlayerPed(-1), "mp_common", "givetake1_a", 8.0, 8.0, 4000)]]
                                        InAnim = true
                                        ToggleCancelEmote(false)
                                        TaskStartScenarioInPlace(GetPlayerPed(-1), 'PROP_HUMAN_PARKING_METER')
                                        Wait(10000)
                                        TriggerServerEvent('InitialCore:GiveItem', GetPlayerServerId(PlayerId()), v.type, 1, false)
                                        Wait(10000)
                                        ClearPedTasksImmediately(GetPlayerPed(-1))
                                        ToggleCancelEmote(true)
                                        InAnim = false
                                    else
                                        AdvancedNotif('Récolte.', '~r~Erreur.', 'Cette plante a déjà été récolté au maximum.', 'CHAR_WE', 'INITIALV')
                                    end
                                end, v.id)
                            else
                                AdvancedNotif('Récolte.', '~r~Erreur.', 'Vous récoltez déjà.', 'CHAR_WE', 'INITIALV')
                            end
                        elseif v.type == "plantedeweed" then
                            if not InAnim then
                                TriggerServerCallback('InitialCore:GetVarCanUse', function(CanUse)
                                    if CanUse then
                                        InAnim = true
                                        ToggleCancelEmote(false)
                                        --TaskStartScenarioInPlace(GetPlayerPed(-1), 'PROP_HUMAN_PARKING_METER')

                                        while not HasAnimDictLoaded('anim@amb@business@weed@weed_inspecting_lo_med_hi@') do RequestAnimDict("anim@amb@business@weed@weed_inspecting_lo_med_hi@") Wait(100) end
                                        TaskPlayAnim(GetPlayerPed(-1), 'anim@amb@business@weed@weed_inspecting_lo_med_hi@', 'weed_spraybottle_crouch_spraying_02_inspector', 1.0, 1.0, -1)

                                        Wait(10000)
                                        TriggerServerEvent('InitialCore:GiveItem', GetPlayerServerId(PlayerId()), "tetedeweed", 1, false)
                                        Wait(5500)
                                        ClearPedTasksImmediately(GetPlayerPed(-1))
                                        ToggleCancelEmote(true)
                                        InAnim = false
                                    else
                                        AdvancedNotif('Récolte.', '~r~Erreur.', 'Cette plante a déjà été récolté au maximum.', 'CHAR_WE', 'INITIALV')
                                    end
                                end, v.id)
                            else
                                AdvancedNotif('Récolte.', '~r~Erreur.', 'Vous récoltez déjà.', 'CHAR_WE', 'INITIALV')
                            end
                        elseif v.type == 'traitementweed' then
                            if not InAnim then
                                --TriggerServerCallback('InitialCore:GetVarCanUse', function(CanUse)
                                --    if CanUse then
                                        InAnim = true
                                        local props
                                        local props2
                                        ToggleCancelEmote(false)
                                        FreezeEntityPosition(GetPlayerPed(-1), true)
                                        SetEntityCollision(GetPlayerPed(-1), false, false)
                                        while not HasAnimDictLoaded('anim@amb@business@weed@weed_sorting_seated@') do RequestAnimDict("anim@amb@business@weed@weed_sorting_seated@") Wait(100) end
                                        local tprops1 = CreateObject(GetHashKey('bkr_prop_weed_bud_02b'), 1038.6, -3206.648, -38.28, true)
                                        SetEntityRotation(tprops1, 90.0, 0.0, 26.0)
                                        local tprops2 = CreateObject(GetHashKey('bkr_prop_weed_bud_02b'), 1038.65, -3206.648, -38.28, true)
                                        SetEntityRotation(tprops2, 90.0, 84.0, 126.0)
                                        local tprops3 = CreateObject(GetHashKey('bkr_prop_weed_bud_02b'), 1038.65, -3206.648, -38.21, true)
                                        SetEntityRotation(tprops3, 156.0, 43.0, 267.0)
                                        local tprops4 = CreateObject(GetHashKey('bkr_prop_weed_dry_01a'), 1038.7, -3205.89, -38.305, true)
                                        SetEntityRotation(tprops4, 0.0, 0.0, 0.0)
                                        --TaskStartScenarioInPlace(GetPlayerPed(-1), 'PROP_HUMAN_PARKING_METER')

                                       -- print(GetPedBoneIndex(GetPlayerPed(-1), ))

                                       --NetworkFadeOutEntity(GetPlayerPed(-1), false, false)
                                      -- NetworkFadeInEntity(GetPlayerPed(-1), false, false)

                                        while InAnim do
                                            CreateThread(function()
                                                while InAnim do
                                                    Wait(1)
                                                    HelpNotif("Appuyez sur ~INPUT_PICKUP~ pour finir de traiter")
                                                    if IsControlJustPressed(1, 38) then
                                                        InAnim = false
                                                        DeleteEntity(props)
                                                        DeleteEntity(props2)
                                                        DeleteEntity(tprops1)
                                                        DeleteEntity(tprops2)
                                                        DeleteEntity(tprops3)
                                                        DeleteEntity(tprops4)
                                                        SetEntityCollision(GetPlayerPed(-1), true, true)
                                                        FreezeEntityPosition(GetPlayerPed(-1), false)
                                                        ClearPedTasksImmediately(GetPlayerPed(-1))
                                                    end
                                                end
                                            end)
                                            TaskPlayAnimAdvanced(GetPlayerPed(-1), 'anim@amb@business@weed@weed_sorting_seated@', 'sorter_right_sort_v3_sorter02', 1039.324, -3205.918, -38.15, 0.0, 0.0, 98.707, 1.0, 1.0, -1)
                                            Wait(3750)
                                            props = CreateObject(GetHashKey('bkr_prop_weed_bud_02b'), 0.0, 0.0, 0.0, true)
                                            AttachEntityToEntity(props, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 18905), 0.12, -0.025, 0.045, 260.0, 0.0, 0.0, true, true, false, true, 1, true)

                                            Wait(2500)
                                            props2 = CreateObject(GetHashKey('bkr_prop_weed_leaf_01a'), 0.0, 0.0, 0.0, true)
                                            AttachEntityToEntity(props2, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 57005), 0.2, 0.08, -0.1, 15.0, 0.0, 0.0, true, true, false, true, 1, true)--0.3, 0.05, -0.3 --0.12
                                            Wait(1000)
                                            DeleteEntity(props2)

                                            Wait(500)
                                            props2 = CreateObject(GetHashKey('bkr_prop_weed_leaf_01a'), 0.0, 0.0, 0.0, true)
                                            AttachEntityToEntity(props2, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 57005), 0.2, 0.08, -0.1, 15.0, 0.0, 0.0, true, true, false, true, 1, true)--0.3, 0.05, -0.3 --0.12
                                            Wait(700)
                                            DeleteEntity(props2)

                                            Wait(1350)
                                            props2 = CreateObject(GetHashKey('bkr_prop_weed_leaf_01a'), 0.0, 0.0, 0.0, true)
                                            AttachEntityToEntity(props2, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 57005), 0.2, 0.08, -0.1, 15.0, 0.0, 0.0, true, true, false, true, 1, true)--0.3, 0.05, -0.3 --0.12
                                            Wait(600)
                                            DeleteEntity(props2)

                                            Wait(1300)
                                            props2 = CreateObject(GetHashKey('bkr_prop_weed_leaf_01a'), 0.0, 0.0, 0.0, true)
                                            AttachEntityToEntity(props2, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 57005), 0.2, 0.08, -0.1, 15.0, 0.0, 0.0, true, true, false, true, 1, true)--0.3, 0.05, -0.3 --0.12
                                            Wait(700)
                                            DeleteEntity(props2)

                                            Wait(1400)
                                            props2 = CreateObject(GetHashKey('bkr_prop_weed_leaf_01a'), 0.0, 0.0, 0.0, true)
                                            AttachEntityToEntity(props2, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 57005), 0.2, 0.08, -0.1, 15.0, 0.0, 0.0, true, true, false, true, 1, true)--0.3, 0.05, -0.3 --0.12
                                            Wait(700)
                                            DeleteEntity(props2)

                                            Wait(1500)
                                            props2 = CreateObject(GetHashKey('bkr_prop_weed_leaf_01a'), 0.0, 0.0, 0.0, true)
                                            AttachEntityToEntity(props2, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 57005), 0.2, 0.08, -0.1, 15.0, 0.0, 0.0, true, true, false, true, 1, true)--0.3, 0.05, -0.3 --0.12
                                            Wait(600)
                                            DeleteEntity(props2)

                                            Wait(2500)
                                            props2 = CreateObject(GetHashKey('bkr_prop_weed_leaf_01a'), 0.0, 0.0, 0.0, true)
                                            AttachEntityToEntity(props2, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 57005), 0.2, 0.08, -0.1, 15.0, 0.0, 0.0, true, true, false, true, 1, true)--0.3, 0.05, -0.3 --0.12
                                            Wait(700)
                                            DeleteEntity(props2)

                                            Wait(1500)
                                            props2 = CreateObject(GetHashKey('bkr_prop_weed_leaf_01a'), 0.0, 0.0, 0.0, true)
                                            AttachEntityToEntity(props2, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 57005), 0.2, 0.08, -0.1, 15.0, 0.0, 0.0, true, true, false, true, 1, true)--0.3, 0.05, -0.3 --0.12
                                            Wait(700)
                                            DeleteEntity(props2)

                                            Wait(2000)

                                            DetachEntity(props, true, false)
                                            --AttachEntityToEntity(props, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 57005), -0.12, 0.025, -0.045, -260.0, 0.0, 0.0, true, true, false, true, 1, true)
                                            AttachEntityToEntity(props, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 57005), 0.12, -0.025, -0.005, 260.0, 0.0, 0.0, true, true, false, true, 1, true)

                                            Wait(500)

                                            DetachEntity(props, true, false)
                                            DeleteEntity(props)
                                            --FreezeEntityPosition(props, false)

                                            Wait(3500)
                                            --weed
                                            --TriggerServerEvent('InitialCore:DeleteItem', GetPlayerServerId(PlayerId()), "kerosene", CuveMelangeCoca.kerosene)
                                            --TriggerServerEvent('InitialCore:GiveItem', GetPlayerServerId(PlayerId()), "weed", 1, false)

                                            --DeleteEntity(props)
                                            --DeleteEntity(props2)
                                        end

                                        --[[while not HasAnimDictLoaded('anim@amb@business@weed@weed_sorting_seated@') do RequestAnimDict("anim@amb@business@weed@weed_sorting_seated@") Wait(100) end
                                        FreezeEntityPosition(GetPlayerPed(-1), true)
                                        SetEntityCollision(GetPlayerPed(-1), false, false)
                                        TaskPlayAnimAdvanced(GetPlayerPed(-1), 'anim@amb@business@weed@weed_sorting_seated@', 'sorter_right_sort_v3_sorter02', 1039.324, -3205.918, -38.2, 0.0, 0.0, 98.707, 1.0, 1.0, -1) --
--
                                        local tprops1 = CreateObject(GetHashKey('bkr_prop_weed_bud_02b'), 1038.6, -3206.648, -38.28, true)
                                        SetEntityRotation(tprops1, 90.0, 0.0, 26.0)
                                        local tprops2 = CreateObject(GetHashKey('bkr_prop_weed_bud_02b'), 1038.65, -3206.648, -38.28, true)
                                        SetEntityRotation(tprops2, 90.0, 84.0, 126.0)
                                        local tprops3 = CreateObject(GetHashKey('bkr_prop_weed_bud_02b'), 1038.65, -3206.648, -38.21, true)
                                        SetEntityRotation(tprops3, 156.0, 43.0, 267.0)

                                        local props = CreateObject(GetHashKey('bkr_prop_weed_bud_02b'), 0.0, 0.0, 0.0, true)
                                        --AttachEntityToEntity(props, GetPlayerPed(-1), GetEntityBoneIndexByName(GetPlayerPed(-1), "IK_L_Hand"), -0.3, 0.4, 0.96, 0.0, 0.0, 90.0)
                                        AttachEntityToEntity(props, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 18905), 0.12, -0.025, 0.045, 260.0, 0.0, 0.0, true, true, false, true, 1, true)
                                        ---0.3, 0.4, 0.96
                                        Wait(10000)
                                        DeleteEntity(props)
                                        DeleteEntity(tprops1)
                                        DeleteEntity(tprops2)
                                        DeleteEntity(tprops3)

                                        SetEntityCollision(GetPlayerPed(-1), true, true)
                                        FreezeEntityPosition(GetPlayerPed(-1), false)

                                        Wait(10000)
                                        TriggerServerEvent('InitialCore:GiveItem', GetPlayerServerId(PlayerId()), "weed", 1, false)
                                        Wait(5500)
                                        
                                        ClearPedTasksImmediately(GetPlayerPed(-1))
                                        ToggleCancelEmote(true)]]
                                        
                              --      else
                                        --AdvancedNotif('Récolte.', '~r~Erreur.', 'Cette plante a déjà été récolté au maximum.', 'CHAR_WE', 'INITIALV')
                               --     end
                              --  end, v.id)



                             --[[ local scissorsNetID
                              local dictBase = "anim@amb@business@weed@weed_sorting_seated@"
                              local scissorsModel = GetHashKey("p_cs_scissors_s")
                          
                              local function CreateScissors()
                                  RequestModel(scissorsModel)
                                  while not HasModelLoaded(scissorsModel) do Wait(0) end
                          
                                  local ent = CreateObject(scissorsModel, 0.0, 0.0, 0.0, true, true, false)
                                  SetModelAsNoLongerNeeded(scissorsModel)
                          
                                  scissorsNetID = ObjToNet(ent)
                                  SetNetworkIdExistsOnAllMachines(scissorsNetID, true)
                              end
                          
                              CreateScissors()
                          
                              RequestAnimDict(dictBase)
                              while not HasAnimDictLoaded(dictBase) do Wait(0) end
                          
                              local netScene = NetworkCreateSynchronisedScene(1039.124, -3205.918, -39.0, 0.0, 0.0, 98.707, 2, 1, 0, 1.0, 0.0, 1.0)
                              NetworkAddPedToSynchronisedScene(PlayerPedId(), netScene, dictBase, "sorter_right_sort_v3_sorter02", 1000.0, -1000.0, 69, 0, 1000.0, 0)
                              NetworkAddEntityToSynchronisedScene(NetToEnt(scissorsNetID), netScene, dictBase, "sorter_right_sort_v3_sorter02", 1000.0, -1000.0, 0)
                              NetworkStartSynchronisedScene(netScene)]]



                            else
                                AdvancedNotif('Traitement.', '~r~Erreur.', 'Vous traitez déjà.', 'CHAR_WE', 'INITIALV')
                            end
                        elseif v.type == "cuveamelangecocaine" then
                            TriggerServerCallback('InitialCore:GetVar', function(CuveInfo2)
                                CuveInfo = CuveInfo2
                                RageUI.Visible(RMenu:Get('cuvemelangecoca', 'main'), true)
                                TypeMenu = "cuve"
                                OpenCuveCocaMelange()
                            end, 31)
                        elseif v.type == "reglagetemperaturecocaine" then
                            if not Var[31].inuse then
                                TriggerServerCallback('InitialCore:GetVar', function(CuveInfo2)
                                    CuveInfo = CuveInfo2
                                    RageUI.Visible(RMenu:Get('cuvemelangecoca', 'main'), true)
                                    TypeMenu = "temperaturecuve"
                                    OpenCuveCocaMelange()
                                end, 31)
                            else
                                AdvancedNotif('Cuve de mélange', 'Erreur', 'Vous ne pouvez pas modifier la température du mélange tant que la cuve est active.', 'CHAR_WE', 'INITIALV')
                            end
                        elseif v.type == "reglagetempsetvalidationcocaine" then
                            if not Var[31].inuse then
                                TriggerServerCallback('InitialCore:GetVar', function(CuveInfo2)
                                    CuveInfo = CuveInfo2
                                    RageUI.Visible(RMenu:Get('cuvemelangecoca', 'main'), true)
                                    TypeMenu = "timeandstartcuve"
                                    OpenCuveCocaMelange()
                                end, 31)
                            else
                                AdvancedNotif('Cuve de mélange', 'Erreur', 'Vous ne pouvez pas modifier le temps de mélange tant que la cuve est active.', 'CHAR_WE', 'INITIALV')
                            end
                        end
                    end
                    --print(v.type)
                end
            end
        end
        if VarTemp ~= 1 then
            Wait(7500)
            --print('WAIT')
        end
        VarTemp = 0
    end
end)

RMenu.Add('cuvemelangecoca', 'main', RageUI.CreateMenu("Cuve de mélange", "~b~QUANTITE"))
RMenu.Add('cuvemelangecoca', 'inventaire', RageUI.CreateSubMenu(RMenu:Get('cuvemelangecoca', 'main'), "Cuve de mélange", "~b~QUANTITE"))

local CuveCocaMelangeOpen = false

local CuveMelangeCoca = {
    kerosene = 0,
   -- kerosenelist = {},
   -- keroseneindex = 1,
    feuilledecoca = 0,

    acidesulfuriquedilue = 0
    --feuilledecocalist = {},
    --feuilledecocaindex = 1
}

function OpenCuveCocaMelange()

    CuveCocaMelangeOpen = true

    while CuveCocaMelangeOpen do
        Wait(1)
        if not RageUI.Visible(RMenu:Get('cuvemelangecoca', 'main')) and not RageUI.Visible(RMenu:Get('cuvemelangecoca', 'inventaire')) then
            CuveCocaMelangeOpen = false
            CuveMelangeCoca.kerosene = 0
            CuveMelangeCoca.feuilledecoca = 0
            CuveMelangeCoca.acidesulfuriquedilue = 0
            --print('close')
        end
        if TypeMenu == "cuve" then
            RageUI.IsVisible(RMenu:Get('cuvemelangecoca', 'main'), true, true, true, function()
                --print(CuveInfo.time)
                if CuveInfo[31].inuse then
                    if tonumber(CuveInfo[31].time) <= 119 then
                        --RageUI.Separator("")
                        local Percent_ = CuveInfo[31].time*100/120/100
                        RageUI.PercentagePanel(Percent_ or 0.0, "Traitement en cours (" .. math.floor(Percent_*100) .. "%)", "", "", function(Hovered, Active, Percent)
                        end)
                    else
                        RageUI.Button("Récupérer le mélange", "Récupérer le mélange de la cuve.", { RightLabel = ">" }, true, function(Hovered, Active, Selected)
                            if Selected then
                                local Percent = CuveInfo[31].feuilledecoca+CuveInfo[31].kerosene+CuveInfo[31].acidesulfuriquedilue
                                Percent = Percent*100
                                Percent = Percent/503
                                if Percent > 100 then
                                    Percent2 = Percent-100
                                    Percent2 = Percent2*2
                                    Percent = Percent-Percent2
                                end
                                if Percent >= 60 then
                                    TriggerServerEvent('InitialCore:GiveItem', GetPlayerServerId(PlayerId()), "patedecocaine", 1, Percent)
                                else
                                    AdvancedNotif('Cuve de mélange', 'Erreur', 'Votre pâte est de mauvaise qualité & non éxploitable.', 'CHAR_WE', 'INITIALV')
                                end
                                CuveInfo[31].time = 0
                                TriggerServerEvent('InitialCore:ResetDItem', 31)
                            end
                        end)
                    end
                else
                    RageUI.Button("Ajouter un ingrédient", "Ajouter un ingrédient dans la cuve de mélange.", { RightLabel = ">" }, true, function(Hovered, Active, Selected)
                        --[[if Selected then
                            TriggerServerCallback("InitialCore:hasObject", function(hasObject, Nombre)
                                if hasObject then
                                    CuveMelangeCoca.kerosene = Nombre
                                    for i = 1, CuveMelangeCoca.kerosene do
                                        CuveMelangeCoca.kerosenelist[i] = i
                                    end
                                else
                                    CuveMelangeCoca.kerosene = 0
                                end
                            end, 'kerosene')
                            TriggerServerCallback("InitialCore:hasObject", function(hasObject, Nombre)
                                if hasObject then
                                    CuveMelangeCoca.feuilledecoca = Nombre
                                    for i = 1, CuveMelangeCoca.feuilledecoca do
                                        CuveMelangeCoca.feuilledecocalist[i] = i
                                    end
                                else
                                    CuveMelangeCoca.feuilledecoca = 0
                                end
                            end, 'feuilledecocaine')
                        end]]
                    end, RMenu:Get('cuvemelangecoca', 'inventaire'))
                end
            end)
            RageUI.IsVisible(RMenu:Get('cuvemelangecoca', 'inventaire'), true, true, true, function()
                --print(CuveInfo[31].feuilledecoca)
                if CuveInfo[31].feuilledecoca == 0 then
                    RageUI.Button("Feuille de cocaïne :", "Ajouter des feuilles de cocaïne dans la cuve de mélange.", { RightLabel = CuveMelangeCoca.feuilledecoca }, true, function(Hovered, Active, Selected)
                        if Selected then
                            CuveMelangeCoca.feuilledecoca = KeyboardInput("", 5)
                        end
                    end)
                    RageUI.Button("Kérosène :", "Ajouter du kérosène dans la cuve de mélange.", { RightLabel = CuveMelangeCoca.kerosene .. " ml" }, true, function(Hovered, Active, Selected)
                        if Selected then
                            CuveMelangeCoca.kerosene = KeyboardInput("", 5)
                        end
                    end)
                    RageUI.Button("Acide sulfurique dilué :", "Ajouter de l'acide sulfurique dilué dans la cuve de mélange.", { RightLabel = CuveMelangeCoca.acidesulfuriquedilue .. " ml" }, true, function(Hovered, Active, Selected)
                        if Selected then
                            CuveMelangeCoca.acidesulfuriquedilue = KeyboardInput("", 5)
                        end
                    end)
                    

                --[[ RageUI.List("Feuille de cocaïne :", CuveMelangeCoca.feuilledecocalist, CuveMelangeCoca.feuilledecocaindex, "Ajouter des feuilles de cocaïne dans la cuve de mélange.", {}, true, function(Hovered, Active, Selected, Index)
                        if Index ~= CuveMelangeCoca.feuilledecocaindex then
                            CuveMelangeCoca.feuilledecocaindex = Index
                        end
                    end)
                    RageUI.List("Kérosène :", CuveMelangeCoca.kerosenelist, CuveMelangeCoca.keroseneindex, "Ajouter du kérosène dans la cuve de mélange.", {}, true, function(Hovered, Active, Selected, Index)
                        if Index ~= CuveMelangeCoca.keroseneindex then
                            CuveMelangeCoca.keroseneindex = Index
                        end
                    end)]]
                    RageUI.Button("Valider", "Valider les proportion de mélange.", { RightLabel = ">" }, true, function(Hovered, Active, Selected)
                        if Selected then
                            local validate1 = false
                            local validate2 = false
                            local validate3 = false
                            local inv1 = false
                            local inv2 = false
                            local inv3 = false
                            print('1')
                            TriggerServerCallback("InitialCore:hasObject", function(hasObject, Nombre)
                                print(hasObject)
                                if hasObject then
                                    if Nombre >= tonumber(CuveMelangeCoca.feuilledecoca) then
                                        validate1 = true
                                        inv1 = true
                                    end
                                end
                                TriggerServerCallback("InitialCore:hasObject", function(hasObject2, Nombre2)
                                    print(hasObject2)
                                    if hasObject2 then
                                        if Nombre2 >= tonumber(CuveMelangeCoca.kerosene) then
                                            validate2 = true
                                            inv2 = true
                                        end
                                    end
                                    print('2')
                                    TriggerServerCallback("InitialCore:hasObject", function(hasObject3, Nombre3)
                                        print(hasObject3)
                                        if hasObject3 then
                                            if Nombre3 >= tonumber(CuveMelangeCoca.acidesulfuriquedilue) then
                                                validate3 = true
                                                inv3 = true
                                            end
                                        end

                                        if validate1 and validate2 and validate3 and tonumber(CuveMelangeCoca.feuilledecoca) >= 1 and tonumber(CuveMelangeCoca.kerosene) >= 1 and tonumber(CuveMelangeCoca.acidesulfuriquedilue) >= 1 then
                                            TriggerServerEvent('InitialCore:ChangeInfoCuve', false, false, false, CuveMelangeCoca.feuilledecoca, CuveMelangeCoca.kerosene, CuveMelangeCoca.acidesulfuriquedilue)
                                            CuveInfo[31].feuilledecoca = CuveMelangeCoca.feuilledecoca
                                            CuveInfo[31].kerosene = CuveMelangeCoca.kerosene
                                            CuveInfo[31].acidesulfuriquedilue = CuveMelangeCoca.acidesulfuriquedilue
                                            TriggerServerEvent('InitialCore:DeleteItem', GetPlayerServerId(PlayerId()), "feuilledecocaine", CuveMelangeCoca.feuilledecoca)
                                            Wait(500)
                                            TriggerServerEvent('InitialCore:DeleteItem', GetPlayerServerId(PlayerId()), "kerosene", CuveMelangeCoca.kerosene)
                                            Wait(500)
                                            TriggerServerEvent('InitialCore:DeleteItem', GetPlayerServerId(PlayerId()), "acidesulfuriquedilue", CuveMelangeCoca.acidesulfuriquedilue)
                                        elseif not inv1 and not inv2 and not inv3 then
                                            AdvancedNotif('Cuve de mélange', 'Erreur', 'Vous n\'avez pas les ingrédients dans votre inventaire.', 'CHAR_WE', 'INITIALV')
                                        else
                                            AdvancedNotif('Cuve de mélange', 'Erreur', 'Il manque un/des ingrédient(s) dans la cuve.', 'CHAR_WE', 'INITIALV')
                                        end
                                    end, 'acidesulfuriquedilue')
                                end, 'kerosene')
                            end, 'feuilledecocaine')
                        end
                    end)
                else
                    RageUI.Separator("Feuille de cocaïne : " .. CuveInfo[31].feuilledecoca)
                    RageUI.Separator("Kérosène : " .. CuveInfo[31].kerosene)
                    RageUI.Separator("Acide sulfurique dilué : " .. CuveInfo[31].acidesulfuriquedilue)
                    RageUI.Button("Retirer les ingrédients", "Retirer les ingrédients pour recommencer le mélange.", { RightLabel = ">" }, true, function(Hovered, Active, Selected)
                        if Selected then
                            TriggerServerEvent('InitialCore:ChangeInfoCuve', false, false, false, 0, 0, 0)
                            TriggerServerEvent('InitialCore:GiveItem', GetPlayerServerId(PlayerId()), "feuilledecocaine", CuveInfo[31].feuilledecoca)
                            Wait(500)
                            TriggerServerEvent('InitialCore:GiveItem', GetPlayerServerId(PlayerId()), "kerosene", CuveInfo[31].kerosene)
                            Wait(500)
                            TriggerServerEvent('InitialCore:GiveItem', GetPlayerServerId(PlayerId()), "acidesulfuriquedilue", CuveInfo[31].acidesulfuriquedilue)
                            CuveInfo[31].feuilledecoca = 0
                            CuveInfo[31].kerosene = 0
                            CuveInfo[31].acidesulfuriquedilue = 0
                        end
                    end)
                end
            end)
        elseif TypeMenu == "temperaturecuve" then
            RageUI.IsVisible(RMenu:Get('cuvemelangecoca', 'main'), true, true, true, function()
                if type(CuveInfo[31].temperature) == "number" then
                    if CuveInfo[31].temperature <= 0 then
                        CuveInfo[31].temperature = false
                    end
                end
                if CuveInfo[31].temperature then
                    RageUI.Button("Choisir la température", "Choisir la température de la cuve de mélange.", { RightLabel = CuveInfo[31].temperature .. "°C" }, true, function(Hovered, Active, Selected)
                        if Selected then
                            local TemperatureVar = KeyboardInput("", 5)
                            if tonumber(TemperatureVar) > 0 then
                                CuveInfo[31].temperature = TemperatureVar
                                TriggerServerEvent('InitialCore:ChangeInfoCuve', false, TemperatureVar, false, false, false, false)
                            else
                                AdvancedNotif('Cuve de mélange', 'Erreur', 'Température invalide.', 'CHAR_WE', 'INITIALV')
                            end
                        end
                    end)
                else
                    RageUI.Button("Choisir la température", "Choisir la température de la cuve de mélange.", { RightLabel = ">" }, true, function(Hovered, Active, Selected)
                        if Selected then
                            local TemperatureVar = KeyboardInput("", 5)
                            if tonumber(TemperatureVar) > 0 then
                                CuveInfo[31].temperature = TemperatureVar
                                TriggerServerEvent('InitialCore:ChangeInfoCuve', false, TemperatureVar, false, false, false, false)
                            else
                                AdvancedNotif('Cuve de mélange', 'Erreur', 'Température invalide.', 'CHAR_WE', 'INITIALV')
                            end
                        end
                    end)
                end
            end)
        elseif TypeMenu == "timeandstartcuve" then
            RageUI.IsVisible(RMenu:Get('cuvemelangecoca', 'main'), true, true, true, function()
                if type(CuveInfo[31].time) == "number" then
                    if CuveInfo[31].time <= 0 then
                        CuveInfo[31].time = false
                    end
                end
                if CuveInfo[31].time then
                    RageUI.Button("Choisir le temps", "Choisir le temps de traitement de la cuve de mélange.", { RightLabel = CuveInfo[31].time .. " minutes" }, true, function(Hovered, Active, Selected)
                        if Selected then
                            local TimeVar = KeyboardInput("", 5)
                            if tonumber(TimeVar) > 0 then
                                CuveInfo[31].time = TimeVar
                                TriggerServerEvent('InitialCore:ChangeInfoCuve', false, false, TimeVar, false, false, false)
                            else
                                AdvancedNotif('Cuve de mélange', 'Erreur', 'Température invalide.', 'CHAR_WE', 'INITIALV')
                            end
                        end
                    end)
                else
                    RageUI.Button("Choisir le temps", "Choisir le temps de traitement de la cuve de mélange.", { RightLabel = ">" }, true, function(Hovered, Active, Selected)
                        if Selected then
                            local TimeVar = KeyboardInput("", 5)
                            if tonumber(TimeVar) > 0 then
                                CuveInfo[31].time = TimeVar
                                TriggerServerEvent('InitialCore:ChangeInfoCuve', false, false, TimeVar, false, false, false)
                            else
                                AdvancedNotif('Cuve de mélange', 'Erreur', 'Température invalide.', 'CHAR_WE', 'INITIALV')
                            end
                        end
                    end)
                end
                RageUI.Button("Valider", "Valider et commencer la procédure de mélange de la cuve (non annulable).", { RightLabel = ">" }, true, function(Hovered, Active, Selected)
                    if Selected then
                        if tonumber(CuveInfo[31].time) > 0 and tonumber(CuveInfo[31].temperature) > 0 and tonumber(CuveInfo[31].feuilledecoca) > 0 and tonumber(CuveInfo[31].kerosene) > 0 and tonumber(CuveInfo[31].acidesulfuriquedilue) > 0 and not CuveInfo[31].inuse then
                            TriggerServerEvent('InitialCore:ChangeInfoCuve', true, false, false, false, false, false)
                        else
                            AdvancedNotif('Cuve de mélange', 'Erreur', 'La cuve n\'est pas configuré correctement.', 'CHAR_WE', 'INITIALV')
                        end
                    end
                end)
            end)
        end
    end
end