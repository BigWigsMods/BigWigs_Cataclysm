--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Omnotron Defense System", 669, 169)
if not mod then return end
mod:RegisterEnableMob(42166, 42179, 42178, 42180, 49226) -- Arcanotron, Electron, Magmatron, Toxitron, Lord Victor Nefarius
mod:SetEncounterID(1027)
mod:SetRespawnTime(70)

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:GetLocale()
if L then
	L.nef = "Lord Victor Nefarius"
	L.nef_desc = "Warnings for Lord Victor Nefarius abilities."

	L.pool = "Pool Explosion"

	L.switch = "Switch"
	L.switch_desc = "Warning for Switches."
	L.switch_message = "%s %s"

	L.next_switch = "Next activation"

	L.nef_next = "Ability buff"

	L.bomb_message = "Blob chasing YOU!"
	L.cloud_message = "Cloud under YOU!"
	L.protocol_message = "Blobs incoming!"

	L.custom_on_iconomnotron = "Skull on active boss"
	L.custom_on_iconomnotron_desc = "Place a skull on the active boss (requires promoted or leader)."
	L.custom_on_iconomnotron_icon = "Interface\\TARGETINGFRAME\\UI-RaidTargetingIcon_8"
end

--------------------------------------------------------------------------------
-- Initialization
--

local activatedMarker = mod:AddMarkerOption(true, "npc", 8, 78740, 8) -- Activated
function mod:GetOptions()
	return {
		-- Electron
		{79501, "ICON", "ME_ONLY_EMPHASIZE"},
		-- Magmatron
		{79888, "ICON", "ME_ONLY_EMPHASIZE"},
		-- Toxitron
		80161, -- Chemical Cloud
		{80157, "SAY"}, -- Chemical Bomb
		80053,
		{80094, "ME_ONLY_EMPHASIZE"},
		-- Heroic
		"nef",
		91849,
		91879,
		{92048, "ICON"},
		92023,
		-- General
		78740, -- Activated
		activatedMarker,
		"berserk"
	}, {
		[79501] = -3207, -- Electron
		[79888] = -3201, -- Magmatron
		[80161] = -3208, -- Toxitron
		nef = "heroic",
		[78740] = "general"
	}
end

function mod:OnBossEnable()
	self:Log("SPELL_AURA_APPLIED", "AcquiringTarget", 79501)

	self:Log("SPELL_CAST_START", "Grip", 91849)
	self:Log("SPELL_CAST_SUCCESS", "PoolExplosion", 91857)

	self:Log("SPELL_CAST_SUCCESS", "PoisonProtocol", 80053)
	self:Log("SPELL_AURA_APPLIED", "Fixate", 80094)
	self:Log("SPELL_CAST_SUCCESS", "ChemicalBomb", 80157)
	self:Log("SPELL_AURA_APPLIED", "ShadowInfusion", 92048)
	self:Log("SPELL_AURA_APPLIED", "EncasingShadows", 92023)
	self:Log("SPELL_AURA_APPLIED", "LightningConductor", 79888)
	self:Log("SPELL_AURA_REMOVED", "LightningConductorRemoved", 79888)
	self:Log("SPELL_AURA_APPLIED", "Activated", 78740)

	self:Log("SPELL_AURA_APPLIED", "ChemicalCloudDamage", 80161)
	self:Log("SPELL_PERIODIC_DAMAGE", "ChemicalCloudDamage", 80161)
	self:Log("SPELL_PERIODIC_MISSED", "ChemicalCloudDamage", 80161)
end

function mod:OnEngage()
	if self:Heroic() then
		self:Berserk(600)
	end
end

--------------------------------------------------------------------------------
-- Event Handlers
--

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

function mod:PoolExplosion()
	self:MessageOld(91879, "orange", nil, L["pool"])
	self:CDBar("nef", 35, L["nef_next"], 69005)
	self:Bar(91879, 8, L["pool"])
end

do
	local prev = 0
	function mod:Activated(args)
		local timer = self:Heroic() and 27 or 42
		if (args.time - prev) > timer then
			prev = args.time
			self:Bar(args.spellId, timer+3, L["next_switch"])
			self:TargetMessage(args.spellId, "green", args.destName)
			local unit = self:GetUnitIdByGUID(args.destGUID)
			if unit then
				self:CustomIcon(activatedMarker, unit, 8)
			end
			self:PlaySound(args.spellId, "long")
		end
	end
end

function mod:Grip(args)
	self:MessageOld(args.spellId, "orange")
	self:CDBar("nef", 35, L["nef_next"], 69005)
end

function mod:ShadowInfusion(args)
	--if self:Me(args.destGUID) then
	--	self:Flash(args.spellId)
	--end
	self:TargetMessageOld(args.spellId, args.destName, "orange")
	self:CDBar("nef", 35, L["nef_next"], 69005)
	self:SecondaryIcon(args.spellId, args.destName)
end

function mod:EncasingShadows(args)
	self:TargetMessageOld(args.spellId, args.destName, "orange")
	self:CDBar("nef", 35, L["nef_next"], 69005)
end

function mod:AcquiringTarget(args)
	self:TargetMessageOld(args.spellId, args.destName, "orange", "alarm")
	self:SecondaryIcon(args.spellId, args.destName)
end

function mod:Fixate(args)
	if self:Me(args.destGUID) then
		self:PersonalMessage(args.spellId)
		self:PlaySound(args.spellId, "warning", nil, args.destName)
	end
end

function mod:LightningConductor(args)
	self:TargetMessageOld(args.spellId, args.destName, "yellow", "alarm")
	self:SecondaryIcon(args.spellId, args.destName)
end

function mod:LightningConductorRemoved(args)
	if not self:Me(args.destGUID) then return end
	--self:CloseProximity(args.spellId)
end

function mod:PoisonProtocol(args)
	self:Bar(args.spellId, 45)
	self:MessageOld(args.spellId, "red", "alert", L["protocol_message"])
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
