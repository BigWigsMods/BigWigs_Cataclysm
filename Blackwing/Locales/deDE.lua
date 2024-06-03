
local L = BigWigs:NewBossLocale("Magmaw", "deDE")
if not L then return end
if L then
	L.stage2_yell_trigger = "Ihr könntet tatsächlich meinen Lavawurm besiegen" -- check

	L.slump = "Nach vorne schlittern"
	L.slump_desc = "Warnt vor dem nach vorne Schlittern, das das Rodeo erlaubt zu starten."
	L.slump_bar = "Rodeo"
	L.slump_message = "Yeehaa, Rodeo!"
	L.slump_emote_trigger = "%s schlittert nach vorne und entblößt seine Zangen!" -- check

	L.expose_emote_trigger = "Kopf" -- check
end

L = BigWigs:NewBossLocale("Omnotron Defense System", "deDE")
if L then
	L.nef = "Lord Victor Nefarius"
	L.nef_desc = "Warnungen für Nefarians Fähigkeiten."

	L.pool = "Pool-Explosion"
end

L = BigWigs:NewBossLocale("Chimaeron", "deDE")
if L then
	L.bileotron_engage = "Der Gall-O-Tron springt an und stößt eine übel riechende Substanz aus."

	L.next_system_failure = "Systemversagen"

	L.phase2_message = "Sterblichkeitsphase bald!"
end

L = BigWigs:NewBossLocale("Atramedes", "deDE")
if L then
	L.ground_phase = "Bodenphase"
	L.ground_phase_desc = "Warnt, wenn Atramedes landet."
	L.air_phase = "Luftphase"
	L.air_phase_desc = "Warnt, wenn Atramedes abhebt."

	L.air_phase_trigger = "Ja, lauft! Jeder Schritt lässt Euer Herz stärker klopfen. Laut und heftig... ohrenbetäubend. Es gibt kein Entkommen!" -- check

	L.obnoxious_soon = "Nerviges Scheusal bald!"

	L.searing_soon = "Sengende Flamme in 10 sek!"
end

L = BigWigs:NewBossLocale("Maloriak", "deDE")
if L then
	--heroic
	L.sludge = "Dunkler Schlick"
	L.sludge_desc = "Warnt, wenn du in Dunkler Schlick stehst."
	L.sludge_message = "Schlick auf DIR!"

	--normal
	L.final_phase = "Finale Phase"
	L.final_phase_soon = "Finale Phase bald!"

	L.release_aberration_message = "%s Adds noch!"
	L.release_all = "%s Adds freigelassen!"

	L.phase = "Phasen"
	L.phase_desc = "Warnt vor Phasenwechsel."
	L.next_phase = "Nächste Phase"
	L.green_phase_bar = "Grüne Phase"

	L.red_phase_trigger = "Vermischen, rühren, erhitzen..."
	L.red_phase_emote_trigger = "rote"
	L.red_phase = "|cFFFF0000Rote|r Phase"
	L.blue_phase_trigger = "Muss rausfinden, wie die sterbliche Hülle auf extreme Temperaturen reagiert... FÜR DIE FORSCHUNG!"
	L.blue_phase_emote_trigger = "blaue"
	L.blue_phase = "|cFF809FFEBlaue|r Phase"
	L.green_phase_trigger = "Etwas instabil vielleicht, doch keine Forschung ohne Risiko!"
	L.green_phase_emote_trigger = "grüne"
	L.green_phase = "|cFF33FF00Grüne|r Phase"
	L.dark_phase_trigger = "Eure Mixturen sind schwach, Maloriak!" -- check
	L.dark_phase_emote_trigger = "dunkle" -- check
	L.dark_phase = "|cFF660099Dunkle|r Phase"
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
