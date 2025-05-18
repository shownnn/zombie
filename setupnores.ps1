Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled False

$crdPath = "$env:TEMP\chromeremotedesktophost.msi"
Start-BitsTransfer -Source "https://dl.google.com/edgedl/chrome-remote-desktop/chromeremotedesktophost.msi" -Destination $crdPath
Start-Process "msiexec.exe" -ArgumentList "/i `"$crdPath`" /qn" -Wait
Remove-Item $crdPath

$chromePath = "$env:TEMP\chrome_installer.exe"
Start-BitsTransfer -Source "https://dl.google.com/chrome/install/latest/chrome_installer.exe" -Destination $chromePath
Start-Process -FilePath $chromePath -ArgumentList "/install", "/silent", "/system-level" -Verb RunAs -Wait
Remove-Item $chromePath
