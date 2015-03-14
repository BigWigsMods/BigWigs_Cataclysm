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
		{84645, "FLASH"},
		85422, 86281, 86205,
		86307, "full_power", "berserk"
	}, {
		[86193] = -3172, -- Rohash
		[84645] = -3178, -- Nezir
		[85422] = -3166, -- Anshal
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
	self:Bar("full_power", 90, L["full_power"], 86193)
	self:Bar(86205, 16.2) -- Soothing Breeze

	if self:CheckOption("storm_shield", "BAR") and self:CheckOption(85422, "BAR") and self:CheckOption(86193, "BAR") then
		local stormShield, nurture, windBlast = self:SpellName(93059), self:SpellName(85422), self:SpellName(86193)
		self:Bar(85422, 30, nurture.."/"..windBlast.."/"..stormShield, "achievement_boss_murmur")
	else
		self:Bar(85422, 30) -- Nurture
		self:Bar(86193, 30) -- Windblast
		self:Bar("storm_shield", 30, 93059)
	end
end

--------------------------------------------------------------------------------
-- Event Handlers
--
function mod:FullPower(args)
	self:Bar("full_power", 113, L["full_power"], args.spellId)
	self:Message("full_power", "Attention", nil, L["full_power"], args.spellId)
	self:Bar(86205, 31.3) -- Soothing Breeze
end

function mod:WindChill(args)
	if self:Me(args.destGUID) then
	-- probably need to adjust stack numbers
		if args.amount == 4 then
			self:Message(args.spellId, "Personal", nil, L["wind_chill"]:format(args.amount))
		elseif args.amount == 8 then
			self:Message(args.spellId, "Personal", "Alarm", L["wind_chill"]:format(args.amount))
			self:Flash(args.spellId)
		end
	end
end

function mod:StormShield(args)
	self:Bar("storm_shield", 113, args.spellId)
	self:Message("storm_shield", "Urgent", nil, args.spellId)
end

function mod:WindBlast(args)
	self:Bar(args.spellId, firstWindBlast and 82 or 60)
	self:Message(args.spellId, "Important")
	firstWindBlast = false
end

function mod:ToxicSpores(args)
	if not toxicSporesWarned then
		self:Bar(args.spellId, 20)
		self:Message(args.spellId, "Urgent")
		toxicSporesWarned = true
	end
end

function mod:SoothingBreeze(args)
	self:Bar(args.spellId, 32.5)
	self:Message(args.spellId, "Urgent")
end

function mod:Nurture(args)
	self:Bar(args.spellId, 113)
	self:Message(args.spellId, "Urgent")
	self:Bar(86281, 23) -- Toxic Spores
	toxicSporesWarned = false
end

function mod:GatherStrength(msg, sender)
	self:Message(86307, "Important", "Long", L["gather_strength"]:format(sender))
	self:Bar(86307, 60, L["gather_strength"]:format(sender))
end

