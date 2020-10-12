------------------------------------------------------------------------------
--
-- Ce travail est sous liscence:
-- Creative Commons Attribution-NonCommercial-NoDerivatives-NoDistribution 4.0 International License.
--
------------------------------------------------------------------------------

local PlayerSkinVar = false
local SkinAfterShop

function LoadSkinAfterEsp()
    --[[CreateThread(function()
        TriggerServerCallback("getPlayerSkin", function(PlayerSkin2)
            Wait(5500)
            PlayerSkinVar = PlayerSkin2
            --print(PlayerSkin .. "zéé")
            if PlayerSkinVar then
                LoadSkin(PlayerSkin2)
            end
            Wait(2500)
            DoScreenFadeIn(1000)
        end)
    end)]]

    Wait(1500)
    TriggerEvent('InitialCore:RefreshPersoHard')
    Wait(1500)
    DoScreenFadeIn(1000)
end

--[[CreateThread(function()
    while not NetworkIsSessionActive() do
        Wait(500)
    end
    TriggerServerCallback("getPlayerSkin", function(PlayerSkin2)
        DoScreenFadeOut(1000)
        Wait(5500)
        PlayerSkin = PlayerSkin2
        if PlayerSkin then
            LoadSkin(PlayerSkin)
        end
        DoScreenFadeIn(1000)
    end)
end)]]

function GetPedSkin()
    if not PlayerSkinVar then
        TriggerEvent('InitialCore:RefreshPersoHard')
        Wait(1000)
    end
    local PlayerSkin2 = {}
    for k, v in pairs(PlayerSkinVar) do
        PlayerSkin2[k] = v
    end
    return PlayerSkin2
end

RegisterNetEvent('InitialCore:RefreshPersoHard')
AddEventHandler('InitialCore:RefreshPersoHard', function()
    TriggerServerCallback("getPlayerSkin", function(PlayerSkin2)
        PlayerSkinVar = PlayerSkin2
        if PlayerSkinVar then
            LoadSkin(PlayerSkinVar)
        end
    end)
end)

RegisterNetEvent('InitialCore:RefreshPerso')
AddEventHandler('InitialCore:RefreshPerso', function()
    if SkinAfterShop then
        ReloadSkin(SkinAfterShop)
    else
        ReloadSkin(PlayerSkinVar)
    end
end)

function LoadSkin(SkinToLoad2)
    print('load')
    local SkinToLoad = {}
    for k, v in pairs(SkinToLoad2) do
        SkinToLoad[k] = v

       -- print(k .. " : " .. tostring(v))
    end
    --print(SkinToLoad.VariationTorsoColor .. "sss")
    TriggerEvent('ClotheShop:Sexe', SkinToLoad.Sexe, SkinToLoad.UsePed)
    if SkinToLoad.UsePed then
        ped = GetHashKey(SkinToLoad.PedUsed)
        RequestModel(ped)
        while not HasModelLoaded(ped) do 
            RequestModel(ped)
            Citizen.Wait(0)
        end
        SetPlayerModel(PlayerId(), ped)
        SetPedDefaultComponentVariation(PlayerPedId())
        SetModelAsNoLongerNeeded(ped)
        ClearPedProp(PlayerPedId(), 0)

        SetPedComponentVariation(GetPlayerPed(-1), 0, SkinToLoad.VariationHead)
        SetPedComponentVariation(GetPlayerPed(-1), 1, SkinToLoad.VariationBeard)
        SetPedComponentVariation(GetPlayerPed(-1), 2, SkinToLoad.VariationHair)
        SetPedComponentVariation(GetPlayerPed(-1), 3, SkinToLoad.VariationTorso, SkinToLoad.VariationTorsoColor)
        SetPedComponentVariation(GetPlayerPed(-1), 11, SkinToLoad.VariationTorso2, SkinToLoad.VariationTorso2Color)
        SetPedComponentVariation(GetPlayerPed(-1), 4, SkinToLoad.VariationPants, SkinToLoad.VariationPantsColor)
        SetPedComponentVariation(GetPlayerPed(-1), 5, SkinToLoad.VariationGloves, SkinToLoad.VariationGlovesColor)
        SetPedComponentVariation(GetPlayerPed(-1), 6, SkinToLoad.VariationShoes, SkinToLoad.VariationShoesColor)
        SetPedComponentVariation(GetPlayerPed(-1), 8, SkinToLoad.VariationMisc1)
        SetPedComponentVariation(GetPlayerPed(-1), 9, SkinToLoad.VariationMisc2)
        SetPedComponentVariation(GetPlayerPed(-1), 10, SkinToLoad.VariationMisc3)
    else
        if SkinToLoad.Sexe == 1 then
            pedid = GetHashKey("mp_m_freemode_01")
        else
            pedid = GetHashKey("mp_f_freemode_01")
        end
        RequestModel(pedid)
        while not HasModelLoaded(pedid) do 
            RequestModel(pedid)
            Citizen.Wait(0)
        end
        SetPlayerModel(PlayerId(), pedid)
        SetPedDefaultComponentVariation(PlayerPedId())
        SetPedHeadBlendData(PlayerPedId(), SkinToLoad.Mere, SkinToLoad.Pere, nil, SkinToLoad.Mere, SkinToLoad.Pere, nil, SkinToLoad.ShapeMix, SkinToLoad.SkinMix, nil, true)
        SetModelAsNoLongerNeeded(pedid)
        ClearPedProp(PlayerPedId(), 0)

        SetPedFaceFeature(GetPlayerPed(-1), 6, SkinToLoad.ForeheadHeight)
        SetPedFaceFeature(GetPlayerPed(-1), 7, SkinToLoad.ForeheadWidth)
        SetPedFaceFeature(GetPlayerPed(-1), 11, SkinToLoad.EyesSize)
        SetPedFaceFeature(GetPlayerPed(-1), 0, SkinToLoad.NoseWidth)
        SetPedFaceFeature(GetPlayerPed(-1), 1, SkinToLoad.NoseHeight)
        SetPedFaceFeature(GetPlayerPed(-1), 2, SkinToLoad.MidNoseWidth)
        SetPedFaceFeature(GetPlayerPed(-1), 3, SkinToLoad.MidNoseHeight)
        SetPedFaceFeature(GetPlayerPed(-1), 4, SkinToLoad.TipNoseHeight)
        SetPedFaceFeature(GetPlayerPed(-1), 5, SkinToLoad.TipNoseBreak)
        SetPedFaceFeature(GetPlayerPed(-1), 8, SkinToLoad.CheekbonesHeight)
        SetPedFaceFeature(GetPlayerPed(-1), 9, SkinToLoad.CheekbonesWidth)
        SetPedFaceFeature(GetPlayerPed(-1), 10, SkinToLoad.CheeksWidth)
        SetPedFaceFeature(GetPlayerPed(-1), 12, SkinToLoad.LipsWidth)
        SetPedFaceFeature(GetPlayerPed(-1), 13, SkinToLoad.JawHeight)
        SetPedFaceFeature(GetPlayerPed(-1), 14, SkinToLoad.JawWidth)
        SetPedFaceFeature(GetPlayerPed(-1), 15, SkinToLoad.ChinHeight)
        SetPedFaceFeature(GetPlayerPed(-1), 16, SkinToLoad.ChinPosition)
        SetPedFaceFeature(GetPlayerPed(-1), 17, SkinToLoad.ChinShape)
        SetPedFaceFeature(GetPlayerPed(-1), 18, SkinToLoad.ChinWidth)

        SetPedComponentVariation(GetPlayerPed(-1), 2, SkinToLoad.Hair)
        SetPedHairColor(GetPlayerPed(-1), SkinToLoad.HairColor, SkinToLoad.HairColor2)
        SetPedHeadOverlay(GetPlayerPed(-1), 2, SkinToLoad.Eyebrows, SkinToLoad.EyebrowsOpacity)
        SetPedHeadOverlayColor(GetPlayerPed(-1), 2, 1, SkinToLoad.EyebrowsColor, SkinToLoad.EyebrowsColor2)
        SetPedHeadOverlay(GetPlayerPed(-1), 1, SkinToLoad.Beard, SkinToLoad.BeardOpacity)
        SetPedHeadOverlayColor(GetPlayerPed(-1), 1, 1, SkinToLoad.BeardColor, SkinToLoad.BeardColor2)
        SetPedHeadOverlay(GetPlayerPed(-1), 0, SkinToLoad.Blemishes, SkinToLoad.BlemishesOpacity)
        SetPedHeadOverlay(GetPlayerPed(-1), 3, SkinToLoad.Ageing, SkinToLoad.AgeingOpacity)
        SetPedHeadOverlay(GetPlayerPed(-1), 6, SkinToLoad.Complexion, SkinToLoad.ComplexionOpacity)
        SetPedHeadOverlay(GetPlayerPed(-1), 9, SkinToLoad.Freckles, SkinToLoad.FrecklesOpacity)
        SetPedHeadOverlay(GetPlayerPed(-1), 7, SkinToLoad.SkinAspect, SkinToLoad.SkinAspectOpacity)
        SetPedEyeColor(GetPlayerPed(-1), SkinToLoad.EyesColor)
        SetPedHeadOverlay(GetPlayerPed(-1), 4, SkinToLoad.Makeup, SkinToLoad.MakeupOpacity)
        SetPedHeadOverlayColor(GetPlayerPed(-1), 4, 1, SkinToLoad.MakeupColor, SkinToLoad.MakeupColor2)
        SetPedHeadOverlay(GetPlayerPed(-1), 8, SkinToLoad.Lipstick, SkinToLoad.LipstickOpacity)
        SetPedHeadOverlayColor(GetPlayerPed(-1), 8, 2, SkinToLoad.LipstickColor, SkinToLoad.LipstickColor2)

        print(SkinToLoad.Arms1)
        print(SkinToLoad.Arms2)

        print(SkinToLoad.Tshirt1)
        print(SkinToLoad.Tshirt2)

        SetPedComponentVariation(GetPlayerPed(-1), 8, SkinToLoad.Tshirt1, SkinToLoad.Tshirt2, 2)
        SetPedComponentVariation(GetPlayerPed(-1), 4, SkinToLoad.Pants1, SkinToLoad.Pants2, 2)
        SetPedComponentVariation(GetPlayerPed(-1), 6, SkinToLoad.Shoes1, SkinToLoad.Shoes2, 2)
        SetPedComponentVariation(GetPlayerPed(-1), 11, SkinToLoad.Torso1, SkinToLoad.Torso2, 2)
        SetPedComponentVariation(GetPlayerPed(-1), 3, SkinToLoad.Arms1, SkinToLoad.Arms2, 2)

        if SkinToLoad.Glasse1 == -1 then
            ClearPedProp(GetPlayerPed(-1), 1)
        else
            SetPedPropIndex(GetPlayerPed(-1), 1, SkinToLoad.Glasse1, SkinToLoad.Glasse2)
        end
        if SkinToLoad.Hat1 == -1 then
            ClearPedProp(GetPlayerPed(-1), 0)
        else
            SetPedPropIndex(GetPlayerPed(-1), 0, SkinToLoad.Hat1, SkinToLoad.Hat2)
        end
    end
end

function ReloadSkin(SkinToLoad2)
    local SkinToLoad = {}
    for k, v in pairs(SkinToLoad2) do
        SkinToLoad[k] = v
    end
    if SkinToLoad.UsePed then
        SetPedDefaultComponentVariation(PlayerPedId())
        ClearPedProp(PlayerPedId(), 0)

        SetPedComponentVariation(GetPlayerPed(-1), 0, SkinToLoad.VariationHead)
        SetPedComponentVariation(GetPlayerPed(-1), 1, SkinToLoad.VariationBeard)
        SetPedComponentVariation(GetPlayerPed(-1), 2, SkinToLoad.VariationHair)
        SetPedComponentVariation(GetPlayerPed(-1), 3, SkinToLoad.VariationTorso, SkinToLoad.VariationTorsoColor)
        SetPedComponentVariation(GetPlayerPed(-1), 11, SkinToLoad.VariationTorso2, SkinToLoad.VariationTorso2Color)
        SetPedComponentVariation(GetPlayerPed(-1), 4, SkinToLoad.VariationPants, SkinToLoad.VariationPantsColor)
        SetPedComponentVariation(GetPlayerPed(-1), 5, SkinToLoad.VariationGloves, SkinToLoad.VariationGlovesColor)
        SetPedComponentVariation(GetPlayerPed(-1), 6, SkinToLoad.VariationShoes, SkinToLoad.VariationShoesColor)
        SetPedComponentVariation(GetPlayerPed(-1), 8, SkinToLoad.VariationMisc1)
        SetPedComponentVariation(GetPlayerPed(-1), 9, SkinToLoad.VariationMisc2)
        SetPedComponentVariation(GetPlayerPed(-1), 10, SkinToLoad.VariationMisc3)
    else
        SetPedDefaultComponentVariation(PlayerPedId())
        SetPedHeadBlendData(PlayerPedId(), SkinToLoad.Mere, SkinToLoad.Pere, nil, SkinToLoad.Mere, SkinToLoad.Pere, nil, SkinToLoad.ShapeMix, SkinToLoad.SkinMix, nil, true)
        ClearPedProp(PlayerPedId(), 0)

        SetPedFaceFeature(GetPlayerPed(-1), 6, SkinToLoad.ForeheadHeight)
        SetPedFaceFeature(GetPlayerPed(-1), 7, SkinToLoad.ForeheadWidth)
        SetPedFaceFeature(GetPlayerPed(-1), 11, SkinToLoad.EyesSize)
        SetPedFaceFeature(GetPlayerPed(-1), 0, SkinToLoad.NoseWidth)
        SetPedFaceFeature(GetPlayerPed(-1), 1, SkinToLoad.NoseHeight)
        SetPedFaceFeature(GetPlayerPed(-1), 2, SkinToLoad.MidNoseWidth)
        SetPedFaceFeature(GetPlayerPed(-1), 3, SkinToLoad.MidNoseHeight)
        SetPedFaceFeature(GetPlayerPed(-1), 4, SkinToLoad.TipNoseHeight)
        SetPedFaceFeature(GetPlayerPed(-1), 5, SkinToLoad.TipNoseBreak)
        SetPedFaceFeature(GetPlayerPed(-1), 8, SkinToLoad.CheekbonesHeight)
        SetPedFaceFeature(GetPlayerPed(-1), 9, SkinToLoad.CheekbonesWidth)
        SetPedFaceFeature(GetPlayerPed(-1), 10, SkinToLoad.CheeksWidth)
        SetPedFaceFeature(GetPlayerPed(-1), 12, SkinToLoad.LipsWidth)
        SetPedFaceFeature(GetPlayerPed(-1), 13, SkinToLoad.JawHeight)
        SetPedFaceFeature(GetPlayerPed(-1), 14, SkinToLoad.JawWidth)
        SetPedFaceFeature(GetPlayerPed(-1), 15, SkinToLoad.ChinHeight)
        SetPedFaceFeature(GetPlayerPed(-1), 16, SkinToLoad.ChinPosition)
        SetPedFaceFeature(GetPlayerPed(-1), 17, SkinToLoad.ChinShape)
        SetPedFaceFeature(GetPlayerPed(-1), 18, SkinToLoad.ChinWidth)

        SetPedComponentVariation(GetPlayerPed(-1), 2, SkinToLoad.Hair)
        SetPedHairColor(GetPlayerPed(-1), SkinToLoad.HairColor, SkinToLoad.HairColor2)
        SetPedHeadOverlay(GetPlayerPed(-1), 2, SkinToLoad.Eyebrows, SkinToLoad.EyebrowsOpacity)
        SetPedHeadOverlayColor(GetPlayerPed(-1), 2, 1, SkinToLoad.EyebrowsColor, SkinToLoad.EyebrowsColor2)
        SetPedHeadOverlay(GetPlayerPed(-1), 1, SkinToLoad.Beard, SkinToLoad.BeardOpacity)
        SetPedHeadOverlayColor(GetPlayerPed(-1), 1, 1, SkinToLoad.BeardColor, SkinToLoad.BeardColor2)
        SetPedHeadOverlay(GetPlayerPed(-1), 0, SkinToLoad.Blemishes, SkinToLoad.BlemishesOpacity)
        SetPedHeadOverlay(GetPlayerPed(-1), 3, SkinToLoad.Ageing, SkinToLoad.AgeingOpacity)
        SetPedHeadOverlay(GetPlayerPed(-1), 6, SkinToLoad.Complexion, SkinToLoad.ComplexionOpacity)
        SetPedHeadOverlay(GetPlayerPed(-1), 9, SkinToLoad.Freckles, SkinToLoad.FrecklesOpacity)
        SetPedHeadOverlay(GetPlayerPed(-1), 7, SkinToLoad.SkinAspect, SkinToLoad.SkinAspectOpacity)
        SetPedEyeColor(GetPlayerPed(-1), SkinToLoad.EyesColor)
        SetPedHeadOverlay(GetPlayerPed(-1), 4, SkinToLoad.Makeup, SkinToLoad.MakeupOpacity)
        SetPedHeadOverlayColor(GetPlayerPed(-1), 4, 1, SkinToLoad.MakeupColor, SkinToLoad.MakeupColor2)
        SetPedHeadOverlay(GetPlayerPed(-1), 8, SkinToLoad.Lipstick, SkinToLoad.LipstickOpacity)
        SetPedHeadOverlayColor(GetPlayerPed(-1), 8, 2, SkinToLoad.LipstickColor, SkinToLoad.LipstickColor2)

        SetPedComponentVariation(GetPlayerPed(-1), 8, SkinToLoad.Tshirt1, SkinToLoad.Tshirt2, 2)
        SetPedComponentVariation(GetPlayerPed(-1), 4, SkinToLoad.Pants1, SkinToLoad.Pants2, 2)
        SetPedComponentVariation(GetPlayerPed(-1), 6, SkinToLoad.Shoes1, SkinToLoad.Shoes2, 2)
        SetPedComponentVariation(GetPlayerPed(-1), 11, SkinToLoad.Torso1, SkinToLoad.Torso2, 2)
        SetPedComponentVariation(GetPlayerPed(-1), 3, SkinToLoad.Arms1, SkinToLoad.Arms2, 2)

        if SkinToLoad.Glasse1 == -1 then
            ClearPedProp(GetPlayerPed(-1), 1)
        else
            SetPedPropIndex(GetPlayerPed(-1), 1, SkinToLoad.Glasse1, SkinToLoad.Glasse2)
        end
        if SkinToLoad.Hat1 == -1 then
            ClearPedProp(GetPlayerPed(-1), 0)
        else
            SetPedPropIndex(GetPlayerPed(-1), 0, SkinToLoad.Hat1, SkinToLoad.Hat2)
        end
    end
end

RegisterNetEvent('InitialCore:SavePerso')
AddEventHandler('InitialCore:SavePerso', function(skin2)
    TriggerServerEvent('InitialCoreS:SavePerso', skin2)
    SkinAfterShop = skin2
end)