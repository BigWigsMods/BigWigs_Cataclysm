
local L = BigWigs:NewBossLocale("Magmaw", "koKR")
if not L then return end
if L then
	L.stage2_yell_trigger = "이런 곤란한 데가! 이러다간 내 용암"

	L.slump = "슬럼프"
	L.slump_desc = "슬럼프 상태를 알립니다."
	L.slump_bar = "로데오"
	L.slump_message = "올라타세요~!"
	L.slump_emote_trigger = "%s|1이;가; 집게를 드러내며 앞으로 몸을 기울입니다!"

	L.expose_emote_trigger = "%s|1이;가; 창에 꽂혀 머리가 노출되었습니다!"
end

L = BigWigs:NewBossLocale("Omnotron Defense System", "koKR")
if L then
	L.nef = "군주 빅터 네파리우스"
	L.nef_desc = "군주 빅터 네파리우스의 기술을 알립니다."

	L.pool = "바닥 웅덩이 폭발"
end

L = BigWigs:NewBossLocale("Chimaeron", "koKR")
if L then
	L.bileotron_engage = "담즙로봇이 움직이기 시작하더니 고약한 냄새가 나는 물질을 방출합니다."

	L.next_system_failure = "다음 시스템 오류"

	L.phase2_message = "곧 치명상 단계!"
end

L = BigWigs:NewBossLocale("Atramedes", "koKR")
if L then
	L.ground_phase = "지상 단계"
	L.ground_phase_desc = "아트라메데스의 착지를 알립니다."
	L.air_phase = "공중 단계"
	L.air_phase_desc = "아트라메데스의 이륙을 알립니다."

	L.air_phase_trigger = "그래, 도망가라! 발을 디딜 때마다 맥박은 빨라지지. 점점 더 크게 울리는구나... 귀청이 터질 것만 같군! 넌 달아날 수 없다!"

	L.obnoxious_soon = "곧 불쾌한 마귀!"

	L.searing_soon = "10초 후 이글거리는 불길!"
end

L = BigWigs:NewBossLocale("Maloriak", "koKR")
if L then
	--heroic
	L.sludge = "어둠의 폐수"
	L.sludge_desc = "어둠의 폐수에 서있을시 알립니다."
	L.sludge_message = "당신은 폐수!"

	--normal
	L.final_phase = "마지막 단계"
	L.final_phase_soon = "곧 마지막 단계!"

	L.release_aberration_message = "돌연변이 %d 남음"
	L.release_all = "모든 실험체 %d!"

	L.phase = "단계"
	L.phase_desc = "단계 변화를 알립니다."
	L.next_phase = "다음 단계"
	L.green_phase_bar = "녹색 단계"

	L.red_phase_trigger = "섞고 흔들어서, 열을 가한다..."
	L.red_phase_emote_trigger = "붉은"
	L.red_phase = "|cFFFF0000붉은|r 단계"
	L.blue_phase_trigger = "급격한 온도 변화에 필멸의 육신"
	L.blue_phase_emote_trigger = "푸른"
	L.blue_phase = "|cFF809FFE푸른|r 단계"
	L.green_phase_trigger = "이건 좀 불안정하지만"
	L.green_phase_emote_trigger = "초록"
	L.green_phase = "|cFF33FF00초록|r 단계"
	L.dark_phase_trigger = "혼합물이 너무 약하구나, 말로리악!"
	L.dark_phase_emote_trigger = "암흑"
	L.dark_phase = "|cFF660099암흑|r 단계"
end

L = BigWigs:NewBossLocale("Nefarian", "koKR")
if L then
	L.phase = "단계"
	L.phase_desc = "단계 변화를 알립니다."

	L.discharge_bar = "번개 방출 대기시간"

	L.phase_two_trigger = "저주받을 필멸자들!"

	L.phase_three_trigger = "품위있는"

	L.crackle_trigger = "전기가 튀며 파지직하는 소리가 납니다!"
	L.crackle_message = "곧 감전!"

	L.shadowblaze_trigger = "살을 재로 만들어 주마!"
	L.shadowblaze_message = "당신은 타오르는중!"

	L.onyxia_power_message = "곧 폭발!"

	L.chromatic_prototype = "오색 실험체" -- 3 adds name
end
