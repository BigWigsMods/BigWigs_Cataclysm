--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Sinestra", 758, 168)
if not mod then return end
mod:RegisterEnableMob(45213)

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale("enUS", true)
if L then
	L.whelps = "Whelps"
	L.whelps_desc = "Warning for the whelp waves."

	L.slicer_message = "Possible Orb targets"

	L.egg_vulnerable = "Omelet time!"

	L.whelps_trigger = "Feed, children!" -- Feed, children!  Take your fill from their meaty husks!
	L.omelet_trigger = "You mistake this for weakness?" -- You mistake this for weakness?  Fool!

	L.phase13 = "Phase 1 and 3"
	L.phase = "Phase"
	L.phase_desc = "Warning for phase changes."
end
L = mod:GetLocale()

--------------------------------------------------------------------------------
-- Locals
--

local roleCheckWarned = nil
local eggs = 0
local orbList = {}
local orbWarned = nil
local playerInList = nil
local whelpGUIDs = {}

local function isTank(unit)
	-- 1. check blizzard tanks first
	-- 2. check blizzard roles second
	if GetPartyAssignment("MAINTANK", unit, 1) then
		return true
	end
	if UnitGroupRolesAssigned(unit) == "TANK" then
		return true
	end
	return false
end

local function isTargetableByOrb(unit)
	-- check tanks
	if isTank(unit) then return false end
	-- check sinestra's target too
	if UnitIsUnit("boss1target", unit) then return false end
	-- and maybe do a check for whelp targets
	for k, v in pairs(whelpGUIDs) do
		local whelp = mod:GetUnitIdByGUID(k)
		if whelp then
			if UnitIsUnit(whelp.."target", unit) then return false end
		end
	end
	return true
end

local function populateOrbList()
	wipe(orbList)
	local _, _, _, zone = UnitPosition("player")
	for unit in mod:IterateGroup() do
		local _, _, _, targetZone = UnitPosition(unit)
		if zone == targetZone then -- Don't warn for ppl who are not in the instance
			-- Tanking something, but not a tank (aka not tanking Sinestra or Whelps)
			if UnitThreatSituation(unit) == 3 and isTargetableByOrb(unit) then
				if UnitIsUnit(unit, "player") then
					playerInList = true
				end
				-- orbList is not created by :NewTargetList
				-- so we don't have to decolorize when we set icons,
				-- instead we colorize targets in the module
				orbList[#orbList + 1] = mod:UnitName(unit)
			end
		end
	end
end

local function wipeWhelpList(resetWarning)
	if resetWarning then orbWarned = nil end
	playerInList = nil
	wipe(whelpGUIDs)
end

-- since we don't use :NewTargetList we have to color the targets
local hexColors = {}
for k, v in pairs(CUSTOM_CLASS_COLORS or RAID_CLASS_COLORS) do
	hexColors[k] = "|cff" .. string.format("%02x%02x%02x", v.r * 255, v.g * 255, v.b * 255)
end

local function colorize(tbl)
	for i, v in next, tbl do
		local _, class = UnitClass(v)
		if class then
			tbl[i] = hexColors[class] .. v .. "|r"
		end
	end
	return tbl
end

local function orbWarning(source)
	if playerInList then mod:Flash(92852) end

	-- this is why orbList can't be created by :NewTargetList
	if orbList[1] then mod:PrimaryIcon(92852, orbList[1]) end
	if orbList[2] then mod:SecondaryIcon(92852, orbList[2]) end

	if source == "spawn" then
		if #orbList > 0 then
			mod:TargetMessage(92852, colorize(orbList), "Personal", "Alarm", L["slicer_message"])
			-- if we could guess orb targets lets wipe the whelpGUIDs in 5 sec
			-- if not then we might as well just save them for next time
			mod:ScheduleTimer(wipeWhelpList, 5) -- might need to adjust this
		else
			mod:Message(92852, "Personal")
		end
	elseif source == "damage" then
		mod:TargetMessage(92852, colorize(orbList), "Personal", "Alarm", L["slicer_message"])
		mod:ScheduleTimer(wipeWhelpList, 10, true) -- might need to adjust this
	end
end

-- this gets run every 30 sec
-- need to change it once there is a proper trigger for orbs
local function nextOrbSpawned()
	mod:CDBar(92852, 28)
	populateOrbList()
	orbWarning("spawn")
	mod:ScheduleTimer(nextOrbSpawned, 28)
end

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions(CL)
	return {
	-- Phase 1 and 3
		90125, -- Breath
		{92852, "FLASH", "ICON"}, -- Twilight Slicer
		86227, -- Extinction
		"whelps",

	-- Phase 2
		87654, -- Omelet Time
		{90045, "FLASH"}, -- Indomitable

	-- General
		"phase",
	}, {
		[90125] = L["phase13"],
		[87654] = CL["phase"]:format(2),
		phase = "general",
	}
end

function mod:OnBossEnable()
	if not roleCheckWarned and (UnitIsGroupLeader("player") or UnitIsGroupAssistant("player")) then
		BigWigs:Print("It is recommended that your raid has proper main tanks set for this encounter to improve orb target detection.")
		roleCheckWarned = true
	end

	self:Log("SPELL_DAMAGE", "OrbDamage", 92852, 92958) -- twilight slicer, twilight pulse [May be wrong since MoP id changes]
	self:Log("SPELL_MISSED", "OrbDamage", 92852, 92958) -- twilight slicer, twilight pulse [May be wrong since MoP id changes]

	self:Log("SWING_DAMAGE", "WhelpWatcher", "*")
	self:Log("SWING_MISS", "WhelpWatcher", "*")

	self:Log("SPELL_CAST_START", "Breath", 90125)

	self:Log("SPELL_AURA_REMOVED", "Egg", 87654)
	self:Log("SPELL_AURA_APPLIED", "Indomitable", 90045)
	self:Log("SPELL_CAST_START", "Extinction", 86227)

	self:Yell("EggTrigger", L["omelet_trigger"])
	self:Yell("Whelps", L["whelps_trigger"])

	self:RegisterEvent("INSTANCE_ENCOUNTER_ENGAGE_UNIT", "CheckBossStatus")

	self:Death("Win", 45213)
	self:Death("TwilightEggDeaths", 46842) -- Pulsing Twilight Egg
end

function mod:OnEngage()
	self:CDBar(90125, 24) -- Slicer
	self:CDBar(92852, 29) -- Breath
	self:Bar("whelps", 16, L["whelps"], 69005) -- whelp like icon
	self:ScheduleTimer(nextOrbSpawned, 29)
	eggs = 0
	self:RegisterUnitEvent("UNIT_HEALTH_FREQUENT", "PhaseWarn", "boss1")
	wipe(whelpGUIDs)
	orbWarned = nil
	playerInList = nil
end

--------------------------------------------------------------------------------
-- Event Handlers
--

do
	local whelpIds = {
		47265,
		48047,
		48048,
		48049,
		48050,
	}
	function mod:WhelpWatcher(args)
		local mobId = self:MobId(args.sourceGUID)
		for i, v in next, whelpIds do
			if mobId == v then whelpGUIDs[args.sourceGUID] = true end
		end
	end
end

function mod:OrbDamage()
	populateOrbList()
	if orbWarned then return end
	orbWarned = true
	orbWarning("damage")
end

function mod:Whelps()
	self:Bar("whelps", 50, L["whelps"], 69005)
	self:Message("whelps", "Important", nil, L["whelps"], 69005)
end

function mod:Extinction(args)
	self:Bar(args.spellId, 15)
end

do
	local scheduled = nil
	local function EggMessage(spellId)
		mod:Message(spellId, "Important", "Alert", L["egg_vulnerable"])
		mod:Bar(spellId, 30, L["egg_vulnerable"])
		scheduled = nil
	end
	function mod:Egg(args)
		if not scheduled then
			scheduled = true
			self:ScheduleTimer(EggMessage, 0.1, args.spellId)
		end
	end
end

function mod:EggTrigger()
	self:Bar(87654, 5, L["egg_vulnerable"], 87654)
end

function mod:Indomitable(args)
	self:Message(args.spellId, "Urgent")
	if self:Dispeller("enrage", true) then
		self:PlaySound(args.spellId, "Info")
		self:Flash(args.spellId)
	end
end

function mod:PhaseWarn(unit)
	local hp = UnitHealth(unit) / UnitHealthMax(unit) * 100
	if hp <= 30.5 then
		self:Message("phase", "Positive", "Info", CL["phase"]:format(2), 86226)
		self:UnregisterUnitEvent("UNIT_HEALTH_FREQUENT", unit)
		self:CancelAllTimers()
		self:StopBar(92852) -- Slicer
		self:StopBar(90125) -- Breath
	end
end

function mod:Breath(args)
	self:CDBar(args.spellId, 24)
	self:Message(args.spellId, "Urgent")
end

function mod:TwilightEggDeaths()
	eggs = eggs + 1
	if eggs == 2 then
		self:Message("phase", "Positive", "Info", CL["phase"]:format(3), 51070) -- broken egg icon
		self:Bar("whelps", 50, L["whelps"], 69005)
		self:CDBar(92852, 30) -- Slicer
		self:CDBar(90125, 24) -- Breath
		self:ScheduleTimer(nextOrbSpawned, 30)
	end
end

