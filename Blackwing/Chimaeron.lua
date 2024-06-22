--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Chimaeron", 669, 172)
if not mod then return end
mod:RegisterEnableMob(43296)
mod:SetEncounterID(1023)
mod:SetRespawnTime(30)

--------------------------------------------------------------------------------
-- Locals
--

local massacreCount = 1
local systemsFailureCount = 0

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:GetLocale()
if L then
	L.bileotron_engage = "The Bile-O-Tron springs to life and begins to emit a foul smelling substance."
end

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		"warmup",
		{82848, "CASTBAR", "CASTBAR_COUNTDOWN"}, -- Massacre
		88826, -- Double Attack
		82881, -- Break
		{88853, "EMPHASIZE"}, -- Systems Failure
		82935, -- Caustic Slime
		82890, -- Mortality
		"berserk"
	}
end

function mod:OnBossEnable()
	self:Log("SPELL_CAST_SUCCESS", "PipsMixture", 82705)
	self:Log("SPELL_AURA_APPLIED", "SystemsFailureApplied", 88853)
	self:Log("SPELL_AURA_REMOVED", "SystemsFailureRemoved", 88853)
	self:Log("SPELL_AURA_APPLIED", "BreakApplied", 82881)
	self:Log("SPELL_AURA_APPLIED_DOSE", "BreakApplied", 82881)
	self:Log("SPELL_AURA_REFRESH", "BreakRefresh", 82881)
	self:Log("SPELL_AURA_APPLIED", "DoubleAttackApplied", 88826)
	self:Log("SPELL_AURA_REMOVED", "DoubleAttackRemoved", 88826)
	self:Log("SPELL_CAST_START", "MassacreStart", 82848)
	self:Log("SPELL_CAST_SUCCESS", "Massacre", 82848)
	self:Log("SPELL_CAST_SUCCESS", "Mortality", 82890)
end

function mod:OnEngage()
	massacreCount = 1
	systemsFailureCount = 0
	self:StopBar(CL.active)
	self:Berserk(450)
	self:CDBar(82881, 4.8) -- Break
	self:Bar(82935, 15) -- Caustic Slime
	self:Bar(82848, 25, CL.count:format(self:SpellName(82848), massacreCount)) -- Massacre
	self:RegisterUnitEvent("UNIT_HEALTH", nil, "boss1")
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:PipsMixture()
	self:Bar("warmup", 30, CL.active, "achievement_dungeon_blackwingdescent_raid_chimaron")
end

function mod:SystemsFailureApplied(args)
	systemsFailureCount = systemsFailureCount + 1
	if self:Normal() then
		self:StopBar(82881) -- Break
	end
	local msg = CL.count:format(args.spellName, systemsFailureCount)
	self:Bar(args.spellId, 25, msg)
	self:Message(args.spellId, "red", msg)
	self:PlaySound(args.spellId, "warning")
end

function mod:SystemsFailureRemoved()
	massacreCount = 0
end

function mod:BreakApplied(args)
	self:StackMessage(args.spellId, "purple", args.destName, args.amount, 3)
	self:CDBar(args.spellId, 14.2)
end

function mod:BreakRefresh(args) -- Max 4 stacks, then refreshes
	self:CDBar(args.spellId, 14.2)
end

function mod:DoubleAttackApplied(args)
	self:Message(args.spellId, "purple")
	if self:Tank() then
		self:PlaySound(args.spellId, "alert")
	end
end

function mod:DoubleAttackRemoved(args)
	self:Message(args.spellId, "green", CL.over:format(args.spellName))
end

function mod:MassacreStart(args)
	self:Message(args.spellId, "yellow", CL.count:format(args.spellName, massacreCount))
	self:CastBar(args.spellId, 4)
	self:CDBar(82881, 13.6) -- Break
	self:PlaySound(args.spellId, "info")
end

function mod:Massacre(args)
	massacreCount = massacreCount + 1
	self:Bar(args.spellId, 25, CL.count:format(args.spellName, massacreCount))
	self:Bar(82935, 15) -- Caustic Slime
end

function mod:Mortality(args)
	self:StopBar(CL.count:format(self:SpellName(88853), systemsFailureCount)) -- Systems Failure
	self:StopBar(CL.count:format(self:SpellName(82848), massacreCount)) -- Massacre
	self:StopBar(82935) -- Caustic Slime
	self:Message(args.spellId, "orange", CL.percent:format(20, args.spellName))
	self:PlaySound(args.spellId, "long")
end

function mod:UNIT_HEALTH(event, unit)
	local hp = self:GetHealth(unit)
	if hp < 23 then
		self:UnregisterUnitEvent(event, unit)
		if hp > 20 then
			self:Message(82890, "cyan", CL.soon:format(self:SpellName(82890)), false)
		end
	end
end
