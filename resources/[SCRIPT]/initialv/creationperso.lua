------------------------------------------------------------------------------
--
-- Ce travail est sous liscence:
-- Creative Commons Attribution-NonCommercial-NoDerivatives-NoDistribution 4.0 International License.
--
------------------------------------------------------------------------------

charcreaMenu = NativeUI.CreateMenu("","Nouveau personnage")
_menuPool:Add(charcreaMenu)

local BlockKey = false
local PlayerRotation = 180.0

-- DECLARATION VARIABLE FINAL
 Prenom = nil
 Nom = nil
 JourDeNaissance = 1
 MoisDeNaissance = 'Janvier'
 AnneeDeNaissance = 1920
 Taille = 130
 Poids = 40

 PlayerUsePed

 SelectedMere = 1
 SelectedPere = 1
 ShapeMix = 0.5
 SkinMix = 0.5
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
 CheuveuxStyle = 0
 CheuveuxCouleur = 0
 SourcilsStyle = -1
 SourcilsOpacite = 1.0
 SourcilsCouleur = 0
 PilositeStyle = -1
 PilositeOpacite = 1.0
 PilositeCouleur = 0
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
 RougeALevresStyle = -1
 RougeALevresOpacite = 1.0
 RougeALevresCouleur = 0

function CharCreatorMenu(menu)
    --local GetPlayerPed(-1) = GetPlayerPed(-1)

    local ListJours = {}

    for i = 1, 31 do
        table.insert(ListJours, i)
    end

    local ListMois = {"Janvier", "Février ", "Mars", "Avril", "Mai", "Juin", "Juillet", "Août ", "Septembre", "Octobre", "Novembre", "Decembre"}

    local ListAnnee = {}

    for i = 1920, 2005 do
        table.insert(ListAnnee, i)
    end

    local ListTaille = {}

    for i = 130, 220 do
        table.insert(ListTaille, i)
    end

    local ListPoids = {}

    for i = 40, 180 do
        table.insert(ListPoids, i)
    end

    local PrenomItem = NativeUI.CreateItem("Prénom", "Choisisez le prénom de votre personnage RP")
    local NomItem = NativeUI.CreateItem("Nom de famille", "Choisisez le nom de famille de votre personnage RP")
    local TailleItem = NativeUI.CreateListItem("Taille", ListTaille, 1, "Choisisez la taille de votre personnage RP")
    local PoidsItem = NativeUI.CreateListItem("Poids", ListPoids, 1, "Choisisez le poids de votre personnage RP")
    PrenomItem:RightLabel("Choisir >")
    NomItem:RightLabel("Choisir >")
    menu:AddItem(PrenomItem)
    menu:AddItem(NomItem)
    local DateDeNaissanceMenu = _menuPool:AddSubMenu(menu, "Date de naissance", "Choisisez la date de naissance de votre personnage RP.")
    DateDeNaissanceMenu.Item:RightLabel("Choisir >")
    local JourDeNaissanceItem = NativeUI.CreateListItem("Jour de naissance", ListJours, 1, "Description")
    DateDeNaissanceMenu.SubMenu:AddItem(JourDeNaissanceItem)
    local MoisDeNaissanceItem = NativeUI.CreateListItem("Mois de naissance", ListMois, 1, "Description")
    DateDeNaissanceMenu.SubMenu:AddItem(MoisDeNaissanceItem)
    local AnneeDeNaissanceItem = NativeUI.CreateListItem("Année de naissance", ListAnnee, 1, "Description")
    DateDeNaissanceMenu.SubMenu:AddItem(AnneeDeNaissanceItem)
    menu:AddItem(TailleItem)
    menu:AddItem(PoidsItem)

    menu.OnItemSelect = function(menu, item)
        if item == PrenomItem then
            local result = KeyboardInput("", 30)
            if result ~= nil then
                Prenom = result
                PrenomItem:RightLabel(Prenom)
            end
        elseif item == NomItem then
            local result = KeyboardInput("", 30)
            if result ~= nil then
                Nom = result
                NomItem:RightLabel(Nom)
            end
        end
    end
    DateDeNaissanceMenu.SubMenu.OnListChange = function(sender, item, index)
        local currentSelectedIndex = item:IndexToItem(index)
        if item == JourDeNaissanceItem then
            JourDeNaissance = currentSelectedIndex
        elseif item == MoisDeNaissanceItem then
            MoisDeNaissance = currentSelectedIndex
        elseif item == AnneeDeNaissanceItem then
            AnneeDeNaissance = currentSelectedIndex
        end
        DateDeNaissanceMenu.Item:RightLabel(JourDeNaissance .. " " .. MoisDeNaissance .. " " .. AnneeDeNaissance)
    end
    menu.OnListChange = function(sender, item, index)
        local currentSelectedIndex = item:IndexToItem(index)
        if item == TailleItem then
            Taille = currentSelectedIndex
        elseif item == PoidsItem then
            Poids = currentSelectedIndex
        end
    end
    
    local choixfreemodeorpedMenu = _menuPool:AddSubMenu(menu, "Choix du personnage", "Continuer la création de votre personnage.")
    choixfreemodeorpedMenu.Item:RightLabel("Suivant >")

    local selectFreemodeMenu = _menuPool:AddSubMenu(choixfreemodeorpedMenu.SubMenu, "Création de personnage", "Crééer son propre personnage.")
    local selectCustomPedMenu = _menuPool:AddSubMenu(choixfreemodeorpedMenu.SubMenu, "Personnage prédéfinis", "Choisir un personnage prédéfinis.")

    choixfreemodeorpedMenu.SubMenu.OnItemSelect = function(menu, item)
        if item == selectFreemodeMenu then
            PlayerUsePed = false
        elseif item == selectCustomPedMenu then
            PlayerUsePed = true
        end
    end



    -- ## a finir











    -- ## ZZ

    local Mere = {"Hannah", "Aubrey", "Jasmine", "Gisele", "Amelia", "Isabella", "Zoe", "Ava", "Camila", "Violet", "Sophia", "Evelyn", "Nicole", "Ashley", "Gracie", "Brianna", "Natalie", "Olivia", "Elizabeth", "Charlotte", "Emma"}
    local Pere = {"Benjamin", "Daniel", "Joshua", "Noah", "Andrew", "Juan", "Alex", "Isaac", "Evan", "Ethan", "Vincent", "Angel", "Diego", "Adrian", "Gabriel", "Michael", "Santiago", "Kevin", "Louis", "Samuel", "Anthony", " Claude", "Niko"}

    herediteMenu = _menuPool:AddSubMenu(selectFreemodeMenu.SubMenu, "Hérédité", "Déterminez l'hérédité de votre personnage.")

    local heritageWindow = NativeUI.CreateHeritageWindow(SelectedMere, SelectedPere)
    herediteMenu.SubMenu:AddWindow(heritageWindow)

    local MereListItem = NativeUI.CreateListItem("Mère", Mere, 1, "Choisissez votre mère.")
    local PereListItem = NativeUI.CreateListItem("Père", Pere, 1, "Choisissez votre père.")
    herediteMenu.SubMenu:AddItem(MereListItem)
    herediteMenu.SubMenu:AddItem(PereListItem)
    herediteMenu.SubMenu.OnListChange = function(sender, item, index)
        if item == MereListItem then
            SelectedMere = index
        else
            SelectedPere = index
        end
        heritageWindow:Index(SelectedMere, SelectedPere)
        SetPedHeadBlendData(GetPlayerPed(-1), SelectedMere, SelectedPere, nil, SelectedMere, SelectedPere, nil, ShapeMix, SkinMix, nil, true)
    end

    local amountShape = {}
    for i = 1, 11 do amountShape[i] = i end
    local shapeItem = NativeUI.CreateSliderHeritageItem("Ressemblance", amountShape, 5.5, "Déterminez qui de votre père ou de votre mère a le plus d'influence sur la forme de votre visage.")
    herediteMenu.SubMenu:AddItem(shapeItem)
    local amountSkin = {}
    for i = 1, 11 do amountSkin[i] = i end
    local skinItem = NativeUI.CreateSliderHeritageItem("Couleur de peau", amountSkin, 5.5, "Déterminez qui de votre père ou de votre mère a le plus d'influence sur la couleur de votre peau.")
    herediteMenu.SubMenu:AddItem(skinItem)
    herediteMenu.SubMenu.OnSliderChange = function(sender, item, index)
        if item == shapeItem then
            ShapeMix = index/10
            ShapeMix = ShapeMix-0.1
        else
            SkinMix = index/10
            SkinMix = SkinMix-0.1
        end
        SetPedHeadBlendData(GetPlayerPed(-1), SelectedMere, SelectedPere, nil, SelectedMere, SelectedPere, nil, ShapeMix, SkinMix, nil, true)
    end

    traitsduvisageMenu = _menuPool:AddSubMenu(selectFreemodeMenu.SubMenu, "Traits du visage", "Déterminez les traits du visage de votre personnage.")

    local BasDuFrontItem =  NativeUI.CreateItem("Bas du front", "Modifez votre visage.")
    local BasDuFrontPanel = NativeUI.CreateGridPanel("Haut", "Intérieur", "Extérieur", "Bas")
    traitsduvisageMenu.SubMenu:AddItem(BasDuFrontItem)
    BasDuFrontItem:AddPanel(BasDuFrontPanel)
    BasDuFrontItem.ActivatedPanel = function(menu, item, panel, panelvalue)
        FrontHeight = panelvalue.Y
        FrontWidth = panelvalue.X
        SetPedFaceFeature(GetPlayerPed(-1), 6, FrontHeight)
        SetPedFaceFeature(GetPlayerPed(-1), 7, FrontWidth)
    end
    
    local EyesItem = NativeUI.CreateItem("Yeux", "Modifez votre visage.")
    local EyesPanel = NativeUI.CreateHorizontalGridPanel("Ouverts", "Plissés")
    traitsduvisageMenu.SubMenu:AddItem(EyesItem)
    EyesItem:AddPanel(EyesPanel)
    EyesItem.ActivatedPanel = function(menu, item, panel, panelvalue)
        Eyes = panelvalue.X
        SetPedFaceFeature(GetPlayerPed(-1), 11, Eyes)
    end

    local NezItem = NativeUI.CreateItem("Nez", "Modifez votre visage.")
    local NezPanel = NativeUI.CreateGridPanel("Relevé", "Fin", "Épais", "Bas")
    traitsduvisageMenu.SubMenu:AddItem(NezItem)
    NezItem:AddPanel(NezPanel)
    NezItem.ActivatedPanel = function(menu, item, panel, panelvalue)
        NozWidth = panelvalue.X
        NozHeight = panelvalue.Y
        SetPedFaceFeature(GetPlayerPed(-1), 0, NozWidth)
        SetPedFaceFeature(GetPlayerPed(-1), 1, NozHeight)
    end

    local AreteNezItem = NativeUI.CreateItem("Arête du nez", "Modifez votre visage.")
    local AreteNezPanel = NativeUI.CreateGridPanel("Saillante", "Longue", "Courte", "Incurvée")
    traitsduvisageMenu.SubMenu:AddItem(AreteNezItem)
    AreteNezItem:AddPanel(AreteNezPanel)
    AreteNezItem.ActivatedPanel = function(menu, item, panel, panelvalue)
        AreteNozWidth = panelvalue.X -- ##//
        AreteNozHeight = panelvalue.Y
        SetPedFaceFeature(GetPlayerPed(-1), 2, AreteNozWidth)
        SetPedFaceFeature(GetPlayerPed(-1), 3, AreteNozHeight)
    end

    local BoutNezItem = NativeUI.CreateItem("Bout du nez", "Modifez votre visage.")
    local BoutNezPanel = NativeUI.CreateGridPanel("Bout vers le haut", "Cassé droite", "Cassé gauche", "Bout vers le bas")
    traitsduvisageMenu.SubMenu:AddItem(BoutNezItem)
    BoutNezItem:AddPanel(BoutNezPanel)
    BoutNezItem.ActivatedPanel = function(menu, item, panel, panelvalue)
        BoutNozHauteur = panelvalue.Y
        BoutNozCasse = panelvalue.X
        SetPedFaceFeature(GetPlayerPed(-1), 4, BoutNozHauteur)
        SetPedFaceFeature(GetPlayerPed(-1), 5, BoutNozCasse)
    end

    local PommettesItem = NativeUI.CreateItem("Pommettes", "Modifez votre visage.")
    local PommettesPanel = NativeUI.CreateGridPanel("Haut", "Intérieur", "Extérieur", "Bas")
    traitsduvisageMenu.SubMenu:AddItem(PommettesItem)
    PommettesItem:AddPanel(PommettesPanel)
    PommettesItem.ActivatedPanel = function(menu, item, panel, panelvalue)
        PommettesHeight = panelvalue.Y
        PommettesWidth = panelvalue.X
        SetPedFaceFeature(GetPlayerPed(-1), 8, PommettesHeight)
        SetPedFaceFeature(GetPlayerPed(-1), 9, PommettesWidth)
    end

    local JouesItem = NativeUI.CreateItem("Joues", "Modifez votre visage.")
    local JouesPanel = NativeUI.CreateHorizontalGridPanel("Bouffi", "Émacié")
    traitsduvisageMenu.SubMenu:AddItem(JouesItem)
    JouesItem:AddPanel(JouesPanel)
    JouesItem.ActivatedPanel = function(menu, item, panel, panelvalue)
        JouesWidth = panelvalue.X
        SetPedFaceFeature(GetPlayerPed(-1), 10, JouesWidth)
    end

    local LevresItem = NativeUI.CreateItem("Lèvres", "Modifez votre visage.")
    local LevresPanel = NativeUI.CreateHorizontalGridPanel("Épaisses", "Minces")
    traitsduvisageMenu.SubMenu:AddItem(LevresItem)
    LevresItem:AddPanel(LevresPanel)
    LevresItem.ActivatedPanel = function(menu, item, panel, panelvalue)
        LevresWidth = panelvalue.X
        SetPedFaceFeature(GetPlayerPed(-1), 12, LevresWidth)
    end

    local MachoireItem = NativeUI.CreateItem("Mâchoire", "Modifez votre visage.")
    local MachoirePanel = NativeUI.CreateGridPanel("Ronde", "Étroite", "Large", "Carrée")
    traitsduvisageMenu.SubMenu:AddItem(MachoireItem)
    MachoireItem:AddPanel(MachoirePanel)
    MachoireItem.ActivatedPanel = function(menu, item, panel, panelvalue)
        MachoireHeight = panelvalue.Y
        MachoireWidth = panelvalue.X
        SetPedFaceFeature(GetPlayerPed(-1), 13, MachoireHeight)
        SetPedFaceFeature(GetPlayerPed(-1), 14, MachoireWidth)
    end

    local ProfilMentonItem = NativeUI.CreateItem("Profil menton", "Modifez votre visage.")
    local ProfilMentonPanel = NativeUI.CreateGridPanel("Haut", "Intérieur", "Extérieur", "Bas")
    traitsduvisageMenu.SubMenu:AddItem(ProfilMentonItem)
    ProfilMentonItem:AddPanel(ProfilMentonPanel)
    ProfilMentonItem.ActivatedPanel = function(menu, item, panel, panelvalue)
        MentonHeight = panelvalue.Y
        MentonPosition = panelvalue.X
        SetPedFaceFeature(GetPlayerPed(-1), 15, MentonHeight)
        SetPedFaceFeature(GetPlayerPed(-1), 16, MentonPosition)
    end

    local FormeMentonItem = NativeUI.CreateItem("Forme du menton", "Modifez votre visage.")
    local FormeMentonPanel = NativeUI.CreateGridPanel("Arrondi", "Pointu", "Carré", "Fossette")
    traitsduvisageMenu.SubMenu:AddItem(FormeMentonItem)
    FormeMentonItem:AddPanel(FormeMentonPanel)
    FormeMentonItem.ActivatedPanel = function(menu, item, panel, panelvalue)
        MentonShape = panelvalue.X
        MentonWidth = panelvalue.Y
        SetPedFaceFeature(GetPlayerPed(-1), 17, MentonShape)
        SetPedFaceFeature(GetPlayerPed(-1), 18, MentonWidth)
    end

    apparenceMenu = _menuPool:AddSubMenu(selectFreemodeMenu.SubMenu, "Apparence", "Déterminez l'apparence visage de votre personnage.")

    local CoupeNom = {
        "Rasé ",
        "Côtés rasés   ",
        "Crête ",
        "Coupe hipster",
        "Raie sur le côté  ",
        "Coupe courte",
        "Coupe biker",
        "Queue de cheval",
        "Nattes tressées ",
        "Cheuveux gominés ",
        "Brosse",
        "Cheveux hérissés",
        "Coupe césar",
        "Coupe inégale",
        "Dreadlocks",
        "Cheuveux longs",
        "Boucles ébouriffées",
        "Surfeur",
        "Court, raie sur le côté",
        "Côtés gominés",
        "Cheuveux longs gominés",
        "Jeune hipster" -- ## a finir
    }

    local CheveuxStyleItem = NativeUI.CreateListItem("Coiffure", CoupeNom, 1, 'Changez votre apparence.' )
    local CheuveuxCouleurPanel = NativeUI.CreateColourPanel("Couleur", ColoursPanel.HairCut)
    CheveuxStyleItem:AddPanel(CheuveuxCouleurPanel)
    apparenceMenu.SubMenu:AddItem(CheveuxStyleItem)
    CheveuxStyleItem.OnListChanged = function(ParentMenu, SelectedItem, Index)
        local ActiveItem = SelectedItem:IndexToItem(Index)
        CheuveuxStyle = Index-1
        CheuveuxCouleur = (ActiveItem.Panels and ActiveItem.Panels[1] or 1) - 1
        SetPedComponentVariation(GetPlayerPed(-1), 2, CheuveuxStyle)
        SetPedHairColor(GetPlayerPed(-1), CheuveuxCouleur)
    end

    local SourcilsNom = {
        "Joints",
        "Effilés",
        "Triples",
        "Arqués",
        "Coupés",
        "Estompés",
        "Simples",
        "Équilibre",
        "Mode",
        "Cléopâtre",
        "Perplexes",
        "Féminins",
        "Séduction",
        "Froncés",
        "Pouffe",
        "Triomphe",
        "Insouciance",
        "Arrondis",
        "Rongeur",
        "Doubles",
        "Minces",
        "Dessinés",
        "Épilés",
        "Droits et fins",
        "Naturels",
        "Frisotants",
        "Négligés",
        "Chenille",
        "Réguliers",
        "Méditerranéens",
        "Soignés",
        "Épais",
        "Plumes",
        "Hérissés" -- ## fin?
    }

    local SourcilsStyleItem = NativeUI.CreateListItem("Sourcils", SourcilsNom, 1, 'Changez votre apparence.' )
    local SourcilsOpaciteItem = NativeUI.CreatePercentagePanel("0%", "Opacité", "100%")
    local SourcilsCouleurPanel = NativeUI.CreateColourPanel("Couleur", ColoursPanel.HairCut)
    SourcilsStyleItem:AddPanel(SourcilsOpaciteItem)
    SourcilsStyleItem:AddPanel(SourcilsCouleurPanel)
    apparenceMenu.SubMenu:AddItem(SourcilsStyleItem)
    SourcilsStyleItem.OnListChanged = function(ParentMenu, SelectedItem, Index)
        local ActiveItem = SelectedItem:IndexToItem(Index)
        SourcilsStyle = Index-2
        SourcilsOpacite = (ActiveItem.Panels and ActiveItem.Panels[1] or 1.0)
        SourcilsCouleur = (ActiveItem.Panels and ActiveItem.Panels[2] or 1) -1
        SetPedHeadOverlay(GetPlayerPed(-1), 2, SourcilsStyle, SourcilsOpacite)
        SetPedHeadOverlayColor(GetPlayerPed(-1), 2, 1, SourcilsCouleur, 0)
    end

    local PilositeNom = {
        ".",
        ".",
        ".",
        ".",
        ".",
        ".",
        "." -- ## a continuer
    }

    local PilositeStyleItem = NativeUI.CreateListItem("Pilosité faciale", PilositeNom, 1, 'Changez votre apparence.' )
    local PilositeOpaciteItem = NativeUI.CreatePercentagePanel("0%", "Opacité", "100%")
    local PilositeCouleurPanel = NativeUI.CreateColourPanel("Couleur", ColoursPanel.HairCut)
    PilositeStyleItem:AddPanel(PilositeOpaciteItem)
    PilositeStyleItem:AddPanel(PilositeCouleurPanel)
    apparenceMenu.SubMenu:AddItem(PilositeStyleItem)
    PilositeStyleItem.OnListChanged = function(ParentMenu, SelectedItem, Index)
        local ActiveItem = SelectedItem:IndexToItem(Index)
        PilositeStyle = Index-2
        PilositeOpacite = (ActiveItem.Panels and ActiveItem.Panels[1] or 1.0)
        PilositeCouleur = (ActiveItem.Panels and ActiveItem.Panels[2] or 1) -1
        SetPedHeadOverlay(GetPlayerPed(-1), 1, PilositeStyle, PilositeOpacite)
        SetPedHeadOverlayColor(GetPlayerPed(-1), 1, 1, PilositeCouleur, 0)
    end

    local ProblemePeauNom = {
        ".",
        ".",
        ".",
        ".",
        ".",
        ".",
        "." -- ## a continuer
    }

    local ProblemePeauStyleItem = NativeUI.CreateListItem("Problèmes peau", ProblemePeauNom, 1, 'Changez votre apparence.' )
    local ProblemePeauOpaciteItem = NativeUI.CreatePercentagePanel("0%", "Opacité", "100%")
    ProblemePeauStyleItem:AddPanel(ProblemePeauOpaciteItem)
    apparenceMenu.SubMenu:AddItem(ProblemePeauStyleItem)
    ProblemePeauStyleItem.OnListChanged = function(ParentMenu, SelectedItem, Index)
        local ActiveItem = SelectedItem:IndexToItem(Index)
        ProblemePeauStyle = Index-2
        ProblemePeauOpacite = (ActiveItem.Panels and ActiveItem.Panels[1] or 1.0)
        SetPedHeadOverlay(GetPlayerPed(-1), 0, ProblemePeauStyle, ProblemePeauOpacite)
    end

    local VieillissementNom = {
        ".",
        ".",
        ".",
        ".",
        ".",
        ".",
        "." -- ## a continuer
    }

    local VieillissementStyleItem = NativeUI.CreateListItem("Signes de vieillissement", VieillissementNom, 1, 'Changez votre apparence.' )
    local VieillissementOpaciteItem = NativeUI.CreatePercentagePanel("0%", "Opacité", "100%")
    VieillissementStyleItem:AddPanel(VieillissementOpaciteItem)
    apparenceMenu.SubMenu:AddItem(VieillissementStyleItem)
    VieillissementStyleItem.OnListChanged = function(ParentMenu, SelectedItem, Index)
        local ActiveItem = SelectedItem:IndexToItem(Index)
        VieillissementStyle = Index-2
        VieillissementOpacite = (ActiveItem.Panels and ActiveItem.Panels[1] or 1.0)
        SetPedHeadOverlay(GetPlayerPed(-1), 3, VieillissementStyle, VieillissementOpacite)
    end

    local TeintNom = {
        ".",
        ".",
        ".",
        ".",
        ".",
        ".",
        "." -- ## a continuer
    }

    local TeintStyleItem = NativeUI.CreateListItem("Teint", TeintNom, 1, 'Changez votre apparence.' )
    local TeintOpaciteItem = NativeUI.CreatePercentagePanel("0%", "Opacité", "100%")
    TeintStyleItem:AddPanel(TeintOpaciteItem)
    apparenceMenu.SubMenu:AddItem(TeintStyleItem)
    TeintStyleItem.OnListChanged = function(ParentMenu, SelectedItem, Index)
        local ActiveItem = SelectedItem:IndexToItem(Index)
        TeintStyle = Index-2
        TeintOpacite = (ActiveItem.Panels and ActiveItem.Panels[1] or 1.0)
        SetPedHeadOverlay(GetPlayerPed(-1), 6, TeintStyle, TeintOpacite)
    end

    local TachesCutaneesNom = {
        ".",
        ".",
        ".",
        ".",
        ".",
        ".",
        "." -- ## a continuer
    }

    local TachesCutaneesStyleItem = NativeUI.CreateListItem("Taches Cutanées", TachesCutaneesNom, 1, 'Changez votre apparence.' )
    local TachesCutaneesOpaciteItem = NativeUI.CreatePercentagePanel("0%", "Opacité", "100%")
    TachesCutaneesStyleItem:AddPanel(TachesCutaneesOpaciteItem)
    apparenceMenu.SubMenu:AddItem(TachesCutaneesStyleItem)
    TachesCutaneesStyleItem.OnListChanged = function(ParentMenu, SelectedItem, Index)
        local ActiveItem = SelectedItem:IndexToItem(Index)
        TachesCutaneesStyle = Index-2
        TachesCutaneesOpacite = (ActiveItem.Panels and ActiveItem.Panels[1] or 1.0)
        SetPedHeadOverlay(GetPlayerPed(-1), 9, TachesCutaneesStyle, TachesCutaneesOpacite)
    end

    local AspectPeauNom = {
        ".",
        ".",
        ".",
        ".",
        ".",
        ".",
        "." -- ## a continuer
    }

    local AspectPeauStyleItem = NativeUI.CreateListItem("Aspect de la peau", AspectPeauNom, 1, 'Changez votre apparence.' )
    local AspectPeauOpaciteItem = NativeUI.CreatePercentagePanel("0%", "Opacité", "100%")
    AspectPeauStyleItem:AddPanel(AspectPeauOpaciteItem)
    apparenceMenu.SubMenu:AddItem(AspectPeauStyleItem)
    AspectPeauStyleItem.OnListChanged = function(ParentMenu, SelectedItem, Index)
        local ActiveItem = SelectedItem:IndexToItem(Index)
        AspectPeauStyle = Index-2
        AspectPeauOpacite = (ActiveItem.Panels and ActiveItem.Panels[1] or 1.0)
        SetPedHeadOverlay(GetPlayerPed(-1), 7, AspectPeauStyle, AspectPeauOpacite)
    end

    local CouleurYeuxNom = {
        ".",
        ".",
        ".",
        ".",
        ".",
        ".",
        ".",
        ".",
        ".",
        ".",
        ".",
        ".",
        ".",
        ".",
        ".",
        ".",
        ".",
        "." -- ## a continuer
    }

    local CouleurYeuxStyleItem = NativeUI.CreateListItem("Couleur des yeux", CouleurYeuxNom, 1, 'Changez votre apparence.' )
    apparenceMenu.SubMenu:AddItem(CouleurYeuxStyleItem)
    apparenceMenu.SubMenu.OnListChange = function(sender, item, index)
        if item == CouleurYeuxStyleItem then
            CouleurYeux = index-2
            SetPedEyeColor(GetPlayerPed(-1), CouleurYeux)	
        end
    end

    local MaquillageYeuxNom = {
        ".",
        ".",
        ".",
        ".",
        ".",
        ".",
        "." -- ## a continuer
    }

    local MaquillageYeuxStyleItem = NativeUI.CreateListItem("Maquillage yeux", MaquillageYeuxNom, 1, 'Changez votre apparence.' )
    local MaquillageYeuxOpaciteItem = NativeUI.CreatePercentagePanel("0%", "Opacité", "100%")
    MaquillageYeuxStyleItem:AddPanel(MaquillageYeuxOpaciteItem)
    apparenceMenu.SubMenu:AddItem(MaquillageYeuxStyleItem)
    MaquillageYeuxStyleItem.OnListChanged = function(ParentMenu, SelectedItem, Index)
        local ActiveItem = SelectedItem:IndexToItem(Index)
        MaquillageYeuxStyle = Index-2
        MaquillageYeuxOpacite = (ActiveItem.Panels and ActiveItem.Panels[1] or 1.0)
        SetPedHeadOverlay(GetPlayerPed(-1), 4, MaquillageYeuxStyle, MaquillageYeuxOpacite)
    end

    local RougeALevresNom = {
        ".",
        ".",
        ".",
        ".",
        ".",
        ".",
        "." -- ## a continuer
    }

    local RougeALevresStyleItem = NativeUI.CreateListItem("Rouge à lèvres", RougeALevresNom, 1, 'Changez votre apparence.' )
    local RougeALevresOpaciteItem = NativeUI.CreatePercentagePanel("0%", "Opacité", "100%")
    local RougeALevresCouleurPanel = NativeUI.CreateColourPanel("Couleur", ColoursPanel.Makeup)
    RougeALevresStyleItem:AddPanel(RougeALevresOpaciteItem)
    RougeALevresStyleItem:AddPanel(RougeALevresCouleurPanel)
    apparenceMenu.SubMenu:AddItem(RougeALevresStyleItem)
    RougeALevresStyleItem.OnListChanged = function(ParentMenu, SelectedItem, Index)
        local ActiveItem = SelectedItem:IndexToItem(Index)
        RougeALevresStyle = Index-2
        RougeALevresOpacite = (ActiveItem.Panels and ActiveItem.Panels[1] or 1.0)
        RougeALevresCouleur = (ActiveItem.Panels and ActiveItem.Panels[2] or 1) -1
        SetPedHeadOverlay(GetPlayerPed(-1), 8, RougeALevresStyle, RougeALevresOpacite)
        SetPedHeadOverlayColor(GetPlayerPed(-1), 8, 2, RougeALevresCouleur, 0)
    end

    --local vetementsMenu = _menuPool:AddSubMenu(menu, "Vêtements", "Changez vos vêtements.")

    local ConfirmItem = NativeUI.CreateColouredItem("Savegarder et continuer", "Êtes-vous prêt à jouer à InitialV ?", Colours.Blue, Colours.Blue)
    selectFreemodeMenu.SubMenu:AddItem(ConfirmItem)
    selectFreemodeMenu.SubMenu.OnItemSelect = function(menu, item)
       if item == Item then
       -- Perform your actions here.
       end
    end
end

CharCreatorMenu(charcreaMenu)
_menuPool:RefreshIndex()

local function ButtonMessage(text)
    BeginTextCommandScaleformString("STRING")
    AddTextComponentScaleform(text)
    EndTextCommandScaleformString()
end
local function Button(ControlButton)
    N_0xe83a3e3557a56640(ControlButton)
end
local function setupScaleform(scaleform)
    local scaleform = RequestScaleformMovie(scaleform)
    while not HasScaleformMovieLoaded(scaleform) do
        Citizen.Wait(0)
    end
    PushScaleformMovieFunction(scaleform, "CLEAR_ALL")
    PopScaleformMovieFunctionVoid()
    
    PushScaleformMovieFunction(scaleform, "SET_CLEAR_SPACE")
    PushScaleformMovieFunctionParameterInt(200)
    PopScaleformMovieFunctionVoid()

    PushScaleformMovieFunction(scaleform, "SET_DATA_SLOT")
    PushScaleformMovieFunctionParameterInt(1)
    Button(GetControlInstructionalButton(1, 44, true))
    ButtonMessage("Choisir")
    PopScaleformMovieFunctionVoid()

    PushScaleformMovieFunction(scaleform, "SET_DATA_SLOT")
    PushScaleformMovieFunctionParameterInt(2)
    Button(GetControlInstructionalButton(1, 44, true))
    ButtonMessage("Retour")
    PopScaleformMovieFunctionVoid()

    PushScaleformMovieFunction(scaleform, "SET_DATA_SLOT")
    PushScaleformMovieFunctionParameterInt(3)
    Button(GetControlInstructionalButton(1, 10, true))
    Button(GetControlInstructionalButton(1, 11, true))
    ButtonMessage("Couleur")
    PopScaleformMovieFunctionVoid()

    PushScaleformMovieFunction(scaleform, "SET_DATA_SLOT")
    PushScaleformMovieFunctionParameterInt(4)
    Button(GetControlInstructionalButton(1, 1, true))
    ButtonMessage("Changer l'opacité")
    PopScaleformMovieFunctionVoid()

    PushScaleformMovieFunction(scaleform, "SET_DATA_SLOT")
    PushScaleformMovieFunctionParameterInt(5)
    Button(GetControlInstructionalButton(1, 46, true))
    ButtonMessage("Tourner à droite")
    PopScaleformMovieFunctionVoid()

    PushScaleformMovieFunction(scaleform, "SET_DATA_SLOT")
    PushScaleformMovieFunctionParameterInt(6)
    Button(GetControlInstructionalButton(1, 44, true))
    ButtonMessage("Tourner à gauche")
    PopScaleformMovieFunctionVoid()

    PushScaleformMovieFunction(scaleform, "DRAW_INSTRUCTIONAL_BUTTONS")
    PopScaleformMovieFunctionVoid()

    PushScaleformMovieFunction(scaleform, "SET_BACKGROUND_COLOUR")
    PushScaleformMovieFunctionParameterInt(0)
    PushScaleformMovieFunctionParameterInt(0)
    PushScaleformMovieFunctionParameterInt(0)
    PushScaleformMovieFunctionParameterInt(80)
    PopScaleformMovieFunctionVoid()

    return scaleform
end
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
end
AddEventHandler('BlockKey', function()
    while BlockKey do
        Citizen.Wait(0)
        DisableAllControlActions(1)
    end
end)
AddEventHandler('StartCreation', function()
    local Enabled = true
    SetEntityCoords(PlayerPedId(), 409.42, -1001.14, -99.90, 0.0, 0.0, 0.0, true)
    Wait(250)
    SetEntityHeading(PlayerPedId(), 350.0)
    Wait(250)
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
    while Enabled do
        Wait(0)
        RequestAnimDict("mp_character_creation@customise@male_a")
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
    Wait(250)
    cam4 = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", 402.99, -998.02, -98.5, 0.00, 0.00, 0.00, 70.00, false, 0)
    PointCamAtCoord(cam4, 402.99, -998.02, -98.5)
    SetCamActiveWithInterp(cam4, cam3, 5000, true, true)
    DoScreenFadeIn(1000)
    RequestAnimDict("mp_character_creation@customise@male_a")
    TaskPlayAnim(PlayerPedId(), "mp_character_creation@customise@male_a", "intro", 1.0, 1.0, 7000, 0, 1, 0, 0, 0)
    Wait(7000)
    charcreaMenu:Visible(true)
    form = setupScaleform("instructional_buttons")
    cam5 = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", 402.8, -997.5, -98.3, 0.00, 0.00, 0.00, 70.00, false, 0)
    PointCamAtCoord(cam5, 402.8, -997.5, -98.3)
    local CamTete = false
    local CamGlobal = true
    Enabled = true
    while Enabled == true do
        Wait(0)
        _menuPool:DisableInstructionalButtons(false)
        DrawScaleformMovieFullscreen(form, 255, 255, 255, 255, 0)
        if (herediteMenu.SubMenu:Visible() or traitsduvisageMenu.SubMenu:Visible() or apparenceMenu.SubMenu:Visible()) then
            if CamGlobal then
                SetCamActiveWithInterp(cam5, cam4, 1000, true, true)
                CamGlobal = false
                CamTete = true
            end
        elseif CamTete then
            SetCamActiveWithInterp(cam4, cam5, 1000, true, true)
            CamGlobal = true
            CamTete = false
        end
        if IsDisabledControlJustPressed(1, 44) and UpdateOnscreenKeyboard() ~= 0 then
            PlayerRotation=PlayerRotation-45.0
            SetPedDesiredHeading(GetPlayerPed(-1), PlayerRotation)
        end
        if IsDisabledControlJustPressed(1, 46) and UpdateOnscreenKeyboard() ~= 0 then
            PlayerRotation=PlayerRotation+45.0
            SetPedDesiredHeading(GetPlayerPed(-1), PlayerRotation)
        end
    end
end)

RegisterCommand('+devcrea', function()
    ToggleCancelEmote(false)
    DoScreenFadeOut(1000)
    Wait(1000)
    LoadFreemode(true)
    BlockKey = true
    TriggerEvent('BlockKey')
    TriggerEvent('StartCreation')
    --charcreaMenu:Visible(not charcreaMenu:Visible())
end, false)
RegisterCommand('-devcrea', function()
end, false)

RegisterKeyMapping('+devcrea', 'DevTool', 'keyboard', ',')