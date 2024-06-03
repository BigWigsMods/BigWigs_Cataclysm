
local L = BigWigs:NewBossLocale("Magmaw", "ptBR")
if not L then return end
if L then
	L.stage2_yell_trigger = "Você parece ter derrotado meu verme de lava."

	L.slump = "Cair"
	L.slump_desc = "Magorja cai e fica exposto, permitindo que o rodeio começe."
	L.slump_bar = "Rodeio"
	L.slump_message = "Yeeeha!!! MONTA NELE!!!"
	L.slump_emote_trigger = "%s cai para frente, expondo as pinças!"

	L.expose_emote_trigger = "cabeça"
end

L = BigWigs:NewBossLocale("Omnotron Defense System", "ptBR")
if L then
	L.nef = "Lorde Victor Nefarius"
	L.nef_desc = "Avisos para as habilidades de Lorde Victor Nefarius"

	L.pool = "Gerador de poder sobrecarregado"
end

L = BigWigs:NewBossLocale("Chimaeron", "ptBR")
if L then
	L.bileotron_engage = "O Vomitomático é ativado e começa a emitir uma substância de cheiro repelente.."

	L.next_system_failure = "Próxima falha de sistema"

	L.phase2_message = "Fase de mortalidade iminente!"
end

L = BigWigs:NewBossLocale("Atramedes", "ptBR")
if L then
	L.ground_phase = "Fase em terra"
	L.ground_phase_desc = "Avisa quando Atramedes aterriza."
	L.air_phase = "Fase aérea"
	L.air_phase_desc = "Avisa quando Atramedes voa."

	L.air_phase_trigger = "Isso, fujam! Com cada passo, seus corações aceleram. Os batimentos, forte como trovôes... Chegam quase a ensurdecer. Vocês não vão escapar!"

	L.obnoxious_soon = "Diabrete irritante iminente!"

	L.searing_soon = "Chamas calcinantes em 10 seg!"
end

L = BigWigs:NewBossLocale("Maloriak", "ptBR")
if L then
	--heroic
	L.sludge = "Lodo escuro"
	L.sludge_desc = "Avisa quando pisa em um lodo escuro."
	L.sludge_message = "Lodo em VOCÊ!"

	--normal
	L.final_phase = "Fase final"
	L.final_phase_soon = "Fase final iminente!"

	L.release_aberration_message = "%s adds restantes!"
	L.release_all = "%s adds liberados!"

	L.phase = "Fase"
	L.phase_desc = "Avisa as trocas de fase."
	L.next_phase = "Próxima fase"
	L.green_phase_bar = "Fase Verde"

	L.red_phase_trigger = "Misturar, agitar e aquecer..."
	L.red_phase_emote_trigger = "vermelho"
	L.red_phase = "Fase |cFFFF0000Vermelha|r"
	L.blue_phase_trigger = "Como será que a carcaça humana lida com as mudanças extremas de temperatura? Tenho que descobrir, pela ciência!"
	L.blue_phase_emote_trigger = "azul"
	L.blue_phase = "Fase |cFF809FFEAzul|r"
	L.green_phase_trigger = "Este está um pouco instável, mas o que é o progresso sem o fracasso?"
	L.green_phase_emote_trigger = "verde"
	L.green_phase = "Fase |cFF33FF00Verde|r"
	L.dark_phase_trigger = "Meus fracassos serão sua desgraça!"
	L.dark_phase_emote_trigger = "Escura"
	L.dark_phase = "Fase |cFF660099Escura|r"
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
