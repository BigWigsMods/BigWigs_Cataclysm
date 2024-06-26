
local L = BigWigs:NewBossLocale("Magmaw", "zhTW")
if not L then return end
if L then
	L.stage2_yell_trigger = "真難想像!看來你真有機會打敗我的蟲子!也許我可幫忙...扭轉戰局。"

	L.slump = "撲倒"
	L.slump_desc = "當熔喉撲倒並暴露時發出警報。"
	L.slump_bar = "騎乘"
	L.slump_message = "嘿，快騎上它！"
end

L = BigWigs:NewBossLocale("Omnotron Defense System", "zhTW")
if L then
	L.nef = "維克多·奈法利斯領主"
	L.nef_desc = "當維克多·奈法利斯領主施放技能時發出警報。"

	L.pool_explosion = "秘法逆爆"
	L.incinerate = "燒盡"
	L.flamethrower = "火焰噴射器"
	L.lightning = "閃電"
	L.infusion = "注入"
end

L = BigWigs:NewBossLocale("Atramedes", "zhTW")
if L then
	--L.obnoxious_fiend = "Obnoxious Fiend" -- NPC ID 49740
	L.air_phase_trigger = "沒錯，逃吧!每一步都會讓你的心跳加速。跳得轟隆作響...震耳欲聾。你逃不掉的!"
end

L = BigWigs:NewBossLocale("Maloriak", "zhTW")
if L then
	L.flames = "烈焰"
	L.dark_phase_emote_trigger = "黑色"
end

L = BigWigs:NewBossLocale("Nefarian", "zhTW")
if L then
	L.phase = "階段"
	L.phase_desc = "當進入不同階段時發出警報。"

	L.discharge_bar = "閃電釋放"

	L.phase_two_trigger = "詛咒你們，凡人!如此冷酷地漠視他人的所有物必須受到嚴厲的懲罰!"

	L.phase_three_trigger = "我本來只想略盡地主之誼"

	L.crackle_trigger = "響起了電流霹啪作響的聲音!"
	L.crackle_message = "即將 電擊！"

	L.shadowblaze_trigger = "化為灰燼吧!"
	L.shadowblaze_message = ">你< 暗影炎！"

	L.onyxia_power_message = "即將 電荷超載！"

	L.chromatic_prototype = "炫彩原型體" -- 3 adds name
end
