-- Baradin Hold

local L = BigWigs:NewBossLocale("Occu'thar", "zhTW")
if L then
	L.shadows_bar = "灼熱暗影"
	L.destruction_bar = "歐庫薩的毀滅"
	L.eyes_bar = "歐庫薩之眼"

	L.fire_message = "專注之火！"
	L.fire_bar = "下一專注之火"
end

L = BigWigs:NewBossLocale("Alizabal", "zhTW")
if L then
	L.first_ability = "烤肉釘或沸騰憎恨"
	L.dance_message = "劍刃之舞：>%d - 3<！"
end

-- Bastion of Twilight

L = BigWigs:NewBossLocale("Halfus Wyrmbreaker", "zhTW")
if L then
	L.strikes_message = "致死打擊"
	--L.freed_message = "%s freed %s"
end

L = BigWigs:NewBossLocale("Cho'gall", "zhTW")
if L then
	L.orders = "形態轉換"
	L.orders_desc = "當丘加利改變暗影/烈焰之令形態時發出警報。"

	L.worship_cooldown = "信奉"

	L.adherent_bar = "腐化中的擁護者：#%d"
	L.adherent_message = "即将 腐化中的擁護者：>%d<！"
	L.ooze_bar = "聚集古神之血：%d"
	L.ooze_message = "即將 聚集古神之血：>%d<！"

	L.tentacles_bar = "暗色觸鬚出現"
	L.tentacles_message = "大量暗色觸鬚！"

	L.sickness_message = ">你< 快要嘔吐了!"
	L.blaze_message = ">你< 燃炎！"
	L.crash_say = "腐化轟擊"

	L.fury_message = "丘加利之怒！"
	L.first_fury_soon = "即將 丘加利之怒！"
	L.first_fury_message = "85% - 開始丘加利之怒！"

	L.unleashed_shadows = "釋放暗影！"

	L.phase2_message = "第二階段！"
	L.phase2_soon = "即將 第二階段！"
end

L = BigWigs:NewBossLocale("Valiona and Theralion", "zhTW")
if L then
	L.phase_switch = "階段轉換"
	L.phase_switch_desc = "當進入不同階段時發出警報。"

	L.phase_bar = "%s落地"
	L.breath_message = "即將 深呼吸！"
	L.dazzling_message = "即將！暮光之境！"

	L.blast_message = "暮光衝擊！"
	L.engulfingmagic_say = "侵噬魔法"

	L.valiona_trigger = "瑟拉里恩，我的火會淹沒整個通道。擋住他們的退路!"

	L.twilight_shift = "暮光變換"
end

L = BigWigs:NewBossLocale("Sinestra", "zhTW")
if L then
	L.whelps = "暮光雛龍"
	L.whelps_desc = "當每波暮光雛龍到來時發出警報。"

	L.slicer_message = "可能火息術目標！"

	L.egg_vulnerable = "集中火力攻擊！"

	L.whelps_trigger = "吃吧，孩子們!好好享用他們肥嫩的軀殼吧!"
	L.omelet_trigger = "你以為這樣就佔了上風?愚蠢!"

	L.phase13 = "第一和第三階段"
	L.phase = "階段"
	L.phase_desc = "當進入不同階段時發出警報。"
end

L = BigWigs:NewBossLocale("Ascendant Council", "zhTW")
if L then
	L.health_report = "%s生命值>%d%%<，即將階段轉換！"
	L.switch = "轉換"
	L.switch_desc = "當首領轉換時發出警報。"

	L.shield_up_message = "火焰之禦 出現！"
	L.shield_down_message = "火焰之禦 消失！"
	L.shield_bar = "火焰之禦"

	L.switch_trigger = "我們會解決他們!"

	L.thundershock_quake_soon = "约10秒後，%s！"

	L.quake_trigger = "你腳下的地面開始不祥地震動起來...."
	L.thundershock_trigger = "四周的空氣爆出能量霹啪作響聲音...."

	L.thundershock_quake_spam = ">%s< %d！"

	L.last_phase_trigger = "令人印象深刻的表現..."
end

-- Blackwing Descent

L = BigWigs:NewBossLocale("Magmaw", "zhTW")
if L then
	L.stage2_yell_trigger = "真難想像" -- 真難想像!看來你真有機會打敗我的蟲子!也許我可幫忙...扭轉戰局。

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
	--L.circles = "Circles"
end

L = BigWigs:NewBossLocale("Maloriak", "zhTW")
if L then
	L.flames = "烈焰"
end

L = BigWigs:NewBossLocale("Nefarian", "zhTW")
if L then
	L.discharge = "閃電釋放"
	L.stage3_yell_trigger = "我本來只想略盡地主之誼" -- 我本來只想略盡地主之誼，但是你們就是不肯痛快的受死!是時候拋下一切的虛偽...殺光你們就好!
end

-- Dragon Soul

L = BigWigs:NewBossLocale("Morchok", "zhTW")
if L then
	L.engage_trigger = "你想要阻止山崩。我會埋葬你。"

	L.crush_desc = "擊碎護甲堆疊計數並顯示持續條。"

	L.blood = "大地黑血"

	L.explosion = "爆炸水晶"
	L.crystal = "共鳴水晶"
end

L = BigWigs:NewBossLocale("Warlord Zon'ozz", "zhTW")
if L then
	L.engage_trigger = "Zzof Shuul'wah. Thoq fssh N'Zoth!"

	L.ball = "壞滅虛無"
	L.ball_desc = "壞滅虛無在玩家和首領之間來回彈跳時發出警報。"
	L.ball_yell = "Gul'kafh an'qov N'Zoth."

	--L.ball_active = "Void ball active"
	--L.ball_active_desc = "Timer for when the void ball activates (i.e. it can bounce)."

	L.bounce = "壞滅虛無彈跳"
	L.bounce_desc = "壞滅虛無彈跳計數。"

	L.darkness = "觸鬚迪斯可聚會！"
	L.darkness_desc = "當此階段開始，壞滅虛無撞擊首領。"

	L.shadows = "崩解之影"

	L.custom_off_shadows_marker = "崩解之影標記"
	L.custom_off_shadows_marker_desc = "使用 {rt1}{rt2}{rt3} 標記崩解之影目標，需要權限。\n|cFFFF0000團隊中只需一人啟用此選項以防止標記衝突。|r"
end

L = BigWigs:NewBossLocale("Yor'sahj the Unsleeping", "zhTW")
if L then
	L.engage_trigger = "Iilth qi'uothk shn'ma yeh'glu Shath'Yar! H'IWN IILTH!"

	L.bolt_desc = "虛無箭堆疊計數並顯示持續條。"
	L.bolt_message = "%2$d層虛無箭：>%1$s<！"

	L.blue = "|cFF0080FF藍|r"
	L.green = "|cFF088A08綠|r"
	L.purple = "|cFF9932CD紫|r"
	L.yellow = "|cFFFFA901黃|r"
	L.black = "|cFF424242黑|r"
	L.red = "|cFFFF0404紅|r"

	L.blobs = "血珠"
	L.blobs_bar = "下一血珠"
	L.blobs_desc = "當血珠向首領移動時發出警報。"
end

L = BigWigs:NewBossLocale("Hagara the Stormbinder", "zhTW")
if L then
	L.engage_trigger = "你們惹毛暴風守縛者了!我要殺光你們。"

	L.lightning_or_frost = "閃電或寒冰"
	L.ice_next = "寒冰階段"
	L.lightning_next = "閃電階段"

	L.nextphase = "下一階段"
	L.nextphase_desc = "當下一階段時發出警報。"
end

L = BigWigs:NewBossLocale("Ultraxion", "zhTW")
if L then
	L.engage_trigger = "現在就是暮光之時!"

	L.warmup = "暮光之時"
	L.warmup_desc = "暮光之時计时器。"
	L.warmup_trigger = "我是終結的開始...遮掩陽光的印跡...通知末日將臨的鈴聲..."

	L.crystal = "增益水晶"
	L.crystal_desc = "守護巨龍召喚各種增益水晶計時器。"
	L.crystal_red = "生命賜福紅水晶"
	L.crystal_green = "夢之精華綠水晶"
	L.crystal_blue = "魔力之源藍水晶"

	L.twilight = "暮光之時"
	L.cast = "暮光之時施法條"
	L.cast_desc = "顯示暮光之時5秒施法條。"

	L.lightself = "自身凋零之光"
	L.lightself_desc = "顯示自身凋零之光爆炸剩餘計時條。"
	L.lightself_bar = "<你將爆炸>"

	L.lighttank = "坦克凋零之光"
	L.lighttank_desc = "如果坦克中了凋零之光，顯示一個爆炸計時條及閃爍震動。"
	L.lighttank_bar = "<%s 爆炸>"
	L.lighttank_message = "坦克爆炸！"
end

L = BigWigs:NewBossLocale("Warmaster Blackhorn", "zhTW")
if L then
	L.warmup = "熱身"
	L.warmup_desc = "首領戰鬥開始之前的計時器。"

	L.sunder = "破甲攻擊"
	L.sunder_desc = "破甲攻擊堆疊計數並顯示持續條。"
	L.sunder_message = "%2$d層破甲攻擊：>%1$s<！"

	L.sapper_trigger = "一頭龍急速飛來，載送一名暮光工兵降落到甲板上!"
	L.sapper = "暮光工兵"
	L.sapper_desc = "暮光工兵對天火號造成傷害。"

	L.stage2_trigger = "看來我得自己動手。好極了!"
end

L = BigWigs:NewBossLocale("Spine of Deathwing", "zhTW")
if L then
	L.engage_trigger = "他的護甲!他正在崩壞!破壞他的護甲，我們就有機會打贏他了!"

	L.about_to_roll = "感覺到玩家在他的"
	L.rolling = "%%s往[左右]+侧"
	L.not_hooked = ">你< 沒有抓牢！"
	L.roll_message = "他開始滾了，滾了，滾啦！"
	L.level_trigger = "平衡"
	L.level_message = "別急，他已經平衡了！"

	L.exposed = "裝甲暴露"

	L.residue = "未吸收的殘液"
	L.residue_desc = "當地面上還有剩餘未吸收的殘液時發出警報，等待被吸收。"
	L.residue_message = "殘液：>%d<！"
end

L = BigWigs:NewBossLocale("Madness of Deathwing", "zhTW")
if L then
	L.engage_trigger = "你們都徒勞無功。我會撕裂你們的世界。"

	-- Copy & Paste from Encounter Journal with correct health percentages (type '/dump (C_EncounterJournal.GetSectionInfo(4103)).title' in the game)
	L.smalltentacles_desc = "生命力降低為70%與40% 時，肢體觸手將會生長出數隻免疫範圍效果的極熾觸手。"

	L.bolt_explode = "<源質箭爆炸>"
	L.parasite = "腐化寄生體"
	L.blobs_soon = "%d%% - 即將凝結之血！"
end

-- Firelands

L = BigWigs:NewBossLocale("Beth'tilac", "zhTW")
if L then
	L.flare_desc = "當搖曳燼火範圍傷害時顯示計時條。"
	L.devastate_message = "悶燒破壞：>#%d<！"
	L.drone_bar = "下一燼網雄蛛"
	L.drone_message = "即將 燼網雄蛛！"
	L.kiss_message = "寡婦之吻！"
	L.spinner_warn = "燼網紡織者：>#%d<！"
end

L = BigWigs:NewBossLocale("Lord Rhyolith", "zhTW")
if L then
	L.armor = "黑曜石護甲"
	L.armor_desc = "當黑曜石護甲堆疊從萊爾利斯領主身上移除時發出警報。"
	L.armor_message = "%d%% 黑曜石護甲剩餘！"
	L.armor_gone_message = "黑曜石護甲消失！"

	L.adds_header = "增援"
	L.big_add_message = "萊爾利斯火花 出現！"
	L.small_adds_message = "即將 萊爾利斯碎片！"

	L.phase2_warning = "第二階段！"

	L.molten_message = "首領炎甲術堆疊：>%d<層！"

	L.stomp_message = "烈焰踐踏！"
	L.stomp = "烈焰踐踏"
end

L = BigWigs:NewBossLocale("Alysrazor", "zhTW")
if L then
	L.fullpower_soon_message = "即將 完全的力量！"
	L.halfpower_soon_message = "第四階段！"
	L.encounter_restart = "完全的力量"
	L.no_stacks_message = "你沒有羽毛！"
	L.moonkin_message = "去拿一些羽毛！"
	L.molt_bar = "下一脫毛"

	L.meteor = "熔岩隕石"
	L.meteor_desc = "當熔岩隕石被召喚時發出警報。"
	L.meteor_message = "熔岩隕石！"

	L.stage_message = "階段：>%d<！"
	L.kill_message = "就是現在 - 殺了她！"
	L.engage_message = "艾里絲拉卓開戰 - 約%d分鐘後第二階段！"

	L.worm_emote = "熾炎熔岩蟲從地上鑽了出來!"
	L.phase2_soon_emote = "艾里絲拉卓開始快速地在空中盤旋!"

	L.flight = "飛行助手"
	L.flight_desc = "當你“火焰之翼”持續時顯示計時條，使用超級醒目功能。"

	L.initiate = "熾炎猛禽學徒出現"
	L.initiate_desc = "熾炎猛禽學徒計時條。"
	L.initiate_both = "熾炎猛禽學徒：>雙向<！"
	L.initiate_west = "熾炎猛禽學徒：>西<！"
	L.initiate_east = "熾炎猛禽學徒：>東<！"
end

L = BigWigs:NewBossLocale("Shannox", "zhTW")
if L then
	L.safe = ">%s< 安全！"
	L.wary_dog = "小心翼翼：>%s<！"
	L.crystal_trap = "水晶囚牢陷阱！"

	L.traps_header = "陷阱"
	L.immolation = "獻祭陷阱"
	L.immolation_desc = "當怒面或裂軀階段獻祭陷阱時發出警報，獲得“小心翼翼”狀態。"
	L.immolationyou = ">你<腳下 獻祭陷阱！"
	L.immolationyou_desc = "當你腳下獻祭陷阱被召喚時發出警報。"
	L.immolationyou_message = "獻祭陷阱"
	L.crystal = "投擲水晶"
	L.crystal_desc = "當夏諾克斯施放水晶囚牢陷阱時發出警報。"
	--L.facerage_trigger = "Go for the throat!"
end

L = BigWigs:NewBossLocale("Baleroc", "zhTW")
if L then
	L.torment = "焦點折磨堆疊"
	L.torment_desc = "當焦點受到折磨堆疊時發出警報。"

	L.blade_bar = "虐殺之刃"
	L.shard_message = "折磨碎片：>%d<！"
	L.focus_message = "焦點目標已有 >%d< 層折磨！"
	L.link_message = "倒數"
end

L = BigWigs:NewBossLocale("Majordomo Staghelm", "zhTW")
if L then
	L.seed_explosion = ">你< 即將灼熱種子爆炸！"
	L.seed_bar = "你：灼熱種子爆炸"
	L.adrenaline_message = "激奮腺素：>%d<層！"
	L.leap_say = "跳躍火焰斬"
end

L = BigWigs:NewBossLocale("Ragnaros", "zhTW")
if L then
	L.intermission_end_trigger1 = "薩弗拉斯將終結你。"
	L.intermission_end_trigger2 = "跪下吧，凡人們!一切都將結束。"
	L.intermission_end_trigger3 = "夠了!我將結束這一切。"
	L.phase4_trigger = "太早了!...你們來的太早了..."
	L.seed_explosion = "熔岩晶粒爆炸！"
	L.intermission_bar = "中場"
	L.intermission_message = "中場！"
	L.sons_left = ">%d< 烈焰之子剩餘！"
	L.engulfing_close = "侵噬烈焰：>近場<！"
	L.engulfing_middle = "侵噬烈焰：>中場<！"
	L.engulfing_far = "侵噬烈焰：>遠場<！"
	L.hand_bar = "拉格納羅斯之手"
	L.ragnaros_back_message = "拉格納羅斯返回，集合！"
end

-- Throne of the Four Winds

L = BigWigs:NewBossLocale("Al'Akir", "zhTW")
if L then
	L.stormling = "小風暴"
	L.stormling_desc = "當召喚小風暴時發出警報。"

	L.acid_rain = "酸雨：>%d<！"

	L.feedback_message = "%dx 回饋！"
end

L = BigWigs:NewBossLocale("Conclave of Wind", "zhTW")
if L then
	L.gather_strength = "%s正在聚集力量！"

	L["93059_desc"] = "當風暴之盾吸收傷害時發出警報。"

	L.full_power = "滿能量"
	L.full_power_desc = "當首領獲得滿能量並開始施放特殊技能時發出警報。"
	L.gather_strength_emote = "%s開始從剩下的風之王那裡取得力量!"
end
