local F, C, L = unpack(select(2, ...))
local INFOBAR = F:GetModule('INFOBAR')


local format, wipe, select, next = string.format, table.wipe, select, next
local SPECIALIZATION, TALENTS_BUTTON, MAX_TALENT_TIERS = SPECIALIZATION, TALENTS_BUTTON, MAX_TALENT_TIERS
local SHOW_PVP_TALENT_LEVEL, PVP_TALENTS, LOOT_SPECIALIZATION_DEFAULT = SHOW_PVP_TALENT_LEVEL, PVP_TALENTS, LOOT_SPECIALIZATION_DEFAULT
local GetSpecialization, GetSpecializationInfo, GetLootSpecialization, GetSpecializationInfoByID = GetSpecialization, GetSpecializationInfo, GetLootSpecialization, GetSpecializationInfoByID
local GetTalentInfo, UnitLevel, GetCurrencyInfo, GetPvpTalentInfoByID, SetLootSpecialization, SetSpecialization = GetTalentInfo, UnitLevel, GetCurrencyInfo, GetPvpTalentInfoByID, SetLootSpecialization, SetSpecialization
local C_SpecializationInfo_GetAllSelectedPvpTalentIDs = C_SpecializationInfo.GetAllSelectedPvpTalentIDs

local pvpTalents
local FreeUISpecButton = INFOBAR.FreeUISpecButton
local currentSpec = GetSpecialization()
local numSpec = GetNumSpecializations()

local function addIcon(texture)
	texture = texture and '|T'..texture..':12:16:0:0:50:50:4:46:4:46|t' or ''
	return texture
end

local menuFrame = CreateFrame('Frame', 'SpecInfobarMenu', FreeUISpecButton, 'UIDropDownMenuTemplate')
local menuList = {
	{text = CHOOSE_SPECIALIZATION, isTitle = true, notCheckable = true},
	{text = SPECIALIZATION, hasArrow = true, notCheckable = true},
	{text = SELECT_LOOT_SPECIALIZATION, hasArrow = true, notCheckable = true},
}

local function clickFunc(i, isLoot)
	if not i then return end
	if isLoot then
		SetLootSpecialization(i)
	else
		SetSpecialization(i)
	end
	DropDownList1:Hide()
end

function INFOBAR:SpecTalent()
	if not FreeDB.infobar.spec then return end

	FreeUISpecButton = INFOBAR:addButton('', INFOBAR.POSITION_RIGHT, 300, function(self, button)
		local specIndex = GetSpecialization()
		if not specIndex then return end

		if button == 'LeftButton' then
			if InCombatLockdown() then UIErrorsFrame:AddMessage(C.InfoColor..ERR_NOT_IN_COMBAT) return end
			ToggleTalentFrame(2)
		else
			menuList[2].menuList = {{}, {}, {}, {}}
			menuList[3].menuList = {{}, {}, {}, {}, {}}
			local specList, lootList = menuList[2].menuList, menuList[3].menuList
			local spec, specName = GetSpecializationInfo(specIndex)
			local lootSpec = GetLootSpecialization()
			lootList[1] = {text = format(LOOT_SPECIALIZATION_DEFAULT, specName), func = function() clickFunc(0, true) end, checked = lootSpec == 0 and true or false}

			for i = 1, 4 do
				local id, name = GetSpecializationInfo(i)
				if id then
					specList[i].text = name
					if id == spec then
						specList[i].func = function() clickFunc() end
						specList[i].checked = true
					else
						specList[i].func = function() clickFunc(i) end
						specList[i].checked = false
					end
					lootList[i+1] = {text = name, func = function() clickFunc(id, true) end, checked = id == lootSpec and true or false}
				else
					specList[i] = nil
					lootList[i+1] = nil
				end
			end

			EasyMenu(menuList, menuFrame, self, -80, 100, 'MENU', 1)
			GameTooltip:Hide()
		end
	end)

	FreeUISpecButton:RegisterEvent('PLAYER_ENTERING_WORLD')
	FreeUISpecButton:RegisterEvent('ACTIVE_TALENT_GROUP_CHANGED')
	FreeUISpecButton:RegisterEvent('PLAYER_LOOT_SPEC_UPDATED')
	FreeUISpecButton:SetScript('OnEvent', function(self)
		local currentSpec = GetSpecialization()
		local lootSpecID = GetLootSpecialization()

		if currentSpec then
			local _, name = GetSpecializationInfo(currentSpec)
			if not name then return end
			local _, lootname = GetSpecializationInfoByID(lootSpecID)
			local role = GetSpecializationRole(currentSpec)
			local lootrole = GetSpecializationRoleByID(lootSpecID)

			if not lootname or name == lootname then
				self.Text:SetText(format(L['INFOBAR_SPEC']..': '..C.MyColor..'%s  |r'..L['INFOBAR_LOOT']..':'..C.MyColor..' %s', name, name))
			else
				self.Text:SetText(format(L['INFOBAR_SPEC']..': '..C.MyColor..'%s  |r'..L['INFOBAR_LOOT']..':'..C.MyColor..' %s', name, lootname))
			end

			INFOBAR:showButton(self)
		else
			INFOBAR:hideButton(self)
		end
	end)

	FreeUISpecButton:HookScript('OnEnter', function(self)
		if not GetSpecialization() then return end
		GameTooltip:SetOwner(self, (FreeDB.infobar.anchor_top and 'ANCHOR_BOTTOM') or 'ANCHOR_TOP', 0, (FreeDB.infobar.anchor_top and -15) or 15)
		GameTooltip:ClearLines()
		GameTooltip:AddLine(TALENTS_BUTTON, .9, .8, .6)
		GameTooltip:AddLine(' ')

		local _, specName, _, specIcon = GetSpecializationInfo(GetSpecialization())
		GameTooltip:AddLine(addIcon(specIcon)..' '..specName, .6,.8,1)

		for t = 1, MAX_TALENT_TIERS do
			for c = 1, 3 do
				local _, name, icon, selected = GetTalentInfo(t, c, 1)
				if selected then
					GameTooltip:AddLine(addIcon(icon)..' '..name, 1, 1, 1)
				end
			end
		end

		if UnitLevel('player') >= SHOW_PVP_TALENT_LEVEL then
			pvpTalents = C_SpecializationInfo.GetAllSelectedPvpTalentIDs()

			if #pvpTalents > 0 then
				local texture = select(3, GetCurrencyInfo(104))
				GameTooltip:AddLine(' ')
				GameTooltip:AddLine(addIcon(texture)..' '..PVP_TALENTS, .6,.8,1)
				for _, talentID in next, pvpTalents do
					local _, name, icon, _, _, _, unlocked = GetPvpTalentInfoByID(talentID)
					if name and unlocked then
						GameTooltip:AddLine(addIcon(icon)..' '..name, 1, 1, 1)
					end
				end
			end

			wipe(pvpTalents)
		end

		GameTooltip:AddDoubleLine(' ', C.LineString)
		GameTooltip:AddDoubleLine(' ', C.Assets.mouse_left..L['INFOBAR_OPEN_SPEC_PANEL']..' ', 1,1,1, .9, .8, .6)
		GameTooltip:AddDoubleLine(' ', C.Assets.mouse_right..L['INFOBAR_CHANGE_SPEC']..' ', 1,1,1, .9, .8, .6)
		GameTooltip:Show()
	end)

	FreeUISpecButton:HookScript('OnLeave', function(self)
		GameTooltip:Hide()
	end)
end
