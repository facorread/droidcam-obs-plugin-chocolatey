; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode "Input" ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir A_ScriptDir ; Ensures a consistent starting directory.

close_all_instances(process_executable) {
    process_string := Format("ahk_exe {1}", process_executable)
    Loop 600 {
        If WinExist(process_string) {
            WinClose(process_string, , 600)
            Sleep(1000)
        } Else {
            Break
        }
    }
    Loop 600 {
        If ProcessExist(process_executable) {
            ProcessClose(process_executable)
            Sleep(1000)
        } Else {
            Break
        }
    }
    If ProcessExist(process_executable) {
        Throw("Please close all instances of " process_executable " before running choco")
    }
}

close_all_instances("obs64.exe")
WinWait("DroidCam OBS Source Plugin 2.1.0", , 600)
WinActivate("DroidCam OBS Source Plugin 2.1.0")
Send "!A!N!I"
WinWait("DroidCam OBS Source Plugin 2.1.0", "Finish", 600)
Send "!F"
