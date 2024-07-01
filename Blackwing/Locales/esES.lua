
local L = BigWigs:NewBossLocale("Magmaw", "esES")
if not L then return end
if L then
	L.stage2_yell_trigger = "¡Inconcebible! ¡Existe la posibilidad de que venzáis a mi gusano de lava! Quizás yo pueda... desequilibrar la balanza."

	L.slump = "Cae"
	L.slump_desc = "Cae hacia delante exponiendose a sí mismo, permitiendo que el rodeo empiece."
	L.slump_bar = "Rodeo"
	L.slump_message = "¡Yeepah, móntalo!"
end

L = BigWigs:NewBossLocale("Omnotron Defense System", "esES")
if L then
	L.nef = "Lord Victor Nefarius"
	L.nef_desc = "Avisos para las abilidades de Lord Victor Nefarius"

	L.pool_explosion = "Generador de poder sobrecargado"
	L.incinerate = "Incinerar"
	L.flamethrower = "Lanzallamas"
	L.lightning = "Relámpago"
	L.infusion = "Infusión"
end

L = BigWigs:NewBossLocale("Atramedes", "esES")
if L then
	L.obnoxious_fiend = "Maligno execrable" -- NPC ID 49740
	L.air_phase_trigger = "¡Sí, corred! Con cada paso, vuestros corazones se aceleran. El latido, fuerte y clamoroso... Casi ensordecedor. ¡No podéis escapar!"
end

L = BigWigs:NewBossLocale("Maloriak", "esES")
if L then
	L.flames = "Llamas"
	L.dark_phase_emote_trigger = "oscura"
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
