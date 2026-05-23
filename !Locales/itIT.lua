-- Baradin Hold

local L = BigWigs:NewBossLocale("Occu'thar", "itIT")
if L then
	L.shadows_bar = "~Ombre Roventi"
	L.destruction_bar = "<Esplosione>"
	L.eyes_bar = "~Occhi"

	L.fire_message = "Laser, Pew Pew"
	L.fire_bar = "~Laser"
end

L = BigWigs:NewBossLocale("Alizabal", "itIT")
if L then
	L.first_ability = "Spiedo o Odio"
	L.dance_message = "Lame Danzanti %d di 3"
end

-- Bastion of Twilight

L = BigWigs:NewBossLocale("Halfus Wyrmbreaker", "itIT")
if L then
	L.strikes_message = "Assalti"
	--L.freed_message = "%s freed %s"
end

L = BigWigs:NewBossLocale("Cho'gall", "itIT")
if L then
	L.orders = "Cambio Postura"
	L.orders_desc = "Avvisi per il cambio di postura di Cho'Gall tra le fasi Ordini Fiammeggianti/dell'Ombra."

	L.worship_cooldown = "~Devozione"

	L.adherent_bar = "Add Grosso #%d"
	L.adherent_message = "Add %d in arrivo!"
	L.ooze_bar = "Ondata di melme %d"
	L.ooze_message = "Ondata di melme %d in arrivo!"

	L.tentacles_bar = "Apparizione Tentacoli"
	L.tentacles_message = "Festino discotecaro di Tentacoli!"

	L.sickness_message = "Ti senti Debilitato!"
	L.blaze_message = "Fuoco sotto di TE!!!"
	L.crash_say = "Impatto"

	L.fury_message = "Furia!"
	L.first_fury_soon = "Furia Tra Poco!"
	L.first_fury_message = "85% - Inizia la Furia!"

	L.unleashed_shadows = "Ombre Potenziate"

	L.phase2_message = "Fase 2!"
	L.phase2_soon = "Fase 2 tra poco!"
end

L = BigWigs:NewBossLocale("Valiona and Theralion", "itIT")
if L then
	L.phase_switch = "Cambio Fase"
	L.phase_switch_desc = "Avvisi per il cambio di fase."

	L.phase_bar = "%s sta atterrando"
	L.breath_message = "Respiro Profondo tra poco!"
	L.dazzling_message = "Zone Turbinanti tra poco!"

	L.blast_message = "Colpo dall'Alto" --Sounds better and makes more sense than Twilight Blast (the user instantly knows something is coming from the sky at them)
	L.engulfingmagic_say = "Inondamento"

	L.valiona_trigger = "Theralion, inonderò la sala di fiamme, impedisci che fuggano!"

	L.twilight_shift = "Cambio"
end

L = BigWigs:NewBossLocale("Sinestra", "itIT")
if L then
	L.whelps = "Draghetti"
	L.whelps_desc = "Avviso per le ondate dei draghetti."

	L.slicer_message = "Possibili bersagli del Globo"

	L.egg_vulnerable = "È L'ORA DI ROMPERE LE UOVA!"

	L.whelps_trigger = "Nutritevi piccoli! Saziatevi della loro carne!"
	L.omelet_trigger = "Credete che questa sia debolezza?  Sciocchi!"

	L.phase13 = "Fase 1 e 3"
	L.phase = "Fase"
	L.phase_desc = "Avvisi per il cambio di fase."
end

L = BigWigs:NewBossLocale("Ascendant Council", "itIT")
if L then
	L.health_report = "%s al %d%%, cambio di fase tra poco!"
	L.switch = "Cambio"
	L.switch_desc = "Avvisi per il cambio di boss."

	L.shield_up_message = "Lo Scudo è ATTIVO!"
	L.shield_down_message = "Lo Scudo è ANDATO VIA!"
	L.shield_bar = "Scudo"

	L.switch_trigger = "Ce ne occupiamo noi!"

	L.thundershock_quake_soon = "%s tra 10sec!"

	L.quake_trigger = "Il terreno sotto di te romba minacciosamente...."
	L.thundershock_trigger = "L'aria circostante scoppietta di energia...."

	L.thundershock_quake_spam = "%s in %d"

	L.last_phase_trigger = "Ecco la vostra rovina..."
end

-- Blackwing Descent

L = BigWigs:NewBossLocale("Magmaw", "itIT")
if L then
	L.stage2_yell_trigger = "Inconcepibile" --Inconcepibile! Avete sconfitto il mio Verme della Lava! Forse posso bilanciare la situazione.

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
	--L.circles = "Circles"
end

L = BigWigs:NewBossLocale("Maloriak", "itIT")
if L then
	L.flames = "Fiamme"
end

L = BigWigs:NewBossLocale("Nefarian", "itIT")
if L then
	L.discharge = "Scarica"
	L.stage3_yell_trigger = "UCCIDERVI TUTTI" -- Ho cercato di essere un ospite cortese, ma non volete proprio morire! È ora di abbandonare ogni formalità e... UCCIDERVI TUTTI!
end

-- Dragon Soul

L = BigWigs:NewBossLocale("Morchok", "itIT")
if L then
	L.engage_trigger = "State cercando di fermare una valanga. Io vi seppelliro'."

	L.crush_desc = "Conta gli accumuli di Spacca Armatura e mostra una barra di durata."

	L.blood = "Sangue Nero della Terra"

	L.explosion = "Esplosione"
	L.crystal = "Cristallo Echeggiante"
end

L = BigWigs:NewBossLocale("Warlord Zon'ozz", "itIT")
if L then
	L.engage_trigger = "Zzof Shuul'wah. Thoq fssh N'Zoth!"

	L.ball = "Ombra della Decadenza"
	L.ball_desc = "Una sfera di energia che disperde la sua energia sui giocatori."
	L.ball_yell = "Gul'kafh an'qov N'Zoth."

	--L.ball_active = "Void ball active"
	--L.ball_active_desc = "Timer for when the void ball activates (i.e. it can bounce)."

	L.bounce = "Rimbalzo della Sfera d'Ombra"
	L.bounce_desc = "Contatore per i rimbalzi dell'Ombra della Decadenza."

	L.darkness = "Uccidere i Tentacoli!"
	L.darkness_desc = "Questa fase comincia quando la Sfera di Energia colpisce il Boss."

	L.shadows = "Ombre d'Interruzione"

	L.custom_off_shadows_marker = "Disrupting Shadows marker"
	L.custom_off_shadows_marker_desc = "Mark Disrupting Shadows targets with {rt1}{rt2}{rt3}, requires promoted or leader.\n|cFFFF0000Only 1 person in the raid should have this enabled to prevent marking conflicts.|r"
end

L = BigWigs:NewBossLocale("Yor'sahj the Unsleeping", "itIT")
if L then
	L.engage_trigger = "Iilth qi'uothk shn'ma yeh'glu Shath'Yar! H'IWN IILTH!"

	L.bolt_desc = "Conteggia le stack di Dardo del Vuoto e mostra un timer di durata."
	L.bolt_message = "%2$dx Dardo %1$s"

	L.blue = "|cFF0080FFBlu|r"
	L.green = "|cFF088A08Verde|r"
	L.purple = "|cFF9932CDViola|r"
	L.yellow = "|cFFFFA901Gialla|r"
	L.black = "|cFF424242Nera|r"
	L.red = "|cFFFF0404Rossa|r"

	L.blobs = "Globuli"
	L.blobs_bar = "Prossimi Globuli"
	L.blobs_desc = "I Globuli si muovono verso il Boss."
end

L = BigWigs:NewBossLocale("Hagara the Stormbinder", "itIT")
if L then
	L.engage_trigger = "State per incontrare la Tempestosa ! Vi massacrero' Tutti."

	L.lightning_or_frost = "Tempesta o Ghiaccio"
	L.ice_next = "Fase del Ghiaccio"
	L.lightning_next = "Fase dei Fulmini"

	L.nextphase = "Prossima Fase"
	L.nextphase_desc = "Avviso per la prossima fase."
end

L = BigWigs:NewBossLocale("Ultraxion", "itIT")
if L then
	L.engage_trigger = "E' L'ora del Crepuscolo!"

	L.warmup = "Preaparazione"
	L.warmup_desc = "Timer per la partenza del Boss."
	L.warmup_trigger = "Sono l'inizio della fine, l'ombra che oscura il sole, la campana che rintocca la morte."

	L.crystal = "Cristalli di Meteora"
	L.crystal_desc = "Timer per i vari cristalli che vengono lanciati dagli NPC."
	L.crystal_red = "Cristallo ROSSO"
	L.crystal_green = "Cristallo VERDE"
	L.crystal_blue = "Cristallo BLU"

	L.twilight = "Crepuscolo"
	L.cast = "Barra del Crepuscolo"
	L.cast_desc = "Mostra una barra per l'Ora del Crepuscolo 5 (in Normale) o 3 (in Eroico) secondi prima dell'inizio del Cast."

	L.lightself = "Luce Calante su di TE"
	L.lightself_desc = "Mostra una barra che visualizza il tempo rimamente prima che Luce Calante esploda."
	L.lightself_bar = "<TU ESPLODI>"

	L.lighttank = "Luce Calante sui Difensori"
	L.lighttank_desc = "Se un tank ha Luce Calante, visualizza una barra di esplosione che lampeggia e vibra."
	L.lighttank_bar = "<%s Esplode>"
	L.lighttank_message = "I Difensori ESPLODONO"
end

L = BigWigs:NewBossLocale("Warmaster Blackhorn", "itIT")
if L then
	L.warmup = "Preparazione"
	L.warmup_desc = "Tempo all'avvio del Combattimento."

	L.sunder = "Sfondamento"
	L.sunder_desc = "Conteggia fli accumuli di Sfondamento e visualizza una Timer di durata."
	L.sunder_message = "%2$dx Sfondamento su %1$s"

	L.sapper_trigger = "Un drago lascia cadere un GENIERE sulla Nave!"
	L.sapper = "Geniere"
	L.sapper_desc = "Il Geniere danneggia la nave"

	L.stage2_trigger = "Sembra che dovrò fare tutto da solo. Bene!"
end

L = BigWigs:NewBossLocale("Spine of Deathwing", "itIT")
if L then
	L.engage_trigger = "Le Piastre! Sta Arrivando! Distruggiamo le Piastre e avremo una possibilita' di Colpirlo!"

	L.about_to_roll = "effettuare un avvitamento"
	L.rolling = "effettua un avvitamento"
	L.not_hooked = "TU >NON< SEI armpionato!"
	L.roll_message = "Si sta Avvitando, Avvitamento! Avvitamento!"
	L.level_trigger = "si stabilizza"
	L.level_message = "Ottimo, si è Stabilizzato!"

	L.exposed = "Armatura Esposta"

	L.residue = "Residui non assorbiti"
	L.residue_desc = "Messaggi che ti informano di quanti residui sono rimasti sulla schiena, che aspettano di essere assorbiti."
	L.residue_message = "Residui non Assorbiti: %d"
end

L = BigWigs:NewBossLocale("Madness of Deathwing", "itIT")
if L then
	L.engage_trigger = "Non potete far nulla. Distruggerò il vostro Mondo."
	L.smalltentacles_desc = "Al 70% e al 40% di vita il Tentacolo dell'Arto genera alcuni Tentacoli Brucianti che sono immuni alle Spell AOE."
	L.bolt_explode = "<Esplosione del Dardo>"
	L.parasite = "Parassita"
	L.blobs_soon = "%d%% - SANGUE COAGULANTE in ARRIVO!"
end

-- Firelands

L = BigWigs:NewBossLocale("Beth'tilac", "itIT")
if L then
	L.flare_desc = "Mostra un timer per l'attacco ad area Aria Rovente."

	L.devastate_message = "Devastazione #%d"
	L.drone_bar = "Drone"
	L.drone_message = "Drone in arrivo!"
	L.kiss_message = "Bacio"
	L.spinner_warn = "Filatori #%d"
end

L = BigWigs:NewBossLocale("Lord Rhyolith", "itIT")
if L then
	L.armor = "Armatura d'Ossidiana"
	L.armor_desc = "Avvisa quando gli accumuli dell'armatura vengono rimossi da Rhyolith."
	L.armor_message = "%d%% armature rimanenti"
	L.armor_gone_message = "Armoratura andata, dateci dentro e tanti saluti!"

	L.adds_header = "Adds"
	L.big_add_message = "Evocati Add Maggiori!"
	L.small_adds_message = "Add Minori in arrivo!"

	L.phase2_warning = "Fase 2 tra poco!"

	L.molten_message = "%dx accumuli sul boss!"

	L.stomp_message = "Urto! Urto! Urto!"
	L.stomp = "Urto"
end

L = BigWigs:NewBossLocale("Alysrazor", "itIT")
if L then
	L.fullpower_soon_message = "Piena Pottenza tra poco!"
	L.halfpower_soon_message = "Fase 4 a breve!"
	L.encounter_restart = "Si ricomincia..."
	L.no_stacks_message = "Forse non te ne importa, ma non hai piume"
	L.moonkin_message = "Smetti di scherzare col fuoco e prendi qualche piuma"
	L.molt_bar = "Muta"

	L.meteor = "Meteora"
	L.meteor_desc = "Avvisa quando viene evocata una Meteora Fusa."
	L.meteor_message = "Meteora!"

	L.stage_message = "Fase %d"
	L.kill_message = "Ora o mai più - Uccidila!"
	L.engage_message = "Alysrazor attivata - Fase 2 in ~%d min"

	L.worm_emote = "Vermi della Lava Fiammeggiante eruttano dal terreno!"
	L.phase2_soon_emote = "Alysrazor inizia a volare velocemente in circolo!"

	L.flight = "Assistenti di Volo"
	L.flight_desc = "Mostra una barra con la durata di 'Ali delle Fiamme' su di te, da usare idealmente con la SUPER ENFATIZZAZIONE."

	L.initiate = "Arrivo degli Iniziati"
	L.initiate_desc = "Mostra barra per gli avvisi degli Arrivi degli Iniziati."
	L.initiate_both = "Tutti e due gli Iniziati"
	L.initiate_west = "Iniziato Ovest"
	L.initiate_east = "Iniziato Est"
end

L = BigWigs:NewBossLocale("Shannox", "itIT")
if L then
	L.safe = "%s al sicuro"
	L.wary_dog = "%s è Cauto!"
	L.crystal_trap = "Trappola di Cristallo"

	L.traps_header = "Trappole"
	L.immolation = "Trappola Incendiaria sul Cane"
	L.immolation_desc = "Avvisa quando Spezzabraccia e Grugnoduro camminano sotto una Trappola Incendiaria, guadagnando l'effetto 'Cauto'."
	L.immolationyou = "Trappola incendiaria SOTTO DI TE!!!"
	L.immolationyou_desc = "Avvisa quando una Trappola Incendiaria viene lanciata stto di te."
	L.immolationyou_message = "Trappola Incendiaria"
	L.crystal = "Trappola della Prigione di Cristallo"
	L.crystal_desc = "Avvisa verso chi Shannox lancia la Trappola della Progione di CristalloWarn whom Shannox casts a Crystal Trap under."
	--L.facerage_trigger = "Go for the throat!"
end

L = BigWigs:NewBossLocale("Baleroc", "itIT")
if L then
	L.torment = "Accumuli Tormento sul Focus"
	L.torment_desc = "Avvisa quando il tuo /focus guadagna un'altro accumulo di Tormento."

	L.blade_bar = "~Prossima Lama"
	L.shard_message = "Frammenti del Tormento (%d)!"
	L.focus_message = "Il tuo focus ha %d accumuli!"
	L.link_message = "Collegamento"
end

L = BigWigs:NewBossLocale("Majordomo Staghelm", "itIT")
if L then
	L.seed_explosion = "Stai per esplodere tra poco!"
	L.seed_bar = "Stai Esplodendo!"
	L.adrenaline_message = "Adrenalina x%d!"
	L.leap_say = "Balzo"
end

L = BigWigs:NewBossLocale("Ragnaros", "itIT")
if L then
	L.intermission_end_trigger1 = "Sulfuras sarà la vostra fine"
	L.intermission_end_trigger2 = "In ginocchio mortali"
	L.intermission_end_trigger3 = "Basta così! Ora ci penso io"
	L.phase4_trigger = "Troppo presto..."
	L.seed_explosion = "Esplosione dei Semi!"
	L.intermission_bar = "Intermezzo!"
	L.intermission_message = "Intermezzo... Avete i pop-corn?"
	L.sons_left = "%d |4seguace rimasto:seguaci rimasti;"
	L.engulfing_close = "Mondo in Fiamme Vicino!"
	L.engulfing_middle = "Mondo in Fiamme Centrale!"
	L.engulfing_far = "Mondo in Fiamme Lontano!"
	L.hand_bar = "Knockback"
	L.ragnaros_back_message = "Raggy è tornato, dateci dentro!" -- yeah thats right PARRY ON!
end

-- Throne of the Four Winds

L = BigWigs:NewBossLocale("Al'Akir", "itIT")
if L then
	L.stormling = "Prole Tempestosa"
	L.stormling_desc = "Evocazione Prole Tempestosa."

	L.acid_rain = "Pioggia Acida (%d)"

	L.feedback_message = "Retroazione %dx"
end

L = BigWigs:NewBossLocale("Conclave of Wind", "itIT")
if L then
	L.gather_strength = "%s sta Raccogliendo le Forze"

	L["93059_desc"] = "Scudo Assorbimento"

	L.full_power = "Piena Energia"
	L.full_power_desc = "Avvisa quando il boss è a Piena Energia ed inizia a lanciare la sua abilità speciale."
	L.gather_strength_emote = "%s inizia a raccogliere le forze"
end
