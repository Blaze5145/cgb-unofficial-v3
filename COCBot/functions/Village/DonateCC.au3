; #FUNCTION# ====================================================================================================================
; Name ..........: DonateCC
; Description ...: This file includes functions to Donate troops
; Syntax ........:
; Parameters ....: None
; Return values .: None
; Author ........: Zax (2015)
; Modified ......: Safar46 (2015), Hervidero (2015-04), HungLe (2015-04)
; Remarks .......: This file is part of ClashGameBot. Copyright 2015
;                  ClashGameBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........:
; Example .......: No
; ===============================================================================================================================

Func DonateCC($Check = False)
	Local $DonateTroop = BitOR($iChkDonateBarbarians, $iChkDonateArchers, $iChkDonateGiants, $iChkDonateGoblins, _
			$iChkDonateWallBreakers, $iChkDonateBalloons, $iChkDonateWizards, $iChkDonateHealers, _
			$iChkDonateDragons, $iChkDonatePekkas, $iChkDonateMinions, $iChkDonateHogRiders, _
			$iChkDonateValkyries, $iChkDonateGolems, $iChkDonateWitches, $iChkDonateLavaHounds)
	Local $DonateAllTroop = BitOR($iChkDonateAllBarbarians, $iChkDonateAllArchers, $iChkDonateAllGiants, $iChkDonateAllGoblins, _
			$iChkDonateAllWallBreakers, $iChkDonateAllBalloons, $iChkDonateAllWizards, $iChkDonateAllHealers, _
			$iChkDonateAllDragons, $iChkDonateAllPekkas, $iChkDonateAllMinions, $iChkDonateAllHogRiders, _
			$iChkDonateAllValkyries, $iChkDonateAllGolems, $iChkDonateAllWitches, $iChkDonateAllLavaHounds)

	Global $Donate = BitOR($DonateTroop, $DonateAllTroop)

	If $Donate = False Then Return ; exit func if no donate checkmarks

	Local $y = 119
	;check for new chats first
	If $Check = True Then
		_CaptureRegion()
		If _ColorCheck(_GetPixelColor(34, 321), Hex(0xE00300, 6), 20) = False And $CommandStop <> 3 Then
			Return ;exit if no new chats
		EndIf
	EndIf

	Click(1, 1) ;Click Away
	_CaptureRegion()
	If _ColorCheck(_GetPixelColor(331, 330), Hex(0xF0A03B, 6), 20) = False Then Click(19, 349) ;Clicks chat thing
	If _Sleep(200) Then Return
	Click(189, 24) ; clicking clan tab

	Local $Scroll, $offColors[3][3] = [[0x000000, 0, -2], [0x262926, 0, 1], [0xF8FCF0, 0, 11]]
	Global $DonatePixel

	While $Donate
		If _Sleep(250) Then ExitLoop
		$DonatePixel = _MultiPixelSearch(202, $y, 203, 670, 1, 1, Hex(0x262926, 6), $offColors, 20)
		If IsArray($DonatePixel) Then
			$Donate = False
			If $DonateTroop Then
				Local $ClanString = ""
				$icount = 0
				while $ClanString = "" or $ClanString = " "
					_CaptureRegion(0, 0, 435, $DonatePixel[1] + 50)
					$ClanString = getString($DonatePixel[1] - 44)
					If $ClanString = "" Then
						$ClanString = getString($DonatePixel[1] - 31)
					Else
						$ClanString &= " " & getString($DonatePixel[1] - 31)
					EndIf
					If $ClanString = "" Or $ClanString = " " Then
						$ClanString = getString($DonatePixel[1] - 17)
					Else
						$ClanString &= " " & getString($DonatePixel[1] - 17)
					EndIf
					If _Sleep(250) Then ExitLoop
					$icount += 1
					if $icount = 10 then exitloop
				wend
				If $ClanString = "" Or $ClanString = " " Then
					SetLog("Unable to read Chat Request!", $COLOR_RED)
					$Donate = True
					$y = $DonatePixel[1] + 10
					ContinueLoop
				Else
					SetLog("Chat Request: " & $ClanString)
				EndIf

				If $iChkDonateBarbarians = 1 Then
					If CheckDonateTroop($eBarb, $aDonBarbarians, $aBlkBarbarians, $aBlackList, $ClanString) Then
						DonateTroopType($eBarb)
					EndIf
					If $Donate Then
						$y = $DonatePixel[1] + 10
						ContinueLoop
					EndIf
				EndIf

				If $iChkDonateArchers = 1 Then
					If CheckDonateTroop($eArch, $aDonArchers, $aBlkArchers, $aBlackList, $ClanString) Then
						DonateTroopType($eArch)
					EndIf
					If $Donate Then
						$y = $DonatePixel[1] + 10
						ContinueLoop
					EndIf
				EndIf

				If $iChkDonateGiants = 1 Then
					If CheckDonateTroop($eGiant, $aDonGiants, $aBlkGiants, $aBlackList, $ClanString) Then
						DonateTroopType($eGiant)
					EndIf
					If $Donate Then
						$y = $DonatePixel[1] + 10
						ContinueLoop
					EndIf
				EndIf

				If $iChkDonateGoblins = 1 Then
					If CheckDonateTroop($eGobl, $aDonGoblins, $aBlkGoblins, $aBlackList, $ClanString) Then
						DonateTroopType($eGobl)
					EndIf
					If $Donate Then
						$y = $DonatePixel[1] + 10
						ContinueLoop
					EndIf
				EndIf

				If $iChkDonateWallBreakers = 1 Then
					If CheckDonateTroop($eWall, $aDonWallBreakers, $aBlkWallBreakers, $aBlackList, $ClanString) Then
						DonateTroopType($eWall)
					EndIf
					If $Donate Then
						$y = $DonatePixel[1] + 10
						ContinueLoop
					EndIf
				EndIf

				If $iChkDonateBalloons = 1 Then
					If CheckDonateTroop($eBall, $aDonBalloons, $aBlkBalloons, $aBlackList, $ClanString) Then
						DonateTroopType($eBall)
					EndIf
					If $Donate Then
						$y = $DonatePixel[1] + 10
						ContinueLoop
					EndIf
				EndIf

				If $iChkDonateWizards = 1 Then
					If CheckDonateTroop($eWiza, $aDonWizards, $aBlkWizards, $aBlackList, $ClanString) Then
						DonateTroopType($eWiza)
					EndIf
					If $Donate Then
						$y = $DonatePixel[1] + 10
						ContinueLoop
					EndIf
				EndIf

				If $iChkDonateHealers = 1 Then
					If CheckDonateTroop($eHeal, $aDonHealers, $aBlkHealers, $aBlackList, $ClanString) Then
						DonateTroopType($eHeal)
					EndIf
					If $Donate Then
						$y = $DonatePixel[1] + 10
						ContinueLoop
					EndIf
				EndIf

				If $iChkDonateDragons = 1 Then
					If CheckDonateTroop($eDrag, $aDonDragons, $aBlkDragons, $aBlackList, $ClanString) Then
						DonateTroopType($eDrag)
					EndIf
					If $Donate Then
						$y = $DonatePixel[1] + 10
						ContinueLoop
					EndIf
				EndIf

				If $iChkDonatePekkas = 1 Then
					If CheckDonateTroop($ePekk, $aDonPekkas, $aBlkPekkas, $aBlackList, $ClanString) Then
						DonateTroopType($ePekk)
					EndIf
					If $Donate Then
						$y = $DonatePixel[1] + 10
						ContinueLoop
					EndIf
				EndIf

				If $iChkDonateMinions = 1 Then
					If CheckDonateTroop($eMini, $aDonMinions, $aBlkMinions, $aBlackList, $ClanString) Then
						DonateTroopType($eMini)
					EndIf
					If $Donate Then
						$y = $DonatePixel[1] + 10
						ContinueLoop
					EndIf
				EndIf

				If $iChkDonateHogRiders = 1 Then
					If CheckDonateTroop($eHogs, $aDonHogRiders, $aBlkHogRiders, $aBlackList, $ClanString) Then
						DonateTroopType($eHogs)
					EndIf
					If $Donate Then
						$y = $DonatePixel[1] + 10
						ContinueLoop
					EndIf
				EndIf

				If $iChkDonateValkyries = 1 Then
					If CheckDonateTroop($eValk, $aDonValkyries, $aBlkValkyries, $aBlackList, $ClanString) Then
						DonateTroopType($eValk)
					EndIf
					If $Donate Then
						$y = $DonatePixel[1] + 10
						ContinueLoop
					EndIf
				EndIf

				If $iChkDonateGolems = 1 Then
					If CheckDonateTroop($eGole, $aDonGolems, $aBlkGolems, $aBlackList, $ClanString) Then
						DonateTroopType($eGole)
					EndIf
					If $Donate Then
						$y = $DonatePixel[1] + 10
						ContinueLoop
					EndIf
				EndIf

				If $iChkDonateWitches = 1 Then
					If CheckDonateTroop($eWitc, $aDonWitches, $aBlkWitches, $aBlackList, $ClanString) Then
						DonateTroopType($eWitc)
					EndIf
					If $Donate Then
						$y = $DonatePixel[1] + 10
						ContinueLoop
					EndIf
				EndIf

				If $iChkDonateLavaHounds = 1 Then
					If CheckDonateTroop($eLava, $aDonLavaHounds, $aBlkLavaHounds, $aBlackList, $ClanString) Then
						DonateTroopType($eLava)
					EndIf
					If $Donate Then
						$y = $DonatePixel[1] + 10
						ContinueLoop
					EndIf
				EndIf

			EndIf

			If $DonateAllTroop Then
				Select
					Case $iChkDonateAllBarbarians = 1
						DonateTroopType($eBarb)
					Case $iChkDonateAllArchers = 1
						DonateTroopType($eArch)
					Case $iChkDonateAllGiants = 1
						DonateTroopType($eGiant)
					Case $iChkDonateAllGoblins = 1
						DonateTroopType($eGobl)
					Case $iChkDonateAllWallBreakers = 1
						DonateTroopType($eWall)
					Case $iChkDonateAllBalloons = 1
						DonateTroopType($eBall)
					Case $iChkDonateAllWizards = 1
						DonateTroopType($eWiza)
					Case $iChkDonateAllHealers = 1
						DonateTroopType($eHeal)
					Case $iChkDonateAllDragons = 1
						DonateTroopType($eDrag)
					Case $iChkDonateAllPekkas = 1
						DonateTroopType($ePekk)
					Case $iChkDonateAllMinions = 1
						DonateTroopType($eMini)
					Case $iChkDonateAllHogRiders = 1
						DonateTroopType($eHogs)
					Case $iChkDonateAllValkyries = 1
						DonateTroopType($eValk)
					Case $iChkDonateAllGolems = 1
						DonateTroopType($eGole)
					Case $iChkDonateAllWitches = 1
						DonateTroopType($eWitc)
					Case $iChkDonateAllLavaHounds = 1
						DonateTroopType($eLava)
				EndSelect
			EndIf

			$Donate = True
			$y = $DonatePixel[1] + 10
			Click(1, 1)
			If _Sleep(250) Then ExitLoop
		EndIf
		$DonatePixel = _MultiPixelSearch(202, $y, 203, 670, 1, 1, Hex(0x262926, 6), $offColors, 20)
		If IsArray($DonatePixel) Then ContinueLoop

		$Scroll = _PixelSearch(285, 650, 287, 700, Hex(0x97E405, 6), 20)
		$Donate = True
		If IsArray($Scroll) Then
			Click($Scroll[0], $Scroll[1])
			$y = 119
			If _Sleep(250) Then ExitLoop
			ContinueLoop
		EndIf
		$Donate = False
	WEnd

	_CaptureRegion()
	If _ColorCheck(_GetPixelColor(331, 330), Hex(0xF0A03B, 6), 20) Then
		Click(331, 330) ;Clicks chat thing
	EndIf

	If _Sleep(250) Then Return
EndFunc   ;==>DonateCC

Func CheckDonateTroop($Type, $aDonTroop, $aBlkTroop, $aBlackList, $ClanString)

	For $i = 0 To UBound($aBlackList) - 1
		If CheckDonateString($aBlackList[$i], $ClanString) Then
			SetLog("General Blacklist Keyword found: " & $aBlackList[$i], $COLOR_RED)
			Return False
		EndIf
	Next

	For $i = 0 To UBound($aBlkTroop) - 1
		If CheckDonateString($aBlkTroop[$i], $ClanString) Then
			SetLog(NameOfTroop($Type) & " Blacklist Keyword found: " & $aBlkTroop[$i], $COLOR_RED)
			Return False
		EndIf
	Next

	For $i = 0 To UBound($aDonTroop) - 1
		If CheckDonateString($aDonTroop[$i], $ClanString) Then
			Setlog(NameOfTroop($Type) & " Keyword found: " & $aDonTroop[$i], $COLOR_GREEN)
			Return True
		EndIf
	Next

	Return False
EndFunc   ;==>CheckDonateTroop

Func CheckDonateString($String, $ClanString) ;Checks if exact
	Local $Contains = StringMid($String, 1, 1) & StringMid($String, StringLen($String), 1)
	If $Contains = "[]" Then
		If $ClanString = StringMid($String, 2, StringLen($String) - 2) Then
			Return True
		Else
			Return False
		EndIf
	Else
		If StringInStr($ClanString, $String, 2) Then
			Return True
		Else
			Return False
		EndIf
	EndIf
EndFunc   ;==>CheckDonateString

Func DonateTroopType($Type)

	Local $Slot, $YComp

	Switch $Type
		Case $eBarb To $eWiza
			$Slot = $Type
			$YComp = 0
		Case $eHeal To $eGole
			$Slot = $Type - 7
			$YComp = 99
		Case $eWitc To $eLava
			$Slot = $Type - 14
			$YComp = 99 + 98
	EndSwitch

	Click($DonatePixel[0], $DonatePixel[1] + 11)
	If _Sleep(250) Then Return	
	_CaptureRegion(0, 0, 766, $DonatePixel[1] + 50 + $YComp)
	$icount = 0
	while not (_ColorCheck(_GetPixelColor(237 + ($Slot * 82), $DonatePixel[1] - 5 + $YComp), Hex(0x507C00, 6), 10) Or _
			_ColorCheck(_GetPixelColor(237 + ($Slot * 82), $DonatePixel[1] - 10 + $YComp), Hex(0x507C00, 6), 10) Or _
			_ColorCheck(_GetPixelColor(237 + ($Slot * 82), $DonatePixel[1] - 16 + $YComp), Hex(0x507C00, 6), 10))
		If _Sleep(250) Then Return	
		_CaptureRegion(0, 0, 766, $DonatePixel[1] + 50 + $YComp)
		$icount += 1
		if $icount = 10 then exitloop
	wend
	
	If _ColorCheck(_GetPixelColor(237 + ($Slot * 82), $DonatePixel[1] - 5 + $YComp), Hex(0x507C00, 6), 10) Or _
			_ColorCheck(_GetPixelColor(237 + ($Slot * 82), $DonatePixel[1] - 10 + $YComp), Hex(0x507C00, 6), 10) Or _
			_ColorCheck(_GetPixelColor(237 + ($Slot * 82), $DonatePixel[1] - 16 + $YComp), Hex(0x507C00, 6), 10) Then
			    SetLog("Donating " & NameOfTroop($Type), $COLOR_GREEN)
				Click(237 + ($Slot * 82), $DonatePixel[1] - 10 + $YComp, 8, 50)
				$Donate = True
				for $i=0 to Ubound($TroopName) - 1
					if eval("e" & $TroopName[$i]) = $Type then
						if $TroopHeight[$i] <= 6 then
							assign(eval("Cur" & $TroopName[$i]),eval("Cur" & $TroopName[$i])+5)
						else
							assign(eval("Cur" & $TroopName[$i]),eval("Cur" & $TroopName[$i])+1)
						endif
					endif
				next
				for $i=0 to Ubound($TroopDarkName) - 1
					if eval("e" & $TroopDarkName[$i]) = $Type then
						if $TroopDarkHeight[$i] <= 6 then
							assign(eval("Cur" & $TroopDarkName[$i]),eval("Cur" & $TroopDarkName[$i]) + 5)
						else
							assign(eval("Cur" & $TroopDarkName[$i]),eval("Cur" & $TroopDarkName[$i]) + 1)
						endif                
					endif
				next


	Else
		SetLog("No " & NameOfTroop($Type) & " available to donate..", $COLOR_RED)
		Return
	EndIf

	Click(1, 1)
	If _Sleep(250) Then Return
EndFunc   ;==>DonateTroopType
