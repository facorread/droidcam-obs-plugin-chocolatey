$PackageVersion = "2.3.2"

$Global:ErrorActionPreference = 'Stop'
$Global:InformationPreference = 'Continue'
$Global:VerbosePreference     = 'Continue'

Set-StrictMode -Version 3.0

# The installer does not detect that an instance of OBS is running.
# Let us ensure a clean install.

Get-Process -Name obs64 -ErrorAction SilentlyContinue | Stop-Process

$autoHotkeyArgs = @{
    FilePath     = Get-ChocolateyPath -PathType InstallPath | Join-Path -ChildPath "lib\autohotkey.portable\tools\AutoHotkey.exe"
    ArgumentList = Get-ChocolateyPath -PathType PackagePath | Join-Path -ChildPath "tools\install.ahk"
    PassThru     = $true
}

$AutoHotKeyProcess = Start-Process @autoHotkeyArgs
Write-Verbose "Running $($AutoHotKeyProcess.ProcessName)"

$packageArgs = @{
    packageName  = 'droidcam-obs-plugin'
    fileType     = 'exe'
    url          = "https://github.com/dev47apps/droidcam-obs-plugin/releases/download/$($PackageVersion)/DroidCamOBS.Setup.$($PackageVersion).exe"
    silentArgs   = ''
    softwareName = 'DroidCam OBS Plugin'
    checksum     = '866F097017D656A4ECCE9A7F65B159825909FEA5EEA38F726FE4CDE2D3BC75B70ADDCA09C138F8D3050A97CC855A05B9035B842D4280CCAF8D54E33D7F4AC64F'
    checksumType = 'sha512'
    UseOnlyPackageSilentArguments = $true
}

Install-ChocolateyPackage @packageArgs
Wait-Process -InputObject $AutoHotKeyProcess -ErrorAction SilentlyContinue
Write-Verbose "Process $($AutoHotKeyProcess.ProcessName): HasExited $($AutoHotKeyProcess.HasExited) ExitCode $($AutoHotKeyProcess.ExitCode)"
