--------------------------------------------------------------------------------
-- Module Declaration
--

local mod = BigWigs:NewBoss("Baleroc", 800, 196)
if not mod then return end
mod:RegisterEnableMob(53494)

local countdownTargets = mod:NewTargetList()
local countdownCounter, shardCounter = 1, 0

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale("enUS", true)
if L then
	L.torment = "Torment stacks on Focus"
	L.torment_desc = "Warn when your /focus gains another torment stack."
	L.torment_icon = 99256

	L.blade_bar = "~Next Blade"
	L.shard_message = "Purple shards (%d)!"
	L.focus_message = "Your focus has %d stacks!"
	L.link_message = "Link"
end
L = mod:GetLocale()

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		99259, "torment", -2598, --Blades of Baleroc
		"berserk", "bosskill",
		{99516, "FLASH", "ICON"}
	}, {
		[99259] = "general",
		[99516] = "heroic"
	}
end

function mod:OnBossEnable()
	self:Log("SPELL_AURA_APPLIED", "Countdown", 99516)
	self:Log("SPELL_AURA_REMOVED", "CountdownRemoved", 99516)
	self:Log("SPELL_CAST_START", "Shards", 99259)
	self:Log("SPELL_CAST_START", "Blades", 99352, 99350)
	self:Log("SPELL_AURA_APPLIED_DOSE", "Torment", 99256)
	self:RegisterEvent("INSTANCE_ENCOUNTER_ENGAGE_UNIT", "CheckBossStatus")

	self:Death("Win", 53494)
end

function mod:OnEngage()
	self:Berserk(360)
	self:Bar(99259, 99259, 5, 99259) -- Shard of Torment
	self:Bar(-2598, L["blade_bar"], 30, 99352)
	if self:Heroic() then
		self:Bar(99516, L["link_message"], 25, 99516) -- Countdown
		countdownCounter = 1
	end
	shardCounter = 0
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:Blades(args)
	self:Message(-2598, args.spellName, "Attention", args.spellId)
	self:Bar(-2598, L["blade_bar"], 47, args.spellId)
end

function mod:Countdown(args)
	countdownTargets[#countdownTargets + 1] = args.destName
	if UnitIsUnit(args.destName, "player") then
		self:Flash(args.spellId)
	end
	if countdownCounter == 1 then
		self:PrimaryIcon(args.spellId, args.destName)
		countdownCounter = 2
	else
		self:Bar(args.spellId, L["link_message"], 47.6, args.spellId)
		self:TargetMessage(args.spellId, L["link_message"], countdownTargets, "Important", args.spellId, "Alarm")
		self:SecondaryIcon(args.spellId, args.destName)
		countdownCounter = 1
	end
end

function mod:CountdownRemoved(args)
	self:PrimaryIcon(args.spellId)
	self:SecondaryIcon(args.spellId)
end

function mod:Shards(args)
	shardCounter = shardCounter + 1
	self:Message(99259, L["shard_message"]:format(shardCounter), "Urgent", args.spellId, "Alert")
	self:Bar(99259, args.spellName, 34, args.spellId)
end

function mod:Torment(args)
	if UnitIsUnit("focus", args.destName) and args.amount > 1 then
		self:LocalMessage("torment", L["focus_message"]:format(args.amount), "Personal", args.spellId, args.amount > 5 and "Info")
	end
end

