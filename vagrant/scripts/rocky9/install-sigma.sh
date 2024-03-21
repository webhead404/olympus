#!/bin/bash

echo "Installing dependencies for Sigma-Cli and Rules"
yum install python-pip git -y

echo "Installing Sigma-Cli"
su vagrant -c "pip install sigma-cli"

echo "Pulling down Sigma rules"
mkdir /opt/toolbox
chown -R vagrant: /opt/toolbox
cd /opt/toolbox
git clone https://github.com/SigmaHQ/sigma