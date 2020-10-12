resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'initfuel'

version '1.3' 

server_scripts {
	'config.lua'
}

client_scripts {
	'config.lua',
	'functions/functions_client.lua',
	'source/fuel_client.lua'
}

exports {
	'GetFuel',
	'SetFuel'
}
