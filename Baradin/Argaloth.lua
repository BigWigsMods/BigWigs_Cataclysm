--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Argaloth", 757, 139)
if not mod then return end
mod:RegisterEnableMob(47120)
mod:SetEncounterID(1033)
mod:SetRespawnTime(30)

--------------------------------------------------------------------------------
-- Locals
--

local fireStormHP = 100

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		88942, -- Meteor Slash
		88954, -- Consuming Darkness
		{88972, "CASTBAR"}, -- Fel Firestorm
		"berserk",
	}
end

function mod:OnBossEnable()
	self:Log("SPELL_CAST_START", "MeteorSlash", 88942)
	self:Log("SPELL_CAST_SUCCESS", "ConsumingDarkness", 88954)
	self:Log("SPELL_AURA_APPLIED", "ConsumingDarknessApplied", 88954)
	self:Log("SPELL_CAST_START", "FelFirestorm", 88972)
	self:Log("SPELL_AURA_APPLIED", "FelFirestormApplied", 88972)
	self:Log("SPELL_AURA_REMOVED", "FelFirestormRemoved", 88972)
end

function mod:OnEngage()
	fireStormHP = 100
	self:RegisterUnitEvent("UNIT_HEALTH", nil, "boss1")
	self:Berserk(300)
	self:CDBar(88942, 10) -- Meteor Slash
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:MeteorSlash(args)
	self:Message(args.spellId, "red")
	self:CDBar(args.spellId, 17)
end

do
	local playerList = {}
	function mod:ConsumingDarkness()
		playerList = {}
	end

	function mod:ConsumingDarknessApplied(args)
		playerList[#playerList+1] = args.destName
		self:TargetsMessage(args.spellId, "yellow", playerList)
	end
end

function mod:FelFirestorm(args)
	self:StopBar(88942) -- Meteor Slash
	self:Message(args.spellId, "orange", CL.percent:format(fireStormHP, args.spellName))
	self:PlaySound(args.spellId, "long")
end

function mod:FelFirestormApplied(args)
	self:CastBar(args.spellId, 15)
end

function mod:FelFirestormRemoved(args)
	self:StopBar(CL.cast:format(args.spellName))
	self:CDBar(88942, 14) -- Meteor Slash
end

function mod:UNIT_HEALTH(event, unit)
	local hp = self:GetHealth(unit)
	if hp < 69 and fireStormHP > 70 then
		fireStormHP = 66
		self:Message(88972, "yellow", CL.soon:format(self:SpellName(88972)), false)
	elseif hp < 36 and fireStormHP > 50 then
		fireStormHP = 33
		self:UnregisterUnitEvent(event, unit)
		self:Message(88972, "yellow", CL.soon:format(self:SpellName(88972)), false)
	end
end
