; #FUNCTION# ====================================================================================================================
; Name ..........: PushBullet
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

; #FUNCTION# ====================================================================================================================
; Name ..........: PushImage
; Description ...: This function will report to your mobile phone a image sent as parameter
; Syntax ........: _PushImage ( Path to image,  Name of image, Mime-type , Body of message)
; Parameters ....: Path to image, Name of image (Physical name of file without path),  Mime-type of image and body of message to Send
; Return values .: None
; Author ........: Batrako (2015-04).  Based on function of MOD Pushloot with image by Boju
; Modified ......:
; Remarks .......: This file is part of ClashGameBot. Copyright 2015
;                  ClashGameBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........:
; Example .......: _PushImage("c:\images", "test.jpg", "image/jpeg", "sample image sended")
; ===============================================================================================================================

Func _PushImage($Path,$ImageName,$MimeType="image/jpeg", $Body="")
    $access_token = $PushToken
	; Upload Request
	$oHTTP = ObjCreate("WinHTTP.WinHTTPRequest.5.1")
	$oHTTP.Open("Post", "https://api.pushbullet.com/v2/upload-request", False)
	$oHTTP.SetCredentials($access_token, "", 0)
	$oHTTP.SetRequestHeader("Content-Type", "application/json")
	Local $pPush = '{"file_name": "' & $ImageName & '", "file_type": "' & $Mimetype & '"}'
	$oHTTP.Send($pPush)
	$Result = $oHTTP.ResponseText
	; Upload Image
	Local $upload_url = _StringBetween($Result, 'upload_url":"', '"')
	Local $awsaccesskeyid = _StringBetween($Result, 'awsaccesskeyid":"', '"')
	Local $acl = _StringBetween($Result, 'acl":"', '"')
	Local $key = _StringBetween($Result, 'key":"', '"')
	Local $signature = _StringBetween($Result, 'signature":"', '"')
	Local $policy = _StringBetween($Result, 'policy":"', '"')
	Local $file_url = _StringBetween($Result, 'file_url":"', '"')
	$result=run (@ScriptDir & "\bin\curl.exe -i -X POST " & $upload_url[0] & " -F awsaccesskeyid=" & $awsaccesskeyid[0] & " -F acl=" & $acl[0] & " -F key=" & $key[0] & " -F signature=" & $signature[0] & " -F policy=" & $policy[0] & " -F content-type=" & $MimeType & " -F file=@" & $Path & "\" & $ImageName,"",@SW_HIDE)
	; Push File
	$oHTTP.Open("Post", "https://api.pushbullet.com/v2/pushes", False)
	$oHTTP.SetCredentials($access_token, "", 0)
	$oHTTP.SetRequestHeader("Content-Type", "application/json")
	Local $pPush = '{"type": "file", "file_name": "' & $ImageName & '", "file_type": "' & $MimeType & '", "file_url": "' & $file_url[0] & '", "body": "' & $Body & '"}'
	$oHTTP.Send($pPush)
	$Result = $oHTTP.ResponseText
EndFunc   ;==>_PushImage


; _PushBullet()
;_Push("CGB Notifications", "Message")