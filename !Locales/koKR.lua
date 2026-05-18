-- Baradin Hold

local L = BigWigs:NewBossLocale("Occu'thar", "koKR")
if L then
	L.shadows_bar = "~암흑"
	L.destruction_bar = "<폭발>"
	L.eyes_bar = "~눈"

	L.fire_message = "레이저, 퓨~ 퓨~"
	L.fire_bar = "~레이저"
end

L = BigWigs:NewBossLocale("Alizabal", "koKR")
if L then
	L.first_ability = "꿰기 또는 증오"
	L.dance_message = "칼춤 %d / 3"
end

-- Bastion of Twilight

L = BigWigs:NewBossLocale("Halfus Wyrmbreaker", "koKR")
if L then
	L.strikes_message = "악의의 일격"
	--L.freed_message = "%s freed %s"
end

L = BigWigs:NewBossLocale("Cho'gall", "koKR")
if L then
	L.orders = "상태 변경"
	L.orders_desc = "초갈의 그림자/불꽃의 명령 상태를 알립니다."

	L.worship_cooldown = "~개종"

	L.adherent_bar = "코끼리 추가 (%d)"
	L.adherent_message = "코끼리 (%d) 소환!"
	L.ooze_bar = "슬라임 추가 (%d)"
	L.ooze_message = "곧 슬라임 (%d) 추가!"

	L.tentacles_bar = "촉수 소환"
	L.tentacles_message = "촉수 디스코 파티!"

	L.sickness_message = "당신은 피부 트러블!"
	L.blaze_message = "당신은 불꽃!"
	L.crash_say = "부패의 충돌"

	L.fury_message = "격노!"
	L.first_fury_soon = "곧 격노!"
	L.first_fury_message = "85% - 격노 시작 & 곧 코끼리!"

	L.unleashed_shadows = "해방된 어둠"

	L.phase2_message = "2 단계!"
	L.phase2_soon = "곧 2 단계!"
end

L = BigWigs:NewBossLocale("Valiona and Theralion", "koKR")
if L then
	L.phase_switch = "단계 전환"
	L.phase_switch_desc = "단계 전환을 알립니다."

	L.phase_bar = "%s 착지"
	L.breath_message = "곧 깊은 숨결!"
	L.dazzling_message = "곧 황혼 세계"

	L.blast_message = "황혼 폭발"
	L.engulfingmagic_say = "사로잡힌 마법"

	L.valiona_trigger = "테랄리온, 내가 전당에 불을 뿜겠다. 놈들의 퇴로를 막아라!"

	L.twilight_shift = "황혼 이동"
end

L = BigWigs:NewBossLocale("Sinestra", "koKR")
if L then
	L.whelps = "새끼용"
	L.whelps_desc = "새끼용 웨이브를 알립니다."

	L.slicer_message = "예상되는 구슬 대상"

	L.egg_vulnerable = "알 요리 시간!"

	L.whelps_trigger = "얘들아, 먹어치워라"
	L.omelet_trigger = "이게 약해진 걸로 보이느냐"

	L.phase13 = "1 & 3 단계"
	L.phase = "단계"
	L.phase_desc = "단계 변화에 대해 알립니다."
end

L = BigWigs:NewBossLocale("Ascendant Council", "koKR")
if L then
	L.health_report = "%s 체력 -%d%%-, 곧 단계 변화!"
	L.switch = "전환"
	L.switch_desc = "보스의 전환을 알립니다."

	L.shield_up_message = "방패 사용!"
	L.shield_down_message = "방패 사라짐!"
	L.shield_bar = "다음 방패"

	L.switch_trigger = "우리가 상대하겠다!"

	L.thundershock_quake_soon = "10초 후 %s!"

	L.quake_trigger = "발밑의 땅이 불길하게 우르릉거립니다..."
	L.thundershock_trigger = "주변의 공기가 에너지로 진동합니다..."

	L.thundershock_quake_spam = "%2$d초 후 %1$s"

	L.last_phase_trigger = "꽤나 인상적이었다만..."
end

-- Blackwing Descent

L = BigWigs:NewBossLocale("Magmaw", "koKR")
if L then
	L.stage2_yell_trigger = "이러다간 내 용암" -- 이런 곤란할 데가! 이러다간 내 용암 벌레가 정말 질 수도 있겠군! 그럼... 내가 상황을 좀 바꿔 볼까?

	L.slump = "슬럼프"
	L.slump_desc = "슬럼프 상태를 알립니다."
	L.slump_bar = "로데오"
	L.slump_message = "올라타세요~!"
end

L = BigWigs:NewBossLocale("Omnotron Defense System", "koKR")
if L then
	L.nef = "군주 빅터 네파리우스"
	L.nef_desc = "군주 빅터 네파리우스의 기술을 알립니다."

	L.pool_explosion = "바닥 웅덩이 폭발"
	L.incinerate = "소각"
	L.flamethrower = "화염방사기"
	L.lightning = "번개"
	L.infusion = "주입"
end

L = BigWigs:NewBossLocale("Atramedes", "koKR")
if L then
	L.obnoxious_fiend = "불쾌한 마귀" -- NPC ID 49740
	--L.circles = "Circles"
end

L = BigWigs:NewBossLocale("Maloriak", "koKR")
if L then
	L.flames = "불꽃"
end

L = BigWigs:NewBossLocale("Nefarian", "koKR")
if L then
	L.discharge = "번개 방출"
	L.stage3_yell_trigger = "버리겠어" -- 품위 있는 집주인답게 행동하려 했건만, 네놈들이 도무지 죽질 않는군! 겉치레는 이제 집어치우자고. 그냥 모두 없애 버리겠어!
end

-- Dragon Soul

L = BigWigs:NewBossLocale("Morchok", "koKR")
if L then
	L.engage_trigger = "계란으로 바위를 치려 드는군. 내가 널 묻어주마."

	L.crush_desc = "갑옷 으깨기의 지속시간 바와 중첩 횟수를 표시합니다."

	L.blood = "검은 피"

	L.explosion = "폭발"
	L.crystal = "수정"
end

L = BigWigs:NewBossLocale("Warlord Zon'ozz", "koKR")
if L then
	L.engage_trigger = "조브 슐와. 토크 프쉬 느조스!"

	L.ball = "공허 구슬"
	L.ball_desc = "플레이어와 보스 사이를 오가는 공허 구슬입니다."
	L.ball_yell = "굴카와스 언고브 느조스."

	--L.ball_active = "Void ball active"
	--L.ball_active_desc = "Timer for when the void ball activates (i.e. it can bounce)."

	L.bounce = "공허 구슬 튕김"
	L.bounce_desc = "구슬이 튕긴 횟수를 카운트합니다."

	L.darkness = "촉수 디스코 파티!"
	L.darkness_desc = "구슬이 보스에게 닿으면 이 단계가 시작 됩니다."

	L.shadows = "그림자"

	L.custom_off_shadows_marker = "Disrupting Shadows marker"
	L.custom_off_shadows_marker_desc = "Mark Disrupting Shadows targets with {rt1}{rt2}{rt3}, requires promoted or leader.\n|cFFFF0000Only 1 person in the raid should have this enabled to prevent marking conflicts.|r"
end

L = BigWigs:NewBossLocale("Yor'sahj the Unsleeping", "koKR")
if L then
	L.engage_trigger = "릴스 퀴요툭 샨마 예글루 셰아스야! 하인 릴스!"

	L.bolt_desc = "공허의 화살 중첩과 지속시간 바를 표시합니다."
	L.bolt_message = "공허의 화살 x%2$d : %1$s"

	L.blue = "|cFF0080FF파랑|r"
	L.green = "|cFF088A08초록|r"
	L.purple = "|cFF9932CD보라|r"
	L.yellow = "|cFFFFA901노랑|r"
	L.black = "|cFF424242검정|r"
	L.red = "|cFFFF0404빨강|r"

	L.blobs = "핏방울"
	L.blobs_bar = "~핏방울 소환"
	L.blobs_desc = "보스를 향해 움직이는 핏방울입니다."
end

L = BigWigs:NewBossLocale("Hagara the Stormbinder", "koKR")
if L then
	L.engage_trigger = "감히 폭풍술사에게 덤비다니! 다 쓸어버리겠다."

	L.lightning_or_frost = "얼음 또는 번개"
	L.ice_next = "얼음 단계"
	L.lightning_next = "번개 단계"

	L.nextphase = "다음 단계"
	L.nextphase_desc = "다음 단계에 대하여 알립니다."
end

L = BigWigs:NewBossLocale("Ultraxion", "koKR")
if L then
	L.engage_trigger = "지금은 황혼의 시간이다!"

	L.warmup = "전투 준비"
	L.warmup_desc = "전투가 시작되기까지의 타이머입니다."
	L.warmup_trigger = "나는... 종말의 시작이다. 태양을 뒤덮어버리는 그림자이자, 네 파멸을 알리는 종소리이다."

	L.crystal = "버프 수정"
	L.crystal_desc = "여러 NPC들이 소환하는 수정에 대한 타이머 입니다."
	L.crystal_red = "붉은 수정"
	L.crystal_green = "녹색 수정"
	L.crystal_blue = "푸른 수정"

	L.twilight = "황혼의 시간"
	L.cast = "황혼의 시간 시전 바"
	L.cast_desc = "황혼의 시간  5(일반) 또는 3(영웅-하드)초 시전 바를 표시합니다."

	L.lightself = "당신에 대한 사그라지는 빛"
	L.lightself_desc = "당신이 사그라지는 빛일때 폭발까지 남은 시간을 바에 표시합니다."
	L.lightself_bar = "<당신의 폭발>"

	L.lighttank = "탱커에 대한 사그라지는 빛"
	L.lighttank_desc = "탱커일경우 사그라지는 빛일때 번쩍임과 진동, 폭발까지 남은 시간을 바에 표시합니다."
	L.lighttank_bar = "<%s 폭발>"
	L.lighttank_message = "탱커 폭발"
end

L = BigWigs:NewBossLocale("Warmaster Blackhorn", "koKR")
if L then
	L.warmup = "전투 준비"
	L.warmup_desc = "전투가 시작되기까지의 타이머입니다."

	L.sunder = "방어구 가르기"
	L.sunder_desc = "방어구 가르기의 지속시간 바와 중첩 횟수를 표시합니다."
	L.sunder_message = "방어구 가르기 x%2$d : %1$s"

	L.sapper_trigger = "비룡이 빠르게 날아와 황혼의 폭파병을 갑판에 떨어뜨립니다!"
	L.sapper = "폭파병"
	L.sapper_desc = "배에 큰 피해를 입히는 폭파병입니다."

	L.stage2_trigger = "내가 직접 나서야겠군. 좋지!"
end

L = BigWigs:NewBossLocale("Spine of Deathwing", "koKR")
if L then
	L.engage_trigger = "저 갑옷! 놈의 갑옷이 벗겨지는군! 갑옷을 뜯어내면 놈을 쓰러뜨릴 기회가 생길 거요!"

	L.about_to_roll = "회전하려고 합니다!"
	L.rolling = "회전합니다!"
	L.not_hooked = "당신은 등에 >고정 상태< 아님!"
	L.roll_message = "데스윙 회전, 회전!"
	L.level_trigger = "수평으로 균형을 잡습니다"
	L.level_message = "수평으로 균형 잡음!"

	L.exposed = "갑옷 노출"

	L.residue = "잔류물"
	L.residue_desc = "타락한 피의 잔류물에 대해 알립니다."
	L.residue_message = "잔류물: %d"
end

L = BigWigs:NewBossLocale("Madness of Deathwing", "koKR")
if L then
	L.engage_trigger = "넌 아무것도 못 했다. 내가 이 세상을 조각내주마."

	-- Copy & Paste from Encounter Journal with correct health percentages (type '/dump (C_EncounterJournal.GetSectionInfo(4103)).title' in the game)
	L.smalltentacles_desc = "체력이 70% 그리고 40% 가 남았을시 촉수에 대하여 알립니다."

	L.bolt_explode = "<화살 폭발>"
	L.parasite = "기생충"
	L.blobs_soon = "%d%% - 곧 엉키는 피!"
end

-- Firelands

L = BigWigs:NewBossLocale("Beth'tilac", "koKR")
if L then
	L.flare_desc = "화염 광역에 대한 타이머 바를 표시합니다."

	L.devastate_message = "그을리는 유린 #%d"
	L.drone_bar = "잿그물 수거미"
	L.drone_message = "수거미 등장!"
	L.kiss_message = "입맞춤"
	L.spinner_warn = "실거미 #%d"
end

L = BigWigs:NewBossLocale("Lord Rhyolith", "koKR")
if L then
	L.armor = "흑요석 갑옷"
	L.armor_desc = "라이올라스의 흑요석 갑옷에 대한 중첩 & 사라짐을 알립니다."
	L.armor_message = "흑요석 갑옷 - %d%%"
	L.armor_gone_message = "흑요석 갑옷 사라짐!"

	L.adds_header = "쫄 추가"
	L.big_add_message = "큰 쫄 등장!"
	L.small_adds_message = "작은 쫄 등장!"

	L.phase2_warning = "곧 2 단계!"

	L.molten_message = "보스 공격 증가 x%d !"

	L.stomp_message = "진탕 발길! 발구르기! 발구르기!"
	L.stomp = "발구르기"
end

L = BigWigs:NewBossLocale("Alysrazor", "koKR")
if L then
	L.fullpower_soon_message = "곧 최대 힘!"
	L.halfpower_soon_message = "곧 4 단계!"
	L.encounter_restart = "다시 단계 반복..."
	L.no_stacks_message = "당신은 깃털이 없습니다. 생각을 가지세요..."
	L.moonkin_message = "헛짓은 그만~! 깃털을 주우세요!"
	L.molt_bar = "다음 털갈이"

	L.meteor = "유성"
	L.meteor_desc = "타오르는 유성 소환을 알립니다."
	L.meteor_message = "유 성!"

	L.stage_message = "%d 단계"
	L.kill_message = "바로 지금! - 그녀를 죽이세요!"
	L.engage_message = "알리스라조르 전투시작 - ~%d분 후 2 단계"

	L.worm_emote = "녹아내린 알이 부화하려고 합니다!"
	L.phase2_soon_emote = "알리스라조르가 빠른 속도로 원을 그리며 날아다닙니다!"

	L.flight = "날개 지속"
	L.flight_desc = "'화염의 날개'의 지속 타이머 바를 표시합니다. 특수 강조바와 카운트 기능을 이용한다면 더 효율적입니다."

	L.initiate = "수습생 소환"
	L.initiate_desc = "타오르는 발톱 수습생 소환에 대한 타이머 바를 표시합니다."
	L.initiate_both = "양쪽 수습생"
	L.initiate_west = "왼쪽 수습생"
	L.initiate_east = "오른쪽 수습생"
end

L = BigWigs:NewBossLocale("Shannox", "koKR")
if L then
	L.safe = "%s 안전함"
	L.wary_dog = "%s 조심!"
	L.crystal_trap = "수정 감옥 덫"

	L.traps_header = "덫"
	L.immolation = "개에게 제물의 덫"
	L.immolation_desc = "개들의 제물의 덫에 대해 알립니다."
	L.immolationyou = "당신의 아래에 제물의 덫"
	L.immolationyou_desc = "당신의 아래에 제물의 덫이 소환되는 것을 알립니다."
	L.immolationyou_message = "제물의 덫"
	L.crystal = "수정 감옥 덫"
	L.crystal_desc = "수정 감옥 덫에 대해 알립니다."
	--L.facerage_trigger = "Go for the throat!"
end

L = BigWigs:NewBossLocale("Baleroc", "koKR")
if L then
	L.torment = "주시 대상 고문 파편 중첩"
	L.torment_desc = "당신이 주시 대상으로 설정한 플레이어에 대한 고문의 파편 중첩을 알립니다."

	L.blade_bar = "~다음 칼날"
	L.shard_message = "고문의 파편(%d)!"
	L.focus_message = "당신의 주시 대상 - 고문 x%d !"
	L.link_message = "고리 연결"
end

L = BigWigs:NewBossLocale("Majordomo Staghelm", "koKR")
if L then
	L.seed_explosion = "곧 씨앗 폭발!"
	L.seed_bar = "당신은 폭발!"
	L.adrenaline_message = "아드레날린 x%d!"
	L.leap_say = "도약"
end

L = BigWigs:NewBossLocale("Ragnaros", "koKR")
if L then
	L.intermission_end_trigger1 = "설퍼라스로 숨통을 끊어 주마."
	L.intermission_end_trigger2 = "무릎 꿇어라, 필멸자여! 끝낼 시간이다."
	L.intermission_end_trigger3 = "여기까지! 이제 끝내주마."
	L.phase4_trigger = "너무 일러..."
	L.seed_explosion = "씨앗 폭발!"
	L.intermission_bar = "휴식"
	L.intermission_message = "휴식... 과자 있으세요?..."
	L.sons_left = "자손 %d 마리 남음"
	L.engulfing_close = "가까운 지역에 휘몰아치는 불길"
	L.engulfing_middle = "중간 지역에 휘몰아치는 불길"
	L.engulfing_far = "먼 지역에 휘몰아치는 불길"
	L.hand_bar = "넉백"
	L.ragnaros_back_message = "라그 돌아옴, 파티 정비!"
end

-- Throne of the Four Winds

L = BigWigs:NewBossLocale("Al'Akir", "koKR")
if L then
	L.stormling = "작은 폭풍 정령"
	L.stormling_desc = "작은 폭풍 정령 소환을 알립니다."

	L.acid_rain = "산성 비 (%d)"

	L.feedback_message = "역순환 x%d"
end

L = BigWigs:NewBossLocale("Conclave of Wind", "koKR")
if L then
	L.gather_strength = "힘 모으기: %s"

	L["93059_desc"] = "폭풍 방패"

	L.full_power = "극의 힘"
	L.full_power_desc = "힘이 극에 달했을시 특별한 능력에 대해 알립니다.(현재 3가지중 미풍에 대해서만 알립니다.)" --check
	L.gather_strength_emote = "%s의 힘이 극" --check
end
