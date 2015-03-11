--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Magmaw", 754, 170)
if not mod then return end
mod:RegisterEnableMob(41570)

local phase = 1
local isHeadPhase = nil

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale("enUS", true)
if L then
	-- heroic
	L.blazing = "Skeleton Adds"
	L.blazing_desc = "Summons Blazing Bone Construct."
	L.blazing_message = "Add incoming!"
	L.blazing_bar = "Skeleton"

	L.armageddon = "Armageddon"
	L.armageddon_desc = "Warn if Armageddon is cast during the head phase."

	L.phase2 = "Phase 2"
	L.phase2_desc = "Warn for Phase 2 transition and display range check."
	L.phase2_message = "Phase 2!"
	L.phase2_yell = "You may actually defeat my lava worm"

	-- normal
	L.slump = "Slump (Rodeo)"
	L.slump_desc = "Warn for when Magmaw slumps forward and exposes himself, allowing the riding rodeo to start."
	L.slump_bar = "Rodeo"
	L.slump_message = "Yeehaw, ride on!"
	L.slump_trigger = "%s slumps forward, exposing his pincers!"

	L.infection_message = "You are infected!"

	L.expose_trigger = "head"
	L.expose_message = "Head exposed!"

	L.spew_warning = "Lava Spew Soon!"
end
L = mod:GetLocale()

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		"slump", 79011, 89773, 78006, {78941, "FLASH", "PROXIMITY"}, 77690,
		"blazing", "armageddon", {"phase2", "PROXIMITY"},
		"berserk"
	}, {
		slump = "normal",
		blazing = "heroic",
		berserk = "general"
	}
end

function mod:OnBossEnable()
	--heroic
	self:Log("SPELL_SUMMON", "BlazingInferno", 92154)
	self:Yell("Phase2", L["phase2_yell"])

	--normal
	self:Log("SPELL_AURA_APPLIED", "Infection", 78097, 78941)
	self:Log("SPELL_AURA_REMOVED", "InfectionRemoved", 78097, 78941)
	self:Log("SPELL_AURA_APPLIED", "PillarOfFlame", 78006)
	self:Log("SPELL_AURA_APPLIED", "Mangle", 89773)
	self:Log("SPELL_AURA_REMOVED", "MangleRemoved", 89773)
	self:Log("SPELL_CAST_SUCCESS", "LavaSpew", 77690)
	self:Log("SPELL_AURA_APPLIED", "Armageddon", 92177)
	self:Emote("Slump", L["slump_trigger"])
	self:Emote("Vulnerability", L["expose_trigger"])

	self:RegisterEvent("INSTANCE_ENCOUNTER_ENGAGE_UNIT", "CheckBossStatus")

	self:Death("Win", 41570)
end

function mod:OnEngage()
	if self:Heroic() then
		self:Bar("blazing", 30, L["blazing_bar"], "SPELL_SHADOW_RAISEDEAD")
	end
	self:Berserk(600)
	self:Bar("slump", 100, L["slump_bar"], 36702)
	self:Bar(78006, 30) -- Pillar of Flame
	self:CDBar(77690, 24) -- Lava Spew
	self:CDBar(89773, 90) -- Mangle
	self:DelayedMessage(77690, 24, "Attention", L["spew_warning"])
	phase = 1
	isHeadPhase = nil
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:Armageddon(args)
	if not isHeadPhase then return end
	self:Message(79011, "Important", "Alarm", args.spellId)
	self:Bar(79011, 8, args.spellId)
end

do
	local function rebootTimers()
		isHeadPhase = nil
		mod:CDBar(78006, 9.5) -- Pillar of Flame
		mod:CDBar(77690, 4.5) -- Lava Spew
	end
	function mod:Vulnerability()
		isHeadPhase = true
		self:Message(79011, "Positive", nil, L["expose_message"])
		self:Bar(79011, 30, L["expose_message"])
		self:StopBar(78006) -- Pillar of Flame
		self:StopBar(77690) -- Lava Spew
		self:CancelDelayedMessage(L["spew_warning"])
		self:ScheduleTimer(rebootTimers, 30)
	end
end

do
	local prev = 0
	function mod:LavaSpew(args)
		local time = GetTime()
		if time - prev > 10 then
			prev = time
			self:Message(args.spellId, "Important")
			self:CDBar(args.spellId, 26)
			self:DelayedMessage(args.spellId, 24, "Attention", L["spew_warning"])
		end
	end
end

function mod:BlazingInferno()
	self:Message("blazing", "Urgent", "Info", L["blazing_message"], "SPELL_SHADOW_RAISEDEAD")
	self:Bar("blazing", 35, L["blazing_bar"], "SPELL_SHADOW_RAISEDEAD")
end

function mod:Phase2()
	phase = 2
	self:Message("phase2", "Attention", nil, L["phase2_message"], "ability_warlock_shadowflame") -- Shadow Breath (Heroic)
	self:StopBar(L["blazing_bar"])
	self:OpenProximity("phase2", 8)
end

function mod:PillarOfFlame(args)
	self:Message(args.spellId, "Urgent", "Alert")
	self:CDBar(args.spellId, 32)
end

function mod:Infection(args)
	if self:Me(args.destGUID) then
		self:Message(78941, "Personal", "Alarm", L["infection_message"], args.spellId)
		self:Flash(78941)
		self:OpenProximity(78941, 8)
	end
end

function mod:InfectionRemoved(args)
	if phase == 1 and self:Me(args.destGUID) then
		self:CloseProximity(78941)
	end
end

function mod:Slump()
	self:StopBar(78006) -- Pillar of Flame
	self:Bar("slump", 95, L["slump_bar"], 36702)
	self:Message("slump", "Positive", "Info", L["slump_message"], 36702)
end

function mod:Mangle(args)
	self:TargetMessage(args.spellId, args.destName, "Personal", "Info")
	self:TargetBar(args.spellId, 30, args.destName)
	self:CDBar(args.spellId, 95)
end

function mod:MangleRemoved(args)
	self:StopBar(args.spellName, args.destName)
end

