--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Omnotron Defense System", 669, 169)
if not mod then return end
mod:RegisterEnableMob(42166, 42179, 42178, 42180, 49226) -- Arcanotron, Electron, Magmatron, Toxitron, Lord Victor Nefarius
mod:SetEncounterID(1027)
mod:SetRespawnTime(70)

--------------------------------------------------------------------------------
-- Locals
--

local prevIcon = nil
local arcaneAnnihilatorCount = 0

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:GetLocale()
if L then
	L.nef = "Lord Victor Nefarius"
	L.nef_desc = "Warnings for Lord Victor Nefarius abilities."
	L.nef_icon = "inv_misc_head_dragon_black"

	L.pool = "Pool Explosion"
	L.incinerate = mod:SpellName(79938) -- Incinerate
	L.flamethrower = mod:SpellName(79505) -- Flamethrower
end

--------------------------------------------------------------------------------
-- Initialization
--

local activatedMarker = mod:AddMarkerOption(true, "npc", 8, 78740, 8) -- Activated
function mod:GetOptions()
	return {
		-- Magmatron
		{79501, "ICON", "SAY", "SAY_COUNTDOWN", "ME_ONLY_EMPHASIZE"}, -- Acquiring Target
		79023, -- Incineration Security Measure
		-- Electron
		{79888, "ICON", "SAY", "ME_ONLY_EMPHASIZE"}, -- Lightning Conductor
		-- Toxitron
		80161, -- Chemical Cloud
		{80157, "SAY"}, -- Chemical Bomb
		80053, -- Poison Protocol
		80094, -- Fixate
		-- Arcanotron
		79710, -- Arcane Annihilator
		-- Heroic
		"nef",
		91849, -- Grip of Death
		91879, -- Arcane Blowback
		{92048, "ICON", "SAY", "SAY_COUNTDOWN", "CASTBAR", "CASTBAR_COUNTDOWN", "ME_ONLY_EMPHASIZE"}, -- Shadow Infusion
		{92053, "SAY", "SAY_COUNTDOWN"}, -- Shadow Conductor
		92023, -- Encasing Shadows
		"berserk",
		-- General
		78740, -- Activated
		activatedMarker,
	},{
		[79501] = -3207, -- Magmatron
		[79888] = -3201, -- Electron
		[80161] = -3208, -- Toxitron
		[79710] = -3194, -- Arcanotron
		nef = "heroic",
		[78740] = "general"
	},{
		[79501] = L.flamethrower, -- Acquiring Target (Flamethrower)
		[79023] = L.incinerate, -- Incineration Security Measure (Incinerate)
		[80053] = CL.adds, -- Poison Protocol (Adds)
		["nef"] = CL.next_ability, -- Lord Victor Nefarius (Next ability)
		[91879] = L.pool, -- Arcane Blowback (Pool Explosion)
		[92023] = CL.rooted, -- Encasing Shadows (Rooted)
	}
end

function mod:OnBossEnable()
	 -- Magmatron
	self:Log("SPELL_AURA_APPLIED", "AcquiringTargetApplied", 79501)
	self:Log("SPELL_AURA_REMOVED", "AcquiringTargetRemoved", 79501)
	self:Log("SPELL_CAST_SUCCESS", "IncinerationSecurityMeasure", 79023)
	-- Electron
	self:Log("SPELL_CAST_SUCCESS", "LightningConductor", 79888)
	self:Log("SPELL_AURA_APPLIED", "LightningConductorApplied", 79888)
	self:Log("SPELL_AURA_REMOVED", "LightningConductorRemoved", 79888)
	-- Toxitron
	self:Log("SPELL_CAST_SUCCESS", "ChemicalBomb", 80157)
	self:Log("SPELL_AURA_APPLIED", "FixateApplied", 80094)
	self:Log("SPELL_CAST_SUCCESS", "PoisonProtocol", 80053)
	self:Log("SPELL_AURA_APPLIED", "ChemicalCloudDamage", 80161)
	self:Log("SPELL_PERIODIC_DAMAGE", "ChemicalCloudDamage", 80161)
	self:Log("SPELL_PERIODIC_MISSED", "ChemicalCloudDamage", 80161)
	-- Arcanotron
	self:Log("SPELL_CAST_START", "ArcaneAnnihilator", 79710)
	-- Heroic
	self:Log("SPELL_CAST_SUCCESS", "OverchargedPowerGenerator", 91857)
	self:Log("SPELL_CAST_START", "GripOfDeath", 91849)
	self:Log("SPELL_AURA_APPLIED", "EncasingShadowsApplied", 92023)
	self:Log("SPELL_AURA_APPLIED", "ShadowInfusionApplied", 92048)
	self:Log("SPELL_AURA_REMOVED", "ShadowInfusionRemoved", 92048)
	self:Log("SPELL_AURA_APPLIED", "ShadowConductorApplied", 92053)
	self:Log("SPELL_AURA_REMOVED", "ShadowConductorRemoved", 92053)
	-- General
	self:Log("SPELL_AURA_APPLIED", "ActivatedApplied", 78740)
	self:Log("SPELL_CAST_SUCCESS", "ShuttingDown", 78746)
end

function mod:OnEngage()
	arcaneAnnihilatorCount = 0
	if self:Heroic() then
		self:Berserk(600, true)
	end
end

--------------------------------------------------------------------------------
-- Event Handlers
--

-- Magmatron
function mod:AcquiringTargetApplied(args)
	prevIcon = args.spellId
	self:TargetMessage(args.spellId, "yellow", args.destName, L.flamethrower)
	self:CDBar(79501, 27.5, L.flamethrower)
	self:SecondaryIcon(args.spellId, args.destName)
	if self:Me(args.destGUID) then
		self:Say(args.spellId, L.flamethrower, nil, "Flamethrower")
		self:SayCountdown(args.spellId, 4, L.flamethrower, 2, "Flamethrower")
		self:PlaySound(args.spellId, "warning", nil, args.destName)
	end
end

function mod:AcquiringTargetRemoved(args)
	if args.spellId == prevIcon then
		self:SecondaryIcon(args.spellId)
	end
	if self:Me(args.destGUID) then
		self:CancelSayCountdown(args.spellId)
	end
end

function mod:IncinerationSecurityMeasure(args)
	self:CDBar(args.spellId, 27.5, L.incinerate)
	self:Message(args.spellId, "red", L.incinerate)
	self:PlaySound(args.spellId, "alert")
end

-- Electron
function mod:LightningConductor(args)
	self:CDBar(args.spellId, 21)
end

function mod:LightningConductorApplied(args)
	prevIcon = args.spellId
	self:TargetMessage(args.spellId, "yellow", args.destName)
	self:SecondaryIcon(args.spellId, args.destName)
	if self:Me(args.destGUID) then
		self:Say(args.spellId, nil, nil, "Lightning Conductor")
		self:PlaySound(args.spellId, "warning", nil, args.destName)
	end
end

function mod:LightningConductorRemoved(args)
	if args.spellId == prevIcon then
		self:SecondaryIcon(args.spellId)
	end
end

-- Toxitron
do
	local function printTarget(self, _, guid)
		if self:Me(guid) then
			self:PersonalMessage(80157)
			self:Say(80157, nil, nil, "Chemical Bomb")
		end
	end
	function mod:ChemicalBomb(args)
		self:GetUnitTarget(printTarget, 0.3, args.sourceGUID)
	end
end

function mod:FixateApplied(args)
	if self:Me(args.destGUID) then
		self:PersonalMessage(args.spellId)
		self:PlaySound(args.spellId, "alarm", nil, args.destName)
	end
end

function mod:PoisonProtocol(args)
	self:CDBar(args.spellId, 45, CL.adds)
	self:Message(args.spellId, "red", CL.incoming:format(CL.adds))
	self:PlaySound(args.spellId, "info")
end

do
	local prev = 0
	function mod:ChemicalCloudDamage(args)
		if self:Me(args.destGUID) and args.time - prev > 3 then
			prev = args.time
			self:PersonalMessage(args.spellId, "underyou")
			self:PlaySound(args.spellId, "underyou")
		end
	end
end

-- Arcanotron
function mod:ArcaneAnnihilator(args)
	arcaneAnnihilatorCount = arcaneAnnihilatorCount + 1
	if arcaneAnnihilatorCount == 4 then arcaneAnnihilatorCount = 1 end

	if self:UnitGUID("target") == args.sourceGUID then
		self:Message(args.spellId, "red", CL.count:format(args.spellName, arcaneAnnihilatorCount))
		local _, ready = self:Interrupter()
		if ready then
			self:PlaySound(args.spellId, "alert")
		end
	end
end

-- Heroic
function mod:OverchargedPowerGenerator()
	self:Message(91879, "orange", L.pool)
	self:Bar(91879, 8, L.pool)
	self:CDBar("nef", 35, CL.next_ability, L.nef_icon)
	self:PlaySound(91879, "info")
end

function mod:GripOfDeath(args)
	self:Message(args.spellId, "orange")
	self:CDBar("nef", 35, CL.next_ability, L.nef_icon)
end

function mod:EncasingShadowsApplied(args)
	self:TargetMessage(args.spellId, "orange", args.destName, CL.rooted)
	self:CDBar("nef", 35, CL.next_ability, L.nef_icon)
end

function mod:ShadowInfusionApplied(args)
	prevIcon = args.spellId
	self:TargetMessage(args.spellId, "orange", args.destName)
	self:CDBar("nef", 35, CL.next_ability, L.nef_icon)
	self:SecondaryIcon(args.spellId, args.destName)
	if self:Me(args.destGUID) then
		self:CastBar(args.spellId, 5)
		self:Say(args.spellId, nil, nil, "Shadow Infusion")
		self:SayCountdown(args.spellId, 5)
		self:PlaySound(args.spellId, "warning", nil, args.destName)
	end
end

function mod:ShadowInfusionRemoved(args)
	if self:Me(args.destGUID) then
		self:CancelYellCountdown(args.spellId)
	end
end

function mod:ShadowConductorApplied(args)
	if self:Me(args.destGUID) then
		self:PersonalMessage(args.spellId)
		self:Yell(args.spellId, nil, nil, "Shadow Conductor")
		self:YellCountdown(args.spellId, 10, nil, 6)
	end
end

function mod:ShadowConductorRemoved(args)
	if 92048 == prevIcon then
		self:SecondaryIcon(92048) -- Shadow Infusion
	end
	if self:Me(args.destGUID) then
		self:PersonalMessage(args.spellId, "removed")
		self:CancelYellCountdown(args.spellId)
	end
end

-- General
do
	local prev = 0
	function mod:ActivatedApplied(args)
		local timer = self:Heroic() and 27 or 42
		if (args.time - prev) > timer then
			prev = args.time
			self:Bar(args.spellId, timer+3)
			self:TargetMessage(args.spellId, "cyan", args.destName)
			local npcId = self:MobId(args.sourceGUID)
			if npcId == 42180 then -- Toxitron
				self:CDBar(80053, 15.5, CL.adds) -- Poison Protocol
			elseif npcId == 42178 then -- Magmatron
				self:CDBar(79023, 12, L.incinerate) -- Incineration Security Measure
				self:CDBar(79501, 20.5, L.flamethrower) -- Acquiring Target
			elseif npcId == 42179 then -- Electron
				self:CDBar(79888, 15.7) -- Lightning Conductor
			elseif npcId == 42166 then -- Arcanotron
				arcaneAnnihilatorCount = 0
			end
			local unit = self:GetUnitIdByGUID(args.destGUID)
			if unit then
				self:CustomIcon(activatedMarker, unit, 8)
			end
			self:PlaySound(args.spellId, "long")
		end
	end
end

function mod:ShuttingDown(args)
	local npcId = self:MobId(args.sourceGUID)
	if npcId == 42180 then -- Toxitron
		self:StopBar(CL.adds) -- Poison Protocol
	elseif npcId == 42178 then -- Magmatron
		self:StopBar(L.incinerate) -- Incineration Security Measure
		self:StopBar(L.flamethrower) -- Acquiring Target
	elseif npcId == 42179 then -- Electron
		self:StopBar(79888) -- Lightning Conductor
	end
end
