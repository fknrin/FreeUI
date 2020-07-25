local F, C, L = unpack(select(2, ...))
local INFOBAR, cfg = F:GetModule('Infobar'), C.Infobar


local time, date = time, date
local strfind, format, floor = string.find, string.format, math.floor
local mod, tonumber, pairs, ipairs, select = mod, tonumber, pairs, ipairs, select
local C_Map_GetMapInfo = C_Map.GetMapInfo
local C_Calendar_GetDate = C_Calendar.GetDate
local C_Calendar_SetAbsMonth = C_Calendar.SetAbsMonth
local C_Calendar_OpenCalendar = C_Calendar.OpenCalendar
local C_Calendar_GetNumDayEvents = C_Calendar.GetNumDayEvents
local C_Calendar_GetNumPendingInvites = C_Calendar.GetNumPendingInvites
local C_AreaPoiInfo_GetAreaPOISecondsLeft = C_AreaPoiInfo.GetAreaPOISecondsLeft
local C_IslandsQueue_GetIslandsWeeklyQuestID = C_IslandsQueue.GetIslandsWeeklyQuestID
local TIMEMANAGER_TICKER_24HOUR, TIMEMANAGER_TICKER_12HOUR = TIMEMANAGER_TICKER_24HOUR, TIMEMANAGER_TICKER_12HOUR
local FULLDATE, CALENDAR_WEEKDAY_NAMES, CALENDAR_FULLDATE_MONTH_NAMES = FULLDATE, CALENDAR_WEEKDAY_NAMES, CALENDAR_FULLDATE_MONTH_NAMES
local PLAYER_DIFFICULTY_TIMEWALKER, RAID_INFO_WORLD_BOSS, DUNGEON_DIFFICULTY3 = PLAYER_DIFFICULTY_TIMEWALKER, RAID_INFO_WORLD_BOSS, DUNGEON_DIFFICULTY3
local DUNGEONS, RAID_INFO, QUESTS_LABEL, ISLANDS_HEADER, QUEST_COMPLETE = DUNGEONS, RAID_INFO, QUESTS_LABEL, ISLANDS_HEADER, QUEST_COMPLETE
local PVP_CONQUEST, LFG_LIST_LOADING, QUEUE_TIME_UNAVAILABLE = PVP_CONQUEST, LFG_LIST_LOADING, QUEUE_TIME_UNAVAILABLE
local HORRIFIC_VISION = SPLASH_BATTLEFORAZEROTH_8_3_0_FEATURE1_TITLE
local RequestRaidInfo, UnitLevel, GetNumSavedWorldBosses, GetSavedWorldBossInfo = RequestRaidInfo, UnitLevel, GetNumSavedWorldBosses, GetSavedWorldBossInfo
local GetCVarBool, GetGameTime, GameTime_GetLocalTime, GameTime_GetGameTime, SecondsToTime = GetCVarBool, GetGameTime, GameTime_GetLocalTime, GameTime_GetGameTime, SecondsToTime
local GetNumSavedInstances, GetSavedInstanceInfo, GetQuestObjectiveInfo = GetNumSavedInstances, GetSavedInstanceInfo, GetQuestObjectiveInfo
local IsQuestFlaggedCompleted = C_QuestLog.IsQuestFlaggedCompleted
local C_TaskQuest_GetThreatQuests = C_TaskQuest.GetThreatQuests
local C_TaskQuest_GetQuestInfoByQuestID = C_TaskQuest.GetQuestInfoByQuestID
local PVPGetConquestLevelInfo, IsPlayerAtEffectiveMaxLevel = PVPGetConquestLevelInfo, IsPlayerAtEffectiveMaxLevel

local FreeUIReportButton = INFOBAR.FreeUIReportButton

local function updateTimerFormat(color, hour, minute)
	if GetCVarBool('timeMgrUseMilitaryTime') then
		return format(color..TIMEMANAGER_TICKER_24HOUR, hour, minute)
	else
		local timerUnit = C.MyColor..(hour < 12 and 'AM' or 'PM')
		if hour > 12 then hour = hour - 12 end
		return format(color..TIMEMANAGER_TICKER_12HOUR..timerUnit, hour, minute)
	end
end

-- Data
local bonus = {
	52834, 52838,	-- Gold
	52835, 52839,	-- Honor
	52837, 52840,	-- Resources
}
local bonusName = GetCurrencyInfo(1580)

local isTimeWalker, walkerTexture
local function checkTimeWalker(event)
	local date = C_Calendar.GetDate()
	C_Calendar.SetAbsMonth(date.month, date.year)
	C_Calendar.OpenCalendar()

	local today = date.monthDay
	local numEvents = C_Calendar.GetNumDayEvents(0, today)
	if numEvents <= 0 then return end

	for i = 1, numEvents do
		local info = C_Calendar.GetDayEvent(0, today, i)
		if info and strfind(info.title, PLAYER_DIFFICULTY_TIMEWALKER) and info.sequenceType ~= 'END' then
			isTimeWalker = true
			walkerTexture = info.iconTexture
			break
		end
	end
	F:UnregisterEvent(event, checkTimeWalker)
end
F:RegisterEvent('PLAYER_ENTERING_WORLD', checkTimeWalker)

local function checkTexture(texture)
	if not walkerTexture then return end
	if walkerTexture == texture or walkerTexture == texture - 1 then
		return true
	end
end

local questlist = {
	{name = L['INFOBAR_BLINGTRON'], id = 34774},
	{name = L['INFOBAR_MEAN_ONE'], id = 6983},
	{name = L['INFOBAR_TIMEWARPED'], id = 40168, texture = 1129674},	-- TBC
	{name = L['INFOBAR_TIMEWARPED'], id = 40173, texture = 1129686},	-- WotLK
	{name = L['INFOBAR_TIMEWARPED'], id = 40786, texture = 1304688},	-- Cata
	{name = L['INFOBAR_TIMEWARPED'], id = 45799, texture = 1530590},	-- MoP
}

local lesserVisions = {58151, 58155, 58156, 58167, 58168}
local horrificVisions = {
	[1] = {id = 57848, desc = '470 (5+5)'},
	[2] = {id = 57844, desc = '465 (5+4)'},
	[3] = {id = 57847, desc = '460 (5+3)'},
	[4] = {id = 57843, desc = '455 (5+2)'},
	[5] = {id = 57846, desc = '450 (5+1)'},	
	[6] = {id = 57842, desc = '445 (5+0)'},
	[7] = {id = 57845, desc = '430 (3+0)'},
	[8] = {id = 57841, desc = '420 (1+0)'},
}

local region = GetCVar('portal')
local legionZoneTime = {
	['EU'] = 1565168400, -- CN - 16
	['US'] = 1565197200, -- CN - 8
	['CN'] = 1565226000, -- CN time 8/8/2019 09:00 [1]
}
local bfaZoneTime = {
	['CN'] = 1546743600, -- CN time 1/6/2019 11:00 [1]
	['EU'] = 1546768800, -- CN + 7
	['US'] = 1546769340, -- CN + 16
}

local invIndex = {
	[1] = {title = L['INFOBAR_INVASION_LEG'], duration = 66600, maps = {630, 641, 650, 634}, timeTable = {}, baseTime = legionZoneTime[region] or legionZoneTime['CN']},
	[2] = {title = L['INFOBAR_INVASION_BFA'], duration = 68400, maps = {862, 863, 864, 896, 942, 895}, timeTable = {4, 1, 6, 2, 5, 3}, baseTime = bfaZoneTime[region] or bfaZoneTime['CN']},
}

local mapAreaPoiIDs = {
	[630] = 5175,
	[641] = 5210,
	[650] = 5177,
	[634] = 5178,
	[862] = 5973,
	[863] = 5969,
	[864] = 5970,
	[896] = 5964,
	[942] = 5966,
	[895] = 5896,
}

local function getInvasionInfo(mapID)
	local areaPoiID = mapAreaPoiIDs[mapID]
	local seconds = C_AreaPoiInfo_GetAreaPOISecondsLeft(areaPoiID)
	local mapInfo = C_Map_GetMapInfo(mapID)
	return seconds, mapInfo.name
end

local function CheckInvasion(index)
	for _, mapID in pairs(invIndex[index].maps) do
		local timeLeft, name = getInvasionInfo(mapID)
		if timeLeft and timeLeft > 0 then
			return timeLeft, name
		end
	end
end

local function GetNextTime(baseTime, index)
	local currentTime = time()
	local duration = invIndex[index].duration
	local elapsed = mod(currentTime - baseTime, duration)
	return duration - elapsed + currentTime
end

local function GetNextLocation(nextTime, index)
	local inv = invIndex[index]
	local count = #inv.timeTable
	if count == 0 then return QUEUE_TIME_UNAVAILABLE end

	local elapsed = nextTime - inv.baseTime
	local round = mod(floor(elapsed / inv.duration) + 1, count)
	if round == 0 then round = count end
	return C_Map_GetMapInfo(inv.maps[inv.timeTable[round]]).name
end

local cache, nzothAssaults = {}
local function GetNzothThreatName(questID)
	local name = cache[questID]
	if not name then
		name = C_TaskQuest_GetQuestInfoByQuestID(questID)
		cache[questID] = name
	end
	return name
end

local title
local function addTitle(text)
	if not title then
		GameTooltip:AddLine(' ')
		GameTooltip:AddLine(text, .6, .8, 1)
		title = true
	end
end


function INFOBAR:Report()
	if not cfg.report then return end

	FreeUIReportButton = INFOBAR:addButton(L['INFOBAR_REPORT'], INFOBAR.POSITION_RIGHT, 80, function(self, button)
		if button == 'LeftButton' then
			HideUIPanel(GarrisonLandingPage)
			if not C_Garrison.HasGarrison(LE_GARRISON_TYPE_8_0) then return end
			ShowGarrisonLandingPage(LE_GARRISON_TYPE_8_0)
		elseif button == 'RightButton' then
			HideUIPanel(GarrisonLandingPage)
			if not C_Garrison.HasGarrison(LE_GARRISON_TYPE_7_0) then return end
			ShowGarrisonLandingPage(LE_GARRISON_TYPE_7_0)
		elseif button == 'MiddleButton' then
			HideUIPanel(GarrisonLandingPage)
			if not C_Garrison.HasGarrison(LE_GARRISON_TYPE_6_0) then return end
			ShowGarrisonLandingPage(LE_GARRISON_TYPE_6_0)
		end
	end)

	FreeUIReportButton:HookScript('OnEnter', function(self)
		RequestRaidInfo()

		local r, g, b
		GameTooltip:SetOwner(self, (cfg.top and 'ANCHOR_BOTTOM') or 'ANCHOR_TOP', 0, (cfg.top and -15) or 15)
		GameTooltip:ClearLines()
		GameTooltip:AddLine(L['INFOBAR_DAILY_WEEKLY_INFO'], .9, .8, .6)

		-- World bosses
		title = false
		for i = 1, GetNumSavedWorldBosses() do
			local name, id, reset = GetSavedWorldBossInfo(i)
			if not (id == 11 or id == 12 or id == 13) then
				addTitle(RAID_INFO_WORLD_BOSS)
				GameTooltip:AddDoubleLine(name, SecondsToTime(reset, true, nil, 3), 1, 1, 1, 1, 1, 1)
			end
		end

		-- Mythic Dungeons
		title = false
		for i = 1, GetNumSavedInstances() do
			local name, _, reset, diff, locked, extended = GetSavedInstanceInfo(i)
			if diff == 23 and (locked or extended) then
				addTitle(DUNGEON_DIFFICULTY3..DUNGEONS)
				if extended then r, g, b = .3, 1, .3 else r, g, b = 1, 1, 1 end
				GameTooltip:AddDoubleLine(name, SecondsToTime(reset, true, nil, 3), 1, 1, 1, r, g, b)
			end
		end

		-- Raids
		title = false
		for i = 1, GetNumSavedInstances() do
			local name, _, reset, _, locked, extended, _, isRaid, _, diffName = GetSavedInstanceInfo(i)
			if isRaid and (locked or extended) then
				addTitle(RAID_INFO)
				if extended then r, g, b = .3, 1, .3 else r, g, b = 1, 1, 1 end
				GameTooltip:AddDoubleLine(name..' - '..diffName, SecondsToTime(reset, true, nil, 3), 1, 1, 1, r, g, b)
			end
		end

		-- Quests
		title = false
		local count, maxCoins = 0, 2
		for _, id in pairs(bonus) do
			if IsQuestFlaggedCompleted(id) then
				count = count + 1
			end
		end
		if count > 0 then
			addTitle(QUESTS_LABEL)
			if count == maxCoins then r, g, b = 1, 0, 0 else r, g, b = 0, 1, 0 end
			GameTooltip:AddDoubleLine(bonusName, count..'/'..maxCoins, 1, 1, 1, r, g, b)
		end

		do
			local currentValue, maxValue, questID = PVPGetConquestLevelInfo()
			local questDone = questID and questID == 0
			if IsPlayerAtEffectiveMaxLevel() then
				if questDone then
					addTitle(QUESTS_LABEL)
					GameTooltip:AddDoubleLine(PVP_CONQUEST, QUEST_COMPLETE, 1,1,1, 1,0,0)
				elseif currentValue > 0 then
					addTitle(QUESTS_LABEL)
					GameTooltip:AddDoubleLine(PVP_CONQUEST, currentValue..'/'..maxValue, 1,1,1, 0,1,0)
				end
			end
		end

		for _, v in ipairs(horrificVisions) do
			if IsQuestFlaggedCompleted(v.id) then
				addTitle(QUESTS_LABEL)
				GameTooltip:AddDoubleLine(HORRIFIC_VISION, v.desc, 1,1,1, 0,1,0)
				break
			end
		end

		local iwqID = C_IslandsQueue_GetIslandsWeeklyQuestID()
		if iwqID and UnitLevel('player') == 120 then
			addTitle(QUESTS_LABEL)
			if IsQuestFlaggedCompleted(iwqID) then
				GameTooltip:AddDoubleLine(ISLANDS_HEADER, QUEST_COMPLETE, 1,1,1, 1,0,0)
			else
				local cur, max = select(4, GetQuestObjectiveInfo(iwqID, 1, false))
				local stautsText = cur..'/'..max
				if not cur or not max then stautsText = LFG_LIST_LOADING end
				GameTooltip:AddDoubleLine(ISLANDS_HEADER, stautsText, 1,1,1, 0,1,0)
			end
		end

		for _, id in pairs(lesserVisions) do
			if IsQuestFlaggedCompleted(id) then
				addTitle(QUESTS_LABEL)
				GameTooltip:AddDoubleLine(L['LesserVision'], QUEST_COMPLETE, 1,1,1, 1,0,0)
				break
			end
		end

		if not nzothAssaults then
			nzothAssaults = C_TaskQuest_GetThreatQuests() or {}
		end
		for _, v in pairs(nzothAssaults) do
			if IsQuestFlaggedCompleted(v) then
				addTitle(QUESTS_LABEL)
				GameTooltip:AddDoubleLine(GetNzothThreatName(v), QUEST_COMPLETE, 1,1,1, 1,0,0)
			end
		end

		for _, v in pairs(questlist) do
			if v.name and IsQuestFlaggedCompleted(v.id) then
				if v.name == L['INFOBAR_TIMEWARPED'] and isTimeWalker and checkTexture(v.texture) or v.name ~= L['INFOBAR_TIMEWARPED'] then
					addTitle(QUESTS_LABEL)
					GameTooltip:AddDoubleLine(v.name, QUEST_COMPLETE, 1, 1, 1, 0, 1, 0)
				end
			end
		end

		-- Invasions
		for index, value in ipairs(invIndex) do
			title = false
			addTitle(value.title)
			local timeLeft, zoneName = CheckInvasion(index)
			local nextTime = GetNextTime(value.baseTime, index)
			if timeLeft then
				timeLeft = timeLeft/60
				if timeLeft < 60 then r, g, b = 1, 0, 0 else r, g, b = 0, 1, 0 end
				GameTooltip:AddDoubleLine(L['INFOBAR_INVASION_CURRENT']..zoneName, format('%.2d:%.2d', timeLeft/60, timeLeft%60), 1, 1, 1, r, g, b)
			end
			local nextLocation = GetNextLocation(nextTime, index)
			GameTooltip:AddDoubleLine(L['INFOBAR_INVASION_NEXT']..nextLocation, date('%m/%d %H:%M', nextTime), 1,1,1, 1,1,1)
		end

		local iwqID = C_IslandsQueue.GetIslandsWeeklyQuestID()
		if iwqID and UnitLevel('player') == 120 then
			title = false
			addTitle(ISLANDS_HEADER)

			if IsQuestFlaggedCompleted(iwqID) then
				GameTooltip:AddDoubleLine(L['INFOBAR_ISLAND'], QUEST_COMPLETE, 1, 1, 1, 0, 1, 0)
			else
				local cur, max = select(4, GetQuestObjectiveInfo(iwqID, 1, false))
				local stautsText = cur..'/'..max
				if not cur or not max then stautsText = LFG_LIST_LOADING end
				GameTooltip:AddDoubleLine(L['INFOBAR_ISLAND'], stautsText, 1, 1, 1, 1, 0, 0)
			end
		end

		if UnitLevel('player') == 120 then
			GameTooltip:AddLine(' ')
			GameTooltip:AddDoubleLine(' ', C.LineString)
			GameTooltip:AddDoubleLine(' ', C.Assets.mouse_left..L['INFOBAR_OPEN_BFA_REPORT'], 1, 1, 1, .9, .8, .6)
			GameTooltip:AddDoubleLine(' ', C.Assets.mouse_right..L['INFOBAR_OPEN_LEG_REPORT'], 1, 1, 1, .9, .8, .6)
			GameTooltip:AddDoubleLine(' ', C.Assets.mouse_middle..L['INFOBAR_OPEN_WOD_REPORT'], 1, 1, 1, .9, .8, .6)
		end
		
		GameTooltip:Show()
	end)

	FreeUIReportButton:HookScript('OnLeave', function(self)
		GameTooltip:Hide()
	end)

	GarrisonLandingPageMinimapButton:SetSize(1, 1)
	GarrisonLandingPageMinimapButton:SetAlpha(0)
	GarrisonLandingPageMinimapButton:EnableMouse(false)
end

