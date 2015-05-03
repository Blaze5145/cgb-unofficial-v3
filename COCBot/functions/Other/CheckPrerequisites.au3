Func isNetFramework4Installed()
	Local $z = 0, $sKeyName, $success = False
	Do
		$z += 1
		$sKeyName = RegEnumKey("HKLM\SOFTWARE\Microsoft\NET Framework Setup\NDP", $z)
		If StringRegExp($sKeyName, "v4|v4.\d+") Then
			ConsoleWrite(".NET Framework v4 installed!" & @LF)
			$success = True
		EndIf
	Until $sKeyName = '' Or $success
	Return $success
EndFunc   ;==>isNetFramework4Installed

Func isVC2010Installed()
	$ret = DllCall("msi.dll", "int", "MsiQueryProductState", "str", "{196BB40D-1578-3D01-B289-BEFC77A11A1E}")
	If ($ret[0] = "5") Then
		Return True
	Else
		Return False
	EndIf
EndFunc   ;==>isVC2010Installed


Func CheckPrerequisites()
	Local $isNetFramework4Installed = isNetFramework4Installed()
	Local $isVC2010Installed = isVC2010Installed()
	If ($isNetFramework4Installed = False Or $isVC2010Installed = False) Then
		If ($isNetFramework4Installed = False) Then
			SetLog("The .Net Framework 4 is not installed", $COLOR_RED)
			SetLog("Please download here : https://www.microsoft.com/fr-fr/download/details.aspx?id=17851", $COLOR_RED)
		EndIf
		If ($isVC2010Installed = False) Then
			SetLog("The VC 2010 x86 is not installed", $COLOR_RED)
			SetLog("Please download here : https://www.microsoft.com/fr-fr/download/details.aspx?id=5555", $COLOR_RED)
		EndIf

		GUICtrlSetState($btnStart, $GUI_DISABLE)
	EndIf
EndFunc   ;==>CheckPrerequisites
