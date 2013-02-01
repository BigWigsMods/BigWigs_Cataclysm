--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Halfus Wyrmbreaker", 758, 156)
if not mod then return end
mod:RegisterEnableMob(44600)

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale("enUS", true)
if L then
	L.strikes_message = "%2$dx Strikes on %1$s"

	L.breath_message = "Breath incoming!"
	L.breath_bar = "~Breath"

	L.engage_yell = "Cho'gall will have your heads"
end
L = mod:GetLocale()

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions() return {83908, 83603, 83707, 83710, "berserk", "bosskill"} end

function mod:OnBossEnable()
	self:Log("SPELL_CAST_START", "FuriousRoar", 83710)
	self:Log("SPELL_AURA_APPLIED", "Paralysis", 84030) -- used with Slate Dragon active
	self:Log("SPELL_AURA_APPLIED_DOSE", "MalevolentStrikes", 83908) -- used with Slate Dragon ready
	self:Log("SPELL_CAST_START", "Breath", 83707) -- used by Proto-Behemoth with whelps ready

	--No CheckBossStatus() here as event does not fire, GM confirms "known" issue.
	--It's more likely to be because there isn't enough frames for all bosses on heroic.
	self:Yell("Engage", L["engage_yell"])
	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")

	self:Death("Win", 44600)
end

function mod:OnEngage()
	self:Berserk(360)
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:FuriousRoar(args)
	self:Message(args.spellId, args.spellName, "Important", args.spellId)
	self:Bar(args.spellId, args.spellName, 25, args.spellId)
end

-- Slate Dragon: Stone Touch (83603), 35 sec internal cd, resulting in Paralysis, 12 sec stun
-- Next Stone Touch after 23 sec, hence delaying Furious Roar if less then 12 sec left
function mod:Paralysis(args)
	self:Message(83603, args.spellName, "Attention", args.spellId)
	self:Bar(83603, CL["cast"]:format(args.spellName), 12, args.spellId)
	self:Bar(83603, args.spellName, 35, args.spellId)
end

function mod:MalevolentStrikes(args)
	local stackWarn = self:Heroic() and 5 or 10 -- 8% in heroic, 6% in normal, announce around 50-60% reduced healing
	if args.amount > stackWarn then
		self:TargetMessage(args.spellId, L["strikes_message"], args.destName, "Urgent", args.spellId, "Info", args.amount)
	end
end

function mod:Breath(args)
	self:Message(args.spellId, L["breath_message"], "Attention", args.spellId)
	self:Bar(args.spellId, L["breath_bar"], 20, args.spellId)
end

