local F, C, L = unpack(select(2, ...))
if not C.infoBar.enable then return end

local module = F:GetModule("infobar")


local format, min = string.format, math.min
local sort, wipe = table.sort, table.wipe

local memory
local _, _, home, world = GetNetStats()
local addons = {}
local n, total = 0, 0
local last = 0
local lastLag = 0

local holder = CreateFrame("Frame", nil, FreeUIMenubar)
holder:SetFrameLevel(3)
holder:SetPoint("TOP")
holder:SetPoint("BOTTOM")
holder:SetWidth(200)
holder:SetPoint("CENTER")

local text = F.CreateFS(holder, C.media.pixel, 8, 'OUTLINEMONOCHROME', nil, {0, 0, 0}, 1, -1)
text:SetDrawLayer("OVERLAY")
text:SetPoint("CENTER")
text:SetTextColor(C.r, C.g, C.b)

local FreeUIStatsButton = module.FreeUIStatsButton

local function formatMemory(value)
	if value > 1024 then
		return format("%.1f MB", value / 1024)
	else
		return format("%.0f KB", value)
	end
end

local function order(a, b)
	return a.memory > b.memory
end

local function memoryColor(value, times)
	if not times then times = 1 end

	if value <= 1024 * times then
		return 0, 1, 0
	elseif value <= 2048 * times then
		return .75, 1, 0
	elseif value <= 4096 * times then
		return 1, 1, 0
	elseif value <= 8192 * times then
		return 1, .75, 0
	elseif value <= 16384 * times then
		return 1, .5, 0
	else
		return 1, .1, 0
	end
end


FreeUIStatsButton = module:addButton("", POSITION_MIDDLE, function(self, button)
	if button == "LeftButton" then
		local openaddonlist

		if AddonList:IsVisible() then
			openaddonlist = true
		end

		if not openaddonlist then
			ShowUIPanel(AddonList)
		else
			HideUIPanel(AddonList)
		end
	elseif button == "RightButton" then
		TimeManagerClockButton_OnClick(TimeManagerClockButton)
	end
end)

FreeUIStatsButton:SetWidth(250)


FreeUIStatsButton:SetScript("OnUpdate", function(self, elapsed)
	last = last + elapsed
	lastLag = lastLag + elapsed

	if lastLag >= 30 then
		_, _, home, world = GetNetStats()
		lastLag = 0
	end

	if last >= 1 then
		text:SetText("|cffffffff"..floor(GetFramerate() + .5).."|r fps   |cffffffff"..home.."|r/|cffffffff"..world.."|r ms   |cffffffff"..GameTime_GetTime(false))
		last = 0
	end
end)

FreeUIStatsButton:HookScript("OnEnter", function(self)
	if InCombatLockdown() then return end

	collectgarbage()
	UpdateAddOnMemoryUsage()

	for i = 1, GetNumAddOns() do
		if IsAddOnLoaded(i) then
			memory = GetAddOnMemoryUsage(i)
			n = n + 1
			addons[n] = {name = GetAddOnInfo(i), memory = memory}
			total = total + memory
		end
	end
	sort(addons, order)

	GameTooltip:SetOwner(self, "ANCHOR_BOTTOM", 0, -15)
	GameTooltip:ClearLines()
	GameTooltip:AddDoubleLine("Addons", formatMemory(total), C.r, C.g, C.b, memoryColor(total))
	GameTooltip:AddLine(" ")

	for _, entry in next, addons do
		GameTooltip:AddDoubleLine(entry.name, formatMemory(entry.memory), 1, 1, 1, memoryColor(entry.memory))
	end

	GameTooltip:AddLine(" ")
	GameTooltip:AddDoubleLine(" ", C.LineString)
	GameTooltip:AddDoubleLine(" ", C.LeftButton..L["OpenAddonList"].." ", 1,1,1, .9, .82, .62)
	GameTooltip:AddDoubleLine(" ", C.RightButton..L["OpenTimerTracker"].." ", 1,1,1, .9, .82, .62)
	GameTooltip:Show()
end)

FreeUIStatsButton:HookScript("OnLeave", function(self)
	GameTooltip:Hide()
	n, total = 0, 0
	wipe(addons)
end)

