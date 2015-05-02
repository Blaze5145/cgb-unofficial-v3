; #FUNCTION# ====================================================================================================================
; Name ..........: GetListPixel($listPixel), GetListPixel2($listPixel), GetLocationItem($functionName)
; Description ...: Pixel and Locate Image functions
; Author ........: HungLe (april-2015)
; Modified ......:
; Remarks .......: This file is part of ClashGameBot. Copyright 2015
;                  ClashGameBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........:
; Example .......: No
; ===============================================================================================================================

Func GetListPixel($listPixel)
	Local $listPixelSideStr = StringSplit($listPixel, "|")
	If ($listPixelSideStr[0] > 1) Then
		Local $listPixelSide[UBound($listPixelSideStr) - 1]
		For $i = 0 To UBound($listPixelSide) - 1
			Local $pixelStr = StringSplit($listPixelSideStr[$i + 1], "-")
			If ($pixelStr[0] > 1) Then
				Local $pixel[2] = [$pixelStr[1], $pixelStr[2]]
				$listPixelSide[$i] = $pixel
			EndIf
		Next
		Return $listPixelSide
	Else
		If StringInStr($listPixel, "-") > 0 Then
			Local $pixelStrHere = StringSplit($listPixel, "-")
			Local $pixelHere[2] = [$pixelStrHere[1], $pixelStrHere[2]]
			Local $listPixelHere[1]
			$listPixelHere[0] = $pixelHere
			Return $listPixelHere
		EndIf
		Return -1;
	EndIf
EndFunc   ;==>GetListPixel


Func GetLocationItem($functionName)
	$resultHere = DllCall($LibDir & "\CGBfunctions.dll", "str", $functionName, "ptr", $hBitmapFirst)
	If UBound($resultHere) > 0 Then
		Return GetListPixel($resultHere[0])
	EndIf
EndFunc   ;==>GetLocationItem
