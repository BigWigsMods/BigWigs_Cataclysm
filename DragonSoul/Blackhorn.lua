--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Warmaster Blackhorn", 824, 332)
if not mod then return end
-- Goriona, Blackhorn, The Skyfire, Ka'anu Reevs, Sky Captain Swayze
mod:RegisterEnableMob(56781, 56427, 56598, 42288, 55870)

--------------------------------------------------------------------------------
-- Locales
--

local canEnable, warned = true, false
local onslaughtCounter = 1

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale("enUS", true)
if L then
	L.warmup = "Warmup"
	L.warmup_desc = "Time until combat starts."
	L.warmup_icon = "achievment_boss_blackhorn"

	L.sunder = "Sunder Armor"
	L.sunder_desc = "Count the stacks of sunder armor and show a duration bar."
	L.sunder_icon = 108043
	L.sunder_message = "%2$dx Sunder on %1$s"

	L.sapper_trigger = "A drake swoops down to drop a Twilight Sapper onto the deck!"
	L.sapper = "Sapper"
	L.sapper_desc = "Sapper dealing damage to the ship"
	L.sapper_icon = 73457

	L.stage2_trigger = "Looks like I'm doing this myself. Good!"
end
L = mod:GetLocale()

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions(CL)
	return {
		107588, "sapper",
		{"sunder", "TANK"}, {108046, "SAY", "FLASH"}, {108076, "SAY", "FLASH", "ICON"}, 108044,
		"warmup", "berserk", "bosskill",
	}, {
		[107588] = -4027,
		sunder = -4033,
		warmup = CL["general"],
	}
end

function mod:VerifyEnable()
	return canEnable
end

function mod:OnBossEnable()
	self:Log("SPELL_SUMMON", "TwilightFlames", 108076) -- did they just remove this?
	self:Log("SPELL_CAST_START", "TwilightOnslaught", 107588)
	self:Log("SPELL_CAST_START", "Shockwave", 108046)
	self:Log("SPELL_AURA_APPLIED", "Sunder", 108043)
	self:Log("SPELL_AURA_APPLIED", "PreStage2", 108040)
	self:Log("SPELL_AURA_APPLIED_DOSE", "Sunder", 108043)
	self:Log("SPELL_CAST_SUCCESS", "Roar", 108044)
	self:Emote("Sapper", L["sapper_trigger"])
	self:Yell("Stage2", L["stage2_trigger"])

	self:RegisterEvent("INSTANCE_ENCOUNTER_ENGAGE_UNIT", "CheckBossStatus")
	self:Death("Win", 56427)
end

function mod:OnEngage()
	self:Bar(107588, 107588, 47, 107588) -- Twilight Onslaught
	if not self:LFR() then
		self:Bar("sapper", L["sapper"], 70, L["sapper_icon"])
	end
	onslaughtCounter = 1
	self:Bar("warmup", _G["COMBAT"], 20, L["warmup_icon"])
	self:DelayedMessage("warmup", 20, CL["phase"]:format(1), "Positive", L["warmup_icon"])
	warned = false
end

function mod:OnWin()
	canEnable = false
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:Sapper()
	self:Message("sapper", L["sapper"], "Important", L["sapper_icon"], "Info")
	if warned then return end
	self:Bar("sapper", L["sapper"], 40, L["sapper_icon"])
end

do
	function mod:PreStage2()
		if not warned then
			warned = true
			self:Bar("warmup", self.displayName, 9, L["warmup_icon"])
			self:Message("warmup", CL["custom_sec"]:format(self.displayName, 9), "Positive", L["warmup_icon"])
		end
	end
	function mod:Stage2()
		self:StopBar(107588) -- Twilight Onslaught
		self:StopBar(L["sapper"])
		self:Bar(108046, "~"..self:SpellName(108046), 14, 108046) -- Shockwave
		self:Message("warmup", CL["phase"]:format(2) .. ": " .. self.displayName, "Positive", L["warmup_icon"])
		if not self:LFR() then
			self:Berserk(240, true)
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
				mod:Say(spellId)
				mod:Flash(spellId)
				mod:Message(spellId, spellId, "Personal", spellId, "Long") -- Twilight Flames
			end
			mod:PrimaryIcon(spellId, player)
		end
	end
	function mod:TwilightFlames(args)
		self:ScheduleTimer(checkTarget, 0.1, args.sourceGUID, args.spellId)
	end
end

function mod:TwilightOnslaught(args)
	self:Message(args.spellId, args.spellName, "Urgent", args.spellId, "Alarm")
	onslaughtCounter = onslaughtCounter + 1
	if warned then return end
	self:Bar(args.spellId, ("%s (%d)"):format(args.spellName, onslaughtCounter), 35, args.spellId)
end

do
	local timer, fired = nil, 0
	local function shockWarn(spellId)
		fired = fired + 1
		local player = UnitName("boss2target")
		if player and (not UnitDetailedThreatSituation("boss2target", "boss2") or fired > 11) then
			-- If we've done 12 (0.6s) checks and still not passing the threat check, it's probably being cast on the tank
			mod:TargetMessage(spellId, spellId, player, "Attention", spellId, "Alarm") -- Shockwave
			mod:CancelTimer(timer)
			timer = nil
			if UnitIsUnit("boss2target", "player") then
				mod:Flash(spellId)
				mod:Say(spellId)
			end
			return
		end
		-- 19 == 0.95sec
		-- Safety check if the unit doesn't exist
		if fired > 18 then
			mod:CancelTimer(timer)
			timer = nil
		end
	end
	function mod:Shockwave(args)
		self:Bar(args.spellId, "~"..args.spellName, 23, args.spellId) -- 23-26
		fired = 0
		if not timer then
			timer = self:ScheduleRepeatingTimer(shockWarn, 0.05, args.spellId)
		end
	end
end

function mod:Sunder(args)
	local buffStack = args.amount or 1
	self:StopBar(L["sunder_message"]:format(args.destName, buffStack - 1))
	self:Bar("sunder", L["sunder_message"]:format(args.destName, buffStack), 30, args.spellId)
	self:Message("sunder", L["sunder_message"], "Urgent", args.spellId, buffStack > 2 and "Info" or nil, args.destName, buffStack)
end

function mod:Roar(args)
	self:Bar(args.spellId, "~"..args.spellName, 20, args.spellId) -- 20-23
	self:Message(args.spellId, args.spellName, "Positive", args.spellId, "Alert")
end

