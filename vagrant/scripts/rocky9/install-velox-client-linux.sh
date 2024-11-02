# Define Velox client Linux client and install it

CLIENT_LOCATION="/opt/velox/clients"

yum install sshpass -y

mkdir -p $CLIENT_LOCATION/linux
chown -R vagrant: $CLIENT_LOCATION/linux

sshpass -p 'vagrant' scp  -o StrictHostKeyChecking=no -r vagrant@192.168.56.10:/opt/velociraptor/velociraptor-docker/velociraptor/clients/linux $CLIENT_LOCATION
sshpass -p 'vagrant' scp  -o StrictHostKeyChecking=no -r vagrant@192.168.56.10:/home/vagrant/client.config.yaml $CLIENT_LOCATION/linux


# Make the client using the config we copied
cd $CLIENT_LOCATION/linux
./velociraptor_client_repacked --config client.config.yaml rpm client

# Install client RPM
rpm -i velociraptor_client_*_x86_64.rpm