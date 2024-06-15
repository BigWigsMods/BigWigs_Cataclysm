--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Atramedes", 669, 171)
if not mod then return end
mod:RegisterEnableMob(41442)
mod:SetEncounterID(1022)
mod:SetRespawnTime(30)
mod:SetStage(1)

--------------------------------------------------------------------------------
-- Locals
--

local searingFlameCount = 1
local modulationCount = 1
local shieldCount = 0
local shieldClickers = {"None"}

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:GetLocale()
if L then
	L.obnoxious_fiend = "Obnoxious Fiend" -- NPC ID 49740
	L.air_phase_trigger = "Yes, run! With every step your heart quickens."
end

--------------------------------------------------------------------------------
-- Initialization
--

local obnoxiousFiendMarker = mod:AddMarkerOption(true, "npc", 7, "obnoxious_fiend", 7) -- Obnoxious Fiend
function mod:GetOptions()
	return {
		-- Grounded Abilities
		78075, -- Sonic Breath
		77840, -- Searing Flame
		77612, -- Modulation
		77672, -- Sonar Pulse
		-- Heroic
		{92685, "SAY"}, -- Pestered!
		obnoxiousFiendMarker,
		"berserk",
		-- General
		{78092, "ICON", "SAY", "ME_ONLY_EMPHASIZE"}, -- Tracking
		{77611, "INFOBOX"}, -- Resonating Clash
		"stages",
		"altpower",
	},{
		[78075] = -3061, -- Grounded Abilities
		[92685] = "heroic",
		[78092] = "general"
	},{
		[92685] = CL.add, -- Pestered! (Add)
		[78092] = CL.plus:format(self:SpellName(78075), self:SpellName(78221)), -- Tracking (Sonic Breath + Roaring Flame Breath)
		[77611] = CL.shield, -- Resonating Clash (Shield)
	}
end

function mod:OnRegister()
	-- Delayed for custom locale
	obnoxiousFiendMarker = mod:AddMarkerOption(true, "npc", 7, "obnoxious_fiend", 7) -- Obnoxious Fiend
end

function mod:OnBossEnable()
	if IsEncounterInProgress() then
		self:OpenAltPower("altpower", self:SpellName(-3072)) -- "Sound"
	end

	self:RegisterUnitEvent("UNIT_SPELLCAST_SUCCEEDED", nil, "boss1")
	self:Log("SPELL_AURA_APPLIED", "TrackingApplied", 78092)

	self:Log("SPELL_CAST_SUCCESS", "SonicBreath", 78075)
	self:Log("SPELL_AURA_APPLIED", "SearingFlameApplied", 77840)
	self:Log("SPELL_CAST_SUCCESS", "Modulation", 77612)
	self:Log("SPELL_CAST_SUCCESS", "SonarPulse", 77672)
	self:Log("SPELL_CAST_SUCCESS", "ResonatingClash", 77611, 78168) -- Stage 1, Stage 2

	self:Log("SPELL_CAST_SUCCESS", "PhaseShift", 92681)
	self:Log("SPELL_AURA_APPLIED", "PesteredApplied", 92685)
end

function mod:OnEngage()
	searingFlameCount = 1
	modulationCount = 1
	shieldCount = 0
	shieldClickers = {"None"}
	self:SetStage(1)
	self:CDBar(77612, 11, CL.count:format(self:SpellName(77612), modulationCount)) -- Modulation
	self:CDBar(77672, 11.3) -- Sonar Pulse
	self:CDBar(78075, 22) -- Sonic Breath
	self:Bar(77840, 45, CL.count:format(self:SpellName(77840), searingFlameCount)) -- Searing Flame
	self:Bar("stages", 91, CL.stage:format(2), "achievement_boss_nefarion")
	if self:Heroic() then
		self:Berserk(600)
	end
	self:OpenAltPower("altpower", self:SpellName(-3072)) -- "Sound"
	self:OpenInfo(77611, "BigWigs: ".. CL.shield)
	self:SetInfo(77611, 1, CL.remaining:format(10))
	self:SetInfoBar(77611, 1, 1)
end

--------------------------------------------------------------------------------
-- Event Handlers
--

do
	local function groundPhase(self)
		self:SetStage(1)
		self:Message("stages", "cyan", CL.stage:format(1), false)
		self:Bar("stages", 85, CL.stage:format(2), "achievement_boss_nefarion")
		self:CDBar(77672, 12.3) -- Sonar Pulse
		self:CDBar(77612, 14, CL.count:format(self:SpellName(77612), modulationCount)) -- Modulation
		self:CDBar(78075, 24) -- Sonic Breath
		self:Bar(77840, self:Classic() and 47 or 39, CL.count:format(self:SpellName(77840), searingFlameCount)) -- Searing Flame
		self:PlaySound("stages", "long")
	end
	function mod:UNIT_SPELLCAST_SUCCEEDED(_, _, _, spellId)
		if spellId == 86915 then -- Take Off Anim Kit
			self:SetStage(2)
			self:StopBar(78075) -- Sonic Breath
			self:StopBar(77672) -- Sonar Pulse
			self:StopBar(CL.count:format(self:SpellName(77612), modulationCount)) -- Modulation
			self:Message("stages", "cyan", CL.stage:format(2), false)
			self:Bar("stages", 36, CL.stage:format(1), "achievement_boss_nefarion")
			self:ScheduleTimer(groundPhase, 36, self)
			self:PlaySound("stages", "long")
		end
	end
end

function mod:TrackingApplied(args)
	self:TargetMessage(args.spellId, "red", args.destName)
	self:PrimaryIcon(args.spellId, args.destName)
	if self:Me(args.destGUID) then
		self:Say(args.spellId, nil, nil, "Tracking")
		self:PlaySound(args.spellId, "warning", nil, args.destName)
	end
end

function mod:SonicBreath(args)
	self:CDBar(args.spellId, 42)
end

function mod:SearingFlameApplied(args)
	self:Message(args.spellId, "yellow", CL.count:format(args.spellName, searingFlameCount))
	searingFlameCount = searingFlameCount + 1
	self:PlaySound(args.spellId, "warning")
end

function mod:Modulation(args)
	local msg = CL.count:format(args.spellName, modulationCount)
	self:StopBar(msg)
	self:Message(args.spellId, "orange", msg)
	modulationCount = modulationCount + 1
	self:CDBar(args.spellId, 16, CL.count:format(args.spellName, modulationCount))
	self:PlaySound(args.spellId, "alert")
end

function mod:SonarPulse(args)
	self:CDBar(args.spellId, 11.3)
end

do
	local lineRef = {1,3,5,7,9}
	function mod:ResonatingClash(args)
		if self:Player(args.sourceFlags) then -- The shield itself also casts it
			if self:Heroic() and args.spellId == 77611 and shieldCount < 9 then
				shieldCount = shieldCount + 1
				local nefarianName = self:SpellName(-3279) -- Nefarian
				table.insert(shieldClickers, 2, ("%d %s"):format(shieldCount, nefarianName))
			end
			shieldCount = shieldCount + 1
			local colorName = self:ColorName(args.sourceName)
			table.insert(shieldClickers, 2, ("%d %s"):format(shieldCount, colorName))
			self:Message(77611, "cyan", CL.other:format(CL.count:format(CL.shield, shieldCount), colorName), false)
			self:SetInfo(77611, 1, CL.remaining:format(10-shieldCount))
			local per = shieldCount / 10
			self:SetInfoBar(77611, 1, 1-per)
			for i = 2, 5 do
				self:SetInfo(77611, lineRef[i], shieldClickers[i] or "")
			end
			self:PlaySound(77611, "info")
		end
	end
end

do
	local addGUID = nil
	function mod:ObnoxiousFiendMarking(_, unit, guid)
		if addGUID and guid == addGUID then
			addGUID = nil
			self:CustomIcon(obnoxiousFiendMarker, unit, 7)
			self:UnregisterTargetEvents()
		end
	end

	function mod:PhaseShift(args)
		addGUID = args.sourceGUID
		self:RegisterTargetEvents("ObnoxiousFiendMarking")
	end
end

do
	function mod:PesteredApplied(args)
		if self:Player(args.destFlags) then -- The add itself also gains it
			if self:Me(args.destGUID) then
				self:Yell(args.spellId, CL.add, nil, "Add")
			end
			self:TargetMessage(args.spellId, "red", args.destName, CL.add)
			self:PlaySound(args.spellId, "alarm", nil, args.destName)
		end
	end
end
