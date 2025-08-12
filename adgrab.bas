' *** AD-GRAB ***
' 1: Right-click on an add on Youtube.
' 2: Copy-paste "debug info"
' 3: After the beep your URL is copied to the clipboard.
' 4: Paste the URL in your browser.

_Title "Ad grabber"
Screen _NewImage(1, 1, 8)
idc$ = "addocid" + Chr$(34) + ": " + Chr$(34)
p = 1
While p <= Len(_Clipboard$)
    ls = InStr(p, _Clipboard$, Chr$(13))
    le = InStr(p, _Clipboard$, Chr$(13))
    If le = 0 Then
        le = Len(_Clipboard$) + 1
    End If
    line$ = Mid$(_Clipboard$, ls, le - ls)
    If InStr(UCase$(line$), UCase$(idc$)) > 0 Then
        sp = ls + InStr(UCase$(line$), UCase$(idc$)) + Len(idc$)
        natxt$ = Mid$(_Clipboard$, sp, 11)
        _Clipboard$ = "https://www.youtube.com/watch?v=" + natxt$
        GoTo done
        Exit While
    End If
    p = le + 1
Wend
done:
If natxt$ = "" Then Sound 44, 2: _Delay 1: System
Sound 1000, 1
_Delay 2
System

