-- Baradin Hold

local L = BigWigs:NewBossLocale("Occu'thar", "frFR")
if L then
	L.shadows_bar = "~Ombres incendiaires"
	L.destruction_bar = "<Explosion des yeux>"
	L.eyes_bar = "~Yeux"

	L.fire_message = "Feu focalisé"
	L.fire_bar = "~Feu focalisé"
end

L = BigWigs:NewBossLocale("Alizabal", "frFR")
if L then
	L.first_ability = "Embrocher ou Haine"
	L.dance_message = "Danse des lames %d sur 3"
end

-- Bastion of Twilight

L = BigWigs:NewBossLocale("Halfus Wyrmbreaker", "frFR")
if L then
	L.strikes_message = "Frappes"
	--L.freed_message = "%s freed %s"
end

L = BigWigs:NewBossLocale("Cho'gall", "frFR")
if L then
	L.orders = "Changements de posture"
	L.orders_desc = "Prévient quand Cho'gall passe en posture Ordres de l'ombre/de la flamme."

	L.worship_cooldown = "~Vénération"

	L.adherent_bar = "Adhérent #%d"
	L.adherent_message = "Arrivée d'un Adhérent (%d) !"
	L.ooze_bar = "Nuée de Sangs #%d"
	L.ooze_message = "Arrivée d'une nuée de Sangs (%d) !"

	L.tentacles_bar = "Apparition de Créations"
	L.tentacles_message = "Créations assombries !"

	L.sickness_message = "Vous ne vous sentez pas bien !"
	L.blaze_message = "Brasier sur vous !"
	L.crash_say = "Déferlante"

	L.fury_message = "Fureur !"
	L.first_fury_soon = "Fureur imminente !"
	L.first_fury_message = "85% - Fureur commence !"

	L.unleashed_shadows = "Ombre vibrante"

	L.phase2_message = "Phase 2 !"
	L.phase2_soon = "Phase 2 imminente !"
end

L = BigWigs:NewBossLocale("Valiona and Theralion", "frFR")
if L then
	L.phase_switch = "Changement de phase"
	L.phase_switch_desc = "Prévient quand la rencontre change de phase."

	L.phase_bar = "%s atterrit"
	L.breath_message = "Arrivée des Souffles profonds !"
	L.dazzling_message = "Arrivée des zones tourbillonnantes !"

	L.blast_message = "Déflagration"
	L.engulfingmagic_say = "Magie"

	L.valiona_trigger = "Theralion, je m'occupe du vestibule. Couvre leur fuite !" -- à vérifier

	L.twilight_shift = "Transferts"
end

L = BigWigs:NewBossLocale("Sinestra", "frFR")
if L then
	L.whelps = "Dragonnets"
	L.whelps_desc = "Prévient de l'arrivée des vagues de dragonnets."

	L.slicer_message = "Cibles probables des orbes"

	L.egg_vulnerable = "C'est l'heure de l'omelette !"

	L.whelps_trigger = "Mangez, mes enfants !"
	L.omelet_trigger = "Vous avez cru à une marque de faiblesse ?"

	L.phase13 = "Phase 1 et 3"
	L.phase = "Phase"
	L.phase_desc = "Prévient quand la rencontre entre dans une nouvelle phase."
end

L = BigWigs:NewBossLocale("Ascendant Council", "frFR")
if L then
	L.health_report = "%s est à %d%%, changement de phase imminent !"
	L.switch = "Changement"
	L.switch_desc = "Prévient quand les boss échangent leurs places."

	L.shield_up_message = "Bouclier en place !"
	L.shield_down_message = "Bouclier dissipé !"
	L.shield_bar = "Bouclier"

	L.switch_trigger = "Nous allons nous occuper d'eux !" -- à vérifier

	L.thundershock_quake_soon = "%s dans 10 sec. !"

	L.quake_trigger = "Le sol sous vos pieds gronde avec menace..." -- à vérifier
	L.thundershock_trigger = "L'air qui vous entoure crépite d'énergie..." -- à vérifier

	L.thundershock_quake_spam = "%s dans %d"

	L.last_phase_trigger = "Quelle démonstration impressionnante" -- "CONTEMPLEZ VOTRE DESTIN !" -- à vérifier
end

-- Blackwing Descent

L = BigWigs:NewBossLocale("Magmaw", "frFR")
if L then
	L.stage2_yell_trigger = "Inconcevable" -- Inconcevable ! Vous pourriez vraiment vaincre mon ver de lave ! Je devrais peut-être... faire pencher la balance.

	L.slump = "Affalement"
	L.slump_desc = "Prévient quand le boss s'affale vers l'avant et s'expose, permettant ainsi au rodéo de commencer."
	L.slump_bar = "Rodéo"
	L.slump_message = "Yeehaw, chevauchez !"
end

L = BigWigs:NewBossLocale("Omnotron Defense System", "frFR")
if L then
	L.nef = "Seigneur Victor Nefarius"
	L.nef_desc = "Prévient quand le Seigneur Victor Nefarius utilise une technique."

	L.pool_explosion = "Générateur instable"
	L.incinerate = "Incinérer"
	L.flamethrower = "Lance-flammes"
	L.lightning = "Foudre"
	L.infusion = "Infusion"
end

L = BigWigs:NewBossLocale("Atramedes", "frFR")
if L then
	L.obnoxious_fiend = "Démon odieux" -- NPC ID 49740
	--L.circles = "Circles"
end

L = BigWigs:NewBossLocale("Maloriak", "frFR")
if L then
	L.flames = "Flammes"
end

L = BigWigs:NewBossLocale("Nefarian", "frFR")
if L then
	L.discharge = "Décharge"
	L.stage3_yell_trigger = "VOUS TUER TOUS" -- J’ai tout fait pour être un hôte accommodant, mais vous ne daignez pas mourir ! Oublions les bonnes manières et passons aux choses sérieuses… VOUS TUER TOUS !
end

-- Dragon Soul

L = BigWigs:NewBossLocale("Morchok", "frFR")
if L then
	L.engage_trigger = "Vous cherchez à arrêter l'avalanche. Je vais vous ensevelir."

	L.crush_desc = "Compte les cumuls d'Ecraser armure et affiche une barre de durée."

	L.blood = "Sang noir"

	L.explosion = "Explosion"
	L.crystal = "Cristal"
end

L = BigWigs:NewBossLocale("Warlord Zon'ozz", "frFR")
if L then
	L.engage_trigger = "Zzof Shuul'wah. Thoq fssh N'Zoth!"

	L.ball = "Boule de Vide"
	L.ball_desc = "Boule de Vide qui rebondit contre les joueurs et le boss."
	L.ball_yell = "Gul'kafh an'qov N'Zoth."

	--L.ball_active = "Void ball active"
	--L.ball_active_desc = "Timer for when the void ball activates (i.e. it can bounce)."

	L.bounce = "Rebond de la Boule de Vide"
	L.bounce_desc = "Compteur des rebonds de la Boule de Vide."

	L.darkness = "Ténèbres"
	L.darkness_desc = "Cette phase commence quand la Boule de Vide touche le boss."

	L.shadows = "Ombres"

	L.custom_off_shadows_marker = "Disrupting Shadows marker"
	L.custom_off_shadows_marker_desc = "Mark Disrupting Shadows targets with {rt1}{rt2}{rt3}, requires promoted or leader.\n|cFFFF0000Only 1 person in the raid should have this enabled to prevent marking conflicts.|r"
end

L = BigWigs:NewBossLocale("Yor'sahj the Unsleeping", "frFR")
if L then
	L.engage_trigger = "Iilth qi'uothk shn'ma yeh'glu Shath'Yar! H'IWN IILTH!"

	L.bolt_desc = "Compte les cumuls d'Eclairs de Vide et affiche une barre de durée."
	L.bolt_message = "%2$dx Éclair sur %1$s"

	L.blue = "|cFF0080FFBleu|r"
	L.green = "|cFF088A08Vert|r"
	L.purple = "|cFF9932CDViolet|r"
	L.yellow = "|cFFFFA901Jaune|r"
	L.black = "|cFF424242Noir|r"
	L.red = "|cFFFF0404Rouge|r"

	L.blobs = "Globules"
	L.blobs_bar = "Prochains globules"
	L.blobs_desc = "Globules se déplacant en direction du boss."
end

L = BigWigs:NewBossLocale("Hagara the Stormbinder", "frFR")
if L then
	L.engage_trigger = "Vous êtes face à la Lieuse des tempêtes ! Je vais tous vous massacrer."

	L.lightning_or_frost = "Foudre ou Glace"
	L.ice_next = "Phase de glace"
	L.lightning_next = "Phase de foudre"

	L.nextphase = "Prochaine phase"
	L.nextphase_desc = "Prévient quand arrive la phase suivante."
end

L = BigWigs:NewBossLocale("Ultraxion", "frFR")
if L then
	L.engage_trigger = "L'heure du Crépuscule a sonné !"

	L.warmup = "Échauffement"
	L.warmup_desc = "Délai avant le début de la rencontre."
	L.warmup_trigger = "Je suis le début de la fin, l'ombre qui cache le soleil, le beffroi qui sonne votre glas."

	L.crystal = "Cristaux d'amélioration"
	L.crystal_desc = "Délais pour les divers cristaux d'amélioration que les PNJs invoquent."
	L.crystal_red = "Cristal rouge"
	L.crystal_green = "Cristal vert"
	L.crystal_blue = "Cristal bleu"

	L.twilight = "Crépuscule"
	L.cast = "Barre d'incantation d'Heure du Crépuscule"
	L.cast_desc = "Affiche une barre de 5 (Normal) ou 3 (Héroïque) secondes pour l'incantation d'Heure du Crépuscule."

	L.lightself = "Lumière faiblissante sur vous"
	L.lightself_desc = "Affiche une barre indiquant le temps restant avant que Lumière faiblissante ne vous fasse exploser."
	L.lightself_bar = "<Vous explosez>"

	L.lighttank = "Lumière faiblissante sur tanks"
	L.lighttank_desc = "Si un tank a Lumière faiblissante, affiche une barre d'explosion et Flash/Shake."
	L.lighttank_bar = "<%s explose>"
	L.lighttank_message = "Tank explosif"
end

L = BigWigs:NewBossLocale("Warmaster Blackhorn", "frFR")
if L then
	L.warmup = "Échauffement"
	L.warmup_desc = "Délai avant que le combat ne commence."

	L.sunder = "Fracasser armure"
	L.sunder_desc = "Compte les cumuls de Fracasser armure et affiche une barre de durée."
	L.sunder_message = "%2$dx Fracasser sur %1$s"

	L.sapper_trigger = "Un drake plonge et dépose un sapeur du Crépuscule sur le pont !"
	L.sapper = "Sapeur"
	L.sapper_desc = "Sapeur infligeant des dégâts au vaisseau."

	L.stage2_trigger = "Donc je dois le faire moi-même. Bien !" -- pas d'espace insécable ici
end

L = BigWigs:NewBossLocale("Spine of Deathwing", "frFR")
if L then
	L.engage_trigger = "Les plaques ! Il tombe en morceaux ! Arrachez les plaques et on aura une chance de le descendre !"

	L.about_to_roll = "va faire un tonneau"
	L.rolling = "fait un tonneau"
	L.not_hooked = "Vous n'êtes >PAS< accroché !"
	L.roll_message = "Et il tourne, tourne, tourne !"
	L.level_trigger = "se redresse"
	L.level_message = "Pas grave, il s'est redressé !"

	L.exposed = "Armure exposée"

	L.residue = "Résidus non absorbés"
	L.residue_desc = "Messages indiquant combien de résidus de sang se trouvent sur le dos."
	L.residue_message = "Résidus : %d"
end

L = BigWigs:NewBossLocale("Madness of Deathwing", "frFR")
if L then
	L.engage_trigger = "Vous n'avez RIEN fait. Je vais mettre votre monde en PIÈCES."

	-- Copy & Paste from Encounter Journal with correct health percentages (type '/dump (C_EncounterJournal.GetSectionInfo(4103)).title' in the game)
	L.smalltentacles_desc = "À 70% et 40% de points de vie restants au Tentacule membre, plusieurs Tentacules caustiques surgissent de lui. Ils sont insensibles aux techniques à zone d'effet."

	L.bolt_explode = "<Explosion de l'Eclair>"
	L.parasite = "Parasite"
	L.blobs_soon = "%d%% - Sang coagulant imminent !"
end

-- Firelands

L = BigWigs:NewBossLocale("Beth'tilac", "frFR")
if L then
	L.flare_desc = "Affiche une barre de délai pour les Braises incandescentes à effet de zone."

	L.devastate_message = "Dévastation #%d"
	L.drone_bar = "Ouvrière"
	L.drone_message = "Arrivée d'une ouvrière !"
	L.kiss_message = "Baiser"
	L.spinner_warn = "Tisseuses #%d"
end

L = BigWigs:NewBossLocale("Lord Rhyolith", "frFR")
if L then
	L.armor = "Armure en obsidienne"
	L.armor_desc = "Prévient quand des cumuls d'armure sont enlevés de Rhyolith."
	L.armor_message = "Il reste %d%% d'armure"
	L.armor_gone_message = "Armure détruite !"

	L.adds_header = "Étincelles/Fragments"
	L.big_add_message = "Étincelle de Rhyolith apparue !"
	L.small_adds_message = "Arrivée de fragments de Rhyolith !"

	L.phase2_warning = "Phase 2 imminente !"

	L.molten_message = "%d cumuls de fournaise sur le boss !"

	L.stomp_message = "Piétinement !"
	L.stomp = "Piétinement"
end

L = BigWigs:NewBossLocale("Alysrazor", "frFR")
if L then
	L.fullpower_soon_message = "Pleine puissance imminente !"
	L.halfpower_soon_message = "Phase 4 imminente !"
	L.encounter_restart = "Et c'est reparti..."
	L.no_stacks_message = "Juste au cas où : vous n'avez pas de plumes."
	L.moonkin_message = "Arrêtez de faire genre et récupérez de vraies plumes."
	L.molt_bar = "Mue"

	L.meteor = "Météore"
	L.meteor_desc = "Prévient quand un météore en fusion est invoqué."
	L.meteor_message = "Météore !"

	L.stage_message = "Phase %d "
	L.kill_message = "C'est maintenant ou jamais - tuez-la !"
	L.engage_message = "Alysrazor engagée - Phase 2 dans ~%d min."

	L.worm_emote = "Des vers de lave embrasés surgissent du sol !"
	L.phase2_soon_emote = "Alysrazor commence à voler en cercles rapides !"

	L.flight = "Assistance en vol"
	L.flight_desc = "Affiche une barre indiquant la durée de vos Ailes de flamme. Idéal si utilisé avec la fonctionnalité de super mise en évidence."

	L.initiate = "Apparitions des initiés"
	L.initiate_desc = "Affiche des barres de délai concernant les apparitions des initiés."
	L.initiate_both = "Les deux initiés"
	L.initiate_west = "Initié de l'ouest"
	L.initiate_east = "Initié de l'est"
end

L = BigWigs:NewBossLocale("Shannox", "frFR")
if L then
	L.safe = "%s sauvé"
	L.wary_dog = "%s est prudent !"
	L.crystal_trap = "Prison de cristal"

	L.traps_header = "Pièges"
	L.immolation = "Piège d'immolation sur les chiens"
	L.immolation_desc = "Prévient quand Croquepatte ou Ragegueule marche sur un piège d'immolation, gagnant de ce fait l'amélioration 'Prudence'."
	L.immolationyou = "Piège d'immolation en dessous de vous"
	L.immolationyou_desc = "Prévient quand un piège d'immolation est invoqué en dessous de vous."
	L.immolationyou_message = "Piège d'immolation"
	L.crystal = "Piège de cristal"
	L.crystal_desc = "Prévient en dessous de qui Shannox incante un piège de cristal."
	L.facerage_trigger = "À la gorge !"
end

L = BigWigs:NewBossLocale("Baleroc", "frFR")
if L then
	L.torment = "Cumuls de Torment sur la focalisation"
	L.torment_desc = "Prévient quand votre /focus gagne un autre cumul de tourment."

	L.blade_bar = "~Prochaine Lame"
	L.shard_message = "Éclats de tourment (%d) !"
	L.focus_message = "Votre focalisation a %d cumuls !"
	L.link_message = "Liés"
end

L = BigWigs:NewBossLocale("Majordomo Staghelm", "frFR")
if L then
	L.seed_explosion = "Vous explosez bientôt !"
	L.seed_bar = "Vous explosez !"
	L.adrenaline_message = "Adrenaline x%d !"
	L.leap_say = "Bond"
end

L = BigWigs:NewBossLocale("Ragnaros", "frFR")
if L then
	L.intermission_end_trigger1 = "Sulfuras sera votre fin"
	L.intermission_end_trigger2 = "À genoux, mortels"
	L.intermission_end_trigger3 = "Je vais en finir"
	L.phase4_trigger = "Trop tôt..." -- à vérifier
	L.seed_explosion = "Explosion des graînes !"
	L.intermission_bar = "Intervalle"
	L.intermission_message = "Intervalle !"
	L.sons_left = "%d |4fils restant:fils restants;"
	L.engulfing_close = "Section proche engloutie !"
	L.engulfing_middle = "Section centrale engloutie !"
	L.engulfing_far = "Section éloignée engloutie !"
	L.hand_bar = "\"Knockback\""
	L.ragnaros_back_message = "Ragnaros est de retour !"
end

-- Throne of the Four Winds

L = BigWigs:NewBossLocale("Al'Akir", "frFR")
if L then
	L.stormling = "Tourmentin"
	L.stormling_desc = "Prévient quand un Tourmentin est invoqué."

	L.acid_rain = "Pluie acide (%d)"

	L.feedback_message = "%dx Réaction"
end

L = BigWigs:NewBossLocale("Conclave of Wind", "frFR")
if L then
	L.gather_strength = "%s rassemble ses forces"

	L["93059_desc"] = "Bouclier d'absorption"

	L.full_power = "Puissance maximale"
	L.full_power_desc = "Prévient quand les boss atteignent leur puissance maximale et commence à incanter les techniques spéciales."
	L.gather_strength_emote = "%s commence à puiser la force des seigneurs du Vent encore présents !" -- à vérifier
end
