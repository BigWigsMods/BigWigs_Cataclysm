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
	L.strikes_message = "Strikes"

	L.breath_message = "Breath incoming!"
	L.breath_bar = "~Breath"

	L.engage_yell = "Cho'gall will have your heads"
end
L = mod:GetLocale()

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions() return {83908, 83603, 83707, 83710, "berserk"} end

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
	self:Message(args.spellId, "Important")
	self:Bar(args.spellId, 25)
end

-- Slate Dragon: Stone Touch (83603), 35 sec internal cd, resulting in Paralysis, 12 sec stun
-- Next Stone Touch after 23 sec, hence delaying Furious Roar if less then 12 sec left
function mod:Paralysis(args)
	self:Message(83603, "Attention", nil, args.spellId)
	self:Bar(83603, 12, CL["cast"]:format(args.spellName), args.spellId)
	self:Bar(83603, 35, args.spellId)
end

function mod:MalevolentStrikes(args)
	if args.amount > (self:Heroic() and 5 or 10) then -- 8% in heroic, 6% in normal, announce around 50-60% reduced healing
		self:StackMessage(args.spellId, args.destName, args.amount, "Urgent", "Info", L["strikes_message"])
	end
end

function mod:Breath(args)
	self:Message(args.spellId, "Attention", nil, L["breath_message"])
	self:Bar(args.spellId, 20, L["breath_bar"])
end

