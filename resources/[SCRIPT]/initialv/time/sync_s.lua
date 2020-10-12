local CurrentWeather = "FIRST"
local Hours = 12
local Mins = 0

local function NextWeather()
    if CurrentWeather == "CLEAR" or CurrentWeather == "CLOUDS" or CurrentWeather == "EXTRASUNNY"  then
        local new = math.random(1,2)
        if new == 1 then
            CurrentWeather = "CLEARING"
        else
            CurrentWeather = "OVERCAST"
        end
    elseif CurrentWeather == "CLEARING" or CurrentWeather == "OVERCAST" then
        local new = math.random(1,6)
        if new == 1 then
            if CurrentWeather == "CLEARING" then CurrentWeather = "FOGGY" else CurrentWeather = "RAIN" end
        elseif new == 2 then
            CurrentWeather = "CLOUDS"
        elseif new == 3 then
            CurrentWeather = "CLEAR"
        elseif new == 4 then
            CurrentWeather = "EXTRASUNNY"
        elseif new == 5 then
            CurrentWeather = "SMOG"
        else
            CurrentWeather = "FOGGY"
        end
    elseif CurrentWeather == "THUNDER" or CurrentWeather == "RAIN" then
        CurrentWeather = "CLEARING"
    elseif CurrentWeather == "SMOG" or CurrentWeather == "FOGGY" then
        CurrentWeather = "CLEAR"
    end
    if CurrentWeather == "FIRST" then
        CurrentWeather = "EXTRASUNNY"
    end
    print("^0[^1InitialCore^0] ^2Changement de meteo : " .. CurrentWeather .. "^0")
    TriggerClientEvent('InitialCore:ChangeWeather', -1, CurrentWeather)
end

CreateThread(function()
    while true do
        Mins = Mins+1
        if Mins == 61 then
            Mins = 0
            Hours = Hours+1
            if Hours == 25 then
                Hours = 0
            end
        end
        Wait(2000)
    end
end)

CreateThread(function()
    while true do
        Wait(5000)
        NextWeather()
        Wait(600000-5000)
    end
end)

RegisterServerCallback('InitialCore:RequestFirstConnexion', function(source, callback)
    while CurrentWeather == "FIRST" do Wait(250) end
    callback(CurrentWeather, Hours, Mins)
end)