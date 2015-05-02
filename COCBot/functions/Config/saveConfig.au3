;Saves all of the GUI values to the config.

Func saveConfig() ;Saves the controls settings to the config

	;General Settings--------------------------------------------------------------------------
	Local $frmBotPos = WinGetPos($sBotTitle)
	IniWrite($config, "general", "frmBotPosX", $frmBotPos[0])
	IniWrite($config, "general", "frmBotPosY", $frmBotPos[1])

	If GUICtrlRead($chkBackground) = $GUI_CHECKED Then
		IniWrite($config, "general", "Background", 1)
	Else
		IniWrite($config, "general", "Background", 0)
	EndIf

	If GUICtrlRead($chkBotStop) = $GUI_CHECKED Then
		IniWrite($config, "general", "BotStop", 1)
	Else
		IniWrite($config, "general", "BotStop", 0)
	EndIf

	IniWrite($config, "general", "Command", _GUICtrlComboBox_GetCurSel($cmbBotCommand))
	IniWrite($config, "general", "Cond", _GUICtrlComboBox_GetCurSel($cmbBotCond))
	IniWrite($config, "general", "Hour", _GUICtrlComboBox_GetCurSel($cmbHoursStop))

	;Search Settings------------------------------------------------------------------------

	If GUICtrlRead($radDeadBases) = $GUI_CHECKED Then
		IniWrite($config, "search", "mode", 0)
	ElseIf GUICtrlRead($radWeakBases) = $GUI_CHECKED Then
		IniWrite($config, "search", "mode", 1)
		IniWrite($config, "search", "iwbmortar", _GUICtrlComboBox_GetCurSel($cmbWBMortar))
		IniWrite($config, "search", "iwbwiztower", _GUICtrlComboBox_GetCurSel($cmbWBWizTower))
		;IniWrite($config, "search", "iwbxbow", _GUICtrlComboBox_GetCurSel($cmbWBXbow))
	ElseIf GUICtrlRead($radAllBases) = $GUI_CHECKED Then
		IniWrite($config, "search", "mode", 2)
	EndIf

	If GUICtrlRead($chkSearchReduction) = $GUI_CHECKED Then
		IniWrite($config, "search", "reduction", 1)
	Else
		IniWrite($config, "search", "reduction", 0)
	EndIf

	IniWrite($config, "search", "reduceCount", GUICtrlRead($txtSearchReduceCount))
	IniWrite($config, "search", "reduceGold", GUICtrlRead($txtSearchReduceGold))
	IniWrite($config, "search", "reduceElixir", GUICtrlRead($txtSearchReduceElixir))
	IniWrite($config, "search", "reduceDark", GUICtrlRead($txtSearchReduceDark))
	IniWrite($config, "search", "reduceTrophy", GUICtrlRead($txtSearchReduceTrophy))

	If GUICtrlRead($chkMeetGxE) = $GUI_CHECKED Then
		IniWrite($config, "search", "conditionGoldElixir", 1)
	Else
		IniWrite($config, "search", "conditionGoldElixir", 0)
	EndIf

	If GUICtrlRead($chkMeetGorE) = $GUI_CHECKED Then
		IniWrite($config, "search", "conditionGoldorElixir", 1)
	Else
		IniWrite($config, "search", "conditionGoldorElixir", 0)
	EndIf

	If GUICtrlRead($chkMeetDE) = $GUI_CHECKED Then
		IniWrite($config, "search", "conditionDark", 1)
	Else
		IniWrite($config, "search", "conditionDark", 0)
	EndIf

	If GUICtrlRead($chkMeetTrophy) = $GUI_CHECKED Then
		IniWrite($config, "search", "conditionTrophy", 1)
	Else
		IniWrite($config, "search", "conditionTrophy", 0)
	 EndIf

	If GUICtrlRead($chkMeetTH) = $GUI_CHECKED Then
		IniWrite($config, "search", "conditionTownHall", 1)
	Else
		IniWrite($config, "search", "conditionTownHall", 0)
	 EndIf

	If GUICtrlRead($chkMeetTHO) = $GUI_CHECKED Then
		IniWrite($config, "search", "conditionTownHallO", 1)
	Else
		IniWrite($config, "search", "conditionTownHallO", 0)
	 EndIf

	If GUICtrlRead($chkMeetOne) = $GUI_CHECKED Then
		IniWrite($config, "search", "conditionOne", 1)
	Else
		IniWrite($config, "search", "conditionOne", 0)
	 EndIf

	IniWrite($config, "search", "searchGold", GUICtrlRead($txtMinGold))
	IniWrite($config, "search", "searchElixir", GUICtrlRead($txtMinElixir))
	IniWrite($config, "search", "searchDark", GUICtrlRead($txtMinDarkElixir))
	IniWrite($config, "search", "searchTrophy", GUICtrlRead($txtMinTrophy))
	IniWrite($config, "search", "THLevel", _GUICtrlComboBox_GetCurSel($cmbTH))

	If GUICtrlRead($chkAlertSearch) = $GUI_CHECKED Then
		IniWrite($config, "search", "AlertSearch", 1)
	Else
		IniWrite($config, "search", "AlertSearch", 0)
	 EndIf


	;Attack Basic Settings-------------------------------------------------------------------------
	IniWrite($config, "attack", "deploy", _GUICtrlComboBox_GetCurSel($cmbDeploy))
	IniWrite($config, "attack", "composition", _GUICtrlComboBox_GetCurSel($cmbTroopComp))

	IniWrite($config, "attack", "UnitD", _GUICtrlComboBox_GetCurSel($cmbUnitDelay))
	IniWrite($config, "attack", "WaveD", _GUICtrlComboBox_GetCurSel($cmbWaveDelay))
	IniWrite($config, "attack", "randomatk", GUICtrlRead($Randomspeedatk))

	If GUICtrlRead($chkDeployRedArea) = $GUI_CHECKED Then
		IniWrite($config, "attack", "deployRedArea", 1)
	Else
		IniWrite($config, "attack", "deployRedArea", 0)
	EndIf

	IniWrite($config, "attack", "smartAttackDeploy", _GUICtrlComboBox_GetCurSel($cmbSmartDeploy))

	If GUICtrlRead($chkAttackNearGoldMine) = $GUI_CHECKED Then
		IniWrite($config, "attack", "smartAttackGoldMine", 1)
	Else
		IniWrite($config, "attack", "smartAttackGoldMine", 0)
	EndIf

	If GUICtrlRead($chkAttackNearElixirCollector) = $GUI_CHECKED Then
		IniWrite($config, "attack", "smartAttackElixirCollector", 1)
	Else
		IniWrite($config, "attack", "smartAttackElixirCollector", 0)
	EndIf

	If GUICtrlRead($chkAttackNearDarkElixirDrill) = $GUI_CHECKED Then
		IniWrite($config, "attack", "smartAttackDarkElixirDrill", 1)
	Else
		IniWrite($config, "attack", "smartAttackDarkElixirDrill", 0)
	EndIf

	If GUICtrlRead($chkKingAttackDeadBases) = $GUI_CHECKED Then
		IniWrite($config, "attack", "king-dead", 1)
	Else
		IniWrite($config, "attack", "king-dead", 0)
	EndIf
	If GUICtrlRead($chkKingAttackWeakBases) = $GUI_CHECKED Then
		IniWrite($config, "attack", "king-weak", 1)
	Else
		IniWrite($config, "attack", "king-weak", 0)
	EndIf
	If GUICtrlRead($chkKingAttackAllBases) = $GUI_CHECKED Then
		IniWrite($config, "attack", "king-all", 1)
	Else
		IniWrite($config, "attack", "king-all", 0)
	EndIf

	If GUICtrlRead($chkQueenAttackDeadBases) = $GUI_CHECKED Then
		IniWrite($config, "attack", "queen-dead", 1)
	Else
		IniWrite($config, "attack", "queen-dead", 0)
	EndIf
	If GUICtrlRead($chkQueenAttackWeakBases) = $GUI_CHECKED Then
		IniWrite($config, "attack", "queen-weak", 1)
	Else
		IniWrite($config, "attack", "queen-weak", 0)
	EndIf
	If GUICtrlRead($chkQueenAttackAllBases) = $GUI_CHECKED Then
		IniWrite($config, "attack", "queen-all", 1)
	Else
		IniWrite($config, "attack", "queen-all", 0)
	EndIf

	If GUICtrlRead($chkUseClanCastle) = $GUI_CHECKED Then
		IniWrite($config, "attack", "use-cc", 1)
	Else
		IniWrite($config, "attack", "use-cc", 0)
	EndIf

	If GUICtrlRead($radManAbilities) = $GUI_CHECKED Then
		IniWrite($config, "attack", "ActivateKQ", "Manual")
	Elseif GUICtrlRead($radAutoAbilities) = $GUI_CHECKED Then
		IniWrite($config, "attack", "ActivateKQ", "Auto")
	EndIf

	IniWrite($config, "attack", "delayActivateKQ", GUICtrlRead($txtManAbilities))

	IniWrite($config, "attack", "txtTimeStopAtk", GUICtrlRead($txtTimeStopAtk))

	If GUICtrlRead($chkTakeLootSS) = $GUI_CHECKED Then
		IniWrite($config, "attack", "TakeLootSnapShot", 1)
	Else
		IniWrite($config, "attack", "TakeLootSnapShot", 0)
	EndIf

	;Advanced Settings--------------------------------------------------------------------------
	If GUICtrlRead($chkAttackNow) = $GUI_CHECKED Then
		IniWrite($config, "advanced", "attacknow", 1)
	Else
		IniWrite($config, "advanced", "attacknow", 0)
	EndIf
	IniWrite($config, "advanced", "attacknowdelay", _GUICtrlComboBox_GetCurSel($cmbAttackNowDelay) + 1)

	If GUICtrlRead($chkAttackTH) = $GUI_CHECKED Then
		IniWrite($config, "advanced", "townhall", 1)
	Else
		IniWrite($config, "advanced", "townhall", 0)
	EndIf

	If GUICtrlRead($chkLightSpell) = $GUI_CHECKED Then
		IniWrite($config, "advanced", "hitDElightning", 1)
	Else
		IniWrite($config, "advanced", "hitDElightning", 0)
	EndIf
	IniWrite($config, "advanced", "QLSpell", _GUICtrlComboBox_GetCurSel($cmbiLSpellQ) + 1)

	If GUICtrlRead($chkBullyMode) = $GUI_CHECKED Then
		IniWrite($config, "advanced", "BullyMode", 1)
	Else
		IniWrite($config, "advanced", "BullyMode", 0)
	EndIf

	IniWrite($config, "advanced", "ATBullyMode", GUICtrlRead($txtATBullyMode))
	IniWrite($config, "advanced", "YourTH", _GUICtrlComboBox_GetCurSel($cmbYourTH))

	If GUICtrlRead($chkTrophyMode) = $GUI_CHECKED Then
		IniWrite($config, "advanced", "TrophyMode", 1)
	Else
		IniWrite($config, "advanced", "TrophyMode", 0)
	EndIf

	IniWrite($config, "advanced", "THaddTiles", GUICtrlRead($txtTHaddtiles))
	IniWrite($config, "advanced", "AttackTHType", _GUICtrlComboBox_GetCurSel($cmbAttackTHType))

    IniWrite($config, "advanced", "AccountToken", GUICtrlRead($PushBTokenN))

	If GUICtrlRead($chkAlertPBVillage) = $GUI_CHECKED Then
	   IniWrite($config, "advanced", "AlertPBVillage", 1)
    Else
	    IniWrite($config, "advanced", "AlertPBVillage", 0)
	  EndIf

	If  GUICtrlRead($chkAlertPBLastAttack) = $GUI_CHECKED Then
        IniWrite($config, "advanced", "AlertPBLastAttack", 1)
    Else
	    IniWrite($config, "advanced", "AlertPBLastAttack", 0)
	 EndIf

	;atk their king
	;attk their queen

	;Donate Settings-------------------------------------------------------------------------
	If GUICtrlRead($chkRequest) = $GUI_CHECKED Then
		IniWrite($config, "donate", "chkRequest", 1)
	Else
		IniWrite($config, "donate", "chkRequest", 0)
	EndIf

	IniWrite($config, "donate", "txtRequest", GUICtrlRead($txtRequest))

	If GUICtrlRead($chkDonateBarbarians) = $GUI_CHECKED Then
		IniWrite($config, "donate", "chkDonateBarbarians", 1)
	Else
		IniWrite($config, "donate", "chkDonateBarbarians", 0)
	EndIf

	If GUICtrlRead($chkDonateAllBarbarians) = $GUI_CHECKED Then
		IniWrite($config, "donate", "chkDonateAllBarbarians", 1)
	Else
		IniWrite($config, "donate", "chkDonateAllBarbarians", 0)
	EndIf

	IniWrite($config, "donate", "txtDonateBarbarians", StringReplace(GUICtrlRead($txtDonateBarbarians), @CRLF, "|"))
	IniWrite($config, "donate", "txtBlacklistBarbarians", StringReplace(GUICtrlRead($txtBlacklistBarbarians), @CRLF, "|"))

	If GUICtrlRead($chkDonateArchers) = $GUI_CHECKED Then
		IniWrite($config, "donate", "chkDonateArchers", 1)
	Else
		IniWrite($config, "donate", "chkDonateArchers", 0)
	EndIf

	If GUICtrlRead($chkDonateAllArchers) = $GUI_CHECKED Then
		IniWrite($config, "donate", "chkDonateAllArchers", 1)
	Else
		IniWrite($config, "donate", "chkDonateAllArchers", 0)
	EndIf

	IniWrite($config, "donate", "txtDonateArchers", StringReplace(GUICtrlRead($txtDonateArchers), @CRLF, "|"))
	IniWrite($config, "donate", "txtBlacklistArchers", StringReplace(GUICtrlRead($txtBlacklistArchers), @CRLF, "|"))

	If GUICtrlRead($chkDonateGiants) = $GUI_CHECKED Then
		IniWrite($config, "donate", "chkDonateGiants", 1)
	Else
		IniWrite($config, "donate", "chkDonateGiants", 0)
	EndIf

	If GUICtrlRead($chkDonateAllGiants) = $GUI_CHECKED Then
		IniWrite($config, "donate", "chkDonateAllGiants", 1)
	Else
		IniWrite($config, "donate", "chkDonateAllGiants", 0)
	EndIf

	IniWrite($config, "donate", "txtDonateGiants", StringReplace(GUICtrlRead($txtDonateGiants), @CRLF, "|"))
	IniWrite($config, "donate", "txtBlacklistGiants", StringReplace(GUICtrlRead($txtBlacklistGiants), @CRLF, "|"))

	If GUICtrlRead($chkDonateGoblins) = $GUI_CHECKED Then
		IniWrite($config, "donate", "chkDonateGoblins", 1)
	Else
		IniWrite($config, "donate", "chkDonateGoblins", 0)
	EndIf

	If GUICtrlRead($chkDonateAllGoblins) = $GUI_CHECKED Then
		IniWrite($config, "donate", "chkDonateAllGoblins", 1)
	Else
		IniWrite($config, "donate", "chkDonateAllGoblins", 0)
	EndIf

	IniWrite($config, "donate", "txtDonateGoblins", StringReplace(GUICtrlRead($txtDonateGoblins), @CRLF, "|"))
	IniWrite($config, "donate", "txtBlacklistGoblins", StringReplace(GUICtrlRead($txtBlacklistGoblins), @CRLF, "|"))

	If GUICtrlRead($chkDonateWallBreakers) = $GUI_CHECKED Then
		IniWrite($config, "donate", "chkDonateWallBreakers", 1)
	Else
		IniWrite($config, "donate", "chkDonateWallBreakers", 0)
	EndIf

	If GUICtrlRead($chkDonateAllWallBreakers) = $GUI_CHECKED Then
		IniWrite($config, "donate", "chkDonateAllWallBreakers", 1)
	Else
		IniWrite($config, "donate", "chkDonateAllWallBreakers", 0)
	EndIf

	IniWrite($config, "donate", "txtDonateWallBreakers", StringReplace(GUICtrlRead($txtDonateWallBreakers), @CRLF, "|"))
	IniWrite($config, "donate", "txtBlacklistWallBreakers", StringReplace(GUICtrlRead($txtBlacklistWallBreakers), @CRLF, "|"))

	If GUICtrlRead($chkDonateBalloons) = $GUI_CHECKED Then
		IniWrite($config, "donate", "chkDonateBalloons", 1)
	Else
		IniWrite($config, "donate", "chkDonateBalloons", 0)
	EndIf

	If GUICtrlRead($chkDonateAllBalloons) = $GUI_CHECKED Then
		IniWrite($config, "donate", "chkDonateAllBalloons", 1)
	Else
		IniWrite($config, "donate", "chkDonateAllBalloons", 0)
	EndIf

	IniWrite($config, "donate", "txtDonateBalloons", StringReplace(GUICtrlRead($txtDonateBalloons), @CRLF, "|"))
	IniWrite($config, "donate", "txtBlacklistBalloons", StringReplace(GUICtrlRead($txtBlacklistBalloons), @CRLF, "|"))

	If GUICtrlRead($chkDonateWizards) = $GUI_CHECKED Then
		IniWrite($config, "donate", "chkDonateWizards", 1)
	Else
		IniWrite($config, "donate", "chkDonateWizards", 0)
	EndIf

	If GUICtrlRead($chkDonateAllWizards) = $GUI_CHECKED Then
		IniWrite($config, "donate", "chkDonateAllWizards", 1)
	Else
		IniWrite($config, "donate", "chkDonateAllWizards", 0)
	EndIf

	IniWrite($config, "donate", "txtDonateWizards", StringReplace(GUICtrlRead($txtDonateWizards), @CRLF, "|"))
	IniWrite($config, "donate", "txtBlacklistWizards", StringReplace(GUICtrlRead($txtBlacklistWizards), @CRLF, "|"))

	If GUICtrlRead($chkDonateHealers) = $GUI_CHECKED Then
		IniWrite($config, "donate", "chkDonateHealers", 1)
	Else
		IniWrite($config, "donate", "chkDonateHealers", 0)
	EndIf

	If GUICtrlRead($chkDonateAllHealers) = $GUI_CHECKED Then
		IniWrite($config, "donate", "chkDonateAllHealers", 1)
	Else
		IniWrite($config, "donate", "chkDonateAllHealers", 0)
	EndIf

	IniWrite($config, "donate", "txtDonateHealers", StringReplace(GUICtrlRead($txtDonateHealers), @CRLF, "|"))
	IniWrite($config, "donate", "txtBlacklistHealers", StringReplace(GUICtrlRead($txtBlacklistHealers), @CRLF, "|"))

	If GUICtrlRead($chkDonateDragons) = $GUI_CHECKED Then
		IniWrite($config, "donate", "chkDonateDragons", 1)
	Else
		IniWrite($config, "donate", "chkDonateDragons", 0)
	EndIf

	If GUICtrlRead($chkDonateAllDragons) = $GUI_CHECKED Then
		IniWrite($config, "donate", "chkDonateAllDragons", 1)
	Else
		IniWrite($config, "donate", "chkDonateAllDragons", 0)
	EndIf

	IniWrite($config, "donate", "txtDonateDragons", StringReplace(GUICtrlRead($txtDonateDragons), @CRLF, "|"))
	IniWrite($config, "donate", "txtBlacklistDragons", StringReplace(GUICtrlRead($txtBlacklistDragons), @CRLF, "|"))

	If GUICtrlRead($chkDonatePekkas) = $GUI_CHECKED Then
		IniWrite($config, "donate", "chkDonatePekkas", 1)
	Else
		IniWrite($config, "donate", "chkDonatePekkas", 0)
	EndIf

	If GUICtrlRead($chkDonateAllPekkas) = $GUI_CHECKED Then
		IniWrite($config, "donate", "chkDonateAllPekkas", 1)
	Else
		IniWrite($config, "donate", "chkDonateAllPekkas", 0)
	EndIf

	IniWrite($config, "donate", "txtDonatePekkas", StringReplace(GUICtrlRead($txtDonatePekkas), @CRLF, "|"))
	IniWrite($config, "donate", "txtBlacklistPekkas", StringReplace(GUICtrlRead($txtBlacklistPekkas), @CRLF, "|"))

	If GUICtrlRead($chkDonateMinions) = $GUI_CHECKED Then
		IniWrite($config, "donate", "chkDonateMinions", 1)
	Else
		IniWrite($config, "donate", "chkDonateMinions", 0)
	EndIf

	If GUICtrlRead($chkDonateAllMinions) = $GUI_CHECKED Then
		IniWrite($config, "donate", "chkDonateAllMinions", 1)
	Else
		IniWrite($config, "donate", "chkDonateAllMinions", 0)
	EndIf

	IniWrite($config, "donate", "txtDonateMinions", StringReplace(GUICtrlRead($txtDonateMinions), @CRLF, "|"))
	IniWrite($config, "donate", "txtBlacklistMinions", StringReplace(GUICtrlRead($txtBlacklistMinions), @CRLF, "|"))

	If GUICtrlRead($chkDonateHogRiders) = $GUI_CHECKED Then
		IniWrite($config, "donate", "chkDonateHogRiders", 1)
	Else
		IniWrite($config, "donate", "chkDonateHogRiders", 0)
	EndIf

	If GUICtrlRead($chkDonateAllHogRiders) = $GUI_CHECKED Then
		IniWrite($config, "donate", "chkDonateAllHogRiders", 1)
	Else
		IniWrite($config, "donate", "chkDonateAllHogRiders", 0)
	EndIf

	IniWrite($config, "donate", "txtDonateHogRiders", StringReplace(GUICtrlRead($txtDonateHogRiders), @CRLF, "|"))
	IniWrite($config, "donate", "txtBlacklistHogRiders", StringReplace(GUICtrlRead($txtBlacklistHogRiders), @CRLF, "|"))

	If GUICtrlRead($chkDonateValkyries) = $GUI_CHECKED Then
		IniWrite($config, "donate", "chkDonateValkyries", 1)
	Else
		IniWrite($config, "donate", "chkDonateValkyries", 0)
	EndIf

	If GUICtrlRead($chkDonateAllValkyries) = $GUI_CHECKED Then
		IniWrite($config, "donate", "chkDonateAllValkyries", 1)
	Else
		IniWrite($config, "donate", "chkDonateAllValkyries", 0)
	EndIf

	IniWrite($config, "donate", "txtDonateValkyries", StringReplace(GUICtrlRead($txtDonateValkyries), @CRLF, "|"))
	IniWrite($config, "donate", "txtBlacklistValkyries", StringReplace(GUICtrlRead($txtBlacklistValkyries), @CRLF, "|"))

	If GUICtrlRead($chkDonateGolems) = $GUI_CHECKED Then
		IniWrite($config, "donate", "chkDonateGolems", 1)
	Else
		IniWrite($config, "donate", "chkDonateGolems", 0)
	EndIf

	If GUICtrlRead($chkDonateAllGolems) = $GUI_CHECKED Then
		IniWrite($config, "donate", "chkDonateAllGolems", 1)
	Else
		IniWrite($config, "donate", "chkDonateAllGolems", 0)
	EndIf

	IniWrite($config, "donate", "txtDonateGolems", StringReplace(GUICtrlRead($txtDonateGolems), @CRLF, "|"))
	IniWrite($config, "donate", "txtBlacklistGolems", StringReplace(GUICtrlRead($txtBlacklistGolems), @CRLF, "|"))

	If GUICtrlRead($chkDonateWitches) = $GUI_CHECKED Then
		IniWrite($config, "donate", "chkDonateWitches", 1)
	Else
		IniWrite($config, "donate", "chkDonateWitches", 0)
	EndIf

	If GUICtrlRead($chkDonateAllWitches) = $GUI_CHECKED Then
		IniWrite($config, "donate", "chkDonateAllWitches", 1)
	Else
		IniWrite($config, "donate", "chkDonateAllWitches", 0)
	EndIf

	IniWrite($config, "donate", "txtDonateWitches", StringReplace(GUICtrlRead($txtDonateWitches), @CRLF, "|"))
	IniWrite($config, "donate", "txtBlacklistWitches", StringReplace(GUICtrlRead($txtBlacklistWitches), @CRLF, "|"))

	If GUICtrlRead($chkDonateLavaHounds) = $GUI_CHECKED Then
		IniWrite($config, "donate", "chkDonateLavaHounds", 1)
	Else
		IniWrite($config, "donate", "chkDonateLavaHounds", 0)
	EndIf

	If GUICtrlRead($chkDonateAllLavaHounds) = $GUI_CHECKED Then
		IniWrite($config, "donate", "chkDonateAllLavaHounds", 1)
	Else
		IniWrite($config, "donate", "chkDonateAllLavaHounds", 0)
	EndIf

	IniWrite($config, "donate", "txtDonateLavaHounds", StringReplace(GUICtrlRead($txtDonateLavaHounds), @CRLF, "|"))
	IniWrite($config, "donate", "txtBlacklistLavaHounds", StringReplace(GUICtrlRead($txtBlacklistLavaHounds), @CRLF, "|"))

	IniWrite($config, "donate", "txtBlacklist", StringReplace(GUICtrlRead($txtBlacklist), @CRLF, "|"))

	;Troop Settings--------------------------------------------------------------------------
	for $i=0 to Ubound($TroopName) - 1 
		IniWrite($config, "troop", $TroopName[$i], GUICtrlRead(eval("txtNum" & $TroopName[$i])))
	next
	for $i=0 to Ubound($TroopDarkName) - 1 
		IniWrite($config, "troop", $TroopDarkName[$i], GUICtrlRead(eval("txtNum" & $TroopDarkName[$i])))
	next
	
	IniWrite($config, "troop", "troop1", _GUICtrlComboBox_GetCurSel($cmbBarrack1))
	IniWrite($config, "troop", "troop2", _GUICtrlComboBox_GetCurSel($cmbBarrack2))
	IniWrite($config, "troop", "troop3", _GUICtrlComboBox_GetCurSel($cmbBarrack3))
	IniWrite($config, "troop", "troop4", _GUICtrlComboBox_GetCurSel($cmbBarrack4))

	IniWrite($config, "troop", "fulltroop", GUICtrlRead($txtFullTroop))
	;barracks boost not saved (no use)

	;Misc Settings--------------------------------------------------------------------------
	If GUICtrlRead($chkWalls) = $GUI_CHECKED Then
		IniWrite($config, "other", "auto-wall", 1)
	Else
		IniWrite($config, "other", "auto-wall", 0)
	EndIf

	If GUICtrlRead($UseGold) = $GUI_CHECKED Then
		IniWrite($config, "other", "use-storage", 0)
	ElseIf GUICtrlRead($UseElixir) = $GUI_CHECKED Then
		IniWrite($config, "other", "use-storage", 1)
	ElseIf GUICtrlRead($UseElixirGold) = $GUI_CHECKED Then
		IniWrite($config, "other", "use-storage", 2)
	EndIf

	IniWrite($config, "other", "walllvl", _GUICtrlComboBox_GetCurSel($cmbWalls))
	IniWrite($config, "other", "minwallgold", GUICtrlRead($txtWallMinGold))
	IniWrite($config, "other", "minwallelixir", GUICtrlRead($txtWallMinElixir))

	If GUICtrlRead($chkTrap) = $GUI_CHECKED Then
		IniWrite($config, "other", "chkTrap", 1)
	Else
		IniWrite($config, "other", "chkTrap", 0)
	 EndIf
	If GUICtrlRead($chkCollect) = $GUI_CHECKED Then
		IniWrite($config, "other", "chkCollect", 1)
	Else
		IniWrite($config, "other", "chkCollect", 0)
	 EndIf
	IniWrite($config, "other", "txtTimeWakeUp", GUICtrlRead($txtTimeWakeUp))
	IniWrite($config, "other", "VSDelay", GUICtrlRead($sldVSDelay))

	IniWrite($config, "other", "MaxTrophy", GUICtrlRead($txtMaxTrophy))
	IniWrite($config, "other", "MinTrophy", GUICtrlRead($txtdropTrophy))
	If GUICtrlRead($chkTrophyHeroes) = $GUI_CHECKED Then
		IniWrite($config, "other", "chkTrophyHeroes", 1)
	Else
		IniWrite($config, "other", "chkTrophyHeroes", 0)
	EndIf

	If GUICtrlRead($chkTrophyAtkDead) = $GUI_CHECKED Then
		IniWrite($config, "other", "chkTrophyAtkDead", 1)
	Else
		IniWrite($config, "other", "chkTrophyAtkDead", 0)
	EndIf

	If GUICtrlRead($chkUpgrade1) = $GUI_CHECKED Then
		IniWrite($building, "other", "BuildUpgrade1", 1)
	Else
		IniWrite($building, "other", "BuildUpgrade1", 0)
	EndIf
	If GUICtrlRead($chkUpgrade2) = $GUI_CHECKED Then
		IniWrite($building, "other", "BuildUpgrade2", 1)
	Else
		IniWrite($building, "other", "BuildUpgrade2", 0)
	EndIf
	If GUICtrlRead($chkUpgrade3) = $GUI_CHECKED Then
		IniWrite($building, "other", "BuildUpgrade3", 1)
	Else
		IniWrite($building, "other", "BuildUpgrade3", 0)
	EndIf
	If GUICtrlRead($chkUpgrade4) = $GUI_CHECKED Then
		IniWrite($building, "other", "BuildUpgrade4", 1)
	Else
		IniWrite($building, "other", "BuildUpgrade4", 0)
	EndIf
	IniWrite($building, "other", "BuildUpgradeX1", GUICtrlRead($txtUpgradeX1))
	IniWrite($building, "other", "BuildUpgradeY1", GUICtrlRead($txtUpgradeY1))
	IniWrite($building, "other", "BuildUpgradeX2", GUICtrlRead($txtUpgradeX2))
	IniWrite($building, "other", "BuildUpgradeY2", GUICtrlRead($txtUpgradeY2))
	IniWrite($building, "other", "BuildUpgradeX3", GUICtrlRead($txtUpgradeX3))
	IniWrite($building, "other", "BuildUpgradeY3", GUICtrlRead($txtUpgradeY3))
	IniWrite($building, "other", "BuildUpgradeX4", GUICtrlRead($txtUpgradeX4))
	IniWrite($building, "other", "BuildUpgradeY4", GUICtrlRead($txtUpgradeY4))

	IniWrite($building, "other", "xTownHall", $TownHallPos[0])
	IniWrite($building, "other", "yTownHall", $TownHallPos[1])

	IniWrite($building, "other", "xCCPos", $aCCPos[0])
	IniWrite($building, "other", "yCCPos", $aCCPos[1])

    IniWrite($building, "other", "xArmy", $ArmyPos[0])
    IniWrite($building, "other", "yArmy", $ArmyPos[1])
	
    IniWrite($building, "other", "barrackNum", $barrackNum)
    IniWrite($building, "other", "barrackDarkNum", $barrackDarkNum)
	
    IniWrite($building, "other", "listResource", $listResourceLocation)

	;For $i = 0 To 3 ;Covers all 4 Barracks
		IniWrite($building, "other", "xBarrack", $barrackPos[0])
		IniWrite($building, "other", "yBarrack", $barrackPos[1])
	;Next

	IniWrite($building, "other", "xSpellfactory", $SFPos[0])
	IniWrite($building, "other", "ySpellfactory", $SFPos[1])

EndFunc   ;==>saveConfig
