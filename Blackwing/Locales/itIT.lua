
local L = BigWigs:NewBossLocale("Atramedes", "itIT")
if not L then return end
if L then
	L.ground_phase = "Fase a Terra"
	L.ground_phase_desc = "Avviso per quando Atramedes atterra."
	L.air_phase = "Fase Aerea"
	L.air_phase_desc = "Avviso per quando Atramedes si alza in volo."

	L.air_phase_trigger = "Sì, correte! Con ogni passo il cuore batte più forte."

	L.obnoxious_soon = "Demone Ripugnante tra poco!"

	L.searing_soon = "Fiamme Ustionanti in 10 secondi!"
end

L = BigWigs:NewBossLocale("Chimaeron", "itIT")
if L then
	L.bileotron_engage = "Il BileTron 800 ritorna in vita ed emette una strana sostanza odorosa."

	L.next_system_failure = "Prossimo Errore di Sistema"

	L.phase2_message = "Fase Mortalità tra poco!"

	L.warmup = "Riscamdamento"
	L.warmup_desc = "Timer Riscaldamento"
end

L = BigWigs:NewBossLocale("Magmaw", "itIT")
if L then
	-- heroic
	L.blazing = "Add Scheletrici"
	L.blazing_desc = "Evocazione Costrutto d'Ossa Fiammeggiante."
	L.blazing_message = "Add in arrivo!"
	L.blazing_bar = "Scheletri"

	L.armageddon = "Armageddon"
	L.armageddon_desc = "Avvisa se Armageddon viene lanciato durante la fase della Testa."

	L.phase2 = "Fase 2"
	L.phase2_desc = "Avvisi per la transizione a Fase 2 e mostra il display di prossimità."
	L.phase2_message = "Fase 2!"
	L.phase2_yell = "Potete uccidere il mio Parassita della Lava!"

	-- normal
	L.slump = "Crollo (Rodeo)"
	L.slump_desc = "Avvisa il crollo di Magmaw ed espone la sua testa, permettendo ai cavalcatori del rodeo di iniziare."
	L.slump_bar = "Rodeo"
	L.slump_message = "Oh Sììì, cavalchiamo!!!"
	L.slump_trigger = "%s crolla a terra, mostrando le sue chele!"

	L.infection_message = "Sei infetto!"

	L.expose_trigger = "testa"
	L.expose_message = "Testa Esposta!"

	L.spew_warning = "Pilastro di Fiamme tra poco!"
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

L = BigWigs:NewBossLocale("Omnotron Defense System", "itIT")
if L then
	L.nef = "Ser Victor Nefarius"
	L.nef_desc = "Avvisi per le abilità di Ser Victor Nefarius."

	L.pool = "Esplosione Pozza"

	L.switch = "Cambio"
	L.switch_desc = "Avviso per i Cambi."
	L.switch_message = "%s %s"

	L.next_switch = "Prossima Attivazione"

	L.nef_next = "Beneficio Abilità"

	L.bomb_message = "La Bomba sta seguendo TE!!!"
	L.cloud_message = "Nuvola su di TE!!!"
	L.protocol_message = "Bombe in arrivo!"

	L.custom_on_iconomnotron = "Icona sul boss attivo"
	L.custom_on_iconomnotron_desc = "Metti l'icona primaria dell'incursione sul boss attivo (richiede promozione o capogruppo)."
end

