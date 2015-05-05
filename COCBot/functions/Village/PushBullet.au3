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
EndFunc   ;==>_PushBullet

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
 EndFunc   ;==>_Push

  Func _PushFile($File, $Folder, $FileType, $title, $body)
    $oHTTP = ObjCreate("WinHTTP.WinHTTPRequest.5.1")
    $access_token = $PushToken
    $oHTTP.Open("Post", "https://api.pushbullet.com/v2/upload-request", False)
    $oHTTP.SetCredentials($access_token, "", 0)
    $oHTTP.SetRequestHeader("Content-Type", "application/json")

    Local $pPush = '{"file_name": "' & $File & '", "file_type": "' & $FileType &'"}'
    $oHTTP.Send($pPush)
	$Result = $oHTTP.ResponseText
	$Result1 = $Result
	Local $upload_url = _StringBetween($Result, 'upload_url":"', '"')
	Local $awsaccesskeyid = _StringBetween($Result, 'awsaccesskeyid":"', '"')
	Local $acl = _StringBetween($Result, 'acl":"', '"')
	Local $key = _StringBetween($Result, 'key":"', '"')
	Local $signature = _StringBetween($Result, 'signature":"', '"')
	Local $policy = _StringBetween($Result, 'policy":"', '"')
	Local $file_url = _StringBetween($Result, 'file_url":"', '"')

    $result=runwait(@ScriptDir & "\curl\curl.exe -i -X POST " & $upload_url[0] & ' -F awsaccesskeyid="' & $awsaccesskeyid[0] & '" -F acl="' & $acl[0] & '" -F key="' & $key[0] & '" -F signature="' & $signature[0] & '" -F policy="' & $policy[0] & '" -F content-type="' & $FileType & '" -F file=@"' & @ScriptDir & '\' & $Folder & '\' & $File & '" -o "' & @ScriptDir & '\logs\curl.log"',"",@SW_HIDE)
	   Local $hFileOpen = FileOpen(@ScriptDir & '\logs\curl.log')
	   Local $sFileRead = FileReadLine($hFileOpen, 8)
	   Local $sFileRead1 = StringSplit($sFileRead," ")
	   Local $sLink = $sFileRead1[2]
	   $oHTTP.Open("Post", "https://api.pushbullet.com/v2/pushes", False)
	   $oHTTP.SetCredentials($access_token, "", 0)
	   $oHTTP.SetRequestHeader("Content-Type", "application/json")
	   Local $pPush = '{"type": "file", "file_name": "' & $FileName & '", "file_type": "' & $FileType & '", "file_url": "' & $sLink & '", "title": "' & $title & '", "body": "' & $body & '"}'
	   $oHTTP.Send($pPush)
	   $Result = $oHTTP.ResponseText

	   SetLog($Result)
	   SetLog($upload_url[0])
	   SetLog($acl[0])
	   SetLog($key[0])
	   SetLog($signature[0])
	   SetLog($policy[0])
	   SetLog($awsaccesskeyid[0])
	   SetLog($file_url[0])
	   SetLog($Result1)
	   SetLog(@ScriptDir & "\curl\curl.exe -i -X POST " & $upload_url[0] & ' -F awsaccesskeyid="' & $awsaccesskeyid[0] & '" -F acl="' & $acl[0] & '" -F key="' & $key[0] & '" -F signature="' & $signature[0] & '" -F policy="' & $policy[0] & '" -F content-type="' & $FileType & '" -F file=@"' & @ScriptDir & '\' & $Folder & '\' & $File & '" -o "' & @ScriptDir & '\logs\curl.log"')

EndFunc   ;==>_Push

; _PushBullet()
;_Push("CGB Notifications", "Message")