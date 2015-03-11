--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Atramedes", 754, 171)
if not mod then return end
mod:RegisterEnableMob(41442)

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale("enUS", true)
if L then
	L.ground_phase = "Ground Phase"
	L.ground_phase_desc = "Warning for when Atramedes lands."
	L.air_phase = "Air Phase"
	L.air_phase_desc = "Warning for when Atramedes takes off."

	L.air_phase_trigger = "Yes, run! With every step your heart quickens."

	L.obnoxious_soon = "Obnoxious Fiend soon!"

	L.searing_soon = "Searing Flame in 10sec!"
end
L = mod:GetLocale()

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		"ground_phase", 78075, 77840,
		"air_phase",
		{92677, "ICON", "SAY"},
		{78092, "FLASH", "ICON", "SAY"}, "berserk"
	}, {
		ground_phase = L["ground_phase"],
		air_phase = L["air_phase"],
		[92677] = "heroic",
		[78092] = "general"
	}
end

function mod:OnBossEnable()
	self:Log("SPELL_CAST_SUCCESS", "SonicBreath", 78075)
	self:Log("SPELL_AURA_APPLIED", "Tracking", 78092)
	self:Log("SPELL_AURA_APPLIED", "SearingFlame", 77840)
	self:Yell("AirPhase", L["air_phase_trigger"])

	self:Log("SPELL_AURA_APPLIED", "ObnoxiousPhaseShift", 92681)

	self:RegisterEvent("INSTANCE_ENCOUNTER_ENGAGE_UNIT", "CheckBossStatus")

	self:Death("Win", 41442)
end

function mod:OnEngage()
	self:CDBar(78075, 23) -- Sonic Breath
	self:Bar(77840, 45) -- Searing Flame
	self:DelayedMessage(77840, 35, "Attention", L["searing_soon"], 77840)
	self:Bar("air_phase", 92, L["air_phase"], 5740) -- Rain of Fire Icon
	if self:Heroic() then
		self:RegisterEvent("UNIT_AURA")
		self:Berserk(600)
	end
end

--------------------------------------------------------------------------------
-- Event Handlers
--

do
	local function FiendCheck(dGUID)
		local fiend = mod:GetUnitIdByGUID(dGUID)
		if not fiend then
			mod:ScheduleTimer(FiendCheck, 0.1, dGUID)
		else
			mod:SecondaryIcon(92677, fiend)
		end
	end
	function mod:ObnoxiousPhaseShift(args)
		self:Message(92677, "Attention", nil, L["obnoxious_soon"]) -- do we really need this?
		FiendCheck(args.destGUID)
		self:RegisterEvent("UNIT_AURA")
	end
end

do
	local pestered = mod:SpellName(92685)
	function mod:UNIT_AURA(_, unit)
		if UnitDebuff(unit, pestered) then
			if unit == "player" then
				self:Say(92677)
			end
			self:TargetMessage(92677, UnitName(unit), "Attention", "Long") -- Obnoxious
			self:UnregisterEvent("UNIT_AURA")
		end
	end
end

function mod:Tracking(args)
	if self:Me(args.destGUID) then
		self:Say(args.spellId)
		self:Flash(args.spellId)
	end
	self:TargetMessage(args.spellId, args.destName, "Personal", "Alarm")
	self:PrimaryIcon(args.spellId, args.destName)
end

function mod:SonicBreath(args)
	self:CDBar(args.spellId, 42)
end

function mod:SearingFlame(args)
	self:Message(args.spellId, "Important", "Alert")
end

do
	local function groundPhase()
		mod:Message("ground_phase", "Attention", nil, L["ground_phase"], 61882) -- Earthquake Icon
		mod:Bar("air_phase", 90, L["air_phase"], 5740) -- Rain of Fire Icon
		mod:CDBar(78075, 25)
		-- XXX need a good trigger for ground phase start to make this even more accurate
		mod:Bar(77840, 48.5) -- Searing Flame
		mod:DelayedMessage(77840, 38.5, "Attention", L["searing_soon"], 77840)
	end
	function mod:AirPhase()
		self:StopBar(78075) -- Sonic Breath
		self:Message("air_phase", "Attention", nil, L["air_phase"], 5740) -- Rain of Fire Icon
		self:Bar("ground_phase", 30, L["ground_phase"], 61882) -- Earthquake Icon
		self:ScheduleTimer(groundPhase, 30)
	end
end

