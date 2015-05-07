; #FUNCTION# ====================================================================================================================
; Name ..........: PushBulle
; Description ...: This function will report to your mobile phone your values and last attack
; Syntax ........:
; Parameters ....: None
; Return values .: None
; Author ........: Antidote (2015-03)
; Modified ......:
; Remarks .......: This file is part of ClashGameBot. Copyright 2015
;                  ClashGameBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........:
; Example .......: No
; ===============================================================================================================================


#include <Array.au3>
#include <String.au3>

Func _PushBullet($pTitle = "", $pMessage = "")
    $oHTTP = ObjCreate("WinHTTP.WinHTTPRequest.5.1")
    $access_token = $PushToken
    ;$device_iden = ""

    $oHTTP.Open("Get", "https://api.pushbullet.com/v2/devices", False)
    $oHTTP.SetCredentials($access_token, "", 0)
    $oHTTP.Send()
    $Result = $oHTTP.ResponseText
    Local $device_iden = _StringBetween($Result, 'iden":"', '"')
    Local $device_name = _StringBetween($Result, 'nickname":"', '"')
    Local $device = ""
    Local $pDevice = 1
    $oHTTP.Open("Post", "https://api.pushbullet.com/v2/pushes", False)
    $oHTTP.SetCredentials($access_token, "", 0)
    $oHTTP.SetRequestHeader("Content-Type", "application/json")
    Local $pPush = '{"type": "note", "title": "' & $pTitle & '", "body": "' & $pMessage & '"}'
    $oHTTP.Send($pPush)
EndFunc   ;==>PushBullet

Func _Push($pTitle, $pMessage)
    $oHTTP = ObjCreate("WinHTTP.WinHTTPRequest.5.1")
    $access_token = $PushToken
    ;$device_iden = ""

    $oHTTP.Open("Post", "https://api.pushbullet.com/v2/pushes", False)
    $oHTTP.SetCredentials($access_token, "", 0)
    $oHTTP.SetRequestHeader("Content-Type", "application/json")
    Local $pPush = '{"type": "note", "title": "' & $pTitle & '", "body": "' & $pMessage & '"}'
    ;Local $pPush = '{"type": "note", "title": "' & $pTitle & '", "body": "' & $pMessage & '","device_iden": "' & $device_iden[$pDevice - 1] & '"}'
    $oHTTP.Send($pPush)
EndFunc   ;==>Push

Func ReportPushBullet()

	If $iAlertPBVillage = 1 Then
		_PushBullet("My Village:", " [G]: " &  _NumberFormat($GoldCount) & " [E]: " &  _NumberFormat($ElixirCount) & " [D]: " &  _NumberFormat($DarkCount) & "  [T]: " &  _NumberFormat($TrophyCount) & " [FB]: " &  _NumberFormat($FreeBuilder))
	EndIf

	If $iLastAttack = 1 Then
		If $GoldLast = "" And $ElixirLast = "" Then
			_PushBullet("First time run", "remember: Last gain is : Attack Loot & Bonus - Cost of troops & Cost of searchs ")
		Else
			_PushBullet("Last Gain :", " [G]: " &  _NumberFormat($GoldLast) & " [E]: " &  _NumberFormat($ElixirLast) & " [D]: " &  _NumberFormat($DarkLast) & "  [T]: " & _NumberFormat($TrophyLast))
		EndIf
	EndIf

EndFunc   ;==>ReportPushBullet


Func _DeletePush()
	$oHTTP = ObjCreate("WinHTTP.WinHTTPRequest.5.1")
	$access_token = $PushToken
	$oHTTP.Open("Delete", "https://api.pushbullet.com/v2/pushes", False)
	$oHTTP.SetCredentials($access_token, "", 0)
	$oHTTP.SetRequestHeader("Content-Type", "application/json")
	$oHTTP.Send()
EndFunc   ;==>DeletePush
