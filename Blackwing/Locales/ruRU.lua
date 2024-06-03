
local L = BigWigs:NewBossLocale("Magmaw", "ruRU")
if not L then return end
if L then
	L.stage2_yell_trigger = "Непостижимо! Вы, кажется, можете уничтожить моего лавового червяка! Пожалуй, я помогу ему."

	L.slump = "Падение"
	L.slump_desc = "Магмарь падает вперед открывая себя, позволяя начать родео."
	L.slump_bar = "Родео"
	L.slump_message = "Йихо, погнали!"
	L.slump_emote_trigger = "%s внезапно падает, выставляя клешни!"

	L.expose_emote_trigger = "голову"
end

L = BigWigs:NewBossLocale("Omnotron Defense System", "ruRU")
if L then
	L.nef = "Лорд Виктор Нефарий"
	L.nef_desc = "Сообщать о способностях Лорда Виктора Нефария."

	L.pool = "Обратная вспышка"
end

L = BigWigs:NewBossLocale("Chimaeron", "ruRU")
if L then
	L.bileotron_engage = "Желче-трон оживает и начинает извергать из себя некое вонючее вещество."

	L.next_system_failure = "Системная ошибка"

	L.phase2_message = "Скоро фаза Смертности!"
end

L = BigWigs:NewBossLocale("Atramedes", "ruRU")
if L then
	L.ground_phase = "Наземная фаза"
	L.ground_phase_desc = "Сообщать о приземлении Атрамеда."
	L.air_phase = "Воздушная фаза"
	L.air_phase_desc = "Сообщать о взлете Атрамеда."

	L.air_phase_trigger = "Да, беги! С каждым шагом твое сердце бьется все быстрее. Эти громкие, оглушительные удары... Тебе некуда бежать!"

	L.obnoxious_soon = "Скоро Несносность Беса!"

	L.searing_soon = "Жгучее пламя через 10сек!"
end

L = BigWigs:NewBossLocale("Maloriak", "ruRU")
if L then
	--heroic
	L.sludge = "Темная жижа"
	L.sludge_desc = "Сообщает, если вы стоите в Темной жиже."
	L.sludge_message = "Жижа на ТЕБЕ!"

	--normal
	L.final_phase = "Финальная фаза"
	L.final_phase_soon = "Скоро финальная фаза!"

	L.release_aberration_message = "%s аберраций осталось!"
	L.release_all = "%s аберрации!"

	L.phase = "Фазы"
	L.phase_desc = "Сообщать о смене фаз."
	L.next_phase = "Новая фаза"
	L.green_phase_bar = "Зеленая фаза"

	L.red_phase_trigger = "Помешивая, довести до кипения..."
	L.red_phase_emote_trigger = "красный"
	L.red_phase = "|cFFFF0000Красная|r фаза"
	L.blue_phase_trigger = "Как смертная оболочка переносит резкие скачки температуры? Надо выяснить! ВО ИМЯ НАУКИ!"
	L.blue_phase_emote_trigger = "синий"
	L.blue_phase = "|cFF809FFEСиняя|r фаза"
	L.green_phase_trigger = "Никак не удается стабилизировать, но без ошибок нет прогресса!"
	L.green_phase_emote_trigger = "зеленый"
	L.green_phase = "|cFF33FF00Зеленая|r фаза"
	L.dark_phase_trigger = "Слабоваты твои настои, Малориак! Подбавить бы к ним... специй!"
	L.dark_phase_emote_trigger = "темную"
	L.dark_phase = "|cFF660099Темная|r фаза"
end

L = BigWigs:NewBossLocale("Nefarian", "ruRU")
if L then
	L.phase = "Фазы"
	L.phase_desc = "Сообщать о смене фаз."

	L.discharge_bar = "Искровой разряд"

	L.phase_two_trigger = "Дерзкие смертные! Неуважение к чужой собственности нужно пресекать самым жестоким образом!"

	L.phase_three_trigger = "Я пытался следовать законам гостеприимства"

	L.crackle_trigger = "В воздухе трещат электрические разряды!"
	L.crackle_message = "Скоро Электрический удар!"

	--L.shadowblaze_trigger = "Flesh turns to ash!"
	L.shadowblaze_message = "Пламя тени"

	L.onyxia_power_message = "Скоро Взрыв!"

	L.chromatic_prototype = "Хроматический прообраз"
end
