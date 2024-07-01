
local L = BigWigs:NewBossLocale("Magmaw", "frFR")
if not L then return end
if L then
	L.stage2_yell_trigger = "Inconcevable ! Vous pourriez vraiment vaincre mon ver de lave !"

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
	L.air_phase_trigger = "Oui, fuyez ! Chaque foulée accélère votre cœur. Les battements résonnent comme le tonnerre... Assourdissant. Vous ne vous échapperez pas !"
end

L = BigWigs:NewBossLocale("Maloriak", "frFR")
if L then
	L.flames = "Flammes"
	L.dark_phase_emote_trigger = "sombre"
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
