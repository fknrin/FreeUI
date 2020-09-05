if GetLocale() == 'enUS' then
local F, C, L = unpack(select(2, ...))
--if not C.isChinses then return end


--[[ Misc ]]

do
	L['MISC_NUMBER_CAP'] = {'万', '亿', '兆'}


	L['MISC_REPUTATION'] = 'Reputation'
	L['MISC_PARAGON'] = 'Paragon'
	L['MISC_PARAGON_REPUTATION'] = 'Paragon Reputation'
	L['MISC_PARAGON_NOTIFY'] = 'Paragon Full, go redeem!'
	L['MISC_ORDERHALL_TIP'] = 'Hold Shift to display detailed information'


	L['MISC_DISBAND_GROUP'] = 'Disband Group'
	L['MISC_DISBAND_GROUP_CHECK'] = 'Are you sure you want to disband the group?'



	L['MISC_DECLINE_INVITE'] = 'Automatically declined group invitation from %s'
	L['MISC_ACCEPT_INVITE'] = 'Automatically accepted group invitation from %s'

	L['AUTOMATION_GET_NAKED'] = 'Get naked'
	L['AUTOMATION_BUY_STACK'] = 'Buy a stack of |cfff0000the following items?|r'
end


--[[ Blizzard ]]
do
	L['BLIZZARD_MOVER_ALERT'] = 'Alert frame'
	L['BLIZZARD_MOVER_VEHICLE'] = 'Vehicle indicator'
	L['BLIZZARD_MOVER_UIWIDGET'] = 'UIWidget frame'
	L['BLIZZARD_UNDRESS'] = 'Undress'
	L['BLIZZARD_STRANGER'] = 'Stranger'
	L['BLIZZARD_KEYSTONES'] = 'Keystone Information'
	L['BLIZZARD_KEYSTONES_RESET'] = 'Reset keystone information'
	L['BLIZZARD_GET_NAKED'] = 'Get naked'
	L['BLIZZARD_ORDERHALL_TIP'] = 'Hold <Shift> to display detailed information'
end


--[[ Themes ]]

do

end


--[[ Notification ]]

do
	L['NOTIFICATION_NEW_MAIL'] = 'You have new mail!'
	L['NOTIFICATION_BAG_FULL'] = 'Your bag is full!'
	L['NOTIFICATION_MAIL'] = 'Mail'
	L['NOTIFICATION_BAG'] = 'Bag'
	L['NOTIFICATION_RARE'] = 'Found rare!'
	L['NOTIFICATION_VERSION'] = 'Version Check'
	L['NOTIFICATION_VERSION_OUTDATE'] = 'Your FreeUI version has expired, latest is %s'
end


--[[ Announcement ]]

do
	L['ANNOUNCEMENT_INTERRUPT'] = 'Interrupted %s of %s!'
	L['ANNOUNCEMENT_DISPEL'] = 'Dispelled %s of %s!'
	L['ANNOUNCEMENT_STOLEN'] = 'Stole %s of %s!'
	L['ANNOUNCEMENT_BATTLE_REZ'] = '%s used %s!'
	L['ANNOUNCEMENT_BATTLE_REZ_TARGET'] = '%s used %s in %s!'
	L['ANNOUNCEMENT_CASTED'] = '%s cast %s!'
	L['ANNOUNCEMENT_FEAST'] = '%s placed %s！'
	L['ANNOUNCEMENT_ITEM'] = '%s placed %s!'
	L['ANNOUNCEMENT_PORTAL'] = '%s opened %s!'
	L['ANNOUNCEMENT_SAPPED'] = 'Sapped!'
end


--[[ Infobar ]]

do
	L['INFOBAR_DURABILITY'] = 'Durability'
	L['INFOBAR_OPEN_CHARACTER_PANEL'] = 'Open the character panel'

	L['INFOBAR_FRIENDS'] = 'Friends'
	L['INFOBAR_OPEN_FRIENDS_PANEL'] = 'Open the friends panel'
	L['INFOBAR_ADD_FRIEND'] = 'Add friend'

	L['INFOBAR_GUILD'] = 'Guild'
	L['INFOBAR_GUILD_NONE'] = 'No Guild'
	L['INFOBAR_OPEN_GUILD_PANEL'] = 'Open the guild panel'

	L['INFOBAR_REPORT'] = 'Report'
	L['INFOBAR_DAILY_WEEKLY_INFO'] = 'Daily/weekly information'
	L['INFOBAR_BLINGTRON'] = 'Blingtron Daily'
	L['INFOBAR_MEAN_ONE'] = 'Winter Veil Daily'
	L['INFOBAR_TIMEWARPED'] = 'Timewalking Badge Reward'
	L['INFOBAR_INVASION_LEG'] = 'Legion invasions'
	L['INFOBAR_INVASION_BFA'] = 'BFA invasions'
	L['INFOBAR_INVASION_CURRENT'] = 'Current: '
	L['INFOBAR_INVASION_NEXT'] = 'Next: '
	L['INFOBAR_LESSER_VISION'] = 'Lesser Vision of N\'zoth'
	L['INFOBAR_ISLAND'] = 'Island Expedition'
	L['INFOBAR_OPEN_BFA_REPORT'] = 'Open report(BFA)'
	L['INFOBAR_OPEN_LEG_REPORT'] = 'Open report(LEG)'
	L['INFOBAR_OPEN_WOD_REPORT'] = 'Open report(WOD)'

	L['INFOBAR_SPEC'] = 'Specialization'
	L['INFOBAR_LOOT'] = 'Loot Specialization'
	L['INFOBAR_OPEN_SPEC_PANEL'] = 'Open the specialization panel'
	L['INFOBAR_CHANGE_SPEC'] = 'Change specialization'

	L['INFOBAR_LOCAL_TIME'] = 'Local Time'
	L['INFOBAR_REALM_TIME'] = 'Realm Time'
	L['INFOBAR_OPEN_ADDON_PANEL'] = 'Open addon panel'
	L['INFOBAR_OPEN_TIMER_TRACKER'] = 'Open the timer'
end


--[[ Chat ]]

do
	L['CHAT_TOGGLE_PANEL'] = 'Hide/Show chat box'
	L['CHAT_TOGGLE_WC'] = 'Join/Leave Channel'
	L['CHAT_COPY'] = 'Copy chat text'
	L['CHAT_WHISPER_TELL'] = 'To'
	L['CHAT_WHISPER_FROM'] = 'From'
end


--[[ Aura ]]

do
	L['AURA_MOVER_BUFFS'] = 'Buffs'
	L['AURA_MOVER_DEBUFFS'] = 'Debuffs'
end


--[[ Actionbar ]]

do
	L['ACTIONBAR_MOVER_BAR1'] = 'Actionbar 1'
	L['ACTIONBAR_MOVER_BAR2'] = 'Actionbar 2'
	L['ACTIONBAR_MOVER_BAR3'] = 'Actionbar 3'
	L['ACTIONBAR_MOVER_BAR4'] = 'Actionbar 4'
	L['ACTIONBAR_MOVER_BAR5'] = 'Actionbar 5'
	L['ACTIONBAR_MOVER_PET'] = 'Actionbar pet'
	L['ACTIONBAR_MOVER_STANCE'] = 'Actionbar stance'
	L['ACTIONBAR_MOVER_EXTRA'] = 'Actionbar extra'
	L['ACTIONBAR_MOVER_VEHICLE'] = 'Actionbar vehicle'
	L['ACTIONBAR_MOVER_COOLDOWN'] = 'Cooldown'
	L['ACTIONBAR_KEY_UNBOUND'] = 'Unbound Button'
	L['ACTIONBAR_KEY_INDEX'] = '序号'
	L['ACTIONBAR_KEY_BINDING'] = 'Key Binding'
	L['ACTIONBAR_KEY_BOUND_TO'] = ' Bound button'
	L['ACTIONBAR_SAVE_KEYBINDS'] = 'Keybinds saved'
	L['ACTIONBAR_DISCARD_KEYBINDS'] = 'Discard keybinds?'
	L['ACTIONBAR_CLEAR_BINDS'] = '%s |cff20ff20 Clear keybinds |r'
end


--[[ Combat ]]

do
	L['COMBAT_ENTER'] = 'Entered Combat'
	L['COMBAT_LEAVE'] = 'Left Combat'
end


--[[ Inventory ]]

do
	L['INVENTORY_NOTIFICATION_HEADER'] = 'Backpack'
	L['INVENTORY_SORT'] = 'Sort bags'
	L['INVENTORY_ANCHOR_RESET'] = 'Reset window position'
	L['INVENTORY_BAGS'] = 'Show bags'
	L['INVENTORY_FREE_SLOTS'] = 'Remaining bag space'
	L['INVENTORY_AZERITEARMOR'] = 'Azerite Armor'
	L['INVENTORY_EQUIPEMENTSET'] = 'Equipment Set'
	L['INVENTORY_QUICK_DELETE_ENABLED'] = '\nQuick destroy is enabled.\nYou can hold CTRL+ALT while clicking to destroy items in bags lower quality than blue.'
	L['INVENTORY_QUICK_DELETE'] = 'Quick Delete'
	L['INVENTORY_PICK_FAVOURITE_ENABLED'] = '\nFavorites enabled.\nYou can now click to mark items.\nIf classified storage of items is enabled, you can also add it to the favorites category.\nThis operation is invalid for junk items.'
	L['INVENTORY_PICK_FAVOURITE'] = 'Choose favorite'
	L['INVENTORY_AUTO_REPAIR'] = 'Auto Repair'
	L['INVENTORY_AUTO_REPAIR_ENABLED'] = '\nAuto repair is enabled.\nYour equipment will be repaired automatically every time you talk to the merchant.'
	L['INVENTORY_REPAIR_ERROR'] = 'Not enough money to repair!'
	L['INVENTORY_REPAIR_COST'] = 'Automatic repair cost'
	L['INVENTORY_SELL_JUNK'] = 'Auto sell junk'
	L['INVENTORY_SELL_JUNK_ENABLED'] = '\nThe automatic sale of junk has been enabled.\nEvery time you talk to a merchant, you will automatically sell junk items.'
	L['INVENTORY_SELL_JUNK_EARN'] = 'Automatically sell junk'
	L['INVENTORY_SEARCH'] = 'Search'
	L['INVENTORY_SEARCH_ENABLED'] = 'Enter item name to search'
	L['INVENTORY_MARK_JUNK'] = 'Mark junk'
	L['INVENTORY_MARK_JUNK_ENABLED'] = '\nClick to categorize sellable items as junk.\nWhen you turn on automatic junk selling, these items will also be sold together.\nThis list is shared by accounts.'
	L['INVENTORY_QUICK_SPLIT'] = 'Quick split'
	L['INVENTORY_SPLIT_COUNT'] = 'Split count'
	L['INVENTORY_SPLIT_MODE_ENABLED'] = '\nClick to split the stacked items, number of splits per click can be adjusted in left input box.'
	L['INVENTORY_GOLD_COUNT'] = 'Gold Count'
	L['INVENTORY_EARNED'] = 'Earned'
	L['INVENTORY_SPENT'] = 'Spent'
	L['INVENTORY_DEFICIT'] = 'Loss'
	L['INVENTORY_PROFIT'] = 'Profit'
	L['INVENTORY_SESSION'] = 'This session'
	L['INVENTORY_CHARACTER'] = 'Character'
	L['INVENTORY_GOLD_TOTAL'] = 'Total'
end


--[[ Map ]]

do
	L['MAP_MOVER_MINIMAP'] = 'Minimap'
	L['MAP_CURSOR'] = 'Cursor'
	L['MAP_REVEAL'] = 'Remove map fog'
	L['MAP_PARAGON'] = 'Paragon'
	L['MAP_NEW_MAIL'] = '<New Mail>'
end


--[[ Quest ]]

do
	L['QUEST_MOVER_TRACKER'] = 'Quest tracker'
	L['QUEST_ACCEPT'] = 'Accept quest'
	L['QUEST_AUTOMATION'] = 'Auto turn-in'
end


-- Tooltip
do
	L['TOOLTIP_MOVER'] = 'Tooltip'
	L['TOOLTIP_RARE'] = 'Rare'
	L['TOOLTIP_AURA_FROM'] = 'From'
	L['TOOLTIP_SELL_PRICE'] = 'Sell Price'
	L['TOOLTIP_STACK_CAP'] = 'Stack Limit'
	L['TOOLTIP_ID_AZERITE_TRAIT'] = 'Azerite Traits'
	L['TOOLTIP_BAG'] = 'Bag'
	L['TOOLTIP_ID_SPELL'] = 'Spell ID'
	L['TOOLTIP_ID_ITEM'] = 'Item ID'
	L['TOOLTIP_ID_COMPANION'] = 'Pet ID'
	L['TOOLTIP_ID_QUEST'] = 'Quest ID'
	L['TOOLTIP_ID_TALENT'] = 'Talent ID'
	L['TOOLTIP_ID_ACHIEVEMENT'] = 'Achievement ID'
	L['TOOLTIP_ID_CURRENCY'] = 'Currency ID'
	L['TOOLTIP_ID_VISUAL'] = 'Visual'
	L['TOOLTIP_ID_SOURCE'] = 'Source'
	L['TOOLTIP_SECTION'] = '段落'
	L['TOOLTIP_TARGETED'] = 'Target'
	L['TOOLTIP_ILVL'] = 'iLvl'
end


--[[ Unitframe ]]

do
	L['UNITFRAME_MOVER_INCOMING'] = 'Incoming damage and healing'
	L['UNITFRAME_MOVER_OUTGOING'] = 'Outgoing damage and healing'
	L['UNITFRAME_MOVER_CASTBAR'] = 'Castbar'
	L['UNITFRAME_MOVER_PLAYER'] = 'Player frame'
	L['UNITFRAME_MOVER_PET'] = 'Pet frame'
	L['UNITFRAME_MOVER_TARGET'] = 'Target frame'
	L['UNITFRAME_MOVER_TARGETTARGET'] = 'Target of Target frame'
	L['UNITFRAME_MOVER_FOCUS'] = 'Focus frame'
	L['UNITFRAME_MOVER_FOCUSTARGET'] = 'Focus target frame'
	L['UNITFRAME_MOVER_BOSS'] = 'Boss Frame'
	L['UNITFRAME_MOVER_ARENA'] = 'Arena frame'
	L['UNITFRAME_MOVER_PARTY'] = 'Party frame'
	L['UNITFRAME_MOVER_RAID'] = 'Raid frame'
	L['UNITFRAME_CLICK_CAST_BINDING'] = 'Click-cast binding'
	L['UNITFRAME_CLICK_CAST_TIP'] = 'Prompt'
	L['UNITFRAME_CLICK_CAST_DESC'] = 'Ctrl/Alt/Shift + any mouse click on the skill you want to bind.\nUse the bound shortcut key on the group frame to cast the skill.'
	L['UNITFRAME_GHOST'] = 'Ghost'
	L['UNITFRAME_OFFLINE'] = 'Offline'
end



--[[ Install ]]

do
	L['INSTALL_HEADER_HELLO'] = 'Hello'
	L['INSTALL_BODY_WELCOME'] = 'Welcome to |cffe9c55dFreeUI|r!\n\nYou need to adjust some settings before you start using it to better work with |cffe9c55dFreeUI|r.\n\nClick the install button to enter the installation step.'
	L['INSTALL_HEADER_BASIC'] = 'Basic Settings'
	L['INSTALL_BODY_BASIC'] = 'These installation steps will adjust various suitable settings for |cffe9c55dFreeUI|r.\n\nThe first step will adjust some |cffe9c55dCVars|r settings.\n\nClick the continue button below to apply the settings, or click the skip button t o skip these settings.'
	L['INSTALL_HEADER_UISCALE'] = 'UIScale'
	L['INSTALL_BODY_UISCALE'] = 'This step will set the appropriate scale for the interface.'
	L['INSTALL_HEADER_CHAT'] = 'Chat'
	L['INSTALL_BODY_CHAT'] = 'This step will adjust settings related to the chat'
	L['INSTALL_HEADER_ACTIONBAR'] = 'Actionbars'
	L['INSTALL_BODY_ACTIONBAR'] = 'This step will adjust settings related to actionbars.'
	L['INSTALL_HEADER_ADDON'] = 'Addons'
	L['INSTALL_BODY_ADDON'] = 'This step will adjust the settings of |cffe9c55dDBM|r and |cffe9c55dSkada|r to match the interface style and layout of |cffe9c55dFreeUI|r.'
	L['INSTALL_HEADER_COMPLETE'] = 'Success!'
	L['INSTALL_BODY_COMPLETE'] = 'The installation has completed successfully.\n\nPlease click the Finish button below to reload the interface.\n\nRemember in the game you can enter |cffe9c55d/free|r to get detailed help or directly enter |cffe9c55d/freeconfig|r to open the control panel and change various settings.'
	L['INSTALL_BUTTON_INSTALL'] = 'Install'
	L['INSTALL_BUTTON_SKIP'] = 'Skip'
	L['INSTALL_BUTTON_CONTINUE'] = 'Continue'
	L['INSTALL_BUTTON_FINISH'] = 'Finish'
	L['INSTALL_BUTTON_CANCEL'] = 'Cancel'
end




--[[ GUI ]]

do
	L['GUI_TIPS'] = 'Prompt'
	L['GUI_RELOAD_WARNING'] = '|cffff2020Reload UI to apply settings?|r'
	L['GUI_RESET_WARNING'] = '|cffff2020Remove all saved options and reset to default values?|r'
	L['GUI_PROFILE_WARNING'] = '|cffff2020Profile warning.|r'

	L['GUI_THEME_CONFLICTION_WARNING'] = 'FreeUI includes an efficient built-in module of theme.\n\nIt\'s highly recommended that you disable any version of Aurora or Skinner.'
	L['GUI_RESET_GOLD_COUNT'] = '|cffff2020Reset gold stats?|r'


	L['GUI_AURA'] = 'Auras'
	L['GUI_AURA_DESC'] = 'These options control settings related to auras'
	L['GUI_AURA_SUB_BASIC'] = 'Basic setting'
	L['GUI_AURA_ENABLE_AURA'] = 'Enable'
	L['GUI_AURA_MARGIN'] = 'Margin'
	L['GUI_AURA_OFFSET'] = 'Offset'
	L['GUI_AURA_BUFF_REMINDER'] = 'Missing buff reminder'
	L['GUI_AURA_BUFF_REMINDER_TIP'] = '\nReminds you of the missing self-buff aura\nFor Example, Mage Intelligence, Priest Stamina, Rogue Poison, etc.'
	L['GUI_AURA_BUFF_SIZE'] = 'Buff icon size'
	L['GUI_AURA_BUFFS_PER_ROW'] = 'Buffs per row'
	L['GUI_AURA_REVERSE_BUFFS'] = 'Reverse buffs'
	L['GUI_AURA_DEBUFF_SIZE'] = 'Debuff icon size'
	L['GUI_AURA_DEBUFFS_PER_ROW'] = 'Debuffs per row'
	L['GUI_AURA_REVERSE_DEBUFFS'] = 'Reverse debuffs'
	L['GUI_AURA_AURA_SOURCE'] = 'Aura source'
	L['GUI_AURA_SUB_ADJUSTMENT'] = 'Adjustment'

	L['GUI_MISC_INVITE_KEYWORD'] = 'Keyword invitation'
	L['GUI_MISC_INVITE_KEYWORD_TIP'] = 'After typing, press enter'

	L['GUI_APPEARANCE'] = 'Appearance'
	L['GUI_APPEARANCE_DESC'] = 'These options control most appearance-related settings.'
	L['GUI_APPEARANCE_SUB_BASIC'] = 'Basic setting'

	L['GUI_UNITFRAME_TEXTURE_STYLE'] = 'Texture style'
	L['GUI_UNITFRAME_TEXTURE_NORM'] = 'Default'
	L['GUI_UNITFRAME_TEXTURE_GRAD'] = 'Gradient'
	L['GUI_UNITFRAME_TEXTURE_FLAT'] = 'Flat'

	L['GUI_NUMBER_FORMAT'] = 'Number format'
	L['GUI_NUMBER_FORMAT_EN'] = 'k/b/m'
	L['GUI_NUMBER_FORMAT_CN'] = '万/亿/兆'

	L['GUI_IMPORT_DATA_ERROR'] = 'Data is abnormal, import failed!'
	L['GUI_IMPORT_DATA_WARNING'] = '|cffff2020Import data?|r'
	L['GUI_DATA_INFO'] = 'Data information'
	L['GUI_DATA_VERSION'] = 'Version'
	L['GUI_DATA_CHARACTER'] = 'Character'
	L['GUI_DATA_EXCEPTION'] = 'Abnormal data'
	L['GUI_DATA_IMPORT'] = 'Import'
	L['GUI_DATA_EXPORT'] = 'Export'
	L['GUI_DATA_IMPORT_HEADER'] = 'Import string'
	L['GUI_DATA_EXPORT_HEADER'] = 'Export string'
	L['GUI_DATA_RESET'] = 'Reset data'
	L['GUI_DATA_RESET_TIP'] = 'Clear the saved data of |cffe9c55dFreeUI|r and reset all options to the default values of |cffe9c55dFreeUI|r.'
	L['GUI_DATA_IMPORT_TIP'] = 'Import config string of |cffe9c55dFreeUI|r.'
	L['GUI_DATA_EXPORT_TIP'] = 'Export config string of |cffe9c55dFreeUI|r.'


	L['GUI_MOVER_PANEL'] = 'Frame adjustment'
	L['GUI_MOVER_GRID'] = 'Grid'
	L['GUI_MOVER_RESET_ANCHOR'] = 'Reset frame position'
	L['GUI_MOVER_HIDE_ELEMENT'] = 'Hide frame'
	L['GUI_MOVER_TIPS'] = 'Prompt'
	L['GUI_MOVER_RESET_WARNING'] = 'Do you want to reset all interface elements to their default positions?'
	L['GUI_MOVER_CANCEL_WARNING'] = 'Do you want to cancel this operation?'
end





-- Slash commands
L['COMMANDS_LIST_HINT'] = 'Available commands:'
L['COMMANDS_LIST'] = {
	'/free install - Open installation panel',
	'/free config - Open configuration panel',
	'/free unlock - Unlock interface',
	'/free reset - Reset all saved options to default values.',

	'/free dps - Use default DPS layout',
	'/free healer - Use a layout that is more friendly to healers',
	'/free minimal - Use minimal mode, where avatar and actionbar are hidden by default.',

	'/rl - Reload UI',
	'/ss - Screenshots',
	'/clear - Clear the chat window',
	'/rc - Ready Check',
	'/rp - Role poll',
	'/gc - Group conversion',
	'/lg - Leave group',
	'/rs - 重置副本',
	'/tt - Tell target',
	'/spec - Switch spec',
	'/bind - Bind keys',
	'/gm - Opens the help panel',
}
end

if GetLocale() == 'zhCN' then

local F, C, L = unpack(select(2, ...))
--if not C.isChinses then return end


--[[ Misc ]]

do
	L['MISC_NUMBER_CAP'] = {'万', '亿', '兆'}


	L['MISC_REPUTATION'] = '声望'
	L['MISC_PARAGON'] = '巅峰'
	L['MISC_PARAGON_REPUTATION'] = '巅峰声望'
	L['MISC_PARAGON_NOTIFY'] = '巅峰声望已满注意兑换'
	L['MISC_ORDERHALL_TIP'] = '按住Shift显示详细信息'


	L['MISC_DISBAND_GROUP'] = '解散队伍'
	L['MISC_DISBAND_GROUP_CHECK'] = '你确定要解散队伍?'



	L['MISC_DECLINE_INVITE'] = '自动拒绝了 %s 的组队邀请'
	L['MISC_ACCEPT_INVITE'] = '自动接受了 %s 的组队邀请'

	L['AUTOMATION_GET_NAKED'] = '双击脱光装备'
	L['AUTOMATION_BUY_STACK'] = '是否购买|cffff0000一组|r下列物品？'
end


--[[ Blizzard ]]
do
	L['BLIZZARD_MOVER_ALERT'] = 'Alert frame'
	L['BLIZZARD_MOVER_VEHICLE'] = 'Vehicle indicator'
	L['BLIZZARD_MOVER_UIWIDGET'] = 'UIWidget frame'
	L['BLIZZARD_UNDRESS'] = '脱衣'
	L['BLIZZARD_STRANGER'] = '陌生人'
	L['BLIZZARD_KEYSTONES'] = '钥石信息'
	L['BLIZZARD_KEYSTONES_RESET'] = '清除已保存的钥石信息'
	L['BLIZZARD_GET_NAKED'] = '双击脱光装备'
	L['BLIZZARD_ORDERHALL_TIP'] = '按住<Shift>显示详细信息'
end


--[[ Themes ]]

do

end


--[[ Notification ]]

do
	L['NOTIFICATION_NEW_MAIL'] = '收到新邮件！'
	L['NOTIFICATION_BAG_FULL'] = '背包满了！'
	L['NOTIFICATION_MAIL'] = '邮件'
	L['NOTIFICATION_BAG'] = '背包'
	L['NOTIFICATION_RARE'] = '发现稀有'
	L['NOTIFICATION_VERSION'] = '版本检查'
	L['NOTIFICATION_VERSION_OUTDATE'] = '你的 FreeUI 已经过期，最新版为 %s'
end


--[[ Announcement ]]

do
	L['ANNOUNCEMENT_INTERRUPT'] = '打断了 %s 的 %s！'
	L['ANNOUNCEMENT_DISPEL'] = '驱散了 %s 的 %s！'
	L['ANNOUNCEMENT_STOLEN'] = '偷取了 %s 的 %s！'
	L['ANNOUNCEMENT_BATTLE_REZ'] = '%s 使用了 %s！'
	L['ANNOUNCEMENT_BATTLE_REZ_TARGET'] = '%s 使用了 %s 在 %s！'
	L['ANNOUNCEMENT_CASTED'] = '%s 施放了 %s！'
	L['ANNOUNCEMENT_FEAST'] = '%s 摆出了 %s！'
	L['ANNOUNCEMENT_ITEM'] = '%s 放置了 %s！'
	L['ANNOUNCEMENT_PORTAL'] = '%s 开启了 %s！'
	L['ANNOUNCEMENT_SAPPED'] = '我被闷棍！'
end


--[[ Infobar ]]

do
	L['INFOBAR_DURABILITY'] = '装备耐久'
	L['INFOBAR_OPEN_CHARACTER_PANEL'] = '打开角色面板'

	L['INFOBAR_FRIENDS'] = '朋友'
	L['INFOBAR_OPEN_FRIENDS_PANEL'] = '打开好友面板'
	L['INFOBAR_ADD_FRIEND'] = '添加好友'

	L['INFOBAR_GUILD'] = '公会'
	L['INFOBAR_GUILD_NONE'] = '无'
	L['INFOBAR_OPEN_GUILD_PANEL'] = '打开公会面板'

	L['INFOBAR_REPORT'] = '报告'
	L['INFOBAR_DAILY_WEEKLY_INFO'] = '日常/周常信息'
	L['INFOBAR_BLINGTRON'] = '布林顿每日礼包'
	L['INFOBAR_MEAN_ONE'] = '冬幕节日常'
	L['INFOBAR_TIMEWARPED'] = '时光漫游徽章奖励'
	L['INFOBAR_INVASION_LEG'] = '军团突袭'
	L['INFOBAR_INVASION_BFA'] = '阵营突袭'
	L['INFOBAR_INVASION_CURRENT'] = '当前: '
	L['INFOBAR_INVASION_NEXT'] = '下次: '
	L['INFOBAR_LESSER_VISION'] = '恩佐斯的小幻象'
	L['INFOBAR_ISLAND'] = '海岛探险'
	L['INFOBAR_OPEN_BFA_REPORT'] = '打开任务报告(BFA)'
	L['INFOBAR_OPEN_LEG_REPORT'] = '打开任务报告(LEG)'
	L['INFOBAR_OPEN_WOD_REPORT'] = '打开任务报告(WOD)'

	L['INFOBAR_SPEC'] = '专精'
	L['INFOBAR_LOOT'] = '拾取'
	L['INFOBAR_OPEN_SPEC_PANEL'] = '打开天赋面板'
	L['INFOBAR_CHANGE_SPEC'] = '切换专精和拾取'

	L['INFOBAR_LOCAL_TIME'] = '本地时间'
	L['INFOBAR_REALM_TIME'] = '服务器时间'
	L['INFOBAR_OPEN_ADDON_PANEL'] = '打开插件列表'
	L['INFOBAR_OPEN_TIMER_TRACKER'] = '打开计时器'
end


--[[ Chat ]]

do
	L['CHAT_TOGGLE_PANEL'] = '隐藏/显示聊天框'
	L['CHAT_TOGGLE_WC'] = '加入/离开世界频道'
	L['CHAT_COPY'] = '复制聊天框内容'
	L['CHAT_WHISPER_TELL'] = '告诉'
	L['CHAT_WHISPER_FROM'] = '来自'
end


--[[ Aura ]]

do
	L['AURA_MOVER_BUFFS'] = '增益光环'
	L['AURA_MOVER_DEBUFFS'] = '减益光环'
end


--[[ Actionbar ]]

do
	L['ACTIONBAR_MOVER_BAR1'] = 'Actionbar 1'
	L['ACTIONBAR_MOVER_BAR2'] = 'Actionbar 2'
	L['ACTIONBAR_MOVER_BAR3'] = 'Actionbar 3'
	L['ACTIONBAR_MOVER_BAR4'] = 'Actionbar 4'
	L['ACTIONBAR_MOVER_BAR5'] = 'Actionbar 5'
	L['ACTIONBAR_MOVER_PET'] = 'Actionbar pet'
	L['ACTIONBAR_MOVER_STANCE'] = 'Actionbar stance'
	L['ACTIONBAR_MOVER_EXTRA'] = 'Actionbar extra'
	L['ACTIONBAR_MOVER_VEHICLE'] = 'Actionbar vehicle'
	L['ACTIONBAR_MOVER_COOLDOWN'] = '冷却图标'
	L['ACTIONBAR_KEY_UNBOUND'] = '未绑定按键'
	L['ACTIONBAR_KEY_INDEX'] = '序号'
	L['ACTIONBAR_KEY_BINDING'] = '按键'
	L['ACTIONBAR_KEY_BOUND_TO'] = ' 绑定按键'
	L['ACTIONBAR_SAVE_KEYBINDS'] = '按键设置已保存'
	L['ACTIONBAR_DISCARD_KEYBINDS'] = '按键设置已撤销'
	L['ACTIONBAR_CLEAR_BINDS'] = '%s |cff20ff20清除已绑定按键|r'
end


--[[ Combat ]]

do
	L['COMBAT_ENTER'] = '进入战斗'
	L['COMBAT_LEAVE'] = '离开战斗'
end


--[[ Inventory ]]

do
	L['INVENTORY_NOTIFICATION_HEADER'] = '背包'
	L['INVENTORY_SORT'] = '整理背包'
	L['INVENTORY_ANCHOR_RESET'] = '重置窗口位置'
	L['INVENTORY_BAGS'] = '打开背包栏位'
	L['INVENTORY_FREE_SLOTS'] = '剩余背包空间'
	L['INVENTORY_AZERITEARMOR'] = '艾泽里特护甲'
	L['INVENTORY_EQUIPEMENTSET'] = '装备配置方案'
	L['INVENTORY_QUICK_DELETE_ENABLED'] = '\n快速摧毁功能已启用。\n你可以按住 CTRL+ALT 键，直接点击摧毁背包中低于蓝色精良品质的物品。'
	L['INVENTORY_QUICK_DELETE'] = '快速摧毁'
	L['INVENTORY_PICK_FAVOURITE_ENABLED'] = '\n偏好选择功能已启用。\n你现在可以点击标记物品。\n若启用了物品分类存放，还可以将其添加到偏好选择分类中。\n此操作对垃圾物品无效。'
	L['INVENTORY_PICK_FAVOURITE'] = '偏好选择'
	L['INVENTORY_AUTO_REPAIR'] = '自动修理'
	L['INVENTORY_AUTO_REPAIR_ENABLED'] = '\n自动修理功能已启用。\n每次与商人对话都会自动修理你的装备。'
	L['INVENTORY_REPAIR_ERROR'] = '没有足够的钱完成修理！'
	L['INVENTORY_REPAIR_COST'] = '自动修理花费'
	L['INVENTORY_SELL_JUNK'] = '自动出售垃圾'
	L['INVENTORY_SELL_JUNK_ENABLED'] = '\n自动出售垃圾功能已启用。\n每次与商人对话都会自动出售垃圾物品。'
	L['INVENTORY_SELL_JUNK_EARN'] = '自动出售垃圾获得'
	L['INVENTORY_SEARCH'] = '搜索'
	L['INVENTORY_SEARCH_ENABLED'] = '输入物品名进行搜索'
	L['INVENTORY_MARK_JUNK'] = '垃圾分类'
	L['INVENTORY_MARK_JUNK_ENABLED'] = '\n点击将可售出的物品归类为垃圾。\n当你开启自动出售垃圾时，这些物品也将被一同售出。\n这个列表是账号共享的。'
	L['INVENTORY_QUICK_SPLIT'] = '快速拆分'
	L['INVENTORY_SPLIT_COUNT'] = '拆分个数'
	L['INVENTORY_SPLIT_MODE_ENABLED'] = '|n点击拆分背包的堆叠物品，可在左侧输入框调整每次点击的拆分个数。'
	L['INVENTORY_GOLD_COUNT'] = '金币统计'
	L['INVENTORY_EARNED'] = '获得'
	L['INVENTORY_SPENT'] = '支出'
	L['INVENTORY_DEFICIT'] = '亏损'
	L['INVENTORY_PROFIT'] = '盈利'
	L['INVENTORY_SESSION'] = '本次登录'
	L['INVENTORY_CHARACTER'] = '服务器角色'
	L['INVENTORY_GOLD_TOTAL'] = '总计'
end


--[[ Map ]]

do
	L['MAP_MOVER_MINIMAP'] = '小地图'
	L['MAP_CURSOR'] = '鼠标'
	L['MAP_REVEAL'] = '清除地图迷雾'
	L['MAP_PARAGON'] = '巅峰'
	L['MAP_NEW_MAIL'] = '<新邮件>'
end


--[[ Quest ]]

do
	L['QUEST_MOVER_TRACKER'] = '任务追踪'
	L['QUEST_ACCEPT'] = '接受任务：'
	L['QUEST_AUTOMATION'] = '自动交接任务'
end


-- Tooltip
do
	L['TOOLTIP_MOVER'] = '鼠标提示'
	L['TOOLTIP_RARE'] = '稀有'
	L['TOOLTIP_AURA_FROM'] = '来自'
	L['TOOLTIP_SELL_PRICE'] = '售价'
	L['TOOLTIP_STACK_CAP'] = '堆叠上限'
	L['TOOLTIP_ID_AZERITE_TRAIT'] = '艾泽里特特质'
	L['TOOLTIP_BAG'] = '背包'
	L['TOOLTIP_ID_SPELL'] = '法术ID'
	L['TOOLTIP_ID_ITEM'] = '物品ID'
	L['TOOLTIP_ID_COMPANION'] = '小宠物ID'
	L['TOOLTIP_ID_QUEST'] = '任务ID'
	L['TOOLTIP_ID_TALENT'] = '天赋ID'
	L['TOOLTIP_ID_ACHIEVEMENT'] = '成就ID'
	L['TOOLTIP_ID_CURRENCY'] = '货币ID'
	L['TOOLTIP_ID_VISUAL'] = 'Visual'
	L['TOOLTIP_ID_SOURCE'] = 'Source'
	L['TOOLTIP_SECTION'] = '段落'
	L['TOOLTIP_TARGETED'] = '关注'
	L['TOOLTIP_ILVL'] = '装等'
end


--[[ Unitframe ]]

do
	L['UNITFRAME_MOVER_INCOMING'] = '承受伤害和治疗'
	L['UNITFRAME_MOVER_OUTGOING'] = '输出伤害和治疗'
	L['UNITFRAME_MOVER_CASTBAR'] = '焦点施法条'
	L['UNITFRAME_MOVER_PLAYER'] = '玩家框体'
	L['UNITFRAME_MOVER_PET'] = '宠物框体'
	L['UNITFRAME_MOVER_TARGET'] = '目标框体'
	L['UNITFRAME_MOVER_TARGETTARGET'] = '目标的目标框体'
	L['UNITFRAME_MOVER_FOCUS'] = '焦点框体'
	L['UNITFRAME_MOVER_FOCUSTARGET'] = '焦点的目标框体'
	L['UNITFRAME_MOVER_BOSS'] = '首领框体'
	L['UNITFRAME_MOVER_ARENA'] = '竞技场框体'
	L['UNITFRAME_MOVER_PARTY'] = '小队框体'
	L['UNITFRAME_MOVER_RAID'] = '团队框体'
	L['UNITFRAME_CLICK_CAST_BINDING'] = '点击施法绑定'
	L['UNITFRAME_CLICK_CAST_TIP'] = '提示'
	L['UNITFRAME_CLICK_CAST_DESC'] = 'Ctrl/Alt/Shift + 任意鼠标按键点击想绑定的技能\n对小队或团队框体使用绑定的快捷键就能直接施放技能'
	L['UNITFRAME_GHOST'] = '灵魂'
	L['UNITFRAME_OFFLINE'] = '离线'
end



--[[ Install ]]

do
	L['INSTALL_HEADER_HELLO'] = '你好'
	L['INSTALL_BODY_WELCOME'] = '欢迎使用 |cffe9c55dFreeUI|r ！\n\n在开始使用前需要调整一些设定来更好的搭配 |cffe9c55dFreeUI|r 工作。\n\n点击安装按钮将进入安装步骤。'
	L['INSTALL_HEADER_BASIC'] = '基础设置'
	L['INSTALL_BODY_BASIC'] = '这些安装步骤将为 |cffe9c55dFreeUI|r 调整各类合适的设定。\n\n第一步将会调整一些 |cffe9c55dCVars|r 设定。\n\n点击下方的继续按钮将应用设定，或者点击跳过按钮如果你想跳过这些设定。'
	L['INSTALL_HEADER_UISCALE'] = '界面缩放'
	L['INSTALL_BODY_UISCALE'] = '这个步骤将会为游戏界面设定合适的缩放值。'
	L['INSTALL_HEADER_CHAT'] = '聊天设置'
	L['INSTALL_BODY_CHAT'] = '这个步骤将会调整聊天栏相关的设定。'
	L['INSTALL_HEADER_ACTIONBAR'] = '动作条设置'
	L['INSTALL_BODY_ACTIONBAR'] = '这个步骤将会调整动作条相关的设定。'
	L['INSTALL_HEADER_ADDON'] = '插件设置'
	L['INSTALL_BODY_ADDON'] = '这个步骤将会调整 |cffe9c55dDBM|r 和 |cffe9c55dSkada|r 的设定以使其配合 |cffe9c55dFreeUI|r 的界面风格与布局。'
	L['INSTALL_HEADER_COMPLETE'] = '安装成功！'
	L['INSTALL_BODY_COMPLETE'] = '安装已经成功完成。\n\n请点击下方完成按钮重载界面。\n\n记住在游戏中你可以通过输入 |cffe9c55d/free|r 来获取详细的帮助或是直接输入 |cffe9c55d/free config|r 来打开控制面板更改各类设定。'
	L['INSTALL_BUTTON_INSTALL'] = '安装'
	L['INSTALL_BUTTON_SKIP'] = '跳过'
	L['INSTALL_BUTTON_CONTINUE'] = '继续'
	L['INSTALL_BUTTON_FINISH'] = '完成'
	L['INSTALL_BUTTON_CANCEL'] = '取消'
end




--[[ GUI ]]

do
	L['GUI_TIPS'] = '提示'
	L['GUI_RELOAD_WARNING'] = '|cffff2020是否重载界面来完成设置？|r'
	L['GUI_RESET_WARNING'] = '|cffff2020是否移除所有已保存的选项并重置为默认值？|r'
	L['GUI_PROFILE_WARNING'] = '|cffff2020是否转换选项配置为角色单独/账号通用？|r'

	L['GUI_THEME_CONFLICTION_WARNING'] = 'FreeUI includes an efficient built-in module of theme.\n\nIt\'s highly recommended that you disable any version of Aurora or Skinner.'
	L['GUI_RESET_GOLD_COUNT'] = '|cffff2020是否重置金币统计数据？|r'


	L['GUI_AURA'] = '光环'
	L['GUI_AURA_DESC'] = '这些选项控制大部分和光环相关的设置'
	L['GUI_AURA_SUB_BASIC'] = '基础设定'
	L['GUI_AURA_ENABLE_AURA'] = '启用'
	L['GUI_AURA_MARGIN'] = '图标间隔'
	L['GUI_AURA_OFFSET'] = '增益/减益栏间隔'
	L['GUI_AURA_BUFF_REMINDER'] = '缺失增益提醒'
	L['GUI_AURA_BUFF_REMINDER_TIP'] = '\n提醒你缺失的自身增益光环\n比如法师智力牧师耐力潜行者毒药战士攻强之类'
	L['GUI_AURA_BUFF_SIZE'] = '增益图标大小'
	L['GUI_AURA_BUFFS_PER_ROW'] = '增益图标每行数量'
	L['GUI_AURA_REVERSE_BUFFS'] = '反向排列增益光环'
	L['GUI_AURA_DEBUFF_SIZE'] = '减益图标大小'
	L['GUI_AURA_DEBUFFS_PER_ROW'] = '减益图标每行数量'
	L['GUI_AURA_REVERSE_DEBUFFS'] = '反向排列减益光环'
	L['GUI_AURA_AURA_SOURCE'] = '光环来源'
	L['GUI_AURA_SUB_ADJUSTMENT'] = '调整'

	L['GUI_MISC_INVITE_KEYWORD'] = '密语邀请关键字'
	L['GUI_MISC_INVITE_KEYWORD_TIP'] = '输入完成后按下回车'

	L['GUI_APPEARANCE'] = '外观'
	L['GUI_APPEARANCE_DESC'] = '这些选项控制大部分和外观相关的设置'
	L['GUI_APPEARANCE_SUB_BASIC'] = '基础设定'

	L['GUI_UNITFRAME_TEXTURE_STYLE'] = '材质风格'
	L['GUI_UNITFRAME_TEXTURE_NORM'] = '默认'
	L['GUI_UNITFRAME_TEXTURE_GRAD'] = '渐变'
	L['GUI_UNITFRAME_TEXTURE_FLAT'] = '扁平'



	L['GUI_NUMBER_FORMAT'] = '数字格式'
	L['GUI_NUMBER_FORMAT_EN'] = 'k/b/m'
	L['GUI_NUMBER_FORMAT_CN'] = '万/亿/兆'

	L['GUI_IMPORT_DATA_ERROR'] = '数据异常，导入失败！'
	L['GUI_IMPORT_DATA_WARNING'] = '|cffff2020是否导入数据？|r'
	L['GUI_DATA_INFO'] = '数据信息'
	L['GUI_DATA_VERSION'] = '版本'
	L['GUI_DATA_CHARACTER'] = '角色'
	L['GUI_DATA_EXCEPTION'] = '数据异常'
	L['GUI_DATA_IMPORT'] = '导入'
	L['GUI_DATA_EXPORT'] = '导出'
	L['GUI_DATA_IMPORT_HEADER'] = '导入字符串'
	L['GUI_DATA_EXPORT_HEADER'] = '导出字符串'
	L['GUI_DATA_RESET'] = '重置'
	L['GUI_DATA_RESET_TIP'] = '清除 |cffe9c55dFreeUI|r 已保存的数据，将所有选项重置为 |cffe9c55dFreeUI|r 默认值。'
	L['GUI_DATA_IMPORT_TIP'] = '导入 |cffe9c55dFreeUI|r 的配置字符串。'
	L['GUI_DATA_EXPORT_TIP'] = '将当前的 |cffe9c55dFreeUI|r 配置导出为字符串。'


	L['GUI_MOVER_PANEL'] = '界面元素位置调整'
	L['GUI_MOVER_GRID'] = '网格'
	L['GUI_MOVER_RESET_ANCHOR'] = '重置该界面元素的默认位置'
	L['GUI_MOVER_HIDE_ELEMENT'] = '隐藏该界面元素'
	L['GUI_MOVER_TIPS'] = '提示'
	L['GUI_MOVER_RESET_WARNING'] = '是否重置所有界面元素为默认位置？'
	L['GUI_MOVER_CANCEL_WARNING'] = '是否取消本次操作？'
end





-- Slash commands
L['COMMANDS_LIST_HINT'] = '可用命令：'
L['COMMANDS_LIST'] = {
	'/free install - 打开安装面板。',
	'/free config - 打开控制台。',
	'/free unlock - 解锁界面元素，解锁后可以自由移动界面元素。',
	'/free reset - 重置所有保存的选项恢复到默认值。',

	'/free dps - 使用默认头像布局。',
	'/free healer - 使用对治疗职业更友好的对称型布局。',
	'/free minimal - 使用简洁模式，此模式下头像和动作条默认隐藏。',

	'/rl - 重载界面',
	'/ss - 屏幕截图',
	'/clear - 清空聊天窗口',
	'/rc - 就位确认',
	'/rp - 职责确认',
	'/gc - 小队/团队转换',
	'/lg - 退出队伍',
	'/rs - 重置副本',
	'/tt - 密语当前目标',
	'/spec - 切换天赋',
	'/bind - 绑定快捷键',
	'/gm - 打开帮助面板',
}
end