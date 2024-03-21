#!/bin/bash

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

# Wait some time for client folders to be available
sleep 10
mkdir -p /vagrant/resources/velox/clients
cp -R velociraptor/clients/* /vagrant/resources/velox/clients