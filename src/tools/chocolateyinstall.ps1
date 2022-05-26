$ErrorActionPreference = 'Stop';
$ToolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$AhkFile = Join-Path $ToolsDir "install.ahk"

$packageArgs = @{
  packageName  = 'droidcam-obs-plugin'
  fileType     = 'exe'
  url          = 'https://files.dev47apps.net/obs/DroidCamOBS.Setup.1.5.1.exe'
  silentArgs   = ''
  softwareName = 'DroidCam OBS Plugin'
  checksum     = 'D5CC8AB97D1D71914B09E9586CF0205B1E0CB4F77E6752B632DD9CEE7BA5B4F6543CC3CD0B85AD35F9AEE486B9DA02FE11CCA7E01B80413FFA3FEE908690B8E7'
  checksumType = 'sha512'
}

Start-Process AutoHotKey $AhkFile
Install-ChocolateyPackage @packageArgs
