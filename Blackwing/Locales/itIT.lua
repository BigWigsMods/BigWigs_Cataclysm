
local L = BigWigs:NewBossLocale("Magmaw", "itIT")
if not L then return end
if L then
	L.stage2_yell_trigger = "Potete uccidere il mio Parassita della Lava!"

	L.slump = "Crollo"
	L.slump_desc = "Avvisa il crollo di Magmaw ed espone la sua testa, permettendo ai cavalcatori del rodeo di iniziare."
	L.slump_bar = "Rodeo"
	L.slump_message = "Oh Sììì, cavalchiamo!!!"

	L.expose_emote_trigger = "testa"
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

L = BigWigs:NewBossLocale("Chimaeron", "itIT")
if L then
	L.bileotron_engage = "Il BileTron 800 ritorna in vita ed emette una strana sostanza odorosa."

	L.next_system_failure = "Prossimo Errore di Sistema"

	L.phase2_message = "Fase Mortalità tra poco!"
end

L = BigWigs:NewBossLocale("Maloriak", "itIT")
if L then
	--heroic
	L.sludge = "Poltiglia Oscura"
	L.sludge_desc = "Avvisa quando ti trovi dentro una pozza di Poltiglia Oscura."
	L.sludge_message = "Poltiglia su di TE!!!"

	--normal
	L.final_phase = "Fase Finale"
	L.final_phase_soon = "Fase Finale tra poco!"

	L.release_aberration_message = "%d add rimanenti!"
	L.release_all = "%d add rilasciati!"

	L.phase = "Fasi"
	L.phase_desc = "Avvisi per il cambio di fase."
	L.next_phase = "Fase Successiva"
	L.green_phase_bar = "Fase Verde"

	L.red_phase_trigger = "Mescola e amalgama, riscalda..."
	L.red_phase_emote_trigger = "rosso"
	L.red_phase = "Fase |cFFFF0000Rossa|r"
	L.blue_phase_trigger = "Quali sbalzi di temperatura riesce a sopportare un'involucro mortale? Devo scoprirlo! Per la scienza!"
	L.blue_phase_emote_trigger = "blu"
	L.blue_phase = "Fase |cFF809FFEBlu|r"
	L.green_phase_trigger = "Questa è un pò instabile, ma come si può progredire se non si prova?"
	L.green_phase_emote_trigger = "verde"
	L.green_phase = "Fase |cFF33FF00Verde|r"
	L.dark_phase_trigger = "I tuoi composti sono deboli, Maloriak! Serve un pò più di... pepe!"
	L.dark_phase_emote_trigger = "oscura"
	L.dark_phase = "Fase |cFF660099Oscura|r"
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
