--------------------------------------------------------------------------------
-- Module Declaration
--

local mod = BigWigs:NewBoss("Chimaeron", 754, 172)
if not mod then return end
mod:RegisterEnableMob(43296)

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale("enUS", true)
if L then
	L.bileotron_engage = "The Bile-O-Tron springs to life and begins to emit a foul smelling substance."

	L.next_system_failure = "Next System Failure"

	L.phase2_message = "Mortality phase soon!"

	L.warmup = "Warmup"
	L.warmup_desc = "Warmup timer"
end
L = mod:GetLocale()

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		"warmup", 82848, 88826, 82881, {88853, "FLASH"}, 82935, 82890,
		"proximity", "berserk"
	}, {
		warmup = "normal",
		proximity = "general"
	}
end

function mod:OnBossEnable()
	self:Log("SPELL_AURA_APPLIED", "SystemFailureStart", 88853)
	self:Log("SPELL_AURA_REMOVED", "SystemFailureEnd", 88853)
	self:Log("SPELL_CAST_SUCCESS", "Mortality", 82890)
	self:Log("SPELL_AURA_APPLIED", "Break", 82881)
	self:Log("SPELL_AURA_APPLIED_DOSE", "Break", 82881)
	self:Log("SPELL_AURA_APPLIED", "DoubleAttack", 88826)
	self:Log("SPELL_CAST_START", "Massacre", 82848)

	self:RegisterEvent("INSTANCE_ENCOUNTER_ENGAGE_UNIT", "CheckBossStatus")
	self:RegisterEvent("CHAT_MSG_MONSTER_EMOTE", "Warmup")

	self:Death("Win", 43296)
end

function mod:Warmup(_, msg)
	if msg == L["bileotron_engage"] then
		self:Bar("warmup", 30, self.displayName, "achievement_dungeon_blackwingdescent_raid_chimaron")
		self:OpenProximity("proximity", 6)
	end
end

function mod:OnEngage()
	self:StopBar(self.displayName)
	self:Berserk(450)
	if not self:Heroic() then
		self:CDBar(88853, 90, L["next_system_failure"]) --happens randomly at either 60 or 90 on heroic
	end
	self:Bar(82848, 30) --Massacre
	self:RegisterUnitEvent("UNIT_HEALTH_FREQUENT", "Phase2Warn", "boss1")
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:SystemFailureStart(args)
	self:StopBar(L["next_system_failure"])
	self:Bar(args.spellId, 30)
	self:Message(args.spellId, "Important", "Alarm")
	self:Flash(args.spellId)
	self:CloseProximity()
end

function mod:SystemFailureEnd(args)
	if self.isEngaged then -- To prevent firing after a wipe
		if not self:Heroic() then
			self:CDBar(args.spellId, 65, L["next_system_failure"])
		end
		self:Flash(args.spellId)
		self:OpenProximity("proximity", 6)
	end
end

function mod:Massacre(args)
	self:Message(args.spellId, "Attention")
	self:Bar(args.spellId, 30)
	self:Bar(82935, 19) --Caustic Slime
end

function mod:Mortality(args)
	self:Message(args.spellId, "Important", "Long")
	self:CloseProximity()
	self:StopBar(L["next_system_failure"])
end

function mod:Break(args)
	self:StackMessage(args.spellId, args.destName, args.amount, "Attention")
end

function mod:DoubleAttack(args)
	self:Message(args.spellId, "Urgent")
end

function mod:Phase2Warn(unit)
	local hp = UnitHealth(unit) / UnitHealthMax(unit) * 100
	if hp < 23 then
		self:Message(82890, "Positive", "Info", L["phase2_message"])
		self:UnregisterUnitEvent("UNIT_HEALTH_FREQUENT", unit)
	end
end

