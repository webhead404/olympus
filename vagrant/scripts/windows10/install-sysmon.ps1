$sigmaConfigUrl = "https://raw.githubusercontent.com/SwiftOnSecurity/sysmon-config/master/sysmonconfig-export.xml"
$install_dir = "C:\Users\vagrant\Sysmon"

Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; Invoke-WebRequest "https://download.sysinternals.com/files/Sysmon.zip" -OutFile "C:\Users\vagrant\Sysmon.zip"

cd "C:\Users\vagrant\"

Expand-Archive -LiteralPath "C:\Users\vagrant\Sysmon.zip" -DestinationPath $install_dir


# Download Sysmon Config
Write-Output "Downloading config"
$ProgressPreference = 'silentlyContinue'
Invoke-WebRequest -UseBasicParsing -Uri $sigmaConfigUrl -OutFile "$install_dir\sysmonconfig-export.xml"
cd $install_dir

# Install Sysmon with config
Write-Output "Installing Sysmon"
.\Sysmon64.exe -accepteula -i sysmonconfig-export.xml