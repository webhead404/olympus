$OperatorAgentUrl = "http://192.168.56.10:3391/payloads/pneuma/v1.5/pneuma-windows.exe"
$install_dir = "C:\Pneuma"
$scripts_dir = "C:\vagrant\scripts"
$vagrant_startup = "C:\Users\vagrant\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"
New-Item -Path $install_dir -Type directory | Out-Null

# Add Exception for Pneuma
Write-Output "Adding Exception for Pneuma in case Defender isn't fully turned off"
Add-MpPreference -ExclusionPath "C:\Pneuma"

# Download Pneuma for Windows

Write-Output "Downloading Pneuma"
$ProgressPreference = 'silentlyContinue'
Invoke-WebRequest -UseBasicParsing -Uri $OperatorAgentUrl -OutFile "$install_dir\pneuma-windows.exe"
Write-Output "Copying Pneuma scripts"


# Replace with Copy-Item
Copy-Item "$scripts_dir\start-pneuma.ps1" "$install_dir"

# Only enable this if you want Pneuma started by default
Copy-Item "$scripts_dir\startup.cmd" "$vagrant_startup"

# Start Pneuma if it is in the path

If (Test-Path $install_dir\pneuma-windows.exe) 
{
    Write-Output "Pneuma found in install directory! Complete."
    
    # Only enable this line if you want Pneuma to start by default
    Start-Process -FilePath "C:\Pneuma\pneuma-windows.exe" -ArgumentList "-address 192.168.56.10:2323 -contact tcp -name pneuma-windows10 -range thremulation"
}
