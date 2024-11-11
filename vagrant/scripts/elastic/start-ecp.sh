cp /home/vagrant/.env /home/vagrant/elastic-container/
cd /home/vagrant/elastic-container
chown -R vagrant: /home/vagrant/elastic-container
chmod +x /home/vagrant/elastic-container/elastic-container.sh
dos2unix  /home/vagrant/elastic-container/.env
./elastic-container.sh start