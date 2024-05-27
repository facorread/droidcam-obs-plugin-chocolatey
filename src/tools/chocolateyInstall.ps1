$PackageVersion = "2.3.0"

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
    checksum     = '5505697F9445561428A62C92B29C5E523BCAE09A00086E22A09156F51BCA5CEE61502396F24C346C841CF05445B0804BD99795F6562D43E29507534B6B776D6A'
    checksumType = 'sha512'
    UseOnlyPackageSilentArguments = $true
}

Install-ChocolateyPackage @packageArgs
Wait-Process -InputObject $AutoHotKeyProcess -ErrorAction SilentlyContinue
Write-Verbose "Process $($AutoHotKeyProcess.ProcessName): HasExited $($AutoHotKeyProcess.HasExited) ExitCode $($AutoHotKeyProcess.ExitCode)"
