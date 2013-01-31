--------------------------------------------------------------------------------
-- Module Declaration
--

local mod = BigWigs:NewBoss("Cho'gall", 758, 167)
if not mod then return end
mod:RegisterEnableMob(43324)

--------------------------------------------------------------------------------
-- Locals
--

local worshipTargets = mod:NewTargetList()
local worshipCooldown = 24
local firstFury = 0
local counter = 1
local bigcount = 1
local oozecount = 1

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale("enUS", true)
if L then
	L.orders = "Stance changes"
	L.orders_desc = "Warning for when Cho'gall changes between Shadow/Flame Orders stances."

	L.worship_cooldown = "~Worship"

	L.adherent_bar = "Big add #%d"
	L.adherent_message = "Add %d incoming!"
	L.ooze_bar = "Ooze swarm %d"
	L.ooze_message = "Ooze swarm %d incoming!"

	L.tentacles_bar = "Tentacles spawn"
	L.tentacles_message = "Tentacle disco party!"

	L.sickness_message = "You feel terrible!"
	L.blaze_message = "Fire under YOU!"
	L.crash_say = "Crash"

	L.fury_message = "Fury!"
	L.first_fury_soon = "Fury Soon!"
	L.first_fury_message = "85% - Fury Begins!"

	L.unleashed_shadows = "Pulsing Shadow"

	L.phase2_message = "Phase 2!"
	L.phase2_soon = "Phase 2 soon!"
end
L = mod:GetLocale()

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions(CL)
	return {
		91303, {81538, "FLASHSHAKE"}, {81685, "FLASHSHAKE", "ICON", "SAY"}, 81571, 82524, 81628, 82299,
		82630, 82414,
		"orders", {82235, "FLASHSHAKE", "PROXIMITY"}, "berserk", "bosskill"
	}, {
		[91303] = CL.phase:format(1),
		[82630] = CL.phase:format(2),
		orders = "general",
	}
end

function mod:OnBossEnable()
	--normal
	self:Log("SPELL_CAST_SUCCESS", "Orders", 81171, 81556)
	self:Log("SPELL_AURA_APPLIED", "Worship", 91317)
	self:Log("SPELL_CAST_START", "SummonCorruptingAdherent", 81628)
	self:Log("SPELL_CAST_START", "FuryOfChogall", 82524)
	self:Log("SPELL_CAST_START", "FesterBlood", 82299)
	self:Log("SPELL_CAST_SUCCESS", "LastPhase", 82630)
	self:Log("SPELL_CAST_SUCCESS", "DarkenedCreations", 82414)
	self:Log("SPELL_CAST_SUCCESS", "CorruptingCrash", 81685)

	self:Log("SPELL_DAMAGE", "Blaze", 81538)
	self:Log("SPELL_MISSED", "Blaze", 81538)

	self:RegisterEvent("INSTANCE_ENCOUNTER_ENGAGE_UNIT", "CheckBossStatus")

	self:Death("Win", 43324)
end

function mod:OnEngage()
	bigcount = 1
	oozecount = 1
	self:Bar(91303, L["worship_cooldown"], 11, 91303)
	self:Berserk(600)
	worshipCooldown = 24 -- its not 40 sec till the 1st add
	firstFury = 0
	counter = 1

	self:RegisterUnitEvent("UNIT_AURA", "SicknessCheck", "player")
	self:RegisterUnitEvent("UNIT_HEALTH_FREQUENT", nil, "boss1")
end

--------------------------------------------------------------------------------
-- Event Handlers
--

do
	local last = 0
	function mod:Blaze(args)
		local time = GetTime()
		if (time - last) > 2 then
			last = time
			if UnitIsUnit(args.destName, "player") then
				self:LocalMessage(args.spellId, L["blaze_message"], "Personal", args.spellId, "Info")
				self:FlashShake(args.spellId)
			end
		end
	end
end

do
	local function checkTarget(sGUID, spellId)
		local mobId = mod:GetUnitIdByGUID(sGUID)
		if mobId then
			local player = UnitName(mobId.."target")
			if not player then return end
			if UnitIsUnit("player", player) then
				mod:Say(spellId, L["crash_say"])
				mod:FlashShake(spellId)
			end
			mod:TargetMessage(spellId, spellId, player, "Urgent", spellId, "Long") -- Corrupting Crash
			if counter == 1 then
				mod:PrimaryIcon(spellId, player)
			else
				mod:SecondaryIcon(spellId, player)
			end
			if mod:Difficulty() == 6 then counter = counter + 1 end
		end
		if counter > 2 then counter = 1 end
	end
	function mod:CorruptingCrash(args)
		self:ScheduleTimer(checkTarget, 0.2, args.sourceGUID, args.spellId)
	end
end

do
	local sickness = mod:SpellName(82235)
	local prev = 0
	function mod:SicknessCheck(unit)
		local t = GetTime()
		if (t - prev) > 7 then
			local sick = UnitDebuff(unit, sickness)
			if sick then
				prev = t
				self:LocalMessage(82235, L["sickness_message"], "Personal", 81831, "Long")
				self:OpenProximity(82235, 5)
				self:FlashShake(82235)
			end
		end
	end
end

function mod:FuryOfChogall(args)
	if firstFury == 1 then
		self:Message(args.spellId, L["first_fury_message"], "Attention", args.spellId)
		self:Bar(91303, L["worship_cooldown"], 10, 91303)
		worshipCooldown = 40
		firstFury = 2
	else
		self:Message(args.spellId, L["fury_message"], "Attention", args.spellId)
	end
	self:Bar(args.spellId, args.spellName, 47, args.spellId)
end

function mod:Orders(args)
	self:Message("orders", args.spellName, "Urgent", args.spellId)
	if args.spellId == 81556 then
		if self:Heroic() then
			self:Bar(81571, L["unleashed_shadows"], 24, 81571) -- verified for 25man heroic
		else
			self:Bar(81571, L["unleashed_shadows"], 15, 81571) -- verified for 10man normal
		end
	end
end

do
	local function nextAdd(spellId)
		mod:Bar(spellId, L["adherent_bar"]:format(bigcount), 50, spellId)
	end
	function mod:SummonCorruptingAdherent(args)
		self:Message(args.spellId, L["adherent_message"]:format(bigcount), "Important", args.spellId)
		bigcount = bigcount + 1
		self:ScheduleTimer(nextAdd, 41, args.spellId)

		-- I assume its 40 sec from summon and the timer is not between two casts of Fester Blood
		self:Bar(82299, L["ooze_bar"]:format(oozecount), 40, 82299)
	end
end

function mod:FesterBlood(args)
	self:Message(args.spellId, L["ooze_message"]:format(oozecount), "Attention", args.spellId, "Alert")
	oozecount = oozecount + 1
end

function mod:UNIT_HEALTH_FREQUENT(unit)
	local hp = UnitHealth(unit) / UnitHealthMax(unit) * 100
	if firstFury == 0 and hp > 86 and hp < 89 then
		self:Message(82524, L["first_fury_soon"], "Attention", 82524)
		firstFury = 1
	elseif hp < 30 then
		self:Message(82630, L["phase2_soon"], "Attention", 82630, "Info")
		self:UnregisterUnitEvent("UNIT_HEALTH_FREQUENT", unit)
	end
end

function mod:LastPhase(args)
	self:StopBar(L["adherent_bar"])
	self:StopBar(L["ooze_bar"])
	self:StopBar(L["worship_cooldown"])
	self:Message(args.spellId, L["phase2_message"], "Positive", args.spellId)
	self:Bar(82414, L["tentacles_bar"], 6, 82414)
end

function mod:DarkenedCreations(args)
	self:Message(args.spellId, L["tentacles_message"], "Urgent", args.spellId)
	self:Bar(args.spellId, L["tentacles_bar"], 30, args.spellId)
end

do
	local scheduled = nil
	local function worshipWarn(spellName)
		mod:TargetMessage(91303, spellName, worshipTargets, "Important", 91303)
		mod:PlaySound(91303, "Alarm")
		scheduled = nil
	end
	function mod:Worship(args)
		worshipTargets[#worshipTargets + 1] = args.destName
		if not scheduled then
			scheduled = true
			self:Bar(91303, L["worship_cooldown"], worshipCooldown, 91303)
			self:ScheduleTimer(worshipWarn, 0.3, args.spellName)
		end
	end
end

