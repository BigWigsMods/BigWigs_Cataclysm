
local L = BigWigs:NewBossLocale("Magmaw", "esES")
if not L then return end
if L then
	L.stage2_yell_trigger = "¡Inconcebible! ¡Existe la posibilidad de que venzáis a mi gusano de lava! Quizás yo pueda... desequilibrar la balanza."

	L.slump = "Cae"
	L.slump_desc = "Cae hacia delante exponiendose a sí mismo, permitiendo que el rodeo empiece."
	L.slump_bar = "Rodeo"
	L.slump_message = "¡Yeepah, móntalo!"
	L.slump_emote_trigger = "¡%s cae hacia delante y deja expuestas sus tenazas!"

	L.expose_emote_trigger = "cabeza"
end

L = BigWigs:NewBossLocale("Omnotron Defense System", "esES")
if L then
	L.nef = "Lord Victor Nefarius"
	L.nef_desc = "Avisos para las abilidades de Lord Victor Nefarius"

	L.pool = "Generador de poder sobrecargado"
end

L = BigWigs:NewBossLocale("Chimaeron", "esES")
if L then
	L.bileotron_engage = "El Bilistrón se activa y empieza a emitir una sustancia de olor asqueroso."

	L.next_system_failure = "Siguiente fallo del sistema"

	L.phase2_message = "¡Fase de Mortalidad pronto!"
end

L = BigWigs:NewBossLocale("Atramedes", "esES")
if L then
	L.ground_phase = "Fase en tierra"
	L.ground_phase_desc = "Avisa cuando Atramedes aterriza."
	L.air_phase = "Fase aérea"
	L.air_phase_desc = "Avisa cuando Atramedes despega."

	L.air_phase_trigger = "¡Sí, corred! Con cada paso, vuestros corazones se aceleran. El latido, fuerte y clamoroso... Casi ensordecedor. ¡No podéis escapar!"

	L.obnoxious_soon = "¡Maligno Execrable inminente!"

	L.searing_soon = "¡Llamas abrasadoras en 10 seg!"
end

L = BigWigs:NewBossLocale("Maloriak", "esES")
if L then
	--heroic
	L.sludge = "Fango oscuro"
	L.sludge_desc = "Avisa cuando pisas Fango oscuro."
	L.sludge_message = "¡Fango en TI!"

	--normal
	L.final_phase = "Fase final"
	L.final_phase_soon = "¡Fase final pronto!"

	L.release_aberration_message = "¡%s adds restantes!"
	L.release_all = "¡%s adds liberados!"

	L.phase = "Fase"
	L.phase_desc = "Avisa los cambios de fase."
	L.next_phase = "Siguiente fase"
	L.green_phase_bar = "Fase Verde"

	L.red_phase_trigger = "Mezclar y agitar, aplicar calor..."
	L.red_phase_emote_trigger = "rojo"
	L.red_phase = "Fase |cFFFF0000Roja|r"
	L.blue_phase_trigger = "¿Cómo afecta el cambio extremo de temperatura al cuerpo mortal? ¡Debo averiguarlo! ¡Por la ciencia!"
	L.blue_phase_emote_trigger = "azul"
	L.blue_phase = "Fase |cFF809FFEAzul|r"
	L.green_phase_trigger = "Este es un poco inestable, pero ¿acaso hay progreso sin fracaso?"
	L.green_phase_emote_trigger = "verde"
	L.green_phase = "Fase |cFF33FF00Verde|r"
	L.dark_phase_trigger = "¡Tus mezclas son flojas, Maloriak! ¡Necesitan un poco más de... sustancia!"
	L.dark_phase_emote_trigger = "oscura"
	L.dark_phase = "Fase |cFF660099Oscura|r"
end

L = BigWigs:NewBossLocale("Nefarian", "esES")
if L then
	L.phase = "Fases"
	L.phase_desc = "Avisa los cambios de fase."

	L.discharge_bar = "Descarga"

	L.phase_two_trigger = "¡Os maldigo, mortales! ¡Ese cruel menosprecio por las posesiones de uno debe ser castigado con fuerza extrema!"

	L.phase_three_trigger = "He intentado ser un buen anfitrión"

	L.crackle_trigger = "¡El aire crepita cargado de electricidad!"
	L.crackle_message = "¡Electrocutar pronto!"

	--L.shadowblaze_trigger = "Flesh turns to ash!"
	L.shadowblaze_message = "Fuego"

	L.onyxia_power_message = "¡Explosión pronto!"

	L.chromatic_prototype = "Prototipo cromático" -- 3 adds name
end
