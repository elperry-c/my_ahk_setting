/**
 * プログラムグループ
 */
;テキストエディタ
GroupAdd, GroupTextEditor, ahk_exe notepad.exe ;メモ帳
GroupAdd, GroupTextEditor, ahk_exe Code.exe ;Visual Studio Code

;ブラウザ
GroupAdd, GroupBrowser, ahk_exe Chrome.exe ;Google Chrome
GroupAdd, GroupBrowser, ahk_exe iexplore.exe ;Internet Explorer
GroupAdd, GroupBrowser, ahk_exe msedge.exe ;MicroSoft Edge
GroupAdd, GroupBrowser, ahk_exe vivaldi.exe ;Vivaldi

;[F1]ヘルプ起動抑制
GroupAdd, GroupF1Help, ahk_class Progman ;エクスプローラ
GroupAdd, GroupF1Help, ahk_class CabinetWClass ;デスクトップ
GroupAdd, GroupF1Help, ahk_exe OUTLOOK.EXE ;Outlook
GroupAdd, GroupF1Help, ahk_exe WINWORD.EXE ;Word
GroupAdd, GroupF1Help, ahk_exe EXCEL.EXE ;Excel
GroupAdd, GroupF1Help, ahk_exe POWERPNT.EXE ;PowerPoint
GroupAdd, GroupF1Help, ahk_exe MSACCESS.EXE ;Access
GroupAdd, GroupF1Help, ahk_exe WINPROJ.EXE ;Project
GroupAdd, GroupF1Help, ahk_exe ONENOTE.EXE ;OneNote
GroupAdd, GroupF1Help, ahk_exe INFOPATH.EXE ;InfoPath
GroupAdd, GroupF1Help, ahk_exe Chrome.exe ;Google Chrome
GroupAdd, GroupF1Help, ahk_exe iexplore.exe ;Internet Explorer
GroupAdd, GroupF1Help, ahk_exe msedge.exe ;MicroSoft Edge

;[START] F1ヘルプ起動抑制
#IfWinActive, ahk_group GroupF1Help

/**
 * ヘルプを表示
 *
 * @hotkey [F1]長押し
 * @target F1ヘルプ起動抑制(エクスプローラ/デスクトップ/Microsoft Office)
 */
F1::
    ;[F1]キーの押し下げ状態を300ミリ秒待機
    KeyWait, F1, T0.3
    If (ErrorLevel)
    {
        ;指定時間が経過した場合、キーをそのまま送信
        Send, {F1}
    }
    Else
    {
        ;指定時間経過前にキーが離された場合、バルーンメッセージを表示
        FileEncoding, UTF-8
        TrayTip, ヘルプの表示, ヘルプを表示するには[F1]キーを長押ししてください。, 10, 17
    }
    KeyWait, F1
Return

#IfWinActive
;[END] F1ヘルプ起動抑制