resource_manifest_version '05cfa83c-a124-4cfa-a768-c24a5811d8f9'

description 'Wifi'

version '1.0.0'

server_scripts {
    'server/main.lua',
    'config.lua'
}

client_script {
    'client/main.lua',
    'config.lua'
}

ui_page('html/index.html')

files {
    'html/index.html',
    'html/app.js'
}