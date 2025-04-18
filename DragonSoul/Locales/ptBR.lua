local L = BigWigs:NewBossLocale("Morchok", "ptBR")
if not L then return end
if L then
	L.engage_trigger = "Vocês querem deter uma avalanche. Mas eu vou soterrar vocês."

	L.crush_desc = "Mostra os stacks de Esmagar armadura e uma barra com sua duração."

	L.blood = "Sangue"

	L.explosion = "Explosão"
	L.crystal = "Cristal"
end

L = BigWigs:NewBossLocale("Warlord Zon'ozz", "ptBR")
if L then
	L.engage_trigger = "Zzof Shuul'wah. Thoq fssh N'Zoth!"

	L.ball = "Esfera Vazia"
	L.ball_desc = "Uma esfera vazia que se rebate entre os jogadores e o chefe."
	L.ball_yell = "Gul'kafh an'qov N'Zoth."

	--L.ball_active = "Void ball active"
	--L.ball_active_desc = "Timer for when the void ball activates (i.e. it can bounce)."

	L.bounce = "Rebater Esfera Vazia"
	L.bounce_desc = "Contador para o rebate da Esfera Vazia."

	L.darkness = "Festa de tentáculos!"
	L.darkness_desc = "Esta fase começa, quando a esfera vazia acerta o chefe."

	L.shadows = "Sombras"

	L.custom_off_shadows_marker = "Disrupting Shadows marker"
	L.custom_off_shadows_marker_desc = "Mark Disrupting Shadows targets with {rt1}{rt2}{rt3}, requires promoted or leader.\n|cFFFF0000Only 1 person in the raid should have this enabled to prevent marking conflicts.|r"
end

L = BigWigs:NewBossLocale("Yor'sahj the Unsleeping", "ptBR")
if L then
	L.engage_trigger = "Iilth qi'uothk shn'ma yeh'glu Shath'Yar! H'IWN IILTH!"

	L.bolt_desc = "Conta os stacks de Seta Caótica e mostra uma barra com sua duração."
	L.bolt_message = "%2$dx Seta em %1$s"

	L.blue = "|cFF0080FFAzul|r"
	L.green = "|cFF088A08Verde|r"
	L.purple = "|cFF9932CDRoxo|r"
	L.yellow = "|cFFFFA901Amarelo|r"
	L.black = "|cFF424242Preto|r"
	L.red = "|cFFFF0404Vermelho|r"

	L.blobs = "Glóbulos"
	L.blobs_bar = "Próximo Glóbulo"
	L.blobs_desc = "Os glóbulos se movem em direção ao chefe"
end

L = BigWigs:NewBossLocale("Hagara the Stormbinder", "ptBR")
if L then
	L.engage_trigger = "Vocês cruzaram o caminho da Tempestigadora! Vou arrasar com vocês"

	L.lightning_or_frost = "Relâmpago ou Gelo"
	L.ice_next = "Fase de Gelo"
	L.lightning_next = "Fase de Relâmpago"

	L.nextphase = "Próxima fase"
	L.nextphase_desc = "Avisos para a próxima fase"
end

L = BigWigs:NewBossLocale("Ultraxion", "ptBR")
if L then
	L.engage_trigger = "Agora é a Hora do Crepúsculo!"

	L.warmup = "Aquecimento"
	L.warmup_desc = "Tempo de aquecimento"
	L.warmup_trigger = "Eu sou o Início do Fim, a sombra que oculta o sol, o sino que anuncia a sua perdição."

	L.crystal = "Cristais de bônus"
	L.crystal_desc = "Contadores para vários cristais de bônus que os PNJ's invocam."
	L.crystal_red = "Cristal vermelho"
	L.crystal_green = "Cristal verde"
	L.crystal_blue = "Cristal azul"

	L.twilight = "Crepúsculo"
	L.cast = "Barra de contagem para crepúsculo"
	L.cast_desc = "Mostrar uma barra de 5 segundos quando se está castando Crepúsculo."

	L.lightself = "Luz efêmera em VOCÊ"
	L.lightself_desc = "Mostrar uma barra que visualiza o tempo restante para que a Luz efêmera exploda você."
	L.lightself_bar = "<Você explode!>"

	L.lighttank = "Luz efêmera em tanquer"
	L.lighttank_desc = "Se um tanque está com a Luz efêmera, mostrará uma barra e piscará para a explosão."
	L.lighttank_bar = "<%s explode!>"
	L.lighttank_message = "Tanque explodindo"
end

L = BigWigs:NewBossLocale("Warmaster Blackhorn", "ptBR")
if L then
	L.warmup = "Aquecimento"
	L.warmup_desc = "Tempo até que o combate comece."

	L.sunder = "Fender armadura"
	L.sunder_desc = "Mostra os stacks de Fender armadura e uma barra com sua duração."
	L.sunder_message = "%2$dx Fender em %1$s"

	L.sapper_trigger = "Um draco mergulha para lançar um Sapador do Crepúsculo ao convés!"
	L.sapper = "Sapador"
	L.sapper_desc = "Um Sapador tenta causar danos a nave"

	L.stage2_trigger = "Pelo jeito, vou ter que fazer isso sozinho. Ótimo!"
end

L = BigWigs:NewBossLocale("Spine of Deathwing", "ptBR")
if L then
	L.engage_trigger = "As placas! Ele está se desfazendo! Destruam as placas e teremos uma chance de derrotá-lo!"

	L.about_to_roll = "a ponto de girar"
	L.rolling = "girou"
	L.not_hooked = "VOCÊ >NÃO< está enganchado!"
	L.roll_message = "Ele está girando, girando, girando!"
	L.level_trigger = "Asa da Morte nivela."
	L.level_message = "Ótimo, ele se estabilizou!"

	L.exposed = "Armadura exposta"

	L.residue = "Residuos não-absorvidos"
	L.residue_desc = "Mensagens que te informão quanto um residuo de sangue cai no chao."
	L.residue_message = "Residuos: %d"
end

L = BigWigs:NewBossLocale("Madness of Deathwing", "ptBR")
if L then
	L.engage_trigger = "Vocês não fizeram NADA. Seu mundo será DESTRUÍDO."

	-- Copy & Paste from Encounter Journal with correct health percentages (type '/dump (C_EncounterJournal.GetSectionInfo(4103)).title' in the game)
	L.smalltentacles_desc = "At 70% and 40% remaining health the Limb Tentacle sprouts several Blistering Tentacles that are immune to Area of Effect abilities."

	L.bolt_explode = "<Raio Explode>"
	L.parasite = "Parasita"
	L.blobs_soon = "%d%% - Sangue corrupto iminente!"
end

