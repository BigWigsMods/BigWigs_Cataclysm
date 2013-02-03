--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Al'Akir", 773, 155)
if not mod then return end
mod:RegisterEnableMob(46753)

--------------------------------------------------------------------------------
-- Locals
--

local phase, lastWindburst = 1, 0
local shock = nil
local acidRainCounter, acidRainCounted = 1, nil

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale("enUS", true)
if L then
	L.stormling = "Stormling adds"
	L.stormling_desc = "Summons Stormling."
	L.stormling_message = "Stormling incoming!"
	L.stormling_bar = "Stormling"
	L.stormling_yell = "Storms! I summon you to my side!"

	L.acid_rain = "Acid Rain (%d)"

	L.phase3_yell = "Enough! I will no longer be contained!"

	L.phase = "Phase change"
	L.phase_desc = "Announce phase changes."

	L.feedback_message = "%dx Feedback"
end
L = mod:GetLocale()

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions(CL)
	return {
		87770,
		87904,
		"stormling",
		88301,
		{89668, "ICON", "FLASHSHAKE", "WHISPER"}, 89588, 87770, "proximity",
		87873,
		88427, "phase", "berserk", "bosskill"
	}, {
		[87770] = CL["phase"]:format(1),
		[87904] = CL["phase"]:format(2),
		[89668] = CL["phase"]:format(3),
		[87873] = "heroic",
		[88427] = "general",
	}
end

function mod:OnBossEnable()
	self:Log("SPELL_CAST_SUCCESS", "Electrocute", 88427)
	self:Log("SPELL_CAST_START", "WindBurst1", 87770)
	self:Log("SPELL_AURA_APPLIED_DOSE", "Feedback", 87904)
	self:Log("SPELL_AURA_APPLIED", "Feedback", 87904)
	self:Log("SPELL_AURA_APPLIED_DOSE", "AcidRain", 88301)
	self:Log("SPELL_DAMAGE", "Shock", 87873) -- [May be wrong since MoP id changes]
	self:Log("SPELL_MISSED", "Shock", 87873) -- [May be wrong since MoP id changes]
	-- Acid Rain is applied at P2 transition
	self:Log("SPELL_AURA_APPLIED", "Phase2", 88301)

	self:Yell("Stormling", L["stormling_yell"])
	self:Yell("Phase3", L["phase3_yell"])

	self:Log("SPELL_AURA_APPLIED", "LightningRod", 89668)
	self:Log("SPELL_AURA_REMOVED", "RodRemoved", 89668)

	self:Log("SPELL_DAMAGE", "WindBurst3", 93286)
	self:Log("SPELL_MISSED", "WindBurst3", 93286)

	self:Log("SPELL_DAMAGE", "Cloud", 89588)
	self:Log("SPELL_MISSED", "Cloud", 89588)

	self:RegisterEvent("INSTANCE_ENCOUNTER_ENGAGE_UNIT", "CheckBossStatus")
	self:Death("Win", 46753)
end

function mod:OnEngage()
	self:Berserk(600)
	self:Bar(87770, 87770, 22, 87770) -- Windburst
	phase, lastWindburst = 1, 0
	acidRainCounter, acidRainCounted = 1, nil
	shock = nil
end

--------------------------------------------------------------------------------
-- Event Handlers
--

do
	local function Shocker(spellName)
		if phase == 1 then
			mod:Bar(87873, spellName, 10, 87873)
			mod:ScheduleTimer(Shocker, 10, spellName)
		end
	end
	function mod:Shock(args)
		if not shock then
			--Do we need a looping timer here?
			Shocker(args.spellName)
			shock = true
		end
	end
end

function mod:Cloud(args)
	if not UnitIsUnit(args.destName, "player") then return end
	self:LocalMessage(args.spellId, CL["you"]:format(args.spellName), "Urgent", args.spellId, "Alarm")
end

function mod:LightningRod(args)
	if UnitIsUnit(args.destName, "player") then
		self:FlashShake(args.spellId)
		self:OpenProximity("proximity", 20)
	end
	self:TargetMessage(args.spellId, args.spellName, args.destName, "Personal", args.spellId, "Long")
	self:Whisper(args.spellId, args.destName, args.spellName)
	self:PrimaryIcon(args.spellId, args.destName)
end

function mod:RodRemoved(args)
	self:PrimaryIcon(args.spellId) -- De-mark
	if UnitIsUnit(args.destName, "player") then
		self:CloseProximity()
	end
end

function mod:Phase2(args)
	if phase >= 2 then return end
	self:Message("phase", CL["phase"]:format(2), "Positive", args.spellId, "Info")
	self:StopBar(87770) -- Windburst
	phase = 2
end

local function CloudSpawn(spellId)
	mod:Bar(spellId, spellId, 10, spellId) -- Lightning Clouds
	mod:Message(spellId, spellId, "Important", spellId, "Info") -- Lightning Clouds
	mod:ScheduleTimer(CloudSpawn, 10)
end

function mod:Phase3()
	if phase >= 3 then return end
	self:Message("phase", CL["phase"]:format(3), "Positive", 88301)
	self:Bar(87770, 87770, 24, 87770) -- Windburst
	self:Bar(89588, 89588, 16, 89588) -- Lightning Clouds
	self:ScheduleTimer(CloudSpawn, 16, 89588)
	self:StopBar(L["stormling_bar"])
	self:StopBar(87904) -- Feedback
	self:StopBar(L["acid_rain"]:format(acidRainCounter))
	phase = 3
end

function mod:Feedback(args)
	local buffStack = args.amount or 1
	self:StopBar(L["feedback_message"]:format(buffStack-1))
	self:Bar(args.spellId, L["feedback_message"]:format(buffStack), self:Heroic() and 20 or 30, args.spellId)
	self:Message(args.spellId, L["feedback_message"]:format(buffStack), "Positive", args.spellId)
end

do
	local function clearCount()
		acidRainCounted = nil
	end
	function mod:AcidRain(args)
		if acidRainCounted then return end
		acidRainCounter, acidRainCounted = acidRainCounter + 1, true
		self:ScheduleTimer(clearCount, 12) -- 15 - 3
		self:Bar(args.spellId, L["acid_rain"]:format(acidRainCounter), 15, args.spellId) -- do we really want counter on bar too?
		self:Message(args.spellId, L["acid_rain"]:format(acidRainCounter), "Attention", args.spellId)
	end
end

function mod:Electrocute(args)
	self:TargetMessage(args.spellId, args.spellName, args.destName, "Personal", args.spellId)
end

function mod:WindBurst1(args)
	self:Bar(args.spellId, args.spellName, 26, args.spellId)
	self:Message(args.spellId, args.spellName, "Important", args.spellId, "Alert")
end

function mod:WindBurst3(args)
	if (GetTime() - lastWindburst) > 5 then
		self:Bar(87770, args.spellName, 19, args.spellId) -- 22 was too long, 19 should work
		self:Message(87770, args.spellName, "Attention", args.spellId)
	end
	lastWindburst = GetTime()
end

function mod:Stormling()
	self:Bar("stormling", L["stormling_bar"], 20, 75096)
	self:Message("stormling", L["stormling_message"], "Important", 75096)
end

