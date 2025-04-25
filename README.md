# Walker-TimeAndWeather for FiveM

**Live Server Time, In-City Game Time, and Weather HUD Display**

---

## Overview
**Walker-TimeAndWeather** is a lightweight FiveM script designed to display real-time server time (GMT), in-game city time, and current weather conditions directly on players' HUDs, positioned cleanly above the minimap. This resource provides immersive and constantly updated environmental information, helping players stay oriented with both server and in-city timelines.

This is ideal for realistic roleplay servers, time-sensitive job systems, and enhancing player immersion.

---

## Features
- **Real-Time Server Time (GMT):** Displays the server's real-world time.
- **In-City Time:** Displays the live in-game time (syncs with GTA clock).
- **Current Weather Conditions:** Pulled dynamically from `qb-weathersync`.
- **Sleek, Non-Intrusive HUD Placement:** Neatly positioned above the minimap.
- **Automatic Updates:**
  - Server time and weather update every 10 seconds.
  - In-game time updates every 2 seconds.
- **Optimized for Performance:** Minimal resource footprint with event-driven design.

---

## Prerequisites
Ensure your FiveM server includes the following:

- [**QB-Core Framework**](https://github.com/qbcore-framework/qb-core) *(or compatible QBox version)*
- [**qb-weathersync**](https://github.com/qbcore-framework/qb-weathersync)

> **Important:**
> If you are using QBox or a custom fork, verify that `exports['qb-core']:GetCoreObject()` is correct in `server.lua`.

---

## Installation
1. Download or clone this repository.
2. Place the folder `walker-timeandweather` into your server's `resources` directory.
3. Add the following line to your `server.cfg`:
    ```
    ensure walker-timeandweather
    ```
4. Restart your server or refresh your resources.

---

## How It Works
- **server.lua**
  - Every 10 seconds, it:
    - Captures the server's GMT time using `os.date`.
    - Retrieves current weather via the `qb-weathersync` export.
    - Broadcasts both to all connected clients.

- **client.lua**
  - Receives and stores server time and weather updates.
  - Continuously updates in-game time every 2 seconds.
  - Draws all data (Server Time | Weather | In-City Time) on the screen using GTA V native UI functions.

### HUD Layout
```
In-City Time: 13:27
Server Time: 12:27 | Weather: CLEAR
```

- Displayed at approximately 1.5 cm above the minimap for clean readability.

---

## Customization
- **Positioning**
  - You can adjust `baseX` and `baseY` inside the render loop in `client.lua` if you want to reposition the HUD text.
- **Update Intervals**
  - Modify `Wait(2000)` and `Wait(10000)` in `client.lua` and `server.lua` respectively to control update speeds.
- **Text Style**
  - Change the font, size, or colour by adjusting `SetTextFont`, `SetTextScale`, and `SetTextColour` inside the `DrawTextOnScreen` function.

---

## File Structure
```
walker-timeandweather/
├── client.lua        # Draws HUD elements and updates in-game time
├── server.lua        # Sends real-time server clock and weather updates
├── fxmanifest.lua    # Resource manifest and metadata
```

---

## Known Issues / Notes
- Server time is based on GMT (`os.date("!%H:%M")`), not local server time. Adjust if your server uses a different timezone.
- Requires qb-weathersync for accurate weather reporting.
- Minimal CPU usage; designed to be ultra-lightweight and low impact.

---

## Credits
- Developed by Bryan Walker (@superspiderman4697 on Discord)
- Special thanks to the FiveM and QB-Core communities.

---

## License
Walker-TimeAndWeather is released under the GPL License. Feel free to modify and redistribute with credit.

---

## Support
For questions, suggestions, or support, please open an issue on GitHub or contact @superspiderman4697 on Discord.

---

*"Stay informed. Stay immersed."* 🌦️🕒

