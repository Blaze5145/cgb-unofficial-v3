;Drops Clan Castle troops, given the slot and x, y coordinates.

Func dropCC($x, $y, $slot) ;Drop clan castle
	If $slot <> -1 And $checkUseClanCastle = 1 Then
		SetLog("Dropping Clan Castle", $COLOR_BLUE)
		Click(68 + (72 * $slot), 595, 1, 500)
		If _Sleep(500) Then Return
		Click($x, $y)
	EndIf
EndFunc   ;==>dropCC