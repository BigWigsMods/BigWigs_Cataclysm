
local L = BigWigs:NewBossLocale("Magmaw", "itIT")
if not L then return end
if L then
	L.stage2_yell_trigger = "Potete uccidere il mio Parassita della Lava!"

	L.slump = "Crollo"
	L.slump_desc = "Avvisa il crollo di Magmaw ed espone la sua testa, permettendo ai cavalcatori del rodeo di iniziare."
	L.slump_bar = "Rodeo"
	L.slump_message = "Oh Sììì, cavalchiamo!!!"
end

L = BigWigs:NewBossLocale("Omnotron Defense System", "itIT")
if L then
	L.nef = "Ser Victor Nefarius"
	L.nef_desc = "Avvisi per le abilità di Ser Victor Nefarius."

	L.pool_explosion = "Esplosione Pozza"
	L.incinerate = "Incenerimento"
	L.flamethrower = "Lanciafiamme"
	L.lightning = "Elettro"
	L.infusion = "Infusione"
end

L = BigWigs:NewBossLocale("Atramedes", "itIT")
if L then
	L.obnoxious_fiend = "Demonio Ripugnante" -- NPC ID 49740
	L.air_phase_trigger = "Sì, correte! Con ogni passo il cuore batte più forte."
end

L = BigWigs:NewBossLocale("Maloriak", "itIT")
if L then
	L.flames = "Fiamme"
	L.dark_phase_emote_trigger = "oscura"
end

L = BigWigs:NewBossLocale("Nefarian", "itIT")
if L then
	L.phase = "Fasi"
	L.phase_desc = "Avvisi per il cambio di fase."

	L.discharge_bar = "Scarica"

	L.phase_two_trigger = "Maledetti mortali! Il disprezzo per la proprietà altri merita l'applicazione di una forza estrema!"

	L.phase_three_trigger = "Ho cercato di essere un'ospite cortese"

	L.crackle_trigger = "L'aria crepita di elettricità!"
	L.crackle_message = "Giustizia Elettrica!"

	L.shadowblaze_trigger = "La Carne si tramuta in cenere!"
	L.shadowblaze_message = "Fuoco sotto di TE!!!"

	L.onyxia_power_message = "Esplosione tra poco!"

	L.chromatic_prototype = "Prototipo Cromatico" -- 3 adds name
end
