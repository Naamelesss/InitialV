fx_version 'bodacious'
game 'gta5'
description 'InitialV Cheats (LUA)'
version '1.1.0'

client_scripts {
    '@InitLua/function.lua',
    'cheat.lua',
    'anticheat.lua'
}

server_scripts {
    '@InitLua/function_s.lua',
    '@mysql-async/lib/MySQL.lua',
    'anticheat_s_wrapper.lua',
    'anticheat_s.lua'
}