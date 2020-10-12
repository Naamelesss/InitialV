###############
# INSTRUCTION #
###############

1. Add folder 'welldone_carhud' to 'resources' folder;
2. Add 'start welldone_carhud' to your 'server.cfg';

Colors
##############################################################################################################################
If you want to change HUDs colors, you have to edit "ui.html" file;
Edit each value ' stop-color="#98D4E0" ' to any primary color;
Edit each value ' stop-color="#0E718B" ' to any secondary color;
##############################################################################################################################


Weather
##############################################################################################################################
If you use "vSync" and you want to have current weather displayed, edic "vs_client.lua" iin "vSync" script.
Change  part "KOD 1" to "KOD 2";
##############################################################################################################################
KOD 1:
##############################################################################################################################
Citizen.CreateThread(function()
    while true do
        if lastWeather ~= CurrentWeather then
            lastWeather = CurrentWeather
            SetWeatherTypeOverTime(CurrentWeather, 15.0)
            Citizen.Wait(15000)
        end
        Citizen.Wait(100) -- Wait 0 seconds to prevent crashing.
        SetBlackout(blackout)
        ClearOverrideWeather()
        ClearWeatherTypePersist()
        SetWeatherTypePersist(lastWeather)
        SetWeatherTypeNow(lastWeather)
        SetWeatherTypeNowPersist(lastWeather)
        if lastWeather == 'XMAS' then
            SetForceVehicleTrails(true)
            SetForcePedFootstepsTracks(true)
        else
            SetForceVehicleTrails(false)
            SetForcePedFootstepsTracks(false)
        end
    end
end)
##############################################################################################################################
KOD 2:
##############################################################################################################################
Citizen.CreateThread(function()
    while true do
        if lastWeather ~= CurrentWeather then
            lastWeather = CurrentWeather
            SetWeatherTypeOverTime(CurrentWeather, 15.0)
            Citizen.Wait(15000)
        end
        Citizen.Wait(100) -- Wait 0 seconds to prevent crashing.
        SetBlackout(blackout)
        ClearOverrideWeather()
        ClearWeatherTypePersist()
        SetWeatherTypePersist(lastWeather)
        SetWeatherTypeNow(lastWeather)
        SetWeatherTypeNowPersist(lastWeather)
        TriggerEvent('welldone_carhud:UstawPogode', lastWeather)
        if lastWeather == 'XMAS' then
            SetForceVehicleTrails(true)
            SetForcePedFootstepsTracks(true)
        else
            SetForceVehicleTrails(false)
            SetForcePedFootstepsTracks(false)
        end
    end
end)
##############################################################################################################################