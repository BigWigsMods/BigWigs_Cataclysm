--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Halfus Wyrmbreaker", 671, 156)
if not mod then return end
mod:RegisterEnableMob(44600)
mod:SetEncounterID(1030)
mod:SetRespawnTime(30)

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:GetLocale()
if L then
	L.strikes_message = "Strikes"

	L.engage_yell_trigger = "Cho'gall will have your heads"
end

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		83908, -- Malevolent Strikes
		{84030, "CASTBAR"}, -- Paralysis
		83707, -- Scorching Breath
		83710, -- Furious Roar
		"berserk",
	},nil,{
		[83908] = L.strikes_message, -- Malevolent Strikes (Strikes)
		[83707] = CL.breath, -- Scorching Breath (Breath)
	}
end

function mod:OnBossEnable()
	self:Log("SPELL_CAST_START", "FuriousRoar", 83710)
	self:Log("SPELL_AURA_APPLIED", "Paralysis", 84030) -- used with Slate Dragon active
	self:Log("SPELL_AURA_APPLIED_DOSE", "MalevolentStrikes", 83908) -- used with Slate Dragon ready
	self:Log("SPELL_CAST_START", "ScorchingBreath", 83707) -- used by Proto-Behemoth with whelps ready

	-- No boss frames..
	self:RegisterEvent("CHAT_MSG_MONSTER_YELL")
end

function mod:OnEngage()
	self:Berserk(360)
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:CHAT_MSG_MONSTER_YELL(_, msg)
	if msg:find(L.engage_yell_trigger, nil, true) then
		self:Engage()
	end
end

function mod:FuriousRoar(args)
	self:Message(args.spellId, "orange")
	self:CDBar(args.spellId, 25)
	self:PlaySound(args.spellId, "info")
end

-- Slate Dragon: Stone Touch (83603), 35 sec internal cd, resulting in Paralysis, 12 sec stun
-- Next Stone Touch after 23 sec, hence delaying Furious Roar if less then 12 sec left
function mod:Paralysis(args)
	self:Message(args.spellId, "yellow")
	self:CastBar(args.spellId, 12)
	self:Bar(args.spellId, 35)
	self:PlaySound(args.spellId, "long")
end

function mod:MalevolentStrikes(args)
	if args.amount >= (self:Heroic() and 6 or 8) then -- 8% in heroic, 6% in normal, announce around 50-60% reduced healing
		self:StackMessage(args.spellId, "purple", args.destName, args.amount, self:Heroic() and 7 or 10, L.strikes_message)
	end
end

function mod:ScorchingBreath(args)
	self:Message(args.spellId, "red", CL.breath)
	self:CDBar(args.spellId, 20, CL.breath)
	self:PlaySound(args.spellId, "alert")
end
