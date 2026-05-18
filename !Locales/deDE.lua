-- Baradin Hold

local L = BigWigs:NewBossLocale("Occu'thar", "deDE")
if L then
	L.shadows_bar = "~Sengende Schatten"
	L.destruction_bar = "<Zerstörung>"
	L.eyes_bar = "~Augen"

	L.fire_message = "Fokussiertes Feuer!"
	L.fire_bar = "~Feuer"
end

L = BigWigs:NewBossLocale("Alizabal", "deDE")
if L then
	L.first_ability = "Spießen oder Hass"
	L.dance_message = "Klingentanz %d von 3"
end

-- Bastion of Twilight

L = BigWigs:NewBossLocale("Halfus Wyrmbreaker", "deDE")
if L then
	L.strikes_message = "Stöße"
	--L.freed_message = "%s freed %s"
end

L = BigWigs:NewBossLocale("Cho'gall", "deDE")
if L then
	L.orders = "Schatten- / Flammenbefehl"
	L.orders_desc = "Warnt, wenn Cho'gall zwischen Befehle des Schattens und Flammenbefehl wechselt."

	L.worship_cooldown = "~Verehren"

	L.adherent_bar = "Kultist %d"
	L.adherent_message = "Kultist %d kommt!"
	L.ooze_bar = "Schleime %d"
	L.ooze_message = "Schleime %d kommen!"

	L.tentacles_bar = "Nächste Tentakel"
	L.tentacles_message = "Tentakel Disco Party!"

	L.sickness_message = "Krankheit auf DIR!"
	L.blaze_message = "Lohe auf DIR!"
	L.crash_say = "Schmettern"

	L.fury_message = "Furor!"
	L.first_fury_soon = "Furor bald!"
	L.first_fury_message = "85% - Furor kommt!"

	L.unleashed_shadows = "Schatten"

	L.phase2_message = "Phase 2!"
	L.phase2_soon = "Phase 2 bald!"
end

L = BigWigs:NewBossLocale("Valiona and Theralion", "deDE")
if L then
	L.phase_switch = "Phasenwechsel"
	L.phase_switch_desc = "Warnt, wenn die Phase gewechselt wird."

	L.phase_bar = "%s landet"
	L.breath_message = "Tiefer Atem kommt!"
	L.dazzling_message = "Wirbelzonen kommen!"

	L.blast_message = "Druckwelle"
	L.engulfingmagic_say = "Einhüllende Magie"

	L.valiona_trigger = "Theralion, ich werde den Gang einhüllen. Deck ihre Flucht!"

	L.twilight_shift = "Verschiebung"
end

L = BigWigs:NewBossLocale("Sinestra", "deDE")
if L then
	L.whelps = "Welpen"
	L.whelps_desc = "Warnt vor den Wellen der Welpen."

	L.slicer_message = "~Orb Ziele"

	L.egg_vulnerable = "Zeit für Omelett!"

	L.whelps_trigger = "Fresst, Kinder!" -- check
	L.omelet_trigger = "Ihr denkt, ich sei schwach?" -- check

	L.phase13 = "Phase 1 und 3"
	L.phase = "Phasen"
	L.phase_desc = "Warnt, wenn die Phasen wechseln."
end

L = BigWigs:NewBossLocale("Ascendant Council", "deDE")
if L then
	L.health_report = "%s bei %d%%, Wechsel bald!"
	L.switch = "Wechsel"
	L.switch_desc = "Warnt, wenn die Bosse wechseln."

	L.shield_up_message = "Schild ist OBEN!"
	L.shield_down_message = "Schild ist UNTEN!"
	L.shield_bar = "Schild"

	L.switch_trigger = "Wir kümmern uns um sie!"

	L.thundershock_quake_soon = "%s in 10 sek!"

	L.quake_trigger = "Der Boden unter Euch grollt unheilvoll..."
	L.thundershock_trigger = "Die Luft beginnt, vor Energie zu knistern..."

	L.thundershock_quake_spam = "%s in %d"

	L.last_phase_trigger = "Beeindruckende Leistung…" -- what the heck Blizz??
end

-- Blackwing Descent

L = BigWigs:NewBossLocale("Magmaw", "deDE")
if L then
	L.stage2_yell_trigger = "Ihr könntet tatsächlich meinen Lavawurm besiegen" -- Unfassbar! Ihr könntet tatsächlich meinen Lavawurm besiegen! Vielleicht kann ich helfen... das Zünglein an der Waage zu sein.

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
	--L.circles = "Circles"
end

L = BigWigs:NewBossLocale("Maloriak", "deDE")
if L then
	L.flames = "Flammen"
end

L = BigWigs:NewBossLocale("Nefarian", "deDE")
if L then
	L.discharge = "Blitzentladung"
	L.stage3_yell_trigger = "Ich habe versucht" -- Ich habe versucht, ein guter Gastgeber zu sein, aber ihr wollt einfach nicht sterben! Genug der Spielchen! Ich werde euch einfach... ALLE TÖTEN!
end

-- Dragon Soul

L = BigWigs:NewBossLocale("Morchok", "deDE")
if L then
	L.engage_trigger = "Ihr versucht, eine Lawine aufzuhalten. Ich werde Euch begraben."

	L.crush_desc = "Zählt die Stapel von Rüstung zerschmettern und zeigt eine Timerleiste an."

	L.blood = "Schwarzes Blut"

	L.explosion = "Explosion"
	L.crystal = "Kristall"
end

L = BigWigs:NewBossLocale("Warlord Zon'ozz", "deDE")
if L then
	L.engage_trigger = "Zzof Shuul'wah. Thoq fssh N'Zoth!"

	L.ball = "Leere der Apokalypse"
	L.ball_desc = "Leere der Apokalypse, welche von den Spielern abprallt und den Boss schwächt."
	L.ball_yell = "Gul'kafh an'qov N'Zoth."

	--L.ball_active = "Void ball active"
	--L.ball_active_desc = "Timer for when the void ball activates (i.e. it can bounce)."

	L.bounce = "Abprallen der Leerenkugel"
	L.bounce_desc = "Zählt, wie häufig die Leerenkugel abprallt."

	L.darkness = "Tentakel Disco Party!"
	L.darkness_desc = "Diese Phase beginnt, sobald die Leerenkugel auf den Boss trifft."

	L.shadows = "Schatten"

	L.custom_off_shadows_marker = "Disrupting Shadows marker"
	L.custom_off_shadows_marker_desc = "Mark Disrupting Shadows targets with {rt1}{rt2}{rt3}, requires promoted or leader.\n|cFFFF0000Only 1 person in the raid should have this enabled to prevent marking conflicts.|r"
end

L = BigWigs:NewBossLocale("Yor'sahj the Unsleeping", "deDE")
if L then
	L.engage_trigger = "Iilth qi'uothk shn'ma yeh'glu Shath'Yar! H'IWN IILTH!"

	L.bolt_desc = "Zählt die Stapel von Leerenblitz und zeigt eine Timerleiste an."
	L.bolt_message = "%2$dx Blitz: %1$s"

	L.blue = "|cFF0080FFBlau|r"
	L.green = "|cFF088A08Grün|r"
	L.purple = "|cFF9932CDViolett|r"
	L.yellow = "|cFFFFA901Gelb|r"
	L.black = "|cFF424242Schwarz|r"
	L.red = "|cFFFF0404Rot|r"

	L.blobs = "Kugeln"
	L.blobs_bar = "Nächste Kugeln"
	L.blobs_desc = "Die Kugeln spawnen und bewegen sich auf den Boss zu"
end

L = BigWigs:NewBossLocale("Hagara the Stormbinder", "deDE")
if L then
	L.engage_trigger = "Ihr legt euch mit der Sturmbinderin an! Ich werde euch alle vernichten."

	L.lightning_or_frost = "Blitz oder Eis"
	L.ice_next = "Eisphase"
	L.lightning_next = "Blitzphase"

	L.nextphase = "Nächste Phase"
	L.nextphase_desc = "Warnungen für die nächste Phase"
end

L = BigWigs:NewBossLocale("Ultraxion", "deDE")
if L then
	L.engage_trigger = "Jetzt ist die Stunde des Zwielichts!"

	L.warmup = "Warmup"
	L.warmup_desc = "Zeit bis zum Starten des Bosskampfes."
	L.warmup_trigger = "Ich bin der Anfang des Endes, der Schatten, der die Sonne verdunkelt"

	L.crystal = "Buff-Kristalle"
	L.crystal_desc = "Zeigt Timer für die verschiedenen Buff-Kristalle der NPCs an."
	L.crystal_red = "Roter Kristall"
	L.crystal_green = "Grüner Kristall"
	L.crystal_blue = "Blauer Kristall"

	L.twilight = "Zwielicht"
	L.cast = "Zwielicht Zauberleiste"
	L.cast_desc = "Zeigt eine 5 (Normal) oder 3 (Heroisch) sekündige Leiste, wenn Stunde des Zwielichts gewirkt wird."

	L.lightself = "Schwindendes Licht auf Dir"
	L.lightself_desc = "Zeigt eine Leiste mit der verbleibenden Zeit, bis schwindendes Licht Dich explodieren lässt."
	L.lightself_bar = "<Du Explodierst>"

	L.lighttank = "Schwindendes Licht auf Tanks"
	L.lighttank_desc = "Wenn ein Tank von schwindendem Licht betroffen ist, werden eine Timerleiste sowie Flash & Shake für die Explosion angezeigt."
	L.lighttank_bar = "<%s Explodiert>"
	L.lighttank_message = "Explodierender Tank"
end

L = BigWigs:NewBossLocale("Warmaster Blackhorn", "deDE")
if L then
	L.warmup = "Warmup"
	L.warmup_desc = "Zeit bis zum Starten des Bosskampfes."

	L.sunder = "Rüstung zerreißen"
	L.sunder_desc = "Zählt die Stapel von Rüstung zerreißen und zeigt eine Timerleiste an."
	L.sunder_message = "%2$dx Rüstung zerreißen: %1$s"

	L.sapper_trigger = "Ein Drache stürzt herab, um einen Zwielichtpionier auf dem Deck abzusetzen!"
	L.sapper = "Pionier"
	L.sapper_desc = "Der Pionier (Schurke) spawnt und fügt dem Schiff Schaden zu."

	L.stage2_trigger = "Scheint, als ob ich mich selbst drum kümmern muss. Gut!"
end

L = BigWigs:NewBossLocale("Spine of Deathwing", "deDE")
if L then
	L.engage_trigger = "Die Platten! Es zerreißt ihn! Zerlegt die Platten und wir können ihn vielleicht runterbringen."

	L.about_to_roll = "gleich nach"
	L.rolling = "rollt nach"
	L.not_hooked = "DU bist >NICHT< befestigt!"
	L.roll_message = "Er rollt, rollt, rollt!"
	L.level_trigger = "stabilisiert sich"
	L.level_message = "Wieder ausgeglichen!"

	L.exposed = "Rüstung freigelegt"

	L.residue = "Nicht absorbierte Rückstände"
	L.residue_desc = "Teilt mit, wie viele nicht absorbierte Rückstände noch auf dem Rücken liegen."
	L.residue_message = "Rückstände übrig: %d"
end

L = BigWigs:NewBossLocale("Madness of Deathwing", "deDE")
if L then
	L.engage_trigger = "Ihr habt NICHTS erreicht. Ich werde Eure Welt in STÜCKE reißen."

	L.smalltentacles_desc = "Bei 70% und 40% verbleibender Gesundheit sprießen aus den Tentakeln mehrere blasige Tentakel, die gegen Flächenschadenfertigkeiten immun sind."

	L.bolt_explode = "<Blitz Explodiert>"
	L.parasite = "Parasit"
	L.blobs_soon = "%d%% - Gerinnendes Blut bald!"
end

-- Firelands

L = BigWigs:NewBossLocale("Beth'tilac", "deDE")
if L then
	L.flare_desc = "Zeigt eine Timerleiste für Funkenleuchtfeuer."

	L.devastate_message = "Verwüstung #%d"
	L.drone_bar = "Drohne"
	L.drone_message = "Drohne kommt!"
	L.kiss_message = "Kuss"
	L.spinner_warn = "Spinner #%d"
end

L = BigWigs:NewBossLocale("Lord Rhyolith", "deDE")
if L then
	L.armor = "Obsidianrüstung"
	L.armor_desc = "Warnt, wenn Rüstungsstapel von Lord Rhyolith entfernt werden."
	L.armor_message = "Noch %d%% Rüstung"
	L.armor_gone_message = "Rüstung weg!"

	L.adds_header = "Adds"
	L.big_add_message = "Funke kommt!"
	L.small_adds_message = "Fragmente kommen!"

	L.phase2_warning = "Phase 2 bald!"

	L.molten_message = "%dx Stapel auf Rhyolith!"

	L.stomp_message = "Stampfen! Stampfen! Stampfen!"
	L.stomp = "Stampfen"
end

L = BigWigs:NewBossLocale("Alysrazor", "deDE")
if L then
	L.fullpower_soon_message = "Volle Kraft bald!"
	L.halfpower_soon_message = "Phase 4 bald!"
	L.encounter_restart = "Volle Kraft! Es geht wieder los..."
	L.no_stacks_message = "Du hast keine Federn!"
	L.moonkin_message = "Beschaff' dir richtige Federn!"
	L.molt_bar = "Nächste Mauser"

	L.meteor = "Meteor"
	L.meteor_desc = "Warnt, wenn ein Geschmolzener Meteor beschworen wird."
	L.meteor_message = "Meteor!"

	L.stage_message = "Phase %d"
	L.kill_message = "Jetzt oder nie - tötet das Biest!"
	L.engage_message = "Alysrazar angegriffen - Phase 2 in ~%d min"

	L.worm_emote = "Feurige Lavawürmer brechen aus dem Boden hervor!"
	L.phase2_soon_emote = "Alysrazar beginnt, in einem schnellen Kreis zu fliegen!"

	L.flight = "Flughilfe"
	L.flight_desc = "Zeigt eine Timerleiste mit deiner verbleibenden Restdauer von 'Flammenschwingen', sollte am besten mit der 'Stark hervorgehoben'-Funktion verwendet werden."

	L.initiate = "Erscheinen der Initianden"
	L.initiate_desc = "Zeigt Timerleisten für das Auftauchen der Initianden an."
	L.initiate_both = "Beide Initianden"
	L.initiate_west = "Westlicher Initiand"
	L.initiate_east = "Östlicher Initiand"
end

L = BigWigs:NewBossLocale("Shannox", "deDE")
if L then
	L.safe = "%s ist sicher!"
	L.wary_dog = "%s ist aufmerksam!"
	L.crystal_trap = "Kristallfalle"

	L.traps_header = "Fallen"
	L.immolation = "Feuerbrandfalle auf Hunden"
	L.immolation_desc = "Warnt, wenn Augenkratzer oder Wadenbeißer auf eine Feuerbrandfalle tritt."
	L.immolationyou = "Feuerbrandfalle unter Dir"
	L.immolationyou_desc = "Warnt, wenn unter Dir eine Feuerbrandfalle erscheint."
	L.immolationyou_message = "Brandfalle"
	L.crystal = "Kristallgefängnisfalle"
	L.crystal_desc = "Warnt, unter wen Shannox die Kristallgefängnisfalle ablegt."
	L.facerage_trigger = "An die Gurgel!"
end

L = BigWigs:NewBossLocale("Baleroc", "deDE")
if L then
	L.torment = "Anzahl der 'Qual'-Stapel auf Deinem Fokusziel"
	L.torment_desc = "Warnt, wenn Dein /focus weitere 'Qual'-Stapel erhält."

	L.blade_bar = "Nächste Klinge"
	L.shard_message = "Splitter %d!"
	L.focus_message = "Dein Fokus hat %d Stapel!"
	L.link_message = "Verbunden"
end

L = BigWigs:NewBossLocale("Majordomo Staghelm", "deDE")
if L then
	L.seed_explosion = "Du explodierst gleich!"
	L.seed_bar = "Du explodierst!"
	L.adrenaline_message = "%dx Adrenalin!"
	L.leap_say = "Sprung"
end

L = BigWigs:NewBossLocale("Ragnaros", "deDE")
if L then
	L.intermission_end_trigger1 = "Sulfuras wird Euer Ende sein."
	L.intermission_end_trigger2 = "Auf die Knie, Sterbliche! Das ist das Ende."
	L.intermission_end_trigger3 = "Genug! Ich werde dem ein Ende machen."
	L.phase4_trigger = "Zu früh"
	L.seed_explosion = "Samenexplosion!"
	L.intermission_bar = "Phasenübergang"
	L.intermission_message = "Phasenübergang!"
	L.sons_left = "%d |4Sohn noch:Söhne noch;"
	L.engulfing_close = "Innen entflammt!"
	L.engulfing_middle = "Mitte entflammt!"
	L.engulfing_far = "Außen entflammt!"
	L.hand_bar = "Rückstoß"
	L.ragnaros_back_message = "Raggy wieder da, auf geht's!"
end

-- Throne of the Four Winds

L = BigWigs:NewBossLocale("Al'Akir", "deDE")
if L then
	L.stormling = "Sturmling"
	L.stormling_desc = "Warnt vor dem Beschwören der Sturmlinge."

	L.acid_rain = "Säureregen (%d)"

	L.feedback_message = "%dx Rückkopplung"
end

L = BigWigs:NewBossLocale("Conclave of Wind", "deDE")
if L then
	L.gather_strength = "%s sammelt Stärke"

	L["93059_desc"] = "Warnt, wenn Rohash Sturmschild wirkt."

	L.full_power = "Volle Stärke"
	L.full_power_desc = "Warnt, wenn die Bosse volle Stärke erreicht haben und ihre Spezialfähigkeiten wirken."
	L.gather_strength_emote = "%s beinnt von den verbliebenen"
end
