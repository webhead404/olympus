cp /home/vagrant/.env /home/vagrant/elastic-container/
cd /home/vagrant/elastic-container
chown -R vagrant: /home/vagrant/elastic-container
chmod +x /home/vagrant/elastic-container/elastic-container.sh
dos2unix  /home/vagrant/elastic-container/.env
./elastic-container.sh start

# Restarting ECP
./elastic-container.sh restart

check_fleet_ready() {
  response=$(curl -s -k -u elastic:vagrant https://127.0.0.1:5601/api/fleet/agents/setup)
  is_ready=$(echo "$response" | jq -r '.isReady')
}

while true; do
  check_fleet_ready
  
  if [ "$is_ready" = "true" ]; then
    echo "Fleet Server is ready."
    exit 0
  else
    echo "Fleet Server is not ready. Retrying in 10 seconds..."
    sleep 10
  fi
done