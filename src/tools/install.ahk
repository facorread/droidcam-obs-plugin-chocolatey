#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.

WinWait, DroidCam OBS Plugin Setup, , 1000
WinActivate, DroidCam OBS Plugin Setup
Send !A!N!I
WinWait, DroidCam OBS Plugin Setup, Finish, 600
Send !F
