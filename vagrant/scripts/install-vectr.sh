#!/bin/bash

# Install prereq if needed
yum install unzip -y

# Download Vectr
mkdir -p /opt/vectr
cd /opt/vectr
wget https://github.com/SecurityRiskAdvisors/VECTR/releases/download/ce-8.9.2/sra-vectr-runtime-8.9.2-ce.zip 
unzip sra-vectr-runtime-8.9.2-ce.zip

# Install Vectr
sudo docker compose up -d

# Download Attire merger
git clone https://github.com/Retrospected/attire-merger