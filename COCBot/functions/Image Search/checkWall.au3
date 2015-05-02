; check Wall function
Global $checkwalllogic
Global $Wall[8]
For $i = 0 To 7
	$Wall[$i] = @ScriptDir & "\images\Walls\" & $i + 4 & ".png"
Next
Global $WallX = 0, $WallY = 0, $WallLoc = 0
;Global $Tolerance2 = 55

Func CheckWall()
	$WallLoc = 0
	;SetLog($WallLoc & " Walls level Upgrading...", $COLOR_GREEN)
	If _Sleep(500) Then Return
	For $Tolerance2 = 0 To 150
		If $WallLoc = 0 Then
			_CaptureRegion()
			$WallLoc = _ImageSearch($Wall[$icmbWalls], 1, $WallX, $WallY, $Tolerance2) ; Getting Wall Location
			If $icmbWalls = 6 Then
				If $WallLoc = 0 Then $WallLoc = _ImageSearch($Wall[$icmbWalls + 1], 1, $WallX, $WallY, $Tolerance2) ; Getting Wall lvl 10 Location
			EndIf
			If $WallLoc = 1 Then
				SetLog("Tolerance is " & $Tolerance2 & " Wall segment has been located...", $COLOR_GREEN)
				SetLog("Found Walls level " & $icmbWalls + 4 & ", Upgrading...", $COLOR_GREEN)
				$checkwalllogic = True
				Return True
			EndIf
			;Next
		EndIf

	Next
	$checkwalllogic = False
	SetLog("Cannot find Walls level " & $icmbWalls + 4 & ", Skip upgrade...", $COLOR_RED)
	Return False
EndFunc   ;==>CheckWall
