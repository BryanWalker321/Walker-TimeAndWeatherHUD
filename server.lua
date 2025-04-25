local QBCore = exports['qb-core']:GetCoreObject()

CreateThread(function()
    while true do
        -- Get current UK GMT time
        local time = os.date("!%H:%M") -- GMT time
        print("Sending server time: " .. time) -- Debug: Print time to server console
        TriggerClientEvent('updateServerTime', -1, time)

        -- Get current weather using qb-weathersync export
        local currentWeather = exports['qb-weathersync']:getWeatherState()
        print("Sending current weather: " .. currentWeather) -- Debug: Print weather to server console
        TriggerClientEvent('updateWeather', -1, currentWeather)

        Wait(10000) -- Update every 10 seconds
    end
end)
