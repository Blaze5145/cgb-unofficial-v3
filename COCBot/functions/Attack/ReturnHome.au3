;Returns home when in battle, will take screenshot and check for gold/elixir change unless specified not to.

Func ReturnHome($TakeSS = 1, $GoldChangeCheck = True) ;Return main screen
	If $GoldChangeCheck = True Then
		While GoldElixirChange()
			If _Sleep(1000) Then Return
		WEnd

		;If Heroes were not activated: Hero Ability activation before End of Battle to restore health
		If ($checkKPower = True Or $checkQPower = True) And $iActivateKQCondition = "Auto" Then
			_CaptureRegion()
			If _ColorCheck(_GetPixelColor(363, 548), Hex(0x78C11C, 6), 20) = False And _ColorCheck(_GetPixelColor(497, 548), Hex(0x79C326, 6), 20) = False Then ; If not already at Return Homescreen
				If $checkKPower = True Then
					SetLog("Activating King's power to restore some health before EndBattle", $COLOR_BLUE)
					SelectDropTroop($King) ;If King was not activated: Boost King before EndBattle to restore some health
				EndIf
				If $checkQPower = True Then
					SetLog("Activating Queen's power to restore some health before EndBattle", $COLOR_BLUE)
					SelectDropTroop($Queen) ;If Queen was not activated: Boost Queen before EndBattle to restore some health
				EndIf
			EndIf
		EndIf
	EndIf

	$checkKPower = False
	$checkQPower = False

	SetLog("Returning Home", $COLOR_BLUE)
	If $RunState = False Then Return
	Click(62, 519) ;Click Surrender
	If _Sleep(500) Then Return
	Click(512, 394) ;Click Confirm
	If _Sleep(500) Then Return

	If $TakeSS = 1 Then
		If _Sleep(2500) Then Return
		SetLog("Taking snapshot of your loot", $COLOR_GREEN)
		Local $Date = @YEAR & "-" & @MON & "-" & @MDAY
		Local $Time = @HOUR & "." & @MIN
		_CaptureRegion(0, 0, 860, 675)
		$hBitmap_Scaled = _GDIPlus_ImageResize($hBitmap, _GDIPlus_ImageGetWidth($hBitmap) / 2, _GDIPlus_ImageGetHeight($hBitmap) / 2) ;resize image
		_GDIPlus_ImageSaveToFile($hBitmap_Scaled, $dirLoots & $Date & "_" & $Time & ".jpg")
		;attackReport()
	EndIf

	Click(428, 544) ;Click Return Home Button

	Local $counter = 0
	While 1
		If _Sleep(2000) Then Return
		_CaptureRegion()
		If _ColorCheck(_GetPixelColor(284, 28), Hex(0x41B1CD, 6), 20) Then
			_GUICtrlEdit_SetText($txtLog, "")
			Return
		EndIf

		$counter += 1

		If $counter >= 50 Then
			SetLog("Cannot return home.", $COLOR_RED)
			checkMainScreen()
			Return
		EndIf
	WEnd
EndFunc   ;==>ReturnHome
