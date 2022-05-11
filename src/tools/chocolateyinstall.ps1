$ErrorActionPreference = 'Stop';
$ToolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$AhkFile = Join-Path $ToolsDir "install.ahk"

$packageArgs = @{
  packageName  = 'droidcam-obs-plugin'
  fileType     = 'exe'
  url          = 'https://files.dev47apps.net/obs/DroidCamOBS.Setup.1.5.0.exe'
  silentArgs   = ''
  softwareName = 'DroidCam OBS Plugin'
  checksum     = '512f9c2c97ea5d3999108904c7a90e2d2981352d5b179989aaadf53e3167434f73993a4e0b3fa53930f57b805b90284b285a8c5cb861e85eede3161a7e77582c'
  checksumType = 'sha512'
}

Start-Process AutoHotKey $AhkFile
Install-ChocolateyPackage @packageArgs
