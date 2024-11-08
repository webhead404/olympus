# Define location for Velox Windows client and install it

$clientLocation = "C:\Velox-Agent\clients\windows"

mkdir C:\Velox-Agent\clients
#cd $clientLocation
#.\velociraptor_client_repacked.msi /q

# Experimental! Just copy the client config over for Rocky
#Start-Sleep -Seconds 10
#Copy-Item "C:\Program Files\Velociraptor\client.config.yaml" "C:\vagrant\resources\velox\client.config.yaml"

#scp -v -O C:\Program Files\Velociraptor\client.config.yaml vagrant@192.168.56.12:/home

#echo n | pscp -pw vagrant vagrant@192.168.56.10:/opt/velociraptor/velociraptor-docker/velociraptor/clients/windows/velociraptor_client_repacked.msi C:\tmp
echo n | pscp -r -pw vagrant vagrant@192.168.56.10:/opt/velociraptor/velociraptor-docker/velociraptor/clients/windows $clientLocation
cd $clientLocation
.\velociraptor_client_repacked.msi /q

#echo n | pscp -pw vagrant vagrant@192.168.56.10:/opt/velociraptor/velociraptor-docker/velociraptor/clients/windows/velociraptor_client_repacked.msi 

Start-Sleep -Seconds 10
echo n | pscp -pw vagrant "C:\Program Files\Velociraptor\client.config.yaml" vagrant@192.168.56.10:/home/vagrant/client.config.yaml