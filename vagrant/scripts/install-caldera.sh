#!/bin/bash

# Install Prereqs

yum install git python-pip golang npm -y

# Download Caldera Magma
cd /opt
git clone https://github.com/mitre/caldera.git --recursive --branch 5.0.0
cd caldera
pip3 install -r requirements.txt
python3 server.py --build > /dev/null 2>&1 &

echo ""
echo "Caldera will build the UI in the background. To run Caldera again later run "python /opt/caldera/server.py" without the --build flag."