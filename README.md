# CS 1.6 - Country Blocker
A plugin that lets you specify which countries players can connect to the server from.

# Installation
- Just download the plugin and upload the .amxx file to your plugins folder on your server (or you can of course compile the .sma file and then upload the compilated .amxx file to your server).
- Then write the plugin name (with .amxx) to `/cstrike/addons/amxmodx/configs/plugins.ini`.

# Requirements
- AMX Mod X 1.10
- Make sure that `geoip` is enabled in the `/cstrike/addons/amxmodx/configs/modules.ini` file.

# CVARs (Enter them in the server.cfg file)
`cb_country` - Open [**this website**](https://www.statoids.com/wab.html) and write down the values from column `A-2`. If the website happens to not work for you, I'll also include a .txt file with the plugin where you can find all the countries and their codes.
- *(Example of using CVAR: cb_country "hu, cz, sk, pl") Always use lowercase letters*

`cb_enabled` - Possible values: 1=true; 0=false. Enables or disables the plugin. When the plugin is disabled, players from all countries will be able to join.

`cb_viceversa` - Possible values: 1=true; 0=false. If the value is `0`, only players from the countries listed in the `cb_country` CVAR can join the server. If the value is `1`, all players EXCEPT those from the countries listed in the `cb_country` CVAR can join the server.

# Support
If you having any issues please feel free to write your issue to the issue section :) .