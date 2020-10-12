fx_version 'bodacious'
game 'gta5'
description 'InitialV Core (LUA)'
version '0.7.1'

ui_page "speedometer/index.html"
files {
    "speedometer/script.js",
    "speedometer/index.html",
    "speedometer/style.css"
}

client_scripts {'@InitUI/src/NativeUIReloaded.lua', 'core_c.lua', 'skin_c.lua', 'function.lua', 'instance_c.lua', 'item.lua', 'speedometer_c.lua'}

server_scripts {'@mysql-async/lib/MySQL.lua', 'function_s.lua', 'core_s.lua', 'skin_s.lua', 'instance_s.lua', 'cron_s.lua'}