--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Morchok", 824, 311)
if not mod then return end
mod:RegisterEnableMob(55265)

local kohcrom = EJ_GetSectionInfo(4262)
local crystalCount, stompCount = 0, 1

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale("enUS", true)
if L then
	L.engage_trigger = "You seek to halt an avalanche. I will bury you."

	L.stomp_boss, L.stomp_boss_desc = EJ_GetSectionInfo(3879)
	L.stomp_boss_icon = 103414
	L.crystal_boss, L.crystal_boss_desc = EJ_GetSectionInfo(3876)
	L.crystal_boss_icon = 103640

	L.stomp_add, L.stomp_add_desc = EJ_GetSectionInfo(3879)
	L.stomp_add_icon = 103414
	L.crystal_add, L.crystal_add_desc = EJ_GetSectionInfo(3876)
	L.crystal_add_icon = 103640

	L.crush = "Crush Armor"
	L.crush_desc = "Count the stacks of crush armor and show a duration bar."
	L.crush_icon = 103687
	L.crush_message = "%2$dx Crush on %1$s"

	L.blood = "Black Blood"

	L.explosion = "Explosion"
	L.crystal = "Crystal"
end
L = mod:GetLocale()

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		"stomp_boss", "crystal_boss",
		"stomp_add", "crystal_add",
		109017, {103851, "FLASH"}, {"crush", "TANK"}, 103846, "berserk", "bosskill",
	}, {
		stomp_boss = self.displayName,
		stomp_add = kohcrom,
		[109017] = "general",
	}
end

function mod:OnBossEnable()
	--Heroic
	self:Log("SPELL_CAST_SUCCESS", "SummonKohcrom", 109017)

	--Normal
	self:RegisterUnitEvent("UNIT_SPELLCAST_CHANNEL_STOP", "BloodOver", "boss1")
	self:Log("SPELL_CAST_START", "Stomp", 103414)
	self:Log("SPELL_CAST_START", "BlackBlood", 103851)
	self:Log("SPELL_AURA_APPLIED", "Furious", 103846)
	self:Log("SPELL_AURA_APPLIED", "Crush", 103687)
	self:Log("SPELL_AURA_APPLIED_DOSE", "Crush", 103687)
	self:Log("SPELL_AURA_APPLIED", "BlackBloodStacks", 103785)
	self:Log("SPELL_AURA_APPLIED_DOSE", "BlackBloodStacks", 103785)
	self:Log("SPELL_SUMMON", "ResonatingCrystal", 103639)

	self:RegisterEvent("INSTANCE_ENCOUNTER_ENGAGE_UNIT", "CheckBossStatus")

	self:Death("Win", 55265)
end

function mod:OnEngage()
	self:Berserk(420) -- confirmed
	self:Bar("stomp_boss", L["stomp_boss"], 11, L["stomp_boss_icon"])
	self:Bar("crystal_boss", L["crystal"], 16, L["crystal_boss_icon"])
	self:Bar(103851, "~"..L["blood"], 56, 103851)
	crystalCount, stompCount = 0, 1
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:SummonKohcrom(args)
	self:Bar("stomp_boss", "~"..self.displayName.." - "..L["stomp_boss"], 6, L["stomp_boss_icon"]) -- 6-12s
	self:Message(args.spellId, args.spellName, "Positive", args.spellId)
	self:StopBar(L["crystal"])
	self:StopBar("~"..L["stomp_boss"])
end

-- I know it's ugly to use this, but if we were to start bars at :BlackBlood then we are subject to BlackBlood duration changes
function mod:BloodOver(_, _, _, _, spellId)
	if spellId == 103851 then
		self:Bar(spellId, L["blood"], 75, spellId)
		crystalCount, stompCount = 0, 1
		if self:Heroic() then
			self:Bar("stomp_boss", "~"..self.displayName.." - "..L["stomp_boss"], 15, L["stomp_boss_icon"])
			self:Bar("crystal_boss", "~"..self.displayName.." - "..L["crystal"], 22, L["crystal_boss_icon"])
		else
			self:Bar("stomp_boss", "~"..L["stomp_boss"], 5, L["stomp_boss_icon"])
			self:Bar("crystal_boss", L["crystal"], 29, L["crystal_boss_icon"])
		end
	end
end

function mod:Stomp(args)
	if self:Heroic() and UnitExists("boss2") then -- Check if heroic and if kohncrom has spawned yet.
		if args.sourceName == kohcrom then
			self:Message("stomp_add", args.sourceName.." - "..args.spellName, "Important", args.spellId)
		else -- Since we trigger bars off morchok casts, we gotta make sure kohcrom isn't caster to avoid bad timers.
			self:Bar("stomp_add", "~"..kohcrom.." - "..args.spellName, (self:Difficulty() == 5) and 6 or 5, args.spellId) -- 6sec after on 10 man hc, 5 sec on 25
			self:Message("stomp_boss", args.sourceName.." - "..args.spellName, "Important", args.spellId)
			if stompCount < 4 then
				self:Bar("stomp_boss", "~"..args.sourceName.." - "..args.spellName, 12, args.spellId)
			end
			stompCount = stompCount + 1
		end
	else -- Not heroic, or Kohcrom isn't out yet, just do normal bar.
		if stompCount < 4 then
			self:Bar("stomp_boss", "~"..args.spellName, 12, args.spellId)
			self:Message("stomp_boss", args.spellName, "Important", args.spellId)
			stompCount = stompCount + 1
		end
	end
end

function mod:Furious(args)
	self:Message(args.spellId, args.spellName, "Positive", args.spellId) -- Positive?
end

do
	local prev = 0
	function mod:BlackBlood(args)
		local t = GetTime()
		if t-prev > 5 then
			prev = t
			self:Message(args.spellId, args.spellName, "Personal", args.spellId, "Long") -- not really personal, but we tend to associate personal with fns
			self:Bar(args.spellId, CL["cast"]:format(L["blood"]), 17, args.spellId)
		end
	end
end

do
	local prev = 0
	function mod:BlackBloodStacks(args)
		local t = GetTime()
		if t-prev > 2 and self:Me(args.destGUID) then
			prev = t
			self:Flash(103851)
			self:Message(103851, CL["underyou"]:format(L["blood"]), "Personal", args.spellId, "Long")
		end
	end
end

function mod:ResonatingCrystal(args)
	if args.sourceName == self.displayName then crystalCount = crystalCount + 1 end -- Only increment count off morchok casts.
	if self:Heroic() then
		self:Message((args.sourceName == kohcrom) and "crystal_add" or "crystal_boss", args.sourceName.." - "..L["crystal"], "Urgent", args.spellId, "Alarm")
		self:Bar((args.sourceName == kohcrom) and "crystal_add" or "crystal_boss", args.sourceName.." - "..(L["explosion"]), 12, args.spellId)
		if UnitExists("boss2") and crystalCount > 1 and args.sourceName == self.displayName then -- The CD bar will only start off morchok's 2nd crystal, if kohcrom is already summoned.
			self:Bar("crystal_add", "~"..kohcrom.." - "..L["crystal"], (self:Difficulty() == 5) and 6 or 5, args.spellId) -- Same as stomp, 6/5
		end
	else
		self:Message("crystal_boss", args.spellName, "Urgent", args.spellId, "Alarm")
		self:Bar("crystal_boss", L["explosion"], 12, args.spellId)
	end
end

function mod:Crush(args)
	local buffStack = args.amount or 1
	self:StopBar(L["crush_message"]:format(args.destName, buffStack - 1))
	self:Bar("crush", L["crush_message"]:format(args.destName, buffStack), 20, args.spellId)
	self:Message("crush", L["crush_message"], "Urgent", args.spellId, buffStack > 2 and "Info" or nil, args.destName, buffStack)
end

