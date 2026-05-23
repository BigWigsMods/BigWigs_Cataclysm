-- Baradin Hold

local L = BigWigs:NewBossLocale("Occu'thar", "ptBR")
if L then
	L.shadows_bar = "~Sombras"
	L.destruction_bar = "<Explosão>"
	L.eyes_bar = "~Olhos"

	L.fire_message = "Laser, Pew Pew"
	L.fire_bar = "~Laser"
end

L = BigWigs:NewBossLocale("Alizabal", "ptBR")
if L then
	L.first_ability = "Ódio ou Espetinho"
	L.dance_message = "Dança de Lâminas %d de 3"
end

-- Bastion of Twilight

L = BigWigs:NewBossLocale("Halfus Wyrmbreaker", "ptBR")
if L then
	L.strikes_message = "Golpe"
	--L.freed_message = "%s freed %s"
end

L = BigWigs:NewBossLocale("Cho'gall", "ptBR")
if L then
	L.orders = "Trocas de modos"
	L.orders_desc = "Avisa quando Cho'gall muda a ordem de posições entre Sombra/Chamas."

	L.crash_say = "Colisão"
	L.worship_cooldown = "~Conversão"
	L.adherent_bar = "Add grande #%d"
	L.adherent_message = "Add %d aparece!"
	L.ooze_bar = "Enxame de lamas %d"
	L.ooze_message = "Enxame de lamas %d em breve!"
	L.tentacles_bar = "Aparecem tentáculos"
	L.tentacles_message = "Festa de tentáculos!"
	L.sickness_message = "Você se sente horrivel!"

	L.blaze_message = "Fogo em VOCÊ!"

	L.fury_message = "Fúria!"
	L.first_fury_soon = "Fúria em breve!"
	L.first_fury_message = "85% - Fúria começou!"

	L.unleashed_shadows = "Sombras Energizadas"

	L.phase2_message = "Fase 2!"
	L.phase2_soon = "Fase 2 Iminente!"
end

L = BigWigs:NewBossLocale("Valiona and Theralion", "ptBR")
if L then
	L.phase_switch = "Troca de fase"
	L.phase_switch_desc = "Avisa as trocas de fase"

	L.phase_bar = "%s aterrisa"
	L.breath_message = "Respiração profunda Iminente!"
	L.dazzling_message = "Zonas espirais Iminente!"

	L.blast_message = "Explosão Crepúscular" --Sounds better and makes more sense than Twilight Blast (the user instantly knows something is coming from the sky at them)
	L.engulfingmagic_say = "Magia Engolfante"

	L.valiona_trigger = "Theralion, eu vou incendiar o corredor. Cubra a fuga deles!"

	L.twilight_shift = "Troca"
end

L = BigWigs:NewBossLocale("Sinestra", "ptBR")
if L then
	L.whelps = "Dragonetes"
	L.whelps_desc = "Avisar sobre ondas de Dragonetes."

	L.slicer_message = "Possíveis alvos da orbe"

	L.egg_vulnerable = "Hora do Omelete!"

	L.whelps_trigger = "Alimentem-se crianças! Fartem-se com as carcaças cheias de carne."
	L.omelet_trigger = "Confunde isso com fraqueza?  Quanta tolice!"

	L.phase13 = "Fase 1 e 3"
	L.phase = "Fase"
	L.phase_desc = "Avisa quando trocar de fases."
end

L = BigWigs:NewBossLocale("Ascendant Council", "ptBR")
if L then
	L.health_report = "%s com %d%%, mudança de fase iminente!"
	L.switch = "Troca"
	L.switch_desc = "Avisa a troca de chefes."

	L.shield_up_message = "Escudo ATIVADO!"
	L.shield_down_message = "Escudo DESATIVADO!"
	L.shield_bar = "Escudo"

	L.switch_trigger = "Nós cuidaremos deles!"

	L.thundershock_quake_soon = "%s em 10seg!"

	L.quake_trigger = "O chão abaixo de você treme bruscamente...."
	L.thundershock_trigger = "O ar que lhe rodeia fundiu-se com a energia...."

	L.thundershock_quake_spam = "%s em %d"

	L.last_phase_trigger = "Que apresentação incrível..."
end

-- Blackwing Descent

L = BigWigs:NewBossLocale("Magmaw", "ptBR")
if L then
	L.stage2_yell_trigger = "meu verme de lava" -- Inconcebível! Talvez você consiga mesmo derrotar meu verme de lava! Quem sabe eu possa... virar o jogo um pouquinho.

	L.slump = "Cair"
	L.slump_desc = "Magorja cai e fica exposto, permitindo que o rodeio começe."
	L.slump_bar = "Rodeio"
	L.slump_message = "Yeeeha!! MONTA NELE!!"
end

L = BigWigs:NewBossLocale("Omnotron Defense System", "ptBR")
if L then
	L.nef = "Lorde Victor Nefarius"
	L.nef_desc = "Avisos para as habilidades de Lorde Victor Nefarius"

	L.pool_explosion = "Gerador de poder sobrecarregado"
	L.incinerate = "Incinerar"
	L.flamethrower = "Lança-chamas"
	L.lightning = "Condutor de Raios"
	L.infusion = "Infusão"
end

L = BigWigs:NewBossLocale("Atramedes", "ptBR")
if L then
	L.obnoxious_fiend = "Diabrete Irritante" -- NPC ID 49740
	--L.circles = "Circles"
end

L = BigWigs:NewBossLocale("Maloriak", "ptBR")
if L then
	L.flames = "Chamas"
end

L = BigWigs:NewBossLocale("Nefarian", "ptBR")
if L then
	L.discharge = "Descarga"
	L.stage3_yell_trigger = "MATAR TODOS VOCÊS" -- Eu tentei ser um anfitrião afável, mas vocês se recusaram a morrer! Está na hora de acabar com o fingimento e simplesmente... MATAR TODOS VOCÊS!
end

-- Dragon Soul

L = BigWigs:NewBossLocale("Morchok", "ptBR")
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

-- Firelands

L = BigWigs:NewBossLocale("Beth'tilac", "ptBR")
if L then
	L.flare_desc = "Mostra uma barra de tempo para o AoE."
	L.devastate_message = "Devastação #%d"
	L.drone_bar = "Soldade de Teia"
	L.drone_message = "Soldado de teia apareceu!"
	L.kiss_message = "Beijo"
	L.spinner_warn = "Tecelã #%d"
end

L = BigWigs:NewBossLocale("Lord Rhyolith", "ptBR")
if L then
	L.armor = "Armadura Obsidiana"
	L.armor_desc = "Avisar quando os stacks de armadura estiverem= desaparecendo do Rhyolith."
	L.armor_message = "%d%% armadura restante"
	L.armor_gone_message = "Armadura destruida!"

	L.adds_header = "Adds"
	L.big_add_message = "Add grande apareceu!"
	L.small_adds_message = "Adds pequenos apareceram!"

	L.phase2_warning = "Fase 2 iminente!"

	L.molten_message = "%dx stacks no chefe!"

	L.stomp_message = "Pisotear! Pisotear! Pisotear!"
	L.stomp = "Pisoteio!"
end

L = BigWigs:NewBossLocale("Alysrazor", "ptBR")
if L then
	L.fullpower_soon_message = "Poder máximo iminente!"
	L.halfpower_soon_message = "Fase 4 iminente!"
	L.encounter_restart = "E lá vamos nós dinovo ..."
	L.no_stacks_message = "Não sei se você se importa, más você não tem nenhuma pena!"
	L.moonkin_message = "Pare de fingir e consiga algumas penas de verdade"
	L.molt_bar = "Próxima Muda"

	L.meteor = "Meteóro"
	L.meteor_desc = "Avisa quando um meteóro de lava é invocado."
	L.meteor_message = "Meteóro!"

	L.stage_message = "Fase %d"
	L.kill_message = "Agora ou nunca - Matem-no!"
	L.engage_message = "Alysrazor iniciado - Fase 2 em ~%d min"

	L.worm_emote = "Vermes de lava ígneos surgiram do solo!"
	L.phase2_soon_emote = "Alysrazor começou a voar rápido em círculos."

	L.flight = "Assistente de vôo"
	L.flight_desc = "Mostra uma barra com a duração das 'Asas de Fogo' em você, é ideal usar isso com a opção de Super Enfatizar."

	L.initiate = "Iniciante apareceu"
	L.initiate_desc = "Mostra contadores para reaparição dos novatos flamejantes."
	L.initiate_both = "Ambos novatos flamejantes"
	L.initiate_west = "Novato Flamejante a Oeste"
	L.initiate_east = "Novato Flamejante a Leste"
end

L = BigWigs:NewBossLocale("Shannox", "ptBR")
if L then
	L.safe = "%s está salvo"
	L.wary_dog = "%s está desconfiado!"
	L.crystal_trap = "Prisão de cristal"

	L.traps_header = "Armadilhas"
	L.immolation = "Armadilha Imolante no cachorro"
	L.immolation_desc = "Alerta quando Face da Fúria pisar numa armadilha imolante, ganhando o bônus 'Desconfiado'."
	L.immolationyou = "Armadilha Imolante debaixo de VOCÊ"
	L.immolationyou_desc = "Alerta quando uma armadilha imolante aparece debaixo de você."
	L.immolationyou_message = "Armadilha Imolante"
	L.crystal = "Armadilha de cristal"
	L.crystal_desc = "Avisa quando Shannox lançar uma armadilha de cristal debaixo de você."
	--L.facerage_trigger = "Go for the throat!"
end

L = BigWigs:NewBossLocale("Baleroc", "ptBR")
if L then
	L.torment = "Stack de Tormento no seu Foco"
	L.torment_desc = "Avisa quando seu /foco ganha outro stack de Tormento."

	L.blade_bar = "~Próxima espada"
	L.shard_message = "Fragmento roxo (%d)!"
	L.focus_message = "Seu foco tem %d stacks!"
	L.link_message = "Linkado"
end

L = BigWigs:NewBossLocale("Majordomo Staghelm", "ptBR")
if L then
	L.seed_explosion = "Você explodirá em instantes!"
	L.seed_bar = "Você explode!"
	L.adrenaline_message = "Adrenalina x%d!"
	L.leap_say = "Salto"
end

L = BigWigs:NewBossLocale("Ragnaros", "ptBR")
if L then
	L.intermission_end_trigger1 = "Sulfuras trará sua ruína."
	L.intermission_end_trigger2 = "Ajoelhem-se, mortais! Isso acaba agora."
	L.intermission_end_trigger3 = "Chega! Vou acabar com isso."
	L.phase4_trigger = "Cedo demais!... vocês vieram cedo demais..." --verificar
	L.seed_explosion = "Explosão de sementes!"
	L.intermission_bar = "Intervalo!"
	L.intermission_message = "Intervalo... Tem bolacha?"
	L.sons_left = "%d |4filhos restante:filhos restantes;"
	L.engulfing_close = "Parte mais próxima submergida!"
	L.engulfing_middle = "Parte central submergida!"
	L.engulfing_far = "Parte mais longe submergida"
	L.hand_bar = "Rebote"
	L.ragnaros_back_message = "Raggy voltou, se preparem!"
end

-- Throne of the Four Winds

L = BigWigs:NewBossLocale("Al'Akir", "ptBR")
if L then
	L.stormling = "Tempestinhas"
	L.stormling_desc = "Invoca Tempestinha."

	L.acid_rain = "Chuva ácida (%d)"

	L.feedback_message = "%dx Retornado"
end

L = BigWigs:NewBossLocale("Conclave of Wind", "ptBR")
if L then
	L.gather_strength = "%s começou a ganhar forças"

	L["93059_desc"] = "Escudo de absorção"

	L.full_power = "Poder Máximo"
	L.full_power_desc = "Avisa quando os chefes alcanção Poder Máximo e começam a lançar as habilidades especiais."
	L.gather_strength_emote = "%s começou a ganhar forças dos Senhores do vento que cairam!"
end
