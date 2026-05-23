-- Baradin Hold

local L = BigWigs:NewBossLocale("Occu'thar", "ruRU")
if L then
	L.shadows_bar = "~Тень"
	L.destruction_bar = "<Взрыв>"
	L.eyes_bar = "~Глаза"

	L.fire_message = "Лазер, пиу-пиу!"
	L.fire_bar = "~Лазер"
end

L = BigWigs:NewBossLocale("Alizabal", "ruRU")
if L then
	L.first_ability = "Вертел или Ненависть"
	L.dance_message = "Танец клинков %d из 3"
end

-- Bastion of Twilight

L = BigWigs:NewBossLocale("Halfus Wyrmbreaker", "ruRU")
if L then
	L.strikes_message = "Удары"
	--L.freed_message = "%s freed %s"
end

L = BigWigs:NewBossLocale("Cho'gall", "ruRU")
if L then
	L.orders = "Смена приказа"
	L.orders_desc = "Сообщать когда Чо'Галл сменяет приказы огня/тьмы"

	L.worship_cooldown = "~Поклонение"

	L.adherent_bar = "Адепт #%d"
	L.adherent_message = "Призыв Адепта %d!"
	L.ooze_bar = "Слизни %d"
	L.ooze_message = "Призыв Слизней %d!"

	L.tentacles_bar = "Щупальца"
	L.tentacles_message = "Дискотека Щупалец!"

	L.sickness_message = "Вы больны, и вас сейчас стошнит!"
	L.blaze_message = "Пламя под ТОБОЙ!"
	L.crash_say = "Сокрушение"

	L.fury_message = "Неистовство!"
	L.first_fury_soon = "Скоро Неистовство!"
	L.first_fury_message = "85% - Неистовство Чо'Галла!"

	L.unleashed_shadows = "Освобожденные тени"

	L.phase2_message = "2-я фаза!"
	L.phase2_soon = "Скоро 2-я фаза!"
end

L = BigWigs:NewBossLocale("Valiona and Theralion", "ruRU")
if L then
	L.phase_switch = "Смена фаз"
	L.phase_switch_desc = "Сообщать о смене фаз"

	L.phase_bar = "%s приземляется"
	L.breath_message = "Глубокий вдох!"
	L.dazzling_message = "Шокирующее разрушение!"

	L.blast_message = "Сумеречный взрыв"
	L.engulfingmagic_say = "Избыточная магия"

	L.valiona_trigger = "Тералион, я подожгу коридор. Не дай им уйти!"

	L.twilight_shift = "Сдвиг"
end

L = BigWigs:NewBossLocale("Ascendant Council", "ruRU")
if L then
	L.health_report = "%s имеет %d%% здоровья, скоро смена!"
	L.switch = "Смена"
	L.switch_desc = "Сообщать о смене боссов"

	L.shield_up_message = "ЩИТ!"
	L.shield_down_message = "Щит СПАЛ!"
	L.shield_bar = "Щит"

	L.switch_trigger = "Мы займемся ими!"

	L.thundershock_quake_soon = "%s через 10сек!"

	L.quake_trigger = "Земля уходит у вас из-под ног..."
	L.thundershock_trigger = "Воздух потрескивает от скопившейся энергии..."

	L.thundershock_quake_spam = "%s через %d"

	L.last_phase_trigger = "Ваше упорство..."
end

L = BigWigs:NewBossLocale("Sinestra", "ruRU")
if L then
	L.whelps = "Дракончики"
	L.whelps_desc = "Сообщать о волнах дракончиков"

	L.slicer_message = "Возможные цели луча"

	L.egg_vulnerable = "Время омлета!"

	L.whelps_trigger = "Ешьте, дети мои! Пусть их мясо насытит вас!"
	L.omelet_trigger = "Ты так в этом уверен? Глупец!"

	L.phase13 = "Фаза 1 и 3"
	L.phase = "Фаза"
	L.phase_desc = "Сообщать о смене фаз"
end

-- Blackwing Descent

L = BigWigs:NewBossLocale("Magmaw", "ruRU")
if L then
	L.stage2_yell_trigger = "Непостижимо" -- Непостижимо! Вы, кажется, можете уничтожить моего лавового червяка! Пожалуй, я помогу ему.

	L.slump = "Падение"
	L.slump_desc = "Магмарь падает вперед открывая себя, позволяя начать родео."
	L.slump_bar = "Родео"
	L.slump_message = "Йихо, погнали!"
end

L = BigWigs:NewBossLocale("Omnotron Defense System", "ruRU")
if L then
	L.nef = "Лорд Виктор Нефарий"
	L.nef_desc = "Сообщать о способностях Лорда Виктора Нефария."

	L.pool_explosion = "Обратная вспышка"
	L.incinerate = "Испепеление"
	L.flamethrower = "Огнемет"
	L.lightning = "Проводник молний"
	L.infusion = "Вливание Тьмы"
end

L = BigWigs:NewBossLocale("Atramedes", "ruRU")
if L then
	L.obnoxious_fiend = "Гнусный бес" -- NPC ID 49740
	--L.circles = "Circles"
end

L = BigWigs:NewBossLocale("Maloriak", "ruRU")
if L then
	L.flames = "Пламя"
end

L = BigWigs:NewBossLocale("Nefarian", "ruRU")
if L then
	L.discharge = "Искровой разряд"
	L.stage3_yell_trigger = "Я пытался следовать законам гостеприимства" -- Я пытался следовать законам гостеприимства, но вы всё никак не умрете! Придется отбросить условности и просто... УБИТЬ ВАС ВСЕХ!
end

-- Dragon Soul

L = BigWigs:NewBossLocale("Morchok", "ruRU")
if L then
	L.engage_trigger = "Попробуйте остановить лавину и умрете."

	L.crush_desc = "Считает стаки сокрушения доспеха и показывает таймер."

	L.blood = "Черная кровь"

	L.explosion = "Взрыв"
	L.crystal = "Кристалл"
end

L = BigWigs:NewBossLocale("Warlord Zon'ozz", "ruRU")
if L then
	L.engage_trigger = "Ззоф Шуул'уах. Ток фшш Н'Зот!"

	L.ball = "Сфера"
	L.ball_desc = "Сфера, которая отскакивает от игроков и босса."
	L.ball_yell = "Гул'каф ан'ков Н'Зот."

	--L.ball_active = "Void ball active"
	--L.ball_active_desc = "Timer for when the void ball activates (i.e. it can bounce)."

	L.bounce = "Отскок Сферы"
	L.bounce_desc = "Счетчик для отскакиваний сферы."

	L.darkness = "Дискотека Щупалец!"
	L.darkness_desc = "Эта фаза начинается, когда сфера попадает в босса."

	L.shadows = "Тени"

	L.custom_off_shadows_marker = "Disrupting Shadows marker"
	L.custom_off_shadows_marker_desc = "Mark Disrupting Shadows targets with {rt1}{rt2}{rt3}, requires promoted or leader.\n|cFFFF0000Only 1 person in the raid should have this enabled to prevent marking conflicts.|r"
end

L = BigWigs:NewBossLocale("Yor'sahj the Unsleeping", "ruRU")
if L then
	L.engage_trigger = "Иилт ки'уотк шн'ма йе'глу Шат'Яр! Х'ИУН ИИЛТ!"

	L.bolt_desc = "Считает стаки стрел тьмы и показывает таймер."
	L.bolt_message = "%2$dx Стрела на |3-5(%1$s)"

	L.blue = "|cFF0080FFСиняя|r"
	L.green = "|cFF088A08Зеленая|r"
	L.purple = "|cFF9932CDФиолетовая|r"
	L.yellow = "|cFFFFA901Желтая|r"
	L.black = "|cFF424242Черная|r"
	L.red = "|cFFFF0404Красная|r"

	L.blobs = "Капли"
	L.blobs_bar = "Новые капли"
	L.blobs_desc = "Капли крови двигаются к боссу"
end

L = BigWigs:NewBossLocale("Hagara the Stormbinder", "ruRU")
if L then
	L.engage_trigger = "Вы осмелились бросить вызов владычице штормов?!"

	L.lightning_or_frost = "Грозовая или Ледяная"
	L.ice_next = "Ледяная фаза"
	L.lightning_next = "Грозовая фаза"

	L.nextphase = "Следующая Фаза"
	L.nextphase_desc = "Предупреждать о следующей фазе"
end

L = BigWigs:NewBossLocale("Ultraxion", "ruRU")
if L then
	L.engage_trigger = "Настало Время Сумерек!"

	L.warmup = "Начало боя"
	L.warmup_desc = "Время до начала боя."
	L.warmup_trigger = "Я – начало конца... Тень, что заслоняет солнце..."

	L.crystal = "Мощь Кристаллов"
	L.crystal_desc = "Таймеры для различных кристаллов, даруемых Аспектами."
	L.crystal_red = "Красный Кристалл"
	L.crystal_green = "Зеленый Кристалл"
	L.crystal_blue = "Синий Кристалл"

	L.twilight = "Сумерки"
	L.cast = "Полоса каста Сумерек"
	L.cast_desc = "Показывает 5-ти (Нормал) или 3-х (Героик) секундную полосу каста Сумерек."

	L.lightself = "Гаснущий свет на Тебе"
	L.lightself_desc = "Показывает полосу с таймером взрыва Гаснущего света на тебе."
	L.lightself_bar = "<Ты Взорвешься>"

	L.lighttank = "Гаснущий свет на Танках"
	L.lighttank_desc = "Если Гаснущий свет на танке, показывет полосу взрыва и Мигание/Тряску."
	L.lighttank_bar = "<%s Взорвется>"
	L.lighttank_message = "Взрыв Танка"
end

L = BigWigs:NewBossLocale("Warmaster Blackhorn", "ruRU")
if L then
	L.warmup = "Начало боя"
	L.warmup_desc = "Время до начала боя."

	L.sunder = "Раскол брони"
	L.sunder_desc = "Считает стаки раскола брони и показывает таймер."
	L.sunder_message = "%2$dx Раскол на |3-5(%1$s)"

	L.sapper_trigger = "Дракон пикирует на палубу, чтобы сбросить на нее сумеречного сапера!"
	L.sapper = "Сапер"
	L.sapper_desc = "Сапер наносит повреждения кораблю, если достигнет каюты"

	L.stage2_trigger = "Похоже, мне придется заняться этим самому. Чудесно!"
end

L = BigWigs:NewBossLocale("Spine of Deathwing", "ruRU")
if L then
	L.engage_trigger = "Смотрите, он разваливается! Оторвите пластины, и у нас появится шанс сбить его!"

	L.about_to_roll = "собирается накрениться"
	L.rolling = "наклоняется"
	L.not_hooked = "ВЫ >НЕ< зацеплены!"
	L.roll_message = "Он вращается, вращается, вращается!"
	L.level_trigger = "выравнивается"
	L.level_message = "Неважно, он выравнивается!"

	L.exposed = "Броня Вскрыта"

	L.residue = "Непоглощенный Осадок"
	L.residue_desc = "Сообщения, информирующие вас о том, сколько ещё осадков крови осталось на полу."
	L.residue_message = "Осадков: %d"
end

L = BigWigs:NewBossLocale("Madness of Deathwing", "ruRU")
if L then
	L.engage_trigger = "У вас НИЧЕГО не вышло. Я РАЗОРВУ ваш мир на куски."

	L.smalltentacles_desc = "На 70% и 40% из конечности показываются раскаленные щупальца, на которые не действуют способности, наносящие урон по площади."

	L.bolt_explode = "<Взрыв Стрелы>"
	L.parasite = "Паразит"
	L.blobs_soon = "%d%% - Свертывающаяся кровь скоро!"
end

-- Firelands

L = BigWigs:NewBossLocale("Beth'tilac", "ruRU")
if L then
	L.flare_desc = "Показать таймер для АоЕ."

	L.devastate_message = "Разрушение #%d"
	L.drone_bar = "Трутень"
	L.drone_message = "Появился Трутень!"
	L.kiss_message = "Поцелуй"
	L.spinner_warn = "Ткачи #%d"
end

L = BigWigs:NewBossLocale("Lord Rhyolith", "ruRU")
if L then
	L.armor = "Обсидиановые доспехи"
	L.armor_desc = "Предупрежать, когда с босса спадают стаки доспехов."
	L.armor_message = "Осталось брони: %d%%"
	L.armor_gone_message = "Брони больше нет!"

	L.adds_header = "Помощники"
	L.big_add_message = "Появилась искра!"
	L.small_adds_message = "Появились фрагменты!"

	L.phase2_warning = "Скоро 2-я фаза!"

	L.molten_message = "Обсидиановые доспехи: %d!"

	L.stomp_message = "Поступь! Поступь! Поступь!"
	L.stomp = "Поступь"
end

L = BigWigs:NewBossLocale("Alysrazor", "ruRU")
if L then
	L.fullpower_soon_message = "Скоро Полная мощь!"
	L.halfpower_soon_message = "Скоро 4-я фаза!"
	L.encounter_restart = "Начинаем заново..."
	L.no_stacks_message = "У тебя нет ни 1 пера, дружище"
	L.moonkin_message = "У пингвинов тоже есть крылья...собери три пера и лети!"
	L.molt_bar = "Линька"

	L.meteor = "Метеор"
	L.meteor_desc = "Предупреждать о призыве расплавенного метеора."
	L.meteor_message = "Метеор!"

	L.stage_message = "Фаза %d"
	L.kill_message = "Сейчас или никогда - Убей её!"
	L.engage_message = "Алисразор прилетает - Фаза 2 через ~%d мин"

	L.worm_emote = "На поверхность вылезают огненные лавовые паразиты!"
	L.phase2_soon_emote = "Алисразор начинает летать по кругу!"

	L.flight = "Помощник летчика"
	L.flight_desc = "Отсчитывать время действия эффекта 'Огненные крылья'. Отлично сочетается с функцией 'Супер увеличение'."

	L.initiate = "Появление Друида"
	L.initiate_desc = "Показывать таймер для появления друида."
	L.initiate_both = "Два Друида"
	L.initiate_west = "Друид на Западе"
	L.initiate_east = "Друид на Востоке"
end

L = BigWigs:NewBossLocale("Shannox", "ruRU")
if L then
	L.safe = "%s в безопасности"
	L.wary_dog = "Осторожность на %s!"
	L.crystal_trap = "Кристаллическая ловушка"

	L.traps_header = "Ловушки"
	L.immolation = "Обжигающая ловушка на собаке"
	L.immolation_desc = "Объявлять, когда Лютогрыз или Косоморд попадают в обжигающую ловушку, получая бафф 'Осторожности'."
	L.immolationyou = "Обжигающая ловушка под Тобой"
	L.immolationyou_desc = "Предупреждать, когда обжигающая ловушка появляется под вами."
	L.immolationyou_message = "Обжигающая ловушка"
	L.crystal = "Кристаллическая ловушка"
	L.crystal_desc = "Объявлять, когда Шэннокс бросает кристаллическую ловушку."
	L.facerage_trigger = "Хватай за горло!"
end

L = BigWigs:NewBossLocale("Baleroc", "ruRU")
if L then
	L.torment = "Стаки 'Мучения' на фокусе"
	L.torment_desc = "Объявлять, когда ваш /фокус получает стаки мучения."

	L.blade_bar = "~След. лезвие"
	L.shard_message = "Осколки (%d)!"
	L.focus_message = "У вашего фокуса %d стаков!"
	L.link_message = "Связан"
end

L = BigWigs:NewBossLocale("Majordomo Staghelm", "ruRU")
if L then
	L.seed_explosion = "Скоро взрыв!"
	L.seed_bar = "Взрыв!"
	L.adrenaline_message = "Адреналин x%d!"
	L.leap_say = "Прыжок"
end

L = BigWigs:NewBossLocale("Ragnaros", "ruRU")
if L then
	L.intermission_end_trigger1 = "Сульфурас уничтожит вас!"
	L.intermission_end_trigger2 = "На колени, смертные!"
	L.intermission_end_trigger3 = "Пора покончить с этим."
	L.phase4_trigger = "Слишком рано…"
	L.seed_explosion = "Взрыв семян!"
	L.intermission_bar = "Переходная фаза!"
	L.intermission_message = "Переходная фаза... Получил печеньки?"
	L.sons_left = "Осталось адов: %d"
	L.engulfing_close = "Пламя у босса!"
	L.engulfing_middle = "Пламя по центру!"
	L.engulfing_far = "Пламя с краю!"
	L.hand_bar = "Отбрасывание"
	L.ragnaros_back_message = "Рагнарос вернулся!"
end

-- Throne of the Four Winds

L = BigWigs:NewBossLocale("Al'Akir", "ruRU")
if L then
	L.stormling = "Буревики"
	L.stormling_desc = "Призыв Буревиков."

	L.acid_rain = "Кислотный дождь (%d)"

	L.feedback_message = "%dx Ответная реакция"
end

L = BigWigs:NewBossLocale("Conclave of Wind", "ruRU")
if L then
	L.gather_strength = "%s Набирает Силу!"

	L["93059_desc"] = "Щит поглощает урон"

	L.full_power = "Полная сила"
	L.full_power_desc = "Сообщает когда босс достигает полной силы и начинает применять специальные способности."
	L.gather_strength_emote = "%s начинает вбирать силу оставшихся владык ветра!"
end
