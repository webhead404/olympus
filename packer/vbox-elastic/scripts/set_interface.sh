ip link
rm /etc/network/interfaces

echo "
source /etc/network/interfaces.d/*

# The loopback network interface
auto lo
iface lo inet loopback

# The primary network interface
allow-hotplug enp0s3
iface enp0s3 inet dhcp
pre-up sleep 2

iface enp0s8 inet static
      address 192.168.56.10
      netmask 255.255.255.0
" >> /etc/network/interfaces

ifdown enp0s8
ifup enp0s8