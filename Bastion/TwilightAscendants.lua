--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Ascendant Council", 671, 158)
if not mod then return end
mod:RegisterEnableMob(43686, 43687, 43688, 43689, 43735) --Ignacious, Feludius, Arion, Terrastra, Elementium Monstrosity
mod:SetEncounterID(1028)
mod:SetRespawnTime(30)

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

local L = mod:GetLocale()
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

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		-- Ignacious
		82631, 82660,
		-- Feludius
		82746, 82665, 82762,
		-- Arion
		83067, {83099, "SAY"},
		-- Terrastra
		83565, 83718,
		-- Monstrosity
		{84948, "ICON"},
		-- Heroic
		{92067, "SAY", "ICON"},
		{92075, "SAY", "ICON"},
		{92307, "ICON", "ME_ONLY_EMPHASIZE"},
		-- General
		"switch"
	}, {
		[82631] = -3118, -- Ignacious
		[82746] = -3110, -- Feludius
		[83067] = -3123, -- Arion
		[83565] = -3125, -- Terrastra
		[84948] = -3145, -- Elementium Monstrosity
		[92067] = "heroic",
		switch = "general",
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

	self:BossYell("Switch", L["switch_trigger"])

	self:Log("SPELL_CAST_START", "Quake", 83565)
	self:Log("SPELL_CAST_START", "Thundershock", 83067)

	self:Emote("QuakeTrigger", L["quake_trigger"])
	self:Emote("ThundershockTrigger", L["thundershock_trigger"])

	self:BossYell("LastPhase", L["last_phase_trigger"])
end

function mod:OnEngage()
	self:Bar(82631, 30, L["shield_bar"])
	self:Bar(82746, 30) -- Glaciate

	phase = 1
	crushMarked = false
	self:RegisterUnitEvent("UNIT_HEALTH", nil, "boss1", "boss2", "boss3", "boss4")
end

--------------------------------------------------------------------------------
-- Event Handlers
--

do
	local scheduled = nil
	local function lrWarn(spellId)
		mod:TargetMessageOld(spellId, lrTargets, "red", "alert")
		scheduled = nil
	end
	function mod:LightningRodApplied(args)
		lrTargets[#lrTargets + 1] = args.destName
		if not scheduled then
			scheduled = self:ScheduleTimer(lrWarn, 0.3, args.spellId)
		end
		if self:Me(args.destGUID) then
			self:Say(args.spellId)
			--self:Flash(args.spellId)
		end
	end
end

do
	local scheduled = nil
	local function gcWarn(spellId)
		mod:TargetMessageOld(spellId, gcTargets, "red", "alert")
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
			scheduled = self:ScheduleTimer(gcWarn, 0.2, args.spellId)
		end
		self:Bar(args.spellId, 25)
	end
end

function mod:LightningRodRemoved(args)
	--if self:Me(args.destGUID) then
	--	self:CloseProximity()
	--end
end

function mod:GravityCore(args)
	if self:Me(args.destGUID) then
		self:Say(args.spellId, L["gravity_core_say"])
		--self:Flash(args.spellId)
	end
	self:TargetMessageOld(args.spellId, args.destName, "yellow", "alarm")
	self:SecondaryIcon(args.spellId, args.destName)
end

function mod:GravityCoreRemoved(args)
	self:SecondaryIcon(args.spellId)
end

function mod:StaticOverload(args)
	if self:Me(args.destGUID) then
		self:Say(args.spellId, L["static_overload_say"])
		--self:Flash(args.spellId)
	end
	self:TargetMessageOld(args.spellId, args.destName, "yellow", "alarm")
	self:PrimaryIcon(args.spellId, args.destName)
end

function mod:StaticOverloadRemoved(args)
	self:PrimaryIcon(args.spellId)
end

function mod:FrostBeacon(args)
	self:TargetMessage(args.spellId, "yellow", args.destName)
	self:PrimaryIcon(args.spellId, args.destName)
	if self:Me(args.destGUID) then
		self:PlaySound(args.spellId, "warning", nil, args.destName)
	else
		self:PlaySound(args.spellId, "alarm", nil, args.destName)
	end
end

function mod:UNIT_HEALTH(event, unit)
	local hp = self:GetHealth(unit)
	if phase == 1 then
		if hp < 30 then
			self:MessageOld("switch", "yellow", "info", L["health_report"]:format(self:UnitName(unit), hp), 26662)
			phase = 2
		end
	elseif phase == 2 then
		if hp > 1 and hp < 30 then
			local arion = self:SpellName(-3123)
			local terrastra = self:SpellName(-3125)
			local name = self:UnitName(unit)
			if name == arion or name == terrastra then
				phase = 3
				self:MessageOld("switch", "yellow", "info", L["health_report"]:format(name, hp), 26662)
				self:UnregisterUnitEvent(event, "boss1", "boss2", "boss3", "boss4")
			end
		end
	end
end

function mod:FlameShield(args)
	self:Bar(args.spellId, 62, L["shield_bar"])
	self:MessageOld(args.spellId, "red", "alert", L["shield_up_message"])
end

function mod:FlameShieldRemoved(args)
	self:MessageOld(args.spellId, "red", "alert", L["shield_down_message"])
end

function mod:HardenSkinStart(args)
	self:Bar(args.spellId, 44)
	self:MessageOld(args.spellId, "orange", "info")
end

function mod:Glaciate(args)
	self:Bar(args.spellId, 33)
	self:MessageOld(args.spellId, "yellow", "alert")
end

function mod:Waterlogged(args)
	if self:Me(args.destGUID) then
		self:MessageOld(args.spellId, "blue", "long")
	end
end

function mod:HeartofIce(args)
	self:TargetMessageOld(args.spellId, args.destName, "red")
	--if self:Me(args.destGUID) then
	--	self:Flash(args.spellId)
	--end
end

function mod:BurningBlood(args)
	self:TargetMessageOld(args.spellId, args.destName, "red")
	--if self:Me(args.destGUID) then
	--	self:Flash(args.spellId)
	--end
end

function mod:Switch()
	self:StopBar(L["shield_bar"])
	self:StopBar(82746) -- Glaciate
	self:Bar(83565, 33) -- Quake
	self:Bar(83067, 70) -- Thundershock
	self:Bar(83718, 25.5) -- Harden Skin
	self:CancelAllTimers()
	-- XXX this needs to be delayed
end

do
	local hardenTimer = nil
	local function quakeIncoming()
		if mod:UnitDebuff("player", mod:SpellName(83500), 83500) then -- Swirling Winds
			mod:CancelTimer(hardenTimer)
			return
		end
		mod:MessageOld(83565, "blue", "info", L["thundershock_quake_spam"]:format(quake, timeLeft), 83500)
		timeLeft = timeLeft - 2
	end

	function mod:QuakeTrigger()
		self:Bar(83565, 10)
		self:MessageOld(83565, "red", "info", L["thundershock_quake_soon"]:format(quake))
		timeLeft = 8
		hardenTimer = self:ScheduleRepeatingTimer(quakeIncoming, 2)
	end

	function mod:Quake(args)
		self:Bar(args.spellId, 68)
		self:MessageOld(args.spellId, "red", "alarm")
		self:CancelTimer(hardenTimer) -- Should really wait 3 more sec.
	end
end

do
	local thunderTimer = nil
	local function thunderShockIncoming()
		if mod:UnitDebuff("player", mod:SpellName(83581), 83581) then -- Grounded
			mod:CancelTimer(thunderTimer)
			return
		end
		mod:MessageOld(83067, "blue", "info", L["thundershock_quake_spam"]:format(thundershock, timeLeft), 83581)
		timeLeft = timeLeft - 2
	end

	function mod:ThundershockTrigger()
		self:MessageOld(83067, "red", "info", L["thundershock_quake_soon"]:format(thundershock))
		self:Bar(83067, 10)
		timeLeft = 8
		thunderTimer = self:ScheduleRepeatingTimer(thunderShockIncoming, 2)
	end

	function mod:Thundershock(args)
		self:Bar(args.spellId, 65)
		self:MessageOld(args.spellId, "red", "alarm")
		self:CancelTimer(thunderTimer) -- Should really wait 3 more sec but meh.
	end
end

function mod:LastPhase()
	self:StopBar(83565) -- Quake
	self:StopBar(83067) -- Thundershock
	self:StopBar(83718) -- Harden Skin
	self:CancelAllTimers()
	self:Bar(84948, 43) -- Gravity Crush
	self:UnregisterUnitEvent("UNIT_HEALTH", "boss1", "boss2", "boss3", "boss4")
end

