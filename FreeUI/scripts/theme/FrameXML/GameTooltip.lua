local F, C = unpack(select(2, ...))

tinsert(C.themes["FreeUI"], function()
	F.ReskinClose(ItemRefCloseButton)
	F.ReskinClose(FloatingBattlePetTooltip.CloseButton)
	F.ReskinClose(FloatingPetBattleAbilityTooltip.CloseButton)

	local tooltips = {
		ChatMenu,
		EmoteMenu,
		LanguageMenu,
		VoiceMacroMenu,
		GameTooltip,
		EmbeddedItemTooltip,
		ItemRefTooltip,
		ItemRefShoppingTooltip1,
		ItemRefShoppingTooltip2,
		ShoppingTooltip1,
		ShoppingTooltip2,
		AutoCompleteBox,
		FriendsTooltip,
		WorldMapTooltip,
		WorldMapCompareTooltip1,
		WorldMapCompareTooltip2,
		GeneralDockManagerOverflowButtonList,
		ReputationParagonTooltip,
		NamePlateTooltip,
		QueueStatusFrame,
		BattlePetTooltip,
		PetBattlePrimaryAbilityTooltip,
		PetBattlePrimaryUnitTooltip,
		FloatingBattlePetTooltip,
		FloatingPetBattleAbilityTooltip,
		IMECandidatesFrame,
	}

	for _, f in pairs(tooltips) do
		f:HookScript("OnShow", F.ReskinTooltip)
	end

	C_Timer.After(5, function()
		if LibDBIconTooltip then
			F.ReskinTooltip(LibDBIconTooltip)
		end
	end)

	local sb = _G["GameTooltipStatusBar"]
	sb:SetHeight(3)
	sb:ClearAllPoints()
	sb:SetPoint("BOTTOMLEFT", GameTooltip, "BOTTOMLEFT", 1, 1)
	sb:SetPoint("BOTTOMRIGHT", GameTooltip, "BOTTOMRIGHT", -1, 1)
	sb:SetStatusBarTexture(C.media.backdrop)

	local sep = GameTooltipStatusBar:CreateTexture(nil, "ARTWORK")
	sep:SetHeight(C.Mult)
	sep:SetPoint("BOTTOMLEFT", 0, 3)
	sep:SetPoint("BOTTOMRIGHT", 0, 3)
	sep:SetTexture(C.media.backdrop)
	sep:SetVertexColor(0, 0, 0)

	PetBattlePrimaryUnitTooltip.Delimiter:SetColorTexture(0, 0, 0)
	PetBattlePrimaryUnitTooltip.Delimiter:SetHeight(1)
	PetBattlePrimaryAbilityTooltip.Delimiter1:SetHeight(1)
	PetBattlePrimaryAbilityTooltip.Delimiter1:SetColorTexture(0, 0, 0)
	PetBattlePrimaryAbilityTooltip.Delimiter2:SetHeight(1)
	PetBattlePrimaryAbilityTooltip.Delimiter2:SetColorTexture(0, 0, 0)
	FloatingPetBattleAbilityTooltip.Delimiter1:SetHeight(1)
	FloatingPetBattleAbilityTooltip.Delimiter1:SetColorTexture(0, 0, 0)
	FloatingPetBattleAbilityTooltip.Delimiter2:SetHeight(1)
	FloatingPetBattleAbilityTooltip.Delimiter2:SetColorTexture(0, 0, 0)
	FloatingBattlePetTooltip.Delimiter:SetColorTexture(0, 0, 0)
	FloatingBattlePetTooltip.Delimiter:SetHeight(1)

	-- Tooltip rewards icon
	local newString = "0:0:64:64:5:59:5:59"
	_G.BONUS_OBJECTIVE_REWARD_WITH_COUNT_FORMAT = "|T%1$s:16:16:"..newString.."|t |cffffffff%2$s|r %3$s"
	_G.BONUS_OBJECTIVE_REWARD_FORMAT = "|T%1$s:16:16:"..newString.."|t %2$s"

	local function ReskinRewardIcon(self)
		if self and self.Icon then
			self.Icon:SetTexCoord(.08, .92, .08, .92)
			self.IconBorder:Hide()
		end
	end
	hooksecurefunc("EmbeddedItemTooltip_SetItemByQuestReward", ReskinRewardIcon)
	hooksecurefunc("EmbeddedItemTooltip_SetItemByID", ReskinRewardIcon)
	hooksecurefunc("EmbeddedItemTooltip_SetCurrencyByID", ReskinRewardIcon)
	hooksecurefunc("QuestUtils_AddQuestCurrencyRewardsToTooltip", function(_, _, self) ReskinRewardIcon(self) end)

	-- Other addons
	local listener = CreateFrame("Frame")
	listener:RegisterEvent("ADDON_LOADED")
	listener:SetScript("OnEvent", function(_, _, addon)
		if addon == "MethodDungeonTools" then
			local styledMDT
			hooksecurefunc(MethodDungeonTools, "ShowInterface", function()
				if not styledMDT then
					F.ReskinTooltip(MethodDungeonTools.tooltip)
					F.ReskinTooltip(MethodDungeonTools.pullTooltip)
					styledMDT = true
				end
			end)
		elseif addon == "BattlePetBreedID" then
			hooksecurefunc("BPBID_SetBreedTooltip", function(parent)
				if parent == FloatingBattlePetTooltip then
					F.ReskinTooltip(BPBID_BreedTooltip2)
				else
					F.ReskinTooltip(BPBID_BreedTooltip)
				end
			end)
		end
	end)
end)