#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
;#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#SingleInstance Force ;Necessary for hiding the dialog box when relaunching script.
DetectHiddenWindows, On	
;SetCapslockState, AlwaysOff ;Must only be used by one script at a time

/* --- Layer 1 ---
Navigation keys are mapped here, also some nice additions

*/

; Navigation hotkeys
; 1. IJKL Arrows, UO pageup/dn
k::up
h::left
j::down
l::right
u::Pgup 
o::Pgdn

; 2. ESDF Mouse Controls, WR Lclick/Rclick
;Still unsure if wasd is better
+d::MouseMove, 15, 0, 0, R
+a::MouseMove, -15, 0, 0, R
+s::MouseMove, 0, 15, 0, R
+w::MouseMove, 0, -15, 0, R
d::MouseMove, 150, 0, 0, R
a::MouseMove, -150, 0, 0, R
s::MouseMove, 0, 150, 0, R
w::MouseMove, 0, -150, 0, R 

q::
long_press_duration :=450  ; How long a key is pressed to be considered a long press in milliseconds, adjust to preference.
if ( is_longpress("q", long_press_duration) )
	{
	Send, {Lbutton down}
	}
else
	{
	Send, {LButton up}
	Send, {LButton}
	}
return

e::
long_press_duration :=450  ; How long a key is pressed to be considered a long press in milliseconds, adjust to preference.
if ( is_longpress("e", long_press_duration) )
	{
	Send, {Rbutton down}
	}
else
	{
	Send, {RButton up}
	Send, {RButton}
	}
return

is_longpress(key_to_watch, long_press_duration) ; This function returns true if the key specified is held down for the amount of time given in milliseconds
	{
	key_press_time := A_TickCount ; Get time key is pressed
	while (GetKeyState(key_to_watch,"p"))
		{
		key_press_end := A_TickCount ; Get latest time key is pressed
		}
	key_duration := key_press_end-key_press_time ;Subtract to get duration of press
	;msgbox, %key_duration% 		;Displays press duration, can be used to see how long you like the long press to be
	if (key_duration>=long_press_duration)
		{
		return True
		key_duration := 0
		}
	else
		{
		return False
		key_duration := 0
		}
	return
	}

; 3.	Remap Space to CTRL (or any other modifier)
space::
set_key := "Ctrl" ; Remap Space bar to any modifier (Ctrl, Shift, Alt, Rwin/Lwin)
while (GetKeyState("space", "P"))
	{
	;tooltip, collecting keypresses	
	key_inputs := key_interceptor() ; Get modifier and alpha keys that are pressed while space is down
	if (GetKeyState("space", "P"))
		{
		Send,{blind}{%set_key% down}%key_inputs%{%set_key% up} ;Send this if space is still down
		}
	else
		{
		Send,%key_inputs% ;Send this if otherwise
		}
	}
;tooltip, sent
return

key_interceptor() ; Starts an input interceptor to collect keys while pressing spacebar
	{
	collect_key := inputhook( , ," " ) ;Using space in a matchlist to end input
	collect_key.KeyOpt("{All}", "ES") 
	collect_key.KeyOpt("{CapsLock}{LCtrl}{RCtrl}{LAlt}{RAlt}{LShift}{RShift}{LWin}{RWin}", "-ES") ; Keys that won't end input collection
	collect_key.start()
	collect_key.wait()     
	detected_keys := make_bracketed(collect_key.EndMods, collect_key.EndKey) ;Pass the Mods and key pressed to function
	return detected_keys
	}

make_bracketed(raw_mod, raw_key) ; Adds brackets to normal keys and combines with modifiers to be compatible with Send syntax
	{
	raw_mod :=RegExReplace(raw_mod, "[<>](.)(?:>\1)?", "$1") ; Makes modifiers neutral (no left or right)
	processed_key := "{" . raw_key . "}" ; adds brackets to non-modifiers
	;msgbox, %raw_mod% %processed_key% 
	return raw_mod . processed_key ;returns joined processed keys
	}

; 4. switching desktops (accessible by win+tab)
/ & l::Send {Blind}^#{right}
/ & h::Send {Blind}^#{left}
/ & j::Send {Blind}^#{down}
/ & k::Send {Blind}^#{up}
/ & tab::Send {Blind}!{Tab}

; imitate winKey + Number 
/ & a::Send #{1}
/ & s::Send #{2}
/ & d::Send #{3}
/ & f::Send #{4}
/ & z::Send #{5}
/ & x::Send #{6}
/ & c::Send #{7}
/ & v::Send #{8}

;Number row to Function row
1::f1
2::f2
3::f3
4::f4
5::f5
6::f6
7::f7
8::f8
9::f9
0::f10
;-::f11
;=::f12
;Disabled layer keys

; Built-in Remaps - These keys are permanently remapped while the main script is active
\::BackSpace ;For ANSI layouts, imitates HHKB backspace layout 
BackSpace::\
+\::Send {Del} ; Additional backspace behaviour, Shift backspace = del
;+BackSpace::Del ;Not working, not sure why, supposed to remap shift + backspace to del

