--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Ultraxion", 824, 331)
if not mod then return end
mod:RegisterEnableMob(55294, 56667) -- Ultraxion, Thrall

--------------------------------------------------------------------------------
-- Locales
--

local hourCounter = 1

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale("enUS", true)
if L then
	L.engage_trigger = "Now is the hour of twilight!"

	L.warmup = "Warmup"
	L.warmup_desc = "Time until combat with the boss starts."
	L.warmup_icon = "achievment_boss_ultraxion"
	L.warmup_trigger = "I am the beginning of the end...the shadow which blots out the sun"

	L.crystal = "Buff Crystals"
	L.crystal_desc = "Timers for the various buff crystals the NPCs summon."
	L.crystal_icon = "inv_misc_head_dragon_01"
	L.crystal_red = "Red Crystal"
	L.crystal_green = "Green Crystal"
	L.crystal_green_icon = "inv_misc_head_dragon_green"
	L.crystal_blue = "Blue Crystal"
	L.crystal_blue_icon = "inv_misc_head_dragon_blue"
	L.crystal_bronze_icon = "inv_misc_head_dragon_bronze"

	L.twilight = "Twilight"
	L.cast = "Twilight Cast Bar"
	L.cast_desc = "Show a 5 (Normal) or 3 (Heroic) second bar for Twilight being cast."
	L.cast_icon = 106371

	L.lightself = "Fading Light on You"
	L.lightself_desc = "Show a bar displaying the time left until Fading Light causes you to explode."
	L.lightself_bar = "<You Explode>"
	L.lightself_icon = 105925

	L.lighttank = "Fading Light on Tanks"
	L.lighttank_desc = "If a tank has Fading Light, show an explode bar and Flash/Shake."
	L.lighttank_bar = "<%s Explodes>"
	L.lighttank_message = "Exploding Tank"
	L.lighttank_icon = 105925
end
L = mod:GetLocale()

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions(CL)
	return {
		{106371, "FLASH"}, "cast",
		105925, {"lightself", "FLASH"}, {"lighttank", "FLASH", "TANK"},
		"warmup", "crystal", "berserk", "bosskill",
	}, {
		[106371] = L["twilight"],
		[105925] = mod:SpellName(105925),
		warmup = CL["general"],
	}
end

function mod:OnBossEnable()
	self:Log("SPELL_CAST_START", "HourofTwilight", 106371)
	self:Log("SPELL_AURA_APPLIED", "FadingLight", 109075, 105925) -- Normal/Tank

	self:RegisterEvent("INSTANCE_ENCOUNTER_ENGAGE_UNIT", "CheckBossStatus")

	self:Yell("Warmup", L["warmup_trigger"])
	self:Emote("Gift", L["crystal_icon"])
	self:Emote("Dreams", L["crystal_green_icon"])
	self:Emote("Magic", L["crystal_blue_icon"])
	self:Emote("Loop", L["crystal_bronze_icon"])

	self:Death("Win", 55294)
end

function mod:Warmup()
	self:Bar("warmup", self.displayName, 30, "achievment_boss_ultraxion")
end

function mod:OnEngage()
	self:Berserk(360)
	self:Bar(106371, 106371, 45, 106371) -- Hour of Twilight
	self:Bar("crystal", L["crystal_red"], 80, L["crystal_icon"])
	hourCounter = 1
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:Gift()
	self:Bar("crystal", L["crystal_green"], 75, L["crystal_green_icon"])
	self:Message("crystal", L["crystal_red"], "Positive", L["crystal_icon"], "Info")
end

function mod:Dreams()
	self:Bar("crystal", L["crystal_blue"], 60, L["crystal_blue_icon"])
	self:Message("crystal", L["crystal_green"], "Positive", L["crystal_green_icon"], "Info")
end

function mod:Magic()
	self:Bar("crystal", 105984, 75, L["crystal_bronze_icon"]) -- Timeloop
	self:Message("crystal", L["crystal_blue"], "Positive", L["crystal_blue_icon"], "Info")
end

function mod:Loop()
	self:Message("crystal", 105984, "Positive", L["crystal_bronze_icon"], "Info") -- Timeloop
end

function mod:HourofTwilight(args)
	self:Message(106371, ("%s (%d)"):format(args.spellName, hourCounter), "Important", args.spellId, "Alert")
	hourCounter = hourCounter + 1
	self:Bar(106371, ("%s (%d)"):format(args.spellName, hourCounter), 45, args.spellId)
	self:Bar("cast", CL["cast"]:format(L["twilight"]), self:Heroic() and 3 or 5, args.spellId)
	self:Flash(106371)
end

do
	local scheduled = nil
	local lightTargets = mod:NewTargetList()
	local function fadingLight(spellName)
		mod:TargetMessage(105925, spellName, lightTargets, "Attention", 105925, "Alarm")
		scheduled = nil
	end
	function mod:FadingLight(args)
		lightTargets[#lightTargets + 1] = args.destName
		if self:Me(args.destGUID) then
			local _, _, _, _, _, duration = UnitDebuff("player", args.spellName)
			self:Bar("lightself", L["lightself_bar"], duration, args.spellId)
			self:Flash("lightself", args.spellId)
		else -- This is mainly a tanking assist
			if args.spellId == 105925 then
				self:Flash("lighttank", args.spellId)
				local _, _, _, _, _, duration = UnitDebuff(args.destName, args.spellName)
				self:Bar("lighttank", L["lighttank_bar"]:format(args.destName), duration, args.spellId)
				self:Message("lighttank", L["lighttank_message"], "Attention", args.spellId, args.destName)
				self:PlaySound("lighttank", "Alarm")
			end
		end
		if not scheduled then
			scheduled = true
			self:ScheduleTimer(fadingLight, 0.2, args.spellName)
		end
	end
end

