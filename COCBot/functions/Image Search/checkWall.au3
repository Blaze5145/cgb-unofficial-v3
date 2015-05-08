; #FUNCTION# ====================================================================================================================
; Name ..........: CheckWall()
; Description ...: This file Includes the detection of Walls for Upgrade
; Syntax ........:
; Parameters ....: None
; Return values .:
; Author ........:
; Modified ......:
; Remarks .......: This file is part of ClashGameBot. Copyright 2015
;                  ClashGameBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........:
; Example .......: No
; ===============================================================================================================================


Global $checkwalllogic
Global $WallLvText , $WallLv
Global $Wall[7][3]

;$Wall[0][0] = @ScriptDir & "\images\Walls\3_1.bmp"
;$Wall[0][1] = @ScriptDir & "\images\Walls\3_2.bmp"

$Wall[0][0] = @ScriptDir & "\images\Walls\4_1.bmp"
$Wall[0][1] = @ScriptDir & "\images\Walls\4_2.bmp"

$Wall[1][0] = @ScriptDir & "\images\Walls\5_1.bmp"
$Wall[1][1] = @ScriptDir & "\images\Walls\5_2.bmp"

$Wall[2][0] = @ScriptDir & "\images\Walls\6_1.bmp"
$Wall[2][1] = @ScriptDir & "\images\Walls\6_2.bmp"

$Wall[3][0] = @ScriptDir & "\images\Walls\7_1.bmp"
$Wall[3][1] = @ScriptDir & "\images\Walls\7_2.bmp"

$Wall[4][0] = @ScriptDir & "\images\Walls\8_1.bmp"
$Wall[4][1] = @ScriptDir & "\images\Walls\8_2.bmp"

$Wall[5][0] = @ScriptDir & "\images\Walls\9_1.bmp"
$Wall[5][1] = @ScriptDir & "\images\Walls\9_2.bmp"
$Wall[5][2] = @ScriptDir & "\images\Walls\9_3.bmp"

$Wall[6][0] = @ScriptDir & "\images\Walls\10_1.bmp"
$Wall[6][1] = @ScriptDir & "\images\Walls\10_2.bmp"


Global $WallX = 0, $WallY = 0, $WallLoc = 0


Func CheckWall()
	$WallLoc = 0
	Local $centerPixel[2] = [430, 313]
	If _Sleep(500) Then Return

	For $Tolerance2 = 0 To 75
		For $x = 0 To 1
			If $WallLoc = 0 Then
				;###################### ZONE 2 ##########################
				_CaptureRegion(78, 200, 790, 360)
				$WallLoc = _ImageSearch($Wall[$icmbWalls][$x], 1, $WallX, $WallY, $Tolerance2) ; Getting Wall Location
				If $WallLoc = 1 Then
					$WallX += 78
					$WallY += 200
					SetLog("Tolerance is " & $Tolerance2 & " Wall segment in Zone 2: " & "[" & $WallX & "," & $WallY & "]", $COLOR_GREEN)
					SetLog("Found Walls level " & $icmbWalls + 4 & ", Upgrading...", $COLOR_GREEN)
					$checkwalllogic = True
					Return True
				EndIf
			EndIf
		Next
	Next

	For $Tolerance2 = 0 To 75
		For $x = 0 To 1
			If $WallLoc = 0 Then
				;###################### ZONE 1 ##########################
				_CaptureRegion(226, 74, 654, 204)
				$WallLoc = _ImageSearch($Wall[$icmbWalls][$x], 1, $WallX, $WallY, $Tolerance2) ; Getting Wall Location
				If $WallLoc = 1 Then
					$WallX += 226
					$WallY += 74
					SetLog("Tolerance is " & $Tolerance2 & " Wall segment in Zone 1: " & "[" & $WallX & "," & $WallY & "]", $COLOR_GREEN)
					SetLog("Found Walls level " & $icmbWalls + 4 & ", Upgrading...", $COLOR_GREEN)
					$checkwalllogic = True
					Return True
				EndIf
			EndIf
		Next
	Next
	For $Tolerance2 = 0 To 75
		For $x = 0 To 1
			If $WallLoc = 0 Then
				;###################### ZONE 3 ##########################
				_CaptureRegion(168, 355, 702, 430)
				$WallLoc = _ImageSearch($Wall[$icmbWalls][$x], 1, $WallX, $WallY, $Tolerance2) ; Getting Wall Location
				If $WallLoc = 1 Then
					$WallX += 168
					$WallY += 335
					SetLog("Tolerance is " & $Tolerance2 & " Wall segment in Zone 3: " & "[" & $WallX & "," & $WallY & "]", $COLOR_GREEN)
					SetLog("Found Walls level " & $icmbWalls + 4 & ", Upgrading...", $COLOR_GREEN)
					$checkwalllogic = True
					Return True
				EndIf
			EndIf
		Next
	Next
	For $Tolerance2 = 0 To 75
		For $x = 0 To 1
			If $WallLoc = 0 Then
				;###################### ZONE 4 ##########################
				_CaptureRegion(294, 425, 654, 520)
				$WallLoc = _ImageSearch($Wall[$icmbWalls][$x], 1, $WallX, $WallY, $Tolerance2) ; Getting Wall Location
				If $WallLoc = 1 Then
					$WallX += 294
					$WallY += 425
					SetLog("Tolerance is " & $Tolerance2 & " Wall segment in Zone 4: " & "[" & $WallX & "," & $WallY & "]", $COLOR_GREEN)
					SetLog("Found Walls level " & $icmbWalls + 4 & ", Upgrading...", $COLOR_GREEN)
					$checkwalllogic = True
					Return True
				EndIf
			EndIf
		Next
	Next
	$checkwalllogic = False
	SetLog("Cannot find Walls level " & $icmbWalls + 4 & ", Skip upgrade...", $COLOR_RED)
	Return False
EndFunc   ;==>CheckWall

Func CheckWallLv()
	$WallLv = 0
	Local $i = ($icmbWalls - 1)

	For $Tolerance2 = 0 To 75
		For $x = 0 To 1
			If $WallLv = 0 Then
				_CaptureRegion(78, 146, 760, 480)
				$WallLv = _ImageSearch($Wall[$i][$x], 1, $x, $y, $Tolerance2) ; Getting Wall Location
				If $WallLv = 1 Then
					SetLog("Found Walls level: " & $i + 4 & " in Village Map", $COLOR_GREEN)
					Return $WallLvText[$i]
				EndIf
			EndIf
		Next
	Next
	If $WallLv = 0 Then
		SetLog("Not Found Walls level: " & $i + 4 & " to upgrade, please verify your Settings", $COLOR_GREEN)
	EndIf
EndFunc   ;==>CheckWallLv