--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Maloriak", 669, 173)
if not mod then return end
mod:RegisterEnableMob(41378)
mod:SetEncounterID(1025)
mod:SetRespawnTime(30)
mod:SetStage(1)

--------------------------------------------------------------------------------
-- Locals
--

local addsRemaining = 18
local addsActive = 0
local addsDead = 0
local arcaneStormCount = 1
local acidNovaCount = 1
local scorchingBlastCounter = 1
local UpdateInfoBoxList

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:GetLocale()
if L then
	L["92754_desc"] = 92787 -- 92754 has no description

	L.flames = "Flames"
	L.dark_phase_emote_trigger = "dark"
end

--------------------------------------------------------------------------------
-- Initialization
--

local flashFreezeMarker = mod:AddMarkerOption(true, "npc", 8, 77699, 8) -- Flash Freeze
function mod:GetOptions()
	return {
		-- General
		"stages",
		77896, -- Arcane Storm
		{77912, "DISPEL"}, -- Remedy
		{77569, "INFOBOX"}, -- Release Aberrations
		"berserk",
		-- Stage 2
		78194, -- Magma Jets
		78225, -- Acid Nova
		78223, -- Absolute Zero
		-- Blue
		{77699, "SAY"}, -- Flash Freeze
		flashFreezeMarker,
		{77760, "SAY"}, -- Biting Chill
		-- Red
		{77786, "ICON", "ME_ONLY_EMPHASIZE"}, -- Consuming Flames
		77679, -- Scorching Blast
		-- Black
		{92754, "CASTBAR"}, -- Engulfing Darkness
		92930, -- Dark Sludge
	},{
		["stages"] = "general",
		[78194] = CL.stage:format(2),
		[77699] = 88700, -- Drink Blue Bottle
		[77786] = 88699, -- Drink Red Bottle
		[92754] = CL.extra:format(self:SpellName(92828), CL.heroic), -- Drink Black Bottle (Heroic mode)
	},{
		[77569] = CL.adds, -- Release Aberrations (Adds)
		[78194] = CL.fire, -- Magma Jets (Fire)
		[78223] = CL.orbs, -- Absolute Zero (Orbs)
		[77786] = L.flames, -- Consuming Flames (Flames)
		[77679] = CL.breath, -- Scorching Blast (Breath)
		[92754] = CL.frontal_cone, -- Engulfing Darkness (Frontal Cone)
	}
end

function mod:OnBossEnable()
	-- General
	if self:Retail() then
		self:RegisterEvent("PLAYER_REGEN_DISABLED", "CheckForEngage")
	end
	self:RegisterUnitEvent("UNIT_SPELLCAST_SUCCEEDED", nil, "boss1")
	self:RegisterEvent("CHAT_MSG_RAID_BOSS_EMOTE")
	self:Log("SPELL_AURA_APPLIED", "ShadowImbuedApplied", 92716)
	self:Log("SPELL_CAST_START", "ReleaseAberrationsStart", 77569)
	self:Log("SPELL_CAST_SUCCESS", "ReleaseAberrations", 77569)
	self:Death("AberrationDeaths", 41440) -- Aberration
	self:Log("SPELL_INTERRUPT", "ReleaseAberrationsInterrupted", "*")
	self:Log("SPELL_CAST_START", "ArcaneStorm", 77896)
	self:Log("SPELL_AURA_APPLIED", "RemedyApplied", 77912)

	-- Stage 2
	self:Log("SPELL_CAST_START", "ReleaseAllMinions", 77991)
	self:Log("SPELL_CAST_START", "MagmaJets", 78194)
	self:Log("SPELL_DAMAGE", "MagmaJetsDamage", 78124)
	self:Log("SPELL_MISSED", "MagmaJetsDamage", 78124)
	self:Log("SPELL_CAST_SUCCESS", "AcidNova", 78225)
	self:Log("SPELL_CAST_SUCCESS", "AbsoluteZero", 78223)

	-- Blue
	self:Log("SPELL_AURA_APPLIED", "FlashFreezeApplied", 77699)
	self:Log("SPELL_CAST_SUCCESS", "BitingChill", 77760)
	self:Log("SPELL_AURA_APPLIED", "BitingChillApplied", 77760)

	-- Red
	self:Log("SPELL_AURA_APPLIED", "ConsumingFlamesApplied", 77786)
	self:Log("SPELL_AURA_REMOVED", "ConsumingFlamesRemoved", 77786)
	self:Log("SPELL_CAST_SUCCESS", "ScorchingBlast", 77679)

	-- Black (Heroic)
	self:Log("SPELL_CAST_START", "EngulfingDarkness", 92754)
	self:Log("SPELL_AURA_APPLIED", "EngulfingDarknessApplied", 92754)
	self:Log("SPELL_AURA_REMOVED", "EngulfingDarknessRemoved", 92754)
	self:Log("SPELL_AURA_APPLIED", "DarkSludgeDamage", 92930)
	self:Log("SPELL_PERIODIC_DAMAGE", "DarkSludgeDamage", 92930)
	self:Log("SPELL_PERIODIC_MISSED", "DarkSludgeDamage", 92930)
end

function mod:OnEngage()
	addsRemaining = 18
	addsActive = 0
	addsDead = 0
	arcaneStormCount = 1
	acidNovaCount = 1
	scorchingBlastCounter = 1
	self:SetStage(1)
	self:RegisterUnitEvent("UNIT_HEALTH", nil, "boss1")
	if self:Heroic() then
		self:Bar("stages", 16, self:SpellName(92837), 92716) -- Throw Black Bottle
		self:Berserk(720)
	else
		self:Berserk(420)
	end
	self:CDBar(77896, 12.4, CL.count:format(self:SpellName(77896), arcaneStormCount), 77896) -- Arcane Storm
	self:CDBar(77569, 15, CL.adds, 77569) -- Release Aberrations
	self:OpenInfo(77569, "BigWigs: ".. CL.adds) -- Release Aberrations
	self:SetInfo(77569, 1, CL.remaining:format(addsRemaining))
	self:SetInfoBar(77569, 1, 1)
	self:SetInfo(77569, 3, CL.count:format(CL.active, addsActive))
	self:SetInfo(77569, 4, CL.count:format(CL.dead, addsDead))
	self:SetInfo(77569, 5, CL.other:format(CL.threat, ""))
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:UNIT_SPELLCAST_SUCCEEDED(_, _, _, spellId)
	if spellId == 77932 then -- Throw Blue Bottle
		self:StopBar(CL.count:format(CL.breath, scorchingBlastCounter)) -- Scorching Blast
		self:CDBar(77699, 28) -- Flash Freeze
		self:CDBar(77896, 19, CL.count:format(self:SpellName(77896), arcaneStormCount), 77896) -- Arcane Storm
		if addsRemaining > 0 then
			self:CDBar(77569, 15, CL.adds, 77569) -- Release Aberrations
		end
		self:Message("stages", "cyan", self:SpellName(spellId), spellId)
		self:Bar("stages", 47, self:SpellName(78895), spellId) -- Frost Imbued
		self:PlaySound("stages", "long")
	elseif spellId == 77937 then -- Throw Green Bottle
		self:StopBar(CL.count:format(CL.breath, scorchingBlastCounter)) -- Scorching Blast
		self:StopBar(77699) -- Flash Freeze
		self:CDBar(77896, 11, CL.count:format(self:SpellName(77896), arcaneStormCount), 77896) -- Arcane Storm
		if addsRemaining > 0 then
			self:CDBar(77569, 15, CL.adds, 77569) -- Release Aberrations
		end
		self:Message("stages", "cyan", self:SpellName(spellId), spellId)
		self:Bar("stages", 47, self:SpellName(92917), spellId) -- Slime Imbued
		self:PlaySound("stages", "long")
	elseif spellId == 77925 then -- Throw Red Bottle
		self:StopBar(77699) -- Flash Freeze
		self:CDBar(77679, 25, CL.count:format(CL.breath, scorchingBlastCounter)) -- Scorching Blast
		self:CDBar(77896, 19, CL.count:format(self:SpellName(77896), arcaneStormCount), 77896) -- Arcane Storm
		if addsRemaining > 0 then
			self:CDBar(77569, 15, CL.adds, 77569) -- Release Aberrations
		end
		self:Message("stages", "cyan", self:SpellName(spellId), spellId)
		self:Bar("stages", 47, self:SpellName(78896), spellId) -- Fire Imbued
		self:PlaySound("stages", "long")
	end
end

function mod:CHAT_MSG_RAID_BOSS_EMOTE(_, msg)
	if msg:find(L.dark_phase_emote_trigger, nil, true) then
		self:StopBar(CL.count:format(self:SpellName(77896), arcaneStormCount)) -- Arcane Storm
		self:StopBar(CL.adds) -- Release Aberrations
		self:Message("stages", "cyan", self:SpellName(92837), 92716) -- Throw Black Bottle
		self:PlaySound("stages", "long")
	end
end

function mod:ShadowImbuedApplied(args)
	self:StopBar(CL.count:format(self:SpellName(77896), arcaneStormCount)) -- Arcane Storm
	self:StopBar(CL.adds) -- Release Aberrations
	self:Message("stages", "cyan", args.spellName, args.spellId)
	self:Bar("stages", 90, args.spellName, args.spellId)
end

function mod:ReleaseAberrationsStart(args)
	if addsRemaining > 0 then
		self:CDBar(args.spellId, 17, CL.adds)
	end
end

function mod:ReleaseAberrations(args)
	if addsRemaining > 0 then
		addsRemaining = addsRemaining - 3
		if addsActive == 0 then
			self:SimpleTimer(UpdateInfoBoxList, 1)
		end
		if addsRemaining == 0 then
			self:StopBar(CL.adds) -- The cast wasn't interrupted and now no more adds can be summoned, stop the bar started in CAST_START
		end
		addsActive = addsActive + 3
		self:Message(args.spellId, "cyan", CL.extra:format(CL.adds_spawned, CL.remaining:format(addsRemaining)))
		self:SetInfo(args.spellId, 1, CL.remaining:format(addsRemaining))
		self:SetInfoBar(args.spellId, 1, addsRemaining / 18)
		self:SetInfo(args.spellId, 3, CL.count:format(CL.active, addsActive))
		self:SetInfo(args.spellId, 4, CL.count:format(CL.dead, addsDead))
		self:PlaySound(args.spellId, "info")
	end
end

function mod:AberrationDeaths()
	if self:GetStage() == 1 then
		addsActive = addsActive - 1
		addsDead = addsDead + 1
		self:SetInfo(77569, 3, CL.count:format(CL.active, addsActive))
		self:SetInfo(77569, 4, CL.count:format(CL.dead, addsDead))
		if addsActive == 0 then
			self:SetInfo(77569, 7, "")
			self:SetInfo(77569, 9, "")
		end
	end
end

function UpdateInfoBoxList()
	if not mod:IsEngaged() or addsActive == 0 then return end
	mod:SimpleTimer(UpdateInfoBoxList, 1)

	local line = mod:GetStage() == 2 and 1 or 7
	for unit in mod:IterateGroup() do
		-- Top threat on something that isn't the boss
		if UnitThreatSituation(unit) == 3 and not mod:TopThreat("boss1", unit) then
			mod:SetInfo(77569, line, mod:ColorName(mod:UnitName(unit), true))
			line = line + 2
			if line == 11 then
				return
			end
		end
	end
	for i = line, 9, 2 do
		mod:SetInfo(77569, i, "")
	end
end

function mod:ReleaseAberrationsInterrupted(args)
	if args.extraSpellId == 77569 then
		self:Message(77569, "green", CL.interrupted_by:format(args.extraSpellName, self:ColorName(args.sourceName)))
	end
end

function mod:ArcaneStorm(args)
	local msg = CL.count:format(args.spellName, arcaneStormCount)
	self:StopBar(msg)
	local isPossible, isReady = self:Interrupter(args.sourceGUID)
	if isPossible then
		self:Message(args.spellId, "red", msg)
	end
	arcaneStormCount = arcaneStormCount + 1
	self:CDBar(args.spellId, 13.3, CL.count:format(args.spellName, arcaneStormCount))
	if isReady then
		self:PlaySound(args.spellId, "alert")
	end
end

function mod:RemedyApplied(args)
	if not self:Player(args.destFlags) and self:Dispeller("magic", true, args.spellId) then -- Can be Spellstolen
		self:Message(args.spellId, "red", CL.magic_buff_boss:format(args.spellName))
		self:PlaySound(args.spellId, "info")
	end
end

-- Stage 2
function mod:ReleaseAllMinions(args)
	self:SetStage(2)
	self:StopBar(CL.count:format(CL.breath, scorchingBlastCounter)) -- Scorching Blast
	self:StopBar(CL.count:format(self:SpellName(77896), arcaneStormCount)) -- Arcane Storm
	self:StopBar(CL.adds) -- Release Aberrations
	self:StopBar(77699) -- Flash Freeze
	self:StopBar(78896) -- Fire Imbued
	self:StopBar(78895) -- Frost Imbued
	self:StopBar(92917) -- Slime Imbued
	self:StopBar(92716) -- Shadow Imbued
	self:OpenInfo(77569, "BigWigs: ".. CL.threat)
	if addsActive == 0 then
		addsActive = 100
		self:SimpleTimer(UpdateInfoBoxList, 1)
	end
	self:CDBar(78225, 14, CL.count:format(self:SpellName(78225), acidNovaCount)) -- Acid Nova
	local addsReleased = CL.adds_spawned_count:format(addsRemaining + 2)
	local msg = CL.percent:format(25, CL.stage:format(2))
	self:Message("stages", "cyan", CL.extra:format(msg, addsReleased), false)
	self:PlaySound("stages", "long")
end

function mod:UNIT_HEALTH(event, unit)
	local hp = self:GetHealth(unit)
	if hp < 29 then
		self:UnregisterUnitEvent(event, unit)
		if hp > 25 then
			self:Message("stages", "cyan", CL.soon:format(CL.stage:format(2)), false)
		end
	end
end

function mod:MagmaJets(args)
	self:CDBar(args.spellId, 6)
end

do
	local prev = 0
	function mod:MagmaJetsDamage(args)
		if self:Me(args.destGUID) and args.time - prev > 3 then
			prev = args.time
			self:PersonalMessage(78194, "underyou", CL.fire)
			self:PlaySound(78194, "underyou")
		end
	end
end

function mod:AcidNova(args)
	local msg = CL.count:format(args.spellName, acidNovaCount)
	self:StopBar(msg)
	self:Message(args.spellId, "red", CL.count:format(args.spellName, acidNovaCount))
	acidNovaCount = acidNovaCount + 1
	self:CDBar(args.spellId, 30.3, CL.count:format(args.spellName, acidNovaCount))
	self:PlaySound(args.spellId, "alarm")
end

function mod:AbsoluteZero(args)
	self:CDBar(args.spellId, 7.3, CL.orbs)
	self:Message(args.spellId, "yellow", CL.orbs)
end

-- Blue
function mod:FlashFreezeMarking(_, unit, guid)
	if self:MobId(guid) == 41576 then -- Flash Freeze
		self:CustomIcon(flashFreezeMarker, unit, 8)
		self:UnregisterTargetEvents()
	end
end

do
	local prev = 0
	function mod:FlashFreezeApplied(args)
		if self:Me(args.destGUID) then
			self:Yell(args.spellId, nil, nil, "Flash Freeze")
		end
		self:TargetMessage(args.spellId, "yellow", args.destName)
		if args.time - prev > 5 then
			prev = args.time
			self:RegisterTargetEvents("FlashFreezeMarking")
			self:CDBar(args.spellId, 15)
			self:PlaySound(args.spellId, "warning")
		end
	end
end

do
	local playerList = {}
	function mod:BitingChill()
		playerList = {}
	end
	function mod:BitingChillApplied(args)
		playerList[#playerList+1] = args.destName
		self:TargetsMessage(args.spellId, "orange", playerList)
		if self:Me(args.destGUID) then
			self:Say(args.spellId, nil, nil, "Biting Chill")
			self:PlaySound(args.spellId, "alarm")
		end
	end
end

-- Red
function mod:ConsumingFlamesApplied(args)
	self:TargetMessage(args.spellId, "red", args.destName, L.flames)
	self:PrimaryIcon(args.spellId, args.destName)
	if self:Me(args.destGUID) then
		self:PlaySound(args.spellId, "warning", nil, args.destName)
	end
end

function mod:ConsumingFlamesRemoved(args)
	self:PrimaryIcon(args.spellId)
end

function mod:ScorchingBlast(args)
	self:StopBar(CL.count:format(CL.breath, scorchingBlastCounter)) -- Scorching Blast
	self:Message(args.spellId, "purple", CL.count:format(CL.breath, scorchingBlastCounter))
	scorchingBlastCounter = scorchingBlastCounter + 1
	self:CDBar(args.spellId, 11.3, CL.count:format(CL.breath, scorchingBlastCounter))
	self:PlaySound(args.spellId, "alarm")
end

-- Black (Heroic)
function mod:EngulfingDarkness(args)
	self:Bar(args.spellId, 3, CL.frontal_cone)
end

function mod:EngulfingDarknessApplied(args)
	self:Message(args.spellId, "purple", CL.frontal_cone)
	self:CastBar(args.spellId, 8, CL.frontal_cone)
end

function mod:EngulfingDarknessRemoved(args)
	self:Message(args.spellId, "green", CL.over:format(CL.frontal_cone))
	self:PlaySound(args.spellId, "info")
end

do
	local prev = 0
	function mod:DarkSludgeDamage(args)
		if self:Me(args.destGUID) and args.time - prev > 3 then
			prev = args.time
			self:PersonalMessage(args.spellId, "underyou")
			self:PlaySound(args.spellId, "underyou")
		end
	end
end
