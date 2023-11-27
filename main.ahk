/**
 * utsumi の AHK 設定
 * @history 2023.11.26 新規作成
 */
#Requires AutoHotkey v2.0
#Include  %A_ScriptDir%\Library\IMEv2.ahk

/**
 * ahk_groupの定義
 */
;アプリケーション切り替えウィンドウ
GroupAdd "AltTabWindow", "ahk_class XamlExplorerHostIslandWindow"   ; Windows11
GroupAdd "AltTabWindow", "ahk_class MultitaskingViewFrame"          ; Windows 10
GroupAdd "AltTabWindow", "ahk_class TaskSwitcherWnd"                ; Windows Vista, 7, 8.1
GroupAdd "AltTabWindow", "ahk_class #32771" ; オールド、またはクラシックなalt-tabを有効にした場合。

;[F1]ヘルプ起動抑制
GroupAdd "GroupF1Help", "ahk_class Progman" ;エクスプローラ
GroupAdd "GroupF1Help", "ahk_class CabinetWClass" ;デスクトップ
GroupAdd "GroupF1Help", "ahk_exe OUTLOOK.EXE" ;Outlook
GroupAdd "GroupF1Help", "ahk_exe WINWORD.EXE" ;Word
GroupAdd "GroupF1Help", "ahk_exe EXCEL.EXE" ;Excel
GroupAdd "GroupF1Help", "ahk_exe POWERPNT.EXE" ;PowerPoint
GroupAdd "GroupF1Help", "ahk_exe MSACCESS.EXE" ;Access
GroupAdd "GroupF1Help", "ahk_exe WINPROJ.EXE" ;Project
GroupAdd "GroupF1Help", "ahk_exe ONENOTE.EXE" ;OneNote
GroupAdd "GroupF1Help", "ahk_exe MSPUB.EXE" ;Publisher
GroupAdd "GroupF1Help", "ahk_exe INFOPATH.EXE" ;InfoPath
GroupAdd "GroupF1Help", "ahk_exe Chrome.exe" ;Google Chrome
GroupAdd "GroupF1Help", "ahk_exe iexplore.exe" ;Internet Explorer
GroupAdd "GroupF1Help", "ahk_exe msedge.exe" ;MicroSoft Edge
GroupAdd "GroupF1Help", "ahk_exe vivaldi.exe" ;Vivaldi

/**
 * CONSTANTS
 */
LONG_PRESS_SEC := 0.3             ; 長押し判定のための閾値時間

/**
 * USキーボード用の設定
 */
; 右AltでIMEオン、左AltでIMEオフ
*~RAlt:: {
  Send "{Blind}{vk07}"
}
*~LAlt:: {
  Send "{Blind}{vk07}"
}
RAlt up::
{
  If (A_PriorHotkey == "*~RAlt") {
    IME_SET(1)
  }
}
LAlt up::
{
  If (A_PriorHotkey == "*~LAlt") {
    IME_SET(0)
  }
}

/**
 * capsキー有効活用
 * @note ChangeKeyなどでcapsキーをF13割り当てしておく
 */
; Shift + Caps で CapsLock の オン／オフ切り替え
+F13::
{
  SetCapsLockState !GetKeyState("CapsLock", "T")
}
; Capsキーを ctrlにリマップ
F13::control



/**
 * チルトホイール & 戻る進むボタン付きマウス用の設定
 * 
 * チルトホイールでアプリケーション切り替え
 * 戻る進ボタンで仮想デスクトップ切り替え
 */
MButton::
{
  Send "^!{Tab}"
}

; 戻るボタン
;   短押し  | 左の仮想デスクトップへ移動
;   長押し  | 現在の仮想デスクトップを削除
XButton1::
{
  long_pressed := !KeyWait("XButton1", "T" . LONG_PRESS_SEC)
  If (long_pressed) {
    Send "#^{F4}"
    return
  }
  Send "#^{Left}"
}

; 進むボタン
;   短押し  | 右の仮想デスクトップへ移動
;   長押し  | 仮想デスクトップを追加
XButton2::
{
  long_pressed := !KeyWait("XButton2", "T" . LONG_PRESS_SEC)
  If (long_pressed) {
    Send "#^d"
    return
  }
  Send "#^{Right}"
}

#HotIf WinExist("ahk_group AltTabWindow")
MButton::
{
  Send "{Enter}"
}
WheelLeft::
{
  Send "{Left}"
}
WheelRight::
{
  Send "{Right}"
}
#HotIf

/**
 * その他 独自のショートカット
 */
; Win + n で メモ帳起動
#n::
{
    If WinExist("ahk_class Notepad")
        WinActivate  ; Activate the window found above
    Else
        Run "notepad"  ; Open a new Notepad window
}