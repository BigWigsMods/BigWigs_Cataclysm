-- Baradin Hold

local L = BigWigs:NewBossLocale("Occu'thar", "zhCN")
if L then
	L.shadows_bar = "灼热暗影"
	L.destruction_bar = "欧库塔尔的毁灭"
	L.eyes_bar = "欧库塔尔之眼"

	L.fire_message = "集火！"
	L.fire_bar = "下一集火"
end

L = BigWigs:NewBossLocale("Alizabal", "zhCN")
if L then
	L.first_ability = "刺穿或沸腾之怨"
	L.dance_message = "刃舞：%d - 3！"
end

-- Bastion of Twilight

L = BigWigs:NewBossLocale("Halfus Wyrmbreaker", "zhCN")
if L then
	L.strikes_message = "致伤打击"
	L.freed_message = "%s 释放 %s"
end

L = BigWigs:NewBossLocale("Cho'gall", "zhCN")
if L then
	L.orders = "形态转换"
	L.orders_desc = "当古加尔改变暗影/火焰援助令形态时发出警报。"

	L.worship_cooldown = "膜拜"

	L.adherent_bar = "腐蚀信徒：#%d"
	L.adherent_message = "即将 腐蚀信徒：%d！"
	L.ooze_bar = "古神血雨：%d"
	L.ooze_message = "即将 古神血雨：%d！"

	L.tentacles_bar = "黑暗的造物出现"
	L.tentacles_message = "大量黑暗的造物！"

	L.sickness_message = "你 快要呕吐了!"
	L.blaze_message = "你 光芒！"
	L.crash_say = "腐蚀碾压"

	L.fury_message = "古加尔之怒！"
	L.first_fury_soon = "即将 古加尔之怒！"
	L.first_fury_message = "85% - 开始古加尔之怒！"

	L.unleashed_shadows = "暗影释放！"

	L.phase2_message = "第二阶段"
	L.phase2_soon = "即将 第二阶段！"
end

L = BigWigs:NewBossLocale("Valiona and Theralion", "zhCN")
if L then
	L.phase_switch = "阶段转换"
	L.phase_switch_desc = "当进入不同阶段时发出警报。"

	L.phase_bar = "%s落地"
	L.breath_message = "即将 深呼吸！"
	L.dazzling_message = "即将 暮光领域！"

	L.blast_message = "暮光冲击波！"
	L.engulfingmagic_say = "噬体魔法"

	L.valiona_trigger = "瑟纳利昂，我去包抄门厅。堵住他们的退路！"

	L.twilight_shift = "暮光位移"
end

L = BigWigs:NewBossLocale("Sinestra", "zhCN")
if L then
	L.whelps = "暮光稚龙"
	L.whelps_desc = "当每波暮光稚龙到来时发出警报。"

	L.slicer_message = "可能暮光切割射线目标！"

	L.egg_vulnerable = "集中火力攻击！"

	L.whelps_trigger = "吃吧，孩子们！尽情享用他们肥美的躯壳吧！"
	L.omelet_trigger = "你以为就这么简单？愚蠢！"

	L.phase13 = "第一和第三阶段"
	L.phase = "阶段"
	L.phase_desc = "当进入不同阶段时发出警报。"
end

L = BigWigs:NewBossLocale("Ascendant Council", "zhCN")
if L then
	L.health_report = "%s生命值 %d%%，即将阶段转换！"
	L.switch = "转换"
	L.switch_desc = "当首领转换时发出警报。"

	L.shield_up_message = "烈火之盾 出现！"
	L.shield_down_message = "烈火之盾 消失！"
	L.shield_bar = "烈火之盾"

	L.switch_trigger = "我们会解决他们！"

	L.thundershock_quake_soon = "约10秒后，%s！"

	L.quake_trigger = "你脚下的地面发出不祥的“隆隆”声……"
	L.thundershock_trigger = "周围的空气因为充斥着强大的能量而发出“噼啪”声……"

	L.thundershock_quake_spam = "%s %d！"

	L.last_phase_trigger = "令人印象深刻……"
end

-- Blackwing Descent

L = BigWigs:NewBossLocale("Magmaw", "zhCN")
if L then
	L.stage2_yell_trigger = "难以置信" -- 难以置信，你们竟然真要击败我的熔岩巨虫了！也许我可以帮你们……扭转局势。

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
	L.circles = "音波"
end

L = BigWigs:NewBossLocale("Maloriak", "zhCN")
if L then
	L.flames = "烈焰"
end

L = BigWigs:NewBossLocale("Nefarian", "zhCN")
if L then
	L.discharge = "闪电倾泻"
	L.stage3_yell_trigger = "我一直在尝试扮演好客的主人" -- 我一直在尝试扮演好客的主人，可你们就是不肯受死！该卸下伪装了……杀光你们！
end

-- Dragon Soul

L = BigWigs:NewBossLocale("Morchok", "zhCN")
if L then
	L.engage_trigger = "你妄想阻止雪崩。我只会埋葬你。"

	L.crush_desc = "破甲堆叠计数并显示持续条。"

	L.blood = "大地黑血"

	L.explosion = "爆裂水晶"
	L.crystal = "共鸣水晶"
end

L = BigWigs:NewBossLocale("Warlord Zon'ozz", "zhCN")
if L then
	L.engage_trigger = "Zzof Shuul'wah。Thoq fssh N'Zoth！"

	L.ball = "末日黑洞"
	L.ball_desc = "末日黑洞在玩家和首领之间来回弹跳时发出警报。"
	L.ball_yell = "Gul'kafh an'qov N'Zoth。"

	L.ball_active = "虚空球激活"
	L.ball_active_desc = "虚空球激活时的计时器（即它可以反弹时）。"

	L.bounce = "末日黑洞弹跳"
	L.bounce_desc = "末日黑洞弹跳计数。"

	L.darkness = "触手迪斯科聚会！"
	L.darkness_desc = "当此阶段开始，末日黑洞撞击首领。"

	L.shadows = "干扰之影"

	L.custom_off_shadows_marker = "干扰之影标记"
	L.custom_off_shadows_marker_desc = "使用 {rt1}{rt2}{rt3} 标记干扰之影目标，需要权限。\n|cFFFF0000团队中只有1名应该启用此选项以防止标记冲突。|r"
end

L = BigWigs:NewBossLocale("Yor'sahj the Unsleeping", "zhCN")
if L then
	L.engage_trigger = "Iilth qi'uothk shn'ma yeh'glu Shath'Yar！H'IWN IILTH！"

	L.bolt_desc = "虚空箭堆叠计数并显示持续条。"
	L.bolt_message = "%2$d层虚空箭：%1$s！"

	L.blue = "|cFF0080FF蓝|r"
	L.green = "|cFF088A08绿|r"
	L.purple = "|cFF9932CD紫|r"
	L.yellow = "|cFFFFA901黄|r"
	L.black = "|cFF424242黑|r"
	L.red = "|cFFFF0404红|r"

	L.blobs = "血球"
	L.blobs_bar = "下一血球"
	L.blobs_desc = "当血球向首领移动时发出警报。"
end

L = BigWigs:NewBossLocale("Hagara the Stormbinder", "zhCN")
if L then
	L.engage_trigger = "你们竟敢挑战缚风者！我要杀光你们。"

	L.lightning_or_frost = "闪电或寒冰"
	L.ice_next = "寒冰阶段"
	L.lightning_next = "闪电阶段"

	L.nextphase = "下一阶段"
	L.nextphase_desc = "当下一阶段时发出警报。"
end

L = BigWigs:NewBossLocale("Ultraxion", "zhCN")
if L then
	L.engage_trigger = "暮光审判降临了！"

	L.warmup = "暮光审判"
	L.warmup_desc = "暮光审判计时器。"
	L.warmup_trigger = "我即是末日的开端……蔽日的阴影……毁灭的丧钟……"

	L.crystal = "增益水晶"
	L.crystal_desc = "守护巨龙召唤各种增益水晶计时器。"
	L.crystal_red = "生命赐福红水晶"
	L.crystal_green = "梦境精华绿水晶"
	L.crystal_blue = "魔力之源蓝水晶"

	L.twilight = "暮光审判"
	L.cast = "暮光审判施法条"
	L.cast_desc = "显示暮光审判5秒施法条。"

	L.lightself = "自身黯淡之光"
	L.lightself_desc = "显示自身黯淡之光爆炸剩余计时条。"
	L.lightself_bar = "你将爆炸"

	L.lighttank = "坦克黯淡之光"
	L.lighttank_desc = "如果坦克中了黯淡之光，显示一个爆炸计时条。"
	L.lighttank_bar = "%s 爆炸"
	L.lighttank_message = "坦克爆炸！"
end

L = BigWigs:NewBossLocale("Warmaster Blackhorn", "zhCN")
if L then
	L.warmup = "热身"
	L.warmup_desc = "首领战斗开始之前的计时器。"

	L.sunder = "破甲攻击"
	L.sunder_desc = "破甲攻击堆叠计数并显示持续条。"
	L.sunder_message = "%2$d 层破甲攻击：%1$s！"

	L.sapper_trigger = "一条幼龙俯冲下来，往甲板上投放了一个暮光工兵！"
	L.sapper = "暮光工兵"
	L.sapper_desc = "暮光工兵对天火号造成伤害。"

	L.stage2_trigger = "看来我得亲自动手了。很好！"
end

L = BigWigs:NewBossLocale("Spine of Deathwing", "zhCN")
if L then
	L.engage_trigger = "看那些装甲！他正在解体！摧毁那些装甲，我们就能给他最后一击！"

	L.about_to_roll = "感觉到玩家在他的"
	L.rolling = "%%s往[左右]+侧"
	L.not_hooked = "你 没有抓牢！"
	L.roll_message = "他开始滚了！滚了，滚啦！"
	L.level_trigger = "平衡"
	L.level_message = "别急，他已经平衡了！"

	L.exposed = "装甲暴露"

	L.residue = "未吸收的残渣"
	L.residue_desc = "当地面上还有剩余未吸收的残渣时发出警报，等待被吸收。"
	L.residue_message = "残渣：%d！"
end

L = BigWigs:NewBossLocale("Madness of Deathwing", "zhCN")
if L then
	L.engage_trigger = "你们什么都没做到。我要撕碎你们的世界。"

	-- Copy & Paste from Encounter Journal with correct health percentages (type '/dump (C_EncounterJournal.GetSectionInfo(4103)).title' in the game)
	L.smalltentacles_desc = "在生命值降至70%和40%时，肢体触须会衍生出许多灼疮触须，这些触须对具有范围效果的技能免疫。"

	L.bolt_explode = "源质箭爆炸"
	L.parasite = "腐蚀寄生虫"
	L.blobs_soon = "%d%% - 即将凝固之血！"
end

-- Firelands

L = BigWigs:NewBossLocale("Beth'tilac", "zhCN")
if L then
	L.flare_desc = "当余烬之火范围伤害时显示计时条。"
	L.devastate_message = "阴燃毁灭：#%d！"
	L.drone_bar = "下一烬网工虫"
	L.drone_message = "即将 烬网工虫！"
	L.kiss_message = "寡妇蛛之吻！"
	L.spinner_warn = "烬网织网蛛：#%d！"
end

L = BigWigs:NewBossLocale("Lord Rhyolith", "zhCN")
if L then
	L.armor = "黑曜石护甲"
	L.armor_desc = "当黑曜石护甲堆叠从雷奥利斯领主身上移除时发出警报。"
	L.armor_message = "%d%% 黑曜石护甲剩余！"
	L.armor_gone_message = "黑曜石护甲消失！"

	L.adds_header = "增援"
	L.big_add_message = "雷奥利斯的火花 出现！"
	L.small_adds_message = "即将 雷奥利斯的碎片！"

	L.phase2_warning = "第二阶段！"

	L.molten_message = "首领熔岩护甲堆叠：%d 层！"

	L.stomp_message = "震荡践踏！"
	L.stomp = "震荡践踏"
end

L = BigWigs:NewBossLocale("Alysrazor", "zhCN")
if L then
	L.fullpower_soon_message = "即将 完全的力量！"
	L.halfpower_soon_message = "第四阶段！"
	L.encounter_restart = "蓄满力量"
	L.no_stacks_message = "你沒有羽毛！"
	L.moonkin_message = "去拿一些羽毛！"
	L.molt_bar = "下一羽蜕"

	L.meteor = "熔火流星"
	L.meteor_desc = "当熔火流星被召唤时发出警报。"
	L.meteor_message = "熔火流星！"

	L.stage_message = "阶段：%d ！"
	L.kill_message = "就是现在 - 杀了她！"
	L.engage_message = "奥利瑟拉佐尔激活 - 约%d分钟后第二阶段！"

	L.worm_emote = "熔岩火虫从地下涌出来了！"
	L.phase2_soon_emote = "奥利瑟拉佐尔开始高速盘旋！狂风将移除火焰之翼的效果！"

	L.flight = "飞行助手"
	L.flight_desc = "当你“烈焰之翼”持续时显示计时条，使用超级醒目功能。"

	L.initiate = "炽炎之爪新兵出现"
	L.initiate_desc = "炽炎之爪新兵计时条。"
	L.initiate_both = "炽炎之爪新兵：双向！"
	L.initiate_west = "炽炎之爪新兵：西！"
	L.initiate_east = "炽炎之爪新兵：东！"
end

L = BigWigs:NewBossLocale("Shannox", "zhCN")
if L then
	L.safe = "%s 安全！"
	L.wary_dog = "警惕：%s！"
	L.crystal_trap = "水晶牢笼陷阱！"

	L.traps_header = "陷阱"
	L.immolation = "献祭陷阱"
	L.immolation_desc = "当狂脸或裂肢阶段献祭陷阱时发出警报，获得“警惕”状态。"
	L.immolationyou = "你 脚下 献祭陷阱！"
	L.immolationyou_desc = "当你脚下献祭陷阱被召唤时发出警报。"
	L.immolationyou_message = "献祭陷阱"
	L.crystal = "投掷水晶牢笼陷阱"
	L.crystal_desc = "当沙恩诺克斯施放水晶牢笼陷阱时发出警报。"
	L.facerage_trigger = "咬他的喉咙！"
end

L = BigWigs:NewBossLocale("Baleroc", "zhCN")
if L then
	L.torment = "焦点磨难堆叠"
	L.torment_desc = "当焦点受到磨难堆叠时发出警报。"

	L.blade_bar = "毁灭之刃"
	L.shard_message = "磨难碎片：%d ！"
	L.focus_message = "焦点目标已有 %d 层磨难！"
	L.link_message = "倒计时"
end

L = BigWigs:NewBossLocale("Majordomo Staghelm", "zhCN")
if L then
	L.seed_explosion = "你 即将灼热之种爆炸！"
	L.seed_bar = "你：灼热之种爆炸"
	L.adrenaline_message = "肾上腺素：%d 层！"
	L.leap_say = "烈焰镰刀"
end

L = BigWigs:NewBossLocale("Ragnaros", "zhCN")
if L then
	L.intermission_end_trigger1 = "萨弗拉斯将会是你的末日。"
	L.intermission_end_trigger2 = "跪下吧，凡人们！一切都结束了。"
	L.intermission_end_trigger3 = "够了！我会亲自解决。"
	L.phase4_trigger = "太早了……"
	L.seed_explosion = "熔火之种爆炸！"
	L.intermission_bar = "中场"
	L.intermission_message = "中场！"
	L.sons_left = "%d 烈焰之子剩余！"
	L.engulfing_close = "噬体烈焰：近场 ！"
	L.engulfing_middle = "噬体烈焰：中场 ！"
	L.engulfing_far = "噬体烈焰：远场 ！"
	L.hand_bar = "拉格纳罗斯之手"
	L.ragnaros_back_message = "拉格纳罗斯返回，集合！"
end

-- Throne of the Four Winds

L = BigWigs:NewBossLocale("Al'Akir", "zhCN")
if L then
	L.stormling = "风暴火花"
	L.stormling_desc = "当召唤风暴火花时发出警报。"

	L.acid_rain = "酸雨：%d ！"

	L.feedback_message = "%dx 回馈！"
end

L = BigWigs:NewBossLocale("Conclave of Wind", "zhCN")
if L then
	L.gather_strength = "%s 即将获得全部力量！"

	L["93059_desc"] = "当风暴护盾吸收伤害时发出警报。"

	L.full_power = "全部能量"
	L.full_power_desc = "当首领获得全部能量并开始施放特殊技能时发出警报。"
	L.gather_strength_emote = "%s 开始从剩下的风领主身上获得力量！"
end
