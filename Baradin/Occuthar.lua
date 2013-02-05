--------------------------------------------------------------------------------
-- Module Declaration
--

local mod = BigWigs:NewBoss("Occu'thar", 752, 140)
if not mod then return end
mod:RegisterEnableMob(52363)

local fireCount = 0

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale("enUS", true)
if L then
	L.shadows_bar = "~Shadows"
	L.destruction_bar = "<Explosion>"
	L.eyes_bar = "~Eyes"

	L.fire_message = "Lazer, Pew Pew"
	L.fire_bar = "~Lazer"
end
L = mod:GetLocale()

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {96913, {96920, "FLASH"}, 96884, "berserk", "bosskill"}
end

function mod:OnBossEnable()
	self:Log("SPELL_AURA_APPLIED", "SearingShadows", 96913)
	self:Log("SPELL_CAST_START", "Eyes", 96920)
	self:Log("SPELL_CAST_SUCCESS", "FocusedFire", 96884)

	--No CheckBossStatus() here as event does not fire.
	self:RegisterEvent("PLAYER_REGEN_DISABLED", "CheckForEngage")
	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")

	self:Death("Win", 52363)
end

function mod:OnEngage()
	self:Bar(96920, L["eyes_bar"], 25, 96920)
	self:Bar(96884, L["fire_bar"], 13.1, 96884)
	self:Bar(96913, L["shadows_bar"], 6.5, 96913)
	fireCount = 3
	self:Berserk(300)
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:SearingShadows(args)
	self:TargetMessage(args.spellId, args.spellName, args.destName, "Important", args.spellId)
	self:Bar(args.spellId, L["shadows_bar"], 24, args.spellId) --23-26
end

function mod:Eyes(args)
	self:Flash(args.spellId)
	self:Message(args.spellId, args.spellName, "Urgent", args.spellId, "Alert")
	self:Bar(args.spellId, L["destruction_bar"], 10, 96968) -- 96968 is Occu'thar's Destruction
	self:Bar(args.spellId, L["eyes_bar"], 58, args.spellId)
	fireCount = 0
	self:Bar(96884, L["fire_bar"], 18.5, args.spellId) --18.5-19.2
end

function mod:FocusedFire(args)
	self:Message(args.spellId, L["fire_message"], "Attention", args.spellId)
	fireCount = fireCount + 1
	if fireCount < 3 then
		self:Bar(args.spellId, L["fire_bar"], 15.7, args.spellId) --15.5-16
	end
end

