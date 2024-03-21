echo "Installing Garble"
go install mvdan.cc/garble@latest

cd /opt/toolbox

echo "Downloading Pneuma"
git clone https://github.com/preludeorg/pneuma

echo "Compiling Pneuma"
cd /opt/toolbox/pneuma
bash /opt/toolbox/pneuma/garble-build.sh -randomHash thremulationstation

echo "Staging Pneuma for C2"
cd /opt/toolbox/pneuma/payloads
cp -R /opt/toolbox/pneuma/payloads/* /tmp/workspace/portal.prelude.org/payloads
