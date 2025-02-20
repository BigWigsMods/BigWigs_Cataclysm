--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Shannox", 720, 195)
if not mod then return end
mod:RegisterEnableMob(53691, 53695, 53694) --Shannox, Rageface, Riplimb
mod:SetEncounterID(1205)
mod:SetRespawnTime(30)

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale("enUS", true)
if L then
	L.safe = "%s safe"
	L.wary_dog = "%s is Wary!"
	L.crystal_trap = "Crystal Trap"

	L.traps_header = "Traps"
	L.immolation = "Immolation Trap on Dog"
	L.immolation_desc = "Alert when Rageface or Riplimb steps on an Immolation Trap, gaining the 'Wary' buff."
	L.immolation_icon = 100167
	L.immolationyou = "Immolation Trap under You"
	L.immolationyou_desc = "Alert when an Immolation Trap is summoned under you."
	L.immolationyou_icon = 99838
	L.immolationyou_message = "Immolation Trap"
	L.crystal = "Crystal Trap"
	L.crystal_desc = "Warn whom Shannox casts a Crystal Trap under."
	L.crystal_icon = 99836
	L.facerage_trigger = "Go for the throat!"
end
L = mod:GetLocale()

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		100002, -- Hurl Spear
		{100129, "ICON"}, -- Face Rage
		"berserk",
		"immolation",
		{"immolationyou", "FLASH"},
		{"crystal", "SAY", "FLASH"},
	},{
		[100002] = "general",
		["immolation"] = L["traps_header"],
	}
end

function mod:OnBossEnable()
	self:Log("SPELL_AURA_APPLIED", "ImmolationTrapApplied", 99838)
	self:Log("SPELL_CAST_SUCCESS", "FaceRage", 99945, 99947)
	self:Log("SPELL_AURA_REMOVED", "FaceRageRemoved", 99945, 99947)
	self:Log("SPELL_CAST_SUCCESS", "HurlSpear", 99978, 100002) -- Retail?, Cataclysm Classic
	self:Log("SPELL_SUMMON", "Traps", 99836, 99839) -- Throw Crystal Prison Trap, Throw Immolation Trap
	self:BossYell("FaceRageTrigger", L["facerage_trigger"]) -- BossYell is more accurate than SPELL_CAST_SUCCESS for Face Rage cooldown
end

function mod:OnEngage()
	self:Bar(100002, 23) -- Hurl Spear
	self:CDBar(100129, 15) -- Face Rage
	self:Berserk(600)
end

--------------------------------------------------------------------------------
-- Event Handlers
--

do
	local timer, fired = nil, 0
	local function trapWarn(spellId)
		fired = fired + 1
		local guid = mod:UnitGUID("boss1target")
		if guid and (not mod:Tanking("boss1", "boss1target") or fired > 13) then
			-- If we've done 14 (0.7s) checks and still not passing the threat check, it's probably being cast on the tank
			if spellId == 99836 then
				mod:TargetMessageOld("crystal", mod:UnitName("boss1target"), "orange", "alarm", L["crystal_trap"], spellId)
			end
			mod:CancelTimer(timer)
			timer = nil
			if mod:Me(guid) then
				if spellId == 99836 then
					mod:Flash("crystal", spellId)
					mod:Say("crystal", L["crystal_trap"], nil, "Crystal Trap")
				else
					mod:Flash("immolationyou", spellId)
					mod:MessageOld("immolationyou", "blue", "alarm", CL["underyou"]:format(L["immolationyou_message"]), spellId)
				end
			end
			return
		end
		-- 19 == 0.95sec
		-- Safety check if the unit doesn't exist
		if fired > 18 then
			mod:CancelTimer(timer)
			timer = nil
		end
	end
	function mod:Traps(args)
		fired = 0
		if not timer then
			timer = self:ScheduleRepeatingTimer(trapWarn, 0.05, args.spellId)
		end
	end
end

function mod:ImmolationTrapApplied(args)
	-- We use the Immolation Trap IDs as we only want to warn for Wary after a
	-- Immolation Trap not a Crystal Trap, which also applies Wary.
	local creatureId = self:MobId(args.destGUID)
	if creatureId == 53695 or creatureId == 53694 then
		self:MessageOld("immolation", "yellow", nil, L["wary_dog"]:format(args.destName), 100167)
		self:Bar("immolation", self:Heroic() and 25 or 15, L["wary_dog"]:format(args.destName), 100167)
	end
end

function mod:HurlSpear()
	self:MessageOld(100002, "yellow", "info")
	self:Bar(100002, 41)
end

function mod:FaceRage(args)
	self:TargetMessageOld(100129, args.destName, "red", "alert")
	self:PrimaryIcon(100129, args.destName)
end

function mod:FaceRageRemoved(args)
	self:MessageOld(100129, "green", nil, L["safe"]:format(args.destName))
	self:PrimaryIcon(100129)
end

function mod:FaceRageTrigger()
	self:CDBar(100129, 30)
end
