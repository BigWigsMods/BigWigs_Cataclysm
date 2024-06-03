--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Nefarian", 669, 174)
if not mod then return end
mod:RegisterEnableMob(41270, 41376)
mod:SetEncounterID(1026)
mod:SetRespawnTime(30)
mod:SetStage(1)

--------------------------------------------------------------------------------
-- Locals
--

local deadAdds, shadowBlazeTimer = 0, 35
local powerTargets = mod:NewTargetList()
local phase3warned = false
local shadowblazeHandle, lastBlaze = nil, 0
local blastNovaCollector = {}

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:GetLocale()
if L then
	L.phase = "Phases"
	L.phase_desc = "Warnings for the Phase changes."

	L.discharge_bar = "Discharge"

	L.phase_two_trigger = "Curse you, mortals! Such a callous disregard for one's possessions must be met with extreme force!"

	L.phase_three_trigger = "I have tried to be an accommodating host"

	L.crackle_trigger = "The air crackles with electricity!"
	L.crackle_message = "Electrocute soon!"

	L.shadowblaze_trigger = "Flesh turns to ash!"
	L.shadowblaze_message = "Fire under YOU!"

	L.onyxia_power_message = "Explosion soon!"

	L.chromatic_prototype = "Chromatic Prototype" -- 3 adds name
end

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		-- Onyxia
		77939,
		-- Normal
		78999,
		81272,
		81007,
		80734, -- Blast Nova
		-- Heroic
		{79339, "CASTBAR", "SAY", "SAY_COUNTDOWN", "ME_ONLY_EMPHASIZE"}, -- Explosive Cinders
		79318, -- Dominion
		"berserk",
		-- General
		"stages",
	},{
		[77939] = -3283, -- Onyxia
		[78999] = "normal",
		[79339] = "heroic",
		["stages"] = "general"
	},{
		[79339] = CL.bomb, -- Explosive Cinders (Bomb)
	}
end

function mod:OnBossEnable()
	self:BossYell("PhaseTwo", L["phase_two_trigger"])
	self:BossYell("PhaseThree", L["phase_three_trigger"])
	self:BossYell("ShadowblazeCorrection", L["shadowblaze_trigger"])

	--Not bad enough that there is no cast trigger, there's also OVER NINE THOUSAND id's
	self:Log("SPELL_DAMAGE", "LightningDischarge", "*")
	self:Log("SPELL_MISSED", "LightningDischarge", "*")

	self:Log("SPELL_CAST_START", "BlastNova", 80734)

	self:Log("SPELL_CAST_START", "ExplosiveCinders", 79339)
	self:Log("SPELL_AURA_APPLIED", "ExplosiveCindersApplied", 79339)
	self:Log("SPELL_AURA_REMOVED", "ExplosiveCindersRemoved", 79339)

	self:Log("SPELL_CAST_START", "Dominion", 79318)
	self:Log("SPELL_AURA_APPLIED", "DominionApplied", 79318)

	self:Log("SPELL_DAMAGE", "PersonalShadowBlaze", 81007)
	self:Log("SPELL_MISSED", "PersonalShadowBlaze", 81007)

	self:Emote("Electrocute", L["crackle_trigger"])

	self:Death("PrototypeDeaths", 41948) -- Chromatic Prototype
end

function mod:OnEngage()
	deadAdds, shadowBlazeTimer = 0, 35
	phase3warned = false
	shadowblazeHandle, lastBlaze = nil, 0
	blastNovaCollector = {}
	self:SetStage(1)
	self:RegisterUnitEvent("UNIT_POWER_FREQUENT", nil, "boss1", "boss2")
	self:Berserk(630) -- is it really?
	self:CDBar(77939, 30, L["discharge_bar"])
	if self:Heroic() then
		self:CDBar(79318, 45) -- Dominion
	end
end

--------------------------------------------------------------------------------
-- Event Handlers
--

do
	local prev = 0
	local discharge = mod:SpellName(77939)
	function mod:LightningDischarge(args)
		if args.spellName ~= discharge then return end
		if (args.time - prev) > 10 then
			prev = args.time
			self:CDBar(77939, 21, L["discharge_bar"])
		end
	end
end

do
	local prev = 0
	function mod:PersonalShadowBlaze(args)
		if self:Me(args.destGUID) and (args.time - prev) > 1 then
			prev = args.time
			self:MessageOld(args.spellId, "blue", "info", L["shadowblaze_message"])
		end
	end
end

function mod:Electrocute()
	if self:IsEngaged() then -- Not during the RP of activating the boss
		self:Message(81272, "orange", L["crackle_message"])
		self:Bar(81272, 5) -- Electrocute
		self:PlaySound(81272, "alert")
	end
end

function mod:PrototypeDeaths()
	deadAdds = deadAdds + 1
	if self:Heroic() and not phase3warned then
		self:StopBar(CL.stage:format(self:GetStage()))
		self:SetStage(3)
		self:Message("stages", "cyan", CL.stage:format(3), false)
		phase3warned = true
	end
	if deadAdds == 3 and not phase3warned then
		self:StopBar(CL.stage:format(self:GetStage()))
		self:SetStage(3)
		self:Message("stages", "cyan", CL.stage:format(3), false)
		phase3warned = true
	end
end

function mod:PhaseTwo()
	self:SetStage(2)
	self:StopBar(79318) -- Dominion
	self:StopBar(L["discharge_bar"])
	self:Message("stages", "cyan", CL.stage:format(2), false)
	if self:Difficulty() == 6 then
		-- Heroic 25man (diff 4) probably 4 minutes
		self:Bar("stages", 240, CL.stage:format(3), 78621) -- random guessed number
	else
		-- Normal 10man (diff 1) probably 3 minutes
		-- Normal 25man (diff 2) confirmed 3 minutes
		self:Bar("stages", 180, CL.stage:format(3), 78621)
	end
	-- XXX Heroic 10man (diff 3) - no idea.
end

local function nextBlaze()
	if shadowBlazeTimer > 10 and mod:Heroic() then
		shadowBlazeTimer = shadowBlazeTimer - 5
	elseif shadowBlazeTimer > 15 and not mod:Heroic() then
		shadowBlazeTimer = shadowBlazeTimer - 5
	end
	mod:MessageOld(81007, "red", "alarm") -- Shadowblaze
	mod:Bar(81007, shadowBlazeTimer) -- Shadowblaze
	lastBlaze = GetTime()
	shadowblazeHandle = mod:ScheduleTimer(nextBlaze, shadowBlazeTimer)
end

function mod:ShadowblazeCorrection()
	self:CancelTimer(shadowblazeHandle)
	if (GetTime() - lastBlaze) <= 3 then
		shadowblazeHandle = mod:ScheduleTimer(nextBlaze, shadowBlazeTimer)
	elseif (GetTime() - lastBlaze) >= 6 then
		nextBlaze()
	end
	lastBlaze = GetTime()
end

function mod:PhaseThree()
	self:StopBar(CL.stage:format(3))
	if self:Heroic() then
		self:CDBar(79318, 20) -- Dominion
	end
	if not phase3warned then
		phase3warned = true
		self:SetStage(3)
		self:Message("stages", "cyan", CL.stage:format(3), false)
	end
	self:Bar(81007, 12) -- Shadowblaze
	shadowblazeHandle = self:ScheduleTimer(nextBlaze, 12)
end

function mod:BlastNova(args)
	blastNovaCollector[args.sourceGUID] = (blastNovaCollector[args.sourceGUID] or 0) + 1
	local unit = self:GetUnitIdByGUID(args.sourceGUID)
	if unit and self:UnitWithinRange(unit, 30) then
		self:Message(args.spellId, "orange", CL.count:format(args.spellName, blastNovaCollector[args.sourceGUID]))
	end
end

do
	local playerList = {}
	function mod:ExplosiveCinders()
		playerList = {}
	end

	function mod:ExplosiveCindersApplied(args)
		playerList[#playerList+1] = args.destName
		self:TargetsMessage(args.spellId, "orange", playerList, 3, CL.bomb)
		if self:Me(args.destGUID) then
			self:Say(args.spellId, CL.bomb, nil, "Bomb")
			self:SayCountdown(args.spellId, 8, nil, 5)
			self:CastBar(args.spellId, 8, CL.bomb)
			self:PlaySound(args.spellId, "warning")
		end
	end
end

function mod:ExplosiveCindersRemoved(args)
	if self:Me(args.destGUID) then
		self:CancelSayCountdown(args.spellId)
		self:StopBar(CL.cast:format(CL.bomb))
		self:PersonalMessage(args.spellId, "removed", CL.bomb)
	end
end

do
	local playerList = {}
	function mod:Dominion(args)
		playerList = {}
		self:CDBar(args.spellId, 16.2)
	end

	function mod:DominionApplied(args)
		local count = #playerList
		playerList[count+1] = args.destName
		self:TargetsMessage(args.spellId, "yellow", playerList, 5)
		if count == 0 then
			self:PlaySound(args.spellId, "warning")
		end
	end
end

function mod:UNIT_POWER_FREQUENT(event, unit)
	if self:MobId(self:UnitGUID(unit)) == 41270 then -- Onyxia
		local power = UnitPower(unit, 10) -- Enum.PowerType.Alternate = 10
		if power > 80 then
			self:UnregisterUnitEvent(event, "boss1", "boss2")
			self:Message(78999, "yellow", L["onyxia_power_message"])
		end
	end
end

