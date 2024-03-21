$install_dir = "C:\aurora-agent"
$resource_dir = "C:\vagrant\resources\aurora"
$AuroraURL = "https://update1.nextron-systems.com/getupdate.php?product=aurora-agent-lite-win"

New-Item -Path $resource_dir -Type directory | Out-Null
New-Item -Path $install_dir -Type directory | Out-Null

# Download Aurora
Write-Output "Installing Nextron Aurora Agent"
$ProgressPreference = 'silentlyContinue'
Invoke-WebRequest -UseBasicParsing -Uri $AuroraUrl -OutFile "$install_dir\aurora-agent.zip"
Write-Output "Unzipping Aurora Agent from $install_dir\aurora-agent.zip to $install_dir"
Expand-Archive -literalpath $install_dir\aurora-agent.zip -DestinationPath $install_dir\aurora-agent-lite-win-pack\

# Stage license file
Copy-Item "$resource_dir\aurora-lite-webhead.lic" "$install_dir\aurora-agent-lite-win-pack"

cd $install_dir\aurora-agent-lite-win-pack
.\aurora-agent.exe --install --dashboard -c agent-config-standard.yml --json --logfile aurora_alerts.json.log