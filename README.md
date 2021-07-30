# OgreKeys
Autohotkey Keyboard layer(s*)

###### currently only has one layer ✌️

Features list:
1. Normal Layer and Navigation layer using capslock, normal layer is unchanged except for hhkb-style backspace
2. Displays time every 5 minutes. with tooltip
3. Navigate with I,J,K,L keys, space65 style arrow keys
4. Move the mouse with E, S, D, F keys for mouse movement, also W, and R for Lclick and Rclick respectively.
5. Navigate windows using the space bar in the navigation layer. 


## How to use:
This requires autohotkey installed.
Store both scripts in the same folder.
It's ready to use but I'm still trying  to make it as configurable as possible.

## Layout
There are two layouts: The controller, which is used for typing and normal stuff, and Layer1 which is used for navigation (labeled too) 

Normal layer is the stock configuration of the keyboard with a few tweaks namely the "\" key on top of the enter key is remapped to become the backspace and the backspace key now produces the backslash. The remapped backspace key can now be used as the Del key by pressing Shift+Backspace. These remaps will always be active whereas the Layer1 remaps will only be active when capslock is on

Layer1 is activated using the capslock key, it's launched as soon as the Main controller runs. It's labeled "Navigation" as seen in the tooltip. The remaps are:
- Space key as CTRL key
- IJKL for arrow keys, U, and O for pageup/dn
- ESDF to control mouse movement, hold shift to slow down movement. W and R for left or right click. Hold W or R for...well, hold
-  "/" + arrow keys (IJKL) to navigate the "desktops" in windows. / + tab for alt+tab alternative.
## Known Issues
- Can't set the script to start on windows start. There are ways to do this but only in windows, not in the script.
- The remap "\" key (now backspace) will send \ once when space as Ctrl is pressed and no endkey was received.
- Holding the W or R key for long press detection consumes an abnormal size of cpu (max of 17% when holding the key, monitored on task manager), at least in my humble Intel Atom Z3735F laptop with 2gb of Ram :)
- Cannot be used with task manager unless it's in administrator mode (Be careful of doing this with other scripts since programs launched in an administrator autohotkey script would run in administrator mode too.)
