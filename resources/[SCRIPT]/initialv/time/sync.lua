------------------------------------------------------------------------------
--
-- Ce travail est sous liscence:
-- Creative Commons Attribution-NonCommercial-NoDerivatives-NoDistribution 4.0 International License.
--
------------------------------------------------------------------------------

local function ChangeWeather(weather)
    SetWeatherTypeOverTime(weather, 15.0)
    ClearOverrideWeather()
    ClearWeatherTypePersist()
    SetWeatherTypePersist(weather)
    SetWeatherTypeNow(weather)
    SetWeatherTypeNowPersist(weather)
    print("^0[^1InitialCore^0] ^2Changement de météo : " .. weather .. "^0")
end

local function ChangeTime(hours, min)
    NetworkOverrideClockTime(hours, min, 0)
    print("^0[^1InitialCore^0] ^2Changement de temps : " .. hours .. "H" .. min .. "^0")
end

RegisterNetEvent('InitialCore:ChangeWeather')
AddEventHandler('InitialCore:ChangeWeather', function(weather)
    ChangeWeather(weather)
end)

TriggerServerCallback('InitialCore:RequestFirstConnexion', function(weather, hours, min)
    ChangeWeather(weather)
    ChangeTime(hours, min)
end)