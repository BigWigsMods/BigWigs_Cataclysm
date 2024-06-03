--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Magmaw", 669, 170)
if not mod then return end
mod:RegisterEnableMob(41570)
mod:SetEncounterID(1024)
mod:SetRespawnTime(32)
mod:SetStage(1)

--------------------------------------------------------------------------------
-- Locals
--

local isHeadPhase = false

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:GetLocale()
if L then
	L.adds_icon = "SPELL_SHADOW_RAISEDEAD"

	L.stage2_yell_trigger = "You may actually defeat my lava worm"

	L.slump = "Slump"
	L.slump_desc = "Warn for when Magmaw slumps forward and exposes himself, allowing the riding rodeo to start."
	L.slump_bar = "Rodeo"
	L.slump_message = "Yeehaw, ride on!"
	L.slump_emote_trigger = "%s slumps forward, exposing his pincers!"

	L.expose_emote_trigger = "head"
end

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		-- Normal
		"slump",
		{79011, "EMPHASIZE"}, -- Point of Vulnerability
		78006, -- Pillar of Flame
		{78941, "SAY", "SAY_COUNTDOWN", "ME_ONLY_EMPHASIZE"}, -- Parasitic Infection
		77690, -- Lava Spew
		92134, -- Ignition
		89773, -- Mangle
		{78199, "TANK"}, -- Sweltering Armor
		78403, -- Molten Tantrum
		-- Heroic
		"adds",
		92177, -- Armageddon
		-- General
		"stages",
		"berserk",
	},{
		["slump"] = "normal",
		["adds"] = "heroic",
		["stages"] = "general"
	},{
		["slump"] = L.slump_bar, -- Slump (Rodeo)
		[79011] = CL.weakened, -- Point of Vulnerability (Weakened)
		[78941] = CL.parasite, -- Parasitic Infection (Parasite)
		[92134] = CL.fire, -- Ignition (Fire)
	}
end

function mod:OnBossEnable()
	self:RegisterEvent("CHAT_MSG_RAID_BOSS_EMOTE")
	self:Log("SPELL_AURA_APPLIED", "ParasiticInfection", 78097, 78941)
	self:Log("SPELL_AURA_APPLIED", "PillarOfFlame", 78006)
	self:Log("SPELL_CAST_SUCCESS", "LavaSpew", 77690)
	self:Log("SPELL_AURA_APPLIED", "ArmageddonApplied", 92177)
	self:Log("SPELL_AURA_REMOVED", "ArmageddonRemoved", 92177)
	self:Log("SPELL_AURA_APPLIED", "MangleApplied", 89773)
	self:Log("SPELL_AURA_REMOVED", "MangleRemoved", 89773)
	self:Log("SPELL_AURA_APPLIED", "SwelteringArmorApplied", 78199)
	self:Log("SPELL_AURA_APPLIED", "MoltenTantrumApplied", 78403)
	self:Log("SPELL_AURA_APPLIED_DOSE", "MoltenTantrumApplied", 78403)

	self:Log("SPELL_AURA_APPLIED", "IgnitionDamage", 92134)
	self:Log("SPELL_PERIODIC_DAMAGE", "IgnitionDamage", 92134)
	self:Log("SPELL_PERIODIC_MISSED", "IgnitionDamage", 92134)

	-- Heroic
	self:RegisterEvent("CHAT_MSG_MONSTER_YELL")
	self:Log("SPELL_SUMMON", "BlazingInferno", 92154)
end

function mod:OnEngage()
	isHeadPhase = false
	self:SetStage(1)
	self:Berserk(600)
	self:Bar("slump", 100, L.slump_bar, 36702)
	self:Bar(78006, 30) -- Pillar of Flame
	self:CDBar(77690, 24) -- Lava Spew
	self:CDBar(89773, 90) -- Mangle
	if self:Heroic() then
		self:Bar("adds", 30, CL.add, L.adds_icon)
	end
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:CHAT_MSG_MONSTER_YELL(_, msg)
	if msg:find(L.stage2_yell_trigger, nil, true) then
		self:SetStage(2)
		self:StopBar(CL.add)
		self:Message("stages", "cyan", CL.stage:format(2), false)
	end
end

do
	local function rebootTimers()
		isHeadPhase = false
		mod:CDBar(78006, 9.5) -- Pillar of Flame
		mod:CDBar(77690, 4.5) -- Lava Spew
	end
	function mod:CHAT_MSG_RAID_BOSS_EMOTE(_, msg)
		if msg:find(L.slump_emote_trigger, nil, true) then
			self:StopBar(78006) -- Pillar of Flame
			self:Bar("slump", 95, L.slump_bar, 36702)
			self:Message("slump", "green", L.slump_message, 36702)
			self:PlaySound("slump", "info")
		elseif msg:find(L.expose_emote_trigger, nil, true) then
			isHeadPhase = true
			self:Message(79011, "green", CL.weakened)
			self:Bar(79011, 30, CL.weakened)
			self:StopBar(78006) -- Pillar of Flame
			self:StopBar(77690) -- Lava Spew
			self:ScheduleTimer(rebootTimers, 30)
			self:PlaySound(79011, "long")
		end
	end
end

function mod:ArmageddonApplied(args)
	self:Message(args.spellId, "red", CL.other:format(CL.add, args.spellName))
	self:Bar(args.spellId, 8)
	if isHeadPhase then
		self:PlaySound(args.spellId, "alarm")
	end
end

function mod:ArmageddonRemoved(args)
	self:StopBar(args.spellName)
end

do
	local prev = 0
	function mod:LavaSpew(args)
		if args.time - prev > 10 then
			prev = args.time
			self:Message(args.spellId, "yellow")
			self:CDBar(args.spellId, 26)
		end
	end
end

function mod:BlazingInferno()
	self:Message("adds", "cyan", CL.add_spawned, L.adds_icon)
	if self:GetStage() == 1 then -- Add can sometimes spawn just as stage 2 begins
		self:Bar("adds", 35, CL.add, L.adds_icon)
	end
	self:PlaySound("adds", "info")
end

function mod:PillarOfFlame(args)
	self:Message(args.spellId, "orange")
	self:CDBar(args.spellId, 32)
	self:PlaySound(args.spellId, "alert")
end

function mod:ParasiticInfection(args)
	if self:Me(args.destGUID) then
		self:PersonalMessage(78941, nil, CL.parasite)
		self:Say(78941, CL.parasite, nil, "Parasite")
		self:SayCountdown(78941, 10) -- Not removed on death
		self:PlaySound(78941, "warning", nil, args.destName)
	end
end

do
	local prevMangle = 0
	function mod:MangleApplied(args)
		prevMangle = args.time
		self:StopBar(args.spellName)
		self:TargetMessage(args.spellId, "purple", args.destName)
		self:TargetBar(args.spellId, 30, args.destName)
		self:PlaySound(args.spellId, "info", nil, args.destName)
	end

	function mod:MangleRemoved(args)
		self:StopBar(args.spellName, args.destName)
		self:CDBar(args.spellId, prevMangle > 0 and (95 - (args.time-prevMangle)) or 95) -- Show the bar after it ends on the tank
	end
end

function mod:SwelteringArmorApplied(args)
	self:TargetMessage(args.spellId, "purple", args.destName)
end

function mod:MoltenTantrumApplied(args)
	self:StackMessage(args.spellId, "purple", args.destName, args.amount, 1)
end

do
	local prev = 0
	function mod:IgnitionDamage(args)
		if self:Me(args.destGUID) and args.time - prev > 2 then
			prev = args.time
			self:PersonalMessage(args.spellId, "underyou", CL.fire)
			self:PlaySound(args.spellId, "underyou")
		end
	end
end
