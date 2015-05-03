; #FUNCTION# ====================================================================================================================
; Name ..........: BotDetectFirstTime
; Description ...: This script detects your builings on the first run
; Author ........: HungLe (april-2015)
; Modified ......: Hervidero (april-2015),(may-2015), HungLe (may-2015)
; Remarks .......: This file is part of ClashGameBot. Copyright 2015
;                  ClashGameBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........:
; Example .......: No
; ===============================================================================================================================

Func BotDetectFirstTime()

	Click(1, 1) ; Click away
	If _Sleep(1000) Then Return

	_WinAPI_DeleteObject($hBitmapFirst)
	$hBitmapFirst = _CaptureRegion2()

	SetLog("Detecting your Buildings..", $COLOR_BLUE)

	If $ichkTrap = 1 And $TownHallPos[0] = -1 Then
		Local $PixelTHHere = GetLocationItem("getLocationTownHall")
		If UBound($PixelTHHere) > 0 Then
			$pixel = $PixelTHHere[0]
			$TownHallPos[0] = $pixel[0]
			$TownHallPos[1] = $pixel[1]
		EndIf
	EndIf

	If _Sleep(50) Then Return

	If $barrackPos[0] = "" Or $barrackNum = 0 Then
		Local $PixelBarrackHere = GetLocationItem("getLocationBarrack")
		$barrackNum = UBound($PixelBarrackHere)
		SetLog("Total No. of Barracks: " & $barrackNum)
		If UBound($PixelBarrackHere) > 0 Then
			$pixel = $PixelBarrackHere[0]
			$barrackPos[0] = $pixel[0]
			$barrackPos[1] = $pixel[1]
		EndIf
	EndIf

	If _Sleep(50) Then Return

	If $barrackDarkNum = 0 Then
		Local $PixelBarrackDarkHere = GetLocationItem("getLocationDarkBarrack")
		$barrackDarkNum = UBound($PixelBarrackDarkHere)
		SetLog("Total No. of Dark Barracks: " & $barrackDarkNum)
	EndIf

	If _Sleep(50) Then Return

	If $ArmyPos[0] = "" Or $ArmyPos[0] = 0 Then
		LocateBarrack(True)
	EndIf

	If _Sleep(50) Then Return

	If $iChkRequest = 1 And $aCCPos[0] = -1 Then
		LocateClanCastle()
	EndIf

	If _Sleep(50) Then Return

	If $listResourceLocation = "" Then
		$PixelMineHere = GetLocationItem("getLocationMineExtractor")
		If UBound($PixelMineHere) > 0 Then
			SetLog("Total No. of Gold Mines: " & UBound($PixelMineHere))
		EndIf
		For $i = 0 To UBound($PixelMineHere) - 1
			$pixel = $PixelMineHere[$i]
			$listResourceLocation = $listResourceLocation & $pixel[0] & ";" & $pixel[1] & "|"
		Next
		$PixelElixirHere = GetLocationItem("getLocationElixirExtractor")
		If UBound($PixelElixirHere) > 0 Then
			SetLog("Total No. of Elixir Collectors: " & UBound($PixelElixirHere))
		EndIf
		For $i = 0 To UBound($PixelElixirHere) - 1
			$pixel = $PixelElixirHere[$i]
			$listResourceLocation = $listResourceLocation & $pixel[0] & ";" & $pixel[1] & "|"
		Next
		$PixelDarkElixirHere = GetLocationItem("getLocationDarkElixirExtractor")
		If UBound($PixelDarkElixirHere) > 0 Then
			SetLog("Total No. of Dark Elixir Drills: " & UBound($PixelDarkElixirHere))
		EndIf
		For $i = 0 To UBound($PixelDarkElixirHere) - 1
			$pixel = $PixelDarkElixirHere[$i]
			$listResourceLocation = $listResourceLocation & $pixel[0] & ";" & $pixel[1] & "|"
		Next
	EndIf

EndFunc   ;==>BotDetectFirstTime
