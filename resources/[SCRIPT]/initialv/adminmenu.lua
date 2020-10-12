------------------------------------------------------------------------------
--
-- Ce travail est sous liscence:
-- Creative Commons Attribution-NonCommercial-NoDerivatives-NoDistribution 4.0 International License.
--
------------------------------------------------------------------------------

RMenu.Add('admin', 'main', RageUI.CreateMenu("Administration", "~b~Menu administration"))
RMenu.Add('admin', 'joueurs', RageUI.CreateSubMenu(RMenu:Get('admin', 'main'), "Liste des joueurs", "~b~Gestion des joueurs en ligne"))
RMenu.Add('admin', 'dev', RageUI.CreateSubMenu(RMenu:Get('admin', 'main'), "Développement", "~b~Outils développement"))
RMenu.Add('mettrejeux', 'main', RageUI.CreateSubMenu(RMenu:Get('admin', 'main'), "Maitre de jeu", "~b~Actions maitre de jeu"))
RMenu.Add('mettrejeux', 'props', RageUI.CreateSubMenu(RMenu:Get('mettrejeux', 'main'), "Props", "~b~Props"))
RMenu.Add('mettrejeux', 'optionpose', RageUI.CreateSubMenu(RMenu:Get('mettrejeux', 'main'), "Pose du props", "~b~Pose du props"))
RMenu:Get('mettrejeux', 'optionpose').Closable = false
RMenu.Add('mettrejeux', 'armes', RageUI.CreateSubMenu(RMenu:Get('mettrejeux', 'props'), "Armes", "~b~Armes"))
RMenu.Add('mettrejeux', 'drogues', RageUI.CreateSubMenu(RMenu:Get('mettrejeux', 'props'), "Drogues", "~b~Drogues"))
RMenu.Add('mettrejeux', 'chaises', RageUI.CreateSubMenu(RMenu:Get('mettrejeux', 'props'), "Chaises", "~b~Chaises"))
RMenu.Add('mettrejeux', 'tables', RageUI.CreateSubMenu(RMenu:Get('mettrejeux', 'props'), "Tables", "~b~Tables"))
RMenu.Add('mettrejeux', 'barrieres', RageUI.CreateSubMenu(RMenu:Get('mettrejeux', 'props'), "Barrières", "~b~Barrières"))
RMenu.Add('mettrejeux', 'caisses', RageUI.CreateSubMenu(RMenu:Get('mettrejeux', 'props'), "Caisses", "~b~Caisses"))
RMenu.Add('admin', 'monjoueur', RageUI.CreateSubMenu(RMenu:Get('admin', 'main'), "Mon joueur", "~b~Gestion de soi"))
RMenu.Add('admin', 'monde', RageUI.CreateSubMenu(RMenu:Get('admin', 'main'), "Actions serveur", "~b~Gestion du serveur"))
RMenu.Add('admin', 'vehicule', RageUI.CreateSubMenu(RMenu:Get('admin', 'main'), "Véhicules", "~b~Gestion du véhicule"))
RMenu.Add('admin', 'optiserver', RageUI.CreateSubMenu(RMenu:Get('admin', 'monde'), "Optimisation serveur", "~b~Optimisation du serveur"))
RMenu.Add('admin', 'selectionjoueur', RageUI.CreateSubMenu(RMenu:Get('admin', 'joueurs'), "Selection joueurs", "~b~Actions sur le joueur sélectionné"))
-- SELECTIONS MENU JOUEURS
RMenu.Add('admin', 'sanctions', RageUI.CreateSubMenu(RMenu:Get('admin', 'selectionjoueur'), "Sanctions", "~b~Sanctions"))
RMenu.Add('admin', 'remboursement', RageUI.CreateSubMenu(RMenu:Get('admin', 'selectionjoueur'), "Remboursement", "~b~Remboursement"))
RMenu.Add('admin', 'roleplay', RageUI.CreateSubMenu(RMenu:Get('admin', 'selectionjoueur'), "Roleplay", "~b~Roleplay"))
RMenu.Add('admin', 'utilitaire', RageUI.CreateSubMenu(RMenu:Get('admin', 'selectionjoueur'), "Utilitaires", "~b~Actions utilitaires"))
RMenu.Add('admin', 'infos', RageUI.CreateSubMenu(RMenu:Get('admin', 'selectionjoueur'), "Informations", "~b~Informations"))
-- SUB MENU DES SUB MENU DES SUB MENU
RMenu.Add('admin', 'kick', RageUI.CreateSubMenu(RMenu:Get('admin', 'sanctions'), "Kick", "~b~Raisons du kick"))
RMenu.Add('admin', 'ban', RageUI.CreateSubMenu(RMenu:Get('admin', 'sanctions'), "Bannissement", "~b~Raisons du ban"))
RMenu.Add('admin', 'morrp', RageUI.CreateSubMenu(RMenu:Get('admin', 'roleplay'), "Mort RP", "~b~Raisons mort rp, informations"))
RMenu.Add('admin', 'warn', RageUI.CreateSubMenu(RMenu:Get('admin', 'sanctions'), "Avertissement", "~b~Raisons du warn"))

local grade

local isMenuOpened = false

local NewRotationPos = {x = 0, y = 0, z = 0}
local self = {}
self.LastObject = nil
self.IsFreeze = true
self.SelectedTranslation = 2
self.RotationX =  {"-180", "-175", "-170", "-165", "-160", "-155", "-150", "-145", "-140", "-135", "-130", "-125", "-120", "-115", "-110", "-105", "-100", "-95", "-90", "-85" ,"-80", "-75", "-70", "-65", "-60", "-55", "-50", "-45", "-40", "-35", "-30", "-25", "-20", "-15", "-10", "-5", "0", "5", "10", "15", "20", "25", "30", "35", "40", "45", "50", "55", "60", "65", "70", "75", "80", "90", "95", "100", "105", "110", "115", "120", "125", "130", "135", "140", "145", "150", "155", "160", "165", "170", "175", "180"}
self.RotationY =  {"-180", "-175", "-170", "-165", "-160", "-155", "-150", "-145", "-140", "-135", "-130", "-125", "-120", "-115", "-110", "-105", "-100", "-95", "-90", "-85" ,"-80", "-75", "-70", "-65", "-60", "-55", "-50", "-45", "-40", "-35", "-30", "-25", "-20", "-15", "-10", "-5", "0", "5", "10", "15", "20", "25", "30", "35", "40", "45", "50", "55", "60", "65", "70", "75", "80", "90", "95", "100", "105", "110", "115", "120", "125", "130", "135", "140", "145", "150", "155", "160", "165", "170", "175", "180"}
self.RotationZ =  {"-180", "-175", "-170", "-165", "-160", "-155", "-150", "-145", "-140", "-135", "-130", "-125", "-120", "-115", "-110", "-105", "-100", "-95", "-90", "-85" ,"-80", "-75", "-70", "-65", "-60", "-55", "-50", "-45", "-40", "-35", "-30", "-25", "-20", "-15", "-10", "-5", "0", "5", "10", "15", "20", "25", "30", "35", "40", "45", "50", "55", "60", "65", "70", "75", "80", "90", "95", "100", "105", "110", "115", "120", "125", "130", "135", "140", "145", "150", "155", "160", "165", "170", "175", "180"}
self.SelectedCoords = {x = 0, y = 0, z = 0}
self.SelectedRotationX = 37
self.SelectedRotationY = 37
self.SelectedRotationZ = 37
self.objects = {"w_pi_pistol50", "w_pi_pistol", "w_pi_heavypistol", "w_pi_sns_pistol", "w_pi_pistol50", "w_pi_stungun", "w_pi_vintage_pistol", "w_sb_assaultsmg", "w_sb_smg", "w_sg_assaultshotgun", "w_sg_heavyshotgun", "w_sg_pumpshotgun", "w_sg_sawnoff", "w_sr_marksmanrifle", "w_sr_sniperrifle", "w_ex_pe", "w_ex_grenadefrag", "w_ex_grenadesmoke", "w_me_crowbar", "w_me_bat", "w_me_gclub", "w_me_dagger", "w_me_nightstick", "w_me_knife_01", "w_pi_flaregun", "prop_mp_drug_pack_blue", "prop_drug_package", "prop_drug_package_02", "prop_mp_drug_package", "prop_mp_drug_pack_red", "prop_drug_erlenmeyer", "prop_drug_burner", "prop_drug_bottle", "hei_prop_drug_statue_01", "hei_prop_drug_statue_base_01", "hei_prop_drug_statue_base_02", "hei_prop_drug_statue_box_01", "hei_prop_drug_statue_box_01b", "hei_prop_drug_statue_box_big", "hei_prop_drug_statue_stack", "hei_prop_drug_statue_top", "hei_prop_hei_drug_case", "hei_prop_hei_drug_pack_01a", "hei_prop_hei_drug_pack_01b", "hei_prop_hei_drug_pack_02", "hei_prop_heist_drug_tub_01", "ng_proc_drug01a002", "hei_prop_heist_weed_block_01", "hei_prop_heist_weed_block_01b", "hei_prop_heist_weed_pallet", "hei_prop_heist_weed_pallet_02", "prop_meth_bag_01", "prop_meth_setup_01", "p_meth_bag_01_s"}
self.Armes = {"w_pi_pistol50", "w_pi_pistol", "w_pi_heavypistol", "w_pi_sns_pistol", "w_pi_pistol50", "w_pi_stungun", "w_pi_vintage_pistol", "w_sb_assaultsmg", "w_sb_smg", "w_sg_assaultshotgun", "w_sg_heavyshotgun", "w_sg_pumpshotgun", "w_sg_sawnoff", "w_sr_marksmanrifle", "w_sr_sniperrifle", "w_ex_pe", "w_ex_grenadefrag", "w_ex_grenadesmoke", "w_me_crowbar", "w_me_bat", "w_me_gclub", "w_me_dagger", "w_me_nightstick", "w_me_knife_01", "w_pi_flaregun"}
self.Drogues = {"prop_mp_drug_pack_blue", "prop_drug_package", "prop_drug_package_02", "prop_mp_drug_package", "prop_mp_drug_pack_red", "prop_drug_erlenmeyer", "prop_drug_burner", "prop_drug_bottle", "hei_prop_drug_statue_01", "hei_prop_drug_statue_base_01", "hei_prop_drug_statue_base_02", "hei_prop_drug_statue_box_01", "hei_prop_drug_statue_box_01b", "hei_prop_drug_statue_box_big", "hei_prop_drug_statue_stack", "hei_prop_drug_statue_top", "hei_prop_hei_drug_case", "hei_prop_hei_drug_pack_01a", "hei_prop_hei_drug_pack_01b", "hei_prop_hei_drug_pack_02", "hei_prop_heist_drug_tub_01", "ng_proc_drug01a002", "hei_prop_heist_weed_block_01", "hei_prop_heist_weed_block_01b", "hei_prop_heist_weed_pallet", "hei_prop_heist_weed_pallet_02", "prop_meth_bag_01", "prop_meth_setup_01", "p_meth_bag_01_s"}
self.Chaises = {"prop_cs_folding_chair_01", "p_yacht_chair_01_s", "prop_rock_chair_01", "prop_off_chair_04_s", "prop_cs_office_chair", "prop_direct_chair_01", "prop_direct_chair_02", "prop_wheelchair_01", "prop_yaught_chair_01", "prop_gc_chair02", "prop_armchair_01", "prop_ld_farm_chair01", "prop_chair_01a", "prop_chair_08", "prop_clown_chair", "prop_old_deck_chair_02", "prop_chair_04a", "prop_chateau_chair_01", "prop_chair_02", "prop_chair_05", "prop_chair_07", "prop_chair_01b", "prop_chair_pile_01", "prop_old_deck_chair", "prop_chair_10", "prop_chair_04b", "prop_old_wood_chair", "prop_chair_06", "prop_off_chair_01", "v_ret_gc_chair03", "prop_off_chair_04b", "prop_off_chair_04", "v_corp_cd_chair", "v_corp_offchair", "prop_off_chair_05", "prop_off_chair_03", "v_club_officechair", "v_corp_bk_chair3", "prop_sol_chair", "prop_skid_chair_01", "prop_skid_chair_03", "prop_skid_chair_02", "prop_flipchair_01", "hei_prop_hei_skid_chair", "hei_prop_heist_off_chair", "p_armchair_01_s", "p_clb_officechair_s", "p_dinechair_01_s", "p_folding_chair_01_s", "p_ilev_p_easychair_s", "p_soloffchair_s", "prop_wheelchair_01_s", "v_ilev_chair02_ped", "v_ilev_hd_chair", "v_ilev_m_dinechair", "v_ilev_p_easychair"} 
self.Tables = {"prop_yacht_table_01", "prop_yacht_table_03", "prop_fbi3_coffee_table", "prop_yacht_table_02", "prop_astro_table_01", "prop_ld_farm_table02", "prop_ld_farm_table01", "prop_astro_table_02", "prop_table_para_comb_05", "prop_table_07", "prop_proxy_chateau_table", "prop_table_03", "prop_table_04", "prop_table_05", "prop_table_para_comb_02", "prop_patio_lounger1_table", "prop_picnictable_02", "prop_table_para_comb_03", "prop_table_03b", "prop_picnictable_01", "prop_table_08", "prop_table_para_comb_01", "prop_picnictable_01_lod", "prop_table_02", "prop_chateau_table_01", "prop_table_08_chr", "prop_table_03b_cs", "prop_table_01", "prop_table_para_comb_04", "prop_table_06", "prop_tablesmall_01", "prop_rub_table_02", "prop_rub_table_01", "prop_pooltable_3b", "prop_table_tennis", "prop_pooltable_02", "prop_ven_market_table1", "hei_prop_yah_table_01", "hei_prop_yah_table_02", "hei_prop_yah_table_03", "v_ilev_liconftable_sml"}
self.Barrieres = {"prop_barrier_work01a", "prop_barrier_work04a","prop_barrier_work06a", "prop_barrier_work02a","prop_barrier_wat_04c", "prop_barrier_work01c","prop_barrier_wat_03b", "prop_barrier_work06b","prop_barrier_wat_04b", "prop_barrier_work01d","prop_barrier_work05", "prop_barrier_wat_01a","prop_barrier_work01b", "prop_mc_conc_barrier_01","prop_barrier_wat_04a", "prop_mp_barrier_01","prop_mp_barrier_02", "prop_mp_barrier_01b","prop_ld_barrier_01", "prop_mp_barrier_02b","prop_mp_arrow_barrier_01", "prop_mp_conc_barrier_01"}
self.Caisses = {"prop_tool_box_05", "prop_tool_box_02","prop_tool_box_04", "prop_tool_box_07","prop_tool_box_01", "prop_cs_cardbox_01","prop_champ_box_01", "prop_cs_box_clothes","prop_devin_box_01", "prop_cs_rub_box_02","prop_cs_beer_box", "prop_cs_rub_box_01","prop_beer_box_01", "prop_cs_clothes_box","prop_cs_box_step", "prop_box_wood05a","v_ret_ta_box", "v_ind_cf_chckbox2","prop_cardbordbox_03a", "prop_boxpile_03a","prop_box_wood02a", "prop_cardbordbox_04a", "prop_boxpile_07d", "v_ind_cf_boxes", "prop_boxpile_05a", "v_res_filebox01", "prop_box_wood01a", "prop_box_wood02a_pu", "v_ret_gc_box1", "v_ind_cs_box01", "prop_box_wood07a", "prop_box_wood05b", "prop_cardbordbox_02a", "prop_box_tea01a", "v_serv_plas_boxg4", "prop_boxpile_10b", "v_serv_plastic_box", "v_serv_abox_02", "v_ind_cfbox", "prop_boxpile_02c", "v_serv_plas_boxgt2", "prop_box_wood04a", "v_ind_cf_chckbox3", "v_serv_abox_04", "prop_boxpile_10a", "v_ind_cfbox2", "v_res_smallplasticbox", "prop_boxpile_01a", "v_ind_ss_box02", "prop_box_wood08a", "prop_boxpile_02b", "prop_boxpile_06a", "prop_box_wood03a", "prop_cardbordbox_01a", "v_serv_crdbox_2", "prop_boxpile_07a", "prop_boxpile_09a", "prop_boxpile_06b", "prop_boxpile_02d", "v_ind_ss_box04", "v_ret_gc_box2", "prop_box_wood06a", "prop_boxpile_04a", "v_ind_cs_box02", "prop_cardbordbox_05a", "v_ind_ss_box03", "prop_box_wood02a_mws", "v_serv_plastic_box_lid", "v_ind_ss_box01", "prop_boxpile_08a", "v_ind_cf_chckbox1", "prop_horo_box_01", "prop_paper_box_02", "prop_paper_box_05", "prop_paper_box_04", "prop_paper_box_01", "v_res_officeboxfile01", "prop_paper_box_03", "prop_rub_boxpile_02", "prop_rub_boxpile_04", "prop_rub_boxpile_05", "prop_skid_box_05", "prop_rub_boxpile_03", "prop_skid_box_03", "prop_skid_box_01", "prop_skid_box_07", "prop_rub_boxpile_07", "prop_rub_boxpile_06", "prop_hat_box_06", "prop_apple_box_02", "prop_apple_box_01", "prop_sock_box_01", "prop_tshirt_box_01", "prop_coolbox_01", "prop_hat_box_03", "prop_tshirt_box_02", "prop_hat_box_05", "prop_hat_box_02", "prop_hat_box_01", "prop_mat_box", "prop_hat_box_04", "hei_prop_heist_box", "p_cs_clothes_box_s",}

local DeletePed = {
	"s_m_y_swat_01",
	"a_c_chimp",
	"a_c_rhesus",
	"a_c_cow",
	"u_m_m_jesus_01",
	"u_m_m_streetart_01",
	"u_m_y_babyd",
	"player_two",
	"u_f_y_corpse_01",
	"u_m_y_babyd",
	"u_m_y_imporage",
	"u_m_y_juggernaut_01",
	"u_m_y_zombie_01",
	"u_m_y_rsranger_01",
	"u_m_y_pogo_01",
	"u_m_y_corpse_01",
	"u_m_y_babyd",
	"ig_johnnyklebitz",
	"s_m_m_movspace_01",
	"s_m_m_pilot_02",
	"s_m_m_mariachi_01",
	"s_m_m_movalien_01",
	"s_m_m_chemsec_01",
	"s_m_m_doctor_01",
	"hc_gunman",
	"hc_driver",
	"s_m_y_uscg_01",
	"s_m_y_fireman_01",
	"s_m_y_clown_01",
	"s_m_y_blackops_01",
	"s_m_y_blackops_02",
	"s_m_y_blackops_03",
	"s_m_m_strperf_01",
	"s_m_m_snowcop_01",
	"s_m_m_marine_01",
	"s_m_m_fibsec_01",
	"mp_f_cocaine_01",
	"cs_orleans",
	"cs_priest",
	"cs_bradcadaver",
	"a_c_rottweiler",
	"a_c_shepherd",
	"a_c_westy",
	"a_c_poodle",
	"a_c_rabbit_01",
	"a_c_chop",
	"a_m_y_musclbeac_01",
	"a_m_m_acult_01"
}

local nombre = 0
local noclip = false
local speednoclip = 1.0
local invincible = false
local invincibleserv = false
local visible = true
local radar = false
local LastId
local freeze = false
local nomsjoueurs = false
local invinsibleselect = false
local nomdutueur = ""
local raison = ""
local raisonwarn = ""
local heure = ""
local metiersdispo = {"aucun", "concessionnaire"} -- ##
local ListGrade = {""}
local ListArme = {  
    "WEAPON_KNIFE", "WEAPON_NIGHTSTICK", "WEAPON_HAMMER", "WEAPON_BAT", "WEAPON_GOLFCLUB",  
    "WEAPON_CROWBAR", "WEAPON_PISTOL", "WEAPON_COMBATPISTOL", "WEAPON_APPISTOL", "WEAPON_PISTOL50",  
    "WEAPON_MICROSMG", "WEAPON_SMG", "WEAPON_ASSAULTSMG", "WEAPON_ASSAULTRIFLE",  
    "WEAPON_CARBINERIFLE", "WEAPON_ADVANCEDRIFLE", "WEAPON_MG", "WEAPON_COMBATMG", "WEAPON_PUMPSHOTGUN",  
    "WEAPON_SAWNOFFSHOTGUN", "WEAPON_ASSAULTSHOTGUN", "WEAPON_BULLPUPSHOTGUN", "WEAPON_STUNGUN", "WEAPON_SNIPERRIFLE",  
    "WEAPON_HEAVYSNIPER", "WEAPON_GRENADELAUNCHER", "WEAPON_GRENADELAUNCHER_SMOKE", "WEAPON_RPG", "WEAPON_MINIGUN",  
    "WEAPON_GRENADE", "WEAPON_STICKYBOMB", "WEAPON_SMOKEGRENADE", "WEAPON_BZGAS", "WEAPON_MOLOTOV",  
    "WEAPON_FIREEXTINGUISHER", "WEAPON_PETROLCAN", "WEAPON_FLARE", "WEAPON_SNSPISTOL", "WEAPON_SPECIALCARBINE",  
    "WEAPON_HEAVYPISTOL", "WEAPON_BULLPUPRIFLE", "WEAPON_PROXMINE", "WEAPON_SNOWBALL",  
    "WEAPON_VINTAGEPISTOL", "WEAPON_DAGGER", "WEAPON_FIREWORK", "WEAPON_MUSKET", "WEAPON_MARKSMANRIFLE",  
    "WEAPON_HEAVYSHOTGUN", "WEAPON_GUSENBERG", "WEAPON_HATCHET", "WEAPON_RAILGUN", "WEAPON_COMBATPDW",  
    "WEAPON_KNUCKLE", "WEAPON_MARKSMANPISTOL", "WEAPON_FLASHLIGHT", "WEAPON_MACHETE", "WEAPON_MACHINEPISTOL",  
    "WEAPON_SWITCHBLADE", "WEAPON_REVOLVER", "WEAPON_COMPACTRIFLE", "WEAPON_DBSHOTGUN", "WEAPON_FLAREGUN",  
    "WEAPON_AUTOSHOTGUN", "WEAPON_BATTLEAXE", "WEAPON_COMPACTLAUNCHER", "WEAPON_MINISMG", "WEAPON_PIPEBOMB",  
    "WEAPON_POOLCUE", "WEAPON_SWEEPER", "WEAPON_WRENCH"  
}
local ListItem = {}
local ListBan = {"Heures", "Jours", "Mois", "Années"}
local SelectedListArme = 1
local SelectedListItem = 1
local SelectedListGrade = 1
local SelectedListBan = 1
local raisonkick = ""
--local textbantemps = ""
local raisonduban = ""

local money

local affichagecoords = nil

local vision = 0

local nomprenom

local Player = {
	gamerTags = {}
}

local metier
local niveaumetier


local jobduboug

RegisterNetEvent('InitialCore:LoadJob')
AddEventHandler('InitialCore:LoadJob', function(metier2, niveaumetier2)
    metier = metier2
    niveaumetier = niveaumetier2
end)


RegisterCommand('+openadmin', function()
	if not isMenuOpened then
		TriggerServerCallback("getAdminGrade", function(grade2)

			if ListItem[1] == nil then
				print('GENERATE')
				TriggerServerCallback("getItemsInDB", function(result)
					for k, v in pairs(result) do
						ListItem[k] = result[k].HashID
					end
				end)
			end

			grade = grade2
			print(grade)
			TriggerServerCallback("getNameInDB", function(names)

				nomprenom = names
				if grade == 'admin' or grade == 'maitredejeu' or grade == 'owner' then
					isMenuOpened = true
					RageUI.Visible(RMenu:Get('admin', 'main'), not RageUI.Visible(RMenu:Get('admin', 'main')))
					OpenAdminMenu()
				else
					AdvancedNotif('Administration', '~r~Menu', 'Vous n\'êtes pas administrateur.', 'CHAR_WE', 'ADMIN')
				end
			end)
		end)
	end
end, false)
RegisterCommand('-openadmin', function()    
	
end, false)
RegisterKeyMapping('+openadmin', 'Menu administratif', 'keyboard', 'F9')

RegisterNetEvent("InitialAdmin:ClearBugs")
AddEventHandler("InitialAdmin:ClearBugs", function()
	LoadingPrompt("Optimisation en cours....", 2)
	Wait(2000)
	ClearAllBrokenGlass()
	LeaderboardsReadClearAll()
	ClearFocus()
	ClearHdArea()
	ClearGpsMultiRoute()
	ClearHelp(true)
	ClearFloatingHelp(true, true)
	ClearBrief()
	ClearGpsFlags()
	ClearCloudHat()
	ClearReminderMessage()
	RemoveShockingEventSpawnBlockingAreas()
	ClearCloudHat()
	ClearOverrideWeather()
	ClearWeatherTypePersist()
	ResetDispatchIdealSpawnDistance()
	ResetDispatchSpawnBlockingAreas()
	ResetDeepOceanScaler()
	ResetDispatchSpawnBlockingAreas()
	RemoveLoadingPrompt()
end)

RegisterNetEvent("InitialAdmin:SendMessageC")
AddEventHandler("InitialAdmin:SendMessageC", function(msg)
	AdvancedNotif('Administration', '~r~Staff', msg, 'CHAR_WE', 'ADMIN')
end)

RegisterNetEvent("InitialAdmin:ReviveAllC")
AddEventHandler("InitialAdmin:ReviveAllC", function()
	if IsEntityDead(GetPlayerPed(-1)) then
		RespawnPed(GetPlayerPed(-1), GetEntityCoords(GetPlayerPed(-1)), GetEntityHeading(GetPlayerPed(-1)))
	end
end)

RegisterNetEvent("InitialAdmin:AnnonceC")
AddEventHandler("InitialAdmin:AnnonceC", function(annoncetxt)
	print("ca trigger for")
	AdvancedNotif('Administration', '~o~Annonce serveur', annoncetxt, 'CHAR_WE', 'ADMIN')
end)

function OpenAdminMenu()
	while isMenuOpened do

		if not RageUI.Visible(RMenu:Get('admin', 'main')) and not RageUI.Visible(RMenu:Get('admin', 'dev')) and not RageUI.Visible(RMenu:Get('admin', 'joueurs')) and not RageUI.Visible(RMenu:Get('mettrejeux', 'main')) and not RageUI.Visible(RMenu:Get('mettrejeux', 'props')) and not RageUI.Visible(RMenu:Get('mettrejeux', 'optionpose')) and not RageUI.Visible(RMenu:Get('mettrejeux', 'armes')) and not RageUI.Visible(RMenu:Get('mettrejeux', 'drogues')) and not RageUI.Visible(RMenu:Get('mettrejeux', 'chaises')) and not RageUI.Visible(RMenu:Get('mettrejeux', 'tables')) and not RageUI.Visible(RMenu:Get('mettrejeux', 'barrieres')) and not RageUI.Visible(RMenu:Get('mettrejeux', 'caisses')) and not RageUI.Visible(RMenu:Get('admin', 'monjoueur')) and not RageUI.Visible(RMenu:Get('admin', 'monde')) and not RageUI.Visible(RMenu:Get('admin', 'vehicule')) and not RageUI.Visible(RMenu:Get('admin', 'optiserver')) and not RageUI.Visible(RMenu:Get('admin', 'selectionjoueur')) and not RageUI.Visible(RMenu:Get('admin', 'infos')) and not RageUI.Visible(RMenu:Get('admin', 'sanctions')) and not RageUI.Visible(RMenu:Get('admin', 'remboursement')) and not RageUI.Visible(RMenu:Get('admin', 'roleplay')) and not RageUI.Visible(RMenu:Get('admin', 'utilitaire')) and not RageUI.Visible(RMenu:Get('admin', 'kick')) and not RageUI.Visible(RMenu:Get('admin', 'ban')) and not RageUI.Visible(RMenu:Get('admin', 'morrp')) and not RageUI.Visible(RMenu:Get('admin', 'warn')) then
			isMenuOpened = false
		end


		RageUI.IsVisible(RMenu:Get('admin', 'main'), true, true, true, function()

				if grade == 'admin' or grade == 'owner' then
					RageUI.Button("Liste des joueurs", "Afficher la liste des joueurs.", { RightLabel = ">" }, true, function(_, _, Selected)
					end, RMenu:Get('admin', 'joueurs'))

					RageUI.Button("Gestion de soi-même", "Actions sur mon joueur.", { RightLabel = ">" }, true, function(_, _, Selected)
					end, RMenu:Get('admin', 'monjoueur'))

					RageUI.Button("Gestion serveur", "Actions sur le monde.", { RightLabel = ">" }, true, function(_, _, Selected)
					end, RMenu:Get('admin', 'monde'))

					RageUI.Button("Gestion de véhicules", "Actions sur les véhicules.", { RightLabel = ">" }, true, function(_, _, Selected)
					end, RMenu:Get('admin', 'vehicule'))

					RageUI.Button("Développement", "Dev.", { RightLabel = ">" }, true, function(_, _, Selected)
					end, RMenu:Get('admin', 'dev'))

				end
				if grade == 'maitredejeu' or grade == 'owner' then
					RageUI.Button("Maitre de jeu", "Actions des maitres de jeux.", { RightLabel = ">" }, true, function(_, _, Selected)
					end, RMenu:Get('mettrejeux', 'main'))
				end
		end)

		RageUI.IsVisible(RMenu:Get('admin', 'dev'), true, true, true, function()
			
			RageUI.Button("Afficher les coordonnées", "Réanime tout les joueurs du serveur.", {}, true, function(_, _, Selected)
				if Selected then
					local affichagecoords = true
					while affichagecoords do
						Wait(0)
						local x,y,z = table.unpack(GetEntityCoords(GetPlayerPed(-1)))
						local h = GetEntityHeading(GetPlayerPed(-1)) 
						local r = GetEntityRotation(GetPlayerPed(-1))
				--		DrawText3D(x+0.1,y,z+0.5,"~r~Coords:  ~w~"..x.." ~o~| ~w~" ..y.. " ~o~| ~w~"..z.. " ~o~| ~w~"..h, 0.4)
						print("Coords:  ^1X: "..x.." | ^3Y: " ..y.. " | ^4Z: "..z.. " | ^7H: "..h)
						HelpNotif("Appuyez sur ~INPUT_PICKUP~ pour enlever les coordonnées.")
						if IsControlJustPressed(0, 51) then
							affichagecoords = false
						end
					end
				end
			end)

			RageUI.Button("Se téléporter aux coordonnées", "Se téléporter aux coordonnées, ex 177.50", {}, true, function(_, _, Selected)
				if Selected then
					local coordsx = KeyboardInput("X", 8)
					local coordsy = KeyboardInput("Y", 8)
					local coordsz = KeyboardInput("Z", 8)
					if coordsx == nil or coordsx == "X" then
						AdvancedNotif('Administration', 'Erreur', "Un champ est invalide.", 'CHAR_WE', 'ADMIN')
					elseif coordsz == nil or coordsz == "Z" then
						AdvancedNotif('Administration', 'Erreur', "Un champ est invalide.", 'CHAR_WE', 'ADMIN')
					elseif coordsy == nil or coordsy == "Y" then
						AdvancedNotif('Administration', 'Erreur', "Un champ est invalide.", 'CHAR_WE', 'ADMIN')
					else
						print(coordsx)
						print(coordsy)
						print(coordsz)
						SetEntityCoords(PlayerPedId(), tonumber(coordsx), tonumber(coordsy), tonumber(coordsz), false, false, false, true)
					end
				end
			end)

			RageUI.Button("Se téléporter sur le marker", "Se téléporter sur le point.", {}, true, function(Hovered, Active, Selected)
				if Selected then
					local WaypointHandle = GetFirstBlipInfoId(8)
					if DoesBlipExist(WaypointHandle) then
						local waypointCoords = GetBlipInfoIdCoord(WaypointHandle)
				
						for height = 1, 1000 do
							SetPedCoordsKeepVehicle(PlayerPedId(), waypointCoords["x"], waypointCoords["y"], height + 0.0)
				
							local foundGround, zPos = GetGroundZFor_3dCoord(waypointCoords["x"], waypointCoords["y"], height + 0.0)
				
							if foundGround then
								SetPedCoordsKeepVehicle(PlayerPedId(), waypointCoords["x"], waypointCoords["y"], height + 0.0)
				
								break
							end
							Wait(15)
						end
					end
				end
			end)

		end)

		RageUI.IsVisible(RMenu:Get('admin', 'monde'), true, true, true, function()


			RageUI.Button("Réanimer tout le monde", "Réanime tout les joueurs du serveur.", {}, true, function(_, _, Selected)
				if Selected then
					TriggerServerEvent("InitialAdmin:ReviveAll")
					AdvancedNotif('Administration', 'Réanimation', "Vous avez réanimé toutes les personnes mortes.", 'CHAR_WE', 'ADMIN')
					ClearTimecycleModifier()
				end
			end)

			RageUI.Button("Supprimer les peds autour", "Supprime les peds autour de vous.", {}, true, function(_, _, Selected) -- ##
				if Selected then
					local keyborad = KeyboardInput("", 5)

					if keyborad ~= nil then
						AdvancedNotif('Administration', 'Suppression', "Suppression de ped en cours...", 'CHAR_WE', 'ADMIN')
						local coords = GetEntityCoords(GetPlayerPed(-1))
						local PedsA = GetPedsInArea(coords, keyborad)
						for k, v in pairs(PedsA) do
							for x, y in pairs(DeletePed) do
								if GetEntityModel(v) == GetHashKey(y) then
									DeleteEntity(v)
								end
							end
						end
					else
						AdvancedNotif('Administration', 'Erreur', "Radius invalide.", 'CHAR_WE', 'ADMIN')
					end

				end
			end)

			RageUI.Button("Supprimer les véhicules autour", "Supprime les véhicules autour de vous.", {}, true, function(Hovered, Active, Selected)
				if Selected then
					local keyboraad = KeyboardInput("10", 5)
					if keyboraad ~= nil then
						local coords = GetEntityCoords(GetPlayerPed(-1))
						local Veh = GetVehicleInArea(coords, keyboraad .. ".0")
						for k, v in pairs(Veh) do
							Citizen.InvokeNative(0xAE3CBE5BF394C9C9, Citizen.PointerValueIntInitialized(v))
						end
					end
				end
			end)

			RageUI.Button("Passer une annonce au serveur", "Passer une annonce au serveur, tout le monde verra.", {}, true, function(Hovered, Active, Selected)
				if Selected then
					annoncetxt = KeyboardInput("", 100)
					if annoncetxt == "" then
						AdvancedNotif('Administration', 'Erreur', "Message vide.", 'CHAR_WE', 'ADMIN')
					else
						TriggerServerEvent("InitialAdmin:Annonce", annoncetxt)
					end
				end
			end)

			RageUI.Checkbox("Afficher les noms des joueurs", "Affiche les noms des joueurs les plus proches.", nomsjoueurs, {}, function(Hovered, Active, Selected, Checked)
				if Selected then
					nomsjoueurs = Checked
					if Checked then
						for _, v in ipairs(GetActivePlayers()) do
							local otherPed = GetPlayerPed(v)

							if otherPed ~= PlayerPedId() then
								if #(GetEntityCoords(PlayerPedId(), false) - GetEntityCoords(otherPed, false)) < 6000.0 then
									Player.gamerTags[v] = CreateFakeMpGamerTag(otherPed, ('[%s] %s'):format(GetPlayerServerId(v), GetPlayerName(v)), false, false, '', 0)
								else
									RemoveMpGamerTag(Player.gamerTags[v])
									Player.gamerTags[v] = nil
								end
							end
						end
					end
				end
			end)
		
			RageUI.Button("Optimisation serveur", "Optimisation du serveur.", { RightLabel = ">" }, true, function(Hovered, Active, Selected)
			end, RMenu:Get('admin', 'optiserver'))

		end)
		
		
		RageUI.IsVisible(RMenu:Get('mettrejeux', 'main'), true, true, true, function()

			RageUI.Button("Faire apparaitre un véhicule", "Faire apparaitre un véhicule par son nom.", {}, true, function(_, _, Selected)
				if Selected then
				local timer = 0
					if not IsPedInAnyVehicle(PlayerPedId(), false) then
						local msgvoiture = KeyboardInput("", 30)
						local pos = GetEntityCoords(PlayerPedId())
						if msgvoiture == "" then
							AdvancedNotif('Administration', '~r~Erreur', "Le nom est invalide.", 'CHAR_WE', 'ADMIN')
						else
							RequestModel(msgvoiture)
							while not HasModelLoaded(msgvoiture) do
								Wait(1)
								timer = timer + 1
								if timer >= 200 then
									AdvancedNotif('Administration', '~r~Erreur', "Le véhicule ~p~" .. msgvoiture .. "~w~ n'a pas pu charger.", 'CHAR_WE', 'ADMIN') 
									break
								end
							end
							CreateVehicle(msgvoiture, pos.x, pos.y, pos.z, GetEntityHeading(PlayerPedId()), true, false)
						end
					elseif IsPedInAnyVehicle(PlayerPedId(), false) then
						AdvancedNotif('Administration', '~r~Erreur', "Vous êtes déjà dans un véhicule.", 'CHAR_WE', 'ADMIN') 
					end
				end
			end)

			RageUI.Button("Retourner le véhicule", "Retourner le véhicule dans le quel vous êtes.", {}, true, function(Hovered, Active, Selected)
				if Selected then
					if IsPedInAnyVehicle(PlayerPedId(), false) then
						local vehiclee = GetVehiclePedIsUsing(GetPlayerPed(-1))
						SetVehicleOnGroundProperly(vehiclee)
						AdvancedNotif('Administration', '~r~Véhicule', "Véhicule a été mis sur ces 4 roues.", 'CHAR_WE', 'ADMIN') 
					else
						AdvancedNotif('Administration', '~r~Erreur', "Vous n'êtes pas dans un véhicule.", 'CHAR_WE', 'ADMIN') 
					end
				end
			end)

			RageUI.Button("Se transformer en ped", "Se transforme en ped avec un text.", {}, true, function(Hovered, Active, Selected)
				if Selected then
					local timer = 1
					local pedname = KeyboardInput("", 20)
					if pedname == "" then
						AdvancedNotif('Administration', '~r~Erreur', "Pas de text.", 'CHAR_WE', 'ADMIN') 
					else
						pedname = GetHashKey(pedname)
						RequestModel(pedname)
						while not HasModelLoaded(pedname) do 
							RequestModel(pedname)
							Wait(0)
							timer = timer + 1
							print(timer)
							if timer >= 200 then
								AdvancedNotif('Administration', '~r~Erreur', "Ped na pas pu charger.", 'CHAR_WE', 'ADMIN') 
								break
							end
						end
						SetPlayerModel(PlayerId(), pedname)
						SetPedDefaultComponentVariation(PlayerPedId())
						SetModelAsNoLongerNeeded(ped)
						ClearPedProp(PlayerPedId(), 0)
					end
				end
			end)

			RageUI.Button("Props", "Props.", { RightLabel = ">" }, true, function(Hovered, Active, Selected)
			end, RMenu:Get('mettrejeux', 'props'))

			
		end)
		
		RageUI.IsVisible(RMenu:Get('mettrejeux', 'props'), true, true, true, function()
			RageUI.Button("Supprimer objet", "Supprimer l'objet précédement placé", {}, true, function(Hovered, Active, Selected)
				if Selected then
					--local coords = GetEntityCoords(GetPlayerPed(-1))
					--local objet = GetClosestObjectOfType(coords, 3.0, '')
					--local objet2 = DoesObjectOfTypeExistAtCoords(coords, 3.0)
					--local retval, outEntity = FindFirstObject()
					--print(retval)
					--print(outEntity)

					local toReturn = 0
					local localPlayer = GetPlayerPed(-1)
					local x, y, z = table.unpack(GetEntityCoords(localPlayer, true))
					local handle, object = FindFirstObject()
					local finished = false
					repeat
						local x2, y2, z2 = table.unpack(GetEntityCoords(object, true))
						local objHash = GetEntityModel(object)
						for i = 1, #self.objects do
							local obj = self.objects[i]
							if objHash == GetHashKey(obj) and Vdist(x, y, z, x2, y2, z2) < 3.0 then
								toReturn = object
								break
							end
						end
						finished, object = FindNextObject(handle)
					until not finished
					EndFindObject(handle)
					DeleteObject(toReturn)
				end
			end)
			RageUI.Button("Armes", "Armes", { RightLabel = ">" }, true, function(Hovered, Active, Selected)
			end, RMenu:Get('mettrejeux', 'armes'))
			RageUI.Button("Drogues", "Drogues", { RightLabel = ">" }, true, function(Hovered, Active, Selected)
			end, RMenu:Get('mettrejeux', 'drogues'))
			RageUI.Button("Chaises", "Chaises", { RightLabel = ">" }, true, function(Hovered, Active, Selected)
			end, RMenu:Get('mettrejeux', 'chaises'))
			RageUI.Button("Tables", "Tables", { RightLabel = ">" }, true, function(Hovered, Active, Selected)
			end, RMenu:Get('mettrejeux', 'tables'))
			RageUI.Button("Barrières", "Barrières", { RightLabel = ">" }, true, function(Hovered, Active, Selected)
			end, RMenu:Get('mettrejeux', 'barrieres'))
			RageUI.Button("Caisses", "Caisses", { RightLabel = ">" }, true, function(Hovered, Active, Selected)
			end, RMenu:Get('mettrejeux', 'caisses'))
		end)
		RageUI.IsVisible(RMenu:Get('mettrejeux', 'optionpose'), true, true, true, function()
			local NewEntityPos = GetEntityCoords(self.LastObject)
			RageUI.List("Translation X", {NewEntityPos.x-0.1, NewEntityPos.x or 'Chargement', NewEntityPos.x+0.1}, self.SelectedTranslation, "Translation de l'axe X", {}, true, function(Hovered, Active, Selected, Index)
				if self.SelectedTranslation ~= Index then
					if Index == 1 then
						self.SelectedCoords = {x = NewEntityPos.x-0.1, y = NewEntityPos.y, z = NewEntityPos.z}
					else
						self.SelectedCoords = {x = NewEntityPos.x+0.1, y = NewEntityPos.y, z = NewEntityPos.z}
					end
					SetEntityCoords(self.LastObject, self.SelectedCoords.x, self.SelectedCoords.y, self.SelectedCoords.z)
            	end
			end)
			RageUI.List("Translation Y", {NewEntityPos.y-0.1, NewEntityPos.y or 'Chargement', NewEntityPos.y+0.1}, self.SelectedTranslation, "Translation de l'axe Y", {}, true, function(Hovered, Active, Selected, Index)
				if self.SelectedTranslation ~= Index then
					if Index == 1 then
						self.SelectedCoords = {x = NewEntityPos.x, y = NewEntityPos.y-0.1, z = NewEntityPos.z}
					else
						self.SelectedCoords = {x = NewEntityPos.x, y = NewEntityPos.y+0.1, z = NewEntityPos.z}
					end
					SetEntityCoords(self.LastObject, self.SelectedCoords.x, self.SelectedCoords.y, self.SelectedCoords.z)
            	end
			end)
			RageUI.List("Translation Z", {NewEntityPos.z-0.1, NewEntityPos.z or 'Chargement', NewEntityPos.z+0.1}, self.SelectedTranslation, "Translation de l'axe Z", {}, true, function(Hovered, Active, Selected, Index)
				if self.SelectedTranslation ~= Index then
					if Index == 1 then
						self.SelectedCoords = {x = NewEntityPos.x, y = NewEntityPos.y, z = NewEntityPos.z-0.1}
					else
						self.SelectedCoords = {x = NewEntityPos.x, y = NewEntityPos.y, z = NewEntityPos.z+0.1}
					end
					SetEntityCoords(self.LastObject, self.SelectedCoords.x, self.SelectedCoords.y, self.SelectedCoords.z)
            	end
			end)
			--[[RageUI.List("Translation X", {GetEntityCoords(self.LastObject).x-0.1, GetEntityCoords(self.LastObject).x or 'Chargement', GetEntityCoords(self.LastObject).x+0.1}, self.SelectedTranslationX, "DESC", {}, true, function(Hovered, Active, Selected, Index)
				if self.SelectedTranslationX ~= Index then
					if Index == 1 then
						self.SelectedCoords = {x = GetEntityCoords(self.LastObject).x-0.1, y = GetEntityCoords(self.LastObject).y, z = GetEntityCoords(self.LastObject).z}
					else
						self.SelectedCoords = {x = GetEntityCoords(self.LastObject).x+0.1, y = GetEntityCoords(self.LastObject).y, z = GetEntityCoords(self.LastObject).z}
					end
					SetEntityCoords(self.LastObject, self.SelectedCoords.x, self.SelectedCoords.y, self.SelectedCoords.z)
            	end
			end)]]
			RageUI.List("Rotation X", self.RotationX, self.SelectedRotationX, "Rotation de l'axe X", {}, true, function(Hovered, Active, Selected, Index)
                if self.SelectedRotationX ~= Index then
					self.SelectedRotationX = Index
					NewRotationPos.x = self.RotationX[self.SelectedRotationX]
					SetEntityRotation(self.LastObject, NewRotationPos.x+0.001, NewRotationPos.y+0.001, NewRotationPos.z+0.001)
                end
			end)
			RageUI.List("Rotation Y", self.RotationY, self.SelectedRotationY, "Rotation de l'axe Y", {}, true, function(Hovered, Active, Selected, Index)
                if self.SelectedRotationY ~= Index then
					self.SelectedRotationY = Index
					NewRotationPos.y = self.RotationY[self.SelectedRotationY]
					SetEntityRotation(self.LastObject, NewRotationPos.x+0.001, NewRotationPos.y+0.001, NewRotationPos.z+0.001)
                end
			end)
			RageUI.List("Rotation Z", self.RotationX, self.SelectedRotationZ, "Rotation de l'axe Z", {}, true, function(Hovered, Active, Selected, Index)
                if self.SelectedRotationZ ~= Index then
					self.SelectedRotationZ = Index
					NewRotationPos.z = self.RotationZ[self.SelectedRotationZ]
					SetEntityRotation(self.LastObject, NewRotationPos.x+0.001, NewRotationPos.y+0.001, NewRotationPos.z+0.001)
                end
			end)
			RageUI.Checkbox("Freeze", "Si l'objet est freeze il ne pourra pas bouger", self.IsFreeze, { Style = RageUI.CheckboxStyle.Tick }, function(Hovered, Selected, Active, Checked)
				if Selected and self.IsFreeze ~= Checked then
					self.IsFreeze = Checked
					print(self.IsFreeze)
					FreezeEntityPosition(self.LastObject, self.IsFreeze)
				end
			end)
			RageUI.Button("Annuler", "Supprime l'objet", {}, true, function(Hovered, Active, Selected)
				if Selected then
					DeleteObject(self.LastObject)
					RageUI.GoBack()
				end
			end)
			RageUI.Button("Valider", "Valider et créer l'objet", {}, true, function(Hovered, Active, Selected)
				if Selected then
					DeleteObject(self.LastObject)
					RequestModel(self.LastHashObjectId)
					while not HasModelLoaded(self.LastHashObjectId) do
						Wait(50)
					end
					local object2 = CreateObjectNoOffset(self.LastHashObjectId, self.SelectedCoords.x, self.SelectedCoords.y, self.SelectedCoords.z, true)
					SetEntityRotation(object2, NewRotationPos.x+0.001, NewRotationPos.y+0.001, NewRotationPos.z+0.001)
					FreezeEntityPosition(object2, self.IsFreeze)
					SetModelAsNoLongerNeeded(self.LastHashObjectId)
					RageUI.GoBack()
				end
			end)
		end)
		RageUI.IsVisible(RMenu:Get('mettrejeux', 'armes'), true, true, true, function()
			for k in pairs(self.Armes) do
				RageUI.Button(self.Armes[k], self.Armes[k], {}, true, function(Hovered, Active, Selected)
					if Selected then
						self.LastHashObjectId = GetHashKey(self.Armes[k])
						RequestModel(GetHashKey(self.Armes[k]))
						while not HasModelLoaded(GetHashKey(self.Armes[k])) do
							Wait(50)
						end
						local coords = GetEntityCoords(GetPlayerPed(-1))
						local object = CreateObjectNoOffset(GetHashKey(self.Armes[k]), coords.x, coords.y, coords.z, false)
						PlaceObjectOnGroundProperly(object)
						FreezeEntityPosition(object, true)
						self.LastObject = object
						NewRotationPos = {x = 0, y = 0, z = 0}
						self.IsFreeze = true
						SetModelAsNoLongerNeeded(GetHashKey(self.Armes[k]))
					end
				end, RMenu:Get('mettrejeux', 'optionpose'))
			end
		end)
		RageUI.IsVisible(RMenu:Get('mettrejeux', 'drogues'), true, true, true, function()
			for k in pairs(self.Drogues) do
				RageUI.Button(self.Drogues[k], self.Drogues[k], {}, true, function(Hovered, Active, Selected)
					if Selected then
						--[[local coords = GetEntityCoords(GetPlayerPed(-1))
						local object = CreateObjectNoOffset(GetHashKey(self.Drogues[k]), coords.x, coords.y, coords.z-0.98, false)
						self.LastObject = object
						NewRotationPos = {x = 0, y = 0, z = 0}]]

						self.LastHashObjectId = GetHashKey(self.Drogues[k])
						RequestModel(GetHashKey(self.Drogues[k]))
						while not HasModelLoaded(GetHashKey(self.Drogues[k])) do
							Wait(50)
						end
						local coords = GetEntityCoords(GetPlayerPed(-1))
						local object = CreateObjectNoOffset(GetHashKey(self.Drogues[k]), coords.x, coords.y, coords.z, false)
						PlaceObjectOnGroundProperly(object)
						FreezeEntityPosition(object, true)
						self.LastObject = object
						NewRotationPos = {x = 0, y = 0, z = 0}
						self.IsFreeze = true
						SetModelAsNoLongerNeeded(GetHashKey(self.Drogues[k]))
					end
				end, RMenu:Get('mettrejeux', 'optionpose'))
			end
		end)
		RageUI.IsVisible(RMenu:Get('mettrejeux', 'chaises'), true, true, true, function()
			for k in pairs(self.Chaises) do
				RageUI.Button(self.Chaises[k], self.Chaises[k], {}, true, function(Hovered, Active, Selected)
					if Selected then
						--[[local coords = GetEntityCoords(GetPlayerPed(-1))
						local object = CreateObjectNoOffset(GetHashKey(self.Drogues[k]), coords.x, coords.y, coords.z-0.98, false)
						self.LastObject = object
						NewRotationPos = {x = 0, y = 0, z = 0}]]

						self.LastHashObjectId = GetHashKey(self.Chaises[k])
						RequestModel(GetHashKey(self.Chaises[k]))
						while not HasModelLoaded(GetHashKey(self.Chaises[k])) do
							Wait(50)
						end
						local coords = GetEntityCoords(GetPlayerPed(-1))
						local object = CreateObjectNoOffset(GetHashKey(self.Chaises[k]), coords.x, coords.y, coords.z, false)
						PlaceObjectOnGroundProperly(object)
						FreezeEntityPosition(object, true)
						self.LastObject = object
						NewRotationPos = {x = 0, y = 0, z = 0}
						self.IsFreeze = true
						SetModelAsNoLongerNeeded(GetHashKey(self.Chaises[k]))
					end
				end, RMenu:Get('mettrejeux', 'optionpose'))
			end
		end)
		RageUI.IsVisible(RMenu:Get('mettrejeux', 'tables'), true, true, true, function()
			for k in pairs(self.Tables) do
				RageUI.Button(self.Tables[k], self.Tables[k], {}, true, function(Hovered, Active, Selected)
					if Selected then
						self.LastHashObjectId = GetHashKey(self.Tables[k])
						RequestModel(GetHashKey(self.Tables[k]))
						while not HasModelLoaded(GetHashKey(self.Tables[k])) do
							Wait(50)
						end
						local coords = GetEntityCoords(GetPlayerPed(-1))
						local object = CreateObjectNoOffset(GetHashKey(self.Tables[k]), coords.x, coords.y, coords.z, false)
						PlaceObjectOnGroundProperly(object)
						FreezeEntityPosition(object, true)
						self.LastObject = object
						NewRotationPos = {x = 0, y = 0, z = 0}
						self.IsFreeze = true
						SetModelAsNoLongerNeeded(GetHashKey(self.Tables[k]))
					end
				end, RMenu:Get('mettrejeux', 'optionpose'))
			end
		end)
		RageUI.IsVisible(RMenu:Get('mettrejeux', 'barrieres'), true, true, true, function()
			for k in pairs(self.Barrieres) do
				RageUI.Button(self.Barrieres[k], self.Barrieres[k], {}, true, function(Hovered, Active, Selected)
					if Selected then
						self.LastHashObjectId = GetHashKey(self.Barrieres[k])
						RequestModel(GetHashKey(self.Barrieres[k]))
						while not HasModelLoaded(GetHashKey(self.Barrieres[k])) do
							Wait(50)
						end
						local coords = GetEntityCoords(GetPlayerPed(-1))
						local object = CreateObjectNoOffset(GetHashKey(self.Barrieres[k]), coords.x, coords.y, coords.z, false)
						PlaceObjectOnGroundProperly(object)
						FreezeEntityPosition(object, true)
						self.LastObject = object
						NewRotationPos = {x = 0, y = 0, z = 0}
						self.IsFreeze = true
						SetModelAsNoLongerNeeded(GetHashKey(self.Barrieres[k]))
					end
				end, RMenu:Get('mettrejeux', 'optionpose'))
			end
		end)
		RageUI.IsVisible(RMenu:Get('mettrejeux', 'caisses'), true, true, true, function()
			for k in pairs(self.Caisses) do
				RageUI.Button(self.Caisses[k], self.Caisses[k], {}, true, function(Hovered, Active, Selected)
					if Selected then
						self.LastHashObjectId = GetHashKey(self.Caisses[k])
						RequestModel(GetHashKey(self.Caisses[k]))
						while not HasModelLoaded(GetHashKey(self.Caisses[k])) do
							Wait(50)
						end
						local coords = GetEntityCoords(GetPlayerPed(-1))
						local object = CreateObjectNoOffset(GetHashKey(self.Caisses[k]), coords.x, coords.y, coords.z, false)
						PlaceObjectOnGroundProperly(object)
						FreezeEntityPosition(object, true)
						self.LastObject = object
						NewRotationPos = {x = 0, y = 0, z = 0}
						self.IsFreeze = true
						SetModelAsNoLongerNeeded(GetHashKey(self.Caisses[k]))
					end
				end, RMenu:Get('mettrejeux', 'optionpose'))
			end
		end)
		
		RageUI.IsVisible(RMenu:Get('admin', 'joueurs'), true, true, true, function()

			for _, i in ipairs(GetActivePlayers()) do

				--RageUI.Button("[" .. GetPlayerServerId(i) .. "] " .. nom .. " " .. prenom .. " (" .. GetPlayerName(i) .. ")", "Steam :~g~ " .. GetPlayerName(i) .. "~w~. Nom RolePlay :~y~ Nom Prénom", { RightLabel = ">" }, true, function(Hovered, Active, Selected)	
				if grade == "user" then
					RageUI.Button("~u~[" .. GetPlayerServerId(i) .. "] " .. nomprenom.Prenom .. " " .. nomprenom.Nom .. " (" .. GetPlayerName(i) .. ")~w~", "Steam :~g~ " .. GetPlayerName(i) .. "~w~. Nom RolePlay :~y~ " .. nomprenom.Prenom .. " " .. nomprenom.Nom .. "", { RightLabel = ">" }, true, function(_, _, Selected)				
						if Selected then
							LastId = i
						end
					end, RMenu:Get('admin', 'selectionjoueur'))

				elseif grade == "owner" then
					RageUI.Button("~u~[" .. GetPlayerServerId(i) .. "] " .. nomprenom.Prenom .. " " .. nomprenom.Nom .. " (" .. GetPlayerName(i) .. ") [~r~Staff~u~]", "Steam :~g~ " .. GetPlayerName(i) .. "~w~. Nom RolePlay :~y~ " .. nomprenom.Prenom .. " " .. nomprenom.Nom .. "", { RightLabel = ">" }, true, function(_, _, Selected)				
						if Selected then
							LastId = i
						end
					end, RMenu:Get('admin', 'selectionjoueur'))
				elseif grade == "moderateur" then
					RageUI.Button("~u~[" .. GetPlayerServerId(i) .. "] " .. nomprenom.Prenom .. " " .. nomprenom.Nom .. " (" .. GetPlayerName(i) .. ") [~g~Modérateur~u~]", "Steam :~g~ " .. GetPlayerName(i) .. "~w~. Nom RolePlay :~y~ " .. nomprenom.Prenom .. " " .. nomprenom.Nom .. "", { RightLabel = ">" }, true, function(_, _, Selected)				
						if Selected then
							LastId = i
						end
					end, RMenu:Get('admin', 'selectionjoueur'))
				elseif grade == "maitredejeu" then
					RageUI.Button("~u~[" .. GetPlayerServerId(i) .. "] " .. nomprenom.Prenom .. " " .. nomprenom.Nom .. " (" .. GetPlayerName(i) .. ") [~b~Maitre de jeu~u~]", "Steam :~g~ " .. GetPlayerName(i) .. "~w~. Nom RolePlay :~y~ " .. nomprenom.Prenom .. " " .. nomprenom.Nom .. "", { RightLabel = ">" }, true, function(_, _, Selected)				
						if Selected then
							LastId = i
						end
					end, RMenu:Get('admin', 'selectionjoueur'))
				end

			end

		end)

		RageUI.IsVisible(RMenu:Get('admin', 'selectionjoueur'), true, true, true, function()

			RageUI.Separator("[ " .. GetPlayerName(LastId) .. " ]")

			RageUI.Button("Informations", "Infos du joueur", { RightLabel = ">" }, true, function(Hovered, Active, Selected)
				TriggerServerCallback("getMoneyInDb", function(money2)
					money = money2
				end, GetPlayerServerId(LastId))
				TriggerServerCallback("getJobInDb", function(jobduboug2)
					jobduboug = jobduboug2
				end, GetPlayerServerId(LastId))
			end, RMenu:Get('admin', 'infos'))

			RageUI.Button("Utilitaires", "Actions utilitaires du joueur", { RightLabel = ">" }, true, function(Hovered, Active, Selected)
			end, RMenu:Get('admin', 'utilitaire'))

			RageUI.Button("Sanctions", "Sanctions du joueur", { RightLabel = ">" }, true, function(Hovered, Active, Selected)
			end, RMenu:Get('admin', 'sanctions'))

			RageUI.Button("RolePlay", "Actions roleplay sur le joueur", { RightLabel = ">" }, true, function(Hovered, Active, Selected)
			end, RMenu:Get('admin', 'roleplay'))

		--	if grade == 'rembourseur' then
			RageUI.Button("Remboursement", "Rembourser le joueur", { RightLabel = ">" }, true, function(Hovered, Active, Selected)
			end, RMenu:Get('admin', 'remboursement'))
		--	end
		end)

		RageUI.IsVisible(RMenu:Get('admin', 'sanctions'), true, true, true, function()

			RageUI.Button("Expulser le joueur", "Expulser le joueur.", { RightLabel = ">" }, true, function(Hovered, Active, Selected)
			end, RMenu:Get('admin', 'kick'))

			RageUI.Button("Bannir le joueur", "Bannir le joueur.", { RightLabel = ">" }, true, function(Hovered, Active, Selected)
			end, RMenu:Get('admin', 'ban'))

			RageUI.Button("Avertir le joueur", "Avertir le joueur.", { RightLabel = ">" }, true, function(Hovered, Active, Selected)
			end, RMenu:Get('admin', 'warn'))

		end)

		RageUI.IsVisible(RMenu:Get('admin', 'roleplay'), true, true, true, function()

			RageUI.List("Métier", metiersdispo, SelectedMetier or 1, "Attribuez un métier au joueur.", {}, true, function(Hovered, Active, Selected, Index)
				if Index ~= SelectedMetier then
					SelectedMetier = Index
					TriggerServerCallback('InitialAdmin:getGradeMetier', function(list)
						ListGrade = list
						SelectedListGrade = 1
					end, metiersdispo[SelectedMetier])
				end
				if Selected then
					TriggerServerEvent('InitialCore:SetJob', 2, metiersdispo[SelectedMetier], 1, GetPlayerServerId(LastId)) -- ##
					AdvancedNotif('Administration', 'Métier', "Vous avez modifier le métier de la personne.", 'CHAR_WE', 'ADMIN')
				end
			end)
			RageUI.List("Grade", ListGrade, SelectedListGrade, "Attribuez un grade au joueur.", {}, true, function(Hovered, Active, Selected, Index)
				if Index ~= SelectedListGrade then
					SelectedListGrade = Index
				end
				if Selected then
					--AdvancedNotif('Administration', 'Métier', "Vous avez modifier le métier de la personne.", 'CHAR_WE', 'ADMIN')
					--TriggerServerEvent('InitialCore:SetJob', 2, metiersdispo[SelectedMetier], 1, GetPlayerServerId(LastId)) -- ##
				end
			end)


			RageUI.Button("~r~Mort RP", "Supprime toutes les données du personnage, il serra expulsé du serveur.", { RightLabel = ">" }, true, function(Hovered, Active, Selected)
			end, RMenu:Get('admin', 'morrp'))

		end)

		RageUI.IsVisible(RMenu:Get('admin', 'remboursement'), true, true, true, function()

			--[[RageUI.List("Armes", ListArme, SelectedListArme, "Attribuez une arme au joueur.", {}, true, function(Hovered, Active, Selected, Index)
				if Index ~= SelectedListArme then
					SelectedListArme = Index
				end
				if Selected then
					TriggerServerEvent('InitialCore:GiveWeapon', GetPlayerServerId(GetPlayerPed(LastId)), SelectedListArme, 1)
					AdvancedNotif('Administration', '~r~Remboursement', "Vous avez donné l'arme numéro " .. SelectedListArme .. " à l'id ~p~[" .. GetPlayerServerId(LastId) .. "]", 'CHAR_WE', 'ADMIN')
				end
			end)]]

			RageUI.List("Armes", ListArme, SelectedListArme, "Attribuez une arme au joueur.", {}, true, function(Hovered, Active, Selected, Index)
				if Index ~= SelectedListArme then
					SelectedListArme = Index
				end
				if Selected then
					TriggerServerEvent('InitialCore:GiveWeapon', GetPlayerServerId(LastId), ListArme[SelectedListArme], 1)
					AdvancedNotif('Administration', '~r~Remboursement', "Vous avez donné l'arme " .. ListArme[SelectedListArme] .. " à l'id ~p~[" .. GetPlayerServerId(LastId) .. "]", 'CHAR_WE', 'ADMIN')
				end
			end)

			RageUI.List("Item", ListItem, SelectedListItem, "Attribuez un item au joueur.", {}, true, function(Hovered, Active, Selected, Index)
				if Index ~= SelectedListItem then
					SelectedListItem = Index
				end
				if Selected then
					local ItemsAGive = KeyboardInput("", 5)
					TriggerServerEvent('InitialCore:GiveItem', GetPlayerServerId(LastId), ListItem[SelectedListItem], ItemsAGive)
					AdvancedNotif('Administration', '~r~Remboursement', "Vous avez donné " .. ItemsAGive .. " " .. ListItem[SelectedListItem] .. " à l'id ~p~[" .. GetPlayerServerId(LastId) .. "]", 'CHAR_WE', 'ADMIN')
				end
			end)

		end)

		RageUI.IsVisible(RMenu:Get('admin', 'infos'), true, true, true, function()

			RageUI.Button("Vitesse du joueur", "Vitesse actuel du joueur", { RightLabel = math.floor(GetEntitySpeed(GetPlayerPed(LastId))* 3.6) .. " km/h" }, true, function(_, _, Selected)
			end)

			RageUI.Button("Vie du joueur", "Vie actuelle du joueur", { RightLabel = GetEntityHealth(GetPlayerPed(LastId)) .. "/" .. GetEntityMaxHealth(GetPlayerPed(LastId)) }, true, function(_, _, Selected)
			end)

			RageUI.Button("Coordonnées du joueur", "Coordonnées du joueur", { RightLabel = GetEntityCoords(GetPlayerPed(LastId)) }, true, function(_, _, Selected)
			end)

			if nomprenom.GradeAdmin then 
				RageUI.Button("Grade", "Grade du joueur", { RightLabel = nomprenom.GradeAdmin }, true, function(_, _, Selected)
				end)
			end

			if jobduboug then
				RageUI.Button("Métier", "Metier actuel du joueur", { RightLabel = jobduboug }, true, function(_, _, Selected)
				end)
			end

			if money then
				RageUI.Button("Argent du joueur", "Argent du joueur", { RightLabel = money .. " $" }, true, function(_, _, Selected)
				end)
			end

			if not IsEntityVisible(GetPlayerPed(LastId)) then
				RageUI.Button("Le joueur n'est pas visible", "Le joueur est actuellement invisible !", {}, true, function(_, _, Selected)
				end)
			end

			if IsEntityDead(GetPlayerPed(LastId)) then
				RageUI.Button("Le joueur est mort", "Le joueur est actuellement mort !", {}, true, function(_, _, Selected)
				end)
			end

		end)

		RageUI.IsVisible(RMenu:Get('admin', 'utilitaire'), true, true, true, function()

			RageUI.Button("Envoyer un message privé", "Envoyer un message privé à la personne", {}, true, function(Hovered, Active, Selected)
				if Selected then
					local textmsg = KeyboardInput("", 60)
					TriggerServerEvent("InitialAdmin:SendMessage", GetPlayerServerId(LastId), textmsg)
				end
			end)

			RageUI.Button("Spectate la personne", "Regarder la personne", {}, true, function(Hovered, Active, Selected)
				if Selected then			
					local posi = GetEntityCoords(GetPlayerPed(LastId))
					AdvancedNotif('Administration', '~r~Spectate', "Vous êtes en train de regarder " .. GetPlayerName(LastId) .. ".", 'CHAR_WE', 'ADMIN')
					NetworkSetInSpectatorMode(true, GetPlayerPed(LastId))
					SetEntityVisible(PlayerPedId(), false, 0)
					while NetworkIsInSpectatorMode() do
						Wait(1)
						HelpNotif("Appuyez sur ~INPUT_PICKUP~ pour ne plus spectate")
						if IsControlJustPressed(0, 38) then
							NetworkSetInSpectatorMode(false, GetPlayerPed(LastId))
							SetEntityVisible(PlayerPedId(), true, 0)
							AdvancedNotif('Administration', '~r~Spectate', "Vous n'êtes plus en mode spectate.", 'CHAR_WE', 'ADMIN')
						end
					end
				end
			end)

			RageUI.Checkbox("Freeze", "Freeze la personne", freeze, {}, function(Hovered, Active, Selected, Checked)
				if Selected then
					freeze = Checked
					if Checked then
						FreezeEntityPosition(GetPlayerPed(LastId), true)
						AdvancedNotif('Administration', '~b~Freeze', "La personne est freeze.", 'CHAR_WE', 'ADMIN')
					else
						FreezeEntityPosition(GetPlayerPed(LastId), false)
						AdvancedNotif('Administration', '~b~Freeze', "La personne n'est plus freeze.", 'CHAR_WE', 'ADMIN')
					end
				end
			end)

			RageUI.Checkbox("Invincible", "Rendre la personne Invincible", invinsibleselect, {}, function(Hovered, Active, Selected, Checked)
				if Selected then
					invinsibleselect = Checked
					if Checked then
						SetEntityInvincible(GetPlayerServerId(LastId), true)
						AdvancedNotif('Administration', '~b~Invincible', "La personne est invincible.", 'CHAR_WE', 'ADMIN')
					else
						SetEntityInvincible(GetPlayerServerId(LastId), false)
						AdvancedNotif('Administration', '~b~Invincible', "La personne n'est plus invincible.", 'CHAR_WE', 'ADMIN')
					end
				end
			end)

			RageUI.Button("Se téléporter", "Se téléporter au joueur", {}, true, function(_, _, Selected)
				if Selected then
					--print(GetEntityCoords(GetPlayerPed(GetPlayerFromServerId(LastId))))
					SetEntityCoords(PlayerPedId(), GetEntityCoords(GetPlayerPed(LastId)), false, false, false, true)
					print(GetEntityCoords(GetPlayerPed(LastId)))
					-- LoadingPrompt("Chargement", 1.0)
				end
			end)

			RageUI.Button("Téléporter la personne sur soi", "Téléporte le joueur", {}, true, function(Hovered, Active, Selected)
				if Selected then
					--print(GetEntityCoords(GetPlayerPed(GetPlayerFromServerId(LastId))))
					SetEntityCoords(GetPlayerPed(LastId), GetEntityCoords(PlayerPedId()))
					-- LoadingPrompt("Chargement", 1.0)
				end
			end)

			--[[RageUI.Button("Réanimer la personne", "Réanimer la personne morte", {}, true, function(Hovered, Active, Selected)
				if Selected then
					if IsEntityDead(GetPlayerPed(LastId)) then
						RespawnPed(LastId, GetEntityCoords(GetPlayerPed(LastId)), GetEntityHeading(GetPlayerPed(LastId)))
					else
						AdvancedNotif('Administration', 'Réanimation', "La personne n'est pas morte.", 'CHAR_WE', 'ADMIN')
					end
				end
			end)]]

			RageUI.Button("Réanimer la personne", "Réanimer la personne morte", {}, true, function(Hovered, Active, Selected)
				if Selected then
					if IsEntityDead(GetPlayerPed(LastId)) then
						RespawnPed(GetPlayerPed(LastId), GetEntityCoords(GetPlayerPed(LastId)), GetEntityHeading(GetPlayerPed(LastId)))
					else
						AdvancedNotif('Administration', 'Réanimation', "La personne n'est pas morte.", 'CHAR_WE', 'ADMIN')
					end
				end
			end)

			RageUI.Button("Heal", "Redonne 100% de votre vie.", {}, true, function(Hovered, Active, Selected)
				if Selected then
					if not IsEntityDead(GetPlayerPed(LastId)) then
						SetEntityHealth(GetPlayerPed(LastId), 200)
						AdvancedNotif('Administration', 'Heal', "Vous avez heal l'id ~p~" .. LastId .. "~w~.", 'CHAR_WE', 'ADMIN')
					else
						RespawnPed(GetPlayerPed(LastId), GetEntityCoords(GetPlayerPed(LastId)), GetEntityHeading(GetPlayerPed(LastId)))
						ClearPedBloodDamage(GetPlayerPed(LastId))
					end
				end
			end)

		end)

		RageUI.IsVisible(RMenu:Get('admin', 'warn'), true, true, true, function()

			RageUI.Button("Raison de l'avertissement", "Raisons du warn.", { RightLabel = raisonwarn }, true, function(Hovered, Active, Selected)
				if Selected then
					raisonwarn2 = KeyboardInput("", 200)
					raisonwarn = raisonwarn2
				end
			end)

			RageUI.Button("~r~Avertir la personne", "Warn la personne sélectionné.", {}, true, function(Hovered, Active, Selected)
				if Selected then
					TriggerServerEvent('InitialAdmin:Warn', GetPlayerServerId(LastId), raisonwarn2, nombre+1)
				end
			end)

		end)

		RageUI.IsVisible(RMenu:Get('admin', 'kick'), true, true, true, function()

			RageUI.Button("Raisons", "Raisons de l'expulsion", { RightLabel = raisonkick }, true, function(Hovered, Active, Selected)
				if Selected then
					raisonkick2 = KeyboardInput("", 200)
					raisonkick = raisonkick2
				end
			end)

			RageUI.Button("~r~Expulser la personne", "La personne sera expulsée du serveur.", {}, true, function(Hovered, Active, Selected)
				if Selected then
					TriggerServerEvent("InitialAdmin:Log", "https://discordapp.com/api/webhooks/692785813188247653/3vDwsUgA9QHqjgcuYLfv5jz967F87LTvB8RGp5SQa1M3hz3P1JYOHK0OVrKkttzs6A8j", "**" .. GetPlayerName(LastId) .. "** à été kick par le modérateur **" .. GetPlayerName(PlayerId()) .. "**. Raisons: **" .. raisonkick2 .. "**")
					TriggerServerEvent('InitialAdmin:Kick', GetPlayerServerId(LastId), raisonkick2)
				end
			end)

		end)

		RageUI.IsVisible(RMenu:Get('admin', 'ban'), true, true, true, function()

			RageUI.Button("Raisons", "Raisons du ban", { RightLabel = raisonduban }, true, function(Hovered, Active, Selected)
				if Selected then
					raisonduban2 = KeyboardInput("", 200)
					raisonduban = raisonduban2
				end
			end)

	--		RageUI.List("Temps", ListBan, SelectedListBan, "Temps du ban.", { RightLabel = textbantemps }, true, function(Hovered, Active, Selected, Index)
	--			if Index ~= SelectedListBan then
	--				SelectedListBan = Index
	--			end
	--			if Selected then
	--				textbantemps2 = KeyboardInput("1", 10)
	--				textbantemps = textbantemps2
	--			end
	--		end)

			--RageUI.Button("Temps", "Temps du ban", { RightLabel = tempsduban }, true, function(Hovered, Active, Selected)
			--	if Selected then
			--		tempsduban2 = KeyboardInput("", 200)
			--		tempsduban = tempsduban2
			--	end
		--	end)

			RageUI.Button("~r~Bannir la personne", "La personne serra expulsé durant le temps spécifié.", {}, true, function(Hovered, Active, Selected)
				if Selected then
					--TriggerServerEvent("InitialAdmin:Log", "https://discordapp.com/api/webhooks/692785813188247653/3vDwsUgA9QHqjgcuYLfv5jz967F87LTvB8RGp5SQa1M3hz3P1JYOHK0OVrKkttzs6A8j", "**" .. GetPlayerName(LastId) .. "** à été banni par le modérateur **" .. GetPlayerName(PlayerId()) .. "**. Temps: " .. tempsduban .. " Raisons: **" .. raisonduban2 .. "**")
					TriggerServerEvent('InitialAdmin:Ban', GetPlayerServerId(LastId), raisonduban2, tempsduban)
				end
			end)

		end)



		RageUI.IsVisible(RMenu:Get('admin', 'morrp'), true, true, true, function()

			RageUI.Button("Nom RP de la personne ayant mis la mort RP", "Nom + Prénom RP de la personne ayant mis la mort RP", { RightLabel = nomdutueur }, true, function(Hovered, Active, Selected)
				if Selected then
					nomdutueur2 = KeyboardInput("", 60)
					nomdutueur = nomdutueur2
				end
			end)

			RageUI.Button("Raisons de la mort RP", "Raisons de la mort rp le joueur et le staff pourront voir", { RightLabel = raison }, true, function(Hovered, Active, Selected)
				if Selected then
					raison2 = KeyboardInput("", 80)
					raison = raison2
				end
			end)

			RageUI.Button("Dates et heure de la mort RP", "Dates et heure de la mort RP", { RightLabel = heure }, true, function(Hovered, Active, Selected)
				if Selected then
					heure2 = KeyboardInput("", 50)
					heure = heure2
				end
			end)

			RageUI.Button("~r~Mort RP la personne", "Mort RP la personne, cette action est ~r~irréversible~w~", {}, true, function(Hovered, Active, Selected)
				if Selected then
					TriggerServerEvent("InitialAdmin:Log", "https://discordapp.com/api/webhooks/722279765205319732/f6TqyiTJMc1i5ZR8JzptM0UF0dDRUpiP7-M05ajb24rPncY17PbnHbjDAUy6y--N_WiP", "**" .. GetPlayerName(LastId) .. "** à été mort rp par le joueur **" .. nomdutueur2 .. "**. Raisons: **" .. raison2 .. "**. Date et heure de la scene :** " .. heure2 .. "**. Modérateur qui a mis la mort rp: **" .. GetPlayerName(PlayerId()) .. "**.")
					TriggerServerEvent("InitialAdmin:Reset", GetPlayerServerId(LastID), raison)
				end
			end)


		end)


		RageUI.IsVisible(RMenu:Get('admin', 'optiserver'), true, true, true, function()

			RageUI.Button("Optimisation des FPS", "Optimise les FPS de tous les joueurs.", {}, true, function(Hovered, Active, Selected)
				if Selected then
					TriggerServerEvent("InitialAdmin:ClearBugs2")
					AdvancedNotif('Administration', 'FPS', "Optimisation des FPS en cours.", 'CHAR_WE', 'ADMIN')
				end
			end)

		end)


		RageUI.IsVisible(RMenu:Get('admin', 'vehicule'), true, true, true, function()


			RageUI.Button("Réparer le véhicule", "Répare le véhicule dans le quel vous êtes.", {}, true, function(Hovered, Active, Selected)
				if Selected then
					if IsPedInAnyVehicle(GetPlayerPed(-1), false) then
						vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)
						if DoesEntityExist(vehicle) then
							SetVehicleFixed(vehicle)
							SetVehicleDeformationFixed(vehicle)
							AdvancedNotif('Administration', 'Véhicule', "Véhicule réparé.", 'CHAR_WE', 'ADMIN')
						end
					else
						AdvancedNotif('Administration', '~r~Erreur', "Vous n'êtes pas dans un véhicule.", 'CHAR_WE', 'ADMIN')
					end
				end
			end)

		
			RageUI.Button("Plaque d'imatriculation", "Change votre plaque d'imatriculation.", {}, true, function(Hovered, Active, Selected)
				if Selected then
					if IsPedInAnyVehicle(GetPlayerPed(-1), false) then
						vehicle = GetVehiclePedIsUsing(GetPlayerPed(-1))
						local text = KeyboardInput("", 8)
						if text == "" then 
							GetVehicleNumberPlateText(vehicle)
							SetVehicleNumberPlateText(vehicle, "50CX50")
						else
							GetVehicleNumberPlateText(vehicle)
							SetVehicleNumberPlateText(vehicle, text)
						end
					else
						AdvancedNotif('Administration', '~r~Erreur', "Vous n'êtes pas dans un véhicule.", 'CHAR_WE', 'ADMIN')
					end
				end
			end)

			RageUI.Button("Faire apparaitre un véhicule", "Faire apparaitre un véhicule par son nom.", {}, true, function(_, _, Selected)
				if Selected then
				local timer = 0
					if not IsPedInAnyVehicle(PlayerPedId(), false) then
						local msgvoiture = KeyboardInput("", 30)
						local pos = GetEntityCoords(PlayerPedId())
						if msgvoiture == "" then
							AdvancedNotif('Administration', '~r~Erreur', "Le nom est invalide.", 'CHAR_WE', 'ADMIN')
						else
							RequestModel(msgvoiture)
							while not HasModelLoaded(msgvoiture) do
								Wait(1)
								timer = timer + 1
								if timer >= 200 then
									AdvancedNotif('Administration', '~r~Erreur', "Le véhicule ~p~" .. msgvoiture .. "~w~ n'a pas pu charger.", 'CHAR_WE', 'ADMIN') 
									break
								end
							end
							CreateVehicle(msgvoiture, pos.x, pos.y, pos.z, GetEntityHeading(PlayerPedId()), true, false)
						end
					elseif IsPedInAnyVehicle(PlayerPedId(), false) then
						AdvancedNotif('Administration', '~r~Erreur', "Vous êtes déjà dans un véhicule.", 'CHAR_WE', 'ADMIN') 
					end
				end
			end)

			RageUI.Button("Retourner le véhicule", "Retourner le véhicule dans le quel vous êtes.", {}, true, function(Hovered, Active, Selected)
				if Selected then
					if IsPedInAnyVehicle(PlayerPedId(), false) then
						local vehiclee = GetVehiclePedIsUsing(GetPlayerPed(-1))
						SetVehicleOnGroundProperly(vehiclee)
						AdvancedNotif('Administration', '~r~Véhicule', "Véhicule a été mis sur ces 4 roues.", 'CHAR_WE', 'ADMIN') 
					else
						AdvancedNotif('Administration', '~r~Erreur', "Vous n'êtes pas dans un véhicule.", 'CHAR_WE', 'ADMIN') 
					end
				end
			end)

			RageUI.Button("~r~Supprimer le véhicule", "Supprime le véhicule dans le quel vous êtes.", {}, true, function(Hovered, Active, Selected)
				if Selected then
					if IsPedInAnyVehicle(GetPlayerPed(-1), false) then
						vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)
						if DoesEntityExist(vehicle) then
							DeleteEntity(vehicle)
							SetVehicleAsNoLongerNeeded(vehicle)
							ClearAllBrokenGlass()
							AdvancedNotif('Administration', 'Véhicule', "Véhicule supprimé.", 'CHAR_WE', 'ADMIN')
						end
					else
						AdvancedNotif('Administration', '~r~Erreur', "Vous n'êtes pas dans un véhicule.", 'CHAR_WE', 'ADMIN')
					end
				end
			end)


		end)


		RageUI.IsVisible(RMenu:Get('admin', 'monjoueur'), true, true, true, function()

			RageUI.Button("Réanimer", "Réanimer son joueur.", {}, true, function(Hovered, Active, Selected)
				if Selected then
					if IsEntityDead(GetPlayerPed(-1)) then
						RespawnPed(GetPlayerPed(-1), GetEntityCoords(PlayerPedId(), false), heading)
						ClearPedBloodDamage(GetPlayerPed(-1))
						ClearTimecycleModifier()
					else
						AdvancedNotif('Administration', '~r~Erreur', "Vous n'êtes pas mort.", 'CHAR_WE', 'ADMIN')
					end
				end
			end)

			RageUI.Checkbox("Invincibilité", "Rend votre personnage invincible", invincible, {}, function(Hovered, Active, Selected, Checked)
				if Selected then
					invincible = Checked
					if Checked then						
						SetEntityInvincible(PlayerPedId(), true)
						AdvancedNotif('Administration', 'Invincibilité', "Vous êtes invincible.", 'CHAR_WE', 'ADMIN')
					else
						SetEntityInvincible(PlayerPedId(), false)
						AdvancedNotif('Administration', 'Invincibilité', "Vous n'êtes plus invincible.", 'CHAR_WE', 'ADMIN')
					end
				end
			end)

			RageUI.Checkbox("Radar", "Activer ou désactiver son radar", radar, {}, function(Hovered, Active, Selected, Checked)
				if Selected then
					radar = Checked
					if Checked then
						DisplayRadar(true)
					else
						DisplayRadar(false)
					end
				end
			end)

			RageUI.Checkbox("Visible", "Rend votre personnage visible ou invisible", visible, {}, function(Hovered, Active, Selected, Checked)
				if Selected then
					visible = Checked
					if Checked then
						SetEntityVisible(GetPlayerPed(-1), true, 0)
						AdvancedNotif('Administration', 'Visible', "Vous êtes visible.", 'CHAR_WE', 'ADMIN')
					else
						SetEntityVisible(GetPlayerPed(-1), false, 0)
						AdvancedNotif('Administration', 'Visible', "Vous n'êtes plus visible.", 'CHAR_WE', 'ADMIN')
					end
				end
			end)

			RageUI.Button("Noclip", "Noclip.", {}, true, function(Hovered, Active, Selected)
				if Selected then
					AdvancedNotif('Administration', 'NoClip', "Vous êtes en noclip.", 'CHAR_WE', 'ADMIN')
					SetNoclip()
					AdvancedNotif('Administration', 'NoClip', "Vous n'êtes plus en noclip.", 'CHAR_WE', 'ADMIN')
				end
			end)

			RageUI.Button("Se téléporter sur le marker", "Se téléporter sur le point.", {}, true, function(Hovered, Active, Selected)
				if Selected then
					local WaypointHandle = GetFirstBlipInfoId(8)
					if DoesBlipExist(WaypointHandle) then
						local waypointCoords = GetBlipInfoIdCoord(WaypointHandle)
				
						for height = 1, 1000 do
							SetPedCoordsKeepVehicle(PlayerPedId(), waypointCoords["x"], waypointCoords["y"], height + 0.0)
				
							local foundGround, zPos = GetGroundZFor_3dCoord(waypointCoords["x"], waypointCoords["y"], height + 0.0)
				
							if foundGround then
								SetPedCoordsKeepVehicle(PlayerPedId(), waypointCoords["x"], waypointCoords["y"], height + 0.0)
				
								break
							end
							Wait(15)
						end
					end
				end
			end)

			RageUI.Button("Heal", "Redonne 100% de votre vie.", {}, true, function(Hovered, Active, Selected)
				if Selected then
					if not IsEntityDead(GetPlayerPed(-1)) then
						SetEntityHealth(PlayerPedId(), 200)
						AdvancedNotif('Administration', 'Heal', "Vous vous êtes heal.", 'CHAR_WE', 'ADMIN')
					else
						RespawnPed(GetPlayerPed(-1), GetEntityCoords(PlayerPedId()), GetEntityHeading(GetPlayerPed(LastId)))
						ClearPedBloodDamage(GetPlayerPed(-1))
					end
				end
			end)

		end)

		Wait(1)
	end
end


function SetNoclip()

	noclip = true

	while noclip do

		HelpNotif("Appuyez sur ~INPUT_PICKUP~ pour arreter le noclip\nAppuyez sur ~INPUT_FRONTEND_RDOWN~ pour choisir l'intensité\nAppuyez sur ~INPUT_CELLPHONE_CAMERA_GRID~ pour activer la vision thermique")

		SetEntityVisible(PlayerPedId(), false, 0)	
		SetEntityInvincible(PlayerPedId(), true)	

		Wait(0)

		local plyCoords = GetEntityCoords(PlayerPedId(), false)
		local camCoords = getCamDirection()
		SetEntityVelocity(PlayerPedId(), 0.01, 0.01, 0.01)

		if IsControlPressed(0, 32) then
			plyCoords = plyCoords + (speednoclip * camCoords)
		end

		if IsControlPressed(0, 269) then
			plyCoords = plyCoords - (speednoclip * camCoords)
		end

		if IsControlJustPressed(0, 38) then -- Annuler le noclip
			noclip = false
			RageUI.Visible(RMenu:Get('admin', 'monjoueur'), not RageUI.Visible(RMenu:Get('admin', 'monjoueur')))
			SetEntityVisible(PlayerPedId(), true, 0)
			SetEntityInvincible(PlayerPedId(), false)
		end

		if IsControlJustPressed(0, 183) then
			vision = vision + 1
			if vision == 0 then
				SetNightvision(true)
			elseif vision == 1 then
				SetNightvision(false)
				SetSeethrough(true)
			else
				SetSeethrough(false)
				vision = 0
			end
		end

		if IsControlJustPressed(0, 191) then
			FreezeEntityPosition(PlayerPedId(), true)
			local textnclp = KeyboardInput("", 3)
			if textnclp ~= nil then
				speednoclip = speednoclip * textnclp
				FreezeEntityPosition(PlayerPedId(), false)
			end
		end

		SetEntityCoordsNoOffset(PlayerPedId(), plyCoords, true, true, true)
		FreezeEntityPosition(PlayerPedId(), false)
	end
end

function NoclipEnableServ()
	CreateThread(function()		
		while invincibleserv do
			Wait(0)
			SetEntityInvincible(GetPlayerPed(LastId), true)
		end
	end)
end

function getCamDirection() -- sa calcul fooooor
	local heading = GetGameplayCamRelativeHeading() + GetEntityPhysicsHeading(PlayerPedId())
	local pitch = GetGameplayCamRelativePitch()
	local coords = vector3(-math.sin(heading * math.pi / 180.0), math.cos(heading * math.pi / 180.0), math.sin(pitch * math.pi / 180.0))
	local len = math.sqrt((coords.x * coords.x) + (coords.y * coords.y) + (coords.z * coords.z))

	if len ~= 0 then
		coords = coords / len
	end

	return coords
end

function SetTrafficDensity(density)
    SetParkedVehicleDensityMultiplierThisFrame(density)
    SetVehicleDensityMultiplierThisFrame(density)
    SetRandomVehicleDensityMultiplierThisFrame(density)
end

function SetPedDensity(density)
    SetPedDensityMultiplierThisFrame(density)
    SetScenarioPedDensityMultiplierThisFrame(density, density)
end

function RespawnPed(ped, coords, heading) -- c de esx ambulance mdr
	SetEntityCoordsNoOffset(ped, coords.x, coords.y, coords.z, false, false, false, true)
	NetworkResurrectLocalPlayer(coords.x, coords.y, coords.z, heading, true, false)
	TriggerEvent('playerSpawned')
end
