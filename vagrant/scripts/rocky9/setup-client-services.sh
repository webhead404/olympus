#!/bin/bash

# Install packages
sudo yum install tmux cockpit nginx samba samba-common samba-client -y

# Enable and Start cockpit
systemctl enable cockpit.socket
systemctl start cockpit.socket

# Enable and start Nginx
systemctl enable nginx
systemctl start nginx

# Enable and start Rsyslog
systemctl enable rsyslog
systemctl start rsyslog

# Enable and start Samba services
systemctl enable smb
systemctl start smb
systemctl enable nmb
systemctl start nmb

mkdir -p /srv/samba/anonymous
chmod 755 /srv/samba/anonymous
chown -R nobody: /srv/samba/anonymous