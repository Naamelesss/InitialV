------------------------------------------------------------------------------
--
-- Ce travail est sous liscence:
-- Creative Commons Attribution-NonCommercial-NoDerivatives-NoDistribution 4.0 International License.
--
------------------------------------------------------------------------------

local Prix = {}
Prix.Couteau = 1
Prix.CouteauCranArret = 2
Prix.LampeDePoche = 3
Prix.Batte = 4
Prix.Machette = 5
Prix.SNSPistol = 6
Prix.Pistol = 7
Prix.CombatPistol = 8
Prix.Machete = 5
--
Prix.Chargeur = 2
Prix.WeaLampe = 5
Prix.Poignee = 4
Prix.Silencieux = 5

mainMenu = NativeUI.CreateMenu("","Armes & Accessoires", nil, nil, "shopui_title_gunclub", "shopui_title_gunclub")
_menuPool:Add(mainMenu)

function ShopMenu(menu)
    local gunmenu = _menuPool:AddSubMenu(menu, "Armes", "", nil, "shopui_title_gunclub", "shopui_title_gunclub")
    local accmenu = _menuPool:AddSubMenu(menu, "Accessoires", "", nil, "shopui_title_gunclub", "shopui_title_gunclub")

    local Couteau = NativeUI.CreateItem("Couteau", "Couteau en lame d'acier au carbone à double tranchant")
    local StatisticsPanelCouteau = NativeUI.CreateStatisticsPanel()
    StatisticsPanelCouteau:AddStatistics("Dégats")
    StatisticsPanelCouteau:SetPercentage(1, 15)
    StatisticsPanelCouteau:AddStatistics("Cadence")
    StatisticsPanelCouteau:SetPercentage(2, 20)
    StatisticsPanelCouteau:AddStatistics("Portée")
    StatisticsPanelCouteau:SetPercentage(3, 1)
    Couteau:AddPanel(StatisticsPanelCouteau)
    local HaveCouteau = GetPedWeaponTintIndex(GetPlayerPed(-1), -1716189206)
    if HaveCouteau == 0 then
        Couteau:SetRightBadge(BadgeStyle.Gun)
    else
        Couteau:RightLabel(Prix.Couteau .. "$")
    end
    gunmenu.SubMenu:AddItem(Couteau)

    local CouteauCranArret = NativeUI.CreateItem("Couteau à cran d'arrêt", "Couteaux tranchant qui se mets facilement dans votre poche")
    local StatisticsPanelCouteauCranArret = NativeUI.CreateStatisticsPanel()
    StatisticsPanelCouteauCranArret:AddStatistics("Dégats")
    StatisticsPanelCouteauCranArret:SetPercentage(1, 15)
    StatisticsPanelCouteauCranArret:AddStatistics("Cadence")
    StatisticsPanelCouteauCranArret:SetPercentage(2, 20)
    StatisticsPanelCouteauCranArret:AddStatistics("Portée")
    StatisticsPanelCouteauCranArret:SetPercentage(3, 0)
    CouteauCranArret:AddPanel(StatisticsPanelCouteauCranArret)
    local HaveCouteauCranArret = GetPedWeaponTintIndex(GetPlayerPed(-1), -538741184)
    if HaveCouteauCranArret == 0 then
        CouteauCranArret:SetRightBadge(BadgeStyle.Gun)
    else
        CouteauCranArret:RightLabel(Prix.CouteauCranArret .. "$")
    end
    gunmenu.SubMenu:AddItem(CouteauCranArret)

    local LampeDePoche = NativeUI.CreateItem("Lampe de poche", "Intensifiez votre peur du noir avec cette source de lumière")
    local StatisticsPanelLampeDePoche = NativeUI.CreateStatisticsPanel()
    StatisticsPanelLampeDePoche:AddStatistics("Dégats")
    StatisticsPanelLampeDePoche:SetPercentage(1, 5)
    StatisticsPanelLampeDePoche:AddStatistics("Cadence")
    StatisticsPanelLampeDePoche:SetPercentage(2, 15)
    StatisticsPanelLampeDePoche:AddStatistics("Portée")
    StatisticsPanelLampeDePoche:SetPercentage(3, 0)
    LampeDePoche:AddPanel(StatisticsPanelLampeDePoche)
    local HaveLampeDePoche = GetPedWeaponTintIndex(GetPlayerPed(-1), -1951375401)
    if HaveLampeDePoche == 0 then
        LampeDePoche:SetRightBadge(BadgeStyle.Gun)
    else
        LampeDePoche:RightLabel(Prix.LampeDePoche .. "$")
    end
    gunmenu.SubMenu:AddItem(LampeDePoche)

    local Batte = NativeUI.CreateItem("Batte de baseball", "Batte de baseball en aluminium")
    local StatisticsPanelBatte = NativeUI.CreateStatisticsPanel()
    StatisticsPanelBatte:AddStatistics("Dégats")
    StatisticsPanelBatte:SetPercentage(1, 20)
    StatisticsPanelBatte:AddStatistics("Cadence")
    StatisticsPanelBatte:SetPercentage(2, 10)
    StatisticsPanelBatte:AddStatistics("Portée")
    StatisticsPanelBatte:SetPercentage(3, 1)
    Batte:AddPanel(StatisticsPanelBatte)
    local HaveBatte = GetPedWeaponTintIndex(GetPlayerPed(-1), -1786099057)
    if HaveBatte == 0 then
        Batte:SetRightBadge(BadgeStyle.Gun)
    else
        Batte:RightLabel(Prix.Batte .. "$")
    end
    gunmenu.SubMenu:AddItem(Batte)

    local Machete = NativeUI.CreateItem("Machette", "Redécouvrez la vie simple avec ce couperet.")
    local StatisticsPanelMachete = NativeUI.CreateStatisticsPanel()
    StatisticsPanelMachete:AddStatistics("Dégats")
    StatisticsPanelMachete:SetPercentage(1, 15)
    StatisticsPanelMachete:AddStatistics("Cadence")
    StatisticsPanelMachete:SetPercentage(2, 15)
    StatisticsPanelMachete:AddStatistics("Portée")
    StatisticsPanelMachete:SetPercentage(3, 0)
    Machete:AddPanel(StatisticsPanelMachete)
    local HaveMachete = GetPedWeaponTintIndex(GetPlayerPed(-1), -581044007)
    if HaveMachete == 0 then
        Machete:SetRightBadge(BadgeStyle.Gun)
    else
        Machete:RightLabel(Prix.Machette .. "$")
    end
    gunmenu.SubMenu:AddItem(Machete)

    local SNSPistol = NativeUI.CreateItem("Pistolet SNS", "Petit, puissant et très efficace")
    local StatisticsPanelSNSPistol = NativeUI.CreateStatisticsPanel()
    StatisticsPanelSNSPistol:AddStatistics("Dégats")
    StatisticsPanelSNSPistol:SetPercentage(1, 30)
    StatisticsPanelSNSPistol:AddStatistics("Cadence")
    StatisticsPanelSNSPistol:SetPercentage(2, 40)
    StatisticsPanelSNSPistol:AddStatistics("Précision")
    StatisticsPanelSNSPistol:SetPercentage(3, 40)
    StatisticsPanelSNSPistol:AddStatistics("Portée")
    StatisticsPanelSNSPistol:SetPercentage(4, 20)
    StatisticsPanelSNSPistol:AddStatistics("Capacité chargeur")
    StatisticsPanelSNSPistol:SetPercentage(5, 3)
    SNSPistol:AddPanel(StatisticsPanelSNSPistol)
    local HaveSNSPistol = GetPedWeaponTintIndex(GetPlayerPed(-1), -1076751822)
    if HaveSNSPistol == 0 then
        SNSPistol:SetRightBadge(BadgeStyle.Gun)
    else
        SNSPistol:RightLabel(Prix.SNSPistol .. "$")
    end
    gunmenu.SubMenu:AddItem(SNSPistol)

    local Pistol = NativeUI.CreateItem("Pistolet", "Un pistolet de combat de calibre")
    local StatisticsPanelPistol = NativeUI.CreateStatisticsPanel()
    StatisticsPanelPistol:AddStatistics("Dégats")
    StatisticsPanelPistol:SetPercentage(1, 26)
    StatisticsPanelPistol:AddStatistics("Cadence")
    StatisticsPanelPistol:SetPercentage(2, 40)
    StatisticsPanelPistol:AddStatistics("Précision")
    StatisticsPanelPistol:SetPercentage(3, 40)
    StatisticsPanelPistol:AddStatistics("Portée")
    StatisticsPanelPistol:SetPercentage(4, 25)
    StatisticsPanelPistol:AddStatistics("Capacité chargeur")
    StatisticsPanelPistol:SetPercentage(5, 10)
    Pistol:AddPanel(StatisticsPanelPistol)
    local HavePistol = GetPedWeaponTintIndex(GetPlayerPed(-1), 453432689)
    if HavePistol == 0 then
        Pistol:SetRightBadge(BadgeStyle.Gun)
    else
        Pistol:RightLabel(Prix.Pistol .. "$")
    end
    gunmenu.SubMenu:AddItem(Pistol)

    local CombatPistol = NativeUI.CreateItem("Pistolet de combat", "Un pistolet semi-automatique compact et léger")
    local StatisticsPanelCombatPistol = NativeUI.CreateStatisticsPanel()
    StatisticsPanelCombatPistol:AddStatistics("Dégats")
    StatisticsPanelCombatPistol:SetPercentage(1, 27)
    StatisticsPanelCombatPistol:AddStatistics("Cadence")
    StatisticsPanelCombatPistol:SetPercentage(2, 40)
    StatisticsPanelCombatPistol:AddStatistics("Précision")
    StatisticsPanelCombatPistol:SetPercentage(3, 50)
    StatisticsPanelCombatPistol:AddStatistics("Portée")
    StatisticsPanelCombatPistol:SetPercentage(4, 30)
    StatisticsPanelCombatPistol:AddStatistics("Capacité chargeur")
    StatisticsPanelCombatPistol:SetPercentage(5, 10)
    CombatPistol:AddPanel(StatisticsPanelCombatPistol)
    local HaveCombatPistol = GetPedWeaponTintIndex(GetPlayerPed(-1), 1593441988)
    if HaveCombatPistol == 0 then
        CombatPistol:SetRightBadge(BadgeStyle.Gun)
    else
        CombatPistol:RightLabel(Prix.CombatPistol .. "$")
    end
    gunmenu.SubMenu:AddItem(CombatPistol)

    gunmenu.SubMenu.OnItemSelect = function(menu, item)
        local ret, PlayerMoney = StatGetInt("MP0_WALLET_BALANCE", -1)
        if item == Couteau then
            if HaveCouteau ~= 0 then
                if PlayerMoney >= Prix.Couteau then
                    TriggerServerEvent('InitialCore:TransferMoney', GetPlayerServerId(PlayerId()), 'CONSOLE', Prix.Couteau)
                    GiveWeaponToPed(GetPlayerPed(-1), -1716189206, 0, false, true)
                    Couteau:SetRightBadge(BadgeStyle.Gun)
                    Couteau:RightLabel("")
                    DisplayBoughtScaleform("WEAPON_KNIFE")
                else
                    AdvancedNotif("Ammu-Nation", "Erreur", "Pas assez d'argent.", "CHAR_WE", "INITIALV")
                end
            else
                AdvancedNotif("Ammu-Nation", "Erreur", "Arme déjà possédé.", "CHAR_WE", "INITIALV")
            end
        elseif item == CouteauCranArret then
            if HaveCouteauCranArret ~= 0 then
                if PlayerMoney >= Prix.CouteauCranArret then
                    TriggerServerEvent('InitialCore:TransferMoney', GetPlayerServerId(PlayerId()), 'CONSOLE', Prix.CouteauCranArret)
                    GiveWeaponToPed(GetPlayerPed(-1), -538741184, 0, false, true)
                    CouteauCranArret:SetRightBadge(BadgeStyle.Gun)
                    CouteauCranArret:RightLabel("")
                    DisplayBoughtScaleform("WEAPON_SWITCHBLADE")
                else
                    AdvancedNotif("Ammu-Nation", "Erreur", "Pas assez d'argent.", "CHAR_WE", "INITIALV")
                end
            else
                AdvancedNotif("Ammu-Nation", "Erreur", "Arme déjà possédé.", "CHAR_WE", "INITIALV")
            end
        elseif item == LampeDePoche then
            if HaveLampeDePoche ~= 0 then
                if PlayerMoney >= Prix.LampeDePoche then
                    TriggerServerEvent('InitialCore:TransferMoney', GetPlayerServerId(PlayerId()), 'CONSOLE', Prix.LampeDePoche)
                    GiveWeaponToPed(GetPlayerPed(-1), -1951375401, 0, false, true)
                    LampeDePoche:SetRightBadge(BadgeStyle.Gun)
                    LampeDePoche:RightLabel("")
                    DisplayBoughtScaleform("WEAPON_FLASHLIGHT")
                else
                    AdvancedNotif("Ammu-Nation", "Erreur", "Pas assez d'argent.", "CHAR_WE", "INITIALV")
                end
            else
                AdvancedNotif("Ammu-Nation", "Erreur", "Arme déjà possédé.", "CHAR_WE", "INITIALV")
            end
        elseif item == Batte then
            if HaveBatte ~= 0 then
                if PlayerMoney >= Prix.Batte then
                    TriggerServerEvent('InitialCore:TransferMoney', GetPlayerServerId(PlayerId()), 'CONSOLE', Prix.Batte)
                    GiveWeaponToPed(GetPlayerPed(-1), -1786099057, 0, false, true)
                    LampeDePoche:SetRightBadge(BadgeStyle.Gun)
                    LampeDePoche:RightLabel("")
                    DisplayBoughtScaleform("WEAPON_BAT")
                else
                    AdvancedNotif("Ammu-Nation", "Erreur", "Pas assez d'argent.", "CHAR_WE", "INITIALV")
                end
            else
                AdvancedNotif("Ammu-Nation", "Erreur", "Arme déjà possédé.", "CHAR_WE", "INITIALV")
            end
         --[[       ESX.TriggerServerCallback('alphaws:CheckMoneyBatte', function(hasEnoughMoney)
                    if hasEnoughMoney then
                        GiveWeaponToPed(GetPlayerPed(-1), -1786099057, 0, false, true)
                        Batte:SetRightBadge(BadgeStyle.Gun)
                        Batte:RightLabel("")
                        DisplayBoughtScaleform("WEAPON_BAT")
                    else
                        AdvancedNotif("Ammu-Nation", "Erreur", "Pas assez d'argent.", "CHAR_WE", "INITIALV")
                    end
                end)
            else
                ESX.ShowNotification("~r~Déjà possédé")
            end]]
        elseif item == Machete then
            if HaveMachete ~= 0 then
                if PlayerMoney >= Prix.Machete then
                    TriggerServerEvent('InitialCore:TransferMoney', GetPlayerServerId(PlayerId()), 'CONSOLE', Prix.Machete)
                    GiveWeaponToPed(GetPlayerPed(-1), -581044007, 0, false, true)
                    LampeDePoche:SetRightBadge(BadgeStyle.Gun)
                    LampeDePoche:RightLabel("")
                    DisplayBoughtScaleform("WEAPON_MACHETE")
                else
                    AdvancedNotif("Ammu-Nation", "Erreur", "Pas assez d'argent.", "CHAR_WE", "INITIALV")
                end
            else
                AdvancedNotif("Ammu-Nation", "Erreur", "Arme déjà possédé.", "CHAR_WE", "INITIALV")
            end
                --[[ESX.TriggerServerCallback('alphaws:CheckMoneyMachete', function(hasEnoughMoney)
                    if hasEnoughMoney then
                        GiveWeaponToPed(GetPlayerPed(-1), -581044007, 0, false, true)
                        Machete:SetRightBadge(BadgeStyle.Gun)
                        Machete:RightLabel("")
                        DisplayBoughtScaleform("WEAPON_MACHETE")
                    else
                        AdvancedNotif("Ammu-Nation", "Erreur", "Pas assez d'argent.", "CHAR_WE", "INITIALV")
                    end
                end)
            else
                ESX.ShowNotification("~r~Déjà possédé")
            end]]
        elseif item == SNSPistol then
            if HaveSNSPistol ~= 0 then
                if PlayerMoney >= Prix.SNSPistol then
                    TriggerServerEvent('InitialCore:TransferMoney', GetPlayerServerId(PlayerId()), 'CONSOLE', Prix.SNSPistol)
                    GiveWeaponToPed(GetPlayerPed(-1), -1076751822, 0, false, true)
                    LampeDePoche:SetRightBadge(BadgeStyle.Gun)
                    LampeDePoche:RightLabel("")
                    DisplayBoughtScaleform("WEAPON_SNSPISTOL")
                else
                    AdvancedNotif("Ammu-Nation", "Erreur", "Pas assez d'argent.", "CHAR_WE", "INITIALV")
                end
            else
                AdvancedNotif("Ammu-Nation", "Erreur", "Arme déjà possédé.", "CHAR_WE", "INITIALV")
            end
                --[[ESX.TriggerServerCallback('alphaws:CheckMoneySNSPistol', function(hasEnoughMoney)
                    if hasEnoughMoney then
                        GiveWeaponToPed(GetPlayerPed(-1), -1076751822, 6, false, true)
                        SNSPistol:SetRightBadge(BadgeStyle.Gun)
                        SNSPistol:RightLabel("")
                        DisplayBoughtScaleform("WEAPON_SNSPISTOL")
                    else
                        AdvancedNotif("Ammu-Nation", "Erreur", "Pas assez d'argent.", "CHAR_WE", "INITIALV")
                    end
                end)
            else
                ESX.ShowNotification("~r~Déjà possédé")
            end]]
        elseif item == Pistol then
            if HavePistol ~= 0 then
                if PlayerMoney >= Prix.Pistol then
                    TriggerServerEvent('InitialCore:TransferMoney', GetPlayerServerId(PlayerId()), 'CONSOLE', Prix.Pistol)
                    GiveWeaponToPed(GetPlayerPed(-1), 453432689, 0, false, true)
                    LampeDePoche:SetRightBadge(BadgeStyle.Gun)
                    LampeDePoche:RightLabel("")
                    DisplayBoughtScaleform("WEAPON_PISTOL")
                else
                    AdvancedNotif("Ammu-Nation", "Erreur", "Pas assez d'argent.", "CHAR_WE", "INITIALV")
                end
            else
                AdvancedNotif("Ammu-Nation", "Erreur", "Arme déjà possédé.", "CHAR_WE", "INITIALV")
            end
                --[[ESX.TriggerServerCallback('alphaws:CheckMoneyPistol', function(hasEnoughMoney)
                    if hasEnoughMoney then
                        GiveWeaponToPed(GetPlayerPed(-1), 453432689, 12, false, true)
                        Pistol:SetRightBadge(BadgeStyle.Gun)
                        Pistol:RightLabel("")
                        DisplayBoughtScaleform("WEAPON_PISTOL")
                    else
                        AdvancedNotif("Ammu-Nation", "Erreur", "Pas assez d'argent.", "CHAR_WE", "INITIALV")
                    end
                end)
            else
                ESX.ShowNotification("~r~Déjà possédé")
            end]]
        elseif item == CombatPistol then
            if HaveCombatPistol ~= 0 then
                if PlayerMoney >= Prix.CombatPistol then
                    TriggerServerEvent('InitialCore:TransferMoney', GetPlayerServerId(PlayerId()), 'CONSOLE', Prix.CombatPistol)
                    GiveWeaponToPed(GetPlayerPed(-1), 1593441988, 0, false, true)
                    LampeDePoche:SetRightBadge(BadgeStyle.Gun)
                    LampeDePoche:RightLabel("")
                    DisplayBoughtScaleform("WEAPON_COMBATPISTOL")
                else
                    AdvancedNotif("Ammu-Nation", "Erreur", "Pas assez d'argent.", "CHAR_WE", "INITIALV")
                end
            else
                AdvancedNotif("Ammu-Nation", "Erreur", "Arme déjà possédé.", "CHAR_WE", "INITIALV")
            end
                --[[ESX.TriggerServerCallback('alphaws:CheckMoneyCombatPistol', function(hasEnoughMoney)
                    if hasEnoughMoney then
                        GiveWeaponToPed(GetPlayerPed(-1), 1593441988, 12, false, true)
                        CombatPistol:SetRightBadge(BadgeStyle.Gun)
                        CombatPistol:RightLabel("")
                        DisplayBoughtScaleform("WEAPON_COMBATPISTOL")
                    else
                        AdvancedNotif("Ammu-Nation", "Erreur", "Pas assez d'argent.", "CHAR_WE", "INITIALV")
                    end
                end)
            else
                ESX.ShowNotification("~r~Déjà possédé")
            end]]
        end
    end

    --[[local Chargeur = NativeUI.CreateItem("Chargeur", "")
    Chargeur:RightLabel("50$")
    accmenu.SubMenu:AddItem(Chargeur)
    local WeaLampe = NativeUI.CreateItem("Lampe", "")
    accmenu.SubMenu:AddItem(WeaLampe)
    WeaLampe:RightLabel("175$")
    local Poignee = NativeUI.CreateItem("Poignée", "")
    accmenu.SubMenu:AddItem(Poignee)
    Poignee:RightLabel("350$")
    local Silencieux = NativeUI.CreateItem("Silencieux", "")
    accmenu.SubMenu:AddItem(Silencieux)
    Silencieux:RightLabel("750$")

    accmenu.SubMenu.OnItemSelect = function(menu, item)
        local ret, PlayerMoney = StatGetInt("MP0_WALLET_BALANCE", -1)
        if item == Chargeur then
            if PlayerMoney >= Prix.Chargeur then
                TriggerServerEvent('InitialCore:TransferMoney', GetPlayerServerId(PlayerId()), 'CONSOLE', Prix.Chargeur)
                PlaySoundFrontend(-1, 'WEAPON_AMMO_PURCHASE', 'HUD_AMMO_SHOP_SOUNDSET', false)
                TriggerServerEvent('InitialCore:TransferItem', 'CONSOLE', GetPlayerServerId(PlayerId()), 'chargeur', 1)
            else
                AdvancedNotif("Ammu-Nation", "Erreur", "Pas assez d'argent.", "CHAR_WE", "INITIALV")
            end
            --[[ESX.TriggerServerCallback('alphaws:CheckMoneyChargeur', function(hasEnoughMoney)
                if hasEnoughMoney then
                    PlaySoundFrontend(-1, 'WEAPON_AMMO_PURCHASE', 'HUD_AMMO_SHOP_SOUNDSET', false)
                else
                    AdvancedNotif("Ammu-Nation", "Erreur", "Pas assez d'argent.", "CHAR_WE", "INITIALV")
                end
            end)]]
        --[[elseif item == WeaLampe then
            if PlayerMoney >= Prix.WeaLampe then
                TriggerServerEvent('InitialCore:TransferMoney', GetPlayerServerId(PlayerId()), 'CONSOLE', Prix.WeaLampe)
                PlaySoundFrontend(-1, 'WEAPON_AMMO_PURCHASE', 'HUD_AMMO_SHOP_SOUNDSET', false)
                TriggerServerEvent('InitialCore:TransferItem', 'CONSOLE', GetPlayerServerId(PlayerId()), 'WeaLampe', 1)
            else
                AdvancedNotif("Ammu-Nation", "Erreur", "Pas assez d'argent.", "CHAR_WE", "INITIALV")
            end
            --[[ESX.TriggerServerCallback('alphaws:CheckMoneyWeaLampe', function(hasEnoughMoney)
                if hasEnoughMoney then
                    PlaySoundFrontend(-1, 'WEAPON_AMMO_PURCHASE', 'HUD_AMMO_SHOP_SOUNDSET', false)
                else
                    AdvancedNotif("Ammu-Nation", "Erreur", "Pas assez d'argent.", "CHAR_WE", "INITIALV")
                end
            end)]]
       --[[ elseif item == Poignee then
            if PlayerMoney >= Prix.Poignee then
                TriggerServerEvent('InitialCore:TransferMoney', GetPlayerServerId(PlayerId()), 'CONSOLE', Prix.Poignee)
                PlaySoundFrontend(-1, 'WEAPON_AMMO_PURCHASE', 'HUD_AMMO_SHOP_SOUNDSET', false)
                TriggerServerEvent('InitialCore:TransferItem', 'CONSOLE', GetPlayerServerId(PlayerId()), 'Poignee', 1)
            else
                AdvancedNotif("Ammu-Nation", "Erreur", "Pas assez d'argent.", "CHAR_WE", "INITIALV")
            end
            --[[ESX.TriggerServerCallback('alphaws:CheckMoneyPoignee', function(hasEnoughMoney)
                if hasEnoughMoney then
                    PlaySoundFrontend(-1, 'WEAPON_AMMO_PURCHASE', 'HUD_AMMO_SHOP_SOUNDSET', false)
                else
                    AdvancedNotif("Ammu-Nation", "Erreur", "Pas assez d'argent.", "CHAR_WE", "INITIALV")
                end
            end)]]
      --[[  elseif item == Silencieux then
            if PlayerMoney >= Prix.Silencieux then
                TriggerServerEvent('InitialCore:TransferMoney', GetPlayerServerId(PlayerId()), 'CONSOLE', Prix.Silencieux)
                PlaySoundFrontend(-1, 'WEAPON_AMMO_PURCHASE', 'HUD_AMMO_SHOP_SOUNDSET', false)
                TriggerServerEvent('InitialCore:TransferItem', 'CONSOLE', GetPlayerServerId(PlayerId()), 'silencieux', 1)
            else
                AdvancedNotif("Ammu-Nation", "Erreur", "Pas assez d'argent.", "CHAR_WE", "INITIALV")
            end
            --[[ESX.TriggerServerCallback('alphaws:CheckMoneySilencieux', function(hasEnoughMoney)
                if hasEnoughMoney then
                    PlaySoundFrontend(-1, 'WEAPON_AMMO_PURCHASE', 'HUD_AMMO_SHOP_SOUNDSET', false)
                else
                    AdvancedNotif("Ammu-Nation", "Erreur", "Pas assez d'argent.", "CHAR_WE", "INITIALV")
                end
            end)]]
      --  end
   -- end
end




-- PARTIE BLIP ET ZONE SHOP



function DisplayBoughtScaleform(weaponName)
	local scaleform = IRequestScaleFormMovie('MP_BIG_MESSAGE_FREEMODE')
    local sec = 4

	BeginScaleformMovieMethod(scaleform, 'SHOW_WEAPON_PURCHASED')

	PushScaleformMovieMethodParameterString('Acheté')
    --PushScaleformMovieMethodParameterString(ESX.GetWeaponLabel(weaponName))
--	PushScaleformMovieMethodParameterInt(GetHashKey(weaponName))
	PushScaleformMovieMethodParameterString('')
	PushScaleformMovieMethodParameterInt(100)

	EndScaleformMovieMethod()

    PlaySoundFrontend(-1, 'WEAPON_PURCHASE', 'HUD_AMMO_SHOP_SOUNDSET', false)

	Citizen.CreateThread(function()
		while sec > 0 do
			Citizen.Wait(0)
			sec = sec - 0.01
	
			DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255)
		end
	end)
end

function IRequestScaleFormMovie(movie)
    local _scaleform = RequestScaleformMovie(movie)

	while not HasScaleformMovieLoaded(_scaleform) do
		Citizen.Wait(10)
	end

	return _scaleform
end


local AmmuLocation = {
    {title="Ammu-Nation", colour=49, id=313, x = -661.59,   y = -933.51,  z = 20.9+0.05, h = 180.0},
    {title="Ammu-Nation", colour=49, id=313, x = 809.94,   y = -2159.00,  z = 28.7+0.05, h = 0.0},
    {title="Ammu-Nation", colour=49, id=313, x = 1692.6,   y = 3761.31,  z = 33.8+0.05, h = 226.22},
    {title="Ammu-Nation", colour=49, id=313, x = -331.27,   y = 6085.29,  z = 30.5+0.05, h = 216.10},
    {title="Ammu-Nation", colour=49, id=313, x = 253.68,   y = -51.05,  z = 69.0+0.05, h = 64.15},
    {title="Ammu-Nation", colour=49, id=313, x = 23.15,   y = -1105.70,  z = 28.9+0.02, h = 159.62},
    {title="Ammu-Nation", colour=49, id=313, x = 2567.6,   y = 292.62,  z = 107.8+0.05, h = 0.0},
    {title="Ammu-Nation", colour=49, id=313, x = -1118.71,   y = 2699.99,  z = 17.6+0.05, h = 219.48},
    {title="Ammu-Nation", colour=49, id=313, x = 842.4,   y = -1035.27,  z = 27.2+0.05, h = 0.0}
}

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)

        for k in pairs(AmmuLocation) do
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, AmmuLocation[k].x, AmmuLocation[k].y, AmmuLocation[k].z)

            if dist <= 2.0 then
                HelpNotif("Appuyez sur ~INPUT_TALK~ pour parler avec le vendeur.")
				if IsControlJustPressed(1,51) then 
                    --ESX.TriggerServerCallback('esx_license:checkLicense', function(hasWeaponLicense)
                        --if hasWeaponLicense then
                            mainMenu:Clear()
                            ShopMenu(mainMenu)
                            _menuPool:RefreshIndex()
                            mainMenu:Visible(not mainMenu:Visible())
                        --else
                          --  ESX.ShowAdvancedNotification("Ammu-Nation", "License", "Je ne peut pas vous proposer d'armes sans votre license.", "CHAR_AMMUNATION", 0)
                        --end
                    --end, GetPlayerServerId(PlayerId()), 'weapon')
				end
            end
        end
    end
end)

Citizen.CreateThread(function()
    for _, info in pairs(AmmuLocation) do
        info.blip = AddBlipForCoord(info.x, info.y, info.z)
        SetBlipSprite(info.blip, info.id)
        SetBlipDisplay(info.blip, 4)
        SetBlipScale(info.blip, 0.7)
        SetBlipColour(info.blip, info.colour)
        SetBlipAsShortRange(info.blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(info.title)
        EndTextCommandSetBlipName(info.blip)

        RequestModel(GetHashKey("s_m_y_ammucity_01"))
        while not HasModelLoaded(GetHashKey("s_m_y_ammucity_01")) do
            Wait(1)
        end
        RequestAnimDict("mini@strip_club@idles@bouncer@base")
        while not HasAnimDictLoaded("mini@strip_club@idles@bouncer@base") do
            Wait(1)
        end
        ped =  CreatePed(4, GetHashKey("s_m_y_ammucity_01"), info.x, info.y, info.z, info.h, false, true)
        FreezeEntityPosition(ped, true)
        SetEntityInvincible(ped, true)
        SetBlockingOfNonTemporaryEvents(ped, true)
        TaskPlayAnim(ped,"mini@strip_club@idles@bouncer@base","base", 8.0, 0.0, -1, 1, 0, 0, 0, 0)
    end
end)