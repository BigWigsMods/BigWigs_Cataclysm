--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Chimaeron", 669, 172)
if not mod then return end
mod:RegisterEnableMob(43296)
mod:SetEncounterID(1023)
mod:SetRespawnTime(30)

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:GetLocale()
if L then
	L.bileotron_engage = "The Bile-O-Tron springs to life and begins to emit a foul smelling substance."

	L.next_system_failure = "Next System Failure"

	L.phase2_message = "Mortality phase soon!"
end

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		"warmup", 82848, 88826, 82881, 88853, 82935, 82890,
		"berserk"
	}, {
		warmup = "normal",
		berserk = "general"
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

	self:RegisterEvent("CHAT_MSG_MONSTER_EMOTE", "Warmup")
end

function mod:Warmup(_, msg)
	if msg == L["bileotron_engage"] then
		self:Bar("warmup", 30, CL.active, "achievement_dungeon_blackwingdescent_raid_chimaron")
	end
end

function mod:OnEngage()
	self:StopBar(CL.active)
	self:Berserk(450)
	if not self:Heroic() then
		self:CDBar(88853, 90, L["next_system_failure"]) --happens randomly at either 60 or 90 on heroic
	end
	self:Bar(82848, 30) --Massacre
	self:RegisterUnitEvent("UNIT_HEALTH", "Phase2Warn", "boss1")
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:SystemFailureStart(args)
	self:StopBar(L["next_system_failure"])
	self:Bar(args.spellId, 30)
	self:MessageOld(args.spellId, "red", "alarm")
	--self:Flash(args.spellId)
end

function mod:SystemFailureEnd(args)
	if self.isEngaged then -- To prevent firing after a wipe
		if not self:Heroic() then
			self:CDBar(args.spellId, 65, L["next_system_failure"])
		end
		--self:Flash(args.spellId)
	end
end

function mod:Massacre(args)
	self:MessageOld(args.spellId, "yellow")
	self:Bar(args.spellId, 30)
	self:Bar(82935, 19) --Caustic Slime
end

function mod:Mortality(args)
	self:MessageOld(args.spellId, "red", "long")
	self:StopBar(L["next_system_failure"])
end

function mod:Break(args)
	self:StackMessageOld(args.spellId, args.destName, args.amount, "yellow")
end

function mod:DoubleAttack(args)
	self:MessageOld(args.spellId, "orange")
end

function mod:Phase2Warn(event, unit)
	local hp = self:GetHealth(unit)
	if hp < 23 then
		self:MessageOld(82890, "green", "info", L["phase2_message"])
		self:UnregisterUnitEvent(event, unit)
	end
end

