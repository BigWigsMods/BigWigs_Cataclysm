--------------------------------------------------------------------------------
-- Module Declaration
--

local mod = BigWigs:NewBoss("Conclave of Wind", 773, 154)
if not mod then return end
mod:RegisterEnableMob(45870, 45871, 45872) -- Anshal, Nezir, Rohash

--------------------------------------------------------------------------------
-- Locals
--

local firstWindBlast = true
local toxicSporesWarned = false

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale("enUS", true)
if L then
	L.gather_strength = "%s is Gathering Strength"

	L.storm_shield = mod:SpellName(93059)
	L.storm_shield_desc = "Absorption Shield"

	L.full_power = "Full Power"
	L.full_power_desc = "Warning for when the bosses reach full power and start to cast the special abilities."
	L.gather_strength_emote = "%s begins to gather strength"

	L.wind_chill = "%sx Wind Chill on YOU!"
end
L = mod:GetLocale()

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		86193, "storm_shield",
		{84645, "FLASHSHAKE"},
		85422, 86281, 86205,
		86307, "full_power", "berserk", "bosskill"
	}, {
		[86193] = "ej:3172", -- Rohash
		[84645] = "ej:3178", -- Nezir
		[85422] = "ej:3166", -- Anshal
		[86307] = "general",
	}
end

function mod:OnBossEnable()
	self:Log("SPELL_CAST_SUCCESS", "FullPower", 84638)

	self:Emote("GatherStrength", L["gather_strength_emote"])

	self:Log("SPELL_AURA_APPLIED", "StormShield", 93059)
	self:Log("SPELL_CAST_SUCCESS", "WindBlast", 86193)
	self:Log("SPELL_AURA_APPLIED_DOSE", "WindChill", 84645)
	self:Log("SPELL_CAST_SUCCESS", "Nurture", 85422)
	self:Log("SPELL_AURA_APPLIED", "ToxicSpores", 86281)
	self:Log("SPELL_CAST_START", "SoothingBreeze", 86205)

	self:RegisterEvent("INSTANCE_ENCOUNTER_ENGAGE_UNIT", "CheckBossStatus")

	self:Death("Win", 45872) -- They die at the same time, enough to check for one
end

function mod:OnEngage()
	self:Berserk(480)
	firstWindBlast = true
	toxicSporesWarned = false
	self:Bar("full_power", L["full_power"], 90, 86193)
	self:Bar(86205, 86205, 16.2, 86205) -- Soothing Breeze

	local flag = BigWigs.C.BAR
	local stormShield, nurture, windBlast = self:SpellName(93059), self:SpellName(85422), self:SpellName(86193)
	if bit.band(self.db.profile.storm_shield, flag) == flag and bit.band(self.db.profile[nurture], flag) == flag and bit.band(self.db.profile[windBlast], flag) == flag then
		self:Bar(85422, nurture.."/"..windBlast.."/"..stormShield, 30, "achievement_boss_murmur")
	else
		self:Bar(85422, nurture, 30, 85422)
		self:Bar(86193, windBlast, 30, 86193)
		self:Bar("storm_shield", stormShield, 30, 93059)
	end
end

--------------------------------------------------------------------------------
-- Event Handlers
--
function mod:FullPower(args)
	self:Bar("full_power", L["full_power"], 113, args.spellId)
	self:Message("full_power", L["full_power"], "Attention", args.spellId)
	self:Bar(86205, 86205, 31.3, 86205) -- Soothing Breeze
end

function mod:WindChill(args)
	if UnitIsUnit(args.destName, "player") then
	-- probably need to adjust stack numbers
		if stack == 4 then
			self:LocalMessage(args.spellId, L["wind_chill"]:format(stack), "Personal", args.spellId)
		elseif stack == 8 then
			self:LocalMessage(args.spellId, L["wind_chill"]:format(stack), "Personal", args.spellId, "Alarm")
			self:FlashShake(args.spellId)
		end
	end
end

function mod:StormShield(args)
	self:Bar("storm_shield", args.spellName, 113, args.spellId)
	self:Message("storm_shield", args.spellName, "Urgent", args.spellId)
end

function mod:WindBlast(args)
	if firstWindBlast then
		self:Bar(args.spellId, args.spellName, 82, args.spellId)
		self:Message(args.spellId, args.spellName, "Important", args.spellId)
		firstWindBlast = false
	else
		self:Bar(args.spellId, args.spellName, 60, args.spellId)
		self:Message(args.spellId, args.spellName, "Important", args.spellId)
	end
end

function mod:ToxicSpores(args)
	if not toxicSporesWarned then
		self:Bar(args.spellId, args.spellName, 20, args.spellId)
		self:Message(args.spellId, args.spellName, "Urgent", args.spellId)
		toxicSporesWarned = true
	end
end

function mod:SoothingBreeze(args)
	self:Bar(args.spellId, args.spellName, 32.5, args.spellId)
	self:Message(args.spellId, args.spellName, "Urgent", args.spellId)
end

function mod:Nurture(args)
	self:Bar(args.spellId, args.spellName, 113, args.spellId)
	self:Message(args.spellId, args.spellName, "Urgent", args.spellId)
	self:Bar(86281, 86281, 23, 86281) -- Toxic Spores
	toxicSporesWarned = false
end

function mod:GatherStrength(msg, sender)
	self:Message(86307, L["gather_strength"]:format(sender), "Important", 86307, "Long")
	self:Bar(86307, L["gather_strength"]:format(sender), 60, 86307)
end

