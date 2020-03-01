$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://fossies.org/windows/misc/xdelta3-3.0.11-i686.exe.zip'
$url64      = 'https://fossies.org/windows/misc/xdelta3-3.0.11-x86_64.exe.zip'
$checksum = '57c94785ef5a30fd269941221b868d40e4d39deb2a3beae33aab122c2ecd6c7d'
$checksum64 = 'eca90daab9cd8388ffa17fb4d6808bb0616cc5d37a7682126485dba1c79f86bf'
$checksumType = 'sha256'
Install-ChocolateyZipPackage $packageName $url $toolsDir $url64 -checksum $checksum -checksumType $checksumType -checksum64 $checksum64 -checksumType64 $checksumType

$versionedExeName = Get-ChildItem $toolsDir | where {$_.extension -in ".exe" -and $_.basename -match "^xdelta3"} | Select-Object -first 1
$oldExePath = join-path $toolsDir $versionedExeName
$newExePath = join-path $toolsDir xdelta3.exe
# Rename xdelta3-3.0.11-x86_64.exe  ->  xdelta3.exe
Rename-Item $oldExePath $newExePath
