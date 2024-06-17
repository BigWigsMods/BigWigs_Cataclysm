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
		"warmup",
		82848, -- Massacre
		88826, -- Double Attack
		82881, -- Break
		88853, -- Systems Failure
		82935, -- Caustic Slime
		82890, -- Mortality
		"berserk"
	}, {
		warmup = "normal",
		berserk = "general"
	}
end

function mod:OnBossEnable()
	self:RegisterEvent("CHAT_MSG_MONSTER_EMOTE")

	self:Log("SPELL_AURA_APPLIED", "SystemFailureStart", 88853)
	self:Log("SPELL_AURA_REMOVED", "SystemFailureEnd", 88853)
	self:Log("SPELL_CAST_SUCCESS", "Mortality", 82890)
	self:Log("SPELL_AURA_APPLIED", "Break", 82881)
	self:Log("SPELL_AURA_APPLIED_DOSE", "Break", 82881)
	self:Log("SPELL_AURA_APPLIED", "DoubleAttack", 88826)
	self:Log("SPELL_CAST_START", "Massacre", 82848)
end

function mod:OnEngage()
	self:StopBar(CL.active)
	self:Berserk(450)
	if not self:Heroic() then
		self:CDBar(88853, 90, L["next_system_failure"]) -- Systems Failure, happens randomly at either 60 or 90 on heroic
	end
	self:Bar(82848, 30) --Massacre
	self:RegisterUnitEvent("UNIT_HEALTH", nil, "boss1")
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:CHAT_MSG_MONSTER_EMOTE(_, msg)
	if msg == L["bileotron_engage"] then
		self:Bar("warmup", 30, CL.active, "achievement_dungeon_blackwingdescent_raid_chimaron")
	end
end

function mod:SystemFailureStart(args)
	self:StopBar(L["next_system_failure"])
	self:Bar(args.spellId, 30)
	self:Message(args.spellId, "red")
	self:PlaySound(args.spellId, "alarm")
end

function mod:SystemFailureEnd(args)
	if self:IsEngaged() then -- To prevent firing after a wipe
		if not self:Heroic() then
			self:CDBar(args.spellId, 65, L["next_system_failure"])
		end
	end
end

function mod:Massacre(args)
	self:Message(args.spellId, "yellow")
	self:Bar(args.spellId, 30)
	self:Bar(82935, 19) --Caustic Slime
end

function mod:Mortality(args)
	self:Message(args.spellId, "red")
	self:StopBar(L["next_system_failure"])
	self:PlaySound(args.spellId, "long")
end

function mod:Break(args)
	self:StackMessage(args.spellId, "yellow", args.destName, args.amount, 3)
end

function mod:DoubleAttack(args)
	self:Message(args.spellId, "orange")
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
