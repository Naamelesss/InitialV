------------------------------------------------------------------------------
--
-- Ce travail est sous liscence:
-- Creative Commons Attribution-NonCommercial-NoDerivatives-NoDistribution 4.0 International License.
--
------------------------------------------------------------------------------

local ClotheShopOpen = false
local ClotheShopType

--[[local Clothe = {}
Clothe.Haut = {
    [1] = {Bras = {}, Tshirt = {}}
}]]

local PedSexe
local IsPed
local TorsoClothe
local Gants

RegisterNetEvent('ClotheShop:Sexe')
AddEventHandler('ClotheShop:Sexe', function(PedSexe2, IsPed2)
    PedSexe = PedSexe2
    IsPed = IsPed2
    RefreshClotheShop()
end)

local Variation1 = 0
local Variation2 = 0
local Variation3 = 0
local Variation4 = 0
local Variation4C = 0
local Variation5 = 0
local Variation5C = 0
local Variation6 = 0
local Variation6C = 0
local Variation7 = 0
local Variation7C = 0
local Variation9 = 0
local Variation10 = 0
local Variation11 = 0
local Variation12 = 0
local Variation12C = 0

local LastActive
local LastActiveGant
local LastActivePantalon
local CouleurPantalon = {}
local CouleurPantalonIndex = {}

local LastActiveChaussure
local CouleurChaussure = {}
local CouleurChaussureIndex = {}

local LastTorse
local CouleurTorse = {}
local CouleurTorseIndex = {}

local CouleurTshirt = {}
local CouleurTshirtIndex = {}

local CouleurGant = {}
local CouleurGantIndex = {}

local CouleurLunette = {}
local CouleurLunetteIndex = {}

local CouleurChapeau = {}
local CouleurChapeauIndex = {}

function RefreshClotheShop()
    print('refreshclothe')
    Wait(2000)
    if PedSexe == 1 then
        local TorsoClothe2 = LoadResourceFile(GetCurrentResourceName(), "male_torsos.json")
        TorsoClothe = json.decode(TorsoClothe2)
        Gants = {
            [0] = {0, 19, 30, 41, 52, 63, 74, 85, 99, 138, 151},
            [1] = {1, 20, 31, 42, 53, 64 , 75, 86, 100, 139, 152},
            --[2] = {2, 21, 32, 43, 54, 65 , 76, 87, 101, 140, 153},
            --[4] = {4, 22, 33, 44, 55, 66 , 77, 88, 102, 141, 154},
            [5] = {5, 23, 34, 45, 56, 67 , 78, 89, 103, 142, 155},
            --[6] = {6, 24, 35, 46, 57, 68 , 79, 90, 104, 143, 156},
            [8] = {8, 25, 36, 47, 58, 69 , 80, 91, 105, 144, 157},
            [11] = {11, 26, 37, 48, 59, 70, 81, 92, 106, 145, 158},
            [12] = {12, 27, 38, 49, 60, 71, 82, 93, 107, 146, 159},
            --[14] = {14, 28, 39, 50, 61, 72, 83, 94, 108, 147, 160},
            [15] = {15, 29, 40, 51, 62, 73, 84, 95, 136, 137},
        }
    else
        local TorsoClothe3 = LoadResourceFile(GetCurrentResourceName(), "female_torsos.json")
        TorsoClothe = json.decode(TorsoClothe3)
    end
    Wait(2000)
    for i = 0, GetNumberOfPedDrawableVariations(GetPlayerPed(-1), 4)-1 do
        CouleurPantalon[i] = {}
        for v = 0, GetNumberOfPedTextureVariations(GetPlayerPed(-1), 4, i)-1 do
            table.insert(CouleurPantalon[i], "Couleur")
        end
    end
    for i = 0, GetNumberOfPedDrawableVariations(GetPlayerPed(-1), 6)-1 do
        CouleurChaussure[i] = {}
        for v = 0, GetNumberOfPedTextureVariations(GetPlayerPed(-1), 6, i)-1 do
            table.insert(CouleurChaussure[i], "Couleur")
        end
    end
    for i = 0, GetNumberOfPedDrawableVariations(GetPlayerPed(-1), 11)-1 do
        CouleurTorse[i] = {}
        for v = 0, GetNumberOfPedTextureVariations(GetPlayerPed(-1), 11, i)-1 do
            table.insert(CouleurTorse[i], "Couleur")
        end
    end
    for i = 0, GetNumberOfPedDrawableVariations(GetPlayerPed(-1), 8)-1 do
        CouleurTshirt[i] = {}
        for v = 0, GetNumberOfPedTextureVariations(GetPlayerPed(-1), 8, i)-1 do
            table.insert(CouleurTshirt[i], "Couleur")
        end
    end
    for i = 0, GetNumberOfPedDrawableVariations(GetPlayerPed(-1), 3)-1 do
        CouleurGant[i] = {}
        for v = 0, GetNumberOfPedTextureVariations(GetPlayerPed(-1), 3, i)-1 do
            table.insert(CouleurGant[i], "Couleur " .. v)
        end
    end
    for i = 0, GetNumberOfPedPropDrawableVariations(GetPlayerPed(-1), 1)-1 do
        CouleurLunette[i] = {}
        for v = 0, GetNumberOfPedPropTextureVariations(GetPlayerPed(-1), 1, i)-1 do
            table.insert(CouleurLunette[i], "Couleur " .. v)
        end
    end
    for i = 0, GetNumberOfPedPropDrawableVariations(GetPlayerPed(-1), 0)-1 do
        CouleurChapeau[i] = {}
        for v = 0, GetNumberOfPedPropTextureVariations(GetPlayerPed(-1), 0, i)-1 do
            table.insert(CouleurChapeau[i], "Couleur " .. v)
        end
    end
    print('fin')
end

--[[Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        local coords = GetEntityCoords(GetPlayerPed(-1))
        local VDistP = Vdist2(coords.x, coords.y, coords.z, 243.308, 211.047, 106.286)
        if VDistP > 500.0 then
           Wait(5000)
        else
            if VDistP < 3.0 then
                HelpNotif('Appuyez sur ~INPUT_PICKUP~ pour intéragir.')
                if IsControlJustPressed(1, 51) then
                    if not ClotheShopOpen then
                        RageUI.Visible(RMenu:Get('clotheshop', 'main'), true)
                        ClotheShopOpen = true
                        ClotheShop()
                    end
                end
            end
        end
    end
end)]]

local ShopZone = {
    -- BINCO 1
    {x= 421.371, y= -807.618, z= 29.491, type= "blip"},
    {x= 429.701, y= -799.043, z= 29.491, type= "haut"},
    {x= 430.707, y= -800.184, z= 29.501, type= "pantalon"},
    {x= 419.712, y= -802.609, z= 29.491, type= "chaussure"},
    {x= 419.810, y= -799.224, z= 29.496, type= "accessoire"},
    {x= 425.463, y= -806.238, z= 29.491, type= "ped"},

    -- BINCO 2
    {x= 78.38370513916, y= -1391.080078125, z= 29.37614440918, type= "blip"},
    {x= 71.407341003418, y= -1400.3609619141, z= 29.376142501831, type= "haut"},
    {x= 80.226898193359, y= -1398.5787353516, z= 29.37614440918, type= "pantalon"},
    {x= 81.407112121582, y= -1396.3972167969, z= 29.376142501831, type= "chaussure"},
    {x= 75.090972900391, y= -1391.2430419922, z= 29.37614440918, type= "accessoire"},
    {x= 75.428955078125, y= -1392.9481201172, z= 29.37614440918, type= "ped"},

    -- PONSONBYS 1
    {x= -709.70068359375, y= -153.34916687012, z= 37.415142059326, type= "ped"},
    {x= -712.61138916016, y= -147.45275878906, z= 37.415142059326, type= "pantalon"},
    {x= -715.09307861328, y= -145.56243896484, z= 37.415142059326, type= "chaussure"},
    {x= -715.35034179688, y= -151.99824523926, z= 37.415142059326, type= "haut"},
    {x= -710.50372314453, y= -157.71493530273, z= 37.415142059326, type= "accessoire"},
    {x= -711.64923095703, y= -154.26280212402, z= 37.415142059326, type= "blip"},

    -- Suburban 1 

    {x= 124.13046264648, y= -219.86343383789, z= 54.557849884033, type= "blip"},
    {x= 123.05528259277, y= -229.83543395996, z= 54.557834625244, type= "pantalon"},
    {x= 121.99448394775, y= -221.69444274902, z= 54.557838439941, type= "haut"},
    {x= 119.0157699585, y= -222.15657043457, z= 54.557838439941, type= "chaussure"},
    {x= 126.84693908691, y= -220.77355957031, z= 54.557838439941, type= "accessoire"},
    {x= 125.65715026855, y= -224.01293945313, z= 54.557838439941, type= "ped"},

    -- oo

    {x= -1192.2921142578, y= -770.62628173828, z= 17.323312759399, type= "haut"},
    {x= -1187.7188720703, y= -764.21026611328, z= 17.319128036499, type= "pantalon"},
    {x= -1188.5139160156, y= -773.08599853516, z= 17.331207275391, type= "chaussure"},
    {x= -1192.9102783203, y= -767.87835693359, z= 17.318651199341, type= "ped"},
    {x= -1195.8049316406, y= -769.00085449219, z= 17.317071914673, type= "accessoire"},
    {x= -1197.2019042969, y= -775.20812988281, z= 17.324531555176, type= "blip"},
}

Citizen.CreateThread(function()
    for k, v in pairs(ShopZone) do
        if v.type == 'blip' then
            ClotheBlip = AddBlipForCoord(v.x, v.y, v.z)
            SetBlipSprite(ClotheBlip, 73)
            SetBlipDisplay(ClotheBlip, 4)
            SetBlipScale(ClotheBlip, 0.7)
            SetBlipColour(ClotheBlip, 70)
            SetBlipAsShortRange(ClotheBlip, true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString("Magasin de vêtements")
            EndTextCommandSetBlipName(ClotheBlip)
        end
    end

    local ClotheShopTemp = 0
    while true do
        Citizen.Wait(1)
        --print('check clothe')
        ClotheShopTemp = 0
        local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
        for k in pairs(ShopZone) do
            if IsPed then
                if ShopZone[k].type == "ped" then
                    local dist = Vdist2(plyCoords.x, plyCoords.y, plyCoords.z, ShopZone[k].x, ShopZone[k].y, ShopZone[k].z)
                    if dist <= 1.5 then
                        ClotheShopTemp = 0
                        if dist > 500.0 then
                            ClotheShopTemp = 1
                        end
                        HelpNotif("Appuyez sur ~INPUT_TALK~ pour interagir.")
                        if IsControlJustPressed(1, 51) then
                            if not ClotheShopOpen then
                                RageUI.Visible(RMenu:Get('clotheshop', 'peds'), true)
                                --ClotheShopType = ShopZone[k].type
                                ClotheShopOpen = true
                                ClotheShop()
                            end
                        end
                    end
                end
            else
                if ShopZone[k].type ~= "ped" then
                    local dist = Vdist2(plyCoords.x, plyCoords.y, plyCoords.z, ShopZone[k].x, ShopZone[k].y, ShopZone[k].z)
                    if dist <= 1.5 then
                        ClotheShopTemp = 0
                        if dist > 500.0 then
                            ClotheShopTemp = 1
                        end
                        HelpNotif("Appuyez sur ~INPUT_TALK~ pour interagir.")
                        if IsControlJustPressed(1, 51) then
                            if not ClotheShopOpen then
                                RageUI.Visible(RMenu:Get('clotheshop', 'main'), true)
                                ClotheShopType = ShopZone[k].type
                                ClotheShopOpen = true
                                ClotheShop()
                            end
                        end
                    end
                end
            end
        end
        if ClotheShopTemp == 1 then
            Wait(5000)
        end
    end
end)

RMenu.Add('clotheshop', 'main', RageUI.CreateMenu("Vêtements", "~b~Magasin"))
RMenu.Add('clotheshop', 'haut', RageUI.CreateSubMenu(RMenu:Get('clotheshop', 'main'), "Vêtements", "~b~HAUT"))
RMenu.Add('clotheshop', 'tshirt', RageUI.CreateSubMenu(RMenu:Get('clotheshop', 'main'), "Vêtements", "~b~T-SHIRT"))
RMenu.Add('clotheshop', 'pantalon', RageUI.CreateSubMenu(RMenu:Get('clotheshop', 'main'), "Vêtements", "~b~PANTALON"))
RMenu.Add('clotheshop', 'chaussure', RageUI.CreateSubMenu(RMenu:Get('clotheshop', 'main'), "Vêtements", "~b~CHAUSSURE"))
RMenu.Add('clotheshop', 'gant', RageUI.CreateSubMenu(RMenu:Get('clotheshop', 'main'), "Vêtements", "~b~GANT"))
RMenu.Add('clotheshop', 'lunette', RageUI.CreateSubMenu(RMenu:Get('clotheshop', 'main'), "Vêtements", "~b~LUNETTE"))
RMenu.Add('clotheshop', 'chapeau', RageUI.CreateSubMenu(RMenu:Get('clotheshop', 'main'), "Vêtements", "~b~CHAPEAU"))

RMenu.Add('clotheshop', 'peds', RageUI.CreateMenu("Variation", "~b~Magasin"))

function ClotheShop()
    while ClotheShopOpen do
        Citizen.Wait(1)
        if not RageUI.Visible(RMenu:Get('clotheshop', 'peds')) and not RageUI.Visible(RMenu:Get('clotheshop', 'main')) and not RageUI.Visible(RMenu:Get('clotheshop', 'haut')) and not RageUI.Visible(RMenu:Get('clotheshop', 'tshirt')) and not RageUI.Visible(RMenu:Get('clotheshop', 'pantalon')) and not RageUI.Visible(RMenu:Get('clotheshop', 'chaussure')) and not RageUI.Visible(RMenu:Get('clotheshop', 'gant')) and not RageUI.Visible(RMenu:Get('clotheshop', 'lunette')) and not RageUI.Visible(RMenu:Get('clotheshop', 'chapeau')) then
            ClotheShopOpen = false
            Wait(50)
            TriggerEvent('InitialCore:RefreshPerso')
        end
        RageUI.IsVisible(RMenu:Get('clotheshop', 'main'), true, true, true, function()
            if ClotheShopType == 'haut' then
                RageUI.Button("Hauts", "DESC", { RightLabel = ">" }, true, function(_,_,Selected)
                end, RMenu:Get('clotheshop', 'haut'))
                RageUI.Button("T-shirts", "DESC", { RightLabel = ">" }, true, function(_,_,Selected)
                end, RMenu:Get('clotheshop', 'tshirt'))
            elseif ClotheShopType == 'pantalon' then
                RageUI.Button("Pantalons", "DESC", { RightLabel = ">" }, true, function(_,_,Selected)
                end, RMenu:Get('clotheshop', 'pantalon'))
            elseif ClotheShopType == 'chaussure' then
                RageUI.Button("Chaussures", "DESC", { RightLabel = ">" }, true, function(_,_,Selected)
                end, RMenu:Get('clotheshop', 'chaussure'))
            elseif ClotheShopType == 'accessoire' then
                --RageUI.Button("Gants", "DESC", { RightLabel = ">" }, true, function(_,_,Selected)
                --end, RMenu:Get('clotheshop', 'gant'))
                RageUI.Button("Lunettes", "DESC", { RightLabel = ">" }, true, function(_,_,Selected)
                end, RMenu:Get('clotheshop', 'lunette'))
                RageUI.Button("Chapeaux", "DESC", { RightLabel = ">" }, true, function(_,_,Selected)
                end, RMenu:Get('clotheshop', 'chapeau'))
            end
        end)
        RageUI.IsVisible(RMenu:Get('clotheshop', 'peds'), true, true, true, function()
            if GetNumberOfPedDrawableVariations(GetPlayerPed(-1), 0) > 1 then
                RageUI.Slider('Tête', Variation1+1, GetNumberOfPedDrawableVariations(GetPlayerPed(-1), 0), 'DESC', false, {}, true, function(Hovered, Active, Selected, ProgressStart)
                    if Variation1+1 ~= ProgressStart then
                        Variation1 = ProgressStart-1
                        SetPedComponentVariation(GetPlayerPed(-1), 0, Variation1)
                    end
                end)
            end
            if GetNumberOfPedDrawableVariations(GetPlayerPed(-1), 1) > 1 then
                RageUI.Slider('Barbe', Variation2+1, GetNumberOfPedDrawableVariations(GetPlayerPed(-1), 1), 'DESC', false, {}, true, function(Hovered, Active, Selected, ProgressStart)
                    if Variation2+1 ~= ProgressStart then
                        Variation2 = ProgressStart-1
                        SetPedComponentVariation(GetPlayerPed(-1), 1, Variation2)
                    end
                end)
            end
            if GetNumberOfPedDrawableVariations(GetPlayerPed(-1), 2) > 1 then
                RageUI.Slider('Cheveux', Variation3+1, GetNumberOfPedDrawableVariations(GetPlayerPed(-1), 2), 'DESC', false, {}, true, function(Hovered, Active, Selected, ProgressStart)
                    if Variation3+1 ~= ProgressStart then
                        Variation3 = ProgressStart-1
                        SetPedComponentVariation(GetPlayerPed(-1), 2, Variation3)
                    end
                end)
            end
            if GetNumberOfPedDrawableVariations(GetPlayerPed(-1), 3) > 1 then
                RageUI.Slider('Torse', Variation4+1, GetNumberOfPedDrawableVariations(GetPlayerPed(-1), 3), 'DESC', false, {}, true, function(Hovered, Active, Selected, ProgressStart)
                    if Variation4+1 ~= ProgressStart then
                        Variation4 = ProgressStart-1
                        SetPedComponentVariation(GetPlayerPed(-1), 3, Variation4)
                    end
                end)
            end
            if GetNumberOfPedTextureVariations(GetPlayerPed(-1), 3, Variation4) > 1 then
                RageUI.Slider('Couleur torse', Variation4C+1, GetNumberOfPedTextureVariations(GetPlayerPed(-1), 3, Variation4), 'DESC', false, {}, true, function(Hovered, Active, Selected, ProgressStart)
                    if Variation4C+1 ~= ProgressStart then
                        Variation4C = ProgressStart-1
                        SetPedComponentVariation(GetPlayerPed(-1), 3, Variation4, Variation4C)
                    end
                end)
            end
            if GetNumberOfPedDrawableVariations(GetPlayerPed(-1), 11) > 1 then
                RageUI.Slider('Torse 2', Variation12+1, GetNumberOfPedDrawableVariations(GetPlayerPed(-1), 11), 'DESC', false, {}, true, function(Hovered, Active, Selected, ProgressStart)
                    if Variation12+1 ~= ProgressStart then
                        Variation12 = ProgressStart-1
                        SetPedComponentVariation(GetPlayerPed(-1), 11, Variation12)
                    end
                end)
            end
            if GetNumberOfPedTextureVariations(GetPlayerPed(-1), 11, Variation12) > 1 then
                RageUI.Slider('Couleur torse 2', Variation12C+1, GetNumberOfPedTextureVariations(GetPlayerPed(-1), 11, Variation12), 'DESC', false, {}, true, function(Hovered, Active, Selected, ProgressStart)
                    if Variation12C+1 ~= ProgressStart then
                        Variation12C = ProgressStart-1
                        SetPedComponentVariation(GetPlayerPed(-1), 11, Variation12, Variation12C)
                    end
                end)
            end
            if GetNumberOfPedDrawableVariations(GetPlayerPed(-1), 4) > 1 then
                RageUI.Slider('Pantalon', Variation5+1, GetNumberOfPedDrawableVariations(GetPlayerPed(-1), 4), 'DESC', false, {}, true, function(Hovered, Active, Selected, ProgressStart)
                    if Variation5+1 ~= ProgressStart then
                        Variation5 = ProgressStart-1
                        SetPedComponentVariation(GetPlayerPed(-1), 4, Variation5)
                    end
                end)
            end
            if GetNumberOfPedTextureVariations(GetPlayerPed(-1), 4, Variation5) > 1 then
                RageUI.Slider('Couleur pantalon', Variation5C+1, GetNumberOfPedTextureVariations(GetPlayerPed(-1), 4, Variation5), 'DESC', false, {}, true, function(Hovered, Active, Selected, ProgressStart)
                    if Variation5C+1 ~= ProgressStart then
                        Variation5C = ProgressStart-1
                        SetPedComponentVariation(GetPlayerPed(-1), 4, Variation5, Variation5C)
                    end
                end)
            end
            if GetNumberOfPedDrawableVariations(GetPlayerPed(-1), 5) > 1 then
                RageUI.Slider('Gants', Variation6+1, GetNumberOfPedDrawableVariations(GetPlayerPed(-1), 5), 'DESC', false, {}, true, function(Hovered, Active, Selected, ProgressStart)
                    if Variation6+1 ~= ProgressStart then
                        Variation6 = ProgressStart-1
                        SetPedComponentVariation(GetPlayerPed(-1), 5, Variation6)
                    end
                end)
            end
            if GetNumberOfPedTextureVariations(GetPlayerPed(-1), 5, Variation6) > 1 then
                RageUI.Slider('Couleur gants', Variation6C+1, GetNumberOfPedTextureVariations(GetPlayerPed(-1), 5, Variation6), 'DESC', false, {}, true, function(Hovered, Active, Selected, ProgressStart)
                    if Variation6C+1 ~= ProgressStart then
                        Variation6C = ProgressStart-1
                        SetPedComponentVariation(GetPlayerPed(-1), 5, Variation6, Variation6C)
                    end
                end)
            end
            if GetNumberOfPedDrawableVariations(GetPlayerPed(-1), 6) > 1 then
                RageUI.Slider('Chaussure', Variation7+1, GetNumberOfPedDrawableVariations(GetPlayerPed(-1), 6), 'DESC', false, {}, true, function(Hovered, Active, Selected, ProgressStart)
                    if Variation7+1 ~= ProgressStart then
                        Variation7 = ProgressStart-1
                        SetPedComponentVariation(GetPlayerPed(-1), 6, Variation7)
                    end
                end)
            end
            if GetNumberOfPedTextureVariations(GetPlayerPed(-1), 6, Variation7) > 1 then
                RageUI.Slider('Couleur chaussure', Variation7C+1, GetNumberOfPedTextureVariations(GetPlayerPed(-1), 6, Variation6), 'DESC', false, {}, true, function(Hovered, Active, Selected, ProgressStart)
                    if Variation7C+1 ~= ProgressStart then
                        Variation7C = ProgressStart-1
                        SetPedComponentVariation(GetPlayerPed(-1), 6, Variation7, Variation7C)
                    end
                end)
            end
            --[[if GetNumberOfPedDrawableVariations(GetPlayerPed(-1), 8) > 1 then
                RageUI.Slider('Accessoire', Variation9+1, GetNumberOfPedDrawableVariations(GetPlayerPed(-1), 8), 'DESC', false, {}, true, function(Hovered, Active, Selected, ProgressStart)
                    if Variation9+1 ~= ProgressStart then
                        Variation9 = ProgressStart-1
                        SetPedComponentVariation(GetPlayerPed(-1), 8, Variation9)
                    end
                end)
            end]] -- ##
            --[[if GetNumberOfPedDrawableVariations(GetPlayerPed(-1), 9) > 1 then
                RageUI.Slider('Accessoire #2', Variation10+1, GetNumberOfPedDrawableVariations(GetPlayerPed(-1), 9), 'DESC', false, {}, true, function(Hovered, Active, Selected, ProgressStart)
                    if Variation10+1 ~= ProgressStart then
                        Variation10 = ProgressStart-1
                        SetPedComponentVariation(GetPlayerPed(-1), 9, Variation10)
                    end
                end)
            end]]
            if GetNumberOfPedDrawableVariations(GetPlayerPed(-1), 10) > 1 then
                RageUI.Slider('Sticker & masque', Variation11+1, GetNumberOfPedDrawableVariations(GetPlayerPed(-1), 10), 'DESC', false, {}, true, function(Hovered, Active, Selected, ProgressStart)
                    if Variation11+1 ~= ProgressStart then
                        Variation11 = ProgressStart-1
                        SetPedComponentVariation(GetPlayerPed(-1), 10, Variation11)
                    end
                end)
            end
            RageUI.Button("Valider", "DESC", { RightLabel = ">", Color = { BackgroundColor = {66, 135, 245}, HightLightColor = {0, 98, 255}} }, true, function(Hovered, Active, Selected)
                if Selected then
                    local SkinChange = GetPedSkin()

                    SkinChange.VariationHead = Variation1
                    SkinChange.VariationBeard = Variation2
                    SkinChange.VariationHair = Variation3
                    SkinChange.VariationTorso = Variation4
                    SkinChange.VariationTorsoColor = Variation4C
                    SkinChange.VariationTorso2 = Variation12
                    SkinChange.VariationTorso2Color = Variation12C
                    SkinChange.VariationPants = Variation5
                    SkinChange.VariationPantsColor = Variation5C
                    SkinChange.VariationGloves = Variation6
                    SkinChange.VariationGlovesColor = Variation6C
                    SkinChange.VariationShoes = Variation7
                    SkinChange.VariationShoesColor = Variation7C
                    SkinChange.VariationMisc1 = Variation9
                    SkinChange.VariationMisc2 = Variation10
                    SkinChange.VariationMisc3 = Variation11 
                    
                    TriggerEvent('InitialCore:SavePerso', SkinChange)

                    RageUI:GoBack()

                    AdvancedNotif('Vêtement', 'Sauvegarde', 'Votre personnage a été sauvegardé.', 'CHAR_WE', 'INITIALV')
                end
            end)
        end)
        if ClotheShopType == 'haut' then
            RageUI.IsVisible(RMenu:Get('clotheshop', 'haut'), true, true, true, function()
                local DrawClotheButton = {}
                for k in pairs (TorsoClothe) do
                    if not DrawClotheButton[TorsoClothe[k].Top] then
                        DrawClotheButton[TorsoClothe[k].Top] = true
                        --[[RageUI.Button(TorsoClothe[k].Top, "DESC", { }, true, function(Hovered, Active, Selected)
                            if Active and k ~= LastActive then
                                LastActive = k
                                LastTorse = TorsoClothe[LastActive].Top
                                SetPedComponentVariation(GetPlayerPed(-1), 11, TorsoClothe[LastActive].Top)
                                SetPedComponentVariation(GetPlayerPed(-1), 8, TorsoClothe[LastActive].Undershirt)
                                SetPedComponentVariation(GetPlayerPed(-1), 3, TorsoClothe[LastActive].Torso)
                            end
                        end)]]
                        RageUI.List(TorsoClothe[k].Top or "CHARGEMENT", CouleurTorse[TorsoClothe[k].Top], CouleurTorseIndex[k] or 1, "DESC", { RightLabel = '80$' }, true, function(Hovered, Active, Selected, Index) 
                            if Active and k ~= LastActive then
                                CouleurTorseIndex[LastActive or 1] = 1
                                LastActive = k
                                LastTorse = TorsoClothe[LastActive].Top
                                SetPedComponentVariation(GetPlayerPed(-1), 11, TorsoClothe[LastActive].Top)
                                SetPedComponentVariation(GetPlayerPed(-1), 8, TorsoClothe[LastActive].Undershirt)
                                SetPedComponentVariation(GetPlayerPed(-1), 3, TorsoClothe[LastActive].Torso)
                            end
                            if CouleurTorseIndex[k] ~= Index then
                                CouleurTorseIndex[k] = Index
                                SetPedComponentVariation(GetPlayerPed(-1), 11, TorsoClothe[LastActive].Top, CouleurTorseIndex[k]-1)
                            end
                            if Selected then
                                TriggerServerCallback('InitialCore:getMoney', function(money)
                                    if money >= 80 then
                                        local Clothe = {}
                                        Clothe.Type = "Haut"
                                        Clothe.Sexe = PedSexe
                                        Clothe.ID = TorsoClothe[LastActive]._id
                                        Clothe.Torso1 = TorsoClothe[LastActive].Top
                                        Clothe.Torso2 = CouleurTorseIndex[k]-1
                                        TriggerServerEvent('InitialCore:GiveItem', GetPlayerServerId(PlayerId()), "Vetement", 1, Clothe)
                                        TriggerServerEvent('InitialCore:RemoveMoney', GetPlayerServerId(PlayerId()), 80)
                                        AdvancedNotif('Vêtement', 'Achat', 'Vous avez acheté un haut, il est désormais dans votre inventaire.', 'CHAR_WE', 'INITIALV')
                                    else
                                        AdvancedNotif("Supérette", "Erreur", "Vous n'avez pas assez d'argent.", "CHAR_WE", "INITIALV")
                                    end
                                end)
                            end
                        end)
                    end
                end
            end)
            RageUI.IsVisible(RMenu:Get('clotheshop', 'tshirt'), true, true, true, function()
                if LastTorse then
                    for k in pairs (TorsoClothe) do
                        if LastTorse == TorsoClothe[k].Top then
                            RageUI.List(TorsoClothe[k].Undershirt, CouleurTshirt[TorsoClothe[k].Undershirt], CouleurTshirtIndex[k] or 1, "DESC", {}, true, function(Hovered, Active, Selected, Index)
                                if Active and k ~= LastActive then
                                    CouleurTshirtIndex[LastActive or 1] = 1
                                    LastActive = k
                                    SetPedComponentVariation(GetPlayerPed(-1), 8, TorsoClothe[LastActive].Undershirt)
                                    SetPedComponentVariation(GetPlayerPed(-1), 3, TorsoClothe[LastActive].Torso)
                                end
                                if CouleurTshirtIndex[k] ~= Index then
                                    CouleurTshirtIndex[k] = Index
                                    SetPedComponentVariation(GetPlayerPed(-1), 8, TorsoClothe[LastActive].Undershirt, CouleurTshirtIndex[k]-1)
                                end
                                if Selected then
                                    local Clothe2 = {}
                                    Clothe2.Type = "T-Shirt"
                                    Clothe2.Sexe = PedSexe
                                    Clothe2.ID = TorsoClothe[LastActive]._id
                                    Clothe2.Tshirt1 = TorsoClothe[LastActive].Undershirt
                                    Clothe2.Tshirt2 = CouleurTshirtIndex[k]-1
                                    TriggerServerEvent('InitialCore:GiveItem', GetPlayerServerId(PlayerId()), "Vetement", 1, Clothe2)
                                    AdvancedNotif('Vêtement', 'Achat', 'Vous avez acheté un t-shirt, il est désormais dans votre inventaire.', 'CHAR_WE', 'INITIALV')
                                end
                            end)
                            --CouleurTshirt
                            
                            --[[RageUI.Button(TorsoClothe[k]._id, "DESC", { }, true, function(Hovered, Active, Selected)
                                if Active and k ~= LastActive then
                                    LastActive = k
                                    SetPedComponentVariation(GetPlayerPed(-1), 8, TorsoClothe[LastActive].Undershirt)
                                    SetPedComponentVariation(GetPlayerPed(-1), 3, TorsoClothe[LastActive].Torso)
                                end
                            end)]]
                        end
                    end
                else
                    RageUI.Button("Veuillez séléctionner un haut.", "DESC", { }, true, function(Hovered, Active, Selected) end)
                end
            end)
        elseif ClotheShopType == 'pantalon' then
            RageUI.IsVisible(RMenu:Get('clotheshop', 'pantalon'), true, true, true, function()
                for i = 0, GetNumberOfPedDrawableVariations(GetPlayerPed(-1), 4)-1 do
                    if PedSexe == 1 then
                        if i ~= 11 and i ~= 44 and i < 107 then
                            RageUI.List(i, CouleurPantalon[i], CouleurPantalonIndex[i] or 1, "DESC", {}, true, function(Hovered, Active, Selected, Index)
                                if Active and i ~= LastActivePantalon then
                                    CouleurPantalonIndex[LastActivePantalon or 1] = 1
                                    LastActivePantalon = i
                                    SetPedComponentVariation(GetPlayerPed(-1), 4, LastActivePantalon)
                                end
                                if CouleurPantalonIndex[i] ~= Index then
                                    CouleurPantalonIndex[i] = Index
                                    SetPedComponentVariation(GetPlayerPed(-1), 4, LastActivePantalon, CouleurPantalonIndex[i]-1)
                                end
                                if Selected then
                                    local Clothe4 = {}
                                    Clothe4.Type = "Pantalon"
                                    Clothe4.Sexe = 1
                                    Clothe4.Pants1 = LastActivePantalon
                                    Clothe4.Pants2 = CouleurPantalonIndex[i]-1
                                    TriggerServerEvent('InitialCore:GiveItem', GetPlayerServerId(PlayerId()), "Vetement", 1, Clothe4)
                                    AdvancedNotif('Vêtement', 'Achat', 'Vous avez acheté un pantalon, il est désormais dans votre inventaire.', 'CHAR_WE', 'INITIALV')
                                end
                            end)
                        end
                    else
                        if i ~= 13 and i ~= 46 and i < 114 then
                            RageUI.List(i, CouleurPantalon[i], CouleurPantalonIndex[i] or 1, "DESC", {}, true, function(Hovered, Active, Selected, Index)
                                if Active and i ~= LastActivePantalon then
                                    CouleurPantalonIndex[LastActivePantalon or 1] = 1
                                    LastActivePantalon = i
                                    SetPedComponentVariation(GetPlayerPed(-1), 4, LastActivePantalon)
                                end
                                if CouleurPantalonIndex[i] ~= Index then
                                    CouleurPantalonIndex[i] = Index
                                    SetPedComponentVariation(GetPlayerPed(-1), 4, LastActivePantalon, CouleurPantalonIndex[i]-1)
                                end
                                if Selected then
                                    local Clothe4 = {}
                                    Clothe4.Type = "Pantalon"
                                    Clothe4.Sexe = 2
                                    Clothe4.Pants1 = LastActivePantalon
                                    Clothe4.Pants2 = CouleurPantalonIndex[i]-1
                                    TriggerServerEvent('InitialCore:GiveItem', GetPlayerServerId(PlayerId()), "Vetement", 1, Clothe4)
                                    AdvancedNotif('Vêtement', 'Achat', 'Vous avez acheté un pantalon, il est désormais dans votre inventaire.', 'CHAR_WE', 'INITIALV')
                                end
                            end)
                        end
                    end
                end
            end)
        elseif ClotheShopType == 'chaussure' then
            RageUI.IsVisible(RMenu:Get('clotheshop', 'chaussure'), true, true, true, function()
                for i = 0, GetNumberOfPedDrawableVariations(GetPlayerPed(-1), 6)-1 do
                    if PedSexe == 1 then
                        if i ~= 13 and i ~= 33 and i ~= 34 and i < 84 then
                            RageUI.List(i, CouleurChaussure[i], CouleurChaussureIndex[i] or 1, "DESC", {}, true, function(Hovered, Active, Selected, Index)
                                if Active and i ~= LastActiveChaussure then
                                    CouleurChaussureIndex[LastActiveChaussure or 1] = 1
                                    LastActiveChaussure = i
                                    SetPedComponentVariation(GetPlayerPed(-1), 6, LastActiveChaussure)
                                end
                                if CouleurChaussureIndex[i] ~= Index then
                                    CouleurChaussureIndex[i] = Index
                                    SetPedComponentVariation(GetPlayerPed(-1), 6, LastActiveChaussure, CouleurChaussureIndex[i]-1)
                                end
                                if Selected then
                                    local Clothe5 = {}
                                    Clothe5.Type = "Chaussure"
                                    Clothe5.Sexe = 1
                                    Clothe5.Shoes1 = LastActiveChaussure
                                    Clothe5.Shoes2 = CouleurChaussureIndex[i]-1
                                    TriggerServerEvent('InitialCore:GiveItem', GetPlayerServerId(PlayerId()), "Vetement", 1, Clothe5)
                                    AdvancedNotif('Vêtement', 'Achat', 'Vous avez acheté une paire de chaussure, elle est désormais dans votre inventaire.', 'CHAR_WE', 'INITIALV')
                                end
                            end)
                        end
                    else
                        if i ~= 12 and i ~= 34 and i ~= 35 and i < 88 then
                            RageUI.List(i, CouleurChaussure[i], CouleurChaussureIndex[i] or 1, "DESC", {}, true, function(Hovered, Active, Selected, Index)
                                if Active and i ~= LastActiveChaussure then
                                    CouleurChaussureIndex[LastActiveChaussure or 1] = 1
                                    LastActiveChaussure = i
                                    SetPedComponentVariation(GetPlayerPed(-1), 6, LastActiveChaussure)
                                end
                                if CouleurChaussureIndex[i] ~= Index then
                                    CouleurChaussureIndex[i] = Index
                                    SetPedComponentVariation(GetPlayerPed(-1), 6, LastActiveChaussure, CouleurChaussureIndex[i]-1)
                                end
                                if Selected then
                                    local Clothe5 = {}
                                    Clothe5.Type = "Chaussure"
                                    Clothe5.Sexe = 2
                                    Clothe5.Shoes1 = LastActiveChaussure
                                    Clothe5.Shoes2 = CouleurChaussureIndex[i]-1
                                    TriggerServerEvent('InitialCore:GiveItem', GetPlayerServerId(PlayerId()), "Vetement", 1, Clothe5)
                                    AdvancedNotif('Vêtement', 'Achat', 'Vous avez acheté une paire de chaussure, elle est désormais dans votre inventaire.', 'CHAR_WE', 'INITIALV')
                                end
                            end)
                        end
                    end
                end
            end)
        elseif ClotheShopType == 'accessoire' then
            RageUI.IsVisible(RMenu:Get('clotheshop', 'gant'), true, true, true, function()
                local brasause
                local gantvaria = GetPedDrawableVariation(GetPlayerPed(-1), 3)
                if PedSexe == 1 then
                    if gantvaria == 0 or gantvaria == 19 or gantvaria == 30 or gantvaria == 41 or gantvaria == 52 or gantvaria == 63 or gantvaria == 74 or gantvaria == 85 or gantvaria == 99 or gantvaria == 138 or gantvaria == 151 then
                        brasause = 0
                    elseif gantvaria == 1 or gantvaria == 20 or gantvaria == 31 or gantvaria == 42 or gantvaria == 53 or gantvaria == 64 or gantvaria == 75 or gantvaria == 86 or gantvaria == 100 or gantvaria == 139 or gantvaria == 152 then
                        brasause = 1
                    elseif gantvaria == 5 or gantvaria == 23 or gantvaria == 34 or gantvaria == 45 or gantvaria == 56 or gantvaria == 67 or gantvaria == 78 or gantvaria == 89 or gantvaria == 103 or gantvaria == 142 or gantvaria == 155 then
                        brasause = 5
                    elseif gantvaria == 8 or gantvaria == 25 or gantvaria == 36 or gantvaria == 47 or gantvaria == 58 or gantvaria == 69 or gantvaria == 80 or gantvaria == 91 or gantvaria == 105 or gantvaria == 144 or gantvaria == 157 then
                        brasause = 8
                    elseif gantvaria == 11 or gantvaria == 26 or gantvaria == 37 or gantvaria == 48 or gantvaria == 59 or gantvaria == 70 or gantvaria == 81 or gantvaria == 92 or gantvaria == 106 or gantvaria == 145 or gantvaria == 158 then
                        brasause = 11
                    elseif gantvaria == 12 or gantvaria == 27 or gantvaria == 38 or gantvaria == 49 or gantvaria == 60 or gantvaria == 71 or gantvaria == 82 or gantvaria == 93 or gantvaria == 107 or gantvaria == 146 or gantvaria == 159 then
                        brasause = 12
                    elseif gantvaria == 15 or gantvaria == 29 or gantvaria == 40 or gantvaria == 51 or gantvaria == 62 or gantvaria == 73 or gantvaria == 84 or gantvaria == 95 or gantvaria == 109 or gantvaria == 136 or gantvaria == 137 then
                        brasause = 15
                    end
                else
                    -- ##
                end
                for z, y in pairs (Gants[brasause]) do
                    if z ~= 1 then
                        RageUI.List(y, CouleurGant[y], CouleurGantIndex[y] or 1, "DESC", {}, true, function(Hovered, Active, Selected, Index)
                            if Active and y ~= LastActiveGant then
                                CouleurGantIndex[LastActiveGant or 1] = 1
                                LastActiveGant = y
                                SetPedComponentVariation(GetPlayerPed(-1), 3, LastActiveGant)
                            end
                            if CouleurGantIndex[y] ~= Index then
                                CouleurGantIndex[y] = Index
                                SetPedComponentVariation(GetPlayerPed(-1), 3, LastActiveGant, CouleurGantIndex[y]-1)
                            end
                            if Selected then
                                local Clothe3 = {}
                                Clothe3.Type = "Gants"
                                Clothe3.Sexe = PedSexe
                                Clothe3.Arms1ID = z
                                Clothe3.Arms2 = CouleurGantIndex[y]-1
                                TriggerServerEvent('InitialCore:GiveItem', GetPlayerServerId(PlayerId()), "Vetement", 1, Clothe3)
                                AdvancedNotif('Vêtement', 'Achat', 'Vous avez acheté une paire de gants, elle est désormais dans votre inventaire.', 'CHAR_WE', 'INITIALV')
                            end
                        end)
                    end
                end
                --SetPedPropIndex
                    --[[for z in pairs (TorsoClothe) do
                        if GetPedDrawableVariation(GetPlayerPed(-1), 11) == TorsoClothe[z].Top and GetPedDrawableVariation(GetPlayerPed(-1), 8) == TorsoClothe[z].Undershirt then
                            brasause = TorsoClothe[z].Torso
                        end
                    end
                    SetPedComponentVariation(GetPlayerPed(-1), 3, Gants[brasause][data.Arms1ID], data.Arms2data.Arms2, 2)]]
            end)
            RageUI.IsVisible(RMenu:Get('clotheshop', 'lunette'), true, true, true, function()
                for i = 0, GetNumberOfPedPropDrawableVariations(GetPlayerPed(-1), 1)-1 do
                    if PedSexe == 1 then
                        if i ~= 0 and i ~= 6 and i ~= 11 and i ~= 14 and i < 26 then
                            RageUI.List(i, CouleurLunette[i], CouleurLunetteIndex[i] or 1, "DESC", {}, true, function(Hovered, Active, Selected, Index)
                                if Active and i ~= LastActiveLunette then
                                    CouleurLunetteIndex[LastActiveLunette or 1] = 1
                                    LastActiveLunette = i
                                    SetPedPropIndex(GetPlayerPed(-1), 1, LastActiveLunette)
                                end
                                if CouleurLunetteIndex[i] ~= Index then
                                    CouleurLunetteIndex[i] = Index
                                    SetPedPropIndex(GetPlayerPed(-1), 1, LastActiveLunette, CouleurLunetteIndex[i]-1)
                                end
                                if Selected then
                                    local Clothe6 = {}
                                    Clothe6.Type = "Lunettes"
                                    Clothe6.Sexe = 1
                                    Clothe6.Glasse1 = LastActiveLunette
                                    Clothe6.Glasse2 = CouleurLunetteIndex[i]-1
                                    TriggerServerEvent('InitialCore:GiveItem', GetPlayerServerId(PlayerId()), "Vetement", 1, Clothe6)
                                    AdvancedNotif('Vêtement', 'Achat', 'Vous avez acheté une paire de lunette, elle est désormais dans votre inventaire.', 'CHAR_WE', 'INITIALV')
                                end
                            end)
                        end
                    else
                        if i ~= 5 and i ~= 12 and i ~= 13 and i ~= 15 and i < 28 then
                            RageUI.List(i, CouleurLunette[i], CouleurLunetteIndex[i] or 1, "DESC", {}, true, function(Hovered, Active, Selected, Index)
                                if Active and i ~= LastActiveLunette then
                                    CouleurLunetteIndex[LastActiveLunette or 1] = 1
                                    LastActiveLunette = i
                                    SetPedPropIndex(GetPlayerPed(-1), 1, LastActiveLunette)
                                end
                                if CouleurLunetteIndex[i] ~= Index then
                                    CouleurLunetteIndex[i] = Index
                                    SetPedPropIndex(GetPlayerPed(-1), 1, LastActiveLunette, CouleurLunetteIndex[i]-1)
                                end
                                if Selected then
                                    local Clothe6 = {}
                                    Clothe6.Type = "Lunettes"
                                    Clothe6.Sexe = 2
                                    Clothe6.Glasse1 = LastActiveLunette
                                    Clothe6.Glasse2 = CouleurLunetteIndex[i]-1
                                    TriggerServerEvent('InitialCore:GiveItem', GetPlayerServerId(PlayerId()), "Vetement", 1, Clothe6)
                                    AdvancedNotif('Vêtement', 'Achat', 'Vous avez acheté une paire de lunette, elle est désormais dans votre inventaire.', 'CHAR_WE', 'INITIALV')
                                end
                            end)
                        end
                    end
                end
            end)
            RageUI.IsVisible(RMenu:Get('clotheshop', 'chapeau'), true, true, true, function()
                for i = 0, GetNumberOfPedPropDrawableVariations(GetPlayerPed(-1), 0)-1 do
                    if PedSexe == 1 then
                        if i ~= 8 and i ~= 11 and i ~= 38 and i ~= 46 and i ~= 47 and i ~= 57 and i ~= 111 and (i < 115 or i > 119) and i ~= 121 and (i < 123 or i > 126) and i ~= 129 and i < 133 then
                       --if true then
                            RageUI.List(i, CouleurChapeau[i], CouleurChapeauIndex[i] or 1, "DESC", {}, true, function(Hovered, Active, Selected, Index)
                                if Active and i ~= LastActiveChapeau then
                                    CouleurChapeauIndex[LastActiveChapeau or 1] = 1
                                    LastActiveChapeau = i
                                    SetPedPropIndex(GetPlayerPed(-1), 0, LastActiveChapeau)
                                end
                                if CouleurChapeauIndex[i] ~= Index then
                                    CouleurChapeauIndex[i] = Index
                                    SetPedPropIndex(GetPlayerPed(-1), 0, LastActiveChapeau, CouleurChapeauIndex[i]-1)
                                end
                                if Selected then
                                    local Clothe7 = {}
                                    Clothe7.Type = "Chapeau"
                                    Clothe7.Sexe = 1
                                    Clothe7.Hat1 = LastActiveChapeau
                                    Clothe7.Hat2 = CouleurChapeauIndex[i]-1
                                    TriggerServerEvent('InitialCore:GiveItem', GetPlayerServerId(PlayerId()), "Vetement", 1, Clothe7)
                                    AdvancedNotif('Vêtement', 'Achat', 'Vous avez acheté un chapeau, is est désormais dans votre inventaire.', 'CHAR_WE', 'INITIALV')
                                end
                            end)
                        end
                    else
                        if i ~= 37 and i ~= 45 and i ~= 46 and i ~= 110 and (i < 114 or i > 118) and (i < 122 or i > 125) and i ~= 128 and i < 132 then
                            RageUI.List(i, CouleurChapeau[i], CouleurChapeauIndex[i] or 1, "DESC", {}, true, function(Hovered, Active, Selected, Index)
                                if Active and i ~= LastActiveChapeau then
                                    CouleurChapeauIndex[LastActiveChapeau or 1] = 1
                                    LastActiveChapeau = i
                                    SetPedPropIndex(GetPlayerPed(-1), 0, LastActiveChapeau)
                                end
                                if CouleurChapeauIndex[i] ~= Index then
                                    CouleurChapeauIndex[i] = Index
                                    SetPedPropIndex(GetPlayerPed(-1), 0, LastActiveChapeau, CouleurChapeauIndex[i]-1)
                                end
                                if Selected then
                                    local Clothe7 = {}
                                    Clothe7.Type = "Chapeau"
                                    Clothe7.Sexe = 2
                                    Clothe7.Hat1 = LastActiveChapeau
                                    Clothe7.Hat2 = CouleurChapeauIndex[i]-1
                                    TriggerServerEvent('InitialCore:GiveItem', GetPlayerServerId(PlayerId()), "Vetement", 1, Clothe7)
                                    AdvancedNotif('Vêtement', 'Achat', 'Vous avez acheté un chapeau, is est désormais dans votre inventaire.', 'CHAR_WE', 'INITIALV')
                                end
                            end)
                        end
                    end
                end
            end)

                --[[if LastActive then
                    for k in pairs (Gants[TorsoClothe[LastActive].Torso]) do
                        RageUI.List(Gants[TorsoClothe[LastActive].Torso][k], CouleurGant[Gants[TorsoClothe[LastActive].Torso][k]]--, CouleurGantIndex[k] or 1, "DESC", {}, true, function(Hovered, Active, Selected, Index)
                            --[[if Active and k ~= LastActiveGant then
                                CouleurGantIndex[LastActiveGant or 1] = 1
                                LastActiveGant = k
                                SetPedComponentVariation(GetPlayerPed(-1), 3, Gants[TorsoClothe[LastActive].Torso][k])
                            end
                            if CouleurGantIndex[k] ~= Index then
                                CouleurGantIndex[k] = Index
                                SetPedComponentVariation(GetPlayerPed(-1), 3, Gants[TorsoClothe[LastActive].Torso][k], CouleurGantIndex[k]-1)
                            end
                            if Selected then
                                local Clothe3 = {}
                                Clothe3.Type = "Gants"
                                Clothe3.Sexe = PedSexe
                                Clothe3.ID = LastActiveGant-1
                                --Clothe3.Arms1ID = Gants[TorsoClothe[LastActive].Torso][k]
                                Clothe3.Arms1ID = k-1
                                Clothe3.Arms2 = CouleurGantIndex[k]-1
                                TriggerServerEvent('InitialCore:GiveItem', GetPlayerServerId(PlayerId()), "Vetement", 1, Clothe3)
                            end
                        end)
                    end
                else
                    RageUI.Button("Veuillez séléctionner un haut.", "DESC", { }, true, function(Hovered, Active, Selected) end)
                end]]
                    --[[RageUI.Button(Gants[TorsoClothe[LastActive].Torso][k], "DESC", { }, true, function(Hovered, Active, Selected)
                        if Active and k ~= LastActiveGant then
                            LastActiveGant = k
                            SetPedComponentVariation(GetPlayerPed(-1), 3, Gants[TorsoClothe[LastActive].Torso][k])
                        end
                    end)]]
            --end)
        end
    end
end

RegisterNetEvent('InitialCore:UseClothe')
AddEventHandler('InitialCore:UseClothe', function(data)
    if not IsPed then
        local SkinChange = GetPedSkin()
        --print(SkinChange)
        --local LastGantType = {}
        if data.Sexe == PedSexe then
            if data.Torso1 then
                --[[if GetPedDrawableVariation(GetPlayerPed(-1), 3) >= 15 then
                    for k in pairs (Gants) do
                        for v, y in pairs (Gants[k]) do
                            --[[if LastGantType[v] then
                                LastGantType[v] = LastGantType[v]+1
                            else
                                LastGantType[v] = 1
                            end
                            if y == GetPedDrawableVariation(GetPlayerPed(-1), 3) then
                                print(LastGantType[v])
                            end]]
                        --[[end
                    end]]
                    --CouleurGant2 = GetPedTextureVariation(GetPlayerPed(-1), 3)
                --else
                    --[[for k in pairs (TorsoClothe) do
                        if TorsoClothe[k].Top == data.Torso1 then
                            SetPedComponentVariation(GetPlayerPed(-1), 3, TorsoClothe[k].Torso, 0, 2)
                            SetPedComponentVariation(GetPlayerPed(-1), 8, TorsoClothe[k].Undershirt, 0, 2)
                        end
                    end]]
                --end
                SetPedComponentVariation(GetPlayerPed(-1), 11, data.Torso1, data.Torso2, 2)
                for k in pairs (TorsoClothe) do
                    if TorsoClothe[k]._id == data.ID then
                        SetPedComponentVariation(GetPlayerPed(-1), 3, TorsoClothe[k].Torso, 0, 2)
                        SetPedComponentVariation(GetPlayerPed(-1), 8, TorsoClothe[k].Undershirt, 0, 2)
                        SkinChange.Torso1 = data.Torso1
                        SkinChange.Torso2 = data.Torso2
                        SkinChange.Tshirt1 = TorsoClothe[k].Undershirt
                        SkinChange.Tshirt2 = 0
                        SkinChange.Arms1 = TorsoClothe[k].Torso
                        SkinChange.Arms2 = 0
                    end
                end
                --SetPedComponentVariation(GetPlayerPed(-1), 3, TorsoClothe[k].Torso, 0, 2)
                --SetPedComponentVariation(GetPlayerPed(-1), 8, TorsoClothe[k].Undershirt, 0, 2)
                --SetPedComponentVariation(GetPlayerPed(-1), 11, data.Torso1, data.Torso2, 2)
            end
            if data.Tshirt1 then
                local tshirts1 = 0
                local brasamettres1
                for k in pairs (TorsoClothe) do
                    if TorsoClothe[k].Undershirt == data.Tshirt1 and GetPedDrawableVariation(GetPlayerPed(-1), 11) == TorsoClothe[k].Top then
                        tshirts1 = tshirts1+1
                    end
                    if TorsoClothe[k]._id == data.ID then
                        brasamettres1 = TorsoClothe[k].Torso
                    end
                end
                if tshirts1 > 0 then
                    SetPedComponentVariation(GetPlayerPed(-1), 8, data.Tshirt1, data.Tshirt2, 2)
                    SetPedComponentVariation(GetPlayerPed(-1), 3, brasamettres1, 0, 2)
                    SkinChange.Tshirt1 = data.Tshirt1
                    SkinChange.Tshirt2 = data.Tshirt2
                    SkinChange.Arms1 = brasamettres1
                    SkinChange.Arms2 = 0
                else
                    AdvancedNotif('Vêtement', 'Erreur', 'Ce t-shirt n\'est pas compatible avec le haut actuelle.', 'CHAR_WE', 'INITIALV')
                end
            end
            if data.Arms1ID then
                local brasause
                local gantvaria = GetPedDrawableVariation(GetPlayerPed(-1), 3)
                if gantvaria == 15 or gantvaria == 29 or gantvaria == 40 or gantvaria == 51 or gantvaria == 62 or gantvaria == 73 or gantvaria == 84 or gantvaria == 95 or gantvaria == 109 or gantvaria == 136 or gantvaria == 137 then
                    SetPedComponentVariation(GetPlayerPed(-1), 3, Gants[15][data.Arms1ID], data.Arms2, 2)
                    SkinChange.Arms1 = Gants[15][data.Arms1ID]
                    SkinChange.Arms2 = data.Arms2
                else
                    for z in pairs (TorsoClothe) do
                        if GetPedDrawableVariation(GetPlayerPed(-1), 11) == TorsoClothe[z].Top and GetPedDrawableVariation(GetPlayerPed(-1), 8) == TorsoClothe[z].Undershirt then
                            brasause = TorsoClothe[z].Torso
                        end
                    end
                    --print(brasause)
                    --print(data.Arms1ID)
                    --print(Gants[brasause][data.Arms1ID])
                    SetPedComponentVariation(GetPlayerPed(-1), 3, Gants[brasause][data.Arms1ID], data.Arms2, 2)
                    SkinChange.Arms1 = Gants[brasause][data.Arms1ID]
                    SkinChange.Arms2 = data.Arms2
                end
            end
            if data.Pants1 then
                SetPedComponentVariation(GetPlayerPed(-1), 4, data.Pants1, data.Pants2)
                SkinChange.Pants1 = data.Pants1
                SkinChange.Pants2 = data.Pants2
            end
            if data.Type == "Chaussure" then
                if data.Shoes2 ~= 1 then
                    SetPedComponentVariation(GetPlayerPed(-1), 6, data.Shoes1, data.Shoes2)
                else
                    SetPedComponentVariation(GetPlayerPed(-1), 6, data.Shoes1)
                end
                SkinChange.Shoes1 = data.Shoes1
                SkinChange.Shoes2 = data.Shoes2
            end
            if data.Glasse1 then
                SetPedPropIndex(GetPlayerPed(-1), 1, data.Glasse1, data.Glasse2)
                SkinChange.Glasse1 = data.Glasse1
                SkinChange.Glasse2 = data.Glasse2
            end
            if data.Hat1 then
                SetPedPropIndex(GetPlayerPed(-1), 0, data.Hat1, data.Hat2)
                SkinChange.Hat1 = data.Hat1
                SkinChange.Hat2 = data.Hat2
            end
            if data.Type == "Accessoire" then
                --print('acce')
                --print(data.ID)
                SetPedComponentVariation(GetPlayerPed(-1), 7, data.ID)
                --SkinChange.Accessories = data.ID
            end
            TriggerEvent('InitialCore:SavePerso', SkinChange)
        else
            if PedSexe == 1 then
                AdvancedNotif('Vêtement', 'Erreur', 'Ce vêtement est pour femme.', 'CHAR_WE', 'INITIALV')
            else
                AdvancedNotif('Vêtement', 'Erreur', 'Ce vêtement est pour homme.', 'CHAR_WE', 'INITIALV')
            end
        end
    else
        AdvancedNotif('Vêtement', 'Erreur', 'Vous ne pouvez pas équiper un vêtement en étant un ped.', 'CHAR_WE', 'INITIALV')
    end
end)