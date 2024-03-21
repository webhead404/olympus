# Define location for Velox Windows client and install it

$clientLocation = "C:\vagrant\resources\velox\clients\windows"
cd $clientLocation
.\velociraptor_client_repacked.msi /q

# Experimental! Just copy the client config over for Rocky
Start-Sleep -Seconds 10
Copy-Item "C:\Program Files\Velociraptor\client.config.yaml" "C:\vagrant\resources\velox\client.config.yaml"