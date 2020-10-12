------------------------------------------------------------------------------
--
-- Ce travail est sous liscence:
-- Creative Commons Attribution-NonCommercial-NoDerivatives-NoDistribution 4.0 International License.
--
------------------------------------------------------------------------------

local identitycreatorMenu = NativeUI.CreateMenu("","Créer une carte d'identité")
_menuPool:Add(identitycreatorMenu)

local function MainMenu(menu)

    local CreateIDCard = NativeUI.CreateItem("Créer sa carte d'identité", "Créer une carte d'identité avec ces informations\npersonnelles.")
    CreateIDCard:RightLabel("~g~15$")
    menu:AddItem(CreateIDCard)

    menu.OnItemSelect = function(menu, item)
        if item == CreateIDCard then
           TriggerServerEvent('InitialCore:RecupPlayerIDCardInfo')
        end
    end
end

MainMenu(identitycreatorMenu)
_menuPool:RefreshIndex()

--[[Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if IsControlJustPressed(0, 38) then
            identitycreatorMenu:Visible(not identitycreatorMenu:Visible())
        end
    end
end)]]--