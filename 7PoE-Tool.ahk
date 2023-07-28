#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
;#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
SetControlDelay, 50ms
CoordMode, Mouse, Screen
CoordMode, Pixel, Screen
SetMouseDelay, 100ms
#SingleInstance Force
#InstallMouseHook
SetBatchLines, -1

plik = ustawienia.ini

language := "pl"

defRestart = F11
defExit = F12
defSloty = 2
defResolution = 2560 ;;1440
			;;  2480?

StartX = 1725
StartY := 615
KoniecX := 2500

WisdomLocX := 2500
WisdomLocY := 1100

PortalLocX := 2500
PortalLocY := 1025

CharacterC := 0xBAE2EE
StashC := 0xABE8F1
SearchC := 0x627580
TradeC := 0x71BDE2
HeistC := 0x5B91AD
NPCC := 0x679DBB

CharacterX := 1590
CharacterY := 28
StashX := 336
StashY := 31
SearchX := 460
SearchY := 895
TradeX := 634
TradeY := 89
HeistX := 610
HeistY := 64
NPCX := 615
NPCY := 88


oLang := ArrayIt(language,"lang.ini")
oSearch := ArrayIt("search","search.ini")

Diff := (KoniecX-StartX)/11

ifExist, %plik%
{
    IniRead, defSloty, %plik%, Ogolne, Sloty
    IniRead, defRestart, %plik%, Ogolne, Restart
    
	IniRead, StartX, %plik%, Koordynaty, StartX
	IniRead, StartY, %plik%, Koordynaty, StartY
	IniRead, KoniecX, %plik%, Koordynaty, KoniecX

	IniRead, CharacterX, %plik%, Pixele, CharacterX
	IniRead, CharacterY, %plik%, Pixele, CharacterY
	IniRead, CharacterC, %plik%, Pixele, CharacterColor
	
	IniRead, StashX, %plik%, Pixele, StashX
	IniRead, StashY, %plik%, Pixele, StashY
	IniRead, StashC, %plik%, Pixele, StashColor
	
	IniRead, SearchX, %plik%, Pixele, SearchX
	IniRead, SearchY, %plik%, Pixele, SearchY
	IniRead, SearchC, %plik%, Pixele, SearchColor
	
	IniRead, TradeX, %plik%, Pixele, TradeX
	IniRead, TradeY, %plik%, Pixele, TradeY
	IniRead, TradeC, %plik%, Pixele, TradeColor
	
	IniRead, HeistX, %plik%, Pixele, HeistX
	IniRead, HeistY, %plik%, Pixele, HeistY
	IniRead, HeistC, %plik%, Pixele, HeistColor
	
	IniRead, NPCX, %plik%, Pixele, NPCX
	IniRead, NPCY, %plik%, Pixele, NPCY
	IniRead, NPCC, %plik%, Pixele, NPCColor
	
	Diff := (KoniecX-StartX)/11
}

GroupAdd, POEGame, ahk_exe PathOfExile.exe
GroupAdd, POEGame, ahk_exe PathOfExile_x64.exe
GroupAdd, POEGame, ahk_exe PathOfExileSteam.exe
GroupAdd, POEGame, ahk_exe PathOfExile_x64Steam.exe

Gui, ToStash: +E0x20 -Caption +AlwaysOnTop +LastFound +ToolWindow
Gui, FromStash: +E0x20 -Caption +AlwaysOnTop +LastFound +ToolWindow
Gui, ToTrade: +E0x20 -Caption +AlwaysOnTop +LastFound +ToolWindow
Gui, Identify: +E0x20 -Caption +AlwaysOnTop +LastFound +ToolWindow
Gui, FromStashButtons: +E0x20 -Caption +AlwaysOnTop +LastFound +ToolWindow
Gui, ToStash: Add, Picture, x0 y0 +BackgroundTrans vToStash gButtonToStash, ToStash.png
Gui, FromStash: Add, Picture, x0 y0 +BackgroundTrans vFromStash gButtonFromStash, FromStash.png
Gui, ToTrade: Add, Picture, x0 y0 +BackgroundTrans vToTrade gButtonToTrade, ToTrade.png
Gui, Identify: Add, Picture, x0 y0 +BackgroundTrans vIdentify gButtonIdentify, Identify.png

Gui, ToHeist: +E0x20 -Caption +AlwaysOnTop +LastFound +ToolWindow
Gui, ToHeist: Add, Picture, x0 y0 +BackgroundTrans vToHeist gButtonToHeist, ToTrade.png
Gui, ToNPC: +E0x20 -Caption +AlwaysOnTop +LastFound +ToolWindow
Gui, ToNPC: Add, Picture, x0 y0 +BackgroundTrans vToNPC gButtonToNPC, ToTrade.png

;;Gui, ToTest: +E0x20 -Caption +AlwaysOnTop +LastFound +ToolWindow
;;Gui, ToTest: Add, Picture, x0 y0 +BackgroundTrans vToTest gButtonToTest, ToTrade.png


Gui, FromStashButtons: Color, 805030
Gui, FromStashButtons: Add, Picture, x0 y0 +BackgroundTrans vMetamorph gFromStashButtons, img/metamorph.png
Gui, FromStashButtons: Add, Picture, x21 y0 +BackgroundTrans vMap gFromStashButtons, img/map.png
Gui, FromStashButtons: Add, Picture, x42 y0 +BackgroundTrans vEssence gFromStashButtons, img/essence.png
Gui, FromStashButtons: Add, Picture, x63 y0 +BackgroundTrans vCard gFromStashButtons, img/card.png
Gui, FromStashButtons: Add, Picture, x84 y0 +BackgroundTrans vFragment gFromStashButtons, img/fragment.png
Gui, FromStashButtons: Add, Picture, x105 y0 +BackgroundTrans vIncubator gFromStashButtons, img/incubator.png
Gui, FromStashButtons: Add, Picture, x126 y0 +BackgroundTrans vGem gFromStashButtons, img/gem.png
Gui, FromStashButtons: Add, Picture, x147 y0 +BackgroundTrans vCurrency gFromStashButtons, img/currency.png
Gui, FromStashButtons: Add, Picture, x168 y0 +BackgroundTrans vRare gFromStashButtons, img/rare.png
Gui, FromStashButtons: Add, Picture, x189 y0 +BackgroundTrans vUniq gFromStashButtons, img/uniq.png
Gui, FromStashButtons: Add, Picture, x210 y0 +BackgroundTrans vHeist gFromStashButtons, img/fragment4.png


;;Logo = %A_ScriptDir%\logo.png
Gui, Settings: +E0x20 -Caption +AlwaysOnTop +LastFound +ToolWindow
Gui, Settings: Color, A0A0A0

;;Gui, Settings: Add, Picture, x0 y0 gUImove, %Logo%
Gui, Settings: font, s30 c2690ad, Microsoft Sans Serif
Gui, Settings: Add, Text, x0 y0 w180 h40 gUImove, 7PoETool

Gui, Settings: font, s10 cF0F0F0, Verdana
Gui, Settings: Add, GroupBox, x10 y55 w165 h160, % oLang["txt_settings"]
Gui, Settings: font
Gui, Settings: Add, text, x20 y80, % oLang["settings_slots1"]
Gui, Settings: Add, text, x20 y92, % oLang["settings_slots2"]


Gui, Settings: Add, Edit, x60 y120 w65 h20 Number
Gui, Settings: Add, UpDown, vSlots x82 y148 Range0-60,%defSloty%

Gui, Settings: Add, text, x20 y154 , % oLang["settings_restart"]
Gui, Settings: Add, Hotkey, vRestart w128 x26 y175, %defRestart%

Gui, Settings: Add, Button, x22 y224 w140 h22 default gZapiszUstawienia, % oLang["settings_save"]


IfNotExist, %plik%
{
    Gui, Settings: Show
    gui_hwnd := WinExist()
    WinWait, AHK_ID %gui_hwnd%
    WinWaitClose, AHK_ID %gui_hwnd%
}

GuiHideAll()
{
	Gui, ToStash: Hide
	Gui, FromStash: Hide
	Gui, FromStashButtons: Hide
	Gui, ToTrade: Hide
	Gui, ToHeist: Hide
	Gui, ToNPC: Hide
}

Sleep, 15

Menu, Tray, NoStandard
Menu, Tray, Icon, icon.ico
Menu, Tray, Add, % oLang["txt_settings"], Settings
Menu, Tray, Default, % oLang["txt_settings"]
Menu, Tray, Add
Menu, Tray, Add, % oLang["txt_restart"] . " (" . defRestart . ")", BRestart
Menu, Tray, Add, % oLang["txt_exit"] . " (" . "F12" . ")", BExit
Menu, Tray, Click, 1
Menu, Tray, Tip, % oLang["txt_tooltip"]

Hotkey,%defRestart%,BRestart

MaxC = % Ceil((60 - defSloty)/5)  ;;12
MaxR = % Mod(60 - defSloty, 5) ;; 3

if ( MaxR == 0) 
    MaxC := MaxC + 1
    
;;336,31
;;0x9BDAEE
;;Stash

;;1590,28
;;0xBFE4EF
;;Character

;;460,895
;;0x627580
;;Search Unchecked

;;634,89
;;0x72BCE2
;;Trade Window

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;; TODO:  
;; = 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Fragment := 0
Free := 1
GuiControl,, Fragment, % "img/fragment" . Mod(Fragment,5) + 1 . ".png"

Loop {
    PixelGetColor, Character, %CharacterX%, %CharacterY%
	PixelGetColor, Stash, %StashX%, %StashY%
    PixelGetColor, Search, %SearchX%, %SearchY%
    PixelGetColor, Trade, %TradeX%, %TradeY%
	PixelGetColor, Heist, %HeistX%, %HeistY%
	PixelGetColor, NPC, %NPCX%, %NPCY%
    
	;;MsgBox, %Character% & %CharacterC%
	
	If (Character == CharacterC && Free == 1 && WinActive("ahk_group POEGame"))
	{
	
		Gui, Identify: Show, w45 h45 x2480 y1160 NoActivate
	
		If (Stash == StashC)
		{
			If (Search != SearchC)
				Gui, FromStash: Show, w123 h35 x600 y1110 NoActivate
			else
				Gui, FromStash: Hide

			Gui, ToTrade: Hide
			Gui, ToHeist: Hide
			Gui, ToNPC: Hide
			Gui, ToStash: Show, w123 h35 x750 y1110 NoActivate
			Gui, FromStashButtons: Show, w230 h20 x620 y1225 NoActivate
		}
		Else If (Trade == TradeC)
		{		
			Gui, ToStash: Hide
			Gui, FromStash: Hide
			Gui, FromStashButtons: Hide
			Gui, ToHeist: Hide
			Gui, ToNPC: Hide
			Gui, ToTrade: Show, w123 h35 x555 y818 NoActivate
		}
		Else If (Heist == HeistC)
		{
			Gui, ToStash: Hide
			Gui, FromStash: Hide
			Gui, FromStashButtons: Hide
			Gui, ToTrade: Hide
			Gui, ToNPC: Hide
			Gui, ToHeist: Show, w123 h35 x555 y868 NoActivate
		}
	
		Else If (NPC == NPCC)
		{
			Gui, ToStash: Hide
			Gui, FromStash: Hide
			Gui, FromStashButtons: Hide
			Gui, ToTrade: Hide
			Gui, ToHeist: Hide
			Gui, ToNPC: Show, w123 h35 x800 y1075 NoActivate
		}
		Else
		{
			Gui, ToStash: Hide
			Gui, FromStash: Hide
			Gui, FromStashButtons: Hide
			Gui, ToTrade: Hide
			Gui, ToHeist: Hide
			Gui, ToNPC: Hide
		}
	}
	else
	{
		Gui, Identify: Hide
		Gui, ToHeist: Hide
		Gui, ToNPC: Hide
        Gui, ToStash: Hide
        Gui, FromStash: Hide
        Gui, ToTrade: Hide
		Gui, FromStashButtons: Hide
	}

    Sleep, 50
}

FromStashButtons:
If(A_GuiControl == "Fragment")
{
	Search(osearch["Fragment" . Mod(Fragment,5) + 1])
	Fragment := Fragment + 1
	GuiControl,, Fragment, % "img/fragment" . Mod(Fragment,5) + 1 . ".png"
} 
else
	Search(oSearch[A_GuiControl])
Return


Search(phrase){
	BlockInput On
	GroupActivate, POEGame
    WinWaitActive, ahk_group POEGame, ,5
	Sleep, 5
	Send, ^{f}
	Send % phrase
	Send, {Enter}
	BlockInput Off
}

ArrayIt(lang,file) {

	IniRead, out, %file%, %lang%

    if !(out) 
        return 

    lines := strsplit(out, "`n", "`r")
    oArray := {}
    for each, line in lines 
    {
      if !(Line)
        continue 
		
      oKV := StrSplit(line, "=",, 2)
      oArray[oKV.1] := oKV.2
    }

    return oArray
}

ButtonToStash:
ButtonToHeist:
ButtonToNPC:
    GroupActivate, POEGame
    WinWaitActive, ahk_group POEGame, ,5
	MouseGetPos, TempX, TempY
    Free := 0
    Row := 1
    Column := 1
    BlockInput, MouseMove
    Sleep, 5
    Puste := 0
    MouseMove, StartX, StartY
    Sleep, 15
    Send {Control Down}
    Sleep, 15
    While (Column != MaxC or Row <= MaxR) {
        Clipboard = Uzywam najlepszego PoE Tool'a se7en'a
        MouseMove, (StartX + (Column-1)*Diff), (StartY + (Row-1)*Diff)
        Sleep, 15
        Send {C}{Click Down} ;; clip=itemek
        RandSleep(10,15)
        Send {Click Up}
        Row := Row + 1
        if (Row == 6){
            Column := Column + 1
            Row := 1
        }
        Sleep, 35 ;;;;;;;szybkosc skryptu 35 default
        If (Clipboard == "Uzywam najlepszego PoE Tool'a se7en'a")
            Puste := Puste + 1
        Else
            Puste = 0
        If (Puste > 9)
            break
    }
    Send {Control Up}
    Free := 1
	MouseMove, TempX, TempY
    BlockInput, MouseMoveOff
Return



ButtonFromStash:
    GroupActivate, POEGame
    WinWaitActive, ahk_group POEGame, ,5
	MouseGetPos, TempX, TempY
    LastPx = 0
    LastPy = 0
    Sleep, 5
    PixelSearch, Px, Py, 15, 175, 870, 1025, 0xE7B477, 3, Fast RGB
    Sleep, 5
    If (!ErrorLevel)
    {
        BlockInput, MouseMove
        Free := 0
        Gui, FromStash: Hide
        Send {Ctrl Down}
    }
    While((!ErrorLevel) and ((LastPx != Px) or (LastPy != Py)))
    {
        LastPx := Px
        LastPy := Py
        MouseMove, Px+5, Py+5
        Sleep, 50
        ;;MouseClick, Left, Px+5, Py+5
        Send {Click}
        Sleep, 150
        PixelSearch, Px, Py, 15, 175, 870, 1025, 0xE7B477, 3, Fast RGB
        Sleep, 50
        ;;ToolTip, %Px%/%Py%`r`n%LastPx%/%LastPy%
        
    }
    Send {Ctrl Up}
    Free := 1
	MouseMove, TempX, TempY
    BlockInput, MouseMoveOff
Return


ButtonToTrade:
    GroupActivate, POEGame
    WinWaitActive, ahk_group POEGame, ,5
	MouseGetPos, TempX, TempY
    Free := 0
    Row := 1
    Column := 1
    BlockInput, MouseMove
    Sleep, 5
    MouseMove, StartX, StartY
    Sleep, 15
    Clipboard := ""
    Test = Uzywam najlepszego PoE Tool'a se7en'a
    Sleep, 5
    Send {Control Down}{C}
    Sleep, 15
    While (Clipboard != Test) {
        Clipboard = %Test%
        Sleep, 15
        MouseMove, (StartX + (Column-1)*Diff), (StartY + (Row-1)*Diff)
        Sleep, 15
        Send {C}{Click Down}
        Sleep, 10
        Send {Click Up}
        Row := Row + 1
        if (Row == 6){
            Column := Column + 1
            Row := 1
        }
        Sleep, 35
    }
    Send {Control Up}
    Free := 1
	MouseMove, TempX, TempY
    BlockInput, MouseMoveOff
Return


;;;;;;;;;;;;;;;;;;;;; UNIDENTIFIED SAFE

ButtonIdentify:
	
    GroupActivate, POEGame
    WinWaitActive, ahk_group POEGame, ,5
    Free := 0
    Row := 1
    Column := 1
    BlockInput, MouseMove
    Sleep, 50
    Puste := 0
    MouseMove, WisdomLocX, WisdomLocY
    Sleep, 50
    MouseClick, Right
    Sleep, 50
    Send {Shift Down}
    Sleep, 25
    MouseMove, StartX, StartY
    Sleep, 15
    Send {Control Down}
    Sleep, 15
    While (Column != MaxC or Row <= MaxR) {
        Clipboard = Uzywam najlepszego PoE Tool'a se7en'a
        MouseMove, (StartX + (Column-1)*Diff), (StartY + (Row-1)*Diff)
        Sleep, 25
        Send {Control Down}{C}{Control Up} ;; clip = itemek
        Sleep, 35
        IfInString, Clipboard, Unidentified
        {
            Send {Click Down}
            Sleep, 25
            Send {Click Up}
            Sleep, 25
        }
        Row := Row + 1
        if (Row == 6){
            Column := Column + 1
            Row := 1
        }
        Sleep, 50
        If (Clipboard == "Uzywam najlepszego PoE Tool'a se7en'a")
            Puste := Puste + 1
        Else
            Puste = 0
        If (Puste > 9)
            break
    }
    Send {Shift Up}
    Free := 1
    BlockInput, MouseMoveOff
Return

RandSleep(x,y) {
	Random, rand, %x%, %y%
	Sleep %rand%
}


^MButton::
	Gui, TakeX: -Caption
	Gui, TakeX: Add, edit, vTakeXAmount
	Gui, TakeX: Add, button, default hidden gTakeXOK
	
	TempClip := Clipboard
	Clipboard := "Temp"
	MouseGetPos, TempX, TempY
	Sleep, 5
	Send, {Control Down}{C}{Control Up}
	Sleep, 10
	Gui, TakeX: Show,, TakeX
Return


TakeXGuiEscape:
Gui, TakeX: Destroy
return

TakeXGuiClose:
Gui, TakeX: Destroy
return

TakeXOK:
Gui, TakeX: Submit
Gui, TakeX: Destroy
Sleep, 15

	;;needle = (?i)Stack Size: \K(?<left>\d+)\/(?<right>\d+)
	;;needle = (?i)Stack Size: \K(?<left>\d+( )?(\d+)?)\/(?<right>\d+)
	needle = (?i)Stack Size: \K(?<left>\d+( )?(\d+)?)\/(?<right>\d+( )?(\d+)?)
	RegExMatch(Clipboard, needle, currency)

	Max := StrReplace(currencyleft, Chr(160)) ;;currencyleft
	StackSize := StrReplace(currencyright, Chr(160)) ;;currencyright
	
	Sleep, 20
	If(TakeXAmount > Max || Clipboard == "Temp" || !TakeXAmount)
	{
		ToolTip, Not Found
		SetTimer, ToolTipOff, -2000
		;;Clipboard := TempClip
		Return
	}
	
	;;Clipboard := TempClip
	
	CtrlClicks := Floor(TakeXAmount / StackSize)
	Single := TakeXAmount - CtrlClicks * StackSize
	
	;;MsgBox, Ctrl: %CtrlClicks% Shift: %Single%
	Sleep, 15
	BlockInput, MouseMove
	
	GroupActivate, POEGame
    WinWaitActive, ahk_group POEGame, ,5
    
    Sleep, 50
    MouseMove, xpos, ypos
    Sleep, 50
    Send {Control Down}
    Sleep, 20
    
    Loop, %CtrlClicks%
	{
		Click
		Sleep, 160
	}
	
	Send {Control Up}
	Sleep, 45
	If (Single != 0)
	{
		Send, {Shift Down}{Click}{Shift Up}%Single%{Enter}
		Column := Floor(CtrlClicks / 5)
		Row := Ceil(CtrlClicks - (Column * 5))
		Sleep, 100		
		MouseMove, (StartX + (Column)*Diff), (StartY + (Row)*Diff)
		Sleep, 100
		Send, {Click}
		
	}
	Sleep, 45
	MouseMove, TempX, TempY
	Sleep, 15
	BlockInput, MouseMoveOff

Return


ToolTipOff:
	ToolTip
Return



F10::
    PixelGetColor, XStash, %StashX%, %StashY%
    PixelGetColor, XCharacter, %CharacterX%, %CharacterY%
    PixelGetColor, XSearch, %SearchX%, %SearchY%
    PixelGetColor, XTrade, %TradeX%, %TradeY%
	PixelGetColor, XNPC, %NPCX%, %NPCY%
MsgBox, Stash %XStash%`r`nChar %XCharacter%`r`nSearch %XSearch%`r`nTrade %XTrade%`r`nNPC %XNPC%
Return

Settings:
	Gui, Settings: Show, x880 y350 h255 w180, 7PoETool
Return

UImove:
    PostMessage, 0xA1,2,,,A
Return

ZapiszUstawienia:
    Gui, Settings: Submit
    IniWrite, %Slots%, %plik%, Ogolne, Sloty
    IniWrite, %Restart%, %plik%, Ogolne, Restart
    Reload
Return


BRestart:
    Send {Ctrl Up}
    Send {Click Up}
Reload

F12::
BExit:
    ExitApp