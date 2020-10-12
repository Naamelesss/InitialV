------------------------------------------------------------------------------
--
-- Ce travail est sous liscence:
-- Creative Commons Attribution-NonCommercial-NoDerivatives-NoDistribution 4.0 International License.
--
------------------------------------------------------------------------------

local WeaponAccessoires = {
    [GetHashKey('WEAPON_PISTOL')] = { silencieux = GetHashKey('component_at_pi_supp_02'), lampe = GetHashKey('COMPONENT_AT_PI_FLSH'), poignee = nil, apparence = GetHashKey('COMPONENT_PISTOL_VARMOD_LUXE') },
    [GetHashKey('WEAPON_PISTOL50')] = { silencieux = GetHashKey('COMPONENT_AT_AR_SUPP_02'), lampe = GetHashKey('COMPONENT_AT_PI_FLSH'), poignee = nil, apparence = GetHashKey('COMPONENT_PISTOL50_VARMOD_LUXE') },
    [GetHashKey('WEAPON_COMBATPISTOL')] = { silencieux = GetHashKey('COMPONENT_AT_PI_SUPP'), lampe = GetHashKey('COMPONENT_AT_PI_FLSH'), poignee = nil, apparence = nil },
    [GetHashKey('WEAPON_APPISTOL')] = { silencieux = GetHashKey('COMPONENT_AT_PI_SUPP'), lampe = GetHashKey('COMPONENT_AT_PI_FLSH'), poignee = nil, apparence = GetHashKey('COMPONENT_APPISTOL_VARMOD_LUXE') },
    [GetHashKey('WEAPON_HEAVYPISTOL')] = { silencieux = GetHashKey('COMPONENT_AT_PI_SUPP'), lampe = GetHashKey('COMPONENT_AT_PI_FLSH'), poignee = nil, apparence = GetHashKey('COMPONENT_HEAVYPISTOL_VARMOD_LUXE') },
    [GetHashKey('WEAPON_VINTAGEPISTOL')] = { silencieux = GetHashKey('COMPONENT_AT_PI_SUPP'), lampe = nil, poignee = nil, apparence = nil },
    [GetHashKey('WEAPON_SMG')] = { silencieux = GetHashKey('COMPONENT_AT_PI_SUPP'), lampe = GetHashKey('COMPONENT_AT_AR_FLSH'), poignee = nil, apparence = GetHashKey('COMPONENT_SMG_VARMOD_LUXE') },
    [GetHashKey('WEAPON_MICROSMG')] = { silencieux = GetHashKey('COMPONENT_AT_AR_SUPP_02'), lampe = GetHashKey('COMPONENT_AT_PI_FLSH'), poignee = nil, apparence = GetHashKey('COMPONENT_MICROSMG_VARMOD_LUXE') },
    [GetHashKey('WEAPON_ASSAULTSMG')] = { silencieux = GetHashKey('COMPONENT_AT_AR_SUPP_02'), lampe = GetHashKey('COMPONENT_AT_AR_FLSH'), poignee = nil, apparence = nil },
    [GetHashKey('WEAPON_ASSAULTRIFLE')] = { silencieux = GetHashKey('COMPONENT_AT_AR_SUPP_02'), lampe = GetHashKey('COMPONENT_AT_AR_FLSH'), poignee = GetHashKey('COMPONENT_AT_AR_AFGRIP'), apparence = GetHashKey('COMPONENT_ASSAULTRIFLE_VARMOD_LUXE') },
    [GetHashKey('WEAPON_CARBINERIFLE')] = { silencieux = GetHashKey('COMPONENT_AT_AR_SUPP'), lampe = GetHashKey('COMPONENT_AT_AR_FLSH'), poignee = GetHashKey('COMPONENT_AT_AR_AFGRIP'), apparence = GetHashKey('COMPONENT_CARBINERIFLE_VARMOD_LUXE') },
    [GetHashKey('WEAPON_ADVANCEDRIFLE')] = { silencieux = GetHashKey('COMPONENT_AT_AR_SUPP'), lampe = GetHashKey('COMPONENT_AT_AR_FLSH'), poignee = nil, apparence = GetHashKey('COMPONENT_ADVANCEDRIFLE_VARMOD_LUXE') },
    [GetHashKey('WEAPON_SPECIALCARBINE')] = { silencieux = GetHashKey('COMPONENT_AT_AR_SUPP_02'), lampe = GetHashKey('COMPONENT_AT_AR_FLSH'), poignee = GetHashKey('COMPONENT_AT_AR_AFGRIP'), apparence = nil },
    [GetHashKey('WEAPON_BULLPUPRIFLE')] = { silencieux = GetHashKey('COMPONENT_AT_AR_SUPP'), lampe = GetHashKey('COMPONENT_AT_AR_FLSH'), poignee = GetHashKey('COMPONENT_AT_AR_AFGRIP'), apparence = nil },
    [GetHashKey('WEAPON_ASSAULTSHOTGUN')] = { silencieux = GetHashKey('COMPONENT_AT_AR_SUPP'), lampe = GetHashKey('COMPONENT_AT_AR_FLSH'), poignee = GetHashKey('COMPONENT_AT_AR_AFGRIP'), apparence = nil },
    [GetHashKey('WEAPON_HEAVYSHOTGUN')] = { silencieux = GetHashKey('COMPONENT_AT_AR_SUPP_02'), lampe = GetHashKey('COMPONENT_AT_AR_FLSH'), poignee = GetHashKey('COMPONENT_AT_AR_AFGRIP'), apparence = nil },
    [GetHashKey('WEAPON_BULLPUPSHOTGUN')] = { silencieux = GetHashKey('COMPONENT_AT_AR_SUPP_02'), lampe = GetHashKey('COMPONENT_AT_AR_FLSH'), poignee = GetHashKey('COMPONENT_AT_AR_AFGRIP'), apparence = nil },
    [GetHashKey('WEAPON_PUMPSHOTGUN')] = { silencieux = GetHashKey('COMPONENT_AT_SR_SUPP'), lampe = GetHashKey('COMPONENT_AT_AR_FLSH'), poignee = nil, apparence = nil },
    [GetHashKey('WEAPON_MARKSMANRIFLE')] = { silencieux = GetHashKey('COMPONENT_AT_AR_SUPP'), lampe = GetHashKey('COMPONENT_AT_AR_FLSH'), poignee = GetHashKey('COMPONENT_AT_AR_AFGRIP'), apparence = nil },
    [GetHashKey('WEAPON_SNIPERRIFLE')] = { silencieux = GetHashKey('COMPONENT_AT_AR_SUPP_02'), lampe = nil, poignee = nil, apparence = nil },
    [GetHashKey('WEAPON_COMBATPDW')] = { silencieux = nil, lampe = GetHashKey('COMPONENT_AT_AR_FLSH'), poignee = GetHashKey('COMPONENT_AT_AR_AFGRIP'), apparence = nil }
}

RegisterNetEvent("InitialCore:useItem")
AddEventHandler("InitialCore:useItem", function(item, data)
	--print(item)
	--print(data.Num)
	--print(item:sub(1, 7))
	if item:sub(1, 7) == 'facture' then -- ##
		--print('cc')
		TriggerEvent('InitialCore:UseFacture', data, item)
	elseif item:sub(1, 7) == "Telepho" then
		TriggerEvent('InitialCore:OpenPhone', data.Num)
	elseif item:sub(1, 7) == "CleVoit" then
		UseCle(data)
	elseif item:sub(1, 7) == "Vetemen" then
		--print('USEVET')
		TriggerEvent('InitialCore:UseClothe', data)
	elseif item:sub(1, 7) == "CarteCr" then
		TriggerEvent('InitialCore:UseCB', data)
	elseif item == "eau" then
		TriggerServerEvent('InitialCore:DeleteItemPlayer', GetPlayerServerId(PlayerId()), "eau", 1)
		DrinkEau()
	elseif item == "menottes" then
		print('menotte')
		print(GetClosestPlayer())
	elseif item == "sandwich" then
		TriggerServerEvent('InitialCore:DeleteItemPlayer', GetPlayerServerId(PlayerId()), "sandwich", 1)
		EatSandwich()
		--LoadAnim("mp_player_inteat@burger")
		--TaskPlayAnim(GetPlayerPed(-1), "mp_player_inteat@burger", "mp_player_int_eat_burger", 2.0, 2.0, -1, 51, 0, false, false, false)
		  --RemoveAnimDict("mp_player_inteat@burger")
	elseif item == "cigarette" then
		TriggerServerEvent('InitialCore:DeleteItemPlayer', GetPlayerServerId(PlayerId()), "cigarette", 1)
		FumeCigarette()
	elseif item == "chocolat" then
		TriggerServerEvent('InitialCore:DeleteItemPlayer', GetPlayerServerId(PlayerId()), "chocolat", 1)
		EatChocolat()
	elseif item == "banane" then
		TriggerServerEvent('InitialCore:DeleteItemPlayer', GetPlayerServerId(PlayerId()), "banane", 1)
        EatOrange() -- c'est pareil
    elseif item == "orange" then
        TriggerServerEvent('InitialCore:DeleteItemPlayer', GetPlayerServerId(PlayerId()), "orange", 1)
        EatOrange()
    elseif item == "cognac" then
        TriggerServerEvent('InitialCore:DeleteItemPlayer', GetPlayerServerId(PlayerId()), "cognac", 1)
        EatCognac()
    elseif item == "ananas" then
        TriggerServerEvent('InitialCore:DeleteItemPlayer', GetPlayerServerId(PlayerId()), "ananas", 1)
        EatAnanas()
    elseif item == "vodka" then
        TriggerServerEvent('InitialCore:DeleteItemPlayer', GetPlayerServerId(PlayerId()), "vodka", 1)
        EatVodka()
    elseif item == "whiskey" then
        TriggerServerEvent('InitialCore:DeleteItemPlayer', GetPlayerServerId(PlayerId()), "whiskey", 1)
        EatWhiskey()
    elseif item == "rhum" then
        TriggerServerEvent('InitialCore:DeleteItemPlayer', GetPlayerServerId(PlayerId()), "rhum", 1)
        EatRhum()
    elseif item == "biere" then
        TriggerServerEvent('InitialCore:DeleteItemPlayer', GetPlayerServerId(PlayerId()), "biere", 1)
        EatBiere()
    elseif item == "saucisson" then
        TriggerServerEvent('InitialCore:DeleteItemPlayer', GetPlayerServerId(PlayerId()), "saucisson", 1)
        EatBrownie()
    elseif item == "brownie" then
        TriggerServerEvent('InitialCore:DeleteItemPlayer', GetPlayerServerId(PlayerId()), "brownie", 1)
        EatBrownie()
    elseif item == "cookie" then
        TriggerServerEvent('InitialCore:DeleteItemPlayer', GetPlayerServerId(PlayerId()), "cookie", 1)
        EatCookie()
    elseif item == "cola" then
        TriggerServerEvent('InitialCore:DeleteItemPlayer', GetPlayerServerId(PlayerId()), "cola", 1)
        EatCola()
    elseif item == "cupcake" then
        TriggerServerEvent('InitialCore:DeleteItemPlayer', GetPlayerServerId(PlayerId()), "cupcake", 1)
        EatCookie()
    elseif item == "popcorn" then
        TriggerServerEvent('InitialCore:DeleteItemPlayer', GetPlayerServerId(PlayerId()), "popcorn", 1)
        EatPopcorn()
    elseif item == "poire" then
        TriggerServerEvent('InitialCore:DeleteItemPlayer', GetPlayerServerId(PlayerId()), "poire", 1)
        EatOrange() -- c'est pareil
    elseif item == "pomme" then
        TriggerServerEvent('InitialCore:DeleteItemPlayer', GetPlayerServerId(PlayerId()), "pomme", 1)
        EatOrange() -- c'est pareil
    elseif item == "sprunk" then
        TriggerServerEvent('InitialCore:DeleteItemPlayer', GetPlayerServerId(PlayerId()), "sprunk", 1)
        EatSprunk()
    elseif item == "bouteilledesprunk" then
        TriggerServerEvent('InitialCore:DeleteItemPlayer', GetPlayerServerId(PlayerId()), "bouteillesprunk", 1)
        EatSprunk2()
    elseif item == "bouteilledecola" then
        TriggerServerEvent('InitialCore:DeleteItemPlayer', GetPlayerServerId(PlayerId()), "bouteillecola", 1)
        EatCola2()
    elseif item == "pain" then
        TriggerServerEvent('InitialCore:DeleteItemPlayer', GetPlayerServerId(PlayerId()), "pain", 1)
        EatSandwich()
    elseif item == "glace" then
        TriggerServerEvent('InitialCore:DeleteItemPlayer', GetPlayerServerId(PlayerId()), "glace", 1)
        EatOrange() -- c'est pareil
    elseif item == "fromage" then
        TriggerServerEvent('InitialCore:DeleteItemPlayer', GetPlayerServerId(PlayerId()), "fromage", 1)
        EatSandwich()
    elseif item == "chips" then
        TriggerServerEvent('InitialCore:DeleteItemPlayer', GetPlayerServerId(PlayerId()), "chips", 1)
        EatChips()
    elseif item == "chipsp" then
        TriggerServerEvent('InitialCore:DeleteItemPlayer', GetPlayerServerId(PlayerId()), "chipsp", 1)
        EatChips()
    elseif item == "lait" then
        TriggerServerEvent('InitialCore:DeleteItemPlayer', GetPlayerServerId(PlayerId()), "lait", 1)
        EatLait()
    elseif item == "donuts" then
        TriggerServerEvent('InitialCore:DeleteItemPlayer', GetPlayerServerId(PlayerId()), "donuts", 1)
        EatDonuts()
    elseif item == "pizza" then
        TriggerEvent("InitialCore:AdvancedNotif", "Initial V", "~r~Arrgh", "~r~Trop froide !", "CHAR_WE", "INITIALV")
    elseif item == "noixdecajou" then
        TriggerServerEvent('InitialCore:DeleteItemPlayer', GetPlayerServerId(PlayerId()), "noixdecajou", 1)
        EatOrange() -- fo trouver
    elseif item == "hamburger" then
        TriggerServerEvent('InitialCore:DeleteItemPlayer', GetPlayerServerId(PlayerId()), "hamburger", 1)
		EatHamburger()
	elseif item == "parapluie" then
		UseParapluie()
	elseif item == "rose" then
		UseRose()
	elseif item == "guitare" then
		UseGuitare()
	elseif item == "kevlar29" then
		UseKevlar29()
	elseif item == "kevlar49" then
		UseKevlar49()
	elseif item == "kevlar129" then
		UseKevlar129()
	elseif item == "chargeur" then
		UseChargeur()
	elseif item == "lampe" then
		UseWeaponItem('lampe')
	elseif item == "silencieux" then
		UseWeaponItem('silencieux')
	elseif item == "poignée" then
		UseWeaponItem('poignee')
	end
end)

local IsAnimated = false

------------------------------------------------------------------------------------------------------------
------------------------------------------------------props-------------------------------------------------
------------------------------------------------------------------------------------------------------------
function UseCle(data)
	if IsPedInAnyVehicle(GetPlayerPed(-1), false) then
		vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)
	else
		vehicle = GetClosestVehicle(GetEntityCoords(GetPlayerPed(-1)), 8.0, 0, 71)
	end
	local lockStatus = GetVehicleDoorLockStatus(vehicle)
	if lockStatus == 1 and GetVehicleNumberPlateText(vehicle) == data then -- unlocked
		SetVehicleDoorsLocked(vehicle, 2)
		PlayVehicleDoorCloseSound(vehicle, 1)
		AdvancedNotif("Initial V", "~r~Inventaire", "Véhicule fermé.", "CHAR_WE", "INITIALV")
	elseif lockStatus == 2 and GetVehicleNumberPlateText(vehicle) == data then -- locked
		SetVehicleDoorsLocked(vehicle, 1)
		PlayVehicleDoorOpenSound(vehicle, 0)
		AdvancedNotif("Initial V", "~r~Inventaire", "Véhicule ouvert.", "CHAR_WE", "INITIALV")
	end
end

function UseChargeur()
	local ped = GetPlayerPed(-1)
	if IsPedArmed(ped, 4) then
		local hash = GetSelectedPedWeapon(ped)
		if hash ~= nil then
			AddAmmoToPed(ped, hash, 12)
			TriggerServerEvent('InitialCore:DeleteItemPlayer', GetPlayerServerId(PlayerId()), "hab_kevlarleger", 1)
			AdvancedNotif("Initial V", "~r~Inventaire", "Vous utilisez un chargeur.", "CHAR_WE", "INITIALV")
		else
			AdvancedNotif("Initial V", "~r~Inventaire", "Vous n'avez pas d'arme en main.", "CHAR_WE", "INITIALV")
		end
	else
		AdvancedNotif("Initial V", "~r~Inventaire", "Vous n'avez pas d'arme en main.", "CHAR_WE", "INITIALV")
	end
end

function UseWeaponItem(type)
	if WeaponAccessoires[GetSelectedPedWeapon(PlayerPedId())] and WeaponAccessoires[GetSelectedPedWeapon(PlayerPedId())][type] then
		if not HasPedGotWeaponComponent(GetPlayerPed(-1), GetSelectedPedWeapon(PlayerPedId()), WeaponAccessoires[GetSelectedPedWeapon(PlayerPedId())][type]) then
			GiveWeaponComponentToPed(GetPlayerPed(-1), GetSelectedPedWeapon(PlayerPedId()), WeaponAccessoires[GetSelectedPedWeapon(PlayerPedId())][type])  
			if type == 'poignee' then type = 'poignée' end
            AdvancedNotif("Initial V", "~r~Inventaire", "Vous avez équipé un(e) " .. type .. ".", "CHAR_WE", "INITIALV")
		else
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetSelectedPedWeapon(PlayerPedId()), WeaponAccessoires[GetSelectedPedWeapon(PlayerPedId())][type])  
            AdvancedNotif("Initial V", "~r~Inventaire", "err.", "CHAR_WE", "INITIALV")
        end
	else
        AdvancedNotif("Initial V", "~r~Inventaire", "err2.", "CHAR_WE", "INITIALV")
    end
end

function FumeCigarette()
	local ped = PlayerPedId()
	TaskStartScenarioInPlace(ped, "WORLD_HUMAN_AA_SMOKE", 0, false)
end

local haskevlar = false

function UseKevlar29()
	haskevlar = false
	local ped = PlayerPedId()
	AddArmourToPed(ped, 15)
	haskevlar = true
	Citizen.CreateThread(function()
		while haskevlar do
			Citizen.Wait(0)
			if GetPedArmour(ped) == 0 then
				TriggerServerEvent('InitialCore:DeleteItemPlayer', GetPlayerServerId(PlayerId()), "hab_kevlarleger", 1)
				haskevlar = false
			end
		end
	end)
end

function UseKevlar49()
	haskevlar = false
	local ped = PlayerPedId()
	AddArmourToPed(ped, 25)
	haskevlar = true
	Citizen.CreateThread(function()
		while haskevlar do
			Citizen.Wait(0)
			if GetPedArmour(ped) == 0 then
				TriggerServerEvent('InitialCore:DeleteItemPlayer', GetPlayerServerId(PlayerId()), "hab_kevlar49", 1)
				haskevlar = false
			end
		end
	end)
end

function UseKevlar129()
	haskevlar = false
	local ped = PlayerPedId()
	AddArmourToPed(ped, 35)
	haskevlar = true
	Citizen.CreateThread(function()
		while haskevlar do
			Citizen.Wait(0)
			if GetPedArmour(ped) == 0 then
				TriggerServerEvent('InitialCore:DeleteItemPlayer', GetPlayerServerId(PlayerId()), "hab_kevlar129", 1)
				haskevlar = false
			end
		end
	end)
end

function UseParapluie()
	if not IsAnimated then
        IsAnimated = true

        local playerPed = PlayerPedId()
        local x,y,z = table.unpack(GetEntityCoords(playerPed))
        local propc = CreateObject(GetHashKey('p_amb_brolly_01'), x, y, z + 0.2, true, true, true)
        local boneIndex = GetPedBoneIndex(playerPed, 18905)
        AttachEntityToEntity(propc, playerPed, boneIndex, 0.15, 0.005, 0.0, 87.0, -20.0, 180.0, true, true, false, true, 1, true)

		if not HasAnimDictLoaded('amb@world_human_drinking@coffee@male@base') then
			RequestAnimDict('amb@world_human_drinking@coffee@male@base')
	
			while not HasAnimDictLoaded('amb@world_human_drinking@coffee@male@base') do
				Citizen.Wait(1)
			end
		end
		TaskPlayAnim(playerPed, 'amb@world_human_drinking@coffee@male@base', 'base', 1.0, 1.0, -1, 49, 0, 0, 0, 0)
		if IsControlJustPressed(0, 73) then
			DeleteObject(propc)
		end
	end
end

function UseRose()
	if not IsAnimated then
        prop_name = 'prop_single_rose'
        IsAnimated = true

        local playerPed = PlayerPedId()
        local x,y,z = table.unpack(GetEntityCoords(playerPed))
        local prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2, true, true, true)
        local boneIndex = GetPedBoneIndex(playerPed, 18905)
        AttachEntityToEntity(prop, playerPed, boneIndex, 0.13, 0.15, 0.0, -100.0, 0.0, -20.0, true, true, false, true, 1, true)

		if not HasAnimDictLoaded('anim@heists@humane_labs@finale@keycards') then
			RequestAnimDict('anim@heists@humane_labs@finale@keycards')
	
			while not HasAnimDictLoaded('anim@heists@humane_labs@finale@keycards') do
				Citizen.Wait(1)
			end
		end
		TaskPlayAnim(playerPed, 'anim@heists@humane_labs@finale@keycards', 'ped_a_enter_loop', 1.0, 1.0, -1, 49, 0, 0, 0, 0)
		if IsControlJustPressed(0, 252) then
			DeleteObject(prop)
		end
	end
end

local function UseGuitare()
	if not IsAnimated then
        prop_name = 'prop_acc_guitar_01'
        IsAnimated = true

        local playerPed = PlayerPedId()
        local x,y,z = table.unpack(GetEntityCoords(playerPed))
        local prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2, true, true, true)
        local boneIndex = GetPedBoneIndex(playerPed, 18905)
        AttachEntityToEntity(prop, playerPed, boneIndex, 0.13, 0.15, 0.0, -100.0, 0.0, -20.0, true, true, false, true, 1, true)

		if not HasAnimDictLoaded('amb@world_human_musician@guitar@male@idle_a') then
			RequestAnimDict('amb@world_human_musician@guitar@male@idle_a')
	
			while not HasAnimDictLoaded('amb@world_human_musician@guitar@male@idle_a') do
				Citizen.Wait(1)
			end
		end
		TaskPlayAnim(playerPed, 'amb@world_human_musician@guitar@male@idle_a', 'idle_b', 1.0, 1.0, -1, 49, 0, 0, 0, 0)
		if IsControlJustPressed(0, 252) then
			DeleteObject(prop)
		end
	end
end

------------------------------------------------------------------------------------------------------------
------------------------------------------------------ALCOOL------------------------------------------------
------------------------------------------------------------------------------------------------------------

function EatCognac()
	if not IsAnimated then
        prop_name = 'prop_bottle_cognac'
        IsAnimated = true

        local playerPed = PlayerPedId()
        local x,y,z = table.unpack(GetEntityCoords(playerPed))
        local prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2, true, true, true)
        local boneIndex = GetPedBoneIndex(playerPed, 18905)
        AttachEntityToEntity(prop, playerPed, boneIndex, 0.14, 0.026, 0.020, 45.0, 175.0, 90.0, true, true, false, true, 1, true)

		if not HasAnimDictLoaded('mp_player_intdrink') then
			RequestAnimDict('mp_player_intdrink')
	
			while not HasAnimDictLoaded('mp_player_intdrink') do
				Citizen.Wait(1)
			end
		end

        TaskPlayAnim(playerPed, 'mp_player_intdrink', 'loop_bottle', 1.0, 1.0, 6000, 49, 0, 0, 0, 0)

		Citizen.Wait(1000)
		TriggerServerEvent('InitialCore:StatusAdd', 'soif', 1)
		Citizen.Wait(1000)
		TriggerServerEvent('InitialCore:StatusAdd', 'soif', 1)
		Citizen.Wait(1000)
		TriggerServerEvent('InitialCore:StatusAdd', 'soif', 1)
		Citizen.Wait(1000)
		TriggerServerEvent('InitialCore:StatusAdd', 'soif', 1)
		Citizen.Wait(1000)
        TriggerServerEvent('InitialCore:StatusAdd', 'soif', 1)
        IsAnimated = false
        DeleteObject(prop)
        SetTimecycleModifier("Drunk")
        Citizen.Wait(90000)
       ClearTimecycleModifier()
	end
end

function EatVodka()
    if not IsAnimated then
        prop_name = 'prop_vodka_bottle'
        IsAnimated = true

        local playerPed = PlayerPedId()
        local x,y,z = table.unpack(GetEntityCoords(playerPed))
        local prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2, true, true, true)
        local boneIndex = GetPedBoneIndex(playerPed, 18905)
        AttachEntityToEntity(prop, playerPed, boneIndex, 0.14, 0.026, 0.020, 45.0, 175.0, 90.0, true, true, false, true, 1, true)

		if not HasAnimDictLoaded('mp_player_intdrink') then
			RequestAnimDict('mp_player_intdrink')
	
			while not HasAnimDictLoaded('mp_player_intdrink') do
				Citizen.Wait(1)
			end
		end

        TaskPlayAnim(playerPed, 'mp_player_intdrink', 'loop_bottle', 1.0, 1.0, 6000, 49, 0, 0, 0, 0)

		Citizen.Wait(1000)
		TriggerServerEvent('InitialCore:StatusAdd', 'soif', 1)
		Citizen.Wait(1000)
		TriggerServerEvent('InitialCore:StatusAdd', 'soif', 1)
		Citizen.Wait(1000)
		TriggerServerEvent('InitialCore:StatusAdd', 'soif', 1)
		Citizen.Wait(1000)
		TriggerServerEvent('InitialCore:StatusAdd', 'soif', 1)
		Citizen.Wait(1000)
        TriggerServerEvent('InitialCore:StatusAdd', 'soif', 1)
        IsAnimated = false
        DeleteObject(prop)
        SetTimecycleModifier("Drunk")
        Citizen.Wait(60000)
        ClearTimecycleModifier()
	end
end

function EatWhiskey()
    if not IsAnimated then
        prop_name = 'prop_whiskey_bottle'
        IsAnimated = true

        local playerPed = PlayerPedId()
        local x,y,z = table.unpack(GetEntityCoords(playerPed))
        local prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2, true, true, true)
        local boneIndex = GetPedBoneIndex(playerPed, 18905)
        AttachEntityToEntity(prop, playerPed, boneIndex, 0.14, 0.026, 0.020, 45.0, 175.0, 90.0, true, true, false, true, 1, true)

		if not HasAnimDictLoaded('mp_player_intdrink') then
			RequestAnimDict('mp_player_intdrink')
	
			while not HasAnimDictLoaded('mp_player_intdrink') do
				Citizen.Wait(1)
			end
		end

        TaskPlayAnim(playerPed, 'mp_player_intdrink', 'loop_bottle', 1.0, 1.0, 6000, 49, 0, 0, 0, 0)

		Citizen.Wait(1000)
		TriggerServerEvent('InitialCore:StatusAdd', 'soif', 1)
		Citizen.Wait(1000)
		TriggerServerEvent('InitialCore:StatusAdd', 'soif', 1)
		Citizen.Wait(1000)
		TriggerServerEvent('InitialCore:StatusAdd', 'soif', 1)
		Citizen.Wait(1000)
		TriggerServerEvent('InitialCore:StatusAdd', 'soif', 1)
		Citizen.Wait(1000)
        TriggerServerEvent('InitialCore:StatusAdd', 'soif', 1)        
        IsAnimated = false
        DeleteObject(prop)
        SetTimecycleModifier("Drunk")
        Citizen.Wait(40000)
       ClearTimecycleModifier()
	end
end

function EatRhum()
    if not IsAnimated then
        prop_name = 'prop_rum_bottle'
        IsAnimated = true

        local playerPed = PlayerPedId()
        local x,y,z = table.unpack(GetEntityCoords(playerPed))
        local prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2, true, true, true)
        local boneIndex = GetPedBoneIndex(playerPed, 18905)
        AttachEntityToEntity(prop, playerPed, boneIndex, 0.14, 0.026, 0.020, 45.0, 175.0, 90.0, true, true, false, true, 1, true)

		if not HasAnimDictLoaded('mp_player_intdrink') then
			RequestAnimDict('mp_player_intdrink')
	
			while not HasAnimDictLoaded('mp_player_intdrink') do
				Citizen.Wait(1)
			end
        end
        
        TaskPlayAnim(playerPed, 'mp_player_intdrink', 'loop_bottle', 1.0, 1.0, 6000, 49, 0, 0, 0, 0)

		Citizen.Wait(1000)
		TriggerServerEvent('InitialCore:StatusAdd', 'soif', 1)
		Citizen.Wait(1000)
		TriggerServerEvent('InitialCore:StatusAdd', 'soif', 1)
		Citizen.Wait(1000)
		TriggerServerEvent('InitialCore:StatusAdd', 'soif', 1)
		Citizen.Wait(1000)
		TriggerServerEvent('InitialCore:StatusAdd', 'soif', 1)
		Citizen.Wait(1000)
        TriggerServerEvent('InitialCore:StatusAdd', 'soif', 1)
        IsAnimated = false
        DeleteObject(prop)
        SetTimecycleModifier("Drunk")
        Citizen.Wait(20000)
       ClearTimecycleModifier()

	end
end

function EatBiere()
    if not IsAnimated then
        prop_name = 'prop_rum_bottle'
        IsAnimated = true

        local playerPed = PlayerPedId()
        local x,y,z = table.unpack(GetEntityCoords(playerPed))
        local prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2, true, true, true)
        local boneIndex = GetPedBoneIndex(playerPed, 18905)
        AttachEntityToEntity(prop, playerPed, boneIndex, 0.14, 0.026, 0.020, 45.0, 175.0, 90.0, true, true, false, true, 1, true)

		if not HasAnimDictLoaded('mp_player_intdrink') then
			RequestAnimDict('mp_player_intdrink')
	
			while not HasAnimDictLoaded('mp_player_intdrink') do
				Citizen.Wait(1)
			end
		end

        TaskPlayAnim(playerPed, 'mp_player_intdrink', 'loop_bottle', 1.0, 1.0, 6000, 49, 0, 0, 0, 0)

		Citizen.Wait(1000)
		TriggerServerEvent('InitialCore:StatusAdd', 'soif', 2)
		Citizen.Wait(1000)
		TriggerServerEvent('InitialCore:StatusAdd', 'soif', 2)
		Citizen.Wait(1000)
		TriggerServerEvent('InitialCore:StatusAdd', 'soif', 2)
		Citizen.Wait(1000)
		TriggerServerEvent('InitialCore:StatusAdd', 'soif', 2)
		Citizen.Wait(2000)
		TriggerServerEvent('InitialCore:StatusAdd', 'soif', 2)

        IsAnimated = false
        DeleteObject(prop)
	end
end

function EatChampagne()
    if not IsAnimated then
        prop_name = 'lux_prop_champ_01_luxe'
        IsAnimated = true

        local playerPed = PlayerPedId()
        local x,y,z = table.unpack(GetEntityCoords(playerPed))
        local prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2, true, true, true)
        local boneIndex = GetPedBoneIndex(playerPed, 18905)
        AttachEntityToEntity(prop, playerPed, boneIndex, 0.14, 0.026, 0.020, 45.0, 175.0, 90.0, true, true, false, true, 1, true)

		if not HasAnimDictLoaded('mp_player_intdrink') then
			RequestAnimDict('mp_player_intdrink')
	
			while not HasAnimDictLoaded('mp_player_intdrink') do
				Citizen.Wait(1)
			end
		end

        TaskPlayAnim(playerPed, 'mp_player_intdrink', 'loop_bottle', 1.0, 1.0, 6000, 49, 0, 0, 0, 0)

		Citizen.Wait(1000)
		TriggerServerEvent('InitialCore:StatusAdd', 'soif', 2)
		Citizen.Wait(1000)
		TriggerServerEvent('InitialCore:StatusAdd', 'soif', 2)
		Citizen.Wait(1000)
		TriggerServerEvent('InitialCore:StatusAdd', 'soif', 2)
		Citizen.Wait(1000)
		TriggerServerEvent('InitialCore:StatusAdd', 'soif', 2)
		Citizen.Wait(2000)
        TriggerServerEvent('InitialCore:StatusAdd', 'soif', 2)

        IsAnimated = false
        DeleteObject(prop)
        SetTimecycleModifier("Drunk")
        Citizen.Wait(60000)
       ClearTimecycleModifier()
	end
end

------------------------------------------------------------------------------------------------------------
------------------------------------------------------FRUIT------------------------------------------------
------------------------------------------------------------------------------------------------------------

function EatOrange()
	if not IsAnimated then
        prop_name = 'ng_proc_food_ornge1a'
        IsAnimated = true

        local playerPed = PlayerPedId()
        local x,y,z = table.unpack(GetEntityCoords(playerPed))
        local prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2, true, true, true)
        local boneIndex = GetPedBoneIndex(playerPed, 18905)
        AttachEntityToEntity(prop, playerPed, boneIndex, 0.14, 0.026, 0.020, 45.0, 175.0, 90.0, true, true, false, true, 1, true)

		if not HasAnimDictLoaded('mp_player_inteat@burger') then
			RequestAnimDict('mp_player_inteat@burger')
	
			while not HasAnimDictLoaded('mp_player_inteat@burger') do
				Citizen.Wait(1)
			end
		end

        TaskPlayAnim(playerPed, 'mp_player_inteat@burger', 'mp_player_int_eat_burger_fp', 2.0, 2.0, 6000, 49, 0, 0, 0, 0)

		Citizen.Wait(1420)
		TriggerServerEvent('InitialCore:StatusAdd', 'faim', 3)
		Citizen.Wait(1420)
		TriggerServerEvent('InitialCore:StatusAdd', 'faim', 2)
		Citizen.Wait(1420)
		TriggerServerEvent('InitialCore:StatusAdd', 'faim', 3)
		Citizen.Wait(1420)
		TriggerServerEvent('InitialCore:StatusAdd', 'faim', 2)
		Citizen.Wait(1420)
		TriggerServerEvent('InitialCore:StatusAdd', 'faim', 3)
		TriggerEvent('InitialCore:ResetShakeCamEffect')

        IsAnimated = false
        DeleteObject(prop)
	end
end

function EatAnanas()
	if not IsAnimated then
        prop_name = 'prop_pineapple'
        IsAnimated = true

        local playerPed = PlayerPedId()
        local x,y,z = table.unpack(GetEntityCoords(playerPed))
        local prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2, true, true, true)
        local boneIndex = GetPedBoneIndex(playerPed, 18905)
        AttachEntityToEntity(prop, playerPed, boneIndex, 0.14, 0.026, 0.020, 45.0, 175.0, 90.0, true, true, false, true, 1, true)

		if not HasAnimDictLoaded('mp_player_inteat@burger') then
			RequestAnimDict('mp_player_inteat@burger')
	
			while not HasAnimDictLoaded('mp_player_inteat@burger') do
				Citizen.Wait(1)
			end
		end

        TaskPlayAnim(playerPed, 'mp_player_inteat@burger', 'mp_player_int_eat_burger_fp', 2.0, 2.0, 6000, 49, 0, 0, 0, 0)

		Citizen.Wait(1420)
		TriggerServerEvent('InitialCore:StatusAdd', 'faim', 8)
		Citizen.Wait(1420)
		TriggerServerEvent('InitialCore:StatusAdd', 'faim', 8)
		Citizen.Wait(1420)
		TriggerServerEvent('InitialCore:StatusAdd', 'faim', 8)
		TriggerServerEvent('InitialCore:StatusAdd', 'soif', 2)
		Citizen.Wait(1420)
		TriggerServerEvent('InitialCore:StatusAdd', 'faim', 8)
		TriggerServerEvent('InitialCore:StatusAdd', 'soif', 2) 
		Citizen.Wait(1420)
		TriggerServerEvent('InitialCore:StatusAdd', 'faim', 9)
		TriggerServerEvent('InitialCore:StatusAdd', 'soif', 2) 
		TriggerEvent('InitialCore:ResetShakeCamEffect')

        IsAnimated = false
        DeleteObject(prop)
	end
end

------------------------------------------------------------------------------------------------------------
------------------------------------------------------BOISSON------------------------------------------------
------------------------------------------------------------------------------------------------------------

function EatLait()    
	if not IsAnimated then
        prop_name = 'prop_cs_milk_01'
        IsAnimated = true

        local playerPed = PlayerPedId()
        local x,y,z = table.unpack(GetEntityCoords(playerPed))
        local prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2, true, true, true)
        local boneIndex = GetPedBoneIndex(playerPed, 18905)
        AttachEntityToEntity(prop, playerPed, boneIndex, 0.12, 0.028, 0.01, -39.0, 90.0, 0.0, true, true, false, true, 1, true)

		if not HasAnimDictLoaded('mp_player_intdrink') then
			RequestAnimDict('mp_player_intdrink')
	
			while not HasAnimDictLoaded('mp_player_intdrink') do
				Citizen.Wait(1)
			end
		end

        TaskPlayAnim(playerPed, 'mp_player_intdrink', 'loop_bottle', 1.0, 1.0, 10000, 49, 0, 0, 0, 0)

		Citizen.Wait(2000)
		TriggerServerEvent('InitialCore:StatusAdd', 'soif', 5)
		Citizen.Wait(2000)
		TriggerServerEvent('InitialCore:StatusAdd', 'soif', 5)
		Citizen.Wait(3000)
		TriggerServerEvent('InitialCore:StatusAdd', 'soif', 5)
		Citizen.Wait(3000)
        TriggerServerEvent('InitialCore:StatusAdd', 'soif', 5)
        IsAnimated = false
        DeleteObject(prop)
		TriggerEvent('InitialCore:ResetShakeCamEffect')
	end
end

function EatCola2()
	if not IsAnimated then
        prop_name = 'ba_prop_club_tonic_bottle'
        IsAnimated = true

        local playerPed = PlayerPedId()
        local x,y,z = table.unpack(GetEntityCoords(playerPed))
        local prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2, true, true, true)
        local boneIndex = GetPedBoneIndex(playerPed, 18905)
        AttachEntityToEntity(prop, playerPed, boneIndex, 0.12, 0.028, 0.01, -39.0, 90.0, 0.0, true, true, false, true, 1, true)

		if not HasAnimDictLoaded('mp_player_intdrink') then
			RequestAnimDict('mp_player_intdrink')
	
			while not HasAnimDictLoaded('mp_player_intdrink') do
				Citizen.Wait(1)
			end
		end

        TaskPlayAnim(playerPed, 'mp_player_intdrink', 'loop_bottle', 1.0, 1.0, 10000, 49, 0, 0, 0, 0)

		Citizen.Wait(1500)
		TriggerServerEvent('InitialCore:StatusAdd', 'soif', 5)
		Citizen.Wait(1500)
		TriggerServerEvent('InitialCore:StatusAdd', 'soif', 5)
		Citizen.Wait(1500)
		TriggerServerEvent('InitialCore:StatusAdd', 'soif', 5)
		Citizen.Wait(1500)
        TriggerServerEvent('InitialCore:StatusAdd', 'soif', 5)
        IsAnimated = false
        DeleteObject(prop)
		Citizen.Wait(1420)
		TriggerServerEvent('InitialCore:StatusAdd', 'soif', 2)
		TriggerEvent('InitialCore:ResetShakeCamEffect')
	end
end

function EatSprunk2() 
	if not IsAnimated then
        prop_name = 'prop_energy_drink'
        IsAnimated = true

        local playerPed = PlayerPedId()
        local x,y,z = table.unpack(GetEntityCoords(playerPed))
        local prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2, true, true, true)
        local boneIndex = GetPedBoneIndex(playerPed, 18905)
        AttachEntityToEntity(prop, playerPed, boneIndex, 0.12, 0.028, 0.01, -39.0, 90.0, 0.0, true, true, false, true, 1, true)

		if not HasAnimDictLoaded('mp_player_intdrink') then
			RequestAnimDict('mp_player_intdrink')
	
			while not HasAnimDictLoaded('mp_player_intdrink') do
				Citizen.Wait(1)
			end
		end

        TaskPlayAnim(playerPed, 'mp_player_intdrink', 'loop_bottle', 1.0, 1.0, 10000, 49, 0, 0, 0, 0)

		Citizen.Wait(1420)
		TriggerServerEvent('InitialCore:StatusAdd', 'soif', 5)
		Citizen.Wait(1420)
		TriggerServerEvent('InitialCore:StatusAdd', 'soif', 5)
		Citizen.Wait(1420)
		TriggerServerEvent('InitialCore:StatusAdd', 'soif', 5)
		Citizen.Wait(1420)
        TriggerServerEvent('InitialCore:StatusAdd', 'soif', 5)
        IsAnimated = false
        DeleteObject(prop)
		Citizen.Wait(1420)
		TriggerServerEvent('InitialCore:StatusAdd', 'soif', 2)
		TriggerEvent('InitialCore:ResetShakeCamEffect')
	end
end

function EatSprunk() 
	if not IsAnimated then
        prop_name = 'prop_ld_can_01'
        IsAnimated = true

        local playerPed = PlayerPedId()
        local x,y,z = table.unpack(GetEntityCoords(playerPed))
        local prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2, true, true, true)
        local boneIndex = GetPedBoneIndex(playerPed, 18905)
        AttachEntityToEntity(prop, playerPed, boneIndex, 0.12, 0.028, 0.01, -39.0, 90.0, 0.0, true, true, false, true, 1, true)

		if not HasAnimDictLoaded('mp_player_intdrink') then
			RequestAnimDict('mp_player_intdrink')
	
			while not HasAnimDictLoaded('mp_player_intdrink') do
				Citizen.Wait(1)
			end
		end

        TaskPlayAnim(playerPed, 'mp_player_intdrink', 'loop_bottle', 1.0, 1.0, 6000, 49, 0, 0, 0, 0)

		Citizen.Wait(1420)
		TriggerServerEvent('InitialCore:StatusAdd', 'soif', 3)
		Citizen.Wait(1420)
		TriggerServerEvent('InitialCore:StatusAdd', 'soif', 3)
		Citizen.Wait(1420)
		TriggerServerEvent('InitialCore:StatusAdd', 'soif', 3)
		Citizen.Wait(1420)
        TriggerServerEvent('InitialCore:StatusAdd', 'soif', 2)
        IsAnimated = false
        DeleteObject(prop)
		Citizen.Wait(1420)
		TriggerServerEvent('InitialCore:StatusAdd', 'soif', 2)
		TriggerEvent('InitialCore:ResetShakeCamEffect')
	end
end

function EatCola()    
	if not IsAnimated then
        prop_name = 'prop_ecola_can'
        IsAnimated = true

        local playerPed = PlayerPedId()
        local x,y,z = table.unpack(GetEntityCoords(playerPed))
        local prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2, true, true, true)
        local boneIndex = GetPedBoneIndex(playerPed, 18905)
        AttachEntityToEntity(prop, playerPed, boneIndex, 0.12, 0.028, 0.01, -39.0, 90.0, 0.0, true, true, false, true, 1, true)

		if not HasAnimDictLoaded('mp_player_intdrink') then
			RequestAnimDict('mp_player_intdrink')
	
			while not HasAnimDictLoaded('mp_player_intdrink') do
				Citizen.Wait(1)
			end
		end

        TaskPlayAnim(playerPed, 'mp_player_intdrink', 'loop_bottle', 1.0, 1.0, 6000, 49, 0, 0, 0, 0)

		Citizen.Wait(1420)
		TriggerServerEvent('InitialCore:StatusAdd', 'soif', 3)
		Citizen.Wait(1420)
		TriggerServerEvent('InitialCore:StatusAdd', 'soif', 3)
		Citizen.Wait(1420)
		TriggerServerEvent('InitialCore:StatusAdd', 'soif', 3)
		Citizen.Wait(1420)
        TriggerServerEvent('InitialCore:StatusAdd', 'soif', 2)
        IsAnimated = false
        DeleteObject(prop)
		Citizen.Wait(1420)
		TriggerServerEvent('InitialCore:StatusAdd', 'soif', 2)
		TriggerEvent('InitialCore:ResetShakeCamEffect')
	end
end

function DrinkEau()
	if not IsAnimated then
		AdvancedNotif("Initial V", "~r~Inventaire", "Vous buvez de l'eau.", "CHAR_WE", "INITIALV")
        prop_name = 'prop_ld_flow_bottle'
        IsAnimated = true

        local playerPed = PlayerPedId()
        local x,y,z = table.unpack(GetEntityCoords(playerPed))
        local prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2, true, true, true)
        local boneIndex = GetPedBoneIndex(playerPed, 18905)
        AttachEntityToEntity(prop, playerPed, boneIndex, 0.12, 0.028, 0.01, -39.0, 90.0, 0.0, true, true, false, true, 1, true)

		if not HasAnimDictLoaded('mp_player_intdrink') then
			RequestAnimDict('mp_player_intdrink')
	
			while not HasAnimDictLoaded('mp_player_intdrink') do
				Citizen.Wait(1)
			end
		end

        TaskPlayAnim(playerPed, 'mp_player_intdrink', 'loop_bottle', 1.0, 1.0, 6000, 49, 0, 0, 0, 0)

		Citizen.Wait(1420)
		TriggerServerEvent('InitialCore:StatusAdd', 'soif', 5)
		Citizen.Wait(1420)
		TriggerServerEvent('InitialCore:StatusAdd', 'soif', 5)
		Citizen.Wait(1420)
		TriggerServerEvent('InitialCore:StatusAdd', 'soif', 5)
		Citizen.Wait(1420)
		TriggerServerEvent('InitialCore:StatusAdd', 'soif', 5)
		Citizen.Wait(1420)
		TriggerServerEvent('InitialCore:StatusAdd', 'soif', 5)
		TriggerEvent('InitialCore:ResetShakeCamEffect')

        IsAnimated = false
        --ClearPedSecondaryTask(playerPed)
        DeleteObject(prop)
	end
end

------------------------------------------------------------------------------------------------------------
------------------------------------------------------sandwich, burger et tt--------------------------------
------------------------------------------------------------------------------------------------------------

function EatHamburger()    
    if not IsAnimated then
        prop_name = 'prop_cs_burger_01'
        IsAnimated = true

        local playerPed = PlayerPedId()
        local x,y,z = table.unpack(GetEntityCoords(playerPed))
        local prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2, true, true, true)
        local boneIndex = GetPedBoneIndex(playerPed, 18905)
        AttachEntityToEntity(prop, playerPed, boneIndex, 0.13, 0.05, 0.02, -50.0, 16.0, 60.0, true, true, false, true, 1, true)

		if not HasAnimDictLoaded('mp_player_inteat@burger') then
			RequestAnimDict('mp_player_inteat@burger')
	
			while not HasAnimDictLoaded('mp_player_inteat@burger') do
				Citizen.Wait(1)
			end
		end

        TaskPlayAnim(playerPed, 'mp_player_inteat@burger', 'mp_player_int_eat_burger_fp', 2.0, 2.0, 3000, 49, 0, 0, 0, 0)

		Citizen.Wait(1000)
		TriggerServerEvent('InitialCore:StatusAdd', 'faim', 1)
		Citizen.Wait(1000)
		TriggerServerEvent('InitialCore:StatusAdd', 'faim', 2)
		Citizen.Wait(1000)
		TriggerServerEvent('InitialCore:StatusAdd', 'faim', 3)
        IsAnimated = false
        DeleteObject(prop)
		TriggerEvent('InitialCore:ResetShakeCamEffect')
	end
end

function EatDonuts()
    if not IsAnimated then
        prop_name = 'prop_amb_donut'
        IsAnimated = true

        local playerPed = PlayerPedId()
        local x,y,z = table.unpack(GetEntityCoords(playerPed))
        local prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2, true, true, true)
        local boneIndex = GetPedBoneIndex(playerPed, 18905)
        AttachEntityToEntity(prop, playerPed, boneIndex, 0.13, 0.05, 0.02, -50.0, 16.0, 60.0, true, true, false, true, 1, true)

		if not HasAnimDictLoaded('mp_player_inteat@burger') then
			RequestAnimDict('mp_player_inteat@burger')
	
			while not HasAnimDictLoaded('mp_player_inteat@burger') do
				Citizen.Wait(1)
			end
		end

        TaskPlayAnim(playerPed, 'mp_player_inteat@burger', 'mp_player_int_eat_burger_fp', 2.0, 2.0, 3000, 49, 0, 0, 0, 0)

		Citizen.Wait(1000)
		TriggerServerEvent('InitialCore:StatusAdd', 'faim', 1)
		Citizen.Wait(1000)
		TriggerServerEvent('InitialCore:StatusAdd', 'faim', 2)
		Citizen.Wait(1000)
		TriggerServerEvent('InitialCore:StatusAdd', 'faim', 3)
        IsAnimated = false
        DeleteObject(prop)
		TriggerEvent('InitialCore:ResetShakeCamEffect')
	end
end

function EatChips()
    if not IsAnimated then
        --prop_name = 'xs_prop_chips_tube_wl'
        IsAnimated = true

        local playerPed = PlayerPedId()
        --local x,y,z = table.unpack(GetEntityCoords(playerPed))
        --local prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2, true, true, true)
        --local boneIndex = GetPedBoneIndex(playerPed, 18905)
        --AttachEntityToEntity(prop, playerPed, boneIndex, 0.14, 0.026, 0.020, 100.0, 175.0, 90.0, true, true, false, true, 1, true)

		if not HasAnimDictLoaded('mp_player_inteat@burger') then
			RequestAnimDict('mp_player_inteat@burger')
	
			while not HasAnimDictLoaded('mp_player_inteat@burger') do
				Citizen.Wait(1)
			end
		end

        TaskPlayAnim(playerPed, 'mp_player_inteat@burger', 'mp_player_int_eat_burger_fp', 2.0, 2.0, 3000, 49, 0, 0, 0, 0)

		Citizen.Wait(1000)
		TriggerServerEvent('InitialCore:StatusAdd', 'faim', 1)
		Citizen.Wait(1000)
		TriggerServerEvent('InitialCore:StatusAdd', 'faim', 2)
		Citizen.Wait(1000)
		TriggerServerEvent('InitialCore:StatusAdd', 'faim', 3)
        IsAnimated = false
        DeleteObject(prop)
		TriggerEvent('InitialCore:ResetShakeCamEffect')
	end
end

function EatPopcorn()
    if not IsAnimated then
        prop_name = 'xs_prop_trinket_cup_01a'
        IsAnimated = true

        local playerPed = PlayerPedId()
        local x,y,z = table.unpack(GetEntityCoords(playerPed))
        local prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2, true, true, true)
        local boneIndex = GetPedBoneIndex(playerPed, 18905)
        AttachEntityToEntity(prop, playerPed, boneIndex, 0.14, 0.026, 0.020, 100.0, 175.0, 90.0, true, true, false, true, 1, true)

		if not HasAnimDictLoaded('mp_player_inteat@burger') then
			RequestAnimDict('mp_player_inteat@burger')
	
			while not HasAnimDictLoaded('mp_player_inteat@burger') do
				Citizen.Wait(1)
			end
		end

        TaskPlayAnim(playerPed, 'mp_player_inteat@burger', 'mp_player_int_eat_burger_fp', 2.0, 2.0, 6000, 49, 0, 0, 0, 0)

		Citizen.Wait(1420)
		TriggerServerEvent('InitialCore:StatusAdd', 'faim', 2)
		Citizen.Wait(1420)
		TriggerServerEvent('InitialCore:StatusAdd', 'faim', 2)
		Citizen.Wait(1420)
		TriggerServerEvent('InitialCore:StatusAdd', 'faim', 2)
		Citizen.Wait(1420)
		TriggerServerEvent('InitialCore:StatusAdd', 'faim', 2)
        IsAnimated = false
        DeleteObject(prop)
		TriggerEvent('InitialCore:ResetShakeCamEffect')
	end
end

function EatCookie()    
    if not IsAnimated then
        prop_name = 'prop_food_cb_burg01'
        IsAnimated = true

        local playerPed = PlayerPedId()
        local x,y,z = table.unpack(GetEntityCoords(playerPed))
        local prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2, true, true, true)
        local boneIndex = GetPedBoneIndex(playerPed, 18905)
        AttachEntityToEntity(prop, playerPed, boneIndex, 0.14, 0.026, 0.020, 100.0, 175.0, 90.0, true, true, false, true, 1, true)

		if not HasAnimDictLoaded('mp_player_inteat@burger') then
			RequestAnimDict('mp_player_inteat@burger')
	
			while not HasAnimDictLoaded('mp_player_inteat@burger') do
				Citizen.Wait(1)
			end
		end

        TaskPlayAnim(playerPed, 'mp_player_inteat@burger', 'mp_player_int_eat_burger_fp', 2.0, 2.0, 6000, 49, 0, 0, 0, 0)

		Citizen.Wait(1420)
		TriggerServerEvent('InitialCore:StatusAdd', 'faim', 2)
		Citizen.Wait(1420)
		TriggerServerEvent('InitialCore:StatusAdd', 'faim', 2)
		Citizen.Wait(1420)
		TriggerServerEvent('InitialCore:StatusAdd', 'faim', 2)
		Citizen.Wait(1420)
		TriggerServerEvent('InitialCore:StatusAdd', 'faim', 4)
        IsAnimated = false
        DeleteObject(prop)
		TriggerEvent('InitialCore:ResetShakeCamEffect')
	end
end

function EatBrownie()
    if not IsAnimated then
        prop_name = 'prop_food_cb_burg01'
        IsAnimated = true

        local playerPed = PlayerPedId()
        local x,y,z = table.unpack(GetEntityCoords(playerPed))
        local prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2, true, true, true)
        local boneIndex = GetPedBoneIndex(playerPed, 18905)
        AttachEntityToEntity(prop, playerPed, boneIndex, 0.14, 0.026, 0.020, 100.0, 175.0, 90.0, true, true, false, true, 1, true)

		if not HasAnimDictLoaded('mp_player_inteat@burger') then
			RequestAnimDict('mp_player_inteat@burger')
	
			while not HasAnimDictLoaded('mp_player_inteat@burger') do
				Citizen.Wait(1)
			end
		end

        TaskPlayAnim(playerPed, 'mp_player_inteat@burger', 'mp_player_int_eat_burger_fp', 2.0, 2.0, 6000, 49, 0, 0, 0, 0)

		Citizen.Wait(1420)
		TriggerServerEvent('InitialCore:StatusAdd', 'faim', 2)
		Citizen.Wait(1420)
		TriggerServerEvent('InitialCore:StatusAdd', 'faim', 2)
		Citizen.Wait(1420)
		TriggerServerEvent('InitialCore:StatusAdd', 'faim', 2)
		Citizen.Wait(1420)
		TriggerServerEvent('InitialCore:StatusAdd', 'faim', 4)
        IsAnimated = false
        DeleteObject(prop)
		TriggerEvent('InitialCore:ResetShakeCamEffect')
	end
end

function EatSandwich()
	if not IsAnimated then
        prop_name = 'prop_sandwich_01'
        IsAnimated = true

        local playerPed = PlayerPedId()
        local x,y,z = table.unpack(GetEntityCoords(playerPed))
        local prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2, true, true, true)
        local boneIndex = GetPedBoneIndex(playerPed, 18905)
        AttachEntityToEntity(prop, playerPed, boneIndex, 0.13, 0.05, 0.02, -50.0, 16.0, 60.0, true, true, false, true, 1, true)

		if not HasAnimDictLoaded('mp_player_inteat@burger') then
			RequestAnimDict('mp_player_inteat@burger')
	
			while not HasAnimDictLoaded('mp_player_inteat@burger') do
				Citizen.Wait(1)
			end
		end

        TaskPlayAnim(playerPed, 'mp_player_inteat@burger', 'mp_player_int_eat_burger_fp', 2.0, 2.0, 6000, 49, 0, 0, 0, 0)

		Citizen.Wait(1420)
		TriggerServerEvent('InitialCore:StatusAdd', 'faim', 5)
		Citizen.Wait(1420)
		TriggerServerEvent('InitialCore:StatusAdd', 'faim', 5)
		Citizen.Wait(1420)
		TriggerServerEvent('InitialCore:StatusAdd', 'faim', 5)
		Citizen.Wait(1420)
		TriggerServerEvent('InitialCore:StatusAdd', 'faim', 5)
		Citizen.Wait(1420)
		TriggerServerEvent('InitialCore:StatusAdd', 'faim', 5)
		TriggerEvent('InitialCore:ResetShakeCamEffect')

        IsAnimated = false
        --ClearPedSecondaryTask(playerPed)
        DeleteObject(prop)
	end
end

function EatChocolat()
	if not IsAnimated then
        prop_name = 'prop_choc_ego'
        IsAnimated = true

        local playerPed = PlayerPedId()
        local x,y,z = table.unpack(GetEntityCoords(playerPed))
        local prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2, true, true, true)
        local boneIndex = GetPedBoneIndex(playerPed, 18905)
        AttachEntityToEntity(prop, playerPed, boneIndex, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, true, true, false, true, 1, true)

		if not HasAnimDictLoaded('mp_player_inteat@burger') then
			RequestAnimDict('mp_player_inteat@burger')
	
			while not HasAnimDictLoaded('mp_player_inteat@burger') do
				Citizen.Wait(1)
			end
		end

        TaskPlayAnim(playerPed, 'mp_player_inteat@burger', 'mp_player_int_eat_burger_fp', 2.0, 2.0, 6000, 49, 0, 0, 0, 0)

		Citizen.Wait(1420)
		TriggerServerEvent('InitialCore:StatusAdd', 'faim', 2)
		Citizen.Wait(1420)
		TriggerServerEvent('InitialCore:StatusAdd', 'faim', 2)
		Citizen.Wait(1420)
		TriggerServerEvent('InitialCore:StatusAdd', 'faim', 2)
		Citizen.Wait(1420)
		TriggerServerEvent('InitialCore:StatusAdd', 'faim', 2)
		Citizen.Wait(1420)
		TriggerServerEvent('InitialCore:StatusAdd', 'faim', 2)
		TriggerEvent('InitialCore:ResetShakeCamEffect')

        IsAnimated = false
        --ClearPedSecondaryTask(playerPed)
        DeleteObject(prop)
	end
end