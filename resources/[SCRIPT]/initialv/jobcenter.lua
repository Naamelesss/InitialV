------------------------------------------------------------------------------
--
-- Ce travail est sous liscence:
-- Creative Commons Attribution-NonCommercial-NoDerivatives-NoDistribution 4.0 International License.
--
------------------------------------------------------------------------------

--[[local function SelectJobMenu(menu)
    local DemissionJobItem = NativeUI.CreateItem("Démissionner", "Démissionner de votre métier actuelle.")
    menu:AddItem(DemissionJobItem)
    local CouturierJobItem = NativeUI.CreateItem("Couturier", "Devenez couturier intérimaire")
    menu:AddItem(CouturierJobItem)
    local MinerJobItem = NativeUI.CreateItem("Mineur", "Devenez mineur intérimaire")
    menu:AddItem(MinerJobItem)
    menu.OnItemSelect = function(menu, item)
        if item == DemissionJobItem then
            TriggerServerEvent('InitialCore:SetJob', 1, "aucun", 1)
        elseif item == CouturierJobItem then
            TriggerServerEvent('InitialCore:SetJob', 1, "couturier", 1)
        elseif item == MinerJobItem then
            TriggerServerEvent('InitialCore:SetJob', 1, "mineur", 1)
        end
    end
end]]

Citizen.CreateThread(function()
    local JobCenterBlip = AddBlipForCoord(-268.775, -956.510, 31.233)
    SetBlipSprite(JobCenterBlip, 408)
    SetBlipDisplay(JobCenterBlip, 4)
    SetBlipScale(JobCenterBlip, 0.7)
    SetBlipColour(JobCenterBlip, 4)
    SetBlipAsShortRange(JobCenterBlip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Job Center")
    EndTextCommandSetBlipName(JobCenterBlip)
end)

RMenu.Add('jobcenter', 'main', RageUI.CreateMenu("Job center", "~b~Métiers intérimaire"))

Citizen.CreateThread(function()
    while true do
        Wait(1)
        local VDistP = Vdist2(GetEntityCoords(GetPlayerPed(-1)), -268.775, -956.510, 31.233)
        if VDistP < 500.0 then
            if VDistP < 10.0 then
                HelpNotif('Appuyez sur ~INPUT_PICKUP~ pour accéder au Job Center.')
                if IsControlJustPressed(1, 38) then
                    RageUI.Visible(RMenu:Get('jobcenter', 'main'), true)
                    local IsJobCenterMenuOpened = true
                    while IsJobCenterMenuOpened do
                        Wait(1)
                        if not RageUI.Visible(RMenu:Get('jobcenter', 'main')) then
                            IsJobCenterMenuOpened = false
                        end
                        RageUI.IsVisible(RMenu:Get('jobcenter', 'main'), true, true, true, function()
                            RageUI.Button("Démissionner", "DESC", {}, true, function(_,_,Selected)
                                if Selected then
                                    TriggerServerEvent('InitialCore:SetJob', 1, "aucun", 1)
                                    AdvancedNotif('Job center', 'Métier', 'Vous avez démissionné de tout vos métiers.', 'CHAR_WE', 'INITIALV')
                                end
                            end)
                            RageUI.Button("Mineur", "DESC", {}, true, function(_,_,Selected)
                                if Selected then
                                    TriggerServerEvent('InitialCore:SetJob', 1, "mineur", 1)
                                    AdvancedNotif('Job center', 'Métier', 'Vous avez rejoint le métier mineur.', 'CHAR_WE', 'INITIALV')
                                end
                            end)
                            RageUI.Button("Paysagiste", "DESC", {}, true, function(_,_,Selected)
                                if Selected then
                                    TriggerServerEvent('InitialCore:SetJob', 1, "paysagiste", 1)
                                    AdvancedNotif('Job center', 'Métier', 'Vous avez rejoint le métier paysagiste.', 'CHAR_WE', 'INITIALV')
                                end
                            end)
                        end)
                    end
                end
            end
        else
            Wait(5000)
        end
    end
end)