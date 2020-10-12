------------------------------------------------------------------------------
--
-- Ce travail est sous liscence:
-- Creative Commons Attribution-NonCommercial-NoDerivatives-NoDistribution 4.0 International License.
--
------------------------------------------------------------------------------

RMenu.Add('superette', 'main', RageUI.CreateMenu("Supérette", "~b~MENU"))

local ShopZone = {
    -- SUPERETTE 1
    {x= 26.9295, y= -1348.2445, z= 29.4970-0.98, type= "fruit"},
    {x= 28.8414, y= -1345.246, z= 29.4970-0.98, type= "feculent"},
    {x= 30.392, y= -1345.247, z= 29.4970-0.98, type= "conserves"},
    {x= 28.8608, y= -1342.6473, z= 29.4970-0.98, type= "aperitif"},
    {x= 30.8638, y= -1342.9351, z= 29.4970-0.98, type= "frais"},
    {x= 32.5423 , y= -1342.9339, z= 29.4970-0.98, type= "surgele"},
    {x= 34.0440, y= -1342.9509, z= 29.4970-0.98, type= "viande"},
    {x= 33.7104, y= -1345.4808, z= 29.4970-0.98, type= "alcool"},
    {x= 27.5585, y= -1345.2873, z= 29.4970-0.98, type= "boisson"},
    {x= 31.0133, y= -1347.0972, z= 29.4970-0.98, type= "patisserie"},
    
    -- SUPERETTE 2
    {x= 374.29061889648, y= 324.92526245117, z= 103.56636810303, type= "fruit"},
    {x= 377.25912475586, y= 327.43365478516, z= 103.56635284424, type= "feculent"},
    {x= 378.73519897461, y= 326.94552612305, z= 103.56636810303, type= "conserves"},
    {x= 378.06030273438, y= 329.80828857422, z= 103.56636810303, type= "aperitif"},
    {x= 379.85604858398, y= 329.07382202148, z= 103.56636810303, type= "frais"},
    {x= 381.41363525391, y= 328.65606689453, z= 103.56636810303, type= "surgele"},
    {x= 382.73834228516, y= 328.37216186523, z= 103.56636810303, type= "viande"},
    {x= 382.11791992188, y= 326.24035644531, z= 103.56642150879, type= "alcool"},
    {x= 376.03948974609, y= 327.77975463867, z= 103.56642150879, type= "boisson"},
    {x= 379.04296875, y= 324.95819091797, z= 103.56642150879, type= "patisserie"},

    -- SUPERETTE 3
    {x= 2558.310546875, y= 382.86450195313, z= 108.62298583984, type= "fruit"},
    {x= 2555.2778320313, y= 385.28359985352, z= 108.62298583984, type= "feculent"},
    {x= 2555.4028320313, y= 386.75415039063, z= 108.62298583984, type= "conserves"},
    {x= 2552.7470703125, y= 385.49835205078, z= 108.62298583984, type= "aperitif"},
    {x= 2553.1740722656, y= 387.43130493164, z= 108.62298583984, type= "frais"},
    {x= 2553.2138671875, y= 388.95959472656, z= 108.62298583984, type= "surgele"},
    {x= 2553.2209472656, y= 390.52276611328, z= 108.62298583984, type= "viande"},
    {x= 2555.3959960938, y= 390.17361450195, z= 108.62298583984, type= "alcool"},
    {x= 2555.2294921875, y= 383.88836669922, z= 108.62298583984, type= "boisson"},
    {x= 2557.2463378906, y= 387.33834838867, z= 108.62298583984, type= "patisserie"},

    -- SUPERETTE 4
    {x= -3038.6657714844, y= 586.76293945313, z= 7.9089331626892, type= "fruit"},
    {x= -3042.2524414063, y= 588.03887939453, z= 7.9089331626892, type= "feculent"},
    {x= -3042.7268066406, y= 589.53387451172, z= 7.9089326858521, type= "conserves"},
    {x= -3044.7966308594, y= 587.49920654297, z= 7.9089326858521, type= "aperitif"},
    {x= -3045.0139160156, y= 589.29150390625, z= 7.9089326858521, type= "frais"},
    {x= -3045.5244140625, y= 590.84710693359, z= 7.9089326858521, type= "surgele"},
    {x= -3045.9604492188, y= 592.32348632813, z= 7.9089326858521, type= "viande"},
    {x= -3043.7863769531, y= 592.69659423828, z= 7.9089326858521, type= "alcool"},
    {x= -3041.8928222656, y= 586.83831787109, z= 7.9089326858521, type= "boisson"},
    {x= -3041.2719726563, y= 590.76776123047, z= 7.9089326858521, type= "patisserie"},

    -- SUPERETTE 5
    {x= -3241.1242675781, y= 1001.9758911133, z= 12.830706596375, type= "fruit"},
    {x= -3244.064453125, y= 1004.4728393555, z= 12.830706596375, type= "feculent"},
    {x= -3243.8708496094, y= 1005.9983520508, z= 12.830706596375, type= "conserves"},
    {x= -3246.5725097656, y= 1004.8825073242, z= 12.830706596375, type= "aperitif"},
    {x= -3246.0668945313, y= 1006.626159668, z= 12.830706596375, type= "frais"},
    {x= -3245.9147949219, y= 1008.1492919922, z= 12.830706596375, type= "surgele"},
    {x= -3245.6328125, y= 1009.7476196289, z= 12.830706596375, type= "viande"},
    {x= -3243.6088867188, y= 1009.3889770508, z= 12.830706596375, type= "alcool"},
    {x= -3243.9875488281, y= 1003.2166748047, z= 12.830706596375, type= "boisson"},
    {x= -3242.0131835938, y= 1006.5719604492, z= 12.830706596375, type= "patisserie"},
}

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)


        -- DEV A ENLEVER
        --if IsControlJustPressed(0, 57) then
        --    TriggerServerEvent('alpha:setcoffre', plyCoords.x, plyCoords.y, plyCoords.z)
        --end
        -- ##############

        for k in pairs(ShopZone) do
            local dist = Vdist2(plyCoords.x, plyCoords.y, plyCoords.z, ShopZone[k].x, ShopZone[k].y, ShopZone[k].z)
            
            -- DRAWMARKER A ENLEVER
         --  DrawMarker(3, ShopZone[k].x, ShopZone[k].y, ShopZone[k].z+0.98, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 0, 255, 0, 255, false, true, 2, nil, nil, false)

            if dist <= 1.5 then
                HelpNotif("Appuyez sur ~INPUT_TALK~ pour interagir.")
                if IsControlJustPressed(1,51) then
                    RageUI.Visible(RMenu:Get('superette', 'main'), true)
                    SuperetteMenu()
                    --[[if ShopZone[k].type == 'fruit' then
                        superetteFruitMenu:Visible(not superetteFruitMenu:Visible())
                    elseif ShopZone[k].type == 'feculent' then
                        superetteFeculentMenu:Visible(not superetteFeculentMenu:Visible())
                    elseif ShopZone[k].type == 'conserves' then
                        superetteConserveSauceMenu:Visible(not superetteConserveSauceMenu:Visible())
                    elseif ShopZone[k].type == 'aperitif' then
                        superetteAperitifMenu:Visible(not superetteAperitifMenu:Visible())
                    elseif ShopZone[k].type == 'frais' then
                        superetteFraisMenu:Visible(not superetteFraisMenu:Visible())
                    elseif ShopZone[k].type == 'surgele' then
                        superetteSurgeleMenu:Visible(not superetteSurgeleMenu:Visible())
                    elseif ShopZone[k].type == 'viande' then
                        superetteViandeMenu:Visible(not superetteViandeMenu:Visible())
                    elseif ShopZone[k].type == 'alcool' then
                        superetteAlcoolMenu:Visible(not superetteAlcoolMenu:Visible())
                    elseif ShopZone[k].type == 'boisson' then
                        superetteBoissonMenu:Visible(not superetteBoissonMenu:Visible())
                    elseif ShopZone[k].type == 'patisserie' then
                        superettePatisserieMenu:Visible(not superettePatisserieMenu:Visible())
                    end]]
				end
            end
        end
    end
end)

local IsMenuSuperetteOpen = false

function SuperetteMenu()
    if IsMenuSuperetteOpen then
        return
    end
    IsMenuSuperetteOpen = true
    while IsMenuSuperetteOpen do
        Wait(1)
        if not RageUI.Visible(RMenu:Get('superette', 'main')) then
            IsMenuSuperetteOpen = false
        end
        RageUI.IsVisible(RMenu:Get('superette', 'main'), true, true, true, function()
            RageUI.Button("Pain", "DESC", { RightLabel = "1$" }, true, function(_, Active, Selected)
                if Selected then
                    TriggerServerCallback('InitialCore:getMoney', function(money)
                        if money >= 1 then
                            TriggerServerEvent('InitialCore:GiveItem', GetPlayerServerId(PlayerId()), "pain", 1)
                            TriggerServerEvent('InitialCore:RemoveMoney', GetPlayerServerId(PlayerId()), 1)
                            AdvancedNotif("Supérette", "Achat", "Vous avez acheter du pain.", "CHAR_WE", "INITIALV")
                        else
                            AdvancedNotif("Supérette", "Erreur", "Vous n'avez pas assez d'argent.", "CHAR_WE", "INITIALV")
                        end
                    end)
                end
            end)
            RageUI.Button("Eau", "DESC", { RightLabel = "1$" }, true, function(_, Active, Selected)
                if Selected then
                    TriggerServerCallback('InitialCore:getMoney', function(money)
                        if money >= 1 then
                            TriggerServerEvent('InitialCore:GiveItem', GetPlayerServerId(PlayerId()), "eau", 1) 
                            TriggerServerEvent('InitialCore:RemoveMoney', GetPlayerServerId(PlayerId()), 1)
                            AdvancedNotif("Supérette", "Achat", "Vous avez acheter de l'eau.", "CHAR_WE", "INITIALV")
                        else
                            AdvancedNotif("Supérette", "Erreur", "Vous n'avez pas assez d'argent.", "CHAR_WE", "INITIALV")
                        end
                    end)
                end
            end)
            RageUI.Button("Téléphone", "DESC", { RightLabel = "800$" }, true, function(_, Active, Selected)
                if Selected then
                    TriggerServerCallback('InitialCore:getMoney', function(money)
                        if money >= 800 then
                            local Meta = {}
                            Meta.Num = math.random(1000000, 9999999)
                            TriggerServerEvent('InitialCore:GiveItem', GetPlayerServerId(PlayerId()), "Telephone", 1, Meta)
                            TriggerServerEvent('InitialCore:AddPhoneWSteamID', Meta.Num)
                            TriggerServerEvent('InitialCore:RemoveMoney', GetPlayerServerId(PlayerId()), 800)
                            AdvancedNotif("Supérette", "Achat", "Vous avez acheter un téléphone.", "CHAR_WE", "INITIALV")
                        else
                            AdvancedNotif("Supérette", "Erreur", "Vous n'avez pas assez d'argent.", "CHAR_WE", "INITIALV")
                        end
                    end)
                end
            end)
        end)
    end
end

local SuperetteBlip = {
    {title="Supérette alimentaire", colour=43, id=52, x =25.742, y =-1345.741, z =28.497},
    {title="Supérette alimentaire", colour=43, id=52, x =373.875, y =325.896, z =100.319},
    {title="Supérette alimentaire", colour=43, id=52, x =2557.458, y =382.282, z =100.319},
    {title="Supérette alimentaire", colour=43, id=52, x =-3038.939, y =585.954, z =6.908},
    {title="Supérette alimentaire", colour=43, id=52, x =-3241.927, y =1001.462, z =11.830},

    --[[{title="Sup�rette", colour=43, id=52, x =547.431, y =2671.710, z =41.156+0.05},
    {title="Sup�rette", colour=43, id=52, x =1961.464, y =3740.672, z =31.343+0.05},
    {title="Sup�rette", colour=43, id=52, x =2678.916, y =3280.671, z =54.241+0.05},
    {title="Sup�rette", colour=43, id=52, x =1729.216, y =6414.131, z =34.037+0.05},
    {title="Sup�rette", colour=43, id=52, x =1135.808, y =-982.281, z =45.415+0.05},
    {title="Sup�rette", colour=43, id=52, x =-1222.915, y =-906.983, z =11.326+0.05},
    {title="Sup�rette", colour=43, id=52, x =-1487.553, y =-379.107, z =39.163+0.05},
    {title="Sup�rette", colour=43, id=52, x =-2968.243, y =390.910, z =14.043+0.05},
    {title="Sup�rette", colour=43, id=52, x =1166.024, y =2708.930, z =37.157+0.05},
    {title="Sup�rette", colour=43, id=52, x =1392.562, y =3604.648, z =33.980+0.05},
    {title="Sup�rette", colour=43, id=52, x =-48.519, y =-1757.514, z =28.421+0.05},
    {title="Sup�rette", colour=43, id=52, x =1163.373, y =-323.801, z =68.205+0.05},
    {title="Sup�rette", colour=43, id=52, x =-707.501, y =-914.260, z =18.215+0.05},
    {title="Sup�rette", colour=43, id=52, x =-1820.523, y =792.518, z =137.118+0.05},
    {title="Sup�rette", colour=43, id=52, x =1698.388, y =4924.404, z =41.063+0.05},
    {title="Sup�rette", colour=43, id=52, x =-1037.627, y =-2737.861, z =19.169+0.05}]]
}

Citizen.CreateThread(function()
    for _, v in pairs(SuperetteBlip) do
        v.blip = AddBlipForCoord(v.x, v.y, v.z)
        SetBlipSprite(v.blip, v.id)
        SetBlipDisplay(v.blip, 4)
        SetBlipScale(v.blip, 0.7)
        SetBlipColour(v.blip, v.colour)
        SetBlipAsShortRange(v.blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(v.title)
        EndTextCommandSetBlipName(v.blip)
    end
end)