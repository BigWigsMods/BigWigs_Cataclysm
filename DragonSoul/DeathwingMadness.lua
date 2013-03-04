--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Madness of Deathwing", 824, 333)
if not mod then return end
-- Thrall, Deathwing, Arm Tentacle, Arm Tentacle, Wing Tentacle, Mutated Corruption
mod:RegisterEnableMob(56103, 56173, 56167, 56846, 56168, 56471)

local canEnable = true
local curPercent = 100
local paraCount = 0

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale("enUS", true)
if L then
	L.engage_trigger = "You have done NOTHING. I will tear your world APART."

	L.impale, L.impale_desc = EJ_GetSectionInfo(4114)
	L.impale_icon = 106400

	L.last_phase = mod:SpellName(106708)
	L.last_phase_desc = EJ_GetSectionInfo(4046)
	L.last_phase_icon = 106834

	L.bigtentacle, L.bigtentacle_desc = EJ_GetSectionInfo(4112)
	L.bigtentacle_icon = 105563

	L.smalltentacles = EJ_GetSectionInfo(4103)
	-- Copy & Paste from Encounter Journal with correct health percentages (type '/dump EJ_GetSectionInfo(4103)' in the game)
	L.smalltentacles_desc = "At 70% and 40% remaining health the Limb Tentacle sprouts several Blistering Tentacles that are immune to Area of Effect abilities."
	L.smalltentacles_icon = 105444

	L.hemorrhage, L.hemorrhage_desc = EJ_GetSectionInfo(4108)
	L.hemorrhage_icon = "SPELL_FIRE_MOLTENBLOOD"

	L.fragment, L.fragment_desc = EJ_GetSectionInfo(4115)
	L.fragment_icon = 105563

	L.terror, L.terror_desc = EJ_GetSectionInfo(4117)
	L.terror_icon = "ability_tetanus"

	L.bolt_explode = "<Bolt Explodes>"
	L.parasite = "Parasite"
	L.blobs_soon = "%d%% - Congealing Blood soon!"
end
L = mod:GetLocale()

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		"bigtentacle", "impale", "smalltentacles", {105651, "FLASH"}, "hemorrhage", 106523,
		"last_phase", "fragment", {106794, "FLASH"}, "terror",
		{-4347, "FLASH", "ICON", "PROXIMITY", "SAY"}, -4351,
		"berserk", "bosskill",
	}, {
		bigtentacle = -4040,
		last_phase = -4046,
		[-4347] = "heroic",
		berserk = "general",
	}
end

function mod:VerifyEnable()
	return canEnable
end

function mod:OnBossEnable()
	self:RegisterUnitEvent("UNIT_SPELLCAST_SUCCEEDED", nil, "boss1", "boss2", "boss3", "boss4")
	self:RegisterEvent("INSTANCE_ENCOUNTER_ENGAGE_UNIT", "CheckBossStatus")

	self:Log("SPELL_CAST_SUCCESS", "ElementiumBolt", 105651)
	self:Log("SPELL_CAST_SUCCESS", "Impale", 106400)
	self:Log("SPELL_CAST_SUCCESS", "AgonizingPain", 106548)
	self:Log("SPELL_CAST_START", "AssaultAspects", 107018)
	self:Log("SPELL_CAST_START", "Cataclysm", 106523)
	self:Log("SPELL_AURA_APPLIED", "LastPhase", 106834) -- Phase 2: Corrupted Blood
	self:Log("SPELL_AURA_APPLIED", "Shrapnel", 106794)
	self:Log("SPELL_AURA_APPLIED", "Parasite", 108649)
	self:Log("SPELL_AURA_REMOVED", "ParasiteRemoved", 108649)

	self:Yell("Engage", L["engage_trigger"])
	self:Log("SPELL_CAST_SUCCESS", "Win", 110063) -- Astral Recall
	self:Death("TentacleKilled", 56471)
end

function mod:OnEngage()
	curPercent = 100
	self:Berserk(900)
end

function mod:OnWin()
	canEnable = false
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:Impale(args)
	self:Message("impale", args.spellName, "Urgent", args.spellId, "Alarm")
	self:Bar("impale", args.spellName, 35, args.spellId)
end

function mod:TentacleKilled()
	self:StopBar(106400) -- Impale
	self:StopBar(L["parasite"])
end

do
	local fragment = mod:SpellName(106775)
	local hemorrhage = mod:SpellName(105863)
	function mod:UNIT_SPELLCAST_SUCCEEDED(unit, spellName, _, _, spellId)
		if spellName == hemorrhage then
			self:Message("hemorrhage", spellName, "Urgent", L["hemorrhage_icon"], "Alarm")
		elseif spellName == fragment then
			self:Message("fragment", L["fragment"], "Urgent", L["fragment_icon"], "Alarm")
			self:Bar("fragment", L["fragment"], 90, L["fragment_icon"])
		elseif spellId == 105551 then
			local hp = UnitHealth(unit) / UnitHealthMax(unit) * 100
			self:Message("smalltentacles", ("%d%% - %s"):format(hp > 50 and 70 or 40, L["smalltentacles"]), "Urgent", L["smalltentacles_icon"], "Alarm")
		elseif spellId == 106765 then
			self:Message("terror", L["terror"], "Important", L["terror_icon"])
			self:Bar("terror", L["terror"], 90, L["terror_icon"])
		end
	end
end

function mod:LastPhase(args)
	self:Message("last_phase", EJ_GetSectionInfo(4046), "Attention", args.spellId) -- Stage 2: The Last Stand
	self:Bar("fragment", L["fragment"], 10.5, L["fragment_icon"])
	self:Bar("terror", L["terror"], 35.5, L["terror_icon"])
	if self:Heroic() then
		self:RegisterUnitEvent("UNIT_HEALTH_FREQUENT", "BlobsWarn", "boss1")
	end
end

function mod:AssaultAspects()
	paraCount = 0
	if curPercent == 100 then
		curPercent = 20
		self:Bar("impale", 106400, 22, 106400) -- Impale
		self:Bar(105651, 105651, 40.5, 105651) -- Elementium Bolt
		if self:Heroic() then
			self:Bar("hemorrhage", 105863, 55.5, 105863) -- Hemorrhage
			self:Bar(-4347, L["parasite"], 11, 108649)
		else
			self:Bar("hemorrhage", 105863, 85.5, 105863) -- Hemorrhage
		end
		self:Bar(106523, 106523, 175, 106523) -- Cataclysm
		self:Bar("bigtentacle", L["bigtentacle"], 11.2, L["bigtentacle_icon"])
		self:DelayedMessage("bigtentacle", 11.2, L["bigtentacle"] , "Urgent", L["bigtentacle_icon"], "Alert")
	else
		self:Bar("impale", 106400, 27.5, 106400) -- Impale
		self:Bar(105651, 105651, 55.5, 105651) -- Elementium Bolt
		if self:Heroic() then
			self:Bar("hemorrhage", 105863, 70.5, 105863) -- Hemorrhage
			self:Bar(-4347, L["parasite"], 22.5, 108649)
		else
			self:Bar("hemorrhage", 105863, 100.5, 105863) -- Hemorrhage
		end
		self:Bar(106523, 106523, 190, 106523) -- Cataclysm
		self:Bar("bigtentacle", L["bigtentacle"], 16.7, L["bigtentacle_icon"])
		self:DelayedMessage("bigtentacle", 16.7, L["bigtentacle"] , "Urgent", L["bigtentacle_icon"], "Alert")
	end
end

function mod:ElementiumBolt(args)
	self:Flash(args.spellId)
	self:Message(args.spellId, args.spellName, "Important", args.spellId, "Long")
	self:Bar(args.spellId, L["bolt_explode"], UnitBuff("player", self:SpellName(110628)) and 18 or 8, args.spellId)
end

function mod:Cataclysm(args)
	self:Message(args.spellId, args.spellName, "Attention", args.spellId)
	self:StopBar(args.spellName)
	self:Bar(args.spellId, CL["cast"]:format(args.spellName), 60, args.spellId)
end

function mod:AgonizingPain()
	self:StopBar(CL["cast"]:format(self:SpellName(106523)))
end

function mod:Shrapnel(args)
	if self:Me(args.destGUID) then
		local you = CL["you"]:format(args.spellName)
		self:Message(106794, you, "Important", args.spellId, "Long")
		self:Flash(106794)
		self:Bar(106794, you, 7, args.spellId)
	end
end

function mod:Parasite(args)
	paraCount = paraCount + 1
	self:TargetMessage(-4347, L["parasite"], args.destName, "Urgent", args.spellId)
	self:PrimaryIcon(-4347, args.destName)
	if self:Me(args.destGUID) then
		self:Flash(-4347)
		self:Bar(-4347, CL["you"]:format(L["parasite"]), 10, args.spellId)
		self:OpenProximity(-4347, 10)
		self:Say(-4347, L["parasite"])
	else
		self:Bar(-4347, CL["other"]:format(L["parasite"], args.destName), 10, args.spellId)
	end
	if paraCount < 2 then
		self:Bar(-4347, L["parasite"], 60, 108649)
	end
end

function mod:ParasiteRemoved(args)
	self:PrimaryIcon(-4347)
	if self:Me(args.destGUID) then
		self:CloseProximity(-4347)
	end
end

function mod:BlobsWarn(unitId)
	local hp = UnitHealth(unitId) / UnitHealthMax(unitId) * 100
	if hp > 14.9 and hp < 16 and curPercent == 20 then
		self:Message(-4351, L["blobs_soon"]:format(15), "Positive", "ability_deathwing_bloodcorruption_earth", "Info")
		curPercent = 15
	elseif hp > 9.9 and hp < 11 and curPercent == 15 then
		self:Message(-4351, L["blobs_soon"]:format(10), "Positive", "ability_deathwing_bloodcorruption_earth", "Info")
		curPercent = 10
	elseif hp > 4.9 and hp < 6 and curPercent == 10 then
		self:Message(-4351, L["blobs_soon"]:format(5), "Positive", "ability_deathwing_bloodcorruption_earth", "Info")
		curPercent = 5
		self:UnregisterUnitEvent("UNIT_HEALTH_FREQUENT", unitId)
	end
end

