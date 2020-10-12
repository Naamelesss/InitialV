------------------------------------------------------------------------------
--
-- Ce travail est sous liscence:
-- Creative Commons Attribution-NonCommercial-NoDerivatives-NoDistribution 4.0 International License.
--
------------------------------------------------------------------------------

couturierVestiaireMenu = NativeUI.CreateMenu("","Vestiaire")
_menuPool:Add(couturierVestiaireMenu)

Citizen.CreateThread(function()
    while true do
        local priseservice = NativeUI.CreateItem("Se mettre en service", "")
        couturierVestiaireMenu:AddItem(priseservice)
        local finservice = NativeUI.CreateItem("Quitter son service", "")
        couturierVestiaireMenu:AddItem(finservice)
        couturierVestiaireMenu.OnItemSelect = function(menu, item)
            if item == priseservice then
                enService = true
            else
                enService = false
            end
        end
        break
    end
end)

local metier
local niveaumetier
local enService = false
local isInMarker = false
local currentZone
local isAnime = false

local ZoneCouturier = {
    {x= 707.147, y= -960.836, z= 30.395, zone= "vestiaire"},
    {x= 245.134, y= 370.564, z= 105.738, zone= "recoltelaine"},
}

local function RefreshBlips()
    if DoesBlipExist(CouturierBlip1) then
        RemoveBlip(CouturierBlip1)
    end
    if DoesBlipExist(CouturierBlip2) then
        RemoveBlip(CouturierBlip2)
    end
    if DoesBlipExist(CouturierBlip3) then
        RemoveBlip(CouturierBlip3)
    end
    if DoesBlipExist(CouturierBlip4) then
        RemoveBlip(CouturierBlip4)
    end
    if DoesBlipExist(CouturierBlip5) then
        RemoveBlip(CouturierBlip5)
    end
    if metier == 'couturier' then
        CouturierBlip1 = AddBlipForCoord(707.147, -960.836, 30.395)
        SetBlipSprite(CouturierBlip1, 366)
        SetBlipDisplay(CouturierBlip1, 4)
        SetBlipScale(CouturierBlip1, 0.7)
        SetBlipColour(CouturierBlip1, 5)
        SetBlipAsShortRange(CouturierBlip1, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString("~y~Vestiaire")
        EndTextCommandSetBlipName(CouturierBlip1)

        CouturierBlip2 = AddBlipForCoord(245.134, 370.564, 105.738)
        SetBlipSprite(CouturierBlip2, 366)
        SetBlipDisplay(CouturierBlip2, 4)
        SetBlipScale(CouturierBlip2, 0.7)
        SetBlipColour(CouturierBlip2, 5)
        SetBlipAsShortRange(CouturierBlip2, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString("~y~Récole de laine")
        EndTextCommandSetBlipName(CouturierBlip2)
    end
end

RegisterNetEvent('InitialCore:LoadJob')
AddEventHandler('InitialCore:LoadJob', function(metier2, niveaumetier2)
    metier = metier2
    niveaumetier = niveaumetier2
    RefreshBlips()
end)

Citizen.CreateThread(function()
    --while metier == 'couturier' do --##/
    while true do
        Wait(0)
        local coords = GetEntityCoords(PlayerPedId())
        for i=1, #ZoneCouturier, 1 do
            local ZoneCouturierMarker = ZoneCouturier[i]
            isInMarker = false

            --############################################################
            local distance = Vdist2(coords, ZoneCouturierMarker.x, ZoneCouturierMarker.y, ZoneCouturierMarker.z)
            if distance < 1.0 then
				isInMarker      = true
                currentZone     = ZoneCouturierMarker.zone
            end
            --############################################################


            --############################################################
            if isInMarker then
                if currentZone == 'vestiaire' then
                    HelpNotif('Appuyez sur ~INPUT_PICKUP~ pour ouvrir le vestiaire.')
                elseif currentZone == 'recoltelaine' then
                    HelpNotif('Appuyez sur ~INPUT_PICKUP~ pour prendre un carton.')
                end

                if IsControlJustPressed(1, 38) then
                    if currentZone == 'vestiaire' then
                        couturierVestiaireMenu:Visible(not couturierVestiaireMenu:Visible())
                    elseif currentZone == 'recoltelaine' then
                        if not isAnime then
                            ToggleCancelEmote(false)
                            isAnime = true
                            prop_name = 'hei_prop_heist_box'
                    
                            local playerPed = PlayerPedId()
                            local x,y,z = table.unpack(GetEntityCoords(playerPed))
                            local prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2, true, true, true)
                            local boneIndex = GetPedBoneIndex(playerPed, 18905)
                            AttachEntityToEntity(prop, playerPed, boneIndex, 0.025, 0.08, 0.255, -145.0, 290.0, 0.0, true, true, false, true, 1, true)
                    
                            if not HasAnimDictLoaded('anim@heists@box_carry@') then
                                RequestAnimDict('anim@heists@box_carry@')
                        
                                while not HasAnimDictLoaded('anim@heists@box_carry@') do
                                    Citizen.Wait(1)
                                end
                            end
                            TaskPlayAnim(playerPed, 'anim@heists@box_carry@', 'idle', 1.0, 1.0, -1, 49, 0, 0, 0, 0)
                            while isAnime do
                                Citizen.Wait(0)
                                if GetClosestVehicle(GetEntityCoords(PlayerPedId()), 3.) ~= 0 then
                                    HelpNotif('Appuyez sur ~INPUT_PICKUP~ pour poser votre carton dans le coffre.')
                                    if IsControlJustPressed(1, 38) then

                                    end
                                else
                                    HelpNotif('Appuyez sur ~INPUT_PICKUP~ pour lâcher votre carton.')
                                    if IsControlJustPressed(1, 38) then
                                        isAnime = false
                                    end
                                end

                            end
                            ClearPedTasks(GetPlayerPed(-1))
                            Wait(500)
                            DeleteObject(prop)
                            ToggleCancelEmote(true)
                        else
                            --##/ TEXT DEJA UN CARTON EN MAIN
                        end
                    end
                end
            else
                --couturierVestiaireMenu:Visible(false)
            end



        end
    end
end)