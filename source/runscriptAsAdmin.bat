:: Allows the script to run at administrator permissions when called by the script.
:: By running a shortcut of the main controller with pre set administrator permission.

mode con: cols=30 lines=15
@ECHO OFF
TITLE = OgreKey Controller
ECHO Turn on administrator mode?

:: This script will run the controller as an administrator by showing a windows UAC prompt

START controllerAdmin
EXIT