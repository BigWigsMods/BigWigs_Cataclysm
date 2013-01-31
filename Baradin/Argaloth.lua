--------------------------------------------------------------------------------
-- Module Declaration
--

local mod = BigWigs:NewBoss("Argaloth", 752, 139)
if not mod then return end
mod:RegisterEnableMob(47120)

--------------------------------------------------------------------------------
-- Locals
--

local fireStorm, consumingTargets = 100, mod:NewTargetList()

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale("enUS", true)
if L then
	L.darkness_message = "Darkness"
	L.firestorm_message = "Firestorm soon!"
end
L = mod:GetLocale()

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {88942, 88954, {88972, "FLASHSHAKE"}, "berserk", "bosskill"}
end

function mod:OnBossEnable()
	self:Log("SPELL_CAST_START", "MeteorSlash", 88942)
	self:Log("SPELL_AURA_APPLIED", "ConsumingDarkness", 88954)
	self:Log("SPELL_CAST_START", "FelFirestorm", 88972)

	self:RegisterEvent("INSTANCE_ENCOUNTER_ENGAGE_UNIT", "CheckBossStatus")

	self:Death("Win", 47120)
end

function mod:OnEngage()
	self:Berserk(300)
	self:Bar(88942, "~"..self:SpellName(88942), 10, 88942) -- Meteor Slash
	fireStorm = 100
	self:RegisterUnitEvent("UNIT_HEALTH_FREQUENT", "FirestormWarn", "boss1")
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:MeteorSlash(args)
	self:Message(args.spellId, args.spellName, "Important", args.spellId)
	self:Bar(args.spellId, "~"..args.spellName, 17, args.spellId)
end

do
	local scheduled = nil
	local function consumingWarn(spellId)
		mod:TargetMessage(spellId, L["darkness_message"], consumingTargets, "Personal", spellId)
		scheduled = nil
	end
	function mod:ConsumingDarkness(args)
		consumingTargets[#consumingTargets + 1] = args.destName
		if not scheduled then
			scheduled = self:ScheduleTimer(consumingWarn, 0.5, args.spellId)
		end
	end
end

function mod:FelFirestorm(args)
	self:StopBar(L["meteor_bar"])
	self:Message(args.spellId, fireStorm.."% - "..args.spellName, "Urgent", args.spellId, "Alert")
	self:FlashShake(args.spellId)
	self:Bar(88942, "~"..self:SpellName(88942), 32, 88942) -- Meteor Slash
end

function mod:FirestormWarn(unit)
	local hp = UnitHealth(unit) / UnitHealthMax(unit) * 100
	if hp < 69 and fireStorm > 70 then
		self:Message(88972, L["firestorm_message"], "Attention")
		fireStorm = 66
	elseif hp < 36 and fireStorm > 50 then
		self:Message(88972, L["firestorm_message"], "Attention")
		fireStorm = 33
		self:UnregisterUnitEvent("UNIT_HEALTH_FREQUENT", unit)
	end
end

