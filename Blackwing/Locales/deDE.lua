
local L = BigWigs:NewBossLocale("Magmaw", "deDE")
if not L then return end
if L then
	L.stage2_yell_trigger = "Ihr könntet tatsächlich meinen Lavawurm besiegen" -- check

	L.slump = "Nach vorne schlittern"
	L.slump_desc = "Warnt vor dem nach vorne Schlittern, das das Rodeo erlaubt zu starten."
	L.slump_bar = "Rodeo"
	L.slump_message = "Yeehaa, Rodeo!"
end

L = BigWigs:NewBossLocale("Omnotron Defense System", "deDE")
if L then
	L.nef = "Lord Victor Nefarius"
	L.nef_desc = "Warnungen für Nefarians Fähigkeiten."

	L.pool_explosion = "Pool-Explosion"
	L.incinerate = "Verbrennen"
	L.flamethrower = "Flammenwerfer"
	L.lightning = "Blitzableiter"
	L.infusion = "Schattenmacht"
end

L = BigWigs:NewBossLocale("Atramedes", "deDE")
if L then
	L.obnoxious_fiend = "Nerviges Scheusal" -- NPC ID 49740
	L.air_phase_trigger = "Ja, lauft! Jeder Schritt lässt Euer Herz stärker klopfen. Laut und heftig... ohrenbetäubend. Es gibt kein Entkommen!" -- check
end

L = BigWigs:NewBossLocale("Maloriak", "deDE")
if L then
	L.flames = "Flammen"
	L.dark_phase_emote_trigger = "dunkle" -- check
end

L = BigWigs:NewBossLocale("Nefarian", "deDE")
if L then
	L.phase = "Phasen"
	L.phase_desc = "Warnt vor Phasenwechsel."

	L.discharge_bar = "Blitzentladung"

	L.phase_two_trigger = "Verfluchte Sterbliche! Ein solcher Umgang mit dem Eigentum anderer verlangt nach Gewalt!" -- check

	L.phase_three_trigger = "Ich habe versucht, ein guter Gastgeber zu sein" -- check

	L.crackle_trigger = "Elektrizität lässt die Luft knistern!" -- check
	L.crackle_message = "Stromschlag bald!"

	L.shadowblaze_trigger = "Fleisch wird zu Asche!" -- check
	L.shadowblaze_message = "Feuer"

	L.onyxia_power_message = "Überladung bald!"

	L.chromatic_prototype = "Chromatischer Prototyp"
end
