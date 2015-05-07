; #FUNCTION# ====================================================================================================================
; Name ..........: algorithmTH
; Description ...: This file contens the attack algorithm TH and Lspell
; Syntax ........: algorithmTH() , AttackTHGrid() , AttackTHNormal() , AttackTHXtreme() , LLDropheroes() , SpellTHGrid() , CastSpell()
; Parameters ....: None
; Return values .: None
; Author ........: AtoZ (2015)
; Modified ......:
; Remarks .......: This file is part of ClashGameBot. Copyright 2015
;                  ClashGameBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........:
; Example .......: No
; ===============================================================================================================================


Func algorithmTH() ;Attack Algorithm TH
	If GUICtrlRead($chkAttackTH) = $GUI_CHECKED Then
		$LeftTHx = 40
		$RightTHx = 30
		$BottomTHy = 30
		$TopTHy = 30
		$GetTHLoc = 0
		If $THLocation = 0 Then
			SetLog("Can't get Townhall location", $COLOR_RED)
		ElseIf $THx > 227 And $THx < 627 And $THy > 151 And $THy < 419 And GUICtrlRead($chkAttackTH) = $GUI_CHECKED Then ;if found outside
			SetLog("Townhall location (" & $THx & ", " & $THy &")")
			SetLog("Townhall is in the Center of the Base. Ignore Attacking Townhall", $COLOR_RED)
			$THLocation = 0
		Else
			SetLog("Townhall location (" & $THx & ", " & $THy &")")
		EndIf
		If _Sleep(100) Then Return
		While 1
		  Local $i = 0
		  If $Barb <> -1 And $THLocation <> 0 Then
				  $atkTroops[$Barb][1] = Number(getNormal(40 + (72 * $Barb), 565))
				  Local $numBarbPerSpot = Ceiling($atkTroops[$Barb][1] / 3)
				  If $atkTroops[$Barb][1] <> 0 Then
					  Click(68 + (72 * $Barb), 595) ;Select Troop
					  If _Sleep(100) Then ExitLoop (2)
					  If GUICtrlRead($chkAttackTH) = $GUI_CHECKED Then
						  If $GetTHLoc = 0 Then
						   If $THx < 287 And $THx > 584 And $THy < 465 Then ; Leftmost, Rightmost, Topmost. If found Outside
								$i = 0
							 $atkTroops[$Barb][1] = Number(getNormal(40 + (72 * $Barb), 565))
							 While $atkTroops[$Barb][1] <> 0
								 Click(($THx-$LeftTHx), ($THy+$LeftTHx-30), 1, 1) ; BottomLeft
								 $AtkTroopTH = Number(getNormal(40 + (72 * $Barb), 565))
								 SetLog("Getting Attack Townhall location...", $COLOR_BLUE)
								 $LeftTHx += 10
								 $i += 1
								 If $AtkTroopTH <> $atkTroops[$Barb][1] Or $i >= 10 Then
									 $GetTHLoc += 1
									 ExitLoop
								 EndIf
							  WEnd
							  $i = 0
							$atkTroops[$Barb][1] = Number(getNormal(40 + (72 * $Barb), 565))
							 While $atkTroops[$Barb][1] <> 0
								 Click(($THx+$RightTHx), ($THy+$RightTHx-10), 1, 1) ; BottomRight
								 $AtkTroopTH = Number(getNormal(40 + (72 * $Barb), 565))
								 SetLog("Getting Attack Townhall location...", $COLOR_BLUE)
								 $RightTHx += 10
								 $i += 1
								 If $AtkTroopTH <> $atkTroops[$Barb][1] Or $i >= 10 Then
									 $GetTHLoc += 1
									 ExitLoop
								 EndIf
							  WEnd
						   EndIf
						   $i = 0
						 $atkTroops[$Barb][1] = Number(getNormal(40 + (72 * $Barb), 565))
						  While $atkTroops[$Barb][1] <> 0
							  Click(($THx+$TopTHy-10), ($THy-$TopTHy), 1, 1) ; TopRight
							  $AtkTroopTH = Number(getNormal(40 + (72 * $Barb), 565))
							  SetLog("Getting Attack Townhall location...", $COLOR_BLUE)
							  $TopTHy += 10
							  $i += 1
							  If $AtkTroopTH <> $atkTroops[$Barb][1] Or $i >= 10 Then
								  $GetTHLoc += 1
								  ExitLoop
							  EndIf
						   WEnd
						   $i = 0
						 $atkTroops[$Barb][1] = Number(getNormal(40 + (72 * $Barb), 565))
						  While $atkTroops[$Barb][1] <> 0
							  Click(($THx-($BottomTHy+10)), ($THy-$BottomTHy), 1, 1) ; TopLeft
							  $AtkTroopTH = Number(getNormal(40 + (72 * $Barb), 565))
							  SetLog("Getting Attack Townhall location...", $COLOR_BLUE)
							  $BottomTHy += 10
							  $i += 1
							  If $AtkTroopTH <> $atkTroops[$Barb][1] Or $i >= 10 Then
								  $GetTHLoc += 1
								  ExitLoop
							  EndIf
						   WEnd
						 EndIf
						  SetLog("Attacking Townhall with first wave Barbarians", $COLOR_BLUE)
						  For $i = 2 To 4
							  If $GetTHLoc = $i Then $numBarbPerSpot = Ceiling($numBarbPerSpot / $i)
						  Next
						  If $THx < 287 And $THx > 584 And $THy < 465 Then ;Leftmost, rightmost, topmost. If found outside
							 Click(($THx-$LeftTHx), ($THy+$LeftTHx-30), $numBarbPerSpot, 200) ; BottomLeft
							 Click(($THx+$RightTHx), ($THy+$RightTHx-10), $numBarbPerSpot, 200) ; BottomRight
						  EndIf
						  Click(($THx+$TopTHy-10), ($THy-$TopTHy), $numBarbPerSpot, 200) ; TopRight
						  Click(($THx-($BottomTHy+10)), ($THy-$BottomTHy), $numBarbPerSpot, 200) ; TopLeft
					  EndIf
				  EndIf
		  If _Sleep(1000) Then ExitLoop
		  EndIf
		  If $Arch <> -1 And $THLocation <> 0 Then
			  $atkTroops[$Arch][1] = Number(getNormal(40 + (72 * $Arch), 565))
			  Local $numArchPerSpot = Ceiling($atkTroops[$Arch][1] / 3)
			  If $atkTroops[$Arch][1] <> 0 Then
				  Click(68 + (72 * $Arch), 595) ;Select Troop
				  If _Sleep(100) Then ExitLoop (2)
				  If GUICtrlRead($chkAttackTH) = $GUI_CHECKED Then
					  If $GetTHLoc = 0 Then
						If $THx < 287 And $THx > 584 And $THy < 465 Then ; Leftmost, Rightmost and Topmost. If found outside
							$i = 0
						 $atkTroops[$Arch][1] = Number(getNormal(40 + (72 * $Arch), 565))
						 While $atkTroops[$Arch][1] <> 0
							 Click(($THx-$LeftTHx), ($THy+$LeftTHx-30), 1, 1) ; BottomLeft
							 $AtkTroopTH = Number(getNormal(40 + (72 * $Arch), 565))
							 SetLog("Getting Attack Townhall location...", $COLOR_BLUE)
							 $LeftTHx += 10
							 $i += 1
							 If $AtkTroopTH <> $atkTroops[$Arch][1] Or $i >= 10 Then
								 $GetTHLoc += 1
								 ExitLoop
							 EndIf
						  WEnd
						  $i = 0
						$atkTroops[$Arch][1] = Number(getNormal(40 + (72 * $Arch), 565))
						 While $atkTroops[$Arch][1] <> 0
							 Click(($THx+$RightTHx), ($THy+$RightTHx-10), 1, 1) ; BottomRight
							 $AtkTroopTH = Number(getNormal(40 + (72 * $Arch), 565))
							 SetLog("Getting Attack Townhall location...", $COLOR_BLUE)
							 $RightTHx += 10
							 $i += 1
							 If $AtkTroopTH <> $atkTroops[$Arch][1] Or $i >= 10 Then
								 $GetTHLoc += 1
								 ExitLoop
							 EndIf
						  WEnd
					   EndIf
					   $i = 0
					 $atkTroops[$Arch][1] = Number(getNormal(40 + (72 * $Arch), 565))
					  While $atkTroops[$Arch][1] <> 0
						  Click(($THx+$TopTHy-10), ($THy-$TopTHy), 1, 1) ; TopRight
						  $AtkTroopTH = Number(getNormal(40 + (72 * $Arch), 565))
						  SetLog("Getting Attack Townhall location...", $COLOR_BLUE)
						  $TopTHy += 10
						  $i += 1
						  If $AtkTroopTH <> $atkTroops[$Arch][1] Or $i >= 10 Then
							  $GetTHLoc += 1
							  ExitLoop
						  EndIf
					   WEnd
					   $i = 0
					 $atkTroops[$Arch][1] = Number(getNormal(40 + (72 * $Arch), 565))
					  While $atkTroops[$Arch][1] <> 0
						  Click(($THx-($BottomTHy+10)), ($THy-$BottomTHy), 1, 1) ; TopLeft
						  $AtkTroopTH = Number(getNormal(40 + (72 * $Arch), 565))
						  SetLog("Getting Attack Townhall location...", $COLOR_BLUE)
						  $BottomTHy += 10
						  $i += 1
						  If $AtkTroopTH <> $atkTroops[$Arch][1] Or $i >= 10 Then
							  $GetTHLoc += 1
							  ExitLoop
						  EndIf
					   WEnd
					 EndIf
					  SetLog("Attacking Townhall with first wave of Archers", $COLOR_BLUE)
					  $LeftTHx += 10
					  $RightTHx += 10
					  $BottomTHy += 10
					  $TopTHy += 10
					   For $i = 2 To 4
						   If $GetTHLoc = $i Then $numArchPerSpot = Ceiling($numArchPerSpot / $i)
					   Next
					  If $THx < 287 And $THx > 584 And $THy < 465 Then ;Left most and Right most and tOp most. if found outside
						 Click(($THx-$LeftTHx), ($THy+$LeftTHx-30), $numArchPerSpot, 200) ; BottomLeft
						 Click(($THx+$RightTHx), ($THy+$RightTHx-10), $numArchPerSpot, 200) ; BottomRight
					  EndIf
					  Click(($THx+$TopTHy-10), ($THy-$TopTHy), $numArchPerSpot, 200) ; TopRight
					  Click(($THx-($BottomTHy+10)), ($THy-$BottomTHy), $numArchPerSpot, 200) ; TopLeft
				  EndIf
			  EndIf
		  EndIf
		  ExitLoop
		WEnd
		If $THLocation <> 0 Then
		   PrepareAttack(True) ;Check remaining quantities
		EndIf
	EndIf
 EndFunc   ;==>algorithmTH

 Func AttackTHGrid($troopKind,$spots,$numperspot,$Sleep,$waveNb,$maxWaveNb,$BoolDropHeroes)
   Local $aThx,$aThy,$num
   Local $TroopCountBeg
If SearchTownHallLoc() And GUICtrlRead($chkAttackTH)=$GUI_CHECKED Then

	  _CaptureRegion()
	  If _ColorCheck(_GetPixelColor(747,497), Hex(0x0C2C8C0, 6), 20) Then Return ;exit if 1 star

	  If $BoolDropHeroes=True Then	ALLDropheroes($aThx,$aThy)

   Local $THtroop = -1
   Local $troopNb = 0
   Local $name = ""
   For $i = 0 To 8
	  If $atkTroops[$i][0] = $troopKind Then
		 $THtroop = $i
		 $troopNb = $spots*$numperspot
		 Local $plural = 0
		 if $troopNb > 1 Then $plural = 1
		 $name = NameOfTroop($troopKind, $plural)
	  EndIf
   Next

		 _CaptureRegion()
    	  $TroopCountBeg=Number(getNormal(40 + (72 * $THtroop), 565))

   If ($THtroop = -1) Or ($TroopCountBeg = 0) Then	SetLog("No "&$name&" troop Found!!!")
   if ($THtroop = -1) Or ($TroopCountBeg = 0) Then Return False

   Local $waveName = "first"
   if $waveNb = 2 Then $waveName = "second"
   if $waveNb = 3 Then $waveName = "third"
   if $maxWaveNb = 1 Then $waveName = "only"
   if $waveNb = 0 Then $waveName = "last"
   SetLog("Dropping " & $waveName & " wave of " & $troopNb & " " & $name, $COLOR_GREEN)

;			SetLog("Attacking TH with "&NameOfTroop($atkTroops[$THtroop][0]))
			SelectDropTroop($THtroop) ;Select Troop
			_Sleep(500)

			If $THi<=15 Or $THside=0 Or $THside=2 Then
			   Switch $THside
			   Case 0 ;UL
				  For $num=0 to $numperspot-1
					 For $ii=$THi-1 to $THi-1+($spots-1)
						   $aThx=25+$ii*19
						   $aThy=314-$ii*14
						   Click($aThx,$aThy)
					 Next
				  Next
			   Case 1 ;LL
				  For $num=0 to $numperspot-1
					 For $ii=$THi to $THi+($spots-1)
						   $aThx=25+$ii*19
						   $aThy=314+$ii*14
						   Click($aThx,$aThy)
					 Next
				  Next
			   Case 2 ;UR
				  For $num=0 to $numperspot-1
					 For $ii=$THi to $THi+($spots-1)
						   $aThx=830-$ii*19
						   $aThy=314-$ii*14
						   Click($aThx,$aThy)
					 Next
				  Next
			   Case 3 ;LR
				  For $num=0 to $numperspot-1
					 For $ii=$THi+1 to $THi+1+($spots-1)
						$aThx=830-$ii*19
						$aThy=314+$ii*14
						   Click($aThx,$aThy)
					 Next
				  Next
			   EndSwitch
			EndIf

			If $THi>15 Then
				  If $THside=1 Then
;						Setlog("LL Bottom deployment $THi="&$THi)
						For $num=0 to $numperspot
							  _CaptureRegion()
							  Local $BottomDeployCount=Number(getNormal(40 + (72 * $THtroop), 565))
							  If $BottomDeployCount=0 Then ExitLoop
							  For $iy=0 To 19/4*5 Step 19/4
								 For $ix=0 To 14/4*5*2 Step 14/4
									   _CaptureRegion()
									   If $BottomDeployCount-Number(getNormal(40 + (72 * $THtroop), 565))>=5 Then ExitLoop(3)
									   Click(floor(340+$ix),floor(545-$iy),5,5) ;not sure deploy but highest chance of hit. Static 1 spot only
									   _Sleep(50)
								 Next
							  Next

;							  		Click(323,538,5,50) ;not sure deploy but highest chance of hit. Static 1 spot only
							  _CaptureRegion()
							  If $BottomDeployCount=Number(getNormal(40 + (72 * $THtroop), 565)) Then
;									SetLog("BottomLeft Deployment1 Failed numspot="&$num&". Deploying Alternative 2")
									If $THtroop<3 Then
										  For $ii=0 to ceiling($spots*1)
												Click(340-$ii*19, 546-$ii*14) ;sure deploy for clearing but low chance of hitting
										  Next
									EndIf
							  EndIf
						Next
				  EndIf

				  If $THside=3 Then
;						Setlog("LR Bottom deployment $THi="&$THi)
						For $num=0 to $numperspot
							  _CaptureRegion()
							  $BottomDeployCount=Number(getNormal(40 + (72 * $THtroop), 565))
							  If $BottomDeployCount=0 Then ExitLoop
							  For $iy=0 To 19/4*5 Step 19/4
								 For $ix=0 To 14/4*5*2 Step 14/4
									   _CaptureRegion()
									   If $BottomDeployCount-Number(getNormal(40 + (72 * $THtroop), 565))>=5 Then ExitLoop(3)
									   Click(floor(516-$ix),floor(545-$iy),5,5) ;not sure deploy but highest chance of hit. Static 1 spot only
									   _Sleep(50)
								 Next
							  Next

;									Click(531,538,5,50) ;not sure deploy but highest chance of hit. Static 1 spot only
							  _CaptureRegion()
							  If $BottomDeployCount=Number(getNormal(40 + (72 * $THtroop), 565)) Then
;									SetLog("BottomRight Deployment1 Failed numspot="&$num&". Deploying Alternative 2")
									if $THtroop<3 Then
										  For $ii=0 to Ceiling($spots*1)
												Click(524+$ii*19, 546-$ii*14)
										  Next
									EndIf
							  EndIf
						Next
				  EndIf
			EndIf

			_Sleep(500)
			_CaptureRegion()
;			Setlog($TroopCountBeg&" = "&Number(getNormal(40 + (72 * $THtroop), 565)))
			If $TroopCountBeg<>Number(getNormal(40 + (72 * $THtroop), 565)) Then
				  SetLog("Deployment of "&$name&" Successful!")
				  _Sleep($Sleep)
			Else
				  SetLog("Deployment of "&$name&"NOT Successful!")
			EndIf


EndIf

EndFunc ;---AttackTHGrid

Func AttackTHNormal()
		 Setlog("Normal Attacking TH Outside with BAM PULSE!")

		 ;---1st wave 15 secs
;		 SetLog("Attacking TH with 1st wave of BAM")
		 AttackTHGrid($eBarb,5,1,5000,1,5,0) ; deploys 5 barbarians
		 AttackTHGrid($eArch,5,1,5000,1,4,0) ; deploys 5 archers
		 AttackTHGrid($eMini,5,1,5000,1,4,0) ; deploys 5 minions
		 ;---2nd wave 20 secs
; 		 SetLog("Attacking TH with 2nd wave of BAM")
		 AttackTHGrid($eBarb,5,1,5000,2,5,0) ; deploys 5 barbarians
		 AttackTHGrid($eArch,5,1,7500,2,4,0) ; deploys 5 archers
		 AttackTHGrid($eMini,5,1,7500,2,4,0) ; deploys 5 minions
		 ;---3nd wave 10 secs
; 		 SetLog("Attacking TH with 3rd wave of BAM COMBO")
		 AttackTHGrid($eBarb,5,1,10,3,5,0) ; deploys 5 barbarians
		 AttackTHGrid($eMini,5,1,10,3,4,0) ; deploys 5 minions
		 AttackTHGrid($eArch,5,1,1000,3,4,0) ; deploys 5 archers

		 _Sleep(200)
		 _CaptureRegion()
		  If _ColorCheck(_GetPixelColor(746,498), Hex(0x0E1306, 6), 20)=False Then Return ;exit if not 'no star'

		 Setlog("Normal Attacking TH Outside in FULL!")
;		 SetLog("Attacking TH with 4th wave of Giant BAM Troops.. Xtreme Deployment")
		 AttackTHGrid($eGiant,3,1,1000,1,2,0) ;releases 3 giants
		 AttackTHGrid($eWall,2,2,10,1,1,0) ; deploys 4 wallbreakers
		 AttackTHGrid($eArch,5,5,7000,4,4,0) ;releases 25 archers
		 AttackTHGrid($eBarb,5,5,7000,4,5,0) ;releases 25 barbs
		 AttackTHGrid($eMini,5,2,5000,4,4,1) ;releases 10 minions and Heroes

		 _Sleep(200)
 		 _CaptureRegion()
		  If _ColorCheck(_GetPixelColor(746,498), Hex(0x0E1306, 6), 20)=False Then Return ;exit if not 'no star'
;		 SetLog("Attacking TH with 5th wave.. CALLING THE SWAT TEAM!")
;		 SpellTHGrid($eRSpell)
 		 AttackTHGrid($eGiant,5,1,500,2,2,0) ;releases 5 giants
 		 AttackTHGrid($eHogs,5,1,100,2,4,0) ;releases 5 Hogs
		 AttackTHGrid($eArch,5,5,7000,4,4,0) ;releases 25 archers
		 AttackTHGrid($eBarb,5,5,7000,4,5,0) ;releases 25 barbs
		 AttackTHGrid($eMini,5,2,5000,4,4,0) ;releases 10 minions
		 AttackTHGrid($eWiza,3,2,10000,1,1,1) ;releases 6 wizards and releases hero

	SetLog("~Finished Attacking, waiting to finish", $COLOR_GREEN)

EndFunc ;---AttackTHNormal

Func AttackTHXtreme()
		 Setlog("Extreme Attacking TH Outside with BAM PULSE!")

		 ;---1st wave 15 secs
;		 SetLog("Attacking TH with 1st wave of BAM COMBO")
		 AttackTHGrid($eBarb,5,1,10,1,5,0) ; deploys 5 barbarians
		 AttackTHGrid($eArch,5,1,10,1,4,0) ; deploys 5 archers
		 AttackTHGrid($eMini,5,1,10000,1,4,0) ; deploys 5 minions
		 If _ColorCheck(_GetPixelColor(284, 28), Hex(0x41B1CD, 6), 20) Or _ColorCheck(_GetPixelColor(426,562), Hex(0x60AC10, 6), 20)  Then Return ;~~ If return button found or mainscreen Return

		 ;---2nd wave 20 secs
;		 SetLog("Attacking TH with 2nd wave of BAM COMBO")
		 AttackTHGrid($eBarb,5,1,10,2,5,0) ; deploys 5 barbarians
		 AttackTHGrid($eMini,5,1,10,2,4,0) ; deploys 5 minions
		 AttackTHGrid($eArch,5,1,10000,2,4,0) ; deploys 5 archers
		 If _ColorCheck(_GetPixelColor(284, 28), Hex(0x41B1CD, 6), 20) Or _ColorCheck(_GetPixelColor(426,562), Hex(0x60AC10, 6), 20)  Then Return ;~~ If return button found or mainscreen,proceed

		 ;---3nd wave 10 secs
;		 SetLog("Attacking TH with 3rd wave of BAM COMBO")
		 AttackTHGrid($eBarb,5,1,10,3,5,0) ; deploys 5 barbarians
		 AttackTHGrid($eMini,5,1,10,3,4,0) ; deploys 5 minions
		 AttackTHGrid($eArch,5,1,12000,3,4,0) ; deploys 5 archers
		 If _ColorCheck(_GetPixelColor(284, 28), Hex(0x41B1CD, 6), 20) Or _ColorCheck(_GetPixelColor(426,562), Hex(0x60AC10, 6), 20)  Then Return ;~~ If return button found or mainscreen,proceed

		 ;---
		 _Sleep(200)
		 _CaptureRegion()
		  If _ColorCheck(_GetPixelColor(746,498), Hex(0x0E1306, 6), 40)=False Then Return ;exit if not 'no star'

		 ;---4th wave
		 Setlog("Extreme Attacking TH Outside in FULL!")
;		 SetLog("Attacking TH with 4th wave of Giant BAM Troops.. Xtreme Deployment")
		 AttackTHGrid($eGiant,3,1,1000,1,4,0) ;releases 3 giants
		 AttackTHGrid($eWall,2,2,10,1,1,0) ; deploys 4 wallbreakers

;		 SpellTHGrid($eRSpell)
; 		 SpellTHGrid($eHSpell)

		 AttackTHGrid($eArch,5,5,200,4,4,0) ;releases 25 archers
		 AttackTHGrid($eBarb,5,5,200,4,5,0) ;releases 25 barbs
		 AttackTHGrid($eMini,5,2,200,4,4,0) ; deploys 5 minions
 		 AttackTHGrid($eGiant,5,1,100,2,4,0) ;releases 5 giants
 		 AttackTHGrid($eHogs,5,1,100,2,4,0) ;releases 5 Hogs
;		 AttackTHGrid($eGole,5,1,100,3,4,0) ;releases 5 Golems
;		 AttackTHGrid($ePekk,5,1,100,4,4,0) ;releases 5 Pekkas
 		 AttackTHGrid($eBarb,5,5,200,5,5,0) ;releases 25 barbs
		 AttackTHGrid($eWiza,3,2,10000,1,1,1) ;releases 6 wizards and releases hero


		 If _ColorCheck(_GetPixelColor(284, 28), Hex(0x41B1CD, 6), 20) Or _ColorCheck(_GetPixelColor(426,562), Hex(0x60AC10, 6), 20)  Then Return ;~~ If return button found or mainscreen,proceed
;---
		 _Sleep(200)
		 _CaptureRegion()
		  If _ColorCheck(_GetPixelColor(746,498), Hex(0x0E1306, 6), 40)=False Then Return ;exit if not 'no star'
;---
;		 SetLog("Attacking TH with 6th wave.. AiRStriiiKe!!!")
;		 AttackTHGrid($eDrag,3,1,500,1,1,0) ;releases 3 dragons
;		 AttackTHGrid($eBall,5,2,1000,1,1,0) ;releases 10 balloons
;		 AttackTHGrid($eMini,5,2,7000,1,1,1) ;releases 10 minions and releases hero
;		 If _ColorCheck(_GetPixelColor(284, 28), Hex(0x41B1CD, 6), 20) Or _ColorCheck(_GetPixelColor(426,562), Hex(0x60AC10, 6), 20)  Then Return ;~~ If return button found or mainscreen,proceed

	SetLog("~Finished Attacking, waiting to finish", $COLOR_GREEN)

EndFunc ;---AttackTHXtreme

Func ALLDropheroes($x,$y)
   		 dropHeroes($x,$y, $King, $Queen)
		 If _Sleep(1000) Then Return

		 dropCC($x,$y, $CC)

		If _Sleep(100) Then Return

		;Activate KQ's power
		If $checkKPower Or $checkQPower Then
			SetLog("Waiting " & $delayActivateKQ / 1000 & " seconds before activating King/Queen", $COLOR_ORANGE)
			_Sleep($delayActivateKQ)
			If $checkKPower Then
				SetLog("Activate King's power", $COLOR_BLUE)
				SelectDropTroop($King)
			EndIf
			If $checkQPower Then
				SetLog("Activate Queen's power", $COLOR_BLUE)
				SelectDropTroop($Queen)
			EndIf
		EndIf
EndFunc

Func SpellTHGrid($S)
			If $THi<=15 Or $THside=0 Or $THside=2 Then
		 		 Switch $THside
				 Case 0
					CastSpell($S, 114+$THi*19+ceiling(-2*19),359-$THi*14+ceiling(-2*14))
				 Case 1
					CastSpell($S,117+$THi*19+ceiling(-2*19),268+$THi*14-floor(-2*14))
				 Case 2
					CastSpell($S, 743-$THi*19-floor(-2*19),358-$THi*14+ceiling(-2*14))
				 Case 3
					CastSpell($S,742-$THi*19-floor(-2*19),268+$THi*14-floor(-2*14))
				 EndSwitch
			 EndIf

EndFunc ;---SpellTHGrid

Func CastSpell($THSpell,$x,$y)
   Local $Spell = -1
   Local $name = ""
   For $i = 0 To 8
	  If $atkTroops[$i][0] = $THSpell Then
		 $Spell = $i
		 $name = NameOfTroop($THSpell,0)
	  EndIf
   Next

   If ($Spell = -1) Then Return False
   If $Spell>-1 Then
		 SetLog("Dropping "&$name&" Spell!")
		 SelectDropTroop($Spell)
		 _Sleep(10)
		 Click($x,$y)
	Else
		SetLog("No "&$name&" Found")
	EndIf

EndFunc;---CastSpell


