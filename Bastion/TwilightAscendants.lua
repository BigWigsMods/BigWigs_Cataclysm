--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Ascendant Council", 758, 158)
if not mod then return end
mod:RegisterEnableMob(43686, 43687, 43688, 43689, 43735) --Ignacious, Feludius, Arion, Terrastra, Elementium Monstrosity

--------------------------------------------------------------------------------
-- Locals
--

local lrTargets, gcTargets = mod:NewTargetList(), mod:NewTargetList()
local quake, thundershock = mod:SpellName(83565), mod:SpellName(83067)
local crushMarked = false
local timeLeft = 8
local phase = 1

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale("enUS", true)
if L then
	L.static_overload_say = "Overload"
	L.gravity_core_say = "Gravity"
	L.health_report = "%s at %d%%, phase change soon!"
	L.switch = "Switch"
	L.switch_desc = "Warning for boss switches."

	L.shield_up_message = "Shield is UP!"
	L.shield_down_message = "Shield is DOWN!"
	L.shield_bar = "Shield"

	L.switch_trigger = "We will handle them!"

	L.thundershock_quake_soon = "%s in 10sec!"

	L.quake_trigger = "The ground beneath you rumbles ominously...."
	L.thundershock_trigger = "The surrounding air crackles with energy...."

	L.thundershock_quake_spam = "%s in %d"

	L.last_phase_trigger = "An impressive display..."
end
L = mod:GetLocale()

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		-- Ignacious
		82631, {82660, "FLASHSHAKE"},
		-- Feludius
		82746, {82665, "FLASHSHAKE"}, 82762,
		-- Arion
		83067, {83099, "SAY", "FLASHSHAKE"},
		-- Terrastra
		83565, 83718,
		-- Monstrosity
		{84948, "ICON"},
		-- Heroic
		{92067, "FLASHSHAKE", "SAY", "ICON"},
		{92075, "FLASHSHAKE", "SAY", "ICON"},
		{92307, "FLASHSHAKE", "ICON", "WHISPER"},
		-- General
		"proximity", "switch", "bosskill"
	}, {
		[82631] = "ej:3118", -- Ignacious
		[82746] = "ej:3110", -- Feludius
		[83067] = "ej:3123", -- Arion
		[83565] = "ej:3125", -- Terrastra
		[84948] = "ej:3145", -- Elementium Monstrosity
		[92067] = "heroic",
		proximity = "general",
	}
end

function mod:OnBossEnable()
	--heroic
	self:Log("SPELL_AURA_APPLIED", "StaticOverload", 92067)
	self:Log("SPELL_AURA_REMOVED", "StaticOverloadRemoved", 92067)
	self:Log("SPELL_AURA_APPLIED", "GravityCore", 92075)
	self:Log("SPELL_AURA_REMOVED", "GravityCoreRemoved", 92075)
	self:Log("SPELL_AURA_APPLIED", "FrostBeacon", 92307)

	--normal
	self:Log("SPELL_AURA_APPLIED", "LightningRodApplied", 83099)
	self:Log("SPELL_AURA_REMOVED", "LightningRodRemoved", 83099)

	--Shield
	self:Log("SPELL_CAST_START", "FlameShield", 82631)
	self:Log("SPELL_AURA_REMOVED", "FlameShieldRemoved", 82631)

	self:Log("SPELL_CAST_START", "HardenSkinStart", 83718)
	self:Log("SPELL_CAST_START", "Glaciate", 82746)
	self:Log("SPELL_AURA_APPLIED", "Waterlogged", 82762)
	self:Log("SPELL_CAST_SUCCESS", "HeartofIce", 82665)
	self:Log("SPELL_CAST_SUCCESS", "BurningBlood", 82660)
	self:Log("SPELL_AURA_APPLIED", "GravityCrush", 84948)

	self:Yell("Switch", L["switch_trigger"])

	self:Log("SPELL_CAST_START", "Quake", 83565)
	self:Log("SPELL_CAST_START", "Thundershock", 83067)

	self:Emote("QuakeTrigger", L["quake_trigger"])
	self:Emote("ThundershockTrigger", L["thundershock_trigger"])

	self:RegisterEvent("INSTANCE_ENCOUNTER_ENGAGE_UNIT", "CheckBossStatus")

	self:Yell("LastPhase", L["last_phase_trigger"])

	self:Death("Win", 43735) -- Elementium Monstrosity
end

function mod:OnEngage()
	if self:Heroic() then
		self:OpenProximity("proximity", 10)
	end

	self:Bar(82631, L["shield_bar"], 30, 82631)
	self:Bar(82746, 82746, 30, 82746) -- Glaciate

	phase = 1
	crushMarked = false
	self:RegisterUnitEvent("UNIT_HEALTH_FREQUENT", nil, "boss1", "boss2", "boss3", "boss4")
end

--------------------------------------------------------------------------------
-- Event Handlers
--

do
	local scheduled = nil
	local function lrWarn(spellName, spellId)
		mod:TargetMessage(spellId, spellName, lrTargets, "Important", spellId, "Alert")
		scheduled = nil
	end
	function mod:LightningRodApplied(args)
		lrTargets[#lrTargets + 1] = args.destName
		if not scheduled then
			scheduled = true
			self:ScheduleTimer(lrWarn, 0.3, args.spellName, args.spellId)
		end
		if UnitIsUnit(args.destName, "player") then
			self:Say(args.spellId)
			self:FlashShake(args.spellId)
			self:OpenProximity("proximity", 10)
		end
	end
end

do
	local scheduled = nil
	local function gcWarn(spellName, spellId)
		mod:TargetMessage(spellId, spellName, gcTargets, "Important", spellId, "Alert")
		scheduled = nil
	end
	local function marked()
		crushMarked = false
	end
	function mod:GravityCrush(args)
		gcTargets[#gcTargets + 1] = args.destName
		if not crushMarked then
			self:PrimaryIcon(args.spellId, args.destName)
			crushMarked = true
			self:ScheduleTimer(marked, 5)
		end
		if not scheduled then
			scheduled = true
			self:ScheduleTimer(gcWarn, 0.2, args.spellName, args.spellId)
		end
		self:Bar(args.spellId, args.spellName, 25, args.spellId)
	end
end

function mod:LightningRodRemoved(args)
	if UnitIsUnit(args.destName, "player") then
		self:CloseProximity()
	end
end

function mod:GravityCore(args)
	if UnitIsUnit(args.destName, "player") then
		self:Say(args.spellId, L["gravity_core_say"])
		self:FlashShake(args.spellId)
	end
	self:TargetMessage(args.spellId, args.spellName, args.destName, "Attention", args.spellId, "Alarm")
	self:SecondaryIcon(args.spellId, args.destName)
end

function mod:GravityCoreRemoved(args)
	self:SecondaryIcon(args.spellId)
end

function mod:StaticOverload(args)
	if UnitIsUnit(args.destName, "player") then
		self:Say(args.spellId, L["static_overload_say"])
		self:FlashShake(args.spellId)
	end
	self:TargetMessage(args.spellId, args.spellName, args.destName, "Attention", args.spellId, "Alarm")
	self:PrimaryIcon(args.spellId, args.destName)
end

function mod:StaticOverloadRemoved(args)
	self:PrimaryIcon(args.spellId)
end

function mod:FrostBeacon(args)
	if UnitIsUnit(args.destName, "player") then
		self:FlashShake(args.spellId)
	end
	self:TargetMessage(args.spellId, args.spellName, args.destName, "Attention", args.spellId, "Alarm")
	self:Whisper(args.spellId, args.destName, args.spellName)
	self:PrimaryIcon(args.spellId, args.destName)
end

do
	local terrastra = EJ_GetSectionInfo(3125)
	local arion = EJ_GetSectionInfo(3123)
	function mod:UNIT_HEALTH_FREQUENT(unit)
		local hp = UnitHealth(unit) / UnitHealthMax(unit) * 100
		if phase == 1 then
			if hp < 30 then
				self:Message("switch", L["health_report"]:format((UnitName(unit)), hp), "Attention", 26662, "Info")
				phase = 2
			end
		elseif phase == 2 then
			if hp > 1 and hp < 30 and (UnitName(unit) == arion or UnitName(unit) == terrastra) then
				phase = 3
				self:Message("switch", L["health_report"]:format((UnitName(unit)), hp), "Attention", 26662, "Info")
				self:UnregisterUnitEvent("UNIT_HEALTH_FREQUENT", "boss1", "boss2", "boss3", "boss4")
			end
		end
	end
end

function mod:FlameShield(args)
	self:Bar(args.spellId, L["shield_bar"], 62, args.spellId)
	self:Message(args.spellId, L["shield_up_message"], "Important", args.spellId, "Alert")
end

function mod:FlameShieldRemoved(args)
	self:Message(args.spellId, L["shield_down_message"], "Important", args.spellId, "Alert")
end

function mod:HardenSkinStart(args)
	self:Bar(args.spellId, args.spellName, 44, args.spellId)
	self:Message(args.spellId, args.spellName, "Urgent", args.spellId, "Info")
end

function mod:Glaciate(args)
	self:Bar(args.spellId, args.spellName, 33, args.spellId)
	self:Message(args.spellId, args.spellName, "Attention", args.spellId, "Alert")
end

function mod:Waterlogged(args)
	if UnitIsUnit(args.destName, "player") then
		self:LocalMessage(args.spellId, args.spellName, "Personal", args.spellId, "Long")
	end
end

function mod:HeartofIce(args)
	self:TargetMessage(args.spellId, args.spellName, args.destName, "Important", args.spellId)
	if UnitIsUnit(args.destName, "player") then
		self:FlashShake(args.spellId)
	end
end

function mod:BurningBlood(args)
	self:TargetMessage(args.spellId, args.spellName, args.destName, "Important", args.spellId)
	if UnitIsUnit(args.destName, "player") then
		self:FlashShake(args.spellId)
	end
end

function mod:Switch()
	self:StopBar(L["shield_bar"])
	self:StopBar(82746) -- Glaciate
	self:Bar(83565, quake, 33, 83565)
	self:Bar(83067, thundershock, 70, 83067)
	self:Bar(83718, 83718, 25.5, 83718) -- Harden Skin
	self:CancelAllTimers()
	-- XXX this needs to be delayed
end

do
	local hardenTimer = nil
	local flying = GetSpellInfo(83500)
	local function quakeIncoming()
		local name, _, icon = UnitDebuff("player", flying)
		if name then
			mod:CancelTimer(hardenTimer)
			return
		end
		mod:LocalMessage(83565, L["thundershock_quake_spam"]:format(quake, timeLeft), "Personal", icon, "Info")
		timeLeft = timeLeft - 2
	end

	function mod:QuakeTrigger()
		self:Bar(83565, quake, 10, 83565)
		self:Message(83565, L["thundershock_quake_soon"]:format(quake), "Important", 83565, "Info")
		timeLeft = 8
		hardenTimer = self:ScheduleRepeatingTimer(quakeIncoming, 2)
	end

	function mod:Quake(args)
		self:Bar(args.spellId, args.spellName, 68, args.spellId)
		self:Message(args.spellId, args.spellName, "Important", args.spellId, "Alarm")
		self:CancelTimer(hardenTimer) -- Should really wait 3 more sec.
	end
end

do
	local thunderTimer = nil
	local grounded = GetSpellInfo(83581)
	local function thunderShockIncoming()
		local name, _, icon = UnitDebuff("player", grounded)
		if name then
			mod:CancelTimer(thunderTimer)
			return
		end
		mod:LocalMessage(83067, L["thundershock_quake_spam"]:format(thundershock, timeLeft), "Personal", icon, "Info")
		timeLeft = timeLeft - 2
	end

	function mod:ThundershockTrigger()
		self:Message(83067, L["thundershock_quake_soon"]:format(thundershock), "Important", 83067, "Info")
		self:Bar(83067, thundershock, 10, 83067)
		timeLeft = 8
		thunderTimer = self:ScheduleRepeatingTimer(thunderShockIncoming, 2)
	end

	function mod:Thundershock(args)
		self:Bar(args.spellId, args.spellName, 65, args.spellId)
		self:Message(args.spellId, args.spellName, "Important", args.spellId, "Alarm")
		self:CancelTimer(thunderTimer) -- Should really wait 3 more sec but meh.
	end
end

function mod:LastPhase()
	self:StopBar(quake)
	self:StopBar(thundershock)
	self:StopBar(83718) -- Harden Skin
	self:CancelAllTimers()
	self:Bar(84948, 84948, 43, 84948) -- Gravity Crush
	self:OpenProximity("proximity", 9)
	self:UnregisterUnitEvent("UNIT_HEALTH_FREQUENT", "boss1", "boss2", "boss3", "boss4")
end

