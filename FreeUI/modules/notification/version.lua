local F, C, L = unpack(select(2, ...))
local NOTIFICATION = F:GetModule('NOTIFICATION')


local check = function(self, event, prefix, message, _, sender)
	if event == 'CHAT_MSG_ADDON' then
		if prefix ~= 'FreeUIVersion' or sender == C.MyName then return end
		if tonumber(message) ~= nil and tonumber(message) > tonumber(C.Version) then
			F:CreateNotification(L['NOTIFICATION_VERSION'], C.BlueColor..L['NOTIFICATION_VERSION_OUTDATE'], nil, 'Interface\\ICONS\\ability_warlock_soulswap')
			F.Print(format(L['NOTIFICATION_VERSION_OUTDATE'], C.Version))
			self:UnregisterEvent('CHAT_MSG_ADDON')
		end
	else
		if IsInGroup(LE_PARTY_CATEGORY_INSTANCE) then
			C_ChatInfo.SendAddonMessage('FreeUIVersion', tonumber(C.Version), 'INSTANCE_CHAT')
		elseif IsInRaid(LE_PARTY_CATEGORY_HOME) then
			C_ChatInfo.SendAddonMessage('FreeUIVersion', tonumber(C.Version), 'RAID')
		elseif IsInGroup(LE_PARTY_CATEGORY_HOME) then
			C_ChatInfo.SendAddonMessage('FreeUIVersion', tonumber(C.Version), 'PARTY')
		elseif IsInGuild() then
			C_ChatInfo.SendAddonMessage('FreeUIVersion', tonumber(C.Version), 'GUILD')
		end
	end
end


function NOTIFICATION:VersionCheck()
    if not FreeDB.notification.version_check then return end

    local frame = CreateFrame('Frame')
    frame:RegisterEvent('PLAYER_ENTERING_WORLD')
    frame:RegisterEvent('GROUP_ROSTER_UPDATE')
    frame:RegisterEvent('CHAT_MSG_ADDON')
    frame:SetScript('OnEvent', check)
    C_ChatInfo.RegisterAddonMessagePrefix('FreeUIVersion')
end
