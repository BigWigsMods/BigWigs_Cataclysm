
local L = BigWigs:NewBossLocale("Magmaw", "frFR")
if not L then return end
if L then
	L.stage2_yell_trigger = "Inconcevable ! Vous pourriez vraiment vaincre mon ver de lave !"

	L.slump = "Affalement"
	L.slump_desc = "Prévient quand le boss s'affale vers l'avant et s'expose, permettant ainsi au rodéo de commencer."
	L.slump_bar = "Rodéo"
	L.slump_message = "Yeehaw, chevauchez !"
	L.slump_emote_trigger = "%s s'affale vers l'avant et expose ses pinces !"

	L.expose_emote_trigger = "expose sa tête"
end

L = BigWigs:NewBossLocale("Omnotron Defense System", "frFR")
if L then
	L.nef = "Seigneur Victor Nefarius"
	L.nef_desc = "Prévient quand le Seigneur Victor Nefarius utilise une technique."

	L.pool = "Générateur instable"
end

L = BigWigs:NewBossLocale("Chimaeron", "frFR")
if L then
	L.bileotron_engage = "Le bile-o-tron s'anime et commence à secréter une substance malodorante."

	L.next_system_failure = "Prochaine Défaillance"

	L.phase2_message = "Phase Mortalité imminente !"
end

L = BigWigs:NewBossLocale("Atramedes", "frFR")
if L then
	L.ground_phase = "Phase au sol"
	L.ground_phase_desc = "Prévient quand Atramédès atterrit."
	L.air_phase = "Phase aérienne"
	L.air_phase_desc = "Prévient quand Atramédès décolle."

	L.air_phase_trigger = "Oui, fuyez ! Chaque foulée accélère votre cœur. Les battements résonnent comme le tonnerre... Assourdissant. Vous ne vous échapperez pas !"

	L.obnoxious_soon = "Démon odieux imminent !"

	L.searing_soon = "Flamme incendiaire dans 10 sec. !"
end

L = BigWigs:NewBossLocale("Maloriak", "frFR")
if L then
	--heroic
	L.sludge = "Sombre vase"
	L.sludge_desc = "Prévient quand vous vous trouvez dans une Sombre vase."
	L.sludge_message = "Sombre vase sur VOUS !"

	--normal
	L.final_phase = "Phase finale"
	L.final_phase_soon = "Phase finale imminente !"

	L.release_aberration_message = "%d aberrations restantes !"
	L.release_all = "%d aberrations libérées !"

	L.phase = "Phases"
	L.phase_desc = "Prévient quand la rencontre entre dans une nouvelle phase."
	L.next_phase = "Prochaine phase"
	L.green_phase_bar = "Phase verte"

	L.red_phase_trigger = "Mélanger, touiller, faire chauffer..."
	L.red_phase_emote_trigger = "rouge"
	L.red_phase = "Phase |cFFFF0000rouge|r"
	L.blue_phase_trigger = "Jusqu'où une enveloppe mortelle peut-elle supporter des écarts extrêmes de température ? Je dois trouver ! Pour la science !"
	L.blue_phase_emote_trigger = "bleue"
	L.blue_phase = "Phase |cFF809FFEbleue|r"
	L.green_phase_trigger = "Celui-ci est un peu instable, mais que serait le progrès sans échec ?"
	L.green_phase_emote_trigger = "verte"
	L.green_phase = "Phase |cFF33FF00verte|r"
	L.dark_phase_trigger = "Tes mixtures sont insipides, Maloriak ! Elles ont besoin d'un peu de... force !"
	L.dark_phase_emote_trigger = "sombre"
	L.dark_phase = "Phase |cFF660099sombre|r"
end

L = BigWigs:NewBossLocale("Nefarian", "frFR")
if L then
	L.phase = "Phases"
	L.phase_desc = "Prévient quand la rencontre entre dans une nouvelle phase."

	L.discharge_bar = "Décharge"

	L.phase_two_trigger = "Soyez maudits, mortels ! Un tel mépris pour les possessions d'autrui doit être traité avec une extrême fermeté !"

	L.phase_three_trigger = "J'ai tout fait pour être un hôte accommodant"

	L.crackle_trigger = "L'électricité crépite dans l'air !"
	L.crackle_message = "Electrocuter imminent !"

	L.shadowblaze_trigger = "Que la chair se transforme en cendres !"
	L.shadowblaze_message = "Ombrase en dessous de VOUS !"

	L.onyxia_power_message = "Explosion imminente !"

	L.chromatic_prototype = "Prototype chromatique" -- 3 adds name
end
