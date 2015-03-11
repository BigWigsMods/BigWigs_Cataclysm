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
	L.stormling_desc = "Summons a Stormling."
	L.stormling_icon = 88272

	L.acid_rain = "Acid Rain (%d)"

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
		{89668, "ICON", "FLASH"}, 89588, 87770, "proximity",
		87873,
		88427, "stages", "berserk"
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

	self:RegisterUnitEvent("UNIT_SPELLCAST_SUCCEEDED", nil, "boss1")

	self:Log("SPELL_AURA_APPLIED", "LightningRod", 89668)
	self:Log("SPELL_AURA_REMOVED", "RodRemoved", 89668)

	self:Log("SPELL_DAMAGE", "WindBurst3", 88858) -- Wrong id
	self:Log("SPELL_MISSED", "WindBurst3", 88858)

	self:Log("SPELL_DAMAGE", "Cloud", 89588)
	self:Log("SPELL_MISSED", "Cloud", 89588)

	self:RegisterEvent("INSTANCE_ENCOUNTER_ENGAGE_UNIT", "CheckBossStatus")
	self:Death("Win", 46753)
end

function mod:OnEngage()
	self:Berserk(600)
	self:Bar(87770, 22) -- Windburst
	phase, lastWindburst = 1, 0
	acidRainCounter, acidRainCounted = 1, nil
	shock = nil
end

--------------------------------------------------------------------------------
-- Event Handlers
--

do
	local function Shocker()
		if phase == 1 then
			mod:Bar(87873, 10)
			mod:ScheduleTimer(Shocker, 10)
		end
	end
	function mod:Shock(args)
		if not shock then
			--Do we need a looping timer here?
			Shocker()
			shock = true
		end
	end
end

function mod:Cloud(args)
	if self:Me(args.destGUID) then
		self:Message(args.spellId, "Urgent", "Alarm", CL["you"]:format(args.spellName))
	end
end

function mod:LightningRod(args)
	if self:Me(args.destGUID) then
		self:Flash(args.spellId)
		self:OpenProximity("proximity", 20)
	end
	self:TargetMessage(args.spellId, args.destName, "Personal", "Long")
	self:PrimaryIcon(args.spellId, args.destName)
end

function mod:RodRemoved(args)
	self:PrimaryIcon(args.spellId) -- De-mark
	if self:Me(args.destGUID) then
		self:CloseProximity()
	end
end

local function CloudSpawn(spellId)
	mod:Bar(spellId, 10) -- Lightning Clouds
	mod:Message(spellId, "Important", "Info") -- Lightning Clouds
	mod:ScheduleTimer(CloudSpawn, 10, spellId)
end

function mod:Feedback(args)
	local buffStack = args.amount or 1
	self:StopBar(L["feedback_message"]:format(buffStack-1))
	self:Bar(args.spellId, self:Heroic() and 20 or 30, L["feedback_message"]:format(buffStack))
	self:Message(args.spellId, "Positive", nil, L["feedback_message"]:format(buffStack))
end

do
	local function clearCount()
		acidRainCounted = nil
	end
	function mod:AcidRain(args)
		if acidRainCounted then return end
		acidRainCounter, acidRainCounted = acidRainCounter + 1, true
		self:ScheduleTimer(clearCount, 12) -- 15 - 3
		self:Bar(args.spellId, 15, L["acid_rain"]:format(acidRainCounter))
		self:Message(args.spellId, "Attention", nil, L["acid_rain"]:format(acidRainCounter))
	end
end

function mod:Electrocute(args)
	self:TargetMessage(args.spellId, args.destName, "Personal")
end

function mod:WindBurst1(args)
	self:Bar(args.spellId, 26)
	self:Message(args.spellId, "Important", "Alert")
end

function mod:WindBurst3(args)
	if (GetTime() - lastWindburst) > 5 then
		self:Bar(87770, 19, args.spellName, args.spellId) -- 22 was too long, 19 should work
		self:Message(87770, "Attention", nil, args.spellName, args.spellId)
	end
	lastWindburst = GetTime()
end

function mod:UNIT_SPELLCAST_SUCCEEDED(_,spellName,_,_,spellId)
	if spellId == 88272 then -- Stormling
		self:Bar("stormling", 20, spellId)
		self:Message("stormling", "Important", nil, CL["incoming"]:format(spellName), spellId)
	elseif spellId == 88290 then -- Acid Rain
		phase = 2
		self:Message("stages", "Positive", "Info", CL["phase"]:format(2), 88301)
		self:StopBar(87770) -- Windburst
	elseif spellId == 89528 then -- Relentless Storm Initial Vehicle Ride Trigger
		phase = 3
		self:Message("stages", "Positive", nil, CL["phase"]:format(3), 88875)
		self:Bar(87770, 24) -- Windburst
		self:Bar(89588, 16) -- Lightning Clouds
		self:ScheduleTimer(CloudSpawn, 16, 89588)
		self:StopBar(88272) -- Stormling
		self:StopBar(87904) -- Feedback
		self:StopBar(L["acid_rain"]:format(acidRainCounter))
	end
end

