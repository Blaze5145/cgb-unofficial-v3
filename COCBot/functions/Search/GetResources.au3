; Uses the getGold,getElixir... functions and uses CompareResources until it meets conditions.
; Will wait ten seconds until getGold returns a value other than "", if longer than 10 seconds exits

Func GetResources() ;Reads resources
	Local $i = 0
	;_CaptureRegion()
	If _Sleep(100) Then Return
	$searchGold = "" 
	While $searchGold = "" ; Loops until gold is readable
		If _Sleep(100) Then Return
		$searchGold = getGold(51, 66)
		if $searchGold < 1000 then
			$searchGold = ""
		endif
		$i += 1
		If $i >= 100 Then ; wait max 10 sec then Restart Bot
			SetLog("Cannot locate Next button, Restarting Bot", $COLOR_RED)
			$Is_ClientSyncError = True
			$iStuck = 0
			checkMainScreen()
			$Restart = True
			Return
		EndIf
	WEnd

	$searchElixir = getElixir(51, 66 + 29)
	$i = 0
	while $searchElixir < 1000
		If _Sleep(100) Then Return
		$searchElixir = getElixir(51, 66 + 29)
		$i += 1
		If $i >= 100 Then ; wait max 10 sec then Restart Bot
			SetLog("Cannot locate Next button, Restarting Bot", $COLOR_RED)
			$Is_ClientSyncError = True
			$iStuck = 0
			checkMainScreen()
			$Restart = True
			Return
		EndIf		
	wend
	$searchTrophy = getTrophy(51, 66 + 90)

	If $searchGold = $searchGold2 Then $iStuck += 1
	If $searchGold <> $searchGold2 Then $iStuck = 0

	$searchGold2 = $searchGold
	If $iStuck >= 5 Then
		SetLog("Cannot locate Next button, Restarting Bot", $COLOR_RED)
		$Is_ClientSyncError = True
		$iStuck = 0
		checkMainScreen()
		$Restart = True
		Return
	EndIf

	If $searchTrophy <> "" Then
		$searchDark = getDarkElixir(51, 66 + 57)
	Else
		$searchDark = 0
		$searchTrophy = getTrophy(51, 66 + 60)
	EndIf

	Local $THString = ""
    $searchTH = "-"
	If ($OptBullyMode = 1 And $SearchCount >= $ATBullyMode) Or $OptTrophyMode = 1 Or $chkConditions[4] = 1 Or $chkConditions[5] = 1 Then
		If $chkConditions[5] = 1 Or $OptTrophyMode = 1 Then
			$searchTH = checkTownhallADV()
		Else
			$searchTH = checkTownhall()
		EndIf

		If SearchTownHallLoc() = False And $searchTH <> "-" Then
			$THLoc = "In"
		ElseIf $searchTH <> "-" Then
			$THLoc = "Out"
		Else
			$THLoc = $searchTH
			$THx = 0
			$THy = 0
		EndIf
		$THString = " [TH]:" & StringFormat("%2s", $searchTH) & ", " & $THLoc
	EndIf

	$SearchCount += 1 ; Counter for number of searches
	SetLog(StringFormat("%3s", $SearchCount) & "> [G]:" & StringFormat("%7s", $searchGold) & " [E]:" & StringFormat("%7s", $searchElixir) & " [D]:" & StringFormat("%5s", $searchDark) & " [T]:" & StringFormat("%2s", $searchTrophy) & $THString, $COLOR_BLACK, "Lucida Console", 7.5)

EndFunc   ;==>GetResources
