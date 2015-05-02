Func UpgradeWall()

	If GUICtrlRead($chkWalls) = $GUI_CHECKED Then
		If $FreeBuilder > 0 Then
			SetLog("Checking Upgrade Walls", $COLOR_GREEN)
			Click(1, 1) ; click away
			$itxtWallMinGold = GUICtrlRead($txtWallMinGold)
			$itxtWallMinElixir = GUICtrlRead($txtWallMinElixir)

			Local $MinWallGold = Number($GoldCount - $Wallcost) > Number($itxtWallMinGold) ; Check if enough Gold
			Local $MinWallElixir = Number($ElixirCount - $Wallcost) > Number($itxtWallMinElixir) ; Check if enough Elixir

			If GUICtrlRead($UseGold) = $GUI_CHECKED Then
				$iUseStorage = 1
			ElseIf GUICtrlRead($UseElixir) = $GUI_CHECKED Then
				$iUseStorage = 2
			ElseIf GUICtrlRead($UseElixirGold) = $GUI_CHECKED Then
				$iUseStorage = 3
			EndIf

			Switch $iUseStorage
				Case 1
					If $MinWallGold Then
						SetLog("Upgrading Wall using Gold", $COLOR_GREEN)
						If CheckWall() Then UpgradeWallGold()
					Else
						SetLog("Gold is below minimum, Skip Upgrade", $COLOR_RED)
					EndIf
				Case 2
					If $MinWallElixir Then
						Setlog("Upgrading Wall using Elixir", $COLOR_GREEN)
						If CheckWall() Then UpgradeWallElixir()
					Else
						Setlog("Elixir is below minimum, Skip Upgrade", $COLOR_RED)
					EndIf
				Case 3
					If $MinWallElixir Then
						SetLog("Upgrading Wall using Elixir", $COLOR_GREEN)
						If CheckWall() And Not UpgradeWallElixir() Then
							SetLog("Upgrade with Elixir failed, Trying upgrade using Gold", $COLOR_RED)
							UpgradeWallGold()
						EndIf
					Else
						SetLog("Elixir is below minimum, Trying upgrade using Gold", $COLOR_RED)
						If $MinWallGold Then
							If CheckWall() Then UpgradeWallGold()
						Else
							Setlog("Gold is below minimum, Skip Upgrade", $COLOR_RED)
						EndIf
					EndIf
			EndSwitch
			Click(1, 1) ; click away
			Click(820, 40) ; Close Builder/Shop if open by accident
		Else
			SetLog("No free builder, Upgrade Walls skipped..", $COLOR_RED)
		EndIf
	EndIf

EndFunc   ;==>UpgradeWall

Func UpgradeWallGold()

	Click($WallX, $WallY)
	If _Sleep(600) Then Return

	Local $offColors[3][3] = [[0xD6714B, 47, 37], [0xF0E850, 70, 0], [0xF4F8F2, 79, 0]] ; 2nd pixel brown hammer, 3rd pixel gold, 4th pixel edge of button
	Global $ButtonPixel = _MultiPixelSearch(240, 563, 670, 650, 1, 1, Hex(0xF3F3F1, 6), $offColors, 30) ; first gray/white pixel of button
	If IsArray($ButtonPixel) Then
		Click($ButtonPixel[0] + 20, $ButtonPixel[1] + 20) ; Click Upgrade Gold Button
		If _Sleep(1000) Then Return
		_CaptureRegion()
		If _ColorCheck(_GetPixelColor(685, 150), Hex(0xE1090E, 6), 20) Then ; wall upgrade window red x
			Click(440, 480)
			If _Sleep(500) Then Return
			SetLog("Upgrade complete", $COLOR_GREEN)
			$wallgoldmake = $wallgoldmake + 1
			GUICtrlSetData($lblWallgoldmake, $wallgoldmake)
			Return True
		EndIf
	Else
		Setlog("No Upgrade Gold Button", $COLOR_RED)
		Return False
	EndIf

EndFunc   ;==>UpgradeWallGold

Func UpgradeWallElixir()

	Click($WallX, $WallY)
	If _Sleep(600) Then Return

	Local $offColors[3][3] = [[0xBC5B31, 38, 32], [0xF84CF9, 72, 0], [0xF5F9F2, 79, 0]] ; 2nd pixel brown hammer, 3rd pixel gold, 4th pixel edge of button
	Global $ButtonPixel = _MultiPixelSearch(240, 563, 670, 650, 1, 1, Hex(0xF4F7F2, 6), $offColors, 30) ; first gray/white pixel of button
	If IsArray($ButtonPixel) Then
		Click($ButtonPixel[0] + 20, $ButtonPixel[1] + 20) ; Click Upgrade Elixir Button
		If _Sleep(1000) Then Return
		_CaptureRegion()
		If _ColorCheck(_GetPixelColor(685, 150), Hex(0xE1090E, 6), 20) Then
			Click(440, 480)
			If _Sleep(500) Then Return
			SetLog("Upgrade complete", $COLOR_GREEN)
			$wallelixirmake = $wallelixirmake + 1
			GUICtrlSetData($lblWallelixirmake, $wallelixirmake)
			Return True
		EndIf
	Else
		Setlog("No Upgrade Elixir Button", $COLOR_RED)
		Return False
	EndIf

EndFunc   ;==>UpgradeWallElixir
