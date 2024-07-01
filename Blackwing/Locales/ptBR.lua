
local L = BigWigs:NewBossLocale("Magmaw", "ptBR")
if not L then return end
if L then
	L.stage2_yell_trigger = "Você parece ter derrotado meu verme de lava."

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
	L.air_phase_trigger = "Isso, fujam! Com cada passo, seus corações aceleram. Os batimentos, forte como trovôes... Chegam quase a ensurdecer. Vocês não vão escapar!"
end

L = BigWigs:NewBossLocale("Maloriak", "ptBR")
if L then
	L.flames = "Chamas"
	L.dark_phase_emote_trigger = "Escura"
end

L = BigWigs:NewBossLocale("Nefarian", "ptBR")
if L then
	L.phase = "Fases"
	L.phase_desc = "Avisa as trocas de fase."

	L.discharge_bar = "Descarga elétrica"

	L.phase_two_trigger = "Malditos sejam, mortais! Um descaso tão grande pelos bens de alguém merece ser recebido violência extrema!"

	L.phase_three_trigger = "Eu tentei ser um anfitrião afável, mas vocês se recusaram a morrer! Está na hora de acabar com o fingimento e simplesmente... MATAR TODOS VOCÊS!"

	L.crackle_trigger = "O ar estala com eletricidade!"
	L.crackle_message = "Eletrecutação iminente!"

	--L.shadowblaze_trigger = "Flesh turns to ash!"
	L.shadowblaze_message = "Fogo abaixo de VOCÊ"

	L.onyxia_power_message = "Explosão iminente!"

	L.chromatic_prototype = "Protótipos cromáticos" -- 3 adds name
end
