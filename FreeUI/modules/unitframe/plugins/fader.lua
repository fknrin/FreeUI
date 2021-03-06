local F, C = unpack(select(2, ...))
local UNITFRAME = F:GetModule('UNITFRAME')
local oUF = F.oUF


local strmatch, gmatch = string.match, string.gmatch
local objects, addon = {}, CreateFrame("Frame")

local _, powerToken = _G.UnitPowerType("player")
local reversePowers = {
    ["RAGE"] = true,
    ["RUNIC_POWER"] = true,
    ["POWER_TYPE_SUN_POWER"] = true,
    ["LUNAR_POWER"] = true,
    ["INSANITY"] = true,
    ["MAELSTROM"] = true,
    ["FURY"] = true,
    ["PAIN"] = true,
}

local function isPowerRested(token)
    if reversePowers[token] then
        return _G.UnitPower("player") == 0
    else
        return _G.UnitPower("player") == _G.UnitPowerMax("player")
    end
end


-- Events
local events = setmetatable({
	Combat = "PLAYER_REGEN_ENABLED:PLAYER_REGEN_DISABLED",
	PlayerTarget = "PLAYER_TARGET_CHANGED",
	PlayerHostileTarget = "PLAYER_TARGET_CHANGED",
	PlayerFocus = "PLAYER_FOCUS_CHANGED",
	PlayerHostileFocus = "PLAYER_FOCUS_CHANGED",
	UnitTarget = "UNIT_TARGET",
	UnitHostileTarget = "UNIT_TARGET",
	Resting = "PLAYER_UPDATE_RESTING",
	Flying = "UNIT_FLAGS",
	PlayerTaxi = "UNIT_FLAGS",
	UnitTaxi = "UNIT_FLAGS",
	PlayerMaxHealth = "UNIT_HEALTH",
	UnitMaxHealth = "UNIT_HEALTH",
	PlayerMaxMana = "UNIT_POWER_UPDATE",
	UnitMaxMana = "UNIT_POWER_UPDATE",
	PlayerHasPower = "UNIT_POWER_UPDATE",
	Stealth = "UPDATE_STEALTH",
	PlayerNotMaxHealth = "UNIT_HEALTH",
	PlayerNotMaxMana = "UNIT_POWER_UPDATE",
	Arena = "ZONE_CHANGED_NEW_AREA",
    Instance = "PLAYER_ENTERING_WORLD",


    PlayerCasting = "UNIT_SPELLCAST_START:UNIT_SPELLCAST_FAILED:UNIT_SPELLCAST_STOP",
    PlayerChanneling = "UNIT_SPELLCAST_CHANNEL_START:UNIT_SPELLCAST_CHANNEL_UPDATE:UNIT_SPELLCAST_CHANNEL_STOP",


}, {__index = function(events, k)
	local cond = strmatch(k, "not(.+)")
	assert(rawget(events, cond), format("Missing event for condition %s", k))
	events[k] = events[cond]
	return events[cond]
end})

-- Conditions
local conditions = setmetatable({
	PlayerHostileTarget = function() return UnitCanAttack("player", "target") end,
	PlayerHostileFocus = function() return UnitCanAttack("player", "focus") end,
	UnitHostileTarget = function(_, unit) return unit and UnitCanAttack(unit, unit.."target") end,
	PlayerTarget = function() return UnitExists("target") end,
	PlayerFocus = function() return UnitExists("focus") end,
	UnitTarget = function(_, unit) return unit and UnitExists(unit.."target") end,
	PlayerTaxi = function() return UnitOnTaxi("player") end,
	UnitTaxi = function(_, unit) return unit and UnitOnTaxi(unit) end,
	UnitMaxHealth = function(_, unit) return unit and not UnitIsDeadOrGhost(unit) and UnitHealth(unit) == UnitHealthMax(unit) end,
	PlayerMaxHealth = function(_, unit) return unit and not UnitIsDeadOrGhost("player") and UnitHealth("player") == UnitHealthMax("player") end,
	UnitMaxMana = function(_, unit) return unit and not UnitIsDeadOrGhost(unit) and UnitPower(unit) == UnitPowerMax(unit) end,
	PlayerMaxMana = function(_, unit) return unit and not UnitIsDeadOrGhost("player") and UnitPower("player") == UnitPowerMax("player") end,

	Stealth = IsStealthed,
	Flying = IsFlying,
	Resting = IsResting,
	Combat = InCombatLockdown,

	PlayerNotMaxHealth = function(_, unit)
		return unit and UnitHealth("player") ~= UnitHealthMax("player")
	end,

	PlayerNotMaxMana = function(_, unit)
		if powerToken == "MANA" then
			return unit and UnitPower("player") ~= UnitPowerMax("player")
		end
	end,

	PlayerHasPower = function(_, unit)
		if not isPowerRested(powerToken) then
			return unit
		end
    end,

    PlayerCasting = function(_, unit)
        if UnitCastingInfo("player") then
            return unit
        end
    end,

    PlayerChaneling = function(_, unit)
        if UnitChannelInfo("player") then
            return unit
        end
    end,

	Arena = function(_, unit) return unit and GetZonePVPInfo() == "arena" end,

	Instance = function(_, unit) return unit and IsInInstance() == true end,

}, {__index = function(t, k)
	local cond = strmatch(k, "not(.+)")
	assert(rawget(t, cond), format("Missing condition %s", k))
	t[k] = function(...)
		return not t[cond](...)
	end
	return t[k]
end})

function addon:RegisterCondition(name, func, event)
	assert(type(name) == "string", format("Bad argument #1 to \"RegisterCondition\" (string expected, got %s)", type(name)))
	assert(type(func) == "function", format("Bad argument #2 to \"RegisterCondition\" (function expected, got %s)", type(func)))
	assert(type(event) == "string", format("Bad argument #3 to \"RegisterCondition\" (string expected, got %s)", type(event)))

	conditions[name] = func
	events[name] = event
end

-- Update the Alpha or obj
local function UpdateAlpha(obj)
	local alpha
	for _, tbl in ipairs(obj.Fader) do
		for cond, condalpha in pairs(tbl) do
			if conditions[cond](obj, obj.unit) then
				alpha = not alpha and condalpha or condalpha > alpha and condalpha or alpha
			end
		end
		if alpha then
			break
		end
	end

	alpha = alpha or obj.NormalAlpha
	if obj.Range then
		obj.inRangeAlpha = alpha
		obj.outsideRangeAlpha = alpha * obj.outsideRangeAlphaPerc
    end

	F:UIFrameFadeIn(obj, 0.3, obj:GetAlpha(), alpha)


    --[[ obj:SetScript("OnEnter", function(self)
        F:UIFrameFadeIn(self, 0.3, self:GetAlpha(), 1)
        UnitFrame_OnEnter(obj)
    end)

    obj:SetScript("OnLeave", function(self)
        F:UIFrameFadeOut(self, 0.3, self:GetAlpha(), alpha)
        UnitFrame_OnLeave(obj)
    end) ]]

end

local t = 0
local function OnUpdate(addon, el) -- I do this because it's easier than passing events to conditions
	t = t + el
	if t > 0.1 then
		t = 0
		for _, v in ipairs(objects) do
			UpdateAlpha(v)
		end
		addon:Hide()
	end
end

oUF:RegisterInitCallback(
	function(obj)
		if obj.Fader then
			for _, tbl in ipairs(obj.Fader) do
				for name in pairs(tbl) do
					for event in gmatch(events[name], "[^:]+") do
						addon:RegisterEvent(event)
					end
				end
			end

			obj.NormalAlpha = obj.NormalAlpha or obj:GetAlpha()
            obj.outsideRangeAlphaPerc = obj.outsideRangeAlphaPerc or obj.outsideRangeAlpha
            --obj.outsideAlphaPerc = obj.outsideAlphaPerc or obj.outsideAlpha
			UpdateAlpha(obj)
			objects[#objects + 1] = obj
		end
	end
)
addon:SetScript("OnEvent", addon.Show)
addon:SetScript("OnUpdate", OnUpdate)

addon.Conditions = conditions
addon.Events = events
oUF.Fader = addon
