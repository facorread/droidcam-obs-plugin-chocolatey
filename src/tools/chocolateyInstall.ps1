$ErrorActionPreference = 'Stop';
$ToolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$AhkFile = Join-Path $ToolsDir "install.ahk"

# The installer does not detect that an instance of OBS is running.
# Let us ensure a clean install.

Get-Process -Name obs64 -ErrorAction SilentlyContinue | Stop-Process

$autoHotkeyArgs = @{
  FilePath     = 'C:\ProgramData\chocolatey\lib\autohotkey.portable\tools\AutoHotkey.exe'
  ArgumentList = "$ahkFile"
  PassThru     = $true
}

$AutoHotKeyProcess = Start-Process @autoHotkeyArgs

$packageArgs = @{
  packageName  = 'droidcam-obs-plugin'
  fileType     = 'exe'
  url          = 'https://github.com/dev47apps/droidcam-obs-plugin/releases/download/2.1.0/DroidCamOBS.Setup.2.1.0.exe'
  silentArgs   = ''
  softwareName = 'DroidCam OBS Plugin'
  checksum     = '69C5B110AE97996C11024F4113AC7C442542C0278633A7EAC63027C2A794B5F8A815B52E2895A6369EAF883588B46F8CDD257563364601237597E684D1EFBE30'
  checksumType = 'sha512'
  UseOnlyPackageSilentArguments = $true
}

Install-ChocolateyPackage @packageArgs
Wait-Process -InputObject $AutoHotKeyProcess -ErrorAction SilentlyContinue
