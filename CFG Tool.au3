#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=..\..\..\Icon.ico
#AutoIt3Wrapper_Compression=4
#AutoIt3Wrapper_UseUpx=y
#AutoIt3Wrapper_Res_Description=PUBG Config Converter
#AutoIt3Wrapper_Res_CompanyName=CoderDuc
#AutoIt3Wrapper_Res_LegalCopyright=Copyright by CoderDuc
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#include "Functions.au3"
#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>

#Region ### START Koda GUI section ### Form=c:\users\gamin\desktop\form1.kxf
$Form1_1 = GUICreate("CFG Tools", 239, 123, 192, 124)
$btnDecode = GUICtrlCreateButton("Decode", 24, 32, 83, 41)
GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
$btnEncode = GUICtrlCreateButton("Encode", 128, 32, 83, 41)
GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
$Group1 = GUICtrlCreateGroup("Options", 8, 8, 217, 81)
GUICtrlSetFont(-1, 10, 800, 0, "MS Sans Serif")
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Label1 = GUICtrlCreateLabel("@Copyright by CoderDuc", 40, 96, 157, 20)
GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0xFF0000)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		Case $btnDecode
			$cfgPath = FileOpenDialog("Open",@ScriptDir,"(*.ini)")
			If @error Then
				MsgBox(16,"Thông báo","Lỗi đọc file !!!")
			Else
				$data = FileReadToArray($cfgPath)
				For $i = 0 to UBound($data) - 1 Step 1
					If StringInStr($data[$i],"[UserCustom DeviceProfile]",1) Or StringInStr($data[$i],"[BackUp DeviceProfile]",1) Then
						$data[$i] = $data[$i]
					Else
						$data[$i] = "+CVars=" & StringDecode(StringTrimLeft($data[$i],7))
					EndIf
					FileWrite(FileOpen(@ScriptDir & "\Decoded.ini",1),($data[$i] = "+CVars=") ? "" : ($data[$i] & @CRLF))
				Next
				MsgBox(64,"Thông báo","Decoded !!!")
			EndIf
		Case $btnEncode
			$cfgPath = FileOpenDialog("Open",@ScriptDir,"(*.ini)")
			If @error Then
				MsgBox(16,"Thông báo","Lỗi đọc file !!!")
			Else
				$data = FileReadToArray($cfgPath)
				For $i = 0 to UBound($data) - 1 Step 1
					If StringInStr($data[$i],"[UserCustom DeviceProfile]",1) Or StringInStr($data[$i],"[BackUp DeviceProfile]",1) Then
						$data[$i] = $data[$i]
					Else
						$data[$i] = "+CVars=" & StringEncode(StringTrimLeft($data[$i],7))
					EndIf
					FileWrite(FileOpen(@ScriptDir & "\Encoded.ini",1),($data[$i] = "+CVars=") ? "" : ($data[$i] & @CRLF))
				Next
				MsgBox(64,"Thông báo","Encoded !!!")
			EndIf
	EndSwitch
WEnd
