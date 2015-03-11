--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Beth'tilac", 800, 192)
if not mod then return end
mod:RegisterEnableMob(52498)

--------------------------------------------------------------------------------
-- Locals
--

local devastateCount = 1
local lastBroodlingTarget = ""

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale("enUS", true)
if L then
	L.flare = mod:SpellName(99859)
	L.flare_desc = "Show a timer bar for AoE flare."
	L.flare_icon = 99859

	L.drone = -2773 -- Cinderweb Drone
	L.drone_icon = "INV_Misc_Head_Nerubian_01"

	L.spinner = -2770 -- Cinderweb Spinner
	L.spinner_icon = "spell_fire_moltenblood"

	L.devastate_message = "Devastate #%d"
	L.drone_bar = "Drone"
	L.drone_message = "Drone incoming!"
	L.kiss_message = "Kiss"
	L.spinner_warn = "Spinners #%d"
end
L = mod:GetLocale()

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		{99052, "FLASH"}, "drone", "spinner",
		99506, 99497, "flare",
		{99559, "FLASH"}, {99990, "FLASH", "SAY"},
	}, {
		[99052] = -2764,
		[99506] = -2782,
		[99559] = "heroic",
	}
end

function mod:OnBossEnable()
	self:Log("SPELL_DAMAGE", "BroodlingWatcher", "*")
	self:Log("SPELL_MISSED", "BroodlingWatcher", "*")

	self:Log("SPELL_AURA_APPLIED", "Fixate", 99559, 99526)
	self:Log("SPELL_AURA_APPLIED", "Frenzy", 99497)
	self:Log("SPELL_AURA_APPLIED", "Kiss", 99506)
	self:Log("SPELL_CAST_START", "Devastate", 99052)
	self:Log("SPELL_CAST_SUCCESS", "Flare", 99859)

	self:RegisterEvent("INSTANCE_ENCOUNTER_ENGAGE_UNIT", "CheckBossStatus")

	self:Death("Win", 52498)
end

function mod:OnEngage()
	devastateCount = 1
	lastBroodlingTarget = ""
	local devastate = L["devastate_message"]:format(1)
	self:Message(99052, "Positive", nil, CL["custom_start_s"]:format(self.displayName, devastate, 80), "inv_misc_monsterspidercarapace_01")
	self:Bar(99052, 80, devastate)
	self:Bar("drone", 45, L["drone_bar"], L["drone_icon"])
	self:Bar("spinner", 12, L["spinner_warn"]:format(1), L["spinner_icon"])
	self:Bar("spinner", 24, L["spinner_warn"]:format(2), L["spinner_icon"])
	self:Bar("spinner", 35, L["spinner_warn"]:format(3), L["spinner_icon"])
	self:DelayedMessage("spinner", 12, "Positive", L["spinner_warn"]:format(1), L["spinner_icon"])
	self:DelayedMessage("spinner", 24, "Positive", L["spinner_warn"]:format(2), L["spinner_icon"])
	self:DelayedMessage("spinner", 35, "Positive", L["spinner_warn"]:format(3), L["spinner_icon"])
	self:ScheduleTimer("DroneLooper", 45)
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:DroneLooper()
	self:Message("drone", "Attention", "Info", L["drone_message"], L["drone_icon"])
	self:Bar("drone", 60, L["drone_bar"], L["drone_icon"])
	self:ScheduleTimer("DroneLooper", 60)
end

function mod:BroodlingWatcher()
	if not self:Heroic() then return end
	local broodling = self:GetUnitIdByGUID(53745)
	if broodling and UnitExists(broodling.."target") and UnitExists(lastBroodlingTarget) then
		if UnitIsUnit(broodling.."target", lastBroodlingTarget) then return end
		lastBroodlingTarget = UnitName(broodling.."target")
		self:TargetMessage(99990, lastBroodlingTarget, "Important", "Alert") -- Volatile Burst
		if UnitIsUnit(lastBroodlingTarget, "player") then
			self:Flash(99990)
			self:Say(99990)
		end
	end
end

function mod:Fixate(args)
	if not UnitIsPlayer(args.destName) then return end --Affects the NPC and a player
	self:TargetMessage(99559, args.destName, "Attention", "Alarm", args.spellId)
	if self:Me(args.destGUID) then
		self:Flash(99559)
	end
end

function mod:Frenzy(args)
	self:CancelAllTimers()
	self:StopBar(L["drone_bar"])
	self:Message(args.spellId, "Positive", "Alarm", CL["phase"]:format(2))
end

function mod:Kiss(args)
	self:TargetMessage(args.spellId, args.destName, "Urgent", nil, L["kiss_message"])
	self:Bar(args.spellId, 31.5, L["kiss_message"])
	self:PlaySound(args.spellId, "Info")
end

function mod:Devastate(args)
	local hasDebuff = UnitDebuff("player", self:SpellName(100048)) -- Fiery Web Silk
	if hasDebuff then
		local devastate = L["devastate_message"]:format(devastateCount)
		self:Message(args.spellId, "Important", "Long", devastate)
		self:Bar(args.spellId, 8, CL["cast"]:format(devastate))
		self:Flash(args.spellId)
	else
		self:Message(args.spellId, "Attention", nil, L["devastate_message"]:format(devastateCount))
	end
	devastateCount = devastateCount + 1
	-- This timer is only accurate if you dont fail with the Drones
	-- Might need to use the bosses power bar or something to adjust this
	if devastateCount > 3 then return end
	self:Bar(args.spellId, 90, L["devastate_message"]:format(devastateCount))
	self:Bar("spinner", 20, L["spinner_warn"]:format(1), L["spinner_icon"])
	self:Bar("spinner", 29, L["spinner_warn"]:format(2), L["spinner_icon"])
	self:Bar("spinner", 40, L["spinner_warn"]:format(3), L["spinner_icon"])
	self:DelayedMessage("spinner", 20, "Positive", L["spinner_warn"]:format(1), L["spinner_icon"])
	self:DelayedMessage("spinner", 29, "Positive", L["spinner_warn"]:format(2), L["spinner_icon"])
	self:DelayedMessage("spinner", 40, "Positive", L["spinner_warn"]:format(3), L["spinner_icon"])
end

function mod:Flare(args)
	self:Bar("flare", 6, args.spellId)
end

