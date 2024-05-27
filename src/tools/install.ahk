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

patient_process_close(process_executable) {
    ProcessWaitClose(process_executable, 600)
    If ProcessExist(process_executable) {
        ; The testing platform does not like processes that hang
        ProcessClose(process_executable)
    }
}

close_all_instances("obs64.exe")
WinWait("DroidCam OBS Source Plugin 2.3.0", , 600)
WinActivate("DroidCam OBS Source Plugin 2.3.0")
Send "!A!N!I"
WinWait("DroidCam OBS Source Plugin 2.3.0", "Finish", 600)
Send "!F"
patient_process_close("DroidCamOBS.Setup.2.3.0.exe")
