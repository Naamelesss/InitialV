Config = {}
Config.Locale = 'nl'
Config.IncludeCash = false -- Include cash in inventory?
Config.IncludeWeapons = false -- Include weapons in inventory?
Config.IncludeAccounts = false -- Include accounts (bank, black money, ...)?
Config.ExcludeAccountsList = {"bank", "money"} -- List of accounts names to exclude from inventory
Config.OpenControl = 289 -- Key for opening inventory. Edit html/js/config.js to change key for closing it.

-- List of item names that will close ui when used
Config.CloseUiItems = {"phone", "weed_seed", "tunerchip", "fixkit", "medikit"}