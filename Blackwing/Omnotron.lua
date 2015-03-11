--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Omnotron Defense System", 754, 169)
if not mod then return end
mod:RegisterEnableMob(42166, 42179, 42178, 42180, 49226) -- Arcanotron, Electron, Magmatron, Toxitron, Lord Victor Nefarius

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale("enUS", true)
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
L = mod:GetLocale()

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		{79501, "ICON", "FLASH"},
		{79888, "ICON", "FLASH", "PROXIMITY"},
		{80161, "FLASH"}, {80157, "FLASH", "SAY"}, 80053, {80094, "FLASH"},
		"nef", 91849, 91879, {92048, "ICON"}, 92023, "switch", "custom_on_iconomnotron",
		"berserk"
	}, {
		[79501] = -3207, -- Electron
		[79888] = -3201, -- Magmatron
		[80161] = -3208, -- Toxitron
		nef = "heroic",
		switch = "general"
	}
end

function mod:OnBossEnable()
	self:Log("SPELL_AURA_APPLIED", "AcquiringTarget", 79501)

	self:Log("SPELL_CAST_START", "Grip", 91849)
	self:Log("SPELL_CAST_SUCCESS", "PoolExplosion", 91857)

	self:Log("SPELL_CAST_SUCCESS", "PoisonProtocol", 80053)
	self:Log("SPELL_AURA_APPLIED", "Fixate", 80094)

	self:Log("SPELL_AURA_APPLIED", "ChemicalCloud", 80161)
	self:Log("SPELL_CAST_SUCCESS", "ChemicalCloudCast", 80157)
	self:Log("SPELL_AURA_APPLIED", "ShadowInfusion", 92048)
	self:Log("SPELL_AURA_APPLIED", "EncasingShadows", 92023)
	self:Log("SPELL_AURA_APPLIED", "LightningConductor", 79888)
	self:Log("SPELL_AURA_REMOVED", "LightningConductorRemoved", 79888)
	self:Log("SPELL_AURA_APPLIED", "Switch", 78740)

	self:RegisterEvent("INSTANCE_ENCOUNTER_ENGAGE_UNIT", "CheckBossStatus")

	self:Death("Deaths", 42166, 42179, 42178, 42180)
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
	local function checkTarget(sGUID, spellId)
		for i = 1, 4 do
			local bossId = ("boss%d"):format(i)
			if UnitGUID(bossId) == sGUID and UnitIsUnit(bossId.."target", "player") then
				mod:Flash(spellId)
				mod:Say(spellId)
				break
			end
		end
	end
	function mod:ChemicalCloudCast(args)
		self:ScheduleTimer(checkTarget, 0.1, args.sourceGUID, args.spellId)
	end
end

function mod:PoolExplosion()
	self:Message(91879, "Urgent", nil, L["pool"])
	self:CDBar("nef", 35, L["nef_next"], 69005)
	self:Bar(91879, 8, L["pool"])
end

do
	local prev = 0
	function mod:Switch(args)
		local timer = self:Heroic() and 27 or 42
		local t = GetTime()
		if (t - prev) > timer then
			prev = t
			self:Bar("switch", timer+3, L["next_switch"], args.spellId)
			self:Message("switch", "Positive", "Long", L["switch_message"]:format(args.destName, args.spellName), args.spellId)
			--Using dGUID to avoid issues with names appearing as "UNKNOWN" for a second or so
			if self.db.profile.custom_on_iconomnotron then
				for i = 1, 4 do
					local bossId = ("boss%d"):format(i)
					if UnitGUID(bossId) == args.destGUID then
						SetRaidTarget(bossId, 8)
						break
					end
				end
			end
		end
	end
end

function mod:Grip(args)
	self:Message(args.spellId, "Urgent")
	self:CDBar("nef", 35, L["nef_next"], 69005)
end

function mod:ShadowInfusion(args)
	if self:Me(args.destGUID) then
		self:Flash(args.spellId)
	end
	self:TargetMessage(args.spellId, args.destName, "Urgent")
	self:CDBar("nef", 35, L["nef_next"], 69005)
	self:SecondaryIcon(args.spellId, args.destName)
end

function mod:EncasingShadows(args)
	self:TargetMessage(args.spellId, args.destName, "Urgent")
	self:CDBar("nef", 35, L["nef_next"], 69005)
end

function mod:AcquiringTarget(args)
	if self:Me(args.destGUID) then
		self:Flash(args.spellId)
	end
	self:TargetMessage(args.spellId, args.destName, "Urgent", "Alarm")
	self:SecondaryIcon(args.spellId, args.destName)
end

function mod:Fixate(args)
	if self:Me(args.destGUID) then
		self:Flash(args.spellId)
		self:Message(args.spellId, "Personal", "Alarm", L["bomb_message"])
	end
end

function mod:LightningConductor(args)
	if self:Me(args.destGUID) then
		self:Flash(args.spellId)
		self:OpenProximity(args.spellId, 10) --assumed
	end
	self:TargetMessage(args.spellId, args.destName, "Attention", "Alarm")
	self:SecondaryIcon(args.spellId, args.destName)
end

function mod:LightningConductorRemoved(args)
	if not self:Me(args.destGUID) then return end
	self:CloseProximity(args.spellId)
end

function mod:PoisonProtocol(args)
	self:Bar(args.spellId, 45)
	self:Message(args.spellId, "Important", "Alert", L["protocol_message"])
end

do
	local last = 0
	function mod:ChemicalCloud(args)
		local time = GetTime()
		if (time - last) > 2 then
			last = time
			if self:Me(args.destGUID) then
				self:Message(args.spellId, "Personal", "Info", L["cloud_message"])
				self:Flash(args.spellId)
			end
		end
	end
end

do
	local deaths = 0
	function mod:Deaths()
		--Prevent the module from re-enabling in the second or so after 1 boss dies
		deaths = deaths + 1
		if deaths == 4 then
			self:Win()
		end
	end
end

