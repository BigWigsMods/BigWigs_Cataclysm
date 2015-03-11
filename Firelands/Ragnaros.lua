--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Ragnaros", 800, 198)
if not mod then return end
mod:RegisterEnableMob(52409, 53231) --Ragnaros, Lava Scion

--------------------------------------------------------------------------------
-- Locals
--

local intermissionwarned, infernoWarned, fixateWarned = false, false, false
local blazingHeatTargets = mod:NewTargetList()
local sons = 8
local phase = 1
local lavaWavesCD, engulfingCD, dreadflameCD = 30, 40, 40
local moltenSeed, lavaWaves, fixate, livingMeteor, wrathOfRagnaros = mod:SpellName(98498), mod:SpellName(98928), mod:SpellName(99849), mod:SpellName(99317), mod:SpellName(98263)
local dreadflame, cloudburst, worldInFlames = mod:SpellName(100675), mod:SpellName(100714), mod:SpellName(100171)
local meteorCounter, meteorNumber = 1, {1, 2, 4, 6, 8}
local intermissionHandle = nil

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale("enUS", true)
if L then
	L.intermission_end_trigger1 = "Sulfuras will be your end"
	L.intermission_end_trigger2 = "Fall to your knees"
	L.intermission_end_trigger3 = "I will finish this"
	L.phase4_trigger = "Too soon..."
	L.seed_explosion = "Seed explosion!"
	L.intermission_bar = "Intermission!"
	L.intermission_message = "Intermission... Got cookies?"
	L.sons_left = "%d |4son left:sons left;"
	L.engulfing_close = "Close quarters Engulfed!"
	L.engulfing_middle = "Middle section Engulfed!"
	L.engulfing_far = "Far side Engulfed!"
	L.hand_bar = "Knockback"
	L.ragnaros_back_message = "Raggy is back, parry on!" -- yeah thats right PARRY ON!
end
L = mod:GetLocale()

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		98237, 98263, 98164,
		98953, {100460, "ICON", "FLASH", "SAY"},
		98498, 99172,
		99317, {99849, "FLASH", "SAY"},
		100171, 100479, 100646, 100714, 100604, 100675,
		98710, {99399, "TANK"}, "proximity", "berserk"
	}, {
		[98237] = -2629,
		[98953] = L["intermission_bar"],
		[98498] = -2640,
		[99317] = -2655,
		[100171] = "heroic",
		[98710] = "general"
	}
end

function mod:OnBossEnable()
	-- Heroic
	self:Log("SPELL_AURA_APPLIED", "WorldInFlames", 100171)

	self:Yell("Phase4", L["phase4_trigger"])
	self:Log("SPELL_CAST_START", "BreadthofFrost", 100479)
	self:Log("SPELL_CAST_START", "EntrappingRoots", 100646)
	self:Log("SPELL_CAST_START", "Cloudburst", 100714)
	self:Log("SPELL_CAST_SUCCESS", "EmpowerSulfuras", 100604)

	-- Normal
	self:Yell("IntermissionEnd", L["intermission_end_trigger1"], L["intermission_end_trigger2"], L["intermission_end_trigger3"])

	self:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED")
	self:Log("SPELL_CAST_START", "EngulfingFlames", 99236, 99172, 99235)
	self:Log("SPELL_CAST_SUCCESS", "HandofRagnaros", 98237)
	self:Log("SPELL_CAST_SUCCESS", "WrathofRagnaros", 98263)
	self:Log("SPELL_CAST_SUCCESS", "BlazingHeat", 100460)
	self:Log("SPELL_CAST_SUCCESS", "MagmaTrap", 98164)
	self:Log("SPELL_CAST_START", "SulfurasSmash", 98710)
	self:Log("SPELL_CAST_START", "SplittingBlow", 98953, 98952, 98951)
	self:Log("SPELL_SUMMON", "LivingMeteor", 99317)
	self:Emote("Dreadflame", dreadflame)

	self:Log("SPELL_AURA_APPLIED", "BurningWound", 99399)
	self:Log("SPELL_AURA_APPLIED_DOSE", "BurningWound", 99399)

	self:RegisterEvent("INSTANCE_ENCOUNTER_ENGAGE_UNIT", "CheckBossStatus")

	self:Death("Win", 52409)
	self:Death("SonDeaths", 53140) -- Son of Flame
end

function mod:OnEngage()
	self:Bar(98237, 25, L["hand_bar"])
	self:Bar(98710, 30, lavaWaves)
	self:OpenProximity("proximity", 6)
	self:Berserk(1080)
	lavaWavesCD, dreadflameCD = 30, 40
	if self:Heroic() then
		engulfingCD = 60
	else
		engulfingCD = 40
	end
	intermissionwarned, infernoWarned, fixateWarned = false, false, false
	sons = 8
	phase = 1
	meteorCounter = 1
	intermissionHandle = nil
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:Phase4()
	--10% Yell is Phase 4 for heroic, and victory for normal
	if self:Heroic() then
		self:StopBar(livingMeteor)
		self:StopBar(lavaWaves)
		self:StopBar(moltenSeed)
		phase = 4
		 -- not sure if we want a different option key or different icon
		self:Message(98953, CL["phase"]:format(phase), "Positive", 98953)
		self:Bar(100479, 34) -- Breadth of Frost
		self:Bar(100714, 51) -- Cloudburst
		self:Bar(100646, 68) -- Entraping Roots
		self:Bar(100604, 90) -- Empower Sulfuras
	else
		self:Win()
	end
end

function mod:Dreadflame()
	if not UnitDebuff("player", self:SpellName(100757)) then return end -- No Deluge on you = you don't care
	self:Message(100675, "Important", "Alarm")
	self:Bar(100675, dreadflameCD)
	if dreadflameCD > 10 then
		dreadflameCD = dreadflameCD - 5
	end
end

function mod:EmpowerSulfuras(args)
	self:Message(args.spellId, "Urgent")
	self:CDBar(args.spellId, 56)
	self:Bar(args.spellId, 5, "<"..args.spellName..">")
end

function mod:Cloudburst(args)
	self:Message(args.spellId, "Positive")
end

function mod:EntrappingRoots(args)
	self:Message(args.spellId, "Positive")
	self:Bar(args.spellId, 56)
end

function mod:BreadthofFrost(args)
	self:Message(args.spellId, "Positive")
	self:Bar(args.spellId, 45)
end

function mod:BurningWound(args)
	local wound = self:SpellName(18107) -- "Wound"
	self:Bar(args.spellId, 6, wound)
	self:StackMessage(args.spellId, args.destName, args.amount, "Urgent", args.amount and args.amount > 2 and "Info", wound)
end

function mod:MagmaTrap(args)
	self:CDBar(args.spellId, 25)
end

do
	local prev = 0
	function mod:LivingMeteor(args)
		local t = GetTime()
		if t-prev > 5 then
			prev = t
			self:Message(args.spellId, "Attention", nil, ("%s (%d)"):format(args.spellName, meteorNumber[meteorCounter]))
			meteorCounter = meteorCounter + 1
			self:Bar(args.spellId, 45)
		end
	end
end

function mod:FixatedCheck(unit)
	local fixated = UnitDebuff(unit, fixate)
	if fixated and not fixateWarned then
		fixateWarned = true
		self:Message(99849, "Personal", "Long", CL["you"]:format(fixate))
		self:Say(99849)
		self:Flash(99849)
	elseif not fixated and fixateWarned then
		fixateWarned = false
	end
end

function mod:IntermissionEnd()
	self:StopBar(L["intermission_bar"])
	if phase == 1 then
		lavaWavesCD = 40
		self:OpenProximity("proximity", 6)
		if self:Heroic() then
			self:CDBar(98498, 15) -- Molten Seed
			self:Bar(98710, 7.5, lavaWaves)
			self:Bar(100171, 40) -- World in Flames
		else
			self:Bar(98498, 22.7) -- Molten Seed
			self:Bar(98710, 55, lavaWaves)
		end
	elseif phase == 2 then
		engulfingCD = 30
		if self:Heroic() then
			self:Bar(100171, engulfingCD) -- World in Flames
		end
		self:CDBar(99317, 52) -- Living Meteor
		self:Bar(98710, 55, lavaWaves)
		self:RegisterUnitEvent("UNIT_AURA", "FixatedCheck", "player")
		self:UnregisterEvent("UNIT_SPELLCAST_SUCCEEDED")
	end
	phase = phase + 1
	self:Message(98953, "Positive", nil, L["ragnaros_back_message"], 100593) -- ragnaros icon
end

function mod:HandofRagnaros(args)
	self:Bar(args.spellId, 25, L["hand_bar"])
end

function mod:WrathofRagnaros(args)
	if self:Difficulty() == 5 then
		self:CDBar(args.spellId, 25)
	end
end

function mod:SplittingBlow(args)
	if phase == 2 then
		self:CancelAllTimers()
		self:StopBar(L["seed_explosion"])
		self:StopBar(100171) -- World in Flames
		self:StopBar(99172) -- Engulfing Flames
	end
	self:Message(98953, "Positive", "Long", L["intermission_message"], args.spellId)
	self:Bar(98953, 7, args.spellId)
	self:Bar(98953, self:Heroic() and 60 or 57, L["intermission_bar"], args.spellId) -- They are probably both 60
	self:CloseProximity()
	sons = 8
	self:StopBar(L["hand_bar"])
	self:StopBar(lavaWaves)
	self:StopBar(98263) -- Wrath of Ragnaros
	self:StopBar(98498) -- Molten Seed
end

function mod:SulfurasSmash(args)
	if phase == 1 and self:Difficulty() ~= 5 then
		self:CDBar(98263, 12)
	end
	self:Message(args.spellId, "Attention", "Info", lavaWaves)
	self:Bar(args.spellId, lavaWavesCD, lavaWaves)
end

function mod:WorldInFlames(args)
	self:Message(args.spellId, "Important", "Alert")
	self:Bar(args.spellId, engulfingCD)
end

function mod:EngulfingFlames(args)
	if self:Heroic() then return end
	if args.spellId == 99172 then
		self:Message(99172, "Important", "Alert", L["engulfing_close"])
	elseif args.spellId == 99235 then
		self:Message(99172, "Important", "Alert", L["engulfing_middle"])
	elseif args.spellId == 99236 then
		self:Message(99172, "Important", "Alert", L["engulfing_far"])
	end
	self:Bar(99172, engulfingCD)
end

do
	local scheduled = nil
	local iconCounter = 1
	local function blazingHeatWarn(spellId)
		mod:TargetMessage(spellId, blazingHeatTargets, "Attention", "Info")
		scheduled = nil
	end
	function mod:BlazingHeat(args)
		blazingHeatTargets[#blazingHeatTargets + 1] = args.destName
		if self:Me(args.destGUID) then
			self:Say(args.spellId)
			self:Flash(args.spellId)
		end
		if iconCounter == 1 then
			self:PrimaryIcon(args.spellId, args.destName)
			iconCounter = 2
		else
			self:SecondaryIcon(args.spellId, args.destName)
			iconCounter = 1
		end
		if not scheduled then
			scheduled = true
			self:ScheduleTimer(blazingHeatWarn, 0.3, args.spellId)
		end
	end
end

do
	local prev = 0
	function mod:UNIT_SPELLCAST_SUCCEEDED(_, _, spellName, _, _, spellId)
		if spellName == moltenSeed then
			local t = GetTime()
			if t-prev > 5 then
				prev = t
				self:Message(98498, "Urgent", "Alarm", spellId)
				self:Bar(98498, 12, L["seed_explosion"], spellId)
				self:Bar(98498, 60, spellId)
			end
		end
	end
end

function mod:SonDeaths()
	sons = sons - 1
	if sons < 4 then
		self:Message(98953, "Positive", nil, L["sons_left"]:format(sons), 98473) -- the speed buff icon on the sons
	end
end

