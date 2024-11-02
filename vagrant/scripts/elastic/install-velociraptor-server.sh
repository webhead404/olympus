#!/bin/bash

# Installing SSHPass

echo "Installing SSHPass"

yum install sshpass -y

echo "Installing Velociraptor Server"

mkdir -p /opt/velociraptor
cd /opt/velociraptor
git clone https://github.com/weslambert/velociraptor-docker
cd velociraptor-docker

# Change user name and password
sed -i 's/VELOX_USER=admin/VELOX_USER=velox/g' .env
sed -i 's/VELOX_PASSWORD=admin/VELOX_PASSWORD=vagrant/g' .env

# Change server IP
sed -i 's/VelociraptorServer/192.168.56.10/g' .env

docker compose up -d

sleep 30
chown -R vagrant: /opt/velociraptor/velociraptor-docker/velociraptor/clients/

# Wait some time for client folders to be available
#sleep 10
#mkdir -p /vagrant/resources/velox/clients
#cp -R velociraptor/clients/windows /vagrant/resources/velox/clients

#sshpass -p 'vagrant' scp -v -O velociraptor/clients/windows/velociraptor_client_repacked.msi vagrant@192.168.56.11:/C:/tmp
#sshpass -p 'vagrant' scp -v -O velociraptor/clients/linux/velociraptor_client_repacked vagrant@192.168.56.11:/home/vagrant