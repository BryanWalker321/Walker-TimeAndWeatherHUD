local serverTime = "Loading..."
local currentWeather = "Loading..."
local inGameTime = "Loading..."

-- Update server time
RegisterNetEvent('updateServerTime', function(time)
    serverTime = time
end)

-- Update weather
RegisterNetEvent('updateWeather', function(weather)
    currentWeather = weather
end)

-- Update in-game time
CreateThread(function()
    while true do
        local hour, minute = GetClockHours(), GetClockMinutes() -- Fetch in-game time
        inGameTime = string.format("%02d:%02d", hour, minute) -- Format as HH:MM
        Wait(2000) -- Update every 2 seconds
    end
end)

-- Function to draw text on the screen
local function DrawTextOnScreen(x, y, text, scale, r, g, b, a)
    SetTextFont(4)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x, y)
end

-- Render loop for HUD
CreateThread(function()
    while true do
        Wait(0)

        -- Adjust position slightly higher above the minimap
        local baseX, baseY = 0.015, 0.73 -- Adjusted for better placement

        -- Display in-game time on a new line above
        DrawTextOnScreen(baseX, baseY - 0.03, "In-City Time: " .. inGameTime, 0.45, 255, 255, 255, 255)

        -- Combine server time and weather on one line
        local displayText = "Server Time: " .. serverTime .. " | Weather: " .. currentWeather
        DrawTextOnScreen(baseX, baseY, displayText, 0.45, 255, 255, 255, 255)
    end
end)
