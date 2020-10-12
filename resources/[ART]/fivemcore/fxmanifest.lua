fx_version 'adamant'
game 'gta5'

-- MAPMANAGER

client_scripts {
    "mapmanager/mapmanager_shared.lua",
    "mapmanager/mapmanager_client.lua"
}

server_scripts {
    "mapmanager/mapmanager_shared.lua",
    "mapmanager/mapmanager_server.lua"
}

server_export "getCurrentGameType"
server_export "getCurrentMap"
server_export "changeGameType"
server_export "changeMap"
server_export "doesMapSupportGameType"
server_export "getMaps"
server_export "roundEnded"

-- CHAT

ui_page 'chat/html/index.html'

client_script 'chat/cl_chat.lua'
server_script 'chat/sv_chat.lua'

files {
    'chat/html/index.html',
    'chat/html/index.css',
    'chat/html/config.default.js',
    'chat/html/config.js',
    'chat/html/App.js',
    'chat/html/Message.js',
    'chat/html/Suggestions.js',
    'chat/html/vendor/vue.2.3.3.min.js',
    'chat/html/vendor/flexboxgrid.6.3.1.min.css',
    'chat/html/vendor/animate.3.5.2.min.css',
    'chat/html/vendor/latofonts.css',
    'chat/html/vendor/fonts/LatoRegular.woff2',
    'chat/html/vendor/fonts/LatoRegular2.woff2',
    'chat/html/vendor/fonts/LatoLight2.woff2',
    'chat/html/vendor/fonts/LatoLight.woff2',
    'chat/html/vendor/fonts/LatoBold.woff2',
    'chat/html/vendor/fonts/LatoBold2.woff2',
}

--SPAWNMANAGER

client_script 'spawnmanager/spawnmanager.lua'

export 'getRandomSpawnPoint'
export 'spawnPlayer'
export 'addSpawnPoint'
export 'removeSpawnPoint'
export 'loadSpawns'
export 'setAutoSpawn'
export 'setAutoSpawnCallback'
export 'forceRespawn'

-- SESSIONMANAGER

server_script 'sessionmanager/server/host_lock.lua'
client_script 'sessionmanager/client/empty.lua'

-- FIVEM

dependency 'basic-gamemode'

-- HARDCAP

client_script 'hardcap/client.lua'
server_script 'hardcap/server.lua'