$install_dir = "C:\hayabusa"
$HayabusaURL = "https://github.com/Yamato-Security/hayabusa/releases/download/v2.13.0/hayabusa-2.13.0-win-x64.zip"

New-Item -Path $install_dir -Type directory | Out-Null

# Download Aurora
Write-Output "Installing Hayabusa"
$ProgressPreference = 'silentlyContinue'
Invoke-WebRequest -UseBasicParsing -Uri $HayabusaUrl -OutFile "$install_dir\hayabusa-2.13.0-win-x64.zip"
Write-Output "Unzipping Hayabusa from $install_dir\hayabusa-2.13.0-win-x64.zip to $install_dir"
Expand-Archive -literalpath $install_dir\hayabusa-2.13.0-win-x64.zip -DestinationPath $install_dir\hayabusa-2.13.0\
Rename-Item -Path "$install_dir\hayabusa-2.13.0\hayabusa-2.13.0-win-x64.exe" -NewName "hayabusa.exe"