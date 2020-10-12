------------------------------------------------------------------------------
--
-- Ce travail est sous liscence:
-- Creative Commons Attribution-NonCommercial-NoDerivatives-NoDistribution 4.0 International License.
--
------------------------------------------------------------------------------

local CurrentTest           = nil
local CurrentCheckPoint     = 0
local DriveErrors 		    = 0
local LastCheckPoint        = -1
local CurrentBlip           = nil
local CurrentZoneType       = nil
local IsAboveSpeedLimit     = false
local VehicleHealth     	= nil
local success               = false
local pieton                = false
local startedconduite 		= false

local drivetest = nil

local cvrai = 0

local blockitvoiture = false
local blockitmoto = false
local blockitcamion = false

local Meta = {} -- a faire pour l'item permis
Meta.Nom = Nom
Meta.Prenom = Prenom
Meta.Sexe = Sexe
Meta.DateObtention = DateObtention
Meta.HashID = math.random(10001, 99999)


local function SetCurrentZoneType(type)
    CurrentZoneType = type
end


local function StopDriveTest(success)
	if success then
		RemoveBlip(CurrentBlip)
		AdvancedNotif('Amanda', '~r~Bravo~w~', 'Vous avez reçu votre permis !', 'CHAR_HITCHER_GIRL', 'CHAR_HITCHER_GIRL')
		if DoesEntityExist(GetVehiclePedIsIn(PlayerPedId(), false)) then
			DeleteEntity(GetVehiclePedIsIn(PlayerPedId(), false))
			SetVehicleAsNoLongerNeeded(GetVehiclePedIsIn(PlayerPedId(), false))
		end
		if DoesEntityExist(pedssss) then
			DeleteEntity(pedssss)
		end
		if drivetest == "voiture" then
			blockitvoiture = true
			TriggerServerEvent("InitialCore:GivePermis", "voiture")
		elseif drivetest == "moto" then
			blockitmoto = true
			TriggerServerEvent("InitialCore:GivePermis", "moto")
		elseif drivetest == "camion" then
			blockitcamion = true
			TriggerServerEvent("InitialCore:GivePermis", "camion")
		end
	else
		if DoesEntityExist(pedssss) then
			DeleteEntity(pedssss)
		end
		AdvancedNotif('Amanda', '~r~Malheureusement~w~', 'Vous avez raté le test !', 'CHAR_HITCHER_GIRL', 'CHAR_HITCHER_GIRL')			
		if DoesEntityExist(GetVehiclePedIsIn(PlayerPedId(), false)) then
			DeleteEntity(GetVehiclePedIsIn(PlayerPedId(), false))
			SetVehicleAsNoLongerNeeded(GetVehiclePedIsIn(PlayerPedId(), false))
		end
	end
	SetEntityCoords(pietonped, 394.12, -111.84, 65.23, false, false, false, true)
	SetEntityHeading(pietonped, 234.62)
	startedconduite = false
	CurrentTest     = nil
end

local function GoToTargetWalking()
	pieton = false
	FreezeEntityPosition(pietonped, false)
    TaskGoToCoordAnyMeans(pietonped, 414.1815, -124.91, 63.71, 1.0, 0, 0, 786603, 0xbf800000)
    distanceToTarget = GetDistanceBetweenCoords(pietonped, 414.1815, -124.91, 63.71, true)
    if distanceToTarget <= 1 then
        FreezeEntityPosition(pietonped, true)
    end
end

local CheckPoints = {

	{
		Pos = {x = 216.204, y = 370.29, z = 106.323},
		Action = function(playerPed, setCurrentZoneType)
			AdvancedNotif('Amanda', 'Bien~w~', "Allons sur la route, tournez à gauche, vitesse limitée à~w~ ~y~80km/h", 'CHAR_HITCHER_GIRL', 'CHAR_HITCHER_GIRL')
			TesOuFDPRendMonQuad = 1
		end
	},

	{
		Pos = {x = 236.32, y = 346.78, z = 105.57},
		Action = function(playerPed, setCurrentZoneType)
			AdvancedNotif('Amanda', 'Bien~w~', "Continuez tout droit", 'CHAR_HITCHER_GIRL', 'CHAR_HITCHER_GIRL')
			TesOuFDPRendMonQuad = 1
		end
	},

	{
		Pos = {x = 403.16, y = 300.05, z = 103.00},
		Action = function(playerPed, setCurrentZoneType)
			AdvancedNotif('Amanda', 'Bien~w~', "Attentions au feu", 'CHAR_HITCHER_GIRL', 'CHAR_HITCHER_GIRL')
			TesOuFDPRendMonQuad = 1
		end
	},

	{
		Pos = {x = 548.00, y = 247.555, z = 103.09},
		Action = function(playerPed, setCurrentZoneType)
			AdvancedNotif('Amanda', 'Bien~w~', "Attentions au feu", 'CHAR_HITCHER_GIRL', 'CHAR_HITCHER_GIRL')
			TesOuFDPRendMonQuad = 1
		end
	},

	{
		Pos = {x = 658.73, y = 213.41, z = 95.93},
        Action = function(playerPed, setCurrentZoneType)
            AdvancedNotif('Amanda', 'Tournez !~w~', "Tournez à droite, n'oubliez pas vos clignotants", 'CHAR_HITCHER_GIRL', 'CHAR_HITCHER_GIRL')
			TesOuFDPRendMonQuad = 1
		end
	},

	{
		Pos = {x = 670.106, y = 194.68, z = 93.19},
		Action = function(playerPed, setCurrentZoneType)
            AdvancedNotif('Amanda', 'Zone résidentielle !~w~', "Vous entrez dans une zone résidentielle, limite ~y~50km/h", 'CHAR_HITCHER_GIRL', 'CHAR_HITCHER_GIRL')
			TesOuFDPRendMonQuad = 0
		end
	},

	{
		Pos = {x = 625.11, y = 69.87, z = 90.11},
		Action = function(playerPed, setCurrentZoneType)
			setCurrentZoneType('town')
            AdvancedNotif('Amanda', 'Tournez~w~', "Prenez à droite, vitesse limite ~y~80km/h", 'CHAR_HITCHER_GIRL', 'CHAR_HITCHER_GIRL')
			TesOuFDPRendMonQuad = 1
		end
	},

	{
		Pos = {x = 534.88, y = 75.044, z = 96.37},
		Action = function(playerPed, setCurrentZoneType)
			AdvancedNotif('Amanda', 'Bien~w~', "Tournez à gauche quand le feu est vert", 'CHAR_HITCHER_GIRL', 'CHAR_HITCHER_GIRL')
			TesOuFDPRendMonQuad = 1
		end
	},

	{
		Pos = {x = 484.05, y = 39.68, z = 92.18},
		Action = function(playerPed, setCurrentZoneType)
			AdvancedNotif('Amanda', 'Bien~w~', "Allez vers le prochain passage", 'CHAR_HITCHER_GIRL', 'CHAR_HITCHER_GIRL')
			TesOuFDPRendMonQuad = 1
		end
	},	

	{
		Pos = {x = 401.702, y = -108.51, z = 65.19}, 
		Action = function(playerPed, setCurrentZoneType)
			AdvancedNotif('Amanda', 'Bien~w~', "Laissez passer le pieton.", 'CHAR_HITCHER_GIRL', 'CHAR_HITCHER_GIRL') --## 393.65, -111.565, 65.29
			TesOuFDPRendMonQuad = 1
			pieton = true
		end
	},
 --
	{
		Pos = {x = 358.86, y = -245.34, z = 53.97},
		Action = function(playerPed, setCurrentZoneType)
			AdvancedNotif('Amanda', 'Bien~w~', "Attention au feu.", 'CHAR_HITCHER_GIRL', 'CHAR_HITCHER_GIRL')
			TesOuFDPRendMonQuad = 1
		end
	},

	{
		Pos = {x = 317.28, y = -362.89, z = 45.25},
		Action = function(playerPed, setCurrentZoneType)
			AdvancedNotif('Amanda', 'Bien~w~', "Attention au feu.", 'CHAR_HITCHER_GIRL', 'CHAR_HITCHER_GIRL')
			TesOuFDPRendMonQuad = 1
		end
	},

	{
		Pos = {x = 294.85, y = -456.19, z = 43.28},
		Action = function(playerPed, setCurrentZoneType)
			setCurrentZoneType("freeway")
			AdvancedNotif('Amanda', 'Bien~w~', "Tournez à droite, vitesse limitée à~y~ 120km/h.", 'CHAR_HITCHER_GIRL', 'CHAR_HITCHER_GIRL')
			TesOuFDPRendMonQuad = 2
		end
	},

	{
		Pos = {x = 68.52, y = -479.70, z = 34.06},
		Action = function(playerPed, setCurrentZoneType)
			AdvancedNotif('Amanda', 'Bien~w~', "Continuez tout droit.", 'CHAR_HITCHER_GIRL', 'CHAR_HITCHER_GIRL')
			TesOuFDPRendMonQuad = 2
		end
	},

	{
		Pos = {x = -138.31, y = -494.899, z = 29.42},
		Action = function(playerPed, setCurrentZoneType)
			AdvancedNotif('Amanda', 'Bien~w~', "Continuez tout droit.", 'CHAR_HITCHER_GIRL', 'CHAR_HITCHER_GIRL')
			TesOuFDPRendMonQuad = 2
		end
	},

	{
		Pos = {x = -688.59, y = -497.28, z = 25.19},
		Action = function(playerPed, setCurrentZoneType)
			AdvancedNotif('Amanda', 'Bien~w~', "Continuez tout droit.", 'CHAR_HITCHER_GIRL', 'CHAR_HITCHER_GIRL')
			TesOuFDPRendMonQuad = 2
		end
	},

	{
		Pos = {x = -989.10, y = -546.41, z = 18.35},
		Action = function(playerPed, setCurrentZoneType)
			AdvancedNotif('Amanda', 'Bien~w~', "Ralentissez.", 'CHAR_HITCHER_GIRL', 'CHAR_HITCHER_GIRL')
			TesOuFDPRendMonQuad = 2
		end
	},

	{
		Pos = {x = -1157.47, y = -638.79, z = 22.72},
		Action = function(playerPed, setCurrentZoneType)
			setCurrentZoneType("town")
			AdvancedNotif('Amanda', 'Bien~w~', "Tournez à gauche vitesse limite ~y~80km/h.", 'CHAR_HITCHER_GIRL', 'CHAR_HITCHER_GIRL')
			TesOuFDPRendMonQuad = 1
		end
	},

	{
		Pos = {x = -1142.446, y = -691.37, z = 21.63},
		Action = function(playerPed, setCurrentZoneType)
			setCurrentZoneType("freeway")
			AdvancedNotif('Amanda', 'Bien~w~', "Tournez à gauche, attention au feu.", 'CHAR_HITCHER_GIRL', 'CHAR_HITCHER_GIRL')
			TesOuFDPRendMonQuad = 2
		end
	},

	{
		Pos = {x = -1016.85, y = -616.55, z = 18.26},
		Action = function(playerPed, setCurrentZoneType)
			AdvancedNotif('Amanda', 'Bien~w~', "Continuez tout droit, vitesse limite ~y~120km/h.", 'CHAR_HITCHER_GIRL', 'CHAR_HITCHER_GIRL')
			TesOuFDPRendMonQuad = 2
		end
	},

	{
		Pos = {x = -849.54, y = -541.89, z = 22.83},
		Action = function(playerPed, setCurrentZoneType)
			AdvancedNotif('Amanda', 'Bien~w~', "Continuez tout droit.", 'CHAR_HITCHER_GIRL', 'CHAR_HITCHER_GIRL')
			TesOuFDPRendMonQuad = 2
		end
	},

	{
		Pos = {x = -490.50, y = -530.48, z = 25.33},
		Action = function(playerPed, setCurrentZoneType)
			AdvancedNotif('Amanda', 'Bien~w~', "Continuez tout droit.", 'CHAR_HITCHER_GIRL', 'CHAR_HITCHER_GIRL')
			TesOuFDPRendMonQuad = 2
		end
	},

	{
		Pos = {x = -26.30, y = -527.42, z = 33.25},
		Action = function(playerPed, setCurrentZoneType)
			AdvancedNotif('Amanda', 'Bien~w~', "Continuez tout droit, préparez vous à tournez à droite et ralentissez.", 'CHAR_HITCHER_GIRL', 'CHAR_HITCHER_GIRL')
			TesOuFDPRendMonQuad = 2
		end
	},

	{
		Pos = {x = 91.53, y = -544.01, z = 33.84},
		Action = function(playerPed, setCurrentZoneType)
			setCurrentZoneType("town")
			AdvancedNotif('Amanda', 'Bien~w~', "Continuez tout droit, vitesse limitée à ~y~80km/h.", 'CHAR_HITCHER_GIRL', 'CHAR_HITCHER_GIRL')
			TesOuFDPRendMonQuad = 1
		end
	},

	{
		Pos = {x = 252.99, y = -543.60, z = 43.21},
		Action = function(playerPed, setCurrentZoneType)
			AdvancedNotif('Amanda', 'Bien~w~', "Tournez à gauche, attention au feu.", 'CHAR_HITCHER_GIRL', 'CHAR_HITCHER_GIRL')
			TesOuFDPRendMonQuad = 1
		end
	},

	{
		Pos = {x = 306.79, y = -459.09, z = 43.32},
		Action = function(playerPed, setCurrentZoneType)
			AdvancedNotif('Amanda', 'Bien~w~', "Continuez tout droit.", 'CHAR_HITCHER_GIRL', 'CHAR_HITCHER_GIRL')
			TesOuFDPRendMonQuad = 1
		end
	},

	{
		Pos = {x = 318.32, y = -410.10, z = 45.12},
		Action = function(playerPed, setCurrentZoneType)
			AdvancedNotif('Amanda', 'Bien~w~', "Attention au feu, continuez tout droit.", 'CHAR_HITCHER_GIRL', 'CHAR_HITCHER_GIRL')
			TesOuFDPRendMonQuad = 1
		end
	},

	{
		Pos = {x = 351.15, y = -293.01, z = 53.88},
		Action = function(playerPed, setCurrentZoneType)
			AdvancedNotif('Amanda', 'Bien~w~', "Attention au feu, continuez tout droit.", 'CHAR_HITCHER_GIRL', 'CHAR_HITCHER_GIRL')
			TesOuFDPRendMonQuad = 1
		end
	},

	{
		Pos = {x = 400.48, y = -149.67, z = 64.69},
		Action = function(playerPed, setCurrentZoneType)
			AdvancedNotif('Amanda', 'Bien~w~', "Attention au feu, continuez tout droit.", 'CHAR_HITCHER_GIRL', 'CHAR_HITCHER_GIRL')
			TesOuFDPRendMonQuad = 1
		end
	},
	
	{
		Pos = {x = 508.28, y = 56.62, z = 95.80},
		Action = function(playerPed, setCurrentZoneType)
			AdvancedNotif('Amanda', 'Bien~w~', "Attention au feu, continuez tout droit.", 'CHAR_HITCHER_GIRL', 'CHAR_HITCHER_GIRL')
			TesOuFDPRendMonQuad = 1
		end
	},
	
	{
		Pos = {x = 563.84, y = 228.76, z = 103.04},
		Action = function(playerPed, setCurrentZoneType)
			AdvancedNotif('Amanda', 'Bien~w~', "Attention au feu, tournez à gauche.", 'CHAR_HITCHER_GIRL', 'CHAR_HITCHER_GIRL')
			TesOuFDPRendMonQuad = 1
		end
	},

	{
		Pos = {x = 437.77, y = 293.12, z = 102.99},
		Action = function(playerPed, setCurrentZoneType)
			AdvancedNotif('Amanda', 'Bien~w~', "Attention au feu, continuez tout droit.", 'CHAR_HITCHER_GIRL', 'CHAR_HITCHER_GIRL')
			TesOuFDPRendMonQuad = 1
		end
	},

	{
		Pos = {x = 275.69, y = 337.76, z = 105.51},
		Action = function(playerPed, setCurrentZoneType)
			AdvancedNotif('Amanda', 'Bien~w~', "Attention au feu, continuez tout droit.", 'CHAR_HITCHER_GIRL', 'CHAR_HITCHER_GIRL')
			TesOuFDPRendMonQuad = 1
		end
	},

	{
		Pos = {x = 223.73, y = 356.74, z = 105.85},
		Action = function(playerPed, setCurrentZoneType)
			AdvancedNotif('Amanda', 'Bien~w~', "Tournez à droite.", 'CHAR_HITCHER_GIRL', 'CHAR_HITCHER_GIRL')
			TesOuFDPRendMonQuad = 1
		end
	},

	{
		Pos = {x = 213.72, y = 389.25, z = 106.84},
		Action = function(playerPed, setCurrentZoneType)
			startedconduite = false
			if DriveErrors < 5 then
				StopDriveTest(true)
			else
				StopDriveTest(false)
			end
		end
	},

}

local function StartConduite()
	startedconduite = true
	while startedconduite do
		Wait(0)

		if CurrentTest == 'drive' then

			if pieton then
				GoToTargetWalking()
			end

			local nextCheckPoint = CurrentCheckPoint + 1

			if CheckPoints[nextCheckPoint] == nil then
				if DoesBlipExist(CurrentBlip) then
					RemoveBlip(CurrentBlip)
				end

				CurrentTest = nil

				while not IsPedheadshotReady(RegisterPedheadshot(PlayerPedId())) or not IsPedheadshotValid(RegisterPedheadshot(PlayerPedId())) do
					Wait(100)
				end
		
				BeginTextCommandThefeedPost("PS_UPDATE")
				AddTextComponentInteger(50)
			
				EndTextCommandThefeedPostStats("PSF_DRIVING", 14, 50, 25, false, GetPedheadshotTxdString(RegisterPedheadshot(PlayerPedId())), GetPedheadshotTxdString(RegisterPedheadshot(PlayerPedId())))
			
				EndTextCommandThefeedPostTicker(false, true)
				
				UnregisterPedheadshot(RegisterPedheadshot(PlayerPedId()))

			else

				if CurrentCheckPoint ~= LastCheckPoint then
					if DoesBlipExist(CurrentBlip) then
						RemoveBlip(CurrentBlip)
					end

					CurrentBlip = AddBlipForCoord(CheckPoints[nextCheckPoint].Pos.x, CheckPoints[nextCheckPoint].Pos.y, CheckPoints[nextCheckPoint].Pos.z)
					SetBlipRoute(CurrentBlip, 1)

					LastCheckPoint = CurrentCheckPoint
				end

				local distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), CheckPoints[nextCheckPoint].Pos.x, CheckPoints[nextCheckPoint].Pos.y, CheckPoints[nextCheckPoint].Pos.z, true)

				if distance <= 90.0 then
					DrawMarker(36, CheckPoints[nextCheckPoint].Pos.x, CheckPoints[nextCheckPoint].Pos.y, CheckPoints[nextCheckPoint].Pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.5, 1.5, 1.5, 102, 204, 102, 100, false, true, 2, false, false, false, false)
				end

				if distance <= 3.0 then
					CheckPoints[nextCheckPoint].Action(PlayerPedId(), SetCurrentZoneType)
					CurrentCheckPoint = CurrentCheckPoint + 1
				end
			end

			----------

			if IsPedInAnyVehicle(GetPlayerPed(-1), false) then

				local vehicle      = GetVehiclePedIsIn(GetPlayerPed(-1), false)
				local speed        = GetEntitySpeed(vehicle) * 3.6
				local tooMuchSpeed = false
				local GetSpeed = math.floor(GetEntitySpeed(vehicle) * 3.6)
				local speed_limit_residence = 50.0
				local speed_limit_ville = 80.0
				local speed_limit_otoroute = 120.0

				local DamageControl = 0

				if TesOuFDPRendMonQuad == 0 and GetSpeed >= speed_limit_residence then
					tooMuchSpeed 	  = true
					DriveErrors       = DriveErrors + 1
					IsAboveSpeedLimit = true
					AdvancedNotif('Amanda', '~r~Vous avez fait une erreur~w~', "Vous roulez trop vite, vitesse limite : " ..speed_limit_residence.. " km/h~w~!\n~r~Nombre d'erreurs " ..DriveErrors.. "/5", 'CHAR_HITCHER_GIRL', 'CHAR_HITCHER_GIRL')
					Wait(2000) -- evite bug
				end

				if TesOuFDPRendMonQuad == 1 and GetSpeed >= speed_limit_ville then
					tooMuchSpeed = true
					DriveErrors       = DriveErrors + 1
					IsAboveSpeedLimit = true
					AdvancedNotif('Amanda', '~r~Vous avez fait une erreur~w~', "Vous roulez trop vite, vitesse limite : " ..speed_limit_ville.. " km/h~w~!\n~r~Nombre d'erreurs " ..DriveErrors.. "/5", 'CHAR_HITCHER_GIRL', 'CHAR_HITCHER_GIRL')
					Wait(2000)
				end

				if TesOuFDPRendMonQuad == 2 and GetSpeed >= speed_limit_otoroute then
					tooMuchSpeed = true
					DriveErrors       = DriveErrors + 1
					IsAboveSpeedLimit = true
					AdvancedNotif('Amanda', '~r~Vous avez fait une erreur~w~', "Vous roulez trop vite, vitesse limite : " ..speed_limit_otoroute.. " km/h~w~!\n~r~Nombre d'erreurs " ..DriveErrors.. "/5", 'CHAR_HITCHER_GIRL', 'CHAR_HITCHER_GIRL')
					Wait(2000)
				end

				if HasEntityCollidedWithAnything(vehicle) and DamageControl == 0 then
					DriveErrors       = DriveErrors + 1
					AdvancedNotif('Amanda', '~r~Vous avez fait une erreur~w~', "Votre vehicule c\'est pris des dégats\n~r~Nombre d'erreurs " ..DriveErrors.. "/5", 'CHAR_HITCHER_GIRL', 'CHAR_HITCHER_GIRL')
					Wait(2000)
				end

				if not tooMuchSpeed then
					IsAboveSpeedLimit = false
				end

				if GetEntityHealth(vehicle) < GetEntityHealth(vehicle) then

					DriveErrors = DriveErrors + 1

					AdvancedNotif('Amanda', '~r~Vous avez fait une erreur~w~', "Votre vehicule c\'est pris des dégats\n~r~Nombre d'erreurs " ..DriveErrors.. "/5", 'CHAR_HITCHER_GIRL', 'CHAR_HITCHER_GIRL')
					
					VehicleHealth = GetEntityHealth(vehicle)
					Wait(2000)
				end
				if DriveErrors >= 5 then
					CurrentCheckPoint = 10
					RemoveBlip(CurrentBlip)
					SetNewWaypoint(204.82, 377.133)
					DrawMarker(36, 204.82, 377.133, 107.24, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.5, 1.5, 1.5, 102, 204, 102, 100, false, true, 2, false, false, false, false)
					local dist = Vdist2(GetEntityCoords(PlayerPedId()), 204.82, 377.133, 107.24)
					if dist <= 2.5 then
						HelpNotif("Appuyez sur ~INPUT_TALK~ pour rendre le véhicule.")
						if IsControlJustPressed(0, 51) then
							StopDriveTest(false)
							DriveErrors = 0
							CurrentCheckPoint = 0
							RemoveBlip(CurrentBlip)
						end
					end
				end
			end
		else -- si jamais il prend pas en compte
			Wait(500)
		end
	end
end

local function StartDriveTest()
	CurrentTest = 'drive'
	startedconduite = true

	drivetest = "voiture"

	RequestModel(GetHashKey("rhapsody"))

	while not HasModelLoaded(GetHashKey("rhapsody")) do
        Wait(100)
    end

	local veh = CreateVehicle(GetHashKey("rhapsody"), 213.61, 389.34, 106.85, 171.44, 1, 0)
	TaskEnterVehicle(GetPlayerPed(-1), veh, 20000, -1, 2.0, 3, 0)

	RequestModel(0x242C34A7)
    while not HasModelLoaded(0x242C34A7) do
        Wait(100)
	end
	
	pedssss = CreatePedInsideVehicle(veh, 5, 0x242C34A7, 0, true, false)
	SetEntityAsMissionEntity(pedssss, 0, 0)
	AdvancedNotif('Amanda', '~r~Me voila !~w~', 'Tenez votre voiture, bonne route et bonne chance !', 'CHAR_HITCHER_GIRL', 'CHAR_HITCHER_GIRL')

	StartConduite()
end

local function StartDriveTestMoto()
	CurrentTest = 'drive'
	startedconduite = true

	drivetest = "moto"

	RequestModel(GetHashKey("bati"))

	while not HasModelLoaded(GetHashKey("bati")) do
        Wait(100)
	end
	
    local veh = CreateVehicle(GetHashKey("bati"), 213.61, 389.34, 106.85, 171.44, 1, 0)
	TaskEnterVehicle(GetPlayerPed(-1), veh, 20000, -1, 2.0, 3, 0)

	RequestModel(0x242C34A7)
    while not HasModelLoaded(0x242C34A7) do
        Wait(100)
	end
	pedssss = CreatePedInsideVehicle(veh, 5, 0x242C34A7, 0, true, false)
	SetEntityAsMissionEntity(pedssss, 0, 0)
	AdvancedNotif('Amanda', '~r~Me voila !~w~', 'Tenez votre moto, bonne route et bonne chance !', 'CHAR_HITCHER_GIRL', 'CHAR_HITCHER_GIRL')

	StartConduite()
end

local function StartDriveTestCamion()
	CurrentTest = 'drive'

	drivetest = "camion"

	startedconduite = true

	RequestModel(GetHashKey("mule"))

	while not HasModelLoaded(GetHashKey("mule")) do
        Wait(100)
	end
	
    local veh = CreateVehicle(GetHashKey("mule"), 213.61, 389.34, 106.85, 171.44, 1, 0)
	TaskEnterVehicle(GetPlayerPed(-1), veh, 20000, -1, 2.0, 3, 0)

	RequestModel(0x242C34A7)
    while not HasModelLoaded(0x242C34A7) do
        Wait(100)
	end
	pedssss = CreatePedInsideVehicle(veh, 5, 0x242C34A7, 0, true, false)
	SetEntityAsMissionEntity(pedssss, 0, 0)
	AdvancedNotif('Amanda', '~r~Me voila !~w~', 'Tenez votre camion, bonne route et bonne chance !', 'CHAR_HITCHER_GIRL', 'CHAR_HITCHER_GIRL')

	StartConduite()
end

local data = {code = false, voiture = false, moto = false, camion = false}

RMenu.Add('autoecole', 'main',  RageUI.CreateMenu('Auto Ecole', '~b~Bienvenue à l\'auto-ecole'))
RMenu.Add('autoecole', 'question',  RageUI.CreateMenu('Auto Ecole', '~b~Bienvenue à l\'auto-ecole'))
RMenu.Add('autoecole', 'code',  RageUI.CreateMenu('Auto Ecole', '~b~Bienvenue dans le code de l\'auto-ecole'))
RMenu.Add('autoecole', 'code2', RageUI.CreateSubMenu(RMenu:Get('autoecole', 'code'), "Auto Ecole", "~b~Question #2"))
RMenu.Add('autoecole', 'code3', RageUI.CreateSubMenu(RMenu:Get('autoecole', 'code2'), "Auto Ecole", "~b~Question #3"))
RMenu.Add('autoecole', 'code4', RageUI.CreateSubMenu(RMenu:Get('autoecole', 'code3'), "Auto Ecole", "~b~Question #4"))
RMenu.Add('autoecole', 'code5', RageUI.CreateSubMenu(RMenu:Get('autoecole', 'code4'), "Auto Ecole", "~b~Question #5"))
RMenu.Add('autoecole', 'codefini', RageUI.CreateSubMenu(RMenu:Get('autoecole', 'code5'), "Auto Ecole", "~b~Code fini !"))

local function UpdateState()

	TriggerServerCallback("getInfoAutoEcole", function(ilalecode)
		if ilalecode == "true" then
			data.voiture = true
		elseif ilalecode == "false" then
			data.voiture = false
		end
	end, "voiture")
	
	TriggerServerCallback("getInfoAutoEcole", function(ilalecode)		
		if ilalecode == "true" then
			data.moto = true
		elseif ilalecode == "false" then
			data.moto = false
		end
	end, "moto")

	TriggerServerCallback("getInfoAutoEcole", function(ilalecode)		
		if ilalecode == "true" then
			data.camion = true
		elseif ilalecode == "false" then
			data.camion = false
		end
	end, "camion")

end

UpdateState()

local IsMenuAutoOpen 	= false
local IsMenuAutoOpen2 	= false

function OpenAutoMenuC()
	while IsMenuAutoOpen2 do
		
		Wait(1)
		

		if not RageUI.Visible(RMenu:Get('autoecole', 'main')) then
			IsMenuAutoOpen2 = false
		end
		
		RageUI.IsVisible(RMenu:Get('autoecole', 'main'), true, true, true, function()

			if not data.voiture and not blockitvoiture then
				RageUI.Button("Passer le permis voiture", "Passer le permis voiture pour 50$.", { RightLabel = "50$" }, true, function(_, _, Selected)
					if Selected then
			--         TriggerServerEvent("InitialCore:RemoveMoney", PlayerPedId(), 50)
						StartDriveTest()
						RageUI.CloseAll()
					end
				end)
			end

			if not data.moto and not blockitmoto then
				RageUI.Button("Passer le permis moto", "Passer le permis moto pour 30$.", { RightLabel = "30$" }, true, function(_, _, Selected)
					if Selected then
						StartDriveTestMoto()
						RageUI.CloseAll()
					end
				end)
			end

			if not data.camion and not blockitcamion then
				RageUI.Button("Passer le permis camion", "Passer le permis camion pour 100$.", { RightLabel = "100$" }, true, function(_, _, Selected)
					if Selected then
						StartDriveTestCamion()
						RageUI.CloseAll()
					end
				end)
			end

		end)

	end

end

function OpenAutoMenuQ()
    while IsMenuAutoOpen do
		Wait(1)
		
		if not RageUI.Visible(RMenu:Get('autoecole', 'question')) and not RageUI.Visible(RMenu:Get('autoecole', 'code')) and not RageUI.Visible(RMenu:Get('autoecole', 'code2')) and not RageUI.Visible(RMenu:Get('autoecole', 'code3')) and not RageUI.Visible(RMenu:Get('autoecole', 'code4')) and not RageUI.Visible(RMenu:Get('autoecole', 'code5')) and not RageUI.Visible(RMenu:Get('autoecole', 'codefini')) then
			IsMenuAutoOpen = false
			DisableControlAction(0, 177, false)
		else
			DisableControlAction(0, 177, true)
        end

		RageUI.IsVisible(RMenu:Get('autoecole', 'question'), true, true, true, function()

			RageUI.Button("Passer le code", "Passer le code pour 25$.", { RightLabel = "25$" }, true, function(_, _, Selected)
			end, RMenu:Get('autoecole', 'code'))
			
		end)

		RageUI.IsVisible(RMenu:Get('autoecole', 'code'), true, true, true, function()

			RageUI.Separator("[ Est t-il possible de griller un feu rouge ? ]")

			RageUI.Button("Oui si je tourne a droite et que la voie est libre", nil, {}, true, function(_, _, Selected)
				if Selected then
					cvrai = cvrai + 1
                end
			end, RMenu:Get('autoecole', 'code2'))
			
			RageUI.Button("Oui si je tourne a gauche et que la voie est libre", nil, {}, true, function(_, _, Selected)
			end, RMenu:Get('autoecole', 'code2'))
			
			RageUI.Button("Non jamais", nil, {}, true, function(_, _, Selected)
			end, RMenu:Get('autoecole', 'code2'))

		end)

		RageUI.IsVisible(RMenu:Get('autoecole', 'code2'), true, true, true, function()

			RageUI.Separator("[ Un mec te bloque la route et te fonce dedant tu fais quoi ? ]")

			RageUI.Button("Je lui pete la gueule", nil, {}, true, function(_, _, Selected)
			end, RMenu:Get('autoecole', 'code3'))

			RageUI.Button("Je m'arrete tranquilement et je fais un constat", nil, {}, true, function(_, _, Selected)
				if Selected then
					cvrai = cvrai + 1
                end
			end, RMenu:Get('autoecole', 'code3'))

			RageUI.Button("Je roule car j'ai peur", nil, {}, true, function(_, _, Selected)
			end, RMenu:Get('autoecole', 'code3'))

		end)

		RageUI.IsVisible(RMenu:Get('autoecole', 'code3'), true, true, true, function()

			RageUI.Separator("[ Un chat traverse la route ]")

			RageUI.Button("Je continue mais je risque de l'écraser", nil, {}, true, function(_, _, Selected)
			end, RMenu:Get('autoecole', 'code4'))

			RageUI.Button("Je freine, je fais un signal de phares et j'attend", nil, {}, true, function(_, _, Selected)
				if Selected then
					cvrai = cvrai + 1
				end
			end, RMenu:Get('autoecole', 'code4'))

			RageUI.Button("Je le prends avec moi", nil, {}, true, function(_, _, Selected)
			end, RMenu:Get('autoecole', 'code4'))

		end)


		RageUI.IsVisible(RMenu:Get('autoecole', 'code4'), true, true, true, function()

			RageUI.Separator("[ Quel est le taux maximum d'alcool dans le sang sur la route ]")

			RageUI.Button("0.06%", nil, {}, true, function(_, _, Selected)
			end, RMenu:Get('autoecole', 'code5'))

			RageUI.Button("0.12%", nil, {}, true, function(_, _, Selected)
			end, RMenu:Get('autoecole', 'code5'))

			
			RageUI.Button("0.08%", nil, {}, true, function(_, _, Selected)
				if Selected then
					cvrai = cvrai + 1
				end
			end, RMenu:Get('autoecole', 'code5'))


		end)

		RageUI.IsVisible(RMenu:Get('autoecole', 'code5'), true, true, true, function()

			RageUI.Separator("[ Un policier active ces gyrophares ]")

			RageUI.Button("Je me met sur le bas coter", nil, {}, true, function(_, _, Selected)
				if Selected then
					cvrai = cvrai + 1
                end
			end, RMenu:Get('autoecole', 'codefini'))

			RageUI.Button("Je trace", nil, {}, true, function(_, _, Selected)
			end, RMenu:Get('autoecole', 'codefini'))

			RageUI.Button("Je le tue car c'est un cops", nil, {}, true, function(_, _, Selected)
			end, RMenu:Get('autoecole', 'codefini'))

		end)

		-- A Moto / B Voiture / C Camion / D poids lourds

		RageUI.IsVisible(RMenu:Get('autoecole', 'codefini'), true, true, true, function()

			if cvrai >= 5 then

				RageUI.Separator("[ Félicitations ! ]")

				RageUI.Button("Récupérer son code", nil, {}, true, function(_, _, Selected)
					if Selected then
						TriggerServerEvent("InitialCore:GiveCode")
						RageUI.CloseAll()
						AdvancedNotif('Luc', '~r~Félicitations~w~', "Vous avez reçu votre code", 'CHAR_BARRY', 'CHAR_BARRY')
					end
				end)

			else

				RageUI.Separator("[ Vous avez échoué ! ]")

				RageUI.Button("Repasser votre code une prochaine fois", nil, {}, true, function(_, _, Selected)
					if Selected then
						RageUI.CloseAll()
					end
				end)

			end

		end)


    end
end

CreateThread(function()
    while true do
        Wait(1)

		local plyCoords = GetEntityCoords(GetPlayerPed(-1))
        local dist = Vdist2(plyCoords.x, plyCoords.y, plyCoords.z, 228.83, 374.56, 106.11)

		if dist <= 500 then
			if dist <= 2.0 then
				HelpNotif("Appuyez sur ~INPUT_TALK~ pour intéragir avec ~b~Luc.")
				if IsControlJustPressed(0, 51) then
					TriggerServerCallback("getInfoAutoEcole", function(ilalecode)
						if ilalecode == "true" then
							IsMenuAutoOpen2 = true
							RageUI.Visible(RMenu:Get('autoecole', 'main'), not RageUI.Visible(RMenu:Get('autoecole', 'main')))
							OpenAutoMenuC()
						elseif ilalecode == "false" then
							IsMenuAutoOpen = true
							RageUI.Visible(RMenu:Get('autoecole', 'question'), not RageUI.Visible(RMenu:Get('autoecole', 'question')))
							OpenAutoMenuQ()
						end
					end, "code")
				end
			end
		else
			Wait(7500)
		end

    end
end)

CreateThread(function()
	RequestModel(GetHashKey("ig_djsolmanager"))
	while not HasModelLoaded(GetHashKey("ig_djsolmanager")) do
		Wait(200)
	end

	pietonped = CreatePed(5, GetHashKey("ig_djsolmanager"), 393.65, -111.565, 64.29, 239.05, true, false)
	FreezeEntityPosition(pietonped, true)
	SetBlockingOfNonTemporaryEvents(pietonped, true)
end)


CreateThread(function()
    local hash = GetHashKey("cs_bankman")
    while not HasModelLoaded(hash) do
    RequestModel(hash)
    Wait(2000)
    end
    local ped = CreatePed("PED_TYPE_CIVFEMALE", "cs_bankman", 228.55, 374.62, 105.11, 161.96, false, true) 
    SetBlockingOfNonTemporaryEvents(ped, true)
    FreezeEntityPosition(ped, true)
	SetEntityInvincible(ped, true)
	
	local blipauto = AddBlipForCoord(228.55, 374.62, 105.11)
	SetBlipSprite (blipauto, 525)
	SetBlipDisplay(blipauto, 4)
	SetBlipScale  (blipauto, 0.7)
	SetBlipAsShortRange(blipauto, true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Auto-école")
	EndTextCommandSetBlipName(blipauto)
end)