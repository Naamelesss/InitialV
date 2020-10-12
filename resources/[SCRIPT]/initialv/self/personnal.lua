------------------------------------------------------------------------------
--
-- Ce travail est sous liscence:
-- Creative Commons Attribution-NonCommercial-NoDerivatives-NoDistribution 4.0 International License.
--
------------------------------------------------------------------------------

local PersonnalMenuOpened = false

local nomprenom

RMenu.Add('personnal', 'main', RageUI.CreateMenu("Menu personnel", "~b~MENU PERSONNEL"))
RMenu.Add('personnal', 'animation', RageUI.CreateSubMenu(RMenu:Get('personnal', 'main'), "Animations", "~b~MENU PERSONNEL"))
RMenu.Add('personnal', 'settings', RageUI.CreateSubMenu(RMenu:Get('personnal', 'main'), "Paramètres", "~b~MENU PERSONNEL"))
RMenu.Add('personnal', 'actions', RageUI.CreateSubMenu(RMenu:Get('personnal', 'main'), "Actions", "~b~MENU PERSONNEL"))
RMenu.Add('personnal', 'others', RageUI.CreateSubMenu(RMenu:Get('personnal', 'main'), "Autre", "~b~MENU PERSONNEL"))
RMenu.Add('personnal', 'report', RageUI.CreateSubMenu(RMenu:Get('personnal', 'main'), "Report", "~b~MENU PERSONNEL"))

RegisterCommand('+personnal', function()
    --openMenuMetier()
    if not PersonnalMenuOpened then
		RageUI.Visible(RMenu:Get('personnal', 'main'), not RageUI.Visible(RMenu:Get('personnal', 'main')))
   --     PersonnalMenuOpened = true
    --    OpenPesonnalMenu()
    end
end, false)

RegisterCommand('-personnal', function()
end, false)

RegisterKeyMapping('+personnal', 'Ouvrir le menu personnel', 'keyboard', 'F5')

CreateThread(function()
	NetworkSetTalkerProximity(0.1)
    Wait(6000)
    NetworkSetTalkerProximity(8.0)
end)

local VoiceDist = {
    Dist = {3.0, 8.0, 20.0},
    DistIndex = 2
}

local Animations = {
	
        {
        name = "sasseoir",
        label = "S'asseoir",
        items = {
            {label = "Accouder flow 01", type = "anim", data = {lib = "missheistdockssetup1ig_12@base", anim = "talk_gantry_idle_base_worker2"}},
            {label = "Accouder flow 02", type = "anim", data = {lib = "missheistdockssetup1ig_12@base", anim = "talk_gantry_idle_base_worker4"}},
            {label = "S'asseoir au sol", type = "anim", data = {lib = "anim@heists@fleeca_bank@ig_7_jetski_owner", anim = "owner_idle"}},
            {label = "Se poser contre un mur", type = "scenario", data = {anim = "WORLD_HUMAN_LEANING"}},
            {label = "S'asseoir par terre", type = "scenario", data = {anim ="WORLD_HUMAN_PICNIC"}},
            {label = "S'asseoir cool 2", type = "anim", data = {lib = "anim@heists@heist_safehouse_intro@phone_couch@male", anim = "phone_couch_male_idle"}},
            {label = "Méditation", type = "anim", data = {lib = "rcmcollect_paperleadinout@", anim = "meditiate_idle"}},
            {label = "Genoux au sol", type = "anim", data = {lib = "amb@medic@standing@kneel@base", anim = "base"}},
            {label = "S'asseoir chill",type = "anim", data = {lib ="missheistpaletoscoresetupleadin", anim = "rbhs_mcs_1_leadin"}},
            {label = "S'asseoir cool",type = "anim", data = {lib ="missfam2leadinoutmcs3",anim = "onboat_leadin_pornguy_a"}}
            }
        },
        {
        name = "actions",
        label = "Actions",
        items = {
				{label = "Slide",type = "anim", data = {lib ="anim@arena@celeb@flat@solo@no_props@",anim ="slide_a_player_a"}},
				{label = "Reverence ",type = "anim", data = {lib ="anim@arena@celeb@podium@no_prop@",anim ="regal_c_1st"}},
				{label = "Pleure a genoux",type = "anim", data = {lib ="mp_bank_heist_1",anim ="f_cower_01"}},
				{label = "Sortir son carnet", type = "scenario", data = {anim ="CODE_HUMAN_MEDIC_TIME_OF_DEATH"}},
				{label = "Noter des informations",type = "scenario", data = {anim ="WORLD_HUMAN_CLIPBOARD"}},
				{label = "Siffler",type = "anim", data = {lib ="rcmnigel1c",anim ="hailing_whistle_waive_a"}},
				{label = "Faire des pompes",type = "scenario", data = {anim ="WORLD_HUMAN_PUSH_UPS"}},
				{label = "Je me sens pas bien",type = "anim", data = {lib ="missfam5_blackout",anim ="pass_out"}},
				{label = "Loco",type = "anim", data = {lib ="anim@mp_player_intcelebrationmale@you_loco",anim ="you_loco"}},
				{label = "Wank",type = "anim", data = {lib ="anim@mp_player_intcelebrationmale@wank",anim ="wank"}},
				{label = "Laché moi",type = "anim", data = {lib ="anim@mp_player_intcelebrationmale@freakout",anim ="freakout"}},
                {label = "Mendier",type = "scenario", data = {anim ="WORLD_HUMAN_BUM_FREEWAY"}},
                {label = "Applaudir",type = "scenario", data = {anim ="WORLD_HUMAN_CHEERING"}},
				{label = "Slow Clap",type = "anim", data = {lib ="anim@mp_player_intcelebrationmale@slow_clap",anim ="slow_clap"}},
				{label = "Appel téléphonique",type = "anim", data = {lib ="cellphone@",anim ="cellphone_call_listen_base"}},
				{label = "Encouragement",type = "anim", data = {lib ="mini@triathlon",anim ="male_one_handed_a"}},
				{label = "Prendre une photo",type = "scenario", data = {anim ="WORLD_HUMAN_MOBILE_FILM_SHOCKING"}},
				{label = "Bras tendu",type = "anim", data = {lib ="nm@hands",anim ="flail"}},
				{label = "Yoga",type = "anim", data = {lib ="amb@world_human_yoga@male@base",anim ="base_a"}},
				{label = "Mîme",type = "anim", data = {lib ="special_ped@mime@monologue_5@monologue_5a",anim ="10_ig_1_wa_0"}},
				{label = "Faire des abdos",type = "scenario", data = {anim ="WORLD_HUMAN_SIT_UPS"}},
				{label = "Sortir votre carte",type = "scenario", data = {anim ="WORLD_HUMAN_TOURIST_MAP"}},
				{label = "Acrobatie 1",type = "anim", data = {lib ="anim@arena@celeb@flat@solo@no_props@",anim ="cap_a_player_a"}},
				{label = "Acrobatie 2",type = "anim", data = {lib ="anim@arena@celeb@flat@solo@no_props@",anim ="flip_a_player_a"}},
				{label = "Acrobatie 3",type = "anim", data = {lib ="anim@arena@celeb@flat@solo@no_props@",anim ="pageant_a_player_a"}}
			}
        },
        {
        name = "gestures",
        label = "Gestues",
			items = { 
				{label = "Bise au doigt",type = "anim", data = {lib ="anim@mp_player_intcelebrationfemale@finger_kiss",anim ="finger_kiss"}},
				{label = "Quoi",type = "anim", data = {lib ="gestures@f@standing@casual",anim ="gesture_bring_it_on"}},
				{label = "Casse-toi",type = "anim", data = {lib ="gestures@f@standing@casual",anim ="gesture_bye_hard"}},
				{label = "Salut",type = "anim", data = {lib ="gestures@f@standing@casual",anim ="gesture_bye_soft"}},
				{label = "Viens voir",type = "anim", data = {lib ="gestures@f@standing@casual",anim ="gesture_come_here_hard"}},
				{label = "Allez viens..",type = "anim", data = {lib ="gestures@f@standing@casual",anim ="gesture_come_here_soft"}},
				{label = "Damn",type = "anim", data = {lib ="gestures@f@standing@casual",anim ="gesture_damn"}},
				{label = "Tsss",type = "anim", data = {lib ="gestures@f@standing@casual",anim ="gesture_displeased"}},
				{label = "Hey calme",type = "anim", data = {lib ="gestures@f@standing@casual",anim ="gesture_easy_now"}},
				{label = "ICI",type = "anim", data = {lib ="gestures@f@standing@casual",anim ="gesture_hand_down"}},
				{label = "Gauche",type = "anim", data = {lib ="gestures@f@standing@casual",anim ="gesture_hand_left"}},
				{label = "Droite",type = "anim", data = {lib ="gestures@f@standing@casual",anim ="gesture_hand_right"}},
				{label = "Oh non",type = "anim", data = {lib ="gestures@f@standing@casual",anim ="gesture_head_no"}},
				{label = "Hey toi",type = "anim", data = {lib ="gestures@f@standing@casual",anim ="gesture_hello"}},
				{label = "Lourd",type = "anim", data = {lib ="gestures@f@standing@casual",anim ="gesture_i_will"}},
				{label = "Moi ?!",type = "anim", data = {lib ="gestures@f@standing@casual",anim ="gesture_me_hard"}},
				{label = "Moi",type = "anim", data = {lib ="gestures@f@standing@casual",anim ="gesture_me"}},
				{label = "Pas moyen",type = "anim", data = {lib ="gestures@f@standing@casual",anim ="gesture_no_way"}},
				{label = "Non non",type = "anim", data = {lib ="gestures@f@standing@casual",anim ="gesture_nod_no_hard"}},
				{label = "Non soft",type = "anim", data = {lib ="gestures@f@standing@casual",anim ="gesture_nod_no_soft"}},
				{label = "Oui fonce",type = "anim", data = {lib ="gestures@f@standing@casual",anim ="gesture_nod_yes_hard"}},
				{label = "Mouai",type = "anim", data = {lib ="gestures@f@standing@casual",anim ="gesture_nod_yes_soft"}},
				{label = "C'est ça",type = "anim", data = {lib ="gestures@f@standing@casual",anim ="gesture_pleased"}},
				{label = "My man",type = "anim", data = {lib ="gestures@f@standing@casual",anim ="gesture_point"}},
				{label = "Aucune idée",type = "anim", data = {lib ="gestures@f@standing@casual",anim ="gesture_shrug_hard"}},
				{label = "Aucune idée soft",type = "anim", data = {lib ="gestures@f@standing@casual",anim ="gesture_shrug_soft"}},
				{label = "Quoi ?!",type = "anim", data = {lib ="gestures@f@standing@casual",anim ="gesture_what_hard"}},
				{label = "Quoi soft",type = "anim", data = {lib ="gestures@f@standing@casual",anim ="gesture_what_soft"}},
				{label = "Toi",type = "anim", data = {lib ="gestures@f@standing@casual",anim ="gesture_you_hard"}},
				{label = "Toi soft",type = "anim", data = {lib ="gestures@f@standing@casual",anim ="gesture_you_soft"}},
				{label = "C'est à moi",type = "anim", data = {lib ="gestures@f@standing@casual",anim ="getsure_its_mine"}}
			}
        },
        {
		name = "expressions",
        label = "Expressions",
			items = { 
				{label = "Loose Thumbs 1",type = "anim", data = {lib ="anim@arena@celeb@flat@solo@no_props@",anim ="thumbs_down_a_player_a"}},
				{label = "Mort de rire",type = "anim", data = {lib ="anim@arena@celeb@flat@solo@no_props@",anim ="taunt_d_player_b"}},
				{label = "Badmood 1",type = "anim", data = {lib ="amb@world_human_stupor@male@base",anim ="base"}},
				{label = "Badmood 2",type = "anim", data = {lib ="amb@world_human_stupor@male_looking_left@base",anim ="base"}},
				{label = "Bisou",type = "anim", data = {lib ="mp_ped_interaction",anim ="kisses_guy_a"}},
				{label = "Stressé",type = "anim", data = {lib ="rcmme_tracey1",anim ="nervous_loop"}},
				{label = "Peace",type = "anim", data = {lib ="anim@mp_player_intcelebrationmale@peace",anim ="peace"}},
				{label = "Clown teubé",type = "anim", data = {lib ="move_clown@p_m_two_idles@",anim ="fidget_short_dance"}},
				{label = "Face Palm",type = "anim", data = {lib ="anim@mp_player_intcelebrationmale@face_palm",anim ="face_palm"}},
				{label = "Patience",type = "anim", data = {lib ="special_ped@impotent_rage@base",anim ="base"}},
				{label = "Respect",type = "anim", data = {lib ="mp_player_int_upperbro_love",anim ="mp_player_int_bro_love_fp"}},
				{label = "Inspecter ses lunettes",type = "anim", data = {lib ="clothingspecs",anim ="try_glasses_positive_a"}},
				{label = "Réflexion",type = "anim", data = {lib ="misscarsteal4@aliens",anim ="rehearsal_base_idle_director"}},
				{label = "Check mon flow",type = "anim", data = {lib ="clothingshirt",anim ="try_shirt_positive_d"}},
				{label = "VICTOIRE",type = "anim", data = {lib ="mini@tennisexit@",anim ="tennis_outro_win_01_female"}},
				{label = "Le plus fort",type = "anim", data = {lib ="rcmbarry",anim ="base"}},
				{label = "Ta géré!",type = "anim", data = {lib ="anim@mp_player_intcelebrationmale@thumbs_up",anim ="thumbs_up"}},
				{label = "Mal de tête",type = "anim", data = {lib ="misscarsteal4@actor",anim ="stumble"}},
				{label = "Bro love",type = "anim", data = {lib ="anim@mp_player_intcelebrationmale@bro_love",anim ="bro_love"}},
				{label = "Craquer les poignets",type = "anim", data = {lib ="anim@mp_player_intcelebrationmale@knuckle_crunch",anim ="knuckle_crunch"}},
				{label = "Salut militaire",type = "anim", data = {lib ="anim@mp_player_intuppersalute",anim ="idle_a"}},
				{label = "Signe GSF",type = "anim", data = {lib ="amb@code_human_in_car_mp_actions@gang_sign_b@low@ps@base",anim ="idle_a"}},
				{label = "Signe Vagos",type = "anim", data = {lib ="amb@code_human_in_car_mp_actions@v_sign@std@rds@base",anim ="idle_a"}},
				{label = "Signe Ballas",type = "anim", data = {lib ="mp_player_int_uppergang_sign_b",anim ="mp_player_int_gang_sign_b"}},
				{label = "Signe Locura",type = "anim", data = {lib ="mp_player_int_uppergang_sign_a",anim ="mp_player_int_gang_sign_a"}},
				{label = "Check moi ça !",type = "anim", data = {lib ="mp_ped_interaction",anim ="handshake_guy_a"}},
				{label = "Check moi ça 2",type = "anim", data = {lib ="mp_ped_interaction",anim ="hugs_guy_a"}},
				{label = "A vos marque ! Partez !",type = "anim", data = {lib ="random@street_race",anim ="grid_girl_race_start"}},
				{label = "Il a gagné !",type = "anim", data = {lib ="random@street_race",anim ="_streetracer_accepted"}},
				{label = "Ceinturons",type = "anim", data = {lib ="amb@code_human_wander_idles_cop@male@static",anim ="static"}},
				{label = "On arrête tous !",type = "anim", data = {lib ="anim@heists@ornate_bank@chat_manager",anim ="fail"}}
			}
        },
        {
        name = "poses",
        label = "Poses",
			items = {
				{label = "Faire du stop",type = "anim", data = {lib ="random@hitch_lift",anim ="idle_f"}},
				{label = "Se rendre, à genoux",type = "anim", data = {lib ="random@arrests@busted",anim ="enter"}},
				{label = "Dormir sur place",type = "anim", data = {lib ="mp_sleep",anim ="sleep_loop"}},
				{label = "PLS",type = "anim", data = {lib ="timetable@tracy@sleep@",anim ="idle_c"}},
				{label = "Roule au sol",type = "anim", data = {lib ="missfinale_a_ig_2",anim ="trevor_death_reaction_pt"}},
				{label = "Blessé au sol",type = "anim", data = {lib ="combat@damage@rb_writhe",anim ="rb_writhe_loop"}},
				{label = "Désespéré",type = "anim", data = {lib ="rcmnigel1c",anim ="idle_d"}},
				{label = "Essouffler",type = "anim", data = {lib ="re@construction",anim ="out_of_breath"}},
				{label = "Faire la statue",type = "scenario", data = {anim ="WORLD_HUMAN_HUMAN_STATUE"}},
				{label = "Montrer ses muscles",type = "scenario", data = {anim ="WORLD_HUMAN_MUSCLE_FLEX"}},
				{label = "Zombie",type = "anim", data = {lib ="special_ped@zombie@monologue_1@monologue_1c",anim ="iamundead_2"}},
				{label = "Pose garde",type = "anim", data = {lib ="amb@world_human_stand_guard@male@base",anim ="base"}},
				{label = "Bras croisé lourd",type = "anim", data = {lib ="anim@heists@heist_corona@single_team",anim ="single_team_loop_boss"}},
				{label = "Faire le maik",type = "anim", data = {lib ="anim@heists@heist_corona@single_team",anim ="single_team_intro_two"}},
				{label = "Bras croisé",type = "anim", data = {lib ="random@street_race",anim ="_car_b_lookout"}},
				{label = "Holster",type = "anim", data = {lib ="reaction@intimidation@cop@unarmed",anim ="intro"}},
				{label = "Patauge",type = "anim", data = {lib ="move_m@wading",anim ="walk"}}
			}
		},
        {
        name = "festives",
        label = "Festives",
			items = { 
				{label = "Suspense",type = "anim", data = {lib ="anim@amb@nightclub@dancers@black_madonna_entourage@",anim ="li_dance_facedj_11_v1_male^1"}},
				{label = "Coincé du q",type = "anim", data = {lib ="anim@amb@nightclub@dancers@black_madonna_entourage@",anim ="li_dance_facedj_15_v2_male^2"}},
				{label = "Enchainé",type = "anim", data = {lib ="anim@amb@nightclub@dancers@black_madonna_entourage@",anim ="hi_dance_facedj_09_v2_male^5"}},
				{label = "Hey man",type = "anim", data = {lib ="anim@amb@nightclub@dancers@club_ambientpeds@",anim ="mi-hi_amb_club_09_v1_male^1"}},
				{label = "Move 01",type = "anim", data = {lib ="anim@mp_player_intupperuncle_disco",anim ="idle_a"}},
				{label = "Move 02",type = "anim", data = {lib ="anim@mp_player_intuppersalsa_roll",anim ="idle_a"}},
				{label = "Move 03",type = "anim", data = {lib ="anim@mp_player_intupperraise_the_roof",anim ="idle_a"}},
				{label = "Move 04",type = "anim", data = {lib ="anim@mp_player_intupperoh_snap",anim ="idle_a"}},
				{label = "Move 05",type = "anim", data = {lib ="anim@mp_player_intupperheart_pumping",anim ="idle_a"}},
				{label = "Move 06",type = "anim", data = {lib ="anim@mp_player_intupperfind_the_fish",anim ="idle_a"}},
				{label = "Move 07",type = "anim", data = {lib ="anim@mp_player_intuppercats_cradle",anim ="idle_a"}},
				{label = "Move 08",type = "anim", data = {lib ="anim@mp_player_intupperbanging_tunes",anim ="idle_a"}},
				{label = "Move 09",type = "anim", data = {lib ="anim@mp_player_intupperbanging_tunes_right",anim ="idle_a"}},
				{label = "Move 10",type = "anim", data = {lib ="anim@mp_player_intupperbanging_tunes_left",anim ="idle_a"}},
				{label = "DJ",type = "anim", data = {lib ="anim@mp_player_intcelebrationmale@dj",anim ="dj"}},
				{label = "Fausse guitare",type = "anim", data = {lib ="anim@mp_player_intcelebrationmale@air_guitar",anim ="air_guitar"}},
				{label = "Mains Jazz",type = "anim", data = {lib ="anim@mp_player_intcelebrationfemale@jazz_hands",anim ="jazz_hands"}},
				{label = "Rock'n roll",type = "anim", data = {lib ="anim@mp_player_intcelebrationmale@rock",anim ="rock"}}
			}
        },
        {
        name = "insolentes", 
        label = "Insolentes",
			items = {
				{label = "MDR",type = "anim", data = {lib ="anim@arena@celeb@flat@solo@no_props@",anim ="giggle_a_player_a"}},
				{label = "Se curer le nez",type = "anim", data = {lib ="anim@mp_player_intcelebrationmale@nose_pick",anim ="nose_pick"}},
				{label = "Bouffe mon doigt",type = "anim", data = {lib ="anim@mp_player_intcelebrationmale@finger",anim ="finger"}},
				{label = "Prend mon fuck",type = "anim", data = {lib ="random@shop_gunstore",anim ="_negative_goodbye"}},
				{label = "Nananère",type = "anim", data = {lib ="anim@mp_player_intcelebrationmale@thumb_on_ears",anim ="thumb_on_ears"}},
				{label = "DTC",type = "anim", data = {lib ="anim@mp_player_intcelebrationmale@dock",anim ="dock"}},
				{label = "Chuuuuute",type = "anim", data = {lib ="anim@mp_player_intcelebrationmale@shush",anim ="shush"}},
				{label = "Poule Mouillé",type = "anim", data = {lib ="anim@mp_player_intcelebrationmale@chicken_taunt",anim ="chicken_taunt"}},
                {label = "Doigt solo", type = "anim", data = {lib ="anim@mp_player_intselfiethe_bird",anim ="enter"}},
                {label = "Doigt 2", type = "anim", data = {lib ="anim@mp_player_intselfiethe_bird",anim ="idle_a"}},
                {label = "Doigt 3", type = "anim", data = {lib ="anim@mp_player_intselfiethe_bird",anim ="exit"}},                
				{label = "Doigt d'honneur",type = "anim", data = {lib ="mp_player_int_upperfinger",anim ="mp_player_int_finger_01"}},
				{label = "Uriner",type = "anim", data = {lib ="misscarsteal2peeing",anim ="peeing_intro"}},
				{label = "Se gratter le cul",type = "anim", data = {lib ="mp_player_int_upperarse_pick",anim ="mp_player_int_arse_pick"}},
				{label = "Se gratter les couilles",type = "anim", data = {lib ="mp_player_int_uppergrab_crotch",anim ="mp_player_int_grab_crotch"}},
				{label = "Pluie de fric",type = "anim", data = {lib ="anim@arena@celeb@flat@solo@props@",anim ="make_it_rain_b_player_b"}},
				{label = "Pluie de fric 2",type = "anim", data = {lib ="anim@mp_player_intcelebrationmale@raining_cash",anim ="raining_cash"}}
			}
        },
        {
        name = "sex",
        label = "LE SEXXXX",
			items = { 
				{label = "Fellation",type = "anim", data = {lib ="misscarsteal2pimpsex",anim ="pimpsex_hooker"}},
				{label = "Se faire sucer 01",type = "anim", data = {lib ="misscarsteal2pimpsex",anim ="pimpsex_pimp"}},
				{label = "Se faire sucer 02",type = "anim", data = {lib ="misscarsteal2pimpsex",anim ="pimpsex_punter"}},
				{label = "Danse sexy",type = "anim", data = {lib ="mp_safehouse",anim ="lap_dance_girl"}},
				{label = "Danse Twerk",type = "anim", data = {lib ="mini@strip_club@private_dance@part3",anim ="priv_dance_p3"}},
				{label = "Montrer sa poitrine",type = "anim", data = {lib ="mini@strip_club@backroom@",anim ="stripper_b_backroom_idle_b"}},
				{label = "Montrer ses fesses",type = "anim", data = {lib ="switch@trevor@mocks_lapdance",anim ="001443_01_trvs_28_idle_stripper"}},
				{label = "Se faire su*** en voiture",type = "anim", data = {lib ="oddjobs@towing",anim ="m_blow_job_loop"}},
				{label = "Faire une gaterie en voiture",type = "anim", data = {lib ="oddjobs@towing",anim ="f_blow_job_loop"}},
				{label = "***** en voiture",type = "anim", data = {lib ="mini@prostitutes@sexlow_veh",anim ="low_car_sex_loop_player"}},
				{label = "Se ***** en voiture",type = "anim", data = {lib ="mini@prostitutes@sexlow_veh",anim ="low_car_sex_loop_female"}},
				{label = "Mon coeur",type = "anim", data = {lib ="mini@hookers_spvanilla",anim ="idle_a"}}
			}
        },
        {
        name = "danses",
        label = "Danses",
			items = {
				{label = "Danse",type = "anim", data = {lib ="misschinese2_crystalmazemcs1_cs",anim ="dance_loop_tao"}},
				{label = "Danse stylé",type = "anim", data = {lib ="missfbi3_sniping",anim ="dance_m_default"}},
				{label = "Danse banale",type = "anim", data = {lib ="rcmnigel1bnmt_1b",anim ="dance_loop_tyler"}},
				{label = "Danse spéciale 01",type = "anim", data = {lib ="timetable@tracy@ig_5@idle_a",anim ="idle_a"}},
				{label = "Danse spéciale 02",type = "anim", data = {lib ="timetable@tracy@ig_5@idle_a",anim ="idle_b"}},
				{label = "Danse spéciale 03",type = "anim", data = {lib ="timetable@tracy@ig_5@idle_b",anim ="idle_e"}},
				{label = "Danse spéciale 04",type = "anim", data = {lib ="timetable@tracy@ig_5@idle_b",anim ="idle_d"}},
				{label = "Danse de teubé ",type = "anim", data = {lib ="special_ped@mountain_dancer@monologue_3@monologue_3a",anim ="mnt_dnc_buttwag"}},
				{label = "Danse basique",type = "anim", data = {lib ="anim@amb@nightclub@lazlow@hi_podium@",anim ="danceidle_hi_06_base_laz"}},
				{label = "Danse turnaround",type = "anim", data = {lib ="anim@amb@nightclub@lazlow@hi_podium@",anim ="danceidle_hi_11_turnaround_laz"}},
				{label = "Danse crotchgrab",type = "anim", data = {lib ="anim@amb@nightclub@lazlow@hi_podium@",anim ="danceidle_hi_13_crotchgrab_laz"}},
				{label = "Danse flying",type = "anim", data = {lib ="anim@amb@nightclub@lazlow@hi_podium@",anim ="danceidle_hi_13_flyingv_laz"}},
				{label = "Danse robot",type = "anim", data = {lib ="anim@amb@nightclub@lazlow@hi_podium@",anim ="danceidle_mi_15_robot_laz"}},
				{label = "Danse shimmy",type = "anim", data = {lib ="anim@amb@nightclub@lazlow@hi_podium@",anim ="danceidle_mi_15_shimmy_laz"}},
				{label = "Danse crazyrobot",type = "anim", data = {lib ="anim@amb@nightclub@lazlow@hi_podium@",anim ="danceidle_hi_15_crazyrobot_laz"}},
				{label = "Danse smack",type = "anim", data = {lib ="anim@amb@nightclub@lazlow@hi_podium@",anim ="danceidle_hi_17_smackthat_laz"}},
				{label = "Danse spider",type = "anim", data = {lib ="anim@amb@nightclub@lazlow@hi_podium@",anim ="danceidle_hi_17_spiderman_laz"}},
				{label = "Danse hipswivel",type = "anim", data = {lib ="anim@amb@nightclub@lazlow@hi_podium@",anim ="danceidle_li_13_hipswivel_laz"}},
				{label = "Danse Grind",type = "anim", data = {lib ="anim@amb@nightclub@lazlow@hi_podium@",anim ="danceidle_li_15_sexygrind_laz"}},
				{label = "Danse point",type = "anim", data = {lib ="anim@amb@nightclub@lazlow@hi_podium@",anim ="danceidle_mi_11_pointthrust_laz"}},
				{label = "Danse miturn",type = "anim", data = {lib ="anim@amb@nightclub@lazlow@hi_podium@",anim ="danceidle_mi_13_turnaround_laz"}},
				{label = "Danse du ventre",type = "anim", data = {lib ="mini@strip_club@private_dance@idle",anim ="priv_dance_idle"}},
				{label = "Salsa",type = "anim", data = {lib ="anim@mp_player_intcelebrationmale@salsa_roll",anim ="salsa_roll"}},
				{label = "Danse de soirée 1",type = "anim", data = {lib ="anim@amb@nightclub@dancers@crowddance_facedj@",anim ="hi_dance_facedj_09_v1_male^4"}},
				{label = "Danse de soirée 2",type = "anim", data = {lib ="anim@amb@nightclub@dancers@crowddance_facedj@",anim ="hi_dance_facedj_09_v2_female^1"}},
				{label = "Danse de soirée 3",type = "anim", data = {lib ="anim@amb@nightclub@dancers@crowddance_facedj@",anim ="hi_dance_facedj_09_v2_female^2"}},
				{label = "Danse de soirée 4",type = "anim", data = {lib ="anim@amb@nightclub@dancers@crowddance_facedj@",anim ="hi_dance_facedj_09_v2_male^2"}},
				{label = "Danse de soirée 5",type = "anim", data = {lib ="anim@amb@nightclub@dancers@crowddance_facedj@",anim ="hi_dance_facedj_11_v2_male^2"}},
				{label = "Danse de soirée 6",type = "anim", data = {lib ="anim@amb@nightclub@dancers@crowddance_groups@",anim ="hi_dance_crowd_09_v1_female^1"}},
				{label = "Danse de soirée 7",type = "anim", data = {lib ="anim@amb@nightclub@dancers@crowddance_groups@",anim ="hi_dance_crowd_09_v1_female^3"}},
				{label = "Danse de soirée 8",type = "anim", data = {lib ="anim@amb@nightclub@djs@black_madonna@",anim ="dance_b_idle_a_blamadon"}},
				{label = "Danse de soirée 9",type = "anim", data = {lib ="anim@amb@nightclub@mini@dance@dance_solo@female@var_a@",anim ="high_center"}},
				{label = "Danse de soirée 10",type = "anim", data = {lib ="anim@amb@nightclub@mini@dance@dance_solo@female@var_a@",anim ="med_center"}},
				{label = "Danse de soirée 11",type = "anim", data = {lib ="anim@amb@nightclub@mini@dance@dance_solo@female@var_b@",anim ="high_center_up"}},
				{label = "Disco",type = "anim", data = {lib ="anim@mp_player_intcelebrationmale@uncle_disco",anim ="uncle_disco"}}
			}
        },
        {
        name = "armes",
        label = "Armes",
			items = {
				{label = "Animation execution",type = "anim", data = {lib ="oddjobs@suicide",anim ="bystander_pointinto"}},
				{label = "Animation suicide",type = "anim", data = {lib ="mp_suicide",anim ="pistol"}},
				{label = "Check arme",type = "anim", data = {lib ="mp_corona@single_team",anim ="single_team_intro_one"}},
				{label = "Arme pointé",type = "anim", data = {lib ="random@arrests",anim ="cop_gunaimed_door_open_idle"}},
				{label = "Melée 1",type = "anim", data = {lib ="anim@deathmatch_intros@melee@2h",anim ="intro_male_melee_2h_b"}},
				{label = "Melée 2",type = "anim", data = {lib ="anim@deathmatch_intros@melee@1h",anim ="intro_male_melee_1h_b"}},
				{label = "Melée 3",type = "anim", data = {lib ="anim@deathmatch_intros@melee@1h",anim ="intro_male_melee_1h_c"}},
				{label = "Melée 4",type = "anim", data = {lib ="mp_deathmatch_intros@melee@2h",anim ="intro_male_melee_2h_d"}},
				{label = "Melée 5",type = "anim", data = {lib ="mp_deathmatch_intros@melee@2h",anim ="intro_male_melee_2h_a_gclub"}},
				{label = "Melée 6",type = "anim", data = {lib ="mp_deathmatch_intros@melee@1h",anim ="intro_male_melee_1h_b"}},
				{label = "Fight 1",type = "anim", data = {lib ="anim@deathmatch_intros@unarmed",anim ="intro_male_unarmed_e"}},
				{label = "Fight 2",type = "anim", data = {lib ="anim@deathmatch_intros@unarmed",anim ="intro_male_unarmed_d"}},
				{label = "Fight 3",type = "anim", data = {lib ="anim@deathmatch_intros@unarmed",anim ="intro_male_unarmed_b"}}
			}
        },	
}

CreateThread(function()

	for i = 1, #Animations, 1 do
		--print(Animations[i].name)
		RMenu.Add('animation', Animations[i].name, RageUI.CreateSubMenu(RMenu:Get('personnal', 'animation'), Animations[i].label, "Animations " .. Animations[i].label))
	end
end)

local function startAnim(lib, anim)
	RequestAnimDict(lib)
	while not HasAnimDictLoaded(lib) do
		Wait(100)
	end
    TaskPlayAnim(PlayerPedId(), lib, anim, 8.0, -8.0, -1, 1, 0, false, false, false)
    RemoveAnimDict(lib)
end


function RenderAnimationsSubMenu(menu)
    for i = 1, #Animations, 1 do
        if Animations[i].name == menu then
            for j = 1, #Animations[i].items, 1 do
                RageUI.Button(Animations[i].items[j].label, nil, {}, true, function(_, _, Selected)
					if Selected then
						print(Animations[i].items[j].data.lib)
						print("sex")
						print(Animations[i].items[j].data.anim)
                        if Animations[i].items[j].type == 'anim' then
                            startAnim(Animations[i].items[j].data.lib, Animations[i].items[j].data.anim)
                        elseif Animations[i].items[j].type == 'scenario' then
                            TaskStartScenarioInPlace(PlayerPedId(), Animations[i].items[j].data.anim, 0, false)
                        --elseif Animations[i].items[j].type == 'attitude' then
                         --   startAttitude(Animations[i].items[j].data.anim)
                        elseif Animations[i].items[j].type == 'armeanim' then
                            if IsPedArmed(PlayerPedId(), 7) then
                                SetWeaponAnimationOverride(PlayerPedId(), GetHashKey(Animations[i].items[j].goose))
                            end
                        end
                    end
                end)
            end
        end
    end
end


CreateThread(function()
	while true do
        Wait(1)
        RageUI.IsVisible(RMenu:Get('personnal', 'main'), true, true, true, function()
            RageUI.Button("Actions", "DESC", { RightLabel = ">" }, true, function(_,_,Selected)
            end, RMenu:Get('personnal', 'actions'))
            RageUI.Button("Paramètres", "DESC", { RightLabel = ">" }, true, function(_,_,Selected)
            end, RMenu:Get('personnal', 'settings'))
            RageUI.Button("Autre", "DESC", { RightLabel = ">" }, true, function(_,_,Selected)
			end, RMenu:Get('personnal', 'others'))
			RageUI.Button("Animations", "DESC", { RightLabel = ">" }, true, function(_,_,Selected)
			end, RMenu:Get('personnal', 'animation'))
			RageUI.Button("Report", "DESC", { RightLabel = ">" }, true, function(_,_,Selected)
            end, RMenu:Get('personnal', 'report'))
		end)
		RageUI.IsVisible(RMenu:Get('personnal', 'animation'), true, true, true, function()
			for i = 1, #Animations, 1 do
				RageUI.Button(Animations[i].label, "DESC", { RightLabel = ">" }, true, function(_,_,Selected)
				end, RMenu:Get('animation', Animations[i].name))
			end
		end)
		for i = 1, #Animations, 1 do
			--print(Animations[i].name)
			RageUI.IsVisible(RMenu:Get('animation', Animations[i].name), true, true, true, function()
				RenderAnimationsSubMenu(Animations[i].name)
			end)
			--if RageUI.Visible(RMenu.Get('animation', Animations[i].name)) then
				--RenderAnimationsSubMenu(Animations[i].name)
			--end
		end
        RageUI.IsVisible(RMenu:Get('personnal', 'settings'), true, true, true, function()
            --RageUI.Button("Affichage des pompes à essences", "DESC", { RightLabel = ">" }, true, function(_,_,Selected)
            --end)
            --RageUI.SliderProgress("tt", 1, 3, 'cc', {}, true, function()
            
            --end)

            RageUI.Slider('Portance de la voix', VoiceDist.DistIndex, 3, 'DESC', false, {}, true, function(Hovered, Active, Selected, ProgressStart)
                if VoiceDist.DistIndex ~= ProgressStart then
                    VoiceDist.DistIndex = ProgressStart
                    NetworkSetTalkerProximity(VoiceDist.Dist[VoiceDist.DistIndex])
                    AdvancedNotif('Paramètres', '~r~Portance de la voix', 'La portance de votre voix a été réglé sur ' .. VoiceDist.Dist[VoiceDist.DistIndex] .. ' mètres.', 'CHAR_WE', 'INITIALV')
                end
            end)
		end)
		RageUI.IsVisible(RMenu:Get('personnal', 'report'), true, true, true, function()
			RageUI.Button("Envoyer un report", "DESC", { RightLabel = ">" }, true, function(_,_,Selected)
                if Selected then
                    AdvancedNotif('Initial V', '~r~Report', 'Envoyez un message au bot Support sur le discord, le staff prendra votre demande.', 'CHAR_WE', 'ADMIN')
                end
            end)

		end)
        RageUI.IsVisible(RMenu:Get('personnal', 'actions'), true, true, true, function()
            RageUI.Button("Appeler la police", "DESC", { RightLabel = ">" }, true, function(_,_,Selected)
                if Selected then
                    local Reason = KeyboardInput("", 600)
                    TriggerServerEvent('InitialCore:NotifPolice', 'LSPD', 'Appel', '([E] pour accepter) Appel d\'un citoyen pour la raison : ' .. Reason .. '.', true, GetPlayerServerId(PlayerId()), GetEntityCoords(GetPlayerPed(-1)))
                    AdvancedNotif('Actions', '~r~Appels', 'Votre message à bien été transmis.', 'CHAR_WE', 'INITIALV')
                end
            end)
            RageUI.Button("Appeler les urgence médical", "DESC", { RightLabel = ">" }, true, function(_,_,Selected)
                if Selected then
                    local Reason = KeyboardInput("", 600)
                    TriggerServerEvent('InitialCore:AlertEMS', 'LSMC', 'Urgence', 'Appel d\'urgence, appuyez sur [E] pour accepter.', true, GetPlayerServerId(PlayerId()), GetEntityCoords(GetPlayerPed(-1)))
                    AdvancedNotif('Actions', '~r~Appels', 'Votre message à bien été transmis.', 'CHAR_WE', 'INITIALV')
                end
            end)
        end)
        RageUI.IsVisible(RMenu:Get('personnal', 'others'), true, true, true, function()
            RageUI.Button("Boost FPS", "DESC", { RightLabel = ">" }, true, function(_,_,Selected)
                if Selected then
                    ClearAllBrokenGlass()
                    ClearAllHelpMessages()
                    LeaderboardsReadClearAll()
                    ClearBrief()
                    ClearGpsFlags()
                    ClearOverrideWeather()
                    ClearPrints()
                    ClearSmallPrints()
                    ClearDynamicPauseMenuErrorMessage()
                    LeaderboardsClearCacheData()
                    ClearFocus()
                    ClearHdArea()
                end
            end)
            RageUI.Button("Debug personnage", "Permet de débug son personnage si buggé (reload du skin, reload du métier, téléportation sur la route la plus proche).", { RightLabel = ">" }, true, function(_,_,Selected)
                if Selected then
                    TriggerEvent('InitialCore:RefreshPersoHard')
                    local pos = GetEntityCoords(PlayerPedId())
                    local BoolVar, CoordsVar, CoordsVar2 = GetClosestRoad(pos.x, pos.y, pos.z, 1.0, 1, false)
                    if BoolVar then
                        SetEntityCoords(GetPlayerPed(-1), CoordsVar)
                    end
                    TriggerServerEvent('InitialCore:LoadPlayer')
                end
            end)
        end)
	end
end)