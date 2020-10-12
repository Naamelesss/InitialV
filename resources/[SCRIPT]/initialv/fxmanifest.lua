fx_version 'bodacious'
game 'gta5'
description 'InitialV Utilitaires (LUA)'
version '1.1.0'

client_scripts {
    '@InitUI/src/NativeUIReloaded.lua',
    '@InitLua/function.lua',
    '@InitLua/skin_c.lua',

    "src/RMenu.lua",
    "src/menu/RageUI.lua",
    "src/menu/Menu.lua",
    "src/menu/MenuController.lua",
    "src/components/*.lua",
    "src/menu/elements/*.lua",
    "src/menu/items/*.lua",
    "src/menu/panels/*.lua",
    "src/menu/panels/*.lua",
    "src/menu/windows/*.lua",

    "male_torsos.json",
    "female_torsos.json",
    "concess_voiture.json",

    'calmAI/client.lua',

    'personnal.lua',
    'superettes.lua',
    'savegunshop.lua',
    'idcard.lua',
    'gestionhangar.lua',
    'jobcenter.lua',
    'couturierjob.lua',
    'policejob.lua',
    'concess.lua',
    'creationpersov2.lua',
    'vetement.lua',

    'banque_c.lua',

    'illegal/reputation.lua',

    'propriete/agentimmo.lua',

    'adminmenu.lua',

    'illegal/recolte.lua',
    
    'cheat.lua',

    'self/personnal.lua',

    'parking/client.lua',

    'ems/ambulance_c.lua',

    'time/sync.lua',

    'bennys/client.lua',

    'acompiler/mowerjob.lua',

    --'acompiler/supperettesv2.lua'
    'acompiler/autoecole.lua',
    'acompiler/chimiste.lua',
    'acompiler/mineurjob.lua',

    'location.lua'
}

files {
	'calmAI/events.meta',
	'calmAI/relationships.dat'
}

data_file 'FIVEM_LOVES_YOU_4B38E96CC036038F' 'calmAI/events.meta'

server_scripts {
    '@mysql-async/lib/MySQL.lua',
    '@InitLua/function_s.lua',
    'server.lua',
    'banque_s.lua',
    'policejob_s.lua',
    'concess_s.lua',
    'adminmenu_s.lua',

    'propriete/agentimmo_s.lua',

    'illegal/recolte_s.lua',

    'illegal/illegal_s.lua',

    'parking/server.lua',

    'ems/ambulance_s.lua',

    'time/sync_s.lua',

    'bennys/server.lua',

    --'acompiler/supperettesv2_s.lua'
    'acompiler/autoecole_s.lua',
    'acompiler/chimiste_s.lua'
}

-- INVENTAIRE

server_scripts {
    "inv_server/main.lua",
    "inv_server/serverbouffe.lua",
    "inv_config.lua"
  }
  
  client_scripts {
    "inv_client/main.lua",
    "inv_client/trunk.lua",
    "inv_client/glovebox.lua",
    "inv_client/property.lua",
    "inv_client/player.lua",
    "inv_client/clientbouffe.lua",
    "inv_config.lua"
  }
  
  ui_page {
      'inv_html/ui.html'
  }
  
  files {
    "inv_html/ui.html",
    "inv_html/css/ui.css",
    "inv_html/css/jquery-ui.css",
    "inv_html/js/inventory.js",
    "inv_html/js/config.js",
    -- JS LOCALES
    "inv_html/locales/nl.js",
    -- IMAGES
    "inv_html/img/*.png",
    "inv_html/img/items/*.png",
  }

dependencies 'InitLua'