--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Maloriak", 754, 173)
if not mod then return end
mod:RegisterEnableMob(41378)

--------------------------------------------------------------------------------
-- Locals
--

local aberrations = 18
local phaseCounter = 0
local chillTargets = mod:NewTargetList()
local isChilled, currentPhase = nil, nil
local scorchingBlast = "~"..mod:SpellName(77679)
local flashFreeze = "~"..mod:SpellName(77699)

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale("enUS", true)
if L then
	--heroic
	L.sludge = "Dark Sludge"
	L.sludge_desc = "Warning for when you stand in Dark Sludge."
	L.sludge_message = "Sludge on YOU!"

	--normal
	L.final_phase = "Final phase"
	L.final_phase_soon = "Final phase soon!"

	L.release_aberration_message = "%d adds left!"
	L.release_all = "%d adds released!"

	L.phase = "Phase"
	L.phase_desc = "Warning for phase changes."
	L.next_phase = "Next phase"
	L.green_phase_bar = "Green phase"

	L.red_phase_trigger = "Mix and stir, apply heat..."
	L.red_phase_emote_trigger = "red"
	L.red_phase = "|cFFFF0000Red|r phase"
	L.blue_phase_trigger = "How well does the mortal shell handle extreme temperature change? Must find out! For science!"
	L.blue_phase_emote_trigger = "blue"
	L.blue_phase = "|cFF809FFEBlue|r phase"
	L.green_phase_trigger = "This one's a little unstable, but what's progress without failure?"
	L.green_phase_emote_trigger = "green"
	L.green_phase = "|cFF33FF00Green|r phase"
	L.dark_phase_trigger = "Your mixtures are weak, Maloriak! They need a bit more... kick!"
	L.dark_phase_emote_trigger = "dark"
	L.dark_phase = "|cFF660099Dark|r phase"
end
L = mod:GetLocale()

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		{77699, "ICON"}, {77760, "FLASH", "WHISPER", "SAY"}, "proximity",
		{77786, "FLASH", "WHISPER", "ICON"}, 77679,
		77991, 78194,
		{"sludge", "FLASH"},
		"phase", 77912, 77569, 77896, "berserk", "bosskill"
	}, {
		[77699] = L["blue_phase"],
		[77786] = L["red_phase"],
		[77991] = L["final_phase"],
		sludge = "heroic",
		phase = "general"
	}
end

function mod:OnBossEnable()
	--heroic
	self:Log("SPELL_AURA_APPLIED", "DarkSludge", 92930) -- [May be wrong since MoP id changes]
	self:Log("SPELL_PERIODIC_DAMAGE", "DarkSludge", 92930) -- [May be wrong since MoP id changes]

	--normal
	self:Log("SPELL_CAST_START", "ReleaseAberrations", 77569)
	self:Log("SPELL_INTERRUPT", "Interrupt", "*")

	self:Log("SPELL_CAST_SUCCESS", "FlashFreezeTimer", 77699)
	self:Log("SPELL_AURA_APPLIED", "FlashFreeze", 77699)
	self:Log("SPELL_AURA_REMOVED", "FlashFreezeRemoved", 77699)
	self:Log("SPELL_AURA_APPLIED", "BitingChill", 77760)
	self:Log("SPELL_AURA_REMOVED", "BitingChillRemoved", 77760)
	self:Log("SPELL_AURA_APPLIED", "ConsumingFlames", 77786)
	self:Log("SPELL_CAST_SUCCESS", "ScorchingBlast", 77679)
	self:Log("SPELL_AURA_APPLIED", "Remedy", 77912)
	self:Log("SPELL_CAST_START", "ReleaseAll", 77991)
	self:Log("SPELL_CAST_START", "ArcaneStorm", 77896)
	self:Log("SPELL_CAST_START", "Jets", 78194)

	self:RegisterEvent("INSTANCE_ENCOUNTER_ENGAGE_UNIT", "CheckBossStatus")

	-- We keep the emotes in case the group uses Curse of Tongues, in which
	-- case the yells become Demonic.
	self:Emote("Red", L["red_phase_emote_trigger"])
	self:Emote("Blue", L["blue_phase_emote_trigger"])
	self:Emote("Green", L["green_phase_emote_trigger"])
	self:Emote("Dark", L["dark_phase_emote_trigger"])

	-- We keep the yell triggers around because sometimes he does them far ahead
	-- of the emote.
	self:Yell("Red", L["red_phase_trigger"])
	self:Yell("Blue", L["blue_phase_trigger"])
	self:Yell("Green", L["green_phase_trigger"])
	self:Yell("Dark", L["dark_phase_trigger"])

	self:Death("Win", 41378)
end

function mod:OnEngage()
	if self:Heroic() then
		self:Bar("phase", L["next_phase"], 16, "INV_ELEMENTAL_PRIMAL_SHADOW")
		self:Berserk(720)
	else
		self:Berserk(420)
	end
	aberrations = 18
	phaseCounter = 0
	isChilled, currentPhase = nil, nil
	self:RegisterUnitEvent("UNIT_HEALTH_FREQUENT", "PhaseWarn", "boss1")
end

--------------------------------------------------------------------------------
-- Event Handlers
--

do
	local last = 0
	function mod:DarkSludge(args)
		if not UnitIsUnit(args.destName, "player") then return end
		local time = GetTime()
		if (time - last) > 2 then
			last = time
			self:LocalMessage("sludge", L["sludge_message"], "Personal", args.spellId, "Info")
			self:Flash("sludge")
		end
	end
end

do
	local function nextPhase(timeToNext)
		phaseCounter = phaseCounter + 1
		if (not mod:Heroic() and phaseCounter == 2) or (mod:Heroic() and phaseCounter == 3) then
			mod:Bar("phase", L["green_phase_bar"], timeToNext, "INV_POTION_162")
		else
			mod:Bar("phase", L["next_phase"], timeToNext, "INV_ALCHEMY_ELIXIR_EMPTY")
		end
	end

	function mod:Red()
		if currentPhase == "red" then return end
		currentPhase = "red"
		self:StopBar(flashFreeze)
		self:Bar(77679, scorchingBlast, 25, 77679)
		self:Message("phase", L["red_phase"], "Positive", "INV_POTION_24", "Long")
		if not isChilled then
			self:CloseProximity()
		end
		nextPhase(47)
	end
	function mod:Blue()
		if currentPhase == "blue" then return end
		currentPhase = "blue"
		self:StopBar(scorchingBlast)
		self:Bar(77699, flashFreeze, 28, 77699)
		self:Message("phase", L["blue_phase"], "Positive", "INV_POTION_20", "Long")
		self:OpenProximity("proximity", 5)
		nextPhase(47)
	end
	function mod:Green()
		if currentPhase == "green" then return end
		currentPhase = "green"
		self:StopBar(scorchingBlast)
		self:StopBar(flashFreeze)
		self:Message("phase", L["green_phase"], "Positive", "INV_POTION_162", "Long")
		if not isChilled then
			self:CloseProximity()
		end
		nextPhase(47)
		-- Make sure to reset after the nextPhase() call, which increments it
		phaseCounter = 0
	end
	function mod:Dark()
		if currentPhase == "dark" then return end
		currentPhase = "dark"
		self:Message("phase", L["dark_phase"], "Positive", "INV_ELEMENTAL_PRIMAL_SHADOW", "Long")
		if not isChilled then
			self:CloseProximity()
		end
		nextPhase(100)
	end
end

function mod:FlashFreezeTimer(args)
	self:Bar(args.spellId, flashFreeze, 15, args.spellId)
end

function mod:FlashFreeze(args)
	self:TargetMessage(args.spellId, args.spellName, args.destName, "Attention", args.spellId, "Info")
	self:PrimaryIcon(args.spellId, args.destName)
end

function mod:FlashFreezeRemoved(args)
	self:PrimaryIcon(args.spellId)
end

function mod:Remedy(args)
	if self:GetCID(args.destGUID) == 41378 then
		self:Message(args.spellId, args.spellName, "Important", args.spellId, "Alarm")
	end
end

do
	local handle = nil
	local function release()
		aberrations = aberrations - 3
		mod:Message(77569, L["release_aberration_message"]:format(aberrations), "Important", 688, "Alert") --Summon Imp Icon
	end
	function mod:ReleaseAberrations()
		-- He keeps casting it even if there are no adds left to release...
		if aberrations < 1 then return end
		--cast is 1.95sec with Tongues, plus some latency time
		handle = self:ScheduleTimer(release, 2.1)
	end
	function mod:Interrupt(args)
		if args.extraSpellId == 77569 then
			-- Someone interrupted release aberrations!
			self:CancelTimer(handle)
			handle = nil
		end
	end
end

function mod:ConsumingFlames(args)
	if UnitIsUnit(args.destName, "player") then
		self:Flash(args.spellId)
	end
	self:TargetMessage(args.spellId, args.spellName, args.destName, "Personal", args.spellId, "Info")
	self:Whisper(args.spellId, args.destName, args.spellName)
	self:PrimaryIcon(args.spellId, args.destName)
end

function mod:ScorchingBlast(args)
	self:Message(args.spellId, args.spellName, "Attention", args.spellId)
	self:Bar(args.spellId, scorchingBlast, 10, args.spellId)
end

function mod:ReleaseAll(args)
	self:Message(args.spellId, L["release_all"]:format(aberrations + 2), "Important", args.spellId, "Alert")
	self:Bar(args.spellId, "~"..args.spellName, 12.5, args.spellId)
end

do
	local scheduled = nil
	local function chillWarn(spellName, spellId)
		mod:TargetMessage(spellId, spellName, chillTargets, "Attention", spellId, "Info")
		scheduled = nil
	end
	function mod:BitingChill(args)
		chillTargets[#chillTargets + 1] = args.destName
		if UnitIsUnit(args.destName, "player") then
			self:Say(args.spellId)
			self:Flash(args.spellId)
			isChilled = true
		end
		if not scheduled then
			scheduled = true
			self:ScheduleTimer(chillWarn, 0.3, args.spellName, args.spellId)
		end
	end
end

function mod:BitingChillRemoved(args)
	if UnitIsUnit(args.destName, "player") then
		isChilled = nil
		if currentPhase ~= "blue" then
			self:CloseProximity()
		end
	end
end

function mod:ArcaneStorm(args)
	self:Message(args.spellId, args.spellName, "Urgent", args.spellId)
end

function mod:Jets(args)
	self:Bar(args.spellId, args.spellName, 10, args.spellId)
end

function mod:PhaseWarn(unit)
	local hp = UnitHealth(unit) / UnitHealthMax(unit) * 100
	if hp < 29 then --Switches at 25%
		self:Message("phase", L["final_phase_soon"], "Positive", 77991, "Info")
		self:UnregisterUnitEvent("UNIT_HEALTH_FREQUENT", unit)
	end
end

