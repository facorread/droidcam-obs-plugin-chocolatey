$ErrorActionPreference = 'Stop';
$ToolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$AhkFile = Join-Path $ToolsDir "install.ahk"

$packageArgs = @{
  packageName  = 'droidcam-obs-plugin'
  fileType     = 'exe'
  url          = 'https://files.dev47apps.net/obs/DroidCamOBS.Setup.1.3.exe'
  silentArgs   = ''
  softwareName = 'DroidCam OBS Plugin'
  checksum     = 'EF46311079BD71FFA019BB90D34EDE2F9E594DB65817F204E30291C9277BBB38BB7A2F8EDB7A11DA591FE4E08EB4841C917708B828F57BF2B5F6305CD5EB3789'
  checksumType = 'sha512'
}

Start-Process AutoHotKey $AhkFile
Install-ChocolateyPackage @packageArgs
