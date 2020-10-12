------------------------------------------------------------------------------
--
-- Ce travail est sous liscence:
-- Creative Commons Attribution-NonCommercial-NoDerivatives-NoDistribution 4.0 International License.
--
------------------------------------------------------------------------------

local scaleform = {}
local text = {}
local signmodel = GetHashKey("prop_police_id_board")
local textmodel = GetHashKey("prop_police_id_text")

local Prenom = nil
local Nom = nil
local JourDeNaissance = 1
local MoisDeNaissance = 'Janvier'
local AnneeDeNaissance = 1920
local Taille = 130
local Poids = 40

SelectedSexe = 1
IsPed = false
PedUsed = nil
local Variation1 = 0
local Variation2 = 0
local Variation3 = 0
local Variation4 = 0
local Variation4C = 0
local Variation5 = 0
local Variation5C = 0
local Variation6 = 0
local Variation6C = 0
local Variation7 = 0
local Variation7C = 0
local Variation9 = 0
local Variation10 = 0
local Variation11 = 0
local Variation12 = 0
local Variation12C = 0

SelectedMere = 4
SelectedPere = 4
SkinMix = 0.0
ShapeMix = 0.8
 FrontHeight = 0.0
 FrontWidth = 0.0
 Eyes = 0.0
 NozWidth = 0.0
 NozHeight = 0.0
 AreteNozWidth = 0.0
 AreteNozHeight = 0.0
 BoutNozHauteur = 0.0
 BoutNozCasse = 0.0
 PommettesHeight = 0.0
 PommettesWidth = 0.0
 LevresWidth = 0.0
 MachoireHeight = 0.0
 MachoireWidth = 0.0
 MentonHeight = 0.0
 MentonPosition = 0.0
 MentonShape = 0.0
 MentonWidth = 0.0
 CheveuxStyle = 0
 CheveuxCouleur = 0
 CheveuxCouleurSecondaire = 0
 SourcilsStyle = -1
 SourcilsOpacite = 1.0
 SourcilsCouleur = 0
 SourcilsCouleurSecondaire = 0
 PilositeStyle = -1
 PilositeOpacite = 1.0
 PilositeCouleur = 0
 PilositeCouleurSecondaire = 0
 ProblemePeauStyle = -1
 ProblemePeauOpacite = 1.0
 VieillissementStyle = -1
 VieillissementOpacite = 1.0
 TeintStyle = -1
 TeintOpacite = 1.0
 TachesCutaneesStyle = -1
 TachesCutaneesOpacite = 1.0
 AspectPeauStyle = -1
 AspectPeauOpacite = 1.0
 CouleurYeux = -1
 MaquillageYeuxStyle = -1
 MaquillageYeuxOpacite = 1.0
 MaquillageYeuxCouleur = 0
 MaquillageYeuxCouleurSecondaire = 0
 RougeALevresStyle = -1
 RougeALevresOpacite = 1.0
 RougeALevresCouleur = 0
 RougeALevresCouleurSecondaire = 0

 -- ############

TriggerEvent('instance:registerType', 'creationperso')
RegisterNetEvent('instance:onCreate')
AddEventHandler('instance:onCreate', function(instance)
    if instance.type == 'creationperso' then
        TriggerEvent('instance:enter', instance)
    end
end)

local PlayerRotation = 90.0
local Enabled = true
local CreationEnCours = false
local FaceCam = false
local BlockKey = false
RMenu.Add('creator', 'main', RageUI.CreateMenu("Personnage", "~b~NOUVEAUX PERSONNAGE"))
RMenu:Get('creator', 'main').Closable = false
local SexeList = { "Homme", "Femme" }
local IsPedList = { "Crée", "Prédéfini" }
local PedList
local LastPedRender
RMenu.Add('creator', 'pedlist', RageUI.CreateSubMenu(RMenu:Get('creator', 'main'), "Personnage", "~b~SÉLECTION"))
RMenu.Add('creator', 'variation', RageUI.CreateSubMenu(RMenu:Get('creator', 'main'), "Personnage", "~b~VARIATION"))
RMenu.Add('creator', 'identite', RageUI.CreateSubMenu(RMenu:Get('creator', 'main'), "Personnage", "~b~IDENTITÉ"))
RMenu.Add('creator', 'datedenaissance', RageUI.CreateSubMenu(RMenu:Get('creator', 'identite'), "Personnage", "~b~DATE DE NAISSANCE"))
local dateentered = false
local ListJours = {}
local ListMois = {"Janvier", "Février ", "Mars", "Avril", "Mai", "Juin", "Juillet", "Août ", "Septembre", "Octobre", "Novembre", "Decembre"}
local ListAnnee = {}
local ListTaille = {}
Citizen.CreateThread(function()
    for i = 1, 31 do
        table.insert(ListJours, i)
    end
    for i = 1920, 2005 do
        table.insert(ListAnnee, i)
    end
    for i = 140, 220 do
        table.insert(ListTaille, i)
    end
end)
RMenu.Add('creator', 'heritage', RageUI.CreateSubMenu(RMenu:Get('creator', 'main'), "Personnage", "~b~HÉRITAGE"))
local MereList = { "Adelyn", "Emily", "Abigail", "Beverly", "Kristen", "Hailey", "June", "Daisy", "Elizabeth", "Addison", "Ava", "Cameron", "Samantha", "Madison", "Amber", "Heather", "Hillary", "Courtney", "Ashley", "Alyssa", "Mia", "Brittany" }
local PereList = { "Benjamin", "Daniel", "Joshua", "Noah", "Andrew", "Juan", "Alex", "Isaac", "Evan", "Ethan", "Vincent", "Angel", "Diego", "Adrian", "Gabriel", "Michael", "Santiago", "Kevin", "Louis", "Samuel", "Anthony", "Pierre", "Niko" }
RMenu.Add('creator', 'traitsduvisage', RageUI.CreateSubMenu(RMenu:Get('creator', 'main'), "Personnage", "~b~TRAITS DU VISAGE"))
RMenu:Get('creator', 'traitsduvisage').EnableMouse = true
local TraitsDuVisageList = {
    [1] = {
        [1] = {
            List = { "Standard", "Protubérant", "Plat", "-" },
            Index = 4,
        },
        [2] = {
            List = { "Standard", "Ouverts", "Plissés", "-" },
            Index = 4,
        },
        [3] = {
            List = { "Standard", "Large", "Petit", "-" },
            Index = 4,
        },
        [4] = {
            List = { "Standard", "Saillante", "Incurvée", "-" },
            Index = 4,
        },
        [5] = {
            List = { "Standard", "Cassé", "Vers le haut", "-" },
            Index = 4,
        },
        [6] = {
            List = { "Standard", "Larges", "Fines", "-" },
            Index = 4,
        },
        [7] = {
            List = { "Standard", "Grosses", "Minces", "-" },
            Index = 4,
        },
        [8] = {
            List = { "Standard", "Épaisses", "Minces", "-" },
            Index = 4,
        },
        [9] = {
            List = { "Standard", "Carrée", "Ronde", "-" },
            Index = 4,
        },
        [10] = {
            List = { "Standard", "Large", "Petit", "-" },
            Index = 4,
        },
        [11] = {
            List = { "Standard", "Pointu", "Rond", "-" },
            Index = 4,
        },
    },
    [2] = {
        [1] = {
            List = { "Standard", "Protubérant", "Plat", "-" },
            Index = 4,
        },
        [2] = {
            List = { "Standard", "Ouverts", "Plissés", "-" },
            Index = 4,
        },
        [3] = {
            List = { "Standard", "Large", "Petit", "-" },
            Index = 4,
        },
        [4] = {
            List = { "Standard", "Saillante", "Incurvée", "-" },
            Index = 4,
        },
        [5] = {
            List = { "Standard", "Cassé", "Vers le haut", "-" },
            Index = 4,
        },
        [6] = {
            List = { "Standard", "Larges", "Fines", "-" },
            Index = 4,
        },
        [7] = {
            List = { "Standard", "Grosses", "Minces", "-" },
            Index = 4,
        },
        [8] = {
            List = { "Standard", "Épaisses", "Minces", "-" },
            Index = 4,
        },
        [9] = {
            List = { "Standard", "Carrée", "Ronde", "-" },
            Index = 4,
        },
        [10] = {
            List = { "Standard", "Large", "Petit", "-" },
            Index = 4,
        },
        [11] = {
            List = { "Standard", "Pointu", "Rond", "-" },
            Index = 4,
        },
    }
}
function ResetTraitsDuVisageList()
    FrontHeightIndex = 0.5
    FrontWidthIndex = 0.5
    EyesIndex = 0.5
    NozWidthIndex = 0.5
    NozHeightIndex = 0.5
    AreteNozHeightIndex = 0.5
    AreteNozWidthIndex = 0.5
    BoutNozHauteurIndex = 0.5
    BoutNozCasseIndex = 0.5
    PommettesWidthIndex = 0.5
    PommettesHeightIndex = 0.5
    JouesWidthItem = 0.5
    LevresWidthIndex = 0.5
    MachoireWidthItem = 0.5
    MachoireHeightItem = 0.5
    MentonPositionIndex = 0.5
    MentonHeightIndex = 0.5
    MentonShapeIndex = 0.5
    MentonWidthIndex = 0.5

    CheveuxStyleIndex = 1
    SourcilsStyleIndex = 1
    PilositeStyleIndex = 1
    ProblemePeauStyleIndex = 1
    VieillissementStyleIndex = 1
    TeintStyleIndex = 1
    TachesCutaneesStyleIndex = 1
    AspectPeauStyleIndex = 1
    CouleurYeuxIndex = 1
    MaquillageYeuxStyleIndex = 1
    RougeALevresStyleIndex = 1
    CheveuxCouleurIndex = 1
    CheveuxCouleurSecondaireIndex = 1
    SourcilsCouleurIndex = 1
    SourcilsCouleurSecondaireIndex = 1
    PilositeCouleurIndex = 1
    PilositeCouleurSecondaireIndex = 1
    MaquillageYeuxCouleurIndex = 1
    MaquillageYeuxCouleurSecondaireIndex = 1
    RougeALevresCouleurIndex = 1
    RougeALevresCouleurSecondaireIndex = 1
    TraitsDuVisageList = {
        [1] = {
            [1] = {
                List = { "Standard", "Protubérant", "Plat", "-" },
                Index = 4,
            },
            [2] = {
                List = { "Standard", "Ouverts", "Plissés", "-" },
                Index = 4,
            },
            [3] = {
                List = { "Standard", "Large", "Petit", "-" },
                Index = 4,
            },
            [4] = {
                List = { "Standard", "Saillante", "Incurvée", "-" },
                Index = 4,
            },
            [5] = {
                List = { "Standard", "Cassé", "Vers le haut", "-" },
                Index = 4,
            },
            [6] = {
                List = { "Standard", "Larges", "Fines", "-" },
                Index = 4,
            },
            [7] = {
                List = { "Standard", "Grosses", "Minces", "-" },
                Index = 4,
            },
            [8] = {
                List = { "Standard", "Épaisses", "Minces", "-" },
                Index = 4,
            },
            [9] = {
                List = { "Standard", "Carrée", "Ronde", "-" },
                Index = 4,
            },
            [10] = {
                List = { "Standard", "Large", "Petit", "-" },
                Index = 4,
            },
            [11] = {
                List = { "Standard", "Pointu", "Rond", "-" },
                Index = 4,
            },
        },
        [2] = {
            [1] = {
                List = { "Standard", "Protubérant", "Plat", "-" },
                Index = 4,
            },
            [2] = {
                List = { "Standard", "Ouverts", "Plissés", "-" },
                Index = 4,
            },
            [3] = {
                List = { "Standard", "Large", "Petit", "-" },
                Index = 4,
            },
            [4] = {
                List = { "Standard", "Saillante", "Incurvée", "-" },
                Index = 4,
            },
            [5] = {
                List = { "Standard", "Cassé", "Vers le haut", "-" },
                Index = 4,
            },
            [6] = {
                List = { "Standard", "Larges", "Fines", "-" },
                Index = 4,
            },
            [7] = {
                List = { "Standard", "Grosses", "Minces", "-" },
                Index = 4,
            },
            [8] = {
                List = { "Standard", "Épaisses", "Minces", "-" },
                Index = 4,
            },
            [9] = {
                List = { "Standard", "Carrée", "Ronde", "-" },
                Index = 4,
            },
            [10] = {
                List = { "Standard", "Large", "Petit", "-" },
                Index = 4,
            },
            [11] = {
                List = { "Standard", "Pointu", "Rond", "-" },
                Index = 4,
            },
        }
    }

end
local self = {
    FACE_F_BROW = false,
    FACE_F_EYES = false,
    FACE_F_NOSE = false,
    FACE_F_NOSEP = false,
    FACE_F_NOSET = false,
    FACE_F_CHEEK = false,
    FACE_F_CHEEKS = false,
    FACE_F_LIPS = false,
    FACE_F_JAW = false,
    FACE_F_CHIN = false,
    FACE_F_CHINS = false,
}
-- APPARENCE
RMenu.Add('creator', 'apparence', RageUI.CreateSubMenu(RMenu:Get('creator', 'main'), "Personnage", "~b~APPARENCE"))
RMenu:Get('creator', 'apparence').EnableMouse = true
local rideList = { "-" }
for i = 2, 16, 1 do
    rideList[i] = GetLabelText("CC_SKINAGE_" .. i - 2)
end
local tachList = { "-" }
for i = 2, 25, 1 do
    tachList[i] = GetLabelText("CC_SKINBLEM_" .. i - 2)
end
local eyesList = {  }
for i = 1, 33, 1 do
    eyesList[i] = GetLabelText("FACE_E_C_" .. i - 2)
end
local BarbeName = { }
for i = 1, 29, 1 do
    BarbeName[i] = GetLabelText("CC_BEARD_" .. i - 2)
end
local CheveuxNameM = { }
for i = 1, 23, 1 do
    CheveuxNameM[i] = GetLabelText("CC_M_HS_" .. i - 1)
end
CheveuxNameM[24] = "--"
CheveuxNameM[25] = GetLabelText("CLO_S1M_H_0_0")
CheveuxNameM[26] = GetLabelText("CLO_S1M_H_1_0")
CheveuxNameM[27] = GetLabelText("CLO_S1M_H_2_0")
CheveuxNameM[28] = GetLabelText("CLO_S1M_H_3_0")
CheveuxNameM[29] = GetLabelText("CLO_S2M_H_0_0")
CheveuxNameM[30] = GetLabelText("CLO_S2M_H_1_0")
CheveuxNameM[31] = GetLabelText("CLO_S2M_H_2_0")
CheveuxNameM[32] = GetLabelText("CLO_BIM_H_0_0")
CheveuxNameM[33] = GetLabelText("CLO_BIM_H_1_0")
CheveuxNameM[34] = GetLabelText("CLO_BIM_H_2_0")
CheveuxNameM[35] = GetLabelText("CLO_BIM_H_3_0")
CheveuxNameM[36] = GetLabelText("CLO_BIM_H_4_0")
CheveuxNameM[37] = GetLabelText("CLO_BIM_H_5_0")


-- ## ADD ON CHEVEUX

CheveuxNameM[75] = "Lissés"
CheveuxNameM[76] = "Arouf"
CheveuxNameM[77] = "Afro Boom"
CheveuxNameM[78] = "Beauf"
CheveuxNameM[79] = "Classe"
CheveuxNameM[80] = "Latino"
CheveuxNameM[81] = "Pas Coiffé"
CheveuxNameM[82] = "Wakanda"
CheveuxNameM[83] = "Hippie"
CheveuxNameM[84] = "Racine"
CheveuxNameM[85] = "Fondu"
CheveuxNameM[86] = "Hrach"
CheveuxNameM[87] = "Waves"
CheveuxNameM[88] = "En Pique"
CheveuxNameM[89] = "Plaqué"
CheveuxNameM[90] = "Dread Attaché"
CheveuxNameM[91] = "Pétard"
CheveuxNameM[92] = "Dreadlocks"

local CheveuxNameF = { }
for i = 1, 16, 1 do
    CheveuxNameF[i] = GetLabelText("CC_F_HS_" .. i - 1)
end
CheveuxNameF[17] = GetLabelText("CC_F_HS_16")
CheveuxNameF[18] = GetLabelText("CC_F_HS_17")
CheveuxNameF[19] = GetLabelText("CC_F_HS_23")-- ## A CHANGER
CheveuxNameF[20] = GetLabelText("CC_F_HS_18")
CheveuxNameF[21] = GetLabelText("CC_F_HS_19")
CheveuxNameF[22] = GetLabelText("CC_F_HS_20")
CheveuxNameF[23] = GetLabelText("CC_F_HS_21")
CheveuxNameF[24] = GetLabelText("CC_F_HS_22")
CheveuxNameF[25] = "--"
CheveuxNameF[26] = GetLabelText("CLO_S1F_H_0_0")
CheveuxNameF[27] = GetLabelText("CLO_S1F_H_1_0")
CheveuxNameF[28] = GetLabelText("CLO_S1F_H_2_0")
CheveuxNameF[29] = GetLabelText("CLO_S1F_H_3_0")
CheveuxNameF[30] = GetLabelText("CLO_S2F_H_0_0")
CheveuxNameF[31] = GetLabelText("CLO_S2F_H_1_0")
CheveuxNameF[32] = GetLabelText("CLO_S2F_H_2_0")
CheveuxNameF[33] = GetLabelText("CLO_BIF_H_0_0")
CheveuxNameF[34] = GetLabelText("CLO_BIF_H_1_0")
CheveuxNameF[35] = GetLabelText("CLO_BIF_H_2_0")
CheveuxNameF[36] = GetLabelText("CLO_BIF_H_3_0")
CheveuxNameF[37] = GetLabelText("CLO_BIF_H_4_0")
CheveuxNameF[38] = GetLabelText("CLO_BIF_H_5_0")
CheveuxNameF[39] = GetLabelText("CLO_BIF_H_6_0")

local SourcilsName = { "-" }
for i = 2, 35, 1 do
    SourcilsName[i] = GetLabelText("CC_EYEBRW_" .. i-2)
end

local TeintList = { "-" }
for i = 0, 11, 1 do
    table.insert(TeintList, GetLabelText("CC_SKINCOM_" .. i))
end
local MoleList = { "-" }
for i = 0, 17, 1 do
    table.insert(MoleList, GetLabelText("CC_MOLEFRECK_" .. i))
end
local ComplexList = { "-" }
for i = 1, 10, 1 do
    table.insert(ComplexList, GetLabelText("CC_SUND_" .. i))
end
local MaquillageList = { "-" }
for i = 1, 71, 1 do
    table.insert(MaquillageList, GetLabelText("CC_MKUP_" .. i-1))
end
local LipsList = { "-" }
for i = 1, 10, 1 do
    table.insert(LipsList, GetLabelText("CC_LIPSTICK_" .. i-1))
end
local colorsPanel = {
    haircut = {
        [1] = 1,
        [2] = 1,
    },
    eyebrow = {
        [1] = 1,
        [2] = 1,
    },
    barber = {
        [1] = 1,
        [2] = 1,
    },
    lipstick = {
        [1] = 1,
        [2] = 1,
    },
    makeup = {
        [1] = 1,
        [2] = 1,
    }
}
local self2 = {
    FACE_HAIR = false,
    FACE_EYEBROW = false,
    FACE_BEARD = false,
    FACE_SKINISSUES = false,
    FACE_OLDNESS = false,
    FACE_TINT = false,
}


local ListSpawn =  { "Los Santos", "Paleto Bay", "Sandy Shores" }
local SelectedSpawn = 1

local PaletoBay = {
    {x= -16.8544, y= 6494.642, z= 30.49},
    {x= 172.66, y= -176.666, z= 53.249},
}
local PaletoHeading = 45.68

local LosSantos = {
    {x= -1247.176, y= -728.55, z= 20.42},
    {x= 172.66, y= -176.666, z= 53.249},
}
local LosSantosHeading = 130.19

local SandyShores = {
    {x= 629.118, y= 2747.15, z= 40.83},
    {x= 1182.51, y= 2702.62, z= 37.167},
}
local SandyShoresHeading = 187.18

local function LoadFreemode(ismale)
    if ismale then
        pedid = GetHashKey("mp_m_freemode_01")
        RequestModel(pedid)
            while not HasModelLoaded(pedid) do 
                RequestModel(pedid)
                Citizen.Wait(0)
            end
        SetPlayerModel(PlayerId(), pedid)
    else
        pedid = GetHashKey("mp_f_freemode_01")
        RequestModel(pedid)
            while not HasModelLoaded(pedid) do 
                RequestModel(pedid)
                Citizen.Wait(0)
            end
        SetPlayerModel(PlayerId(), pedid)
    end

    SetPedDefaultComponentVariation(PlayerPedId())
    SetPedHeadBlendData(PlayerPedId(), SelectedMere, SelectedPere, nil, SelectedMere, SelectedPere, nil, ShapeMix, SkinMix, nil, true)
    SetModelAsNoLongerNeeded(pedid)
    ClearPedProp(PlayerPedId(), 0)
    if ismale then
        SetPedComponentVariation(GetPlayerPed(-1), 8, 15, 0, 2) -- Tshirt
        SetPedComponentVariation(GetPlayerPed(-1), 4, 21, 0, 2) -- pants
        SetPedComponentVariation(GetPlayerPed(-1), 6, 34, 0, 2) -- shoes
    else
        SetPedComponentVariation(GetPlayerPed(-1), 8, 2, 0, 2) -- Tshirt
        SetPedComponentVariation(GetPlayerPed(-1), 4, 15, 0, 2) -- pants
        SetPedComponentVariation(GetPlayerPed(-1), 6, 35, 0, 2) -- shoes
    end
    SetPedComponentVariation(GetPlayerPed(-1), 11, 15, 0, 2) -- torso parts
    SetPedComponentVariation(GetPlayerPed(-1), 3, 15, 0, 2) -- Arms
end

local function LoadScaleform(scaleform)
    local text = RequestScaleformMovie(scaleform)

    if text ~= 0 then
        while not HasScaleformMovieLoaded(text) do
            Citizen.Wait(0)
        end
    end

    return text
end

local function CreateNamedRenderTargetForModel(name, model)
    local text = 0
    if not IsNamedRendertargetRegistered(name) then
        RegisterNamedRendertarget(name, 0)
    end
    if not IsNamedRendertargetLinked(model) then
        LinkNamedRendertarget(model)
    end
    if IsNamedRendertargetRegistered(name) then
        text = GetNamedRendertargetRenderId(name)
    end

    return text
end

local function StartCreation()
    SetEntityCollision(GetPlayerPed(-1), false)
    Wait(4000)
    DoScreenFadeOut(1000)
    Wait(1000)
    local IDa = math.random(10000, 90000)
    TriggerEvent('instance:create', 'creationperso', IDa, {instance = IDa, owner = GetPlayerServerId(PlayerId())})
    TriggerEvent('InitialCore:LoadScaleCP')
    LoadFreemode(true)
    Wait(500)
    --LoadingScreenMessage('Chargement de la création de personnage.', 5100)
    SetEntityCoords(PlayerPedId(), 409.42, -1001.14, -99.90, 0.0, 0.0, 0.0, true)
    Wait(2000)
    SetEntityHeading(PlayerPedId(), 350.0)
    Wait(2000)
    TriggerEvent('InitialCore:CreateSignCharCre')
    CharCreaCam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", 415.55, -998.50, -99.29, 0.00, 0.00, 89.75, 50.00, false, 0)
    SetCamActive(CharCreaCam, true)
    RenderScriptCams(true, false, 2000, true, true) 
    Wait(1000)
    RequestAnimDict("mp_character_creation@lineup@male_a")
    Wait(100)
    DoScreenFadeIn(1000)
    TaskPlayAnim(PlayerPedId(), "mp_character_creation@lineup@male_a", "intro", 1.0, 1.0, 5900, 0, 1, 0, 0, 0)
    Wait(5700)
    RequestAnimDict("mp_character_creation@customise@male_a")
    Wait(100)
    TaskPlayAnim(PlayerPedId(), "mp_character_creation@customise@male_a", "loop", 1.0, 1.0, -1, 0, 1, 0, 0, 0)
    CharCreaCam2 = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", 413.40, -998.43, -99.01, 0.00, 0.00, 89.75, 50.00, false, 0)
    PointCamAtCoord(CharCreaCam2, 413.40, -998.43, -99.01)
    SetCamActiveWithInterp(CharCreaCam2, CharCreaCam, 5000, true, true)
    Wait(5000)
    RequestAnimDict("mp_character_creation@customise@male_a")
    Wait(100)
    while Enabled do
        Wait(1)
        TaskPlayAnim(PlayerPedId(), "mp_character_creation@customise@male_a", "loop", 8.0, -8.0, -1, 0, 1, 0, 0, 0)
        HelpNotif("Appuyez sur ~INPUT_FRONTEND_ACCEPT~ pour créer votre personnage.")
        if IsDisabledControlJustPressed(1, 201) then
            Enabled = false
        end
    end
    RequestAnimDict("mp_character_creation@lineup@male_a")
    TaskPlayAnim(PlayerPedId(), "mp_character_creation@lineup@male_a", "outro", 1.0, 1.0, 9000, 0, 1, 0, 0, 0)
    Wait(8000)
    DoScreenFadeOut(1000)
    Wait(1000) 
    DestroyAllCams(true)
    cam3 = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", 402.92, -1000.72, -98.5, 0.00, 0.00, 0.00, 50.00, false, 0)
    SetCamActive(cam3, true)
    Wait(500)
    SetEntityCoords(PlayerPedId(), 405.59, -997.18, -99.00, 0.0, 0.0, 0.0, true)
    SetEntityHeading(PlayerPedId(), 90.0)
    Wait(500)
    cam4 = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", 402.99, -998.02, -98.5, 0.00, 0.00, 0.00, 70.00, false, 0)
    PointCamAtCoord(cam4, 402.99, -998.02, -98.5)
    SetCamActiveWithInterp(cam4, cam3, 5000, true, true)
    DoScreenFadeIn(1000)
    RequestAnimDict("mp_character_creation@customise@male_a")
    TaskPlayAnim(PlayerPedId(), "mp_character_creation@customise@male_a", "intro", 1.0, 1.0, 7000, 0, 1, 0, 0, 0)
    Wait(5500)
    RageUI.Visible(RMenu:Get('creator', 'main'), true)
    CreationEnCours = true
    TriggerEvent('CreationMenu')
    --form = setupScaleform("instructional_buttons")
    cam5 = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", 402.8, -997.5, -98.3, 0.00, 0.00, 0.00, 70.00, false, 0)
    PointCamAtCoord(cam5, 402.8, -997.5, -98.3)
    Enabled = true
    RequestAnimDict("mp_character_creation@customise@male_a")
    Wait(100)
    while Enabled do
        Wait(1)
        TaskPlayAnim(PlayerPedId(), "mp_character_creation@customise@male_a", "loop", 8.0, -8.0, -1, 0, 1, 0, 0, 0)
        --DrawScaleformMovieFullscreen(form, 255, 255, 255, 255, 0)
        if (RageUI.Visible(RMenu:Get('creator', 'traitsduvisage')) or RageUI.Visible(RMenu:Get('creator', 'heritage')) or RageUI.Visible(RMenu:Get('creator', 'apparence'))) and not FaceCam then
            FaceCam = true
            SetCamActiveWithInterp(cam5, cam4, 1000, true, true)
        elseif (not RageUI.Visible(RMenu:Get('creator', 'traitsduvisage')) and not RageUI.Visible(RMenu:Get('creator', 'heritage')) and not RageUI.Visible(RMenu:Get('creator', 'apparence'))) and FaceCam then
            FaceCam = false
            SetCamActiveWithInterp(cam4, cam5, 1000, true, true)
        end
        --[[if IsDisabledControlJustPressed(1, 44) and UpdateOnscreenKeyboard() ~= 0 then
            PlayerRotation=PlayerRotation-45.0
            SetPedDesiredHeading(GetPlayerPed(-1), PlayerRotation)
        end
        if IsDisabledControlJustPressed(1, 46) and UpdateOnscreenKeyboard() ~= 0 then
            PlayerRotation=PlayerRotation+45.0
            SetPedDesiredHeading(GetPlayerPed(-1), PlayerRotation)
        end]]
    end
    BlockKey = false
    ToggleCancelEmote(true)
    DoScreenFadeOut(1000)
    Wait(1000)
    --LoadingScreenMessage('Sauvegarde du personnage et téléportation à l\'aéroport.', 4500)
    RenderScriptCams(false, false, 50, true, true) 
    CharCreaCam = nil
    CharCreaCam2 = nil
    cam3 = nil
    cam4 = nil
    cam5 = nil
    Wait(500)
    --SetEntityCoords(PlayerPedId(), -1044.739, -2749.323, 21.363, 0.0, 0.0, 0.0, true)
    if SelectedSpawn == 1 then
        print("LS")
        local LS = LosSantos[math.random(1, 2)]
        SetEntityCoords(PlayerPedId(), LS.x, LS.y, LS.z, false, false, false, true)
        SetEntityHeading(PlayerPedId(), LosSantosHeading)
    elseif SelectedSpawn == 2 then
        print("PB")
        local PB = PaletoBay[math.random(1, 2)]
        SetEntityCoords(PlayerPedId(), PB.x, PB.y, PB.z, false, false, false, true)
        SetEntityHeading(PlayerPedId(), PaletoHeading)
    elseif SelectedSpawn == 3 then
        print("SS")
        local SS = SandyShores[math.random(1, 2)]
        SetEntityCoords(PlayerPedId(), SS.x, SS.y, SS.z, false, false, false, true)
        SetEntityHeading(PlayerPedId(), SandyShoresHeading)
    end
    Wait(2000)
    SetEntityHeading(PlayerPedId(), 325.0)
    Wait(2000)
    if SignProp1 ~= nil then
        DeleteObject(SignProp1)
    end
    if SignProp2 ~= nil then
        DeleteObject(SignProp2)
    end
    ClearPedTasks(GetPlayerPed(-1))
    SetEntityCollision(GetPlayerPed(-1), true)
    DoScreenFadeIn(1000)
end
AddEventHandler('LoadPed', function(ped, istransparent)
    ped = GetHashKey(ped)
    RequestModel(ped)
        while not HasModelLoaded(ped) do 
            RequestModel(ped)
            Citizen.Wait(0)
        end
    SetPlayerModel(PlayerId(), ped)
    SetPedDefaultComponentVariation(PlayerPedId())
    SetModelAsNoLongerNeeded(ped)
    ClearPedProp(PlayerPedId(), 0)
    if istransparent then
        SetEntityAlpha(PlayerPedId(), 153, false)
    end
end)
AddEventHandler('BlockKey', function()
    --local i = 1
    while BlockKey do
        --i = i+1
        --print('blockkey' .. i)
        Wait(1)
        --DisableAllControlActions(0)
        --DisableAllControlActions(1)
        DisableControlAction(0, 1, true) -- Disable pan
        DisableControlAction(0, 2, true) -- Disable tilt
        DisableControlAction(0, 24, true) -- Attack
        DisableControlAction(0, 257, true) -- Attack 2
        DisableControlAction(0, 25, true) -- Aim
        DisableControlAction(0, 263, true) -- Melee Attack 1
        DisableControlAction(0, 32, true) -- W
        DisableControlAction(0, 34, true) -- A
        DisableControlAction(0, 31, true) -- S (fault in Keys table!)
        DisableControlAction(0, 30, true) -- D (fault in Keys table!)

        DisableControlAction(0, 45, true) -- Reload
        DisableControlAction(0, 22, true) -- Jump
        DisableControlAction(0, 44, true) -- Cover
        DisableControlAction(0, 37, true) -- Select Weapon
        DisableControlAction(0, 23, true) -- Also 'enter'?

        DisableControlAction(0, 288, true) -- Disable phone
        DisableControlAction(0, 289, true) -- Inventory
        DisableControlAction(0, 170, true) -- Animations
        DisableControlAction(0, 167, true) -- Job

        DisableControlAction(0, 0, true) -- Disable changing view
        DisableControlAction(0, 26, true) -- Disable looking behind
        DisableControlAction(0, 73, true) -- Disable clearing animation
        DisableControlAction(2, 199, true) -- Disable pause screen

        DisableControlAction(0, 59, true) -- Disable steering in vehicle
        DisableControlAction(0, 71, true) -- Disable driving forward in vehicle
        DisableControlAction(0, 72, true) -- Disable reversing in vehicle

        DisableControlAction(2, 36, true) -- Disable going stealth

        DisableControlAction(0, 47, true) -- Disable weapon
        DisableControlAction(0, 264, true) -- Disable melee
        DisableControlAction(0, 257, true) -- Disable melee
        DisableControlAction(0, 140, true) -- Disable melee
        DisableControlAction(0, 141, true) -- Disable melee
        DisableControlAction(0, 142, true) -- Disable melee
        DisableControlAction(0, 143, true) -- Disable melee
        DisableControlAction(0, 75, true) -- Disable exit vehicle
        DisableControlAction(27, 75, true) -- Disable exit vehicle
    end
end)

RegisterNetEvent('InitialCore:CharacterCreator')
AddEventHandler('InitialCore:CharacterCreator', function()
    ToggleCancelEmote(false)
    BlockKey = true
    Wait(50)
    TriggerEvent('BlockKey')
    StartCreation()
end)

AddEventHandler('InitialCore:LoadScaleCP', function()
    scaleform = LoadScaleform("mugshot_board_01")
    text = CreateNamedRenderTargetForModel("ID_TEXT", textmodel)
    while text do
        Citizen.Wait(1)
        SetTextRenderId(text) -- set render target
        Set_2dLayer(4)
        Citizen.InvokeNative(0xC6372ECD45D73BCD, 1)
        Citizen.InvokeNative(0xC6372ECD45D73BCD, 0)
        Citizen.InvokeNative(0xC6372ECD45D73BCD, 1)
        DrawScaleformMovie(scaleform, 0.40, 0.35, 0.80, 0.75, 255, 255, 255, 255, 0)
        Citizen.InvokeNative(0xC6372ECD45D73BCD, 0)
        SetTextRenderId(GetDefaultScriptRendertargetRenderId())
    end
end)

function SavePersoCP()
    skin = {}
    skin.Sexe = SelectedSexe

    skin.UsePed = IsPed
    skin.PedUsed = PedUsed
    skin.VariationHead = Variation1
    skin.VariationBeard = Variation2
    skin.VariationHair = Variation3
    skin.VariationTorso = Variation4
    skin.VariationTorsoColor = Variation4C
    skin.VariationTorso2 = Variation12
    skin.VariationTorso2Color = Variation12C
    skin.VariationPants = Variation5
    skin.VariationPantsColor = Variation5C
    skin.VariationGloves = Variation6
    skin.VariationGlovesColor = Variation6C
    skin.VariationShoes = Variation7
    skin.VariationShoesColor = Variation7C
    skin.VariationMisc1 = Variation9
    skin.VariationMisc2 = Variation10
    skin.VariationMisc3 = Variation11

    skin.Mere = SelectedMere
    skin.Pere = SelectedPere
    skin.ShapeMix = ShapeMix
    skin.SkinMix = SkinMix
    skin.ForeheadHeight = FrontHeight
    skin.ForeheadWidth = FrontWidth
    skin.EyesSize = Eyes
    skin.NoseWidth = NozWidth
    skin.NoseHeight = NozHeight
    skin.MidNoseWidth = AreteNozWidth
    skin.MidNoseHeight = AreteNozHeight
    skin.TipNoseHeight = BoutNozHauteur
    skin.TipNoseBreak = BoutNozCasse
    skin.CheekbonesHeight = PommettesHeight
    skin.CheekbonesWidth = PommettesWidth
    skin.CheeksWidth = JouesWidth
    skin.LipsWidth = LevresWidth
    skin.JawHeight = MachoireHeight
    skin.JawWidth = MachoireWidth
    skin.ChinHeight = MentonHeight
    skin.ChinPosition = MentonPosition
    skin.ChinShape = MentonShape
    skin.ChinWidth = MentonWidth

    skin.Hair = CheveuxStyle
    skin.HairColor = CheveuxCouleur
    skin.HairColor2 = CheveuxCouleurSecondaire
    skin.Eyebrows = SourcilsStyle
    skin.EyebrowsOpacity = SourcilsOpacite
    skin.EyebrowsColor = SourcilsCouleur
    skin.EyebrowsColor2 = SourcilsCouleurSecondaire
    skin.Beard = PilositeStyle
    skin.BeardOpacity = PilositeOpacite
    skin.BeardColor = PilositeCouleur
    skin.BeardColor2 = PilositeCouleurSecondaire
    skin.Blemishes = ProblemePeauStyle
    skin.BlemishesOpacity = ProblemePeauOpacite
    skin.Ageing = VieillissementStyle
    skin.AgeingOpacity = VieillissementOpacite
    skin.Complexion = TeintStyle
    skin.ComplexionOpacity = TeintOpacite
    skin.Freckles = TachesCutaneesStyle
    skin.FrecklesOpacity = TachesCutaneesOpacite
    skin.SkinAspect = AspectPeauStyle
    skin.SkinAspectOpacity = AspectPeauOpacite
    skin.EyesColor = CouleurYeux
    skin.Makeup = MaquillageYeuxStyle
    skin.MakeupOpacity = MaquillageYeuxOpacite
    skin.MakeupColor = MaquillageYeuxCouleur
    skin.MakeupColor2 = MaquillageYeuxCouleurSecondaire
    skin.Lipstick = RougeALevresStyle
    skin.LipstickOpacity = RougeALevresOpacite
    skin.LipstickColor = RougeALevresCouleur
    skin.LipstickColor2 = RougeALevresCouleurSecondaire

    if SelectedSexe == 1 then
        skin.Tshirt1 = 15
        skin.Tshirt2 = 0
        skin.Pants1 = 21
        skin.Pants2 = 0
        skin.Shoes1 = 34
        skin.Shoes2 = 0
        skin.Glasse1 = -1
        skin.Glasse2 = 0
        skin.Hat1 = -1
        skin.Hat2 = 0
    else
        skin.Tshirt1 = 2
        skin.Tshirt2 = 0
        skin.Pants1 = 15
        skin.Pants2 = 0
        skin.Shoes1 = 35
        skin.Shoes2 = 0
        skin.Glasse1 = -1
        skin.Glasse2 = 0
        skin.Hat1 = -1
        skin.Hat2 = 0
    end
    skin.Torso1 = 15
    skin.Torso2 = 0
    skin.Arms1 = 15
    skin.Arms2 = 0

    if skin.UsePed then
        TriggerServerEvent('InitialCore:BlockPed', skin.PedUsed)
    end
    
    TriggerEvent('InitialCore:SavePerso', skin)

    idcard = {}
    idcard.Prenom = Prenom
    idcard.Nom = Nom
    idcard.Taille = Taille
    idcard.DateDeNaissance = JourDeNaissance .. " " .. MoisDeNaissance .. " " .. AnneeDeNaissance
    if SelectedSexe == 1 then
        idcard.Sexe = 'Homme'
    else
        idcard.Sexe = 'Femme'
    end

    TriggerServerEvent('InitialCoreS:SaveIDCard', idcard)

    TriggerServerEvent('InitialCore:LoadStatusInfoS')

    TriggerEvent('instance:leave')
end

AddEventHandler('CreationMenu', function()
    while CreationEnCours do
        Citizen.Wait(1)
        RageUI.IsVisible(RMenu:Get('creator', 'main'), true, true, true, function()
            RageUI.List("Sexe", SexeList, SelectedSexe, "DESC", {}, true, function(Hovered, Active, Selected, Index)
                if Index ~= SelectedSexe then
                    SelectedSexe = Index
                    PedUsed = nil
                    if SelectedSexe == 1 then
                        SelectedMere = 4
                        SelectedPere = 4
                        SkinMix = 0.0
                        ShapeMix = 0.8
                        LoadFreemode(true)
                    else
                        SelectedMere = 21
                        SelectedPere = 2
                        SkinMix = 0.7
                        ShapeMix = 0.05
                        LoadFreemode(false)
                    end
                    ResetTraitsDuVisageList()
                    Variation1 = 0
                    Variation2 = 0
                    Variation3 = 0
                    Variation4 = 0
                    Variation4C = 0
                    Variation5 = 0
                    Variation5C = 0
                    Variation6 = 0
                    Variation6C = 0
                    Variation7 = 0
                    Variation7C = 0
                    Variation9 = 0
                    Variation10 = 0
                    Variation11 = 0
                    Variation12 = 0
                    Variation12C = 0

                    FrontHeight = 0.0
                    FrontWidth = 0.0
                    Eyes = 0.0
                    NozWidth = 0.0
                    NozHeight = 0.0
                    AreteNozWidth = 0.0
                    AreteNozHeight = 0.0
                    BoutNozHauteur = 0.0
                    BoutNozCasse = 0.0
                    PommettesHeight = 0.0
                    PommettesWidth = 0.0
                    LevresWidth = 0.0
                    MachoireHeight = 0.0
                    MachoireWidth = 0.0
                    MentonHeight = 0.0
                    MentonPosition = 0.0
                    MentonShape = 0.0
                    MentonWidth = 0.0
                    CheveuxStyle = 0
                    CheveuxCouleur = 0
                    CheveuxCouleurSecondaire = 0
                    SourcilsStyle = -1
                    SourcilsOpacite = 1.0
                    SourcilsCouleur = 0
                    SourcilsCouleurSecondaire = 0
                    PilositeStyle = -1
                    PilositeOpacite = 1.0
                    PilositeCouleur = 0
                    PilositeCouleurSecondaire = 0
                    ProblemePeauStyle = -1
                    ProblemePeauOpacite = 1.0
                    VieillissementStyle = -1
                    VieillissementOpacite = 1.0
                    TeintStyle = -1
                    TeintOpacite = 1.0
                    TachesCutaneesStyle = -1
                    TachesCutaneesOpacite = 1.0
                    AspectPeauStyle = -1
                    AspectPeauOpacite = 1.0
                    CouleurYeux = -1
                    MaquillageYeuxStyle = -1
                    MaquillageYeuxOpacite = 1.0
                    MaquillageYeuxCouleur = 0
                    MaquillageYeuxCouleurSecondaire = 0
                    RougeALevresStyle = -1
                    RougeALevresOpacite = 1.0
                    RougeALevresCouleur = 0
                    RougeALevresCouleurSecondaire = 0

                    TriggerEvent('InitialCore:CreateSignCharCre')
                end
            end)
            RageUI.List("Type de personnage", IsPedList, IsPedListIndex or 1, "DESC", {}, true, function(Hovered, Active, Selected, Index)
                if Index ~= IsPedListIndex then
                    IsPedListIndex = Index
                    if IsPedListIndex == 1 then
                        IsPed = false
                        if SelectedSexe == 1 then
                            SelectedMere = 4
                            SelectedPere = 4
                            SkinMix = 0.0
                            ShapeMix = 0.8
                            LoadFreemode(true)
                        else
                            SelectedMere = 21
                            SelectedPere = 2
                            SkinMix = 0.7
                            ShapeMix = 0.05
                            LoadFreemode(false)
                        end
                    else
                        IsPed = true
                        SetEntityAlpha(PlayerPedId(), 0, false)
                    end
                    ResetTraitsDuVisageList()
                    Variation1 = 0
                    Variation2 = 0
                    Variation3 = 0
                    Variation4 = 0
                    Variation4C = 0
                    Variation5 = 0
                    Variation5C = 0
                    Variation6 = 0
                    Variation6C = 0
                    Variation7 = 0
                    Variation7C = 0
                    Variation9 = 0
                    Variation10 = 0
                    Variation11 = 0
                    Variation12 = 0
                    Variation12C = 0

                    FrontHeight = 0.0
                    FrontWidth = 0.0
                    Eyes = 0.0
                    NozWidth = 0.0
                    NozHeight = 0.0
                    AreteNozWidth = 0.0
                    AreteNozHeight = 0.0
                    BoutNozHauteur = 0.0
                    BoutNozCasse = 0.0
                    PommettesHeight = 0.0
                    PommettesWidth = 0.0
                    LevresWidth = 0.0
                    MachoireHeight = 0.0
                    MachoireWidth = 0.0
                    MentonHeight = 0.0
                    MentonPosition = 0.0
                    MentonShape = 0.0
                    MentonWidth = 0.0
                    CheveuxStyle = 0
                    CheveuxCouleur = 0
                    CheveuxCouleurSecondaire = 0
                    SourcilsStyle = -1
                    SourcilsOpacite = 1.0
                    SourcilsCouleur = 0
                    SourcilsCouleurSecondaire = 0
                    PilositeStyle = -1
                    PilositeOpacite = 1.0
                    PilositeCouleur = 0
                    PilositeCouleurSecondaire = 0
                    ProblemePeauStyle = -1
                    ProblemePeauOpacite = 1.0
                    VieillissementStyle = -1
                    VieillissementOpacite = 1.0
                    TeintStyle = -1
                    TeintOpacite = 1.0
                    TachesCutaneesStyle = -1
                    TachesCutaneesOpacite = 1.0
                    AspectPeauStyle = -1
                    AspectPeauOpacite = 1.0
                    CouleurYeux = -1
                    MaquillageYeuxStyle = -1
                    MaquillageYeuxOpacite = 1.0
                    MaquillageYeuxCouleur = 0
                    MaquillageYeuxCouleurSecondaire = 0
                    RougeALevresStyle = -1
                    RougeALevresOpacite = 1.0
                    RougeALevresCouleur = 0
                    RougeALevresCouleurSecondaire = 0

                    TriggerEvent('InitialCore:CreateSignCharCre')
                end
            end)
            if Prenom and Nom then
                RageUI.Button("Identité", "DESC", { RightLabel = Prenom .. " " .. Nom }, true, function(Hovered, Active, Selected)
                end, RMenu:Get('creator', 'identite'))
            else
                RageUI.Button("Identité", "DESC", { RightLabel = ">" }, true, function(Hovered, Active, Selected)
                end, RMenu:Get('creator', 'identite'))
            end
            if not IsPed then
                RageUI.Button("Héritage", "DESC", { RightLabel = ">" }, true, function(Hovered, Active, Selected)
                end, RMenu:Get('creator', 'heritage'))
                RageUI.Button("Traits du visage", "DESC", { RightLabel = ">" }, true, function(Hovered, Active, Selected)
                end, RMenu:Get('creator', 'traitsduvisage'))
                RageUI.Button("Apparence", "DESC", { RightLabel = ">" }, true, function(Hovered, Active, Selected)
                    if Selected then
                        HairCutStyles = {}
                        if SelectedSexe == 1 then
                            for i = 1, #CheveuxNameM, 1 do
                                table.insert(HairCutStyles, CheveuxNameM[i])
                            end
                        else
                            for i = 1, #CheveuxNameF, 1 do
                                table.insert(HairCutStyles, CheveuxNameF[i])
                            end
                        end
                    end
                end, RMenu:Get('creator', 'apparence'))
            else
                RageUI.Button("Choisir son personnage", "DESC", { RightLabel = PedUsed or ">" }, true, function(Hovered, Active, Selected)
                    if Selected then
                        TriggerServerCallback("getPedUsed", function(pedlist)
                            PedList = pedlist
                        end)
                    end
                end, RMenu:Get('creator', 'pedlist'))
                RageUI.Button("Variation", "DESC", { RightLabel = ">" }, true, function(Hovered, Active, Selected)
                end, RMenu:Get('creator', 'variation'))
            end
            RageUI.List("Lieu d'apparition", ListSpawn, SelectedSpawn, "DESC", {}, true, function(Hovered, Active, Selected, Index)
                if SelectedSpawn ~= Index then
                    SelectedSpawn = Index
                end
            end)
            RageUI.Button("Valider", "DESC", { RightLabel = ">", Color = { BackgroundColor = {66, 135, 245}, HightLightColor = {0, 98, 255}} }, true, function(Hovered, Active, Selected)
                if Selected then
                    if Prenom and Nom then
                        if IsPed then
                            if PedUsed then
                                SavePersoCP()
                                Enabled = false
                                RageUI.GoBack()
                                CreationEnCours = false
                            else
                                AdvancedNotif('Création de personnage.', '~r~Erreur.', 'Vous devez choisir un personnage.', 'CHAR_WE', 'INITIALV')
                            end
                        else
                        SavePersoCP()
                        Enabled = false
                        RageUI.GoBack()
                        CreationEnCours = false
                        TriggerEvent('ClotheShop:Sexe', SelectedSexe, IsPed)
                        end
                    else
                        AdvancedNotif('Création de personnage.', '~r~Erreur.', 'Vous devez compléter votre identité.', 'CHAR_WE', 'INITIALV')
                    end
                end
            end)
        end, function()
            --- Panels
        end)
        if IsPed then
            RageUI.IsVisible(RMenu:Get('creator', 'pedlist'), true, true, true, function()
                if PedList ~= nil then
                    for i = 1, #PedList do
                        if SelectedSexe == 1 then
                            if PedList[i].Sexe == "m" then
                                if PedList[i].Utilise == "false" then
                                    if PedUsed == PedList[i].Nom then
                                        RageUI.Button(PedList[i].Nom, "DESC", { RightBadge = RageUI.BadgeStyle.Tick }, true, function(Hovered, Active, Selected)
                                            if Active and PedList[i].Nom ~= LastPedRender then
                                                LastPedRender = PedList[i].Nom
                                                TriggerEvent('LoadPed', PedList[i].Nom, false)
                                            end
                                        end)
                                    else
                                        RageUI.Button(PedList[i].Nom, "DESC", { }, true, function(Hovered, Active, Selected)
                                            if Active and PedList[i].Nom ~= LastPedRender then
                                                LastPedRender = PedList[i].Nom
                                                TriggerEvent('LoadPed', PedList[i].Nom, false)
                                            end
                                            if Selected then
                                                RageUI.GoBack()
                                                PedUsed = PedList[i].Nom
                                                Variation1 = 0
                                                Variation2 = 0
                                                Variation3 = 0
                                                Variation4 = 0
                                                Variation4C = 0
                                                Variation5 = 0
                                                Variation5C = 0
                                                Variation6 = 0
                                                Variation6C = 0
                                                Variation7 = 0
                                                Variation7C = 0
                                                Variation9 = 0
                                                Variation10 = 0
                                                Variation11 = 0
                                                Variation12 = 0
                                                Variation12C = 0
                                            end
                                        end)
                                    end
                                else--UTILISE LOCK
                                    RageUI.Button(PedList[i].Nom, "DESC", { RightBadge = RageUI.BadgeStyle.Lock }, true, function(Hovered, Active, Selected)
                                        if Active and PedList[i].Nom ~= LastPedRender then
                                            LastPedRender = PedList[i].Nom
                                            TriggerEvent('LoadPed', PedList[i].Nom, true)
                                        end
                                        if Selected then
                                            AdvancedNotif('Création de personnage.', '~r~Erreur.', 'Ce personnage est déjà utilisé.', 'CHAR_WE', 'INITIALV')
                                            PlaySoundFrontend(-1, 'ERROR', 'HUD_FRONTEND_DEFAULT_SOUNDSET', 0)
                                        end
                                    end)
                                end
                            end
                        else--FEMALE
                            if PedList[i].Sexe == "f" then
                                if PedList[i].Utilise == "false" then
                                    if PedUsed == PedList[i].Nom then
                                        RageUI.Button(PedList[i].Nom, "DESC", { RightBadge = RageUI.BadgeStyle.Tick }, true, function(Hovered, Active, Selected)
                                            if Active and PedList[i].Nom ~= LastPedRender then
                                                LastPedRender = PedList[i].Nom
                                                TriggerEvent('LoadPed', PedList[i].Nom, false)
                                            end
                                        end)
                                    else
                                        RageUI.Button(PedList[i].Nom, "DESC", { }, true, function(Hovered, Active, Selected)
                                            if Active and PedList[i].Nom ~= LastPedRender then
                                                LastPedRender = PedList[i].Nom
                                                TriggerEvent('LoadPed', PedList[i].Nom, false)
                                            end
                                            if Selected then
                                                RageUI.GoBack()
                                                PedUsed = PedList[i].Nom
                                                Variation1 = 0
                                                Variation2 = 0
                                                Variation3 = 0
                                                Variation4 = 0
                                                Variation4C = 0
                                                Variation5 = 0
                                                Variation5C = 0
                                                Variation6 = 0
                                                Variation6C = 0
                                                Variation7 = 0
                                                Variation7C = 0
                                                Variation9 = 0
                                                Variation10 = 0
                                                Variation11 = 0
                                                Variation12 = 0
                                                Variation12C = 0
                                            end
                                        end)
                                    end
                                else--UTILISE LOCK
                                    RageUI.Button(PedList[i].Nom, "DESC", { RightBadge = RageUI.BadgeStyle.Lock }, true, function(Hovered, Active, Selected)
                                        if Active and PedList[i].Nom ~= LastPedRender then
                                            LastPedRender = PedList[i].Nom
                                            TriggerEvent('LoadPed', PedList[i].Nom, true)
                                        end
                                        if Selected then
                                            AdvancedNotif('Création de personnage.', '~r~Erreur.', 'Ce personnage est déjà utilisé.', 'CHAR_WE', 'INITIALV')
                                            PlaySoundFrontend(-1, 'ERROR', 'HUD_FRONTEND_DEFAULT_SOUNDSET', 0)
                                        end
                                    end)
                                end
                            end
                        end
                    end
                end
            end, function()
                --- Panels
            end)
        end
        RageUI.IsVisible(RMenu:Get('creator', 'identite'), true, true, true, function()
            RageUI.Button("Prénom", "DESC", { RightLabel = Prenom or "Choisir >" }, true, function(Hovered, Active, Selected)
                if Selected then
                    Prenom = KeyboardInput("", 30)
                end
            end)    
            RageUI.Button("Nom", "DESC", { RightLabel = Nom or "Choisir >" }, true, function(Hovered, Active, Selected)
                if Selected then
                    Nom = KeyboardInput("", 30)
                end
            end)
            if dateentered then 
                RageUI.Button("Date de naissance", "DESC", { RightLabel = JourDeNaissance .. " " .. MoisDeNaissance .. " " .. AnneeDeNaissance }, true, function(Hovered, Active, Selected)
                end, RMenu:Get('creator', 'datedenaissance'))
            else
                RageUI.Button("Date de naissance", "DESC", { RightLabel = "Choisir >" }, true, function(Hovered, Active, Selected)
                    if Selected then
                        dateentered = true
                    end
                end, RMenu:Get('creator', 'datedenaissance'))
            end
            RageUI.List("Taille", ListTaille, TailleIndex or 1, "DESC", {}, true, function(Hovered, Active, Selected, Index)
                TailleIndex = Index
                Taille = ListTaille[Index]
            end)
        end, function()
            --- Panels
        end)
        RageUI.IsVisible(RMenu:Get('creator', 'datedenaissance'), true, true, true, function()
            RageUI.List("Jour de naissance", ListJours, JourDeNaissance, "DESC", {}, true, function(Hovered, Active, Selected, Index)
                JourDeNaissance = Index
            end)
            RageUI.List("Mois de naissance", ListMois, MoisDeNaissanceIndex or 1, "DESC", {}, true, function(Hovered, Active, Selected, Index)
                MoisDeNaissanceIndex = Index
                MoisDeNaissance = ListMois[Index]
            end)
            RageUI.List("Année de naissance", ListAnnee, AnneeDeNaissanceIndex or 1, "DESC", {}, true, function(Hovered, Active, Selected, Index)
                AnneeDeNaissanceIndex = Index
                AnneeDeNaissance = ListAnnee[Index]
            end)
        end, function()
            --- Panels
        end)
        RageUI.IsVisible(RMenu:Get('creator', 'variation'), true, true, true, function()
            if GetNumberOfPedDrawableVariations(GetPlayerPed(-1), 0) > 1 then
                RageUI.Slider('Tête', Variation1+1, GetNumberOfPedDrawableVariations(GetPlayerPed(-1), 0), 'DESC', false, {}, true, function(Hovered, Active, Selected, ProgressStart)
                    if Variation1+1 ~= ProgressStart then
                        Variation1 = ProgressStart-1
                        SetPedComponentVariation(GetPlayerPed(-1), 0, Variation1)
                    end
                end)
            end
            if GetNumberOfPedDrawableVariations(GetPlayerPed(-1), 1) > 1 then
                RageUI.Slider('Barbe', Variation2+1, GetNumberOfPedDrawableVariations(GetPlayerPed(-1), 1), 'DESC', false, {}, true, function(Hovered, Active, Selected, ProgressStart)
                    if Variation2+1 ~= ProgressStart then
                        Variation2 = ProgressStart-1
                        SetPedComponentVariation(GetPlayerPed(-1), 1, Variation2)
                    end
                end)
            end
            if GetNumberOfPedDrawableVariations(GetPlayerPed(-1), 2) > 1 then
                RageUI.Slider('Cheveux', Variation3+1, GetNumberOfPedDrawableVariations(GetPlayerPed(-1), 2), 'DESC', false, {}, true, function(Hovered, Active, Selected, ProgressStart)
                    if Variation3+1 ~= ProgressStart then
                        Variation3 = ProgressStart-1
                        SetPedComponentVariation(GetPlayerPed(-1), 2, Variation3)
                    end
                end)
            end
            if GetNumberOfPedDrawableVariations(GetPlayerPed(-1), 3) > 1 then
                RageUI.Slider('Torse', Variation4+1, GetNumberOfPedDrawableVariations(GetPlayerPed(-1), 3), 'DESC', false, {}, true, function(Hovered, Active, Selected, ProgressStart)
                    if Variation4+1 ~= ProgressStart then
                        Variation4 = ProgressStart-1
                        SetPedComponentVariation(GetPlayerPed(-1), 3, Variation4)
                    end
                end)
            end
            if GetNumberOfPedTextureVariations(GetPlayerPed(-1), 3, Variation4) > 1 then
                RageUI.Slider('Couleur torse', Variation4C+1, GetNumberOfPedTextureVariations(GetPlayerPed(-1), 3, Variation4), 'DESC', false, {}, true, function(Hovered, Active, Selected, ProgressStart)
                    if Variation4C+1 ~= ProgressStart then
                        Variation4C = ProgressStart-1
                        SetPedComponentVariation(GetPlayerPed(-1), 3, Variation4, Variation4C)
                    end
                end)
            end
            if GetNumberOfPedDrawableVariations(GetPlayerPed(-1), 11) > 1 then
                RageUI.Slider('Torse 2', Variation12+1, GetNumberOfPedDrawableVariations(GetPlayerPed(-1), 11), 'DESC', false, {}, true, function(Hovered, Active, Selected, ProgressStart)
                    if Variation12+1 ~= ProgressStart then
                        Variation12 = ProgressStart-1
                        SetPedComponentVariation(GetPlayerPed(-1), 11, Variation12)
                    end
                end)
            end
            if GetNumberOfPedTextureVariations(GetPlayerPed(-1), 11, Variation12) > 1 then
                RageUI.Slider('Couleur torse 2', Variation12C+1, GetNumberOfPedTextureVariations(GetPlayerPed(-1), 11, Variation12), 'DESC', false, {}, true, function(Hovered, Active, Selected, ProgressStart)
                    if Variation12C+1 ~= ProgressStart then
                        Variation12C = ProgressStart-1
                        SetPedComponentVariation(GetPlayerPed(-1), 11, Variation12, Variation12C)
                    end
                end)
            end
            if GetNumberOfPedDrawableVariations(GetPlayerPed(-1), 4) > 1 then
                RageUI.Slider('Pantalon', Variation5+1, GetNumberOfPedDrawableVariations(GetPlayerPed(-1), 4), 'DESC', false, {}, true, function(Hovered, Active, Selected, ProgressStart)
                    if Variation5+1 ~= ProgressStart then
                        Variation5 = ProgressStart-1
                        SetPedComponentVariation(GetPlayerPed(-1), 4, Variation5)
                    end
                end)
            end
            if GetNumberOfPedTextureVariations(GetPlayerPed(-1), 4, Variation5) > 1 then
                RageUI.Slider('Couleur pantalon', Variation5C+1, GetNumberOfPedTextureVariations(GetPlayerPed(-1), 4, Variation5), 'DESC', false, {}, true, function(Hovered, Active, Selected, ProgressStart)
                    if Variation5C+1 ~= ProgressStart then
                        Variation5C = ProgressStart-1
                        SetPedComponentVariation(GetPlayerPed(-1), 4, Variation5, Variation5C)
                    end
                end)
            end
            if GetNumberOfPedDrawableVariations(GetPlayerPed(-1), 5) > 1 then
                RageUI.Slider('Gants', Variation6+1, GetNumberOfPedDrawableVariations(GetPlayerPed(-1), 5), 'DESC', false, {}, true, function(Hovered, Active, Selected, ProgressStart)
                    if Variation6+1 ~= ProgressStart then
                        Variation6 = ProgressStart-1
                        SetPedComponentVariation(GetPlayerPed(-1), 5, Variation6)
                    end
                end)
            end
            if GetNumberOfPedTextureVariations(GetPlayerPed(-1), 5, Variation6) > 1 then
                RageUI.Slider('Couleur gants', Variation6C+1, GetNumberOfPedTextureVariations(GetPlayerPed(-1), 5, Variation6), 'DESC', false, {}, true, function(Hovered, Active, Selected, ProgressStart)
                    if Variation6C+1 ~= ProgressStart then
                        Variation6C = ProgressStart-1
                        SetPedComponentVariation(GetPlayerPed(-1), 5, Variation6, Variation6C)
                    end
                end)
            end
            if GetNumberOfPedDrawableVariations(GetPlayerPed(-1), 6) > 1 then
                RageUI.Slider('Chaussure', Variation7+1, GetNumberOfPedDrawableVariations(GetPlayerPed(-1), 6), 'DESC', false, {}, true, function(Hovered, Active, Selected, ProgressStart)
                    if Variation7+1 ~= ProgressStart then
                        Variation7 = ProgressStart-1
                        SetPedComponentVariation(GetPlayerPed(-1), 6, Variation7)
                    end
                end)
            end
            if GetNumberOfPedTextureVariations(GetPlayerPed(-1), 6, Variation7) > 1 then
                RageUI.Slider('Couleur chaussure', Variation7C+1, GetNumberOfPedTextureVariations(GetPlayerPed(-1), 6, Variation6), 'DESC', false, {}, true, function(Hovered, Active, Selected, ProgressStart)
                    if Variation7C+1 ~= ProgressStart then
                        Variation7C = ProgressStart-1
                        SetPedComponentVariation(GetPlayerPed(-1), 6, Variation7, Variation7C)
                    end
                end)
            end
            --[[if GetNumberOfPedDrawableVariations(GetPlayerPed(-1), 8) > 1 then
                RageUI.Slider('Accessoire', Variation9+1, GetNumberOfPedDrawableVariations(GetPlayerPed(-1), 8), 'DESC', false, {}, true, function(Hovered, Active, Selected, ProgressStart)
                    if Variation9+1 ~= ProgressStart then
                        Variation9 = ProgressStart-1
                        SetPedComponentVariation(GetPlayerPed(-1), 8, Variation9)
                    end
                end)
            end]] -- ##
            --[[if GetNumberOfPedDrawableVariations(GetPlayerPed(-1), 9) > 1 then
                RageUI.Slider('Accessoire #2', Variation10+1, GetNumberOfPedDrawableVariations(GetPlayerPed(-1), 9), 'DESC', false, {}, true, function(Hovered, Active, Selected, ProgressStart)
                    if Variation10+1 ~= ProgressStart then
                        Variation10 = ProgressStart-1
                        SetPedComponentVariation(GetPlayerPed(-1), 9, Variation10)
                    end
                end)
            end]]
            if GetNumberOfPedDrawableVariations(GetPlayerPed(-1), 10) > 1 then
                RageUI.Slider('Sticker & masque', Variation11+1, GetNumberOfPedDrawableVariations(GetPlayerPed(-1), 10), 'DESC', false, {}, true, function(Hovered, Active, Selected, ProgressStart)
                    if Variation11+1 ~= ProgressStart then
                        Variation11 = ProgressStart-1
                        SetPedComponentVariation(GetPlayerPed(-1), 10, Variation11)
                    end
                end)
            end
        end, function()
            --- Panels
        end)
        RageUI.IsVisible(RMenu:Get('creator', 'heritage'), true, true, true, function()
            RageUI.HeritageWindow(SelectedMere, SelectedPere)
            RageUI.List("Mère", MereList, SelectedMere, "DESC", {}, true, function(Hovered, Active, Selected, Index)
                if Index ~= SelectedMere then
                    SelectedMere = Index
                    SetPedHeadBlendData(GetPlayerPed(-1), SelectedMere, SelectedPere, nil, SelectedMere, SelectedPere, nil, ShapeMix, SkinMix, nil, true)
                end
            end)
            RageUI.List("Père", PereList, SelectedPere, "DESC", {}, true, function(Hovered, Active, Selected, Index)
                if Index ~= SelectedPere then
                    SelectedPere = Index
                    SetPedHeadBlendData(GetPlayerPed(-1), SelectedMere, SelectedPere, nil, SelectedMere, SelectedPere, nil, ShapeMix, SkinMix, nil, true)
                end
            end)
            RageUI.UISliderHeritage("Ressemblance", ShapeMix * 10, "DESC", function(Hovered, Selected, Active, Heritage, Index)
                if Index ~= ShapeMix then
                    ShapeMix = Index / 10
                    SetPedHeadBlendData(GetPlayerPed(-1), SelectedMere, SelectedPere, nil, SelectedMere, SelectedPere, nil, ShapeMix, SkinMix, nil, true)
                end
            end)
            RageUI.UISliderHeritage("Ressemblance", SkinMix * 10, "DESC", function(Hovered, Selected, Active, Heritage, Index)
                if Index ~= SkinMix then
                    SkinMix = Index / 10
                    SetPedHeadBlendData(GetPlayerPed(-1), SelectedMere, SelectedPere, nil, SelectedMere, SelectedPere, nil, ShapeMix, SkinMix, nil, true)
                end
            end)
        end, function()
            --- Panels
        end)
        RageUI.IsVisible(RMenu:Get('creator', 'traitsduvisage'), true, true, true, function()
            RageUI.List("Bas du front", TraitsDuVisageList[SelectedSexe][1].List, TraitsDuVisageList[SelectedSexe][1].Index, "DESC", {}, true, function(Hovered, Active, Selected, Index)
                if TraitsDuVisageList[SelectedSexe][1].Index ~= Index then
                    TraitsDuVisageList[SelectedSexe][1].Index = Index
                    if Index == 1 then
                        FrontWidth = 0.5*2-1
                        FrontWidthIndex = 0.5
                        FrontHeight = 0.5*2-1
                        FrontHeightIndex = 0.5
                    elseif Index == 2 then
                        FrontWidth = 0.9*2-1
                        FrontWidthIndex = 0.9
                        FrontHeight = 0.6*2-1
                        FrontHeightIndex = 0.6
                    elseif Index == 3 then
                        FrontWidth = 0.3*2-1
                        FrontWidthIndex = 0.3
                        FrontHeight = 0.7*2-1
                        FrontHeightIndex = 0.7
                    end
                    SetPedFaceFeature(GetPlayerPed(-1), 6, FrontHeight)
                    SetPedFaceFeature(GetPlayerPed(-1), 7, FrontWidth)
                end
                if Active then
                    self.FACE_F_BROW = true
                    self.FACE_F_CHINS = false
                else
                    self.FACE_F_BROW = false
                end
            end)
            RageUI.List("Yeux", TraitsDuVisageList[SelectedSexe][2].List, TraitsDuVisageList[SelectedSexe][2].Index, "DESC", {}, true, function(Hovered, Active, Selected, Index)
                if TraitsDuVisageList[SelectedSexe][2].Index ~= Index then
                    TraitsDuVisageList[SelectedSexe][2].Index = Index
                    if Index == 1 then
                        Eyes = 0.5*2-1
                        EyesIndex = 0.5
                    elseif Index == 2 then
                        Eyes = 0.3*2-1
                        EyesIndex = 0.3
                    elseif Index == 3 then
                        Eyes = 0.9*2-1
                        EyesIndex = 0.9
                    end
                    SetPedFaceFeature(GetPlayerPed(-1), 11, Eyes)
                end
                if Active then
                    self.FACE_F_EYES = true
                else
                    self.FACE_F_EYES = false
                end
            end)
            RageUI.List("Nez", TraitsDuVisageList[SelectedSexe][3].List, TraitsDuVisageList[SelectedSexe][3].Index, "DESC", {}, true, function(Hovered, Active, Selected, Index)
                
                if TraitsDuVisageList[SelectedSexe][3].Index ~= Index then
                    TraitsDuVisageList[SelectedSexe][3].Index = Index
                    if Index == 1 then
                        NozWidth = 0.5*2-1
                        NozWidthIndex = 0.5
                        NozHeight = 0.5*2-1
                        NozHeightIndex = 0.5
                    elseif Index == 2 then
                        NozWidth = 0.9*2-1
                        NozWidthIndex = 0.9
                        NozHeight = 0.6*2-1
                        NozHeightIndex = 0.6
                    elseif Index == 3 then
                        NozWidth = 0.3*2-1
                        NozWidthIndex = 0.3
                        NozHeight = 0.7*2-1
                        NozHeightIndex = 0.7
                    end
                    SetPedFaceFeature(GetPlayerPed(-1), 0, NozWidth)
                    SetPedFaceFeature(GetPlayerPed(-1), 1, NozHeight)
                end
                if Active then
                    self.FACE_F_NOSE = true
                else
                    self.FACE_F_NOSE = false
                end
            end)
            RageUI.List("Arête du nez", TraitsDuVisageList[SelectedSexe][4].List, TraitsDuVisageList[SelectedSexe][4].Index, "DESC", {}, true, function(Hovered, Active, Selected, Index)
                if TraitsDuVisageList[SelectedSexe][4].Index ~= Index then
                    TraitsDuVisageList[SelectedSexe][4].Index = Index
                    if Index == 1 then
                        AreteNozWidth = 0.5*2-1
                        AreteNozWidthIndex = 0.5
                        AreteNozHeight = 0.5*2-1
                        AreteNozHeightIndex = 0.5
                    elseif Index == 2 then
                        AreteNozWidth = 0.9*2-1
                        AreteNozWidth = AreteNozWidth*-1
                        AreteNozWidthIndex = 0.9
                        AreteNozHeight = 0.6*2-1
                        AreteNozHeight = AreteNozHeight*-1
                        AreteNozHeightIndex = 0.4
                    elseif Index == 3 then
                        AreteNozWidth = 0.3*2-1
                        AreteNozWidthIndex = 0.3
                        AreteNozHeight = 0.7*2-1
                        AreteNozHeightIndex = 0.7
                    end
                    SetPedFaceFeature(GetPlayerPed(-1), 2, AreteNozWidth)
                    SetPedFaceFeature(GetPlayerPed(-1), 3, AreteNozHeight)
                end
                if Active then
                    self.FACE_F_NOSEP = true
                else
                    self.FACE_F_NOSEP = false
                end
            end)
            RageUI.List("Bout du nez", TraitsDuVisageList[SelectedSexe][5].List, TraitsDuVisageList[SelectedSexe][5].Index, "DESC", {}, true, function(Hovered, Active, Selected, Index)
                if TraitsDuVisageList[SelectedSexe][5].Index ~= Index then
                    TraitsDuVisageList[SelectedSexe][5].Index = Index
                    if Index == 1 then
                        BoutNozHauteur = 0.5*2-1
                        BoutNozHauteurIndex = 0.5
                        BoutNozCasse = 0.5*2-1
                        BoutNozCasseIndex = 0.5
                    elseif Index == 2 then
                        BoutNozHauteur = 0.7*2-1
                        BoutNozHauteurIndex = 0.7
                        BoutNozCasse = 0.8*2-1
                        BoutNozCasseIndex = 0.8
                    elseif Index == 3 then
                        BoutNozHauteur = 0.3*2-1
                        BoutNozHauteurIndex = 0.3
                        BoutNozCasse = 0.5*2-1
                        BoutNozCasseIndex = 0.5
                    end
                    SetPedFaceFeature(GetPlayerPed(-1), 4, BoutNozHauteur)
                    SetPedFaceFeature(GetPlayerPed(-1), 5, BoutNozCasse)
                end
                if Active then
                    self.FACE_F_NOSET = true
                else
                    self.FACE_F_NOSET = false
                end
            end)
            RageUI.List("Pommettes", TraitsDuVisageList[SelectedSexe][6].List, TraitsDuVisageList[SelectedSexe][6].Index, "DESC", {}, true, function(Hovered, Active, Selected, Index)
                if TraitsDuVisageList[SelectedSexe][6].Index ~= Index then
                    TraitsDuVisageList[SelectedSexe][6].Index = Index
                    if Index == 1 then
                        PommettesHeight = 0.5*2-1
                        PommettesHeightIndex = 0.5
                        PommettesWidth = 0.5*2-1
                        PommettesWidthIndex = 0.5
                    elseif Index == 2 then
                        PommettesHeight = 0.6*2-1
                        PommettesHeightIndex = 0.6
                        PommettesWidth = 0.8*2-1
                        PommettesWidthIndex = 0.8
                    elseif Index == 3 then
                        PommettesHeight = 0.7*2-1
                        PommettesHeightIndex = 0.7
                        PommettesWidth = 0.3*2-1
                        PommettesWidthIndex = 0.3
                    end
                    SetPedFaceFeature(GetPlayerPed(-1), 8, PommettesHeight)
                    SetPedFaceFeature(GetPlayerPed(-1), 9, PommettesWidth)
                end
                if Active then
                    self.FACE_F_CHEEK = true
                else
                    self.FACE_F_CHEEK = false
                end
            end)
            RageUI.List("Joues", TraitsDuVisageList[SelectedSexe][7].List, TraitsDuVisageList[SelectedSexe][7].Index, "DESC", {}, true, function(Hovered, Active, Selected, Index)
                if TraitsDuVisageList[SelectedSexe][7].Index ~= Index then
                    TraitsDuVisageList[SelectedSexe][7].Index = Index
                    if Index == 1 then
                        JouesWidth = 0.5*2-1
                        JouesWidthItem = 0.5
                    elseif Index == 2 then
                        JouesWidth = 0.3*2-1
                        JouesWidthItem = 0.7
                    elseif Index == 3 then
                        JouesWidth = 0.9*2-1
                        JouesWidthItem = 0.1
                    end
                    SetPedFaceFeature(GetPlayerPed(-1), 10, JouesWidth)
                end
                if Active then
                    self.FACE_F_CHEEKS = true
                else
                    self.FACE_F_CHEEKS = false
                end
            end)
            RageUI.List("Lèvres", TraitsDuVisageList[SelectedSexe][8].List, TraitsDuVisageList[SelectedSexe][8].Index, "DESC", {}, true, function(Hovered, Active, Selected, Index)
                if TraitsDuVisageList[SelectedSexe][8].Index ~= Index then
                    TraitsDuVisageList[SelectedSexe][8].Index = Index
                    if Index == 1 then
                        LevresWidth = 0.5*2-1
                        LevresWidthIndex = 0.5
                    elseif Index == 2 then
                        LevresWidth = 0.1*2-1
                        LevresWidthIndex = 0.9
                    elseif Index == 3 then
                        LevresWidth = 0.7*2-1
                        LevresWidthIndex = 0.3
                    end
                    SetPedFaceFeature(GetPlayerPed(-1), 12, LevresWidth)
                end
                if Active then
                    self.FACE_F_LIPS = true
                else
                    self.FACE_F_LIPS = false
                end
            end)
            RageUI.List("Mâchoire", TraitsDuVisageList[SelectedSexe][9].List, TraitsDuVisageList[SelectedSexe][9].Index, "DESC", {}, true, function(Hovered, Active, Selected, Index)
                if TraitsDuVisageList[SelectedSexe][9].Index ~= Index then
                    TraitsDuVisageList[SelectedSexe][9].Index = Index
                    if Index == 1 then
                        MachoireWidth = 0.5*2-1
                        MachoireWidthItem = 0.5
                        MachoireHeight = 0.5*2-1
                        MachoireHeightItem = 0.5
                    elseif Index == 2 then
                        MachoireWidth = 0.9*2-1
                        MachoireWidthItem = 0.9
                        MachoireHeight = 0.6*2-1
                        MachoireHeightItem = 0.6
                    elseif Index == 3 then
                        MachoireWidth = 0.3*2-1
                        MachoireWidthItem = 0.3
                        MachoireHeight = 0.7*2-1
                        MachoireHeightItem = 0.7
                    end
                    SetPedFaceFeature(GetPlayerPed(-1), 13, MachoireHeight)
                    SetPedFaceFeature(GetPlayerPed(-1), 14, MachoireWidth)
                end
                if Active then
                    self.FACE_F_JAW = true
                else
                    self.FACE_F_JAW = false
                end
            end)
            RageUI.List("Profil menton", TraitsDuVisageList[SelectedSexe][10].List, TraitsDuVisageList[SelectedSexe][10].Index, "DESC", {}, true, function(Hovered, Active, Selected, Index)
                if TraitsDuVisageList[SelectedSexe][10].Index ~= Index then
                    TraitsDuVisageList[SelectedSexe][10].Index = Index
                    if Index == 1 then
                        MentonHeight = 0.5*2-1
                        MentonHeightIndex = 0.5
                        MentonPosition = 0.5*2-1
                        MentonPositionIndex = 0.5
                    elseif Index == 2 then
                        MentonHeight = 0.9*2-1
                        MentonHeightIndex = 0.6
                        MentonPosition = 0.6*2-1
                        MentonPositionIndex = 0.9
                    elseif Index == 3 then
                        MentonHeight = 0.3*2-1
                        MentonHeightIndex = 0.4
                        MentonPosition = 0.7*2-1
                        MentonPositionIndex = 0.3
                    end
                    SetPedFaceFeature(GetPlayerPed(-1), 15, MentonHeight)
                    SetPedFaceFeature(GetPlayerPed(-1), 16, MentonPosition)
                end
                if Active then
                    self.FACE_F_CHIN = true
                    self.FACE_F_CHINS = false
                else
                    self.FACE_F_CHIN = false
                end
            end)
            RageUI.List("Forme du menton", TraitsDuVisageList[SelectedSexe][11].List, TraitsDuVisageList[SelectedSexe][11].Index, "DESC", {}, true, function(Hovered, Active, Selected, Index)
                if TraitsDuVisageList[SelectedSexe][11].Index ~= Index then
                    TraitsDuVisageList[SelectedSexe][11].Index = Index
                    if Index == 1 then
                        MentonShape = 0.5*2-1
                        MentonShapeIndex = 0.5
                        MentonWidth = 0.5*2-1
                        MentonWidthIndex = 0.5
                    elseif Index == 2 then
                        MentonShape = 0.9*2-1
                        MentonShapeIndex = 0.9
                        MentonWidth = 0.6*2-1
                        MentonWidthIndex = 0.6
                    elseif Index == 3 then
                        MentonShape = 0.3*2-1
                        MentonShapeIndex = 0.3
                        MentonWidth = 0.7*2-1
                        MentonWidthIndex = 0.7
                    end
                    SetPedFaceFeature(GetPlayerPed(-1), 17, MentonShape)
                    SetPedFaceFeature(GetPlayerPed(-1), 18, MentonWidth)
                end
                if Active then
                    self.FACE_F_CHINS = true
                    self.FACE_F_BROW = false
                else
                    self.FACE_F_CHINS = false
                end
            end)
        end, function()
            if self.FACE_F_BROW then
                RageUI.GridPanel(FrontWidthIndex or 0.5, FrontHeightIndex or 0.5, "Haut", "Bas", "Intérieur", "Extérieur", function(Hovered, Active, X, Y)
                    if FrontHeightIndex ~= Y or FrontWidthIndex ~= X then
                        FrontHeightIndex = Y
                        FrontWidthIndex = X
                        FrontHeight = Y*2-1
                        FrontWidth = X*2-1
                        TraitsDuVisageList[SelectedSexe][1].Index = 4
                        SetPedFaceFeature(GetPlayerPed(-1), 6, FrontHeight)
                        SetPedFaceFeature(GetPlayerPed(-1), 7, FrontWidth)
                    end
                end)
            end
            if self.FACE_F_EYES then
                RageUI.GridPanelHorizontal(EyesIndex or 0.5, "Ouverts", "Plissés", function(Hovered, Active, X)
                    if EyesIndex ~= X then
                        Eyes = X*2-1
                        EyesIndex = X
                        TraitsDuVisageList[SelectedSexe][2].Index = 4
                        SetPedFaceFeature(GetPlayerPed(-1), 11, Eyes)
                    end
                end)
            end
            if self.FACE_F_NOSE then
                RageUI.GridPanel(NozWidthIndex or 0.5, NozHeightIndex or 0.5, "Relevé", "Bas", "Fin", "Épais", function(Hovered, Active, X, Y)
                    if NozHeightIndex ~= Y or NozWidthIndex ~= X then
                        NozWidth = X*2-1
                        NozWidthIndex = X
                        NozHeight = Y*2-1
                        NozHeightIndex = Y
                        TraitsDuVisageList[SelectedSexe][3].Index = 4
                        SetPedFaceFeature(GetPlayerPed(-1), 0, NozWidth)
                        SetPedFaceFeature(GetPlayerPed(-1), 1, NozHeight)
                    end
                end)
            end
            if self.FACE_F_NOSEP then
                RageUI.GridPanel(AreteNozWidthIndex or 0.5, AreteNozHeightIndex or 0.5, "Saillante", "Incurvée", "Courte", "Longue", function(Hovered, Active, X, Y)
                    if AreteNozWidthIndex ~= X or AreteNozHeightIndex ~= Y then
                        AreteNozHeight = Y*2-1
                        AreteNozHeightIndex = Y
                        AreteNozWidth = X*2-1
                        AreteNozWidth = AreteNozWidth*-1
                        AreteNozWidthIndex = X
                        TraitsDuVisageList[SelectedSexe][4].Index = 4
                        SetPedFaceFeature(GetPlayerPed(-1), 2, AreteNozWidth)
                        SetPedFaceFeature(GetPlayerPed(-1), 3, AreteNozHeight)
                    end
                end)
            end
            if self.FACE_F_NOSET then
                RageUI.GridPanel(BoutNozCasseIndex or 0.5, BoutNozHauteurIndex or 0.5, "Bout vers le haut", "Bout vers me nas", "Cassé gauche", "Cassé droite", function(Hovered, Active, X, Y)
                    if BoutNozCasseIndex ~= X or BoutNozHauteurIndex ~= Y then
                        BoutNozHauteur = Y*2-1
                        BoutNozHauteurIndex = Y
                        BoutNozCasse = X*2-1
                        BoutNozCasseIndex = X
                        TraitsDuVisageList[SelectedSexe][5].Index = 4
                        SetPedFaceFeature(GetPlayerPed(-1), 4, BoutNozHauteur)
                        SetPedFaceFeature(GetPlayerPed(-1), 5, BoutNozCasse)
                    end
                end)
            end
            if self.FACE_F_CHEEK then
                RageUI.GridPanel(PommettesWidthIndex or 0.5, PommettesHeightIndex or 0.5, "Haut", "Bas", "Intérieur", "Extérieur", function(Hovered, Active, X, Y)
                    if PommettesWidthIndex ~= X or PommettesHeightIndex ~= Y then
                        PommettesWidth = X*2-1
                        PommettesWidthIndex = X
                        PommettesHeight = Y*2-1
                        PommettesHeightIndex = Y
                        TraitsDuVisageList[SelectedSexe][6].Index = 4
                        SetPedFaceFeature(GetPlayerPed(-1), 8, PommettesHeight)
                        SetPedFaceFeature(GetPlayerPed(-1), 9, PommettesWidth)
                    end
                end)
            end
            if self.FACE_F_CHEEKS then
                RageUI.GridPanelHorizontal(JouesWidthItem or 0.5, "Émacié", "Bouffi", function(Hovered, Active, X)
                    if JouesWidthItem ~= X then
                        JouesWidth = X*2-1
                        JouesWidth = JouesWidth*-1
                        JouesWidthItem = X
                        TraitsDuVisageList[SelectedSexe][7].Index = 4
                        SetPedFaceFeature(GetPlayerPed(-1), 10, JouesWidth)
                    end
                end)
            end
            if self.FACE_F_LIPS then
                RageUI.GridPanelHorizontal(LevresWidthIndex or 0.5, "Minces", "Épaisses", function(Hovered, Active, X)
                    if LevresWidthIndex ~= X then
                        LevresWidth = X*2-1
                        LevresWidth = LevresWidth*-1
                        LevresWidthIndex = X
                        TraitsDuVisageList[SelectedSexe][8].Index = 4
                        SetPedFaceFeature(GetPlayerPed(-1), 12, LevresWidth)
                    end
                end)
            end
            if self.FACE_F_JAW then
                RageUI.GridPanel(MachoireHeightItem or 0.5, MachoireWidthItem or 0.5, "Ronde", "Carrée", "Étroite", "Large", function(Hovered, Active, X, Y)
                    if MachoireHeightItem ~= X or MachoireWidthItem ~= Y then
                        MachoireWidth = Y*2-1
                        MachoireWidthItem = Y
                        MachoireHeight = X*2-1
                        MachoireHeightItem = X
                        TraitsDuVisageList[SelectedSexe][9].Index = 4
                        SetPedFaceFeature(GetPlayerPed(-1), 13, MachoireHeight)
                        SetPedFaceFeature(GetPlayerPed(-1), 14, MachoireWidth)
                    end
                end)
            end
            if self.FACE_F_CHIN then
                RageUI.GridPanel(MentonPositionIndex or 0.5, MentonHeightIndex or 0.5, "Haut", "Bas", "Intérieur", "Extérieur", function(Hovered, Active, X, Y)
                    if MentonPositionIndex ~= X or MentonHeightIndex ~= Y then
                        MentonPosition = X*2-1
                        MentonPositionIndex = X
                        MentonHeight = Y*2-1
                        MentonHeightIndex = Y
                        TraitsDuVisageList[SelectedSexe][10].Index = 4
                        SetPedFaceFeature(GetPlayerPed(-1), 15, MentonHeight)
                        SetPedFaceFeature(GetPlayerPed(-1), 16, MentonPosition)
                    end
                end)
            end
            if self.FACE_F_CHINS then
                RageUI.GridPanel(MentonShapeIndex or 0.5, MentonWidthIndex or 0.5, "Arrondi", "Fossette", "Carré", "Pointu", function(Hovered, Active, X, Y)
                    if MentonShapeIndex ~= X or MentonWidthIndex ~= Y then
                        MentonShape = X*2-1
                        MentonShape = MentonShape*-1
                        MentonShapeIndex = X
                        MentonWidth = Y*2-1
                        MentonWidthIndex = Y
                        TraitsDuVisageList[SelectedSexe][11].Index = 4
                        SetPedFaceFeature(GetPlayerPed(-1), 17, MentonShape)
                        SetPedFaceFeature(GetPlayerPed(-1), 18, MentonWidth)
                    end
                end)
            end
        end)
        -- APPARENCE
        RageUI.IsVisible(RMenu:Get('creator', 'apparence'), true, true, true, function()
            RageUI.List(GetLabelText("FACE_A_HS"), HairCutStyles, CheveuxStyleIndex or 1, GetLabelText("FACE_APP_H"), {}, true, function(Hovered, Active, Selected, Index)
                if CheveuxStyleIndex ~= Index then
                    CheveuxStyleIndex = Index
                    CheveuxStyle = Index-1
                    SetPedComponentVariation(GetPlayerPed(-1), 2, CheveuxStyle)
                    print(CheveuxStyleIndex)
                end
                if Active then
                    self2.FACE_HAIR = true
                    self2.FACE_LIPSTICK = false
                else
                    self2.FACE_HAIR = false
                end
            end)
            RageUI.List(GetLabelText("FACE_F_EYEBR"), SourcilsName, SourcilsStyleIndex or 1, GetLabelText("FACE_APP_H"), {}, true, function(Hovered, Active, Selected, Index)
                if SourcilsStyleIndex ~= Index then
                    SourcilsStyleIndex = Index
                    SourcilsStyle = Index-2
                    SetPedHeadOverlay(GetPlayerPed(-1), 2, SourcilsStyle, SourcilsOpacite)
                end
                if Active then
                    self2.FACE_EYEBROW = true
                else
                    self2.FACE_EYEBROW = false -- ## SELF 2 A MODIF
                end
            end)
            if SelectedSexe == 1 then
                RageUI.List(GetLabelText("FACE_F_BEARD"), BarbeName, PilositeStyleIndex or 1, GetLabelText("FACE_APP_H"), {}, true, function(Hovered, Active, Selected, Index)
                    if PilositeStyleIndex ~= Index then
                        PilositeStyleIndex = Index
                        PilositeStyle = Index-2
                        SetPedHeadOverlay(GetPlayerPed(-1), 1, PilositeStyle, PilositeOpacite)
                    end
                    if Active then
                        self2.FACE_BEARD = true
                    else
                        self2.FACE_BEARD = false
                    end
                end)
            end
            RageUI.List(GetLabelText("FACE_F_SKINB"), tachList, ProblemePeauStyleIndex or 1, GetLabelText("FACE_APP_H"), {}, true, function(Hovered, Active, Selected, Index)
                if ProblemePeauStyleIndex ~= Index then
                    ProblemePeauStyleIndex = Index
                    ProblemePeauStyle = Index-2
                    SetPedHeadOverlay(GetPlayerPed(-1), 0, ProblemePeauStyle, ProblemePeauOpacite)
                end
                if Active then
                    self2.FACE_TACH = true
                else
                    self2.FACE_TACH = false
                end
            end)
            RageUI.List(GetLabelText("FACE_F_SKINA"), rideList, VieillissementStyleIndex or 1, GetLabelText("FACE_APP_H"), {}, true, function(Hovered, Active, Selected, Index)
                if VieillissementStyleIndex ~= Index then
                    VieillissementStyleIndex = Index
                    VieillissementStyle = Index-2
                    SetPedHeadOverlay(GetPlayerPed(-1), 3, VieillissementStyle, VieillissementOpacite)
                end
                if Active then
                    self2.FACE_AGE = true
                else
                    self2.FACE_AGE = false
                end
            end)
            RageUI.List(GetLabelText("FACE_F_SKC"), TeintList, TeintStyleIndex or 1, GetLabelText("FACE_APP_H"), {}, true, function(Hovered, Active, Selected, Index)
                if TeintStyleIndex ~= Index then
                    TeintStyleIndex = Index
                    TeintStyle = Index-2
                    SetPedHeadOverlay(GetPlayerPed(-1), 6, TeintStyle, TeintOpacite)
                end
                if Active then
                    self2.FACE_TEINT = true
                else
                    self2.FACE_TEINT = false
                end
            end)
            RageUI.List(GetLabelText("FACE_F_MOLE"), MoleList, TachesCutaneesStyleIndex or 1, GetLabelText("FACE_APP_H"), {}, true, function(Hovered, Active, Selected, Index)
                if TachesCutaneesStyleIndex ~= Index then
                    TachesCutaneesStyleIndex = Index
                    TachesCutaneesStyle = Index-2
                    SetPedHeadOverlay(GetPlayerPed(-1), 9, TachesCutaneesStyle, TachesCutaneesOpacite)
                end
                if Active then
                    self2.FACE_FRECKLES = true
                else
                    self2.FACE_FRECKLES = false
                end
            end)
            RageUI.List(GetLabelText("FACE_F_SUND"), ComplexList, AspectPeauStyleIndex or 1, GetLabelText("FACE_APP_H"), {}, true, function(Hovered, Active, Selected, Index)
                if AspectPeauStyleIndex ~= Index then
                    AspectPeauStyleIndex = Index
                    AspectPeauStyle = Index-2
                    SetPedHeadOverlay(GetPlayerPed(-1), 7, AspectPeauStyle, AspectPeauOpacite)
                end
                if Active then
                    self2.FACE_ASPECT = true
                else
                    self2.FACE_ASPECT = false
                end
            end)
            RageUI.List(GetLabelText("FACE_APP_EYE"), eyesList, CouleurYeuxIndex or 1, GetLabelText("FACE_APP_H"), {}, true, function(Hovered, Active, Selected, Index)
                if CouleurYeuxIndex ~= Index then
                    print(Index)
                    if Index == 1 and CouleurYeuxIndex == 2 then Index = 33 elseif Index == 1 then Index = 2 end
                    CouleurYeuxIndex = Index
                    CouleurYeux = Index-2
                    SetPedEyeColor(GetPlayerPed(-1), CouleurYeux)
                end
            end)
            RageUI.List(GetLabelText("FACE_F_EYEM"), MaquillageList, MaquillageYeuxStyleIndex or 1, GetLabelText("FACE_APP_H"), {}, true, function(Hovered, Active, Selected, Index)
                if MaquillageYeuxStyleIndex ~= Index then
                    MaquillageYeuxStyleIndex = Index
                    MaquillageYeuxStyle = Index-2
                    SetPedHeadOverlay(GetPlayerPed(-1), 4, MaquillageYeuxStyle, MaquillageYeuxOpacite)
                end
                if Active then
                    self2.FACE_MAKEUP = true
                    self2.FACE_LIPSTICK = false
                else
                    self2.FACE_MAKEUP = false
                end
            end)
            RageUI.List(GetLabelText("FACE_F_LIPST"), LipsList, RougeALevresStyleIndex or 1, GetLabelText("FACE_APP_H"), {}, true, function(Hovered, Active, Selected, Index)
                if RougeALevresStyleIndex ~= Index then
                    RougeALevresStyleIndex = Index
                    RougeALevresStyle = Index-2
                    SetPedHeadOverlay(GetPlayerPed(-1), 8, RougeALevresStyle, RougeALevresOpacite)
                end
                if Active then
                    self2.FACE_LIPSTICK = true
                    self2.FACE_HAIR = false
                else
                    self2.FACE_LIPSTICK = false
                end
            end)
        end, function()
            if self2.FACE_HAIR then
                RageUI.ColourPanel("Couleur principale", RageUI.PanelColour.HairCut, colorsPanel.haircut[1], CheveuxCouleurIndex or 1, function(Hovered, Active, MinimumIndex, CurrentIndex)
                    if CheveuxCouleurIndex ~= CurrentIndex then
                        colorsPanel.haircut[1] = MinimumIndex
                        CheveuxCouleurIndex = CurrentIndex
                        CheveuxCouleur = CurrentIndex-1
                        SetPedHairColor(GetPlayerPed(-1), CheveuxCouleur, CheveuxCouleurSecondaire)
                    end
                end)
                RageUI.ColourPanel("Couleur secondaire", RageUI.PanelColour.HairCut, colorsPanel.haircut[2], CheveuxCouleurSecondaireIndex or 1, function(Hovered, Active, MinimumIndex, CurrentIndex)
                    if CheveuxCouleurSecondaireIndex ~= CurrentIndex then
                        colorsPanel.haircut[2] = MinimumIndex
                        CheveuxCouleurSecondaireIndex = CurrentIndex
                        CheveuxCouleurSecondaire = CurrentIndex-1
                        SetPedHairColor(GetPlayerPed(-1), CheveuxCouleur, CheveuxCouleurSecondaire)
                    end
                end)
            end
            if self2.FACE_EYEBROW then
                RageUI.ColourPanel("Couleur principale", RageUI.PanelColour.HairCut, colorsPanel.eyebrow[1], SourcilsCouleurIndex or 1, function(Hovered, Active, MinimumIndex, CurrentIndex)
                    if SourcilsCouleurIndex ~= CurrentIndex then
                        colorsPanel.eyebrow[1] = MinimumIndex
                        SourcilsCouleurIndex = CurrentIndex
                        SourcilsCouleur = CurrentIndex-1
                        SetPedHeadOverlayColor(GetPlayerPed(-1), 2, 1, SourcilsCouleur, SourcilsCouleurSecondaire)
                    end
                end)
                RageUI.ColourPanel("Couleur secondaire", RageUI.PanelColour.HairCut, colorsPanel.eyebrow[2], SourcilsCouleurSecondaireIndex or 1, function(Hovered, Active, MinimumIndex, CurrentIndex)
                    if SourcilsCouleurSecondaireIndex ~= CurrentIndex then
                        colorsPanel.eyebrow[2] = MinimumIndex
                        SourcilsCouleurSecondaireIndex = CurrentIndex
                        SourcilsCouleurSecondaire = CurrentIndex-1
                        SetPedHeadOverlayColor(GetPlayerPed(-1), 2, 1, SourcilsCouleur, SourcilsCouleurSecondaire)
                    end
                end)
            end
            if self2.FACE_BEARD then
                RageUI.PercentagePanel(PilositeOpacite, "Opacité", nil, nil, function(Hovered, Active, Percent)
                    if PilositeOpacite ~= Percent then
                        PilositeOpacite = Percent
                        SetPedHeadOverlay(GetPlayerPed(-1), 1, PilositeStyle, PilositeOpacite)
                    end
                end)
                RageUI.ColourPanel("Couleur principale", RageUI.PanelColour.HairCut, colorsPanel.barber[1], PilositeCouleurIndex or 1, function(Hovered, Active, MinimumIndex, CurrentIndex)
                    if PilositeCouleurIndex ~= CurrentIndex then
                        colorsPanel.barber[1] = MinimumIndex
                        PilositeCouleurIndex = CurrentIndex
                        PilositeCouleur = CurrentIndex-1
                        SetPedHeadOverlayColor(GetPlayerPed(-1), 1, 1, PilositeCouleur, PilositeCouleurSecondaire)
                    end
                end)
                RageUI.ColourPanel("Couleur secondaire", RageUI.PanelColour.HairCut, colorsPanel.barber[2], PilositeCouleurSecondaireIndex or 1, function(Hovered, Active, MinimumIndex, CurrentIndex)
                    if PilositeCouleurSecondaireIndex ~= CurrentIndex then
                        colorsPanel.barber[2] = MinimumIndex
                        PilositeCouleurSecondaireIndex = CurrentIndex
                        PilositeCouleurSecondaire = CurrentIndex-1
                        SetPedHeadOverlayColor(GetPlayerPed(-1), 1, 1, PilositeCouleur, PilositeCouleurSecondaire)
                    end
                end)
            end
            if self2.FACE_TACH then
                RageUI.PercentagePanel(ProblemePeauOpacite, "Opacité", nil, nil, function(Hovered, Active, Percent)
                    if ProblemePeauOpacite ~= Percent then
                        ProblemePeauOpacite = Percent
                        SetPedHeadOverlay(GetPlayerPed(-1), 0, ProblemePeauStyle, ProblemePeauOpacite)
                    end
                end)
            end
            if self2.FACE_AGE then
                RageUI.PercentagePanel(VieillissementOpacite, "Opacité", nil, nil, function(Hovered, Active, Percent)
                    if VieillissementOpacite ~= Percent then
                        VieillissementOpacite = Percent
                        SetPedHeadOverlay(GetPlayerPed(-1), 3, VieillissementStyle, VieillissementOpacite)
                    end
                end)
            end
            if self2.FACE_TEINT then
                RageUI.PercentagePanel(TeintOpacite, "Opacité", nil, nil, function(Hovered, Active, Percent)
                    if TeintOpacite ~= Percent then
                        TeintOpacite = Percent
                        SetPedHeadOverlay(GetPlayerPed(-1), 6, TeintStyle, TeintOpacite)
                    end
                end)
            end
            if self2.FACE_FRECKLES then
                RageUI.PercentagePanel(TachesCutaneesOpacite, "Opacité", nil, nil, function(Hovered, Active, Percent)
                    if TachesCutaneesOpacite ~= Percent then
                        TachesCutaneesOpacite = Percent
                        SetPedHeadOverlay(GetPlayerPed(-1), 9, TachesCutaneesStyle, TachesCutaneesOpacite)
                    end
                end)
            end
            if self2.FACE_ASPECT then
                RageUI.PercentagePanel(AspectPeauOpacite, "Opacité", nil, nil, function(Hovered, Active, Percent)
                    if AspectPeauOpacite ~= Percent then
                        AspectPeauOpacite = Percent
                        SetPedHeadOverlay(GetPlayerPed(-1), 7, AspectPeauStyle, AspectPeauOpacite)
                    end
                end)
            end
            if self2.FACE_MAKEUP then
                RageUI.PercentagePanel(MaquillageYeuxOpacite, "Opacité", nil, nil, function(Hovered, Active, Percent)
                    if MaquillageYeuxOpacite ~= Percent then
                        MaquillageYeuxOpacite = Percent
                        SetPedHeadOverlay(GetPlayerPed(-1), 4, MaquillageYeuxStyle, MaquillageYeuxOpacite)
                    end
                end)
                RageUI.ColourPanel("Couleur principale", RageUI.PanelColour.HairCut, colorsPanel.makeup[1], MaquillageYeuxCouleurIndex or 1, function(Hovered, Active, MinimumIndex, CurrentIndex)
                    if MaquillageYeuxCouleurIndex ~= CurrentIndex then
                        MaquillageYeuxCouleurIndex = CurrentIndex 
                        MaquillageYeuxCouleur = CurrentIndex-1
                        colorsPanel.makeup[1] = MinimumIndex
                        SetPedHeadOverlayColor(GetPlayerPed(-1), 4, 1, MaquillageYeuxCouleur, MaquillageYeuxCouleurSecondaire)
                    end
                end)
                RageUI.ColourPanel("Couleur secondaire", RageUI.PanelColour.HairCut, colorsPanel.makeup[2], MaquillageYeuxCouleurSecondaireIndex or 1, function(Hovered, Active, MinimumIndex, CurrentIndex)
                    if MaquillageYeuxCouleurSecondaireIndex ~= CurrentIndex then
                        MaquillageYeuxCouleurSecondaireIndex = CurrentIndex 
                        MaquillageYeuxCouleurSecondaire = CurrentIndex-1
                        colorsPanel.makeup[2] = MinimumIndex
                        SetPedHeadOverlayColor(GetPlayerPed(-1), 4, 1, MaquillageYeuxCouleur, MaquillageYeuxCouleurSecondaire)
                    end
                end)
            end
            if self2.FACE_LIPSTICK then
                RageUI.PercentagePanel(RougeALevresOpacite, "Opacité", nil, nil, function(Hovered, Active, Percent)
                    if RougeALevresOpacite ~= Percent then
                        RougeALevresOpacite = Percent
                        SetPedHeadOverlay(GetPlayerPed(-1), 8, RougeALevresStyle, RougeALevresOpacite)
                    end
                end)
                RageUI.ColourPanel("Couleur principale", RageUI.PanelColour.Makeup, colorsPanel.lipstick[1], RougeALevresCouleurIndex or 1, function(Hovered, Active, MinimumIndex, CurrentIndex)
                    if RougeALevresCouleurIndex ~= CurrentIndex then
                        RougeALevresCouleurIndex = CurrentIndex
                        RougeALevresCouleur = CurrentIndex-1
                        colorsPanel.lipstick[1] = MinimumIndex
                        SetPedHeadOverlayColor(GetPlayerPed(-1), 8, 2, RougeALevresCouleur, RougeALevresCouleurSecondaire)
                    end
                end)
                RageUI.ColourPanel("Couleur secondaire", RageUI.PanelColour.Makeup, colorsPanel.lipstick[2], RougeALevresCouleurSecondaireIndex or 1, function(Hovered, Active, MinimumIndex, CurrentIndex)
                    if RougeALevresCouleurSecondaireIndex ~= CurrentIndex then
                        RougeALevresCouleurSecondaireIndex = CurrentIndex
                        RougeALevresCouleurSecondaire = CurrentIndex-1
                        colorsPanel.lipstick[2] = MinimumIndex
                        SetPedHeadOverlayColor(GetPlayerPed(-1), 8, 2, RougeALevresCouleur, RougeALevresCouleurSecondaire)
                    end
                end)
            end
        end)
    end
end)

AddEventHandler("InitialCore:CreateSignCharCre", function()
    if SignProp1 ~= nil then
        DeleteObject(SignProp1)
    end
    if SignProp2 ~= nil then
        DeleteObject(SignProp2)
    end
    SignProp1 = CreateObject(signmodel, 1, 1, 1, false, true, false)
    SignProp2 = CreateObject(textmodel, 1, 1, 1, false, true, false)

    AttachEntityToEntity(SignProp1, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 58868), 0.12, 0.24, 0.0, 5.0, 0.0, 70.0, true, true, false, false, 2, true);
    AttachEntityToEntity(SignProp2, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 58868), 0.12, 0.24, 0.0, 5.0, 0.0, 70.0, true, true, false, false, 2, true);

    local ScaleformMovie = RequestScaleformMovie("MUGSHOT_BOARD_01")

    while not HasScaleformMovieLoaded(scaleform) do
        Citizen.Wait(0)
    end

    while HasScaleformMovieLoaded(scaleform) do
        Citizen.Wait(0)
        PushScaleformMovieFunction(ScaleformMovie, "SET_BOARD")
        PushScaleformMovieFunctionParameterString("Chômeur")
        PushScaleformMovieFunctionParameterString("Initial V")
        PushScaleformMovieFunctionParameterString("LOS SANTOS POLICE DEPT")
        PushScaleformMovieFunctionParameterString("100$")
        PushScaleformMovieFunctionParameterString(0)
        PushScaleformMovieFunctionParameterString(5)
        PushScaleformMovieFunctionParameterString(0)
        PopScaleformMovieFunctionVoid()
    end
end)