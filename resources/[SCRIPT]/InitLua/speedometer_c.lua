------------------------------------------------------------------------------
--
-- Ce travail est sous liscence:
-- Creative Commons Attribution-NonCommercial-NoDerivatives-NoDistribution 4.0 International License.
--
------------------------------------------------------------------------------

local ind = {l = false, r = false}

local IsHud = false

Citizen.CreateThread(function()
	while true do
		local Ped = GetPlayerPed(-1)
		if(IsPedInAnyVehicle(Ped)) then
			local PedCar = GetVehiclePedIsIn(Ped, false)
			if PedCar and GetPedInVehicleSeat(PedCar, -1) == Ped then

				-- Speed
				carSpeed = math.ceil(GetEntitySpeed(PedCar) * 3.6)
				SendNUIMessage({
					showhud = true,
					speed = carSpeed
				})
				if not IsHud then
					IsHud = true
					DisplayRadar(true)
				end

				-- Lights
				_,feuPosition,feuRoute = GetVehicleLightsState(PedCar)
				if(feuPosition == 1 and feuRoute == 0) then
					SendNUIMessage({
						feuPosition = true
					})
				else
					SendNUIMessage({
						feuPosition = false
					})
				end
				if(feuPosition == 1 and feuRoute == 1) then
					SendNUIMessage({
						feuRoute = true
					})
				else
					SendNUIMessage({
						feuRoute = false
					})
				end

				-- Turn signal
				-- SetVehicleIndicatorLights (1 left -- 0 right)
				local VehIndicatorLight = GetVehicleIndicatorLights(GetVehiclePedIsUsing(PlayerPedId()))

				if IsControlJustPressed(1, 172) then -- UP ARROW is pressed
					SetVehicleIndicatorLights(GetVehiclePedIsUsing(GetPlayerPed(-1)), 1, ind.r)
					SetVehicleIndicatorLights(GetVehiclePedIsUsing(GetPlayerPed(-1)), 0, ind.l)
				end

				if(VehIndicatorLight == 0) then
					SendNUIMessage({
						clignotantGauche = false,
						clignotantDroite = false,
					})
				elseif(VehIndicatorLight == 1) then
					SendNUIMessage({
						clignotantGauche = true,
						clignotantDroite = false,
					})
				elseif(VehIndicatorLight == 2) then
					SendNUIMessage({
						clignotantGauche = false,
						clignotantDroite = true,
					})
				elseif(VehIndicatorLight == 3) then
					SendNUIMessage({
						clignotantGauche = true,
						clignotantDroite = true,
					})
				end

			else
				SendNUIMessage({
					showhud = false
				})
				if IsHud then
					IsHud = false
					DisplayRadar(false)
				end
			end
		else
			SendNUIMessage({
				showhud = false
			})
			if IsHud then
				IsHud = false
				DisplayRadar(false)
			end
		end

		Wait(300)
	end
end)

-- Consume fuel factor
Citizen.CreateThread(function()
	while true do
		local Ped = GetPlayerPed(-1)
		if(IsPedInAnyVehicle(Ped)) then
			local PedCar = GetVehiclePedIsIn(Ped, false)
			if PedCar and GetPedInVehicleSeat(PedCar, -1) == Ped then
				carSpeed = math.ceil(GetEntitySpeed(PedCar) * 3.6)
				fuel = GetVehicleFuelLevel(PedCar)
				rpm = GetVehicleCurrentRpm(PedCar)
				rpmfuel = 0

				if rpm > 0.9 then
					rpmfuel = fuel - rpm / 0.8
					Wait(10000)
				elseif rpm > 0.8 then
					rpmfuel = fuel - rpm / 1.1
					Wait(15000)
				elseif rpm > 0.7 then
					rpmfuel = fuel - rpm / 2.2
					Wait(20000)
				elseif rpm > 0.6 then
					rpmfuel = fuel - rpm / 4.1
					Wait(30000)
				elseif rpm > 0.5 then
					rpmfuel = fuel - rpm / 5.7
					Wait(40000)
				elseif rpm > 0.4 then
					rpmfuel = fuel - rpm / 6.4
					Wait(50000)
				elseif rpm > 0.3 then
					rpmfuel = fuel - rpm / 6.9
					Wait(60000)
				elseif rpm > 0.2 then
					rpmfuel = fuel - rpm / 7.3
					Wait(80000)
				else
					rpmfuel = fuel - rpm / 7.5
					Wait(150000)
				end

				carFuel = SetVehicleFuelLevel(PedCar, rpmfuel)

				SendNUIMessage({
			showfuel = true,
					fuel = fuel
				})
			end
		end

		Wait(150)
	end
end)

RegisterCommand('+leftdirector', function()
	ind.r = not ind.r
	SetVehicleIndicatorLights(GetVehiclePedIsUsing(GetPlayerPed(-1)), 1, ind.r)
end, false)
RegisterCommand('-leftdirector', function()
end, false)

RegisterKeyMapping('+leftdirector', 'Clignotant gauche', 'keyboard', 'NUM4')

RegisterCommand('+rightdirector', function()
	ind.l = not ind.l
	SetVehicleIndicatorLights(GetVehiclePedIsUsing(GetPlayerPed(-1)), 0, ind.l)
end, false)
RegisterCommand('-rightdirector', function()
end, false)

RegisterKeyMapping('+rightdirector', 'Clignotant droit', 'keyboard', 'NUM6')