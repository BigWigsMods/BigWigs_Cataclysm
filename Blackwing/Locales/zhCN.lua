
local L = BigWigs:NewBossLocale("Magmaw", "zhCN")
if not L then return end
if L then
	L.stage2_yell_trigger = "难以置信"

	L.slump = "弱点"
	L.slump_desc = "当熔喉扑倒并暴露后脑时发出警报。需要骑乘。"
	L.slump_bar = "骑乘"
	L.slump_message = "嘿，快骑上它！"
end

L = BigWigs:NewBossLocale("Omnotron Defense System", "zhCN")
if L then
	L.nef = "维克多·奈法里奥斯勋爵"
	L.nef_desc = "当维克多·奈法里奥斯勋爵施放技能时发出警报。"

	L.pool_explosion = "奥术反冲"
	L.incinerate = "烧尽"
	L.flamethrower = "火焰喷射器"
	L.lightning = "闪电"
	L.infusion = "灌注"
end

L = BigWigs:NewBossLocale("Atramedes", "zhCN")
if L then
	L.obnoxious_fiend = "喧闹恶鬼" -- NPC ID 49740
	L.air_phase_trigger = "对，跑吧！每跑一步你的心跳都会加快。这心跳声，洪亮如雷，震耳欲聋。你逃不掉的！"
end

L = BigWigs:NewBossLocale("Maloriak", "zhCN")
if L then
	L.flames = "烈焰"
	L.dark_phase_emote_trigger = "黑暗"
end

L = BigWigs:NewBossLocale("Nefarian", "zhCN")
if L then
	L.phase = "阶段"
	L.phase_desc = "当进入不同阶段时发出警报。"

	L.discharge_bar = "闪电倾泻"

	L.phase_two_trigger = "诅咒你们，凡人！你们丝毫不尊重他人财产的行为必须受到严厉处罚！"

	L.phase_three_trigger = "我一直在尝试扮演好客的主人，可你们就是不肯受死！该卸下伪装了……杀光你们！"

	L.crackle_trigger = "空气中激荡的电流噼啪作响！"
	L.crackle_message = "即将 通电！"

	L.shadowblaze_trigger = "血肉化为灰烬！"
	L.shadowblaze_message = ">你< 暗影爆燃！"

	L.onyxia_power_message = "即将 电荷过载！"

	L.chromatic_prototype = "原型多彩龙人" -- 3 adds name
end
