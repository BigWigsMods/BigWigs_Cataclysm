--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Valiona and Theralion", 758, 157)
if not mod then return end
mod:RegisterEnableMob(45992, 45993)

--------------------------------------------------------------------------------
-- Locals
--

local phaseCount = 0
local emTargets = mod:NewTargetList()
local markWarned = false

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale("enUS", true)
if L then
	L.phase_switch = "Phase Switch"
	L.phase_switch_desc = "Warning for phase switches."

	L.phase_bar = "%s landing"
	L.breath_message = "Deep Breaths incoming!"
	L.dazzling_message = "Swirly zones incoming!"

	L.blast_message = "Falling Blast" --Sounds better and makes more sense than Twilight Blast (the user instantly knows something is coming from the sky at them)
	L.engulfingmagic_say = "Engulf"

	L.valiona_trigger = "Theralion, I will engulf the hallway. Cover their escape!"
	L.win_trigger = "At least... Theralion dies with me..."

	L.twilight_shift = "Shift"
end
L = mod:GetLocale()

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		{86788, "ICON", "FLASH"}, {88518, "FLASH"}, 86059, 86840,
		{86622, "FLASH", "SAY"}, 86408, 86369, 93051,
		"proximity", "phase_switch", "berserk"
	}, {
		[86788] = -2985, -- Valiona
		[86622] = -2994, -- Theralion
		[93051] = "heroic",
		proximity = "general",
	}
end

function mod:OnBossEnable()
	-- Heroic
	self:Log("SPELL_AURA_APPLIED_DOSE", "TwilightShift", 93051)

	-- Phase Switch -- should be able to do this easier once we get Transcriptor logs
	self:Log("SPELL_CAST_START", "DazzlingDestruction", 86408)
	self:Yell("DeepBreath", L["valiona_trigger"])
	self:Emote("DeepBreathCast", self:SpellName(86059)) -- Deep Breath

	self:Log("SPELL_AURA_APPLIED", "BlackoutApplied", 86788)
	self:Log("SPELL_AURA_REMOVED", "BlackoutRemoved", 86788)
	self:Log("SPELL_CAST_START", "DevouringFlames", 86840)

	self:Log("SPELL_AURA_APPLIED", "EngulfingMagicApplied", 86622)
	self:Log("SPELL_AURA_REMOVED", "EngulfingMagicRemoved", 86622)

	self:Log("SPELL_CAST_START", "TwilightBlast", 86369)

	self:RegisterEvent("INSTANCE_ENCOUNTER_ENGAGE_UNIT", "CheckBossStatus")

	self:RegisterUnitEvent("UNIT_AURA", "MeteorCheck", "player")

	self:Death("Deaths", 45992, 45993)
end

function mod:OnEngage()
	markWarned = false
	self:CDBar(86840, 25)
	self:Bar(86788, 11) -- Blackout
	self:Bar("phase_switch", 103, L["phase_bar"]:format(self:SpellName(-2994)), 60639) -- Theralion
	self:OpenProximity("proximity", 8)
	self:Berserk(600)
	phaseCount = 0
end

--------------------------------------------------------------------------------
-- Event Handlers
--

do
	local function checkTarget(sGUID, spellId)
		local bossId = UnitGUID("boss2") == sGUID and "boss2target" or "boss1target"
		if not UnitName(bossId) then return end --The first is sometimes delayed longer than 0.3
		if UnitIsUnit(bossId, "player") then
			mod:Message(spellId, "Personal", "Long", CL["you"]:format(L["blast_message"]))
		end
	end
	function mod:TwilightBlast(args)
		self:ScheduleTimer(checkTarget, 0.3, args.sourceGUID, args.spellId)
	end
end

local function valionaHasLanded()
	mod:StopBar(86622) -- Engulfing Magic
	mod:Message("phase_switch", "Positive", nil, L["phase_bar"]:format(self:SpellName(-2985)), 60639) -- Valiona
	mod:CDBar(86840, 26) -- Devouring Flames
	mod:Bar(86788, 11) -- Blackout
	mod:OpenProximity("proximity", 8)
end

local function theralionHasLanded()
	mod:StopBar(86788) -- Blackout
	mod:StopBar(86840) -- Devouring Flames
	mod:Bar("phase_switch", 130, L["phase_bar"]:format(self:SpellName(-2985)), 60639) -- Valiona
	mod:CloseProximity()
end

function mod:TwilightShift(args)
	self:Bar(args.spellId, 20)
	if args.amount > 3 then
		self:StackMessage(args.spellId, args.destName, args.amount, "Important", nil, L["twilight_shift"])
	end
end

-- When Theralion is landing he casts DD 3 times, with a 5 second interval.
function mod:DazzlingDestruction(args)
	phaseCount = phaseCount + 1
	if phaseCount == 1 then
		self:Message(args.spellId, "Important", "Alarm", L["dazzling_message"])
	elseif phaseCount == 3 then
		self:ScheduleTimer(theralionHasLanded, 5)
		self:Message("phase_switch", "Positive", nil, L["phase_bar"]:format(self:SpellName(-2994)), 60639) -- Theralion
		phaseCount = 0
	end
end

-- She emotes 3 times, every time she does a breath
function mod:DeepBreathCast()
	phaseCount = phaseCount + 1
	self:Message(86059, "Important", "Alarm", L["breath_message"], "inv_misc_head_dragon_blue")
	if phaseCount == 3 then
		self:Bar("phase_switch", 105, L["phase_bar"]:format(self:SpellName(-2994)), 60639) -- Theralion
		phaseCount = 0
	end
end

-- Valiona does this when she fires the first deep breath and begins the landing phase
-- It only triggers once from her yell, not 3 times.
function mod:DeepBreath()
	self:Bar("phase_switch", 40, L["phase_bar"]:format(self:SpellName(-2985)), 60639) -- Valiona
	self:ScheduleTimer(valionaHasLanded, 40)
end

function mod:BlackoutApplied(args)
	if self:Me(args.destGUID) then
		self:Flash(args.spellId)
	end
	self:TargetMessage(args.spellId, args.destName, "Personal", "Alert", nil, nil, true)
	self:Bar(args.spellId, 45)
	self:PrimaryIcon(args.spellId, args.destName)
	self:CloseProximity()
end

function mod:BlackoutRemoved(args)
	self:OpenProximity("proximity", 8)
	self:PrimaryIcon(args.spellId)
	self:Bar(args.spellId, 40) -- make sure to remove bar when it's removed
end

local function markRemoved()
	markWarned = false
end

do
	local marked = mod:SpellName(88518)
	function mod:MeteorCheck(unit)
		if not markWarned and UnitDebuff(unit, marked) then
			self:Flash(88518)
			self:Message(88518, "Personal", "Long", CL["you"]:format(marked))
			markWarned = true
			self:ScheduleTimer(markRemoved, 7)
		end
	end
end

function mod:DevouringFlames(args)
	self:CDBar(args.spellId, 42) -- make sure to remove bar when it takes off
	self:Message(args.spellId, "Important", "Alert")
end

do
	local scheduled = nil
	local function emWarn(spellId)
		mod:TargetMessage(spellId, emTargets, "Personal", "Alarm")
		scheduled = nil
	end
	function mod:EngulfingMagicApplied(args)
		if self:Me(args.destGUID) then
			self:Say(args.spellId, L["engulfingmagic_say"])
			self:Flash(args.spellId)
			self:OpenProximity("proximity", 10)
		end
		emTargets[#emTargets + 1] = args.destName
		if not scheduled then
			scheduled = true
			self:CDBar(args.spellId, 37)
			self:ScheduleTimer(emWarn, 0.3, args.spellId)
		end
	end
end

function mod:EngulfingMagicRemoved(args)
	if self:Me(args.destGUID) then
		self:CloseProximity()
	end
end

do
	local count = 0
	function mod:Deaths()
		--Prevent the module from re-enabling in the second or so after 1 boss dies
		count = count + 1
		if count == 2 then
			self:Win()
		end
	end
end

