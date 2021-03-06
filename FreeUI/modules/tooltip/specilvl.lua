local F, C, L = unpack(select(2, ...))
local TOOLTIP = F:GetModule('TOOLTIP')


-- Credit: Cloudy Unit Info, by Cloudyfa
local select, max, strfind, format, strsplit = select, math.max, string.find, string.format, string.split
local GetTime, CanInspect, NotifyInspect, ClearInspectPlayer, IsShiftKeyDown = GetTime, CanInspect, NotifyInspect, ClearInspectPlayer, IsShiftKeyDown
local UnitGUID, UnitClass, UnitIsUnit, UnitIsPlayer, UnitIsVisible, UnitIsDeadOrGhost, UnitOnTaxi = UnitGUID, UnitClass, UnitIsUnit, UnitIsPlayer, UnitIsVisible, UnitIsDeadOrGhost, UnitOnTaxi
local GetInventoryItemTexture, GetInventoryItemLink, GetItemInfo, GetItemGem, GetAverageItemLevel = GetInventoryItemTexture, GetInventoryItemLink, GetItemInfo, GetItemGem, GetAverageItemLevel
local GetSpecialization, GetSpecializationInfo, GetInspectSpecialization, GetSpecializationInfoByID = GetSpecialization, GetSpecializationInfo, GetInspectSpecialization, GetSpecializationInfoByID
local HEIRLOOMS, LE_ITEM_QUALITY_ARTIFACT, LE_ITEM_QUALITY_HEIRLOOM = HEIRLOOMS, LE_ITEM_QUALITY_ARTIFACT, LE_ITEM_QUALITY_HEIRLOOM

local specPrefix = SPECIALIZATION..': '..C.InfoColor
local levelPrefix = L['TOOLTIP_ILVL']..': '..C.InfoColor
local isPending = LFG_LIST_LOADING
local resetTime, frequency = 900, .5
local cache, weapon, currentUNIT, currentGUID = {}, {}

function TOOLTIP:InspectOnUpdate(elapsed)
	self.elapsed = (self.elapsed or frequency) + elapsed
	if self.elapsed > frequency then
		self.elapsed = 0
		self:Hide()
		ClearInspectPlayer()

		if currentUNIT and UnitGUID(currentUNIT) == currentGUID then
			F:RegisterEvent('INSPECT_READY', TOOLTIP.GetInspectInfo)
			NotifyInspect(currentUNIT)
		end
	end
end

local updater = CreateFrame('Frame')
updater:SetScript('OnUpdate', TOOLTIP.InspectOnUpdate)
updater:Hide()

function TOOLTIP:ResetUnit(btn)
	if btn == 'ALT' and UnitExists('mouseover') then
		GameTooltip:SetUnit('mouseover')
	end
end
F:RegisterEvent('MODIFIER_STATE_CHANGED', TOOLTIP.ResetUnit)

function TOOLTIP:GetInspectInfo(...)
	if self == 'UNIT_INVENTORY_CHANGED' then
		local unit = ...
		if UnitGUID(unit) == currentGUID then
			TOOLTIP:InspectUnit(unit, true)
		end
	elseif self == 'INSPECT_READY' then
		local guid = ...
		if guid == currentGUID then
			local spec = TOOLTIP:GetUnitSpec(currentUNIT)
			local level = TOOLTIP:GetUnitItemLevel(currentUNIT)
			cache[guid].spec = spec
			cache[guid].level = level
			cache[guid].getTime = GetTime()

			if spec and level then
				TOOLTIP:SetupSpecLevel(spec, level)
			else
				TOOLTIP:InspectUnit(currentUNIT, true)
			end
		end
		F:UnregisterEvent(self, TOOLTIP.GetInspectInfo)
	end
end
F:RegisterEvent('UNIT_INVENTORY_CHANGED', TOOLTIP.GetInspectInfo)

function TOOLTIP:SetupSpecLevel(spec, level)
	local _, unit = GameTooltip:GetUnit()
	if not unit or UnitGUID(unit) ~= currentGUID then return end

	local specLine, levelLine
	for i = 2, GameTooltip:NumLines() do
		local line = _G['GameTooltipTextLeft'..i]
		local text = line:GetText()
		if text and strfind(text, specPrefix) then
			specLine = line
		elseif text and strfind(text, levelPrefix) then
			levelLine = line
		end
	end

	spec = specPrefix..(spec or isPending)
	if specLine then
		specLine:SetText(spec)
	else
		GameTooltip:AddLine(spec)
	end

	level = levelPrefix..(level or isPending)
	if levelLine then
		levelLine:SetText(level)
	else
		GameTooltip:AddLine(level)
	end
end

function TOOLTIP:GetUnitItemLevel(unit)
	if not unit or UnitGUID(unit) ~= currentGUID then return end

	local class = select(2, UnitClass(unit))
	local ilvl, boa, total, haveWeapon, twohand = 0, 0, 0, 0, 0
	local delay, mainhand, offhand, hasArtifact
	weapon[1], weapon[2] = 0, 0

	for i = 1, 17 do
		if i ~= 4 then
			local itemTexture = GetInventoryItemTexture(unit, i)

			if itemTexture then
				local itemLink = GetInventoryItemLink(unit, i)

				if not itemLink then
					delay = true
				else
					local _, _, quality, level, _, _, _, _, slot = GetItemInfo(itemLink)
					if (not quality) or (not level) then
						delay = true
					else
						if quality == LE_ITEM_QUALITY_HEIRLOOM then
							boa = boa + 1
						end

						if unit ~= 'player' then
							level = F.GetItemLevel(itemLink) or level
							if i < 16 then
								total = total + level
							elseif i > 15 and quality == LE_ITEM_QUALITY_ARTIFACT then
								local relics = {select(4, strsplit(':', itemLink))}
								for i = 1, 3 do
									local relicID = relics[i] ~= '' and relics[i]
									local relicLink = select(2, GetItemGem(itemLink, i))
									if relicID and not relicLink then
										delay = true
										break
									end
								end
							end

							if i == 16 then
								if quality == LE_ITEM_QUALITY_ARTIFACT then hasArtifact = true end

								weapon[1] = level
								haveWeapon = haveWeapon + 1
								if slot == 'INVTYPE_2HWEAPON' or slot == 'INVTYPE_RANGED' or (slot == 'INVTYPE_RANGEDRIGHT' and class == 'HUNTER') then
									mainhand = true
									twohand = twohand + 1
								end
							elseif i == 17 then
								weapon[2] = level
								haveWeapon = haveWeapon + 1
								if slot == 'INVTYPE_2HWEAPON' then
									offhand = true
									twohand = twohand + 1
								end
							end
						end
					end
				end
			end
		end
	end

	if not delay then
		if unit == 'player' then
			ilvl = select(2, GetAverageItemLevel())
		else
			if hasArtifact or twohand == 2 then
				local higher = max(weapon[1], weapon[2])
				total = total + higher*2
			elseif twohand == 1 and haveWeapon == 1 then
				total = total + weapon[1]*2 + weapon[2]*2
			elseif twohand == 1 and haveWeapon == 2 then
				if mainhand and weapon[1] >= weapon[2] then
					total = total + weapon[1]*2
				elseif offhand and weapon[2] >= weapon[1] then
					total = total + weapon[2]*2
				else
					total = total + weapon[1] + weapon[2]
				end
			else
				total = total + weapon[1] + weapon[2]
			end
			ilvl = total / 16
		end

		if ilvl > 0 then ilvl = format('%.1f', ilvl) end
		if boa > 0 then ilvl = ilvl..' |cff00ccff('..boa..HEIRLOOMS..')' end
	else
		ilvl = nil
	end

	return ilvl
end

function TOOLTIP:GetUnitSpec(unit)
	if not unit or UnitGUID(unit) ~= currentGUID then return end

	local specName
	if unit == 'player' then
		local specIndex = GetSpecialization()
		if specIndex then
			specName = select(2, GetSpecializationInfo(specIndex))
		end
	else
		local specID = GetInspectSpecialization(unit)
		if specID and specID > 0 then
			specName = select(2, GetSpecializationInfoByID(specID))
		end
	end

	return specName
end

function TOOLTIP:InspectUnit(unit, forced)
	local spec, level

	if UnitIsUnit(unit, 'player') then
		spec = self:GetUnitSpec('player')
		level = self:GetUnitItemLevel('player')
		self:SetupSpecLevel(spec, level)
	else
		if not unit or UnitGUID(unit) ~= currentGUID then return end
		if not UnitIsPlayer(unit) then return end

		local currentDB = cache[currentGUID]
		spec = currentDB.spec
		level = currentDB.level
		self:SetupSpecLevel(spec, level)

		if IsShiftKeyDown() then forced = true end
		if spec and level and not forced and (GetTime() - currentDB.getTime < resetTime) then updater.elapsed = frequency return end
		if not UnitIsVisible(unit) or UnitIsDeadOrGhost('player') or UnitOnTaxi('player') then return end
		if InspectFrame and InspectFrame:IsShown() then return end

		self:SetupSpecLevel()
		updater:Show()
	end
end

function TOOLTIP:InspectUnitSpecAndLevel()
	if not FreeDB.tooltip.spec_ilvl or not IsAltKeyDown() then return end

	local _, unit = self:GetUnit()
	if not unit or not CanInspect(unit) then return end

	currentUNIT, currentGUID = unit, UnitGUID(unit)
	if not cache[currentGUID] then cache[currentGUID] = {} end

	TOOLTIP:InspectUnit(unit)
end
