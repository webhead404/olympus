# Define Velox client Linux client and install it

CLIENT_LOCATION="/vagrant/resources/velox/clients/linux"
cd $CLIENT_LOCATION

# Make the client using the config we copied
./velociraptor_client_repacked --config /vagrant/resources/velox/client.config.yaml rpm client

# Install client RPM
rpm -i velociraptor_client_0.7.1.1_x86_64.rpm