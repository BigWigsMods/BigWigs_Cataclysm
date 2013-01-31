--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Alizabal", 752, 339)
if not mod then return end
mod:RegisterEnableMob(55869)

local firstAbility = nil
local danceCount = 0

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale("enUS", true)
if L then
	L.first_ability = "Skewer or Hate"
	L.dance_message = "Blade Dance %d of 3"
end
L = mod:GetLocale()

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {105067, 104936, 105784, "berserk", "bosskill"}
end

function mod:OnBossEnable()
	self:Log("SPELL_AURA_APPLIED", "Hate", 105067)
	self:Log("SPELL_AURA_APPLIED", "Skewer", 104936)
	self:Log("SPELL_AURA_APPLIED", "BladeDance", 105784)
	self:Log("SPELL_AURA_REMOVED", "BladeDanceOver", 105784)

	self:RegisterEvent("INSTANCE_ENCOUNTER_ENGAGE_UNIT", "CheckBossStatus")

	self:Death("Win", 55869)
end

function mod:OnEngage()
	self:Berserk(300)
	self:Bar(104936, L["first_ability"], 7, 104936)
	self:Bar(105784, 105784, 35, 105784) -- Blade Dance
	firstAbility = nil
	danceCount = 0
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:Hate(args)
	if not firstAbility then
		firstAbility = true
		self:Bar(104936, 104936, 8, 104936) -- Skewer
	end
	self:Bar(args.spellId, args.spellName, 20, args.spellId)
	self:TargetMessage(args.spellId, args.spellName, args.destName, "Important", args.spellId)
end

function mod:Skewer(args)
	if not firstAbility then
		firstAbility = true
		self:Bar(105067, 105067, 8, 105067) -- Seething Hate
	end
	self:Bar(args.spellId, args.spellName, 20, args.spellId)
	self:TargetMessage(args.spellId, args.spellName, args.destName, "Attention", args.spellId)
end

function mod:BladeDance(args)
	danceCount = danceCount + 1
	self:Message(args.spellId, L["dance_message"]:format(danceCount), "Urgent", args.spellId, "Info")
	self:Bar(args.spellId, CL["cast"]:format(args.spellName), 4, args.spellId)
	if danceCount == 1 then
		firstAbility = nil
		-- XXX Fix this up instead of just cancelling the bars
		self:StopBar(104936) -- Skewer
		self:StopBar(105067) -- Seething Hate
		self:Bar(args.spellId, args.spellName, 60, args.spellId)
	end
end

function mod:BladeDanceOver()
	if danceCount == 3 then
		self:Bar(104936, L["first_ability"], 8, 104936)
		danceCount = 0
	end
end

