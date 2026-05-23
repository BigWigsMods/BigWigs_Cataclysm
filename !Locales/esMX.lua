-- Baradin Hold

local L = BigWigs:NewBossLocale("Occu'thar", "esMX")
if L then
	L.shadows_bar = "~Sombras abrasadoras"
	L.destruction_bar = "<Explosión inminente>"
	L.eyes_bar = "~Ojos"

	L.fire_message = "Láser, Piu Piu"
	L.fire_bar = "~Láser"
end

L = BigWigs:NewBossLocale("Alizabal", "esMX")
if L then
	L.first_ability = "Odio o Ensartar"
	L.dance_message = "Danza de hojas %d de 3"
end

-- Bastion of Twilight

L = BigWigs:NewBossLocale("Halfus Wyrmbreaker", "esMX")
if L then
	L.strikes_message = "Golpes"
	--L.freed_message = "%s freed %s"
end

L = BigWigs:NewBossLocale("Cho'gall", "esMX")
if L then
	L.orders = "Cambios de posición"
	L.orders_desc = "Avisa cuando Cho'gall cambia el orden de posiciones entre Sombra/Llama."

	L.crash_say = "Colisión"
	L.worship_cooldown = "~Conversión"
	L.adherent_bar = "Gran add #%d"
	L.adherent_message = "¡Add %d aparece!"
	L.ooze_bar = "Enjambre de mocos %d"
	L.ooze_message = "¡Enjambre de mocos %d inminente!"
	L.tentacles_bar = "Aparecen tentáculos"
	L.tentacles_message = "¡Fiesta de tentáculos!"
	L.sickness_message = "¡Te sientes fatal!"

	L.blaze_message = "¡Fuego en TI!"

	L.fury_message = "¡Furia!"
	L.first_fury_soon = "¡Furia inminente!"
	L.first_fury_message = "¡85% - comienza la Furia!"

	L.unleashed_shadows = "Sombras desatadas"

	L.phase2_message = "¡Fase 2!"
	L.phase2_soon = "¡Fase 2 inminente!"
end

L = BigWigs:NewBossLocale("Valiona and Theralion", "esMX")
if L then
	L.phase_switch = "Cambio de fase"
	L.phase_switch_desc = "Avisa los cambios de fase"

	L.phase_bar = "%s aterriza"
	L.breath_message = "¡Aliento profundo inminente!"
	L.dazzling_message = "¡Zonas espirales inminentes!"

	L.blast_message = "Explosión en caída" --Sounds better and makes more sense than Twilight Blast (the user instantly knows something is coming from the sky at them)
	L.engulfingmagic_say = "Trago de magia"

	L.valiona_trigger = "Theralion, voy a incendiar el corredor. ¡Que no escapen!"

	L.twilight_shift = "Cambio"
end

L = BigWigs:NewBossLocale("Sinestra", "esMX")
if L then
	L.whelps = "Crías"
	L.whelps_desc = "Aviso para la oleada de crías."

	--L.slicer_message = "Possible Orb targets"

	L.egg_vulnerable = "¡Hora de la tortilla!"

	L.whelps_trigger = "Feed, children!  Take your fill from their meaty husks!"
	L.omelet_trigger = "You mistake this for weakness?  Fool!"

	L.phase13 = "Fase 1 y 3"
	L.phase = "Fase"
	L.phase_desc = "Avisa los cambios de fase"
end

L = BigWigs:NewBossLocale("Ascendant Council", "esMX")
if L then
	L.health_report = "%s está al %d%% de vida, ¡cambio pronto!"
	L.switch = "Cambio"
	L.switch_desc = "Avisa los cambios de jefes"

	L.shield_up_message = "¡El escudo está ALTO!"
	L.shield_down_message = "¡El escudo está BAJO!"
	L.shield_bar = "Escudo"

	L.switch_trigger = "¡Nos ocuparemos de ellos!"

	L.thundershock_quake_soon = "¡%s en 10 seg!"

	L.quake_trigger = "El suelo bajo tus pies empieza a temblar ominosamente..."
	L.thundershock_trigger = "El aire circundante chisporrotea de energía..."

	L.thundershock_quake_spam = "%s en %d"

	L.last_phase_trigger = "Una exhibición impresionante..."
end

-- Blackwing Descent

L = BigWigs:NewBossLocale("Magmaw", "esMX")
if L then
	L.stage2_yell_trigger = "Inconcebible" -- ¡Inconcebible! ¡Es posible que venzan a mi gusano de lava! Quizás yo pueda... desequilibrar la balanza.

	L.slump = "Cae"
	L.slump_desc = "Cae hacia delante exponiendose a sí mismo, permitiendo que el rodeo empiece."
	L.slump_bar = "Rodeo"
	L.slump_message = "¡Yeepah, móntalo!"
end

L = BigWigs:NewBossLocale("Omnotron Defense System", "esMX")
if L then
	L.nef = "Lord Victor Nefarius"
	L.nef_desc = "Avisos para las abilidades de Lord Victor Nefarius"

	L.pool_explosion = "Generador de poder sobrecargado"
	L.incinerate = "Incinerar"
	L.flamethrower = "Lanzallamas"
	L.lightning = "Relámpago"
	L.infusion = "Infusión"
end

L = BigWigs:NewBossLocale("Atramedes", "esMX")
if L then
	L.obnoxious_fiend = "Maligno execrable" -- NPC ID 49740
	--L.circles = "Circles"
end

L = BigWigs:NewBossLocale("Maloriak", "esMX")
if L then
	L.flames = "Llamas"
end

L = BigWigs:NewBossLocale("Nefarian", "esMX")
if L then
	L.discharge = "Descarga"
	L.stage3_yell_trigger = "He intentado ser un buen anfitrión" -- ¡He intentado ser un buen anfitrión, pero rehusaron morir! Hora de dejar de fingir y... ¡MATARLOS A TODOS!
end

-- Dragon Soul

L = BigWigs:NewBossLocale("Morchok", "esMX")
if L then
	L.engage_trigger = "Pretendéis detener una avalancha. Os sepultaré."

	L.crush_desc = "Muestra los stacs de Machacar armadura y una barra con su duración."

	L.blood = "Sangre"

	L.explosion = "Explosión"
	L.crystal = "Cristal"
end

L = BigWigs:NewBossLocale("Warlord Zon'ozz", "esMX")
if L then
	L.engage_trigger = "Zzof Shuul'wah. ¡Thoq fssh N'Zoth!"

	L.ball = "Esfera de vacío"
	L.ball_desc = "Una esfera de vacío que rebota entre jugadores y el jefe."
	L.ball_yell = "Gul'kafh an'qov N'Zoth."

	--L.ball_active = "Void ball active"
	--L.ball_active_desc = "Timer for when the void ball activates (i.e. it can bounce)."

	L.bounce = "Rebotar Esfera de vacío"
	L.bounce_desc = "Contador para el rebote de la Esfera de vacío."

	L.darkness = "¡Fiesta de tentáculos!"
	L.darkness_desc = "Esta fase comienza, cuando la esfera de vacío golpea al jefe."

	L.shadows = "Sombras"

	L.custom_off_shadows_marker = "Disrupting Shadows marker"
	L.custom_off_shadows_marker_desc = "Mark Disrupting Shadows targets with {rt1}{rt2}{rt3}, requires promoted or leader.\n|cFFFF0000Only 1 person in the raid should have this enabled to prevent marking conflicts.|r"
end

L = BigWigs:NewBossLocale("Yor'sahj the Unsleeping", "esMX")
if L then
	L.engage_trigger = "¡Iilth qi'uothk shn'ma yeh'glu Shath'Yar! ¡H'IWN IILTH!"

	L.bolt_desc = "Cuenta los stacs de Descarga de Vacío y muestra una barra con su duración."
	L.bolt_message = "%2$dx Descarga en %1$s"

	L.blue = "|cFF0080FFAzul|r"
	L.green = "|cFF088A08Verde|r"
	L.purple = "|cFF9932CDMorado|r"
	L.yellow = "|cFFFFA901Amarillo|r"
	L.black = "|cFF424242Negro|r"
	L.red = "|cFFFF0404Rojo|r"

	L.blobs = "Manchas"
	L.blobs_bar = "Próxima Mancha"
	L.blobs_desc = "Las Manchas se mueven hacia el jefe"
end

L = BigWigs:NewBossLocale("Hagara the Stormbinder", "esMX")
if L then
	L.engage_trigger = "¡Os enfrentáis a la Vinculatormentas! Os mataré a todos."

	L.lightning_or_frost = "Relámpago o Hielo"
	L.ice_next = "Fase de Hielo"
	L.lightning_next = "Fase de Relámpago"

	L.nextphase = "Siguiente Fase"
	L.nextphase_desc = "Avisos para la siguiente fase"
end

L = BigWigs:NewBossLocale("Ultraxion", "esMX")
if L then
	L.engage_trigger = "¡Ha llegado la Hora del Crepúsculo!"

	L.warmup = "Calentamiento"
	L.warmup_desc = "Tiempo de calentamiento"
	L.warmup_trigger = "Soy el principio del fin, la sombra que eclipsa el Sol, la campana que tañe por tu muerte."

	L.crystal = "Cristales de mejora"
	L.crystal_desc = "Contadores para varios cristales de mejora que invocan los NPC's."
	L.crystal_red = "Cristal rojo"
	L.crystal_green = "Cristal verde"
	L.crystal_blue = "Cristal azul"

	L.twilight = "Crepúsculo"
	L.cast = "Crepúsculo barra de casteo"
	L.cast_desc = "Mostrar una barra de 5 segundos cuando se esté casteando Crepúsculo."

	L.lightself = "Luz mortecina en TI"
	L.lightself_desc = "Mostrar una barra que visualice el tiempo restante hasta que Luz mortecina te haga explotar."
	L.lightself_bar = "<Explotas>"

	L.lighttank = "Luz mortecina en tanques"
	L.lighttank_desc = "Si un tanque tiene Luz mortecina, muestra una barra y un Flash para la explosión."
	L.lighttank_bar = "<%s Explota>"
	L.lighttank_message = "Tanque explotando"
end

L = BigWigs:NewBossLocale("Warmaster Blackhorn", "esMX")
if L then
	L.warmup = "Calentamiento"
	L.warmup_desc = "Tiempo hasta que el combate comience."

	L.sunder = "Hender armadura"
	L.sunder_desc = "Muestra los stacs de Hender armadura y una barra con su duración."
	L.sunder_message = "%2$dx Hender en %1$s"

	L.sapper_trigger = "¡Un draco desciende para dejar a un zapador Crepuscular en la cubierta!"
	L.sapper = "Zapador"
	L.sapper_desc = "El Zapador intenta dañar la nave"

	L.stage2_trigger = "Parece que voy a tener que hacerlo yo. ¡Bien!"
end

L = BigWigs:NewBossLocale("Spine of Deathwing", "esMX")
if L then
	L.engage_trigger = "¡Las placas! ¡Se está deshaciendo! ¡Destrozad las placas y tendremos una oportunidad de derribarlo!"

	L.about_to_roll = "a punto de girar"
	L.rolling = "rueda hacia la"
	L.not_hooked = "¡>NO< estás enganchado!"
	L.roll_message = "¡Está girando, girando, girando!"
	L.level_trigger = "se estabiliza."
	L.level_message = "¡Bueno, se ha estabilizado!"

	L.exposed = "Armadura expuesta"

	L.residue = "Residuos no absorbidos"
	L.residue_desc = "Mensajes que te informan cuanto residuo de sangre queda en el suelo."
	L.residue_message = "Residuos no absorbidos: %d"
end

L = BigWigs:NewBossLocale("Madness of Deathwing", "esMX")
if L then
	L.engage_trigger = "No habéis hecho nada. Destruiré vuestro mundo."

	-- Copy & Paste from Encounter Journal with correct health percentages (type '/dump (C_EncounterJournal.GetSectionInfo(4103)).title' in the game)
	L.smalltentacles_desc = "At 70% and 40% remaining health the Limb Tentacle sprouts several Blistering Tentacles that are immune to Area of Effect abilities."

	L.bolt_explode = "<Descarga Explota>"
	L.parasite = "Parásito"
	L.blobs_soon = "%d%% - Sangre coagulante inminente!"
end

-- Firelands

L = BigWigs:NewBossLocale("Beth'tilac", "esMX")
if L then
	L.flare_desc = "Show a timer bar for AoE flare."
	L.devastate_message = "Devastación #%d"
	L.drone_bar = "Zángano"
	L.drone_message = "¡Zángano aparece!"
	L.kiss_message = "Beso"
	L.spinner_warn = "Hiladoras #%d"
end

L = BigWigs:NewBossLocale("Lord Rhyolith", "esMX")
if L then
	L.armor = "Armadura obsidiana"
	L.armor_desc = "Avisar cuando los stacs de armadura estén desapareciendo de Piroclaso."
	L.armor_message = "%d%% armadura restante"
	L.armor_gone_message = "¡Armadura destruida!"

	L.adds_header = "Adds"
	L.big_add_message = "¡Aparece una Chispa!"
	L.small_adds_message = "¡Aparecen fragmentos pequeños!"

	L.phase2_warning = "Fase 2 inminente!"

	L.molten_message = "%dx stacks en el jefe!"

	L.stomp_message = "¡Pisotón! ¡Pisotón! ¡Pisotón!"
	L.stomp = "Pisotón"
end

L = BigWigs:NewBossLocale("Alysrazor", "esMX")
if L then
	L.fullpower_soon_message = "¡Poder máximo inminente!"
	L.halfpower_soon_message = "¡Fase 4 inminente!"
	L.encounter_restart = "Aquí vamos otra vez ..."
	L.no_stacks_message = "No sé si te importa, pero no tienes plumas"
	L.moonkin_message = "Deja de fingir y consigue plumas de verdad"
	L.molt_bar = "Siguiente Muda"

	L.meteor = "Meteorito"
	L.meteor_desc = "Avisa cuando un meteorito de lava es invocado."
	L.meteor_message = "¡Meteorito!"

	L.stage_message = "Fase %d"
	L.kill_message = "Ahora o nunca - ¡Mátalo!"
	L.engage_message = "Alysrazor activado - Fase 2 en ~%d min"

	L.worm_emote = "¡Gusanos de lava ígneos surgen del suelo!"
	L.phase2_soon_emote = "Alysrazor empieza a volar rápido en círculos."

	L.flight = "Asistente de vuelo"
	L.flight_desc = "Muestra una barra con la duración de 'Alas de llamas' en ti, es ideal usarlo con la opción de Super Enfatizar."

	L.initiate = "Iniciado aparece"
	L.initiate_desc = "Muestra contadores para reaparición de iniciados."
	L.initiate_both = "Ambos iniciados"
	L.initiate_west = "Iniciado al Oeste"
	L.initiate_east = "Iniciado al Este"
end

L = BigWigs:NewBossLocale("Shannox", "esMX")
if L then
	L.safe = "%s a salvo"
	L.wary_dog = "¡%s es cauteloso!"
	L.crystal_trap = "Prisión de cristal"

	L.traps_header = "Trampas"
	L.immolation = "Trampa de inmolación en Perro"
	L.immolation_desc = "Alerta cuando Rostrofuria o Desmembrador pisen una trampa de inmolación, ganando el bufo 'Cautela'."
	L.immolationyou = "Trampa de inmolación debajo de TI"
	L.immolationyou_desc = "Alerta cuando una trampa de inmolación aparezca debajo de ti."
	L.immolationyou_message = "Trampa de inmolación"
	L.crystal = "Trampa de cristal"
	L.crystal_desc = "Avisa a quien Shannox lance una trampa de cristal debajo."
	--L.facerage_trigger = "Go for the throat!"
end

L = BigWigs:NewBossLocale("Baleroc", "esMX")
if L then
	L.torment = "Stacs de Tormento en Foco"
	L.torment_desc = "Avisa cuando tu /focus gana otro stac de Tormento."

	L.blade_bar = "~Siguiente Hoja"
	L.shard_message = "¡Fragmento morado (%d)!"
	L.focus_message = "¡Tu foco tiene %d stacks!"
	L.link_message = "Enlazado"
end

L = BigWigs:NewBossLocale("Majordomo Staghelm", "esMX")
if L then
	L.seed_explosion = "¡Explotarás pronto!"
	L.seed_bar = "¡Explotas!"
	L.adrenaline_message = "¡Adrenalina x%d!"
	L.leap_say = "Salto"
end

L = BigWigs:NewBossLocale("Ragnaros", "esMX")
if L then
	L.intermission_end_trigger1 = "Sulfuras será vuestro fin."
	L.intermission_end_trigger2 = "¡De rodillas, mortales! Esto termina ahora."
	L.intermission_end_trigger3 = "¡Basta! Yo terminaré esto."
	L.phase4_trigger = "¡Pronto!... Habéis venido demasiado pronto..." --verificar
	L.seed_explosion = "¡Explosión de semillas!"
	L.intermission_bar = "¡Intermisión!"
	L.intermission_message = "Intermisión... ¿Tienes galletas?"
	L.sons_left = "%d |4hijo restante:hijos restantes;"
	L.engulfing_close = "¡Sección cercana sumergida!"
	L.engulfing_middle = "¡Sección central sumergida!"
	L.engulfing_far = "¡Sección lejana sumergida"
	L.hand_bar = "Rebote"
	L.ragnaros_back_message = "¡Raggy ha vuelto, fiesta!"
end

-- Throne of the Four Winds

L = BigWigs:NewBossLocale("Al'Akir", "esMX")
if L then
	L.stormling = "Tormentillas"
	L.stormling_desc = "Invoca Tormentillas."

	L.acid_rain = "Lluvia ácida (%d)"

	L.feedback_message = "%dx Rebote"
end

L = BigWigs:NewBossLocale("Conclave of Wind", "esMX")
if L then
	L.gather_strength = "%s empieza a extraer fuerza"

	L["93059_desc"] = "Escudo de absorción"

	L.full_power = "Poder Máximo"
	L.full_power_desc = "Avisa cuando los jefes alcanzan Poder Máximo y empiezan a lanzar las abilidades especiales."
	L.gather_strength_emote = "¡%s empieza a extraer fuerza de los señores del viento que quedan!"
end
