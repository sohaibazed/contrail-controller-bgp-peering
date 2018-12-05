#!/bin/bash -eux

#login as root
sudo su

# Configure SSHD
sudo sed -e '/PermitRootLogin/ s/^#*/#/' -i /etc/ssh/sshd_config
sudo sed '/^#PermitRootLogin/a PermitRootLogin yes' -i /etc/ssh/sshd_config
sudo sed -i '/^#ListenAddress 0.0.0.0/s/^#//' -i /etc/ssh/sshd_config
sudo sed '/^#PasswordAuthentication/a PasswordAuthentication yes' -i /etc/ssh/sshd_config
sudo systemctl restart sshd
echo "root:Juniper123" | sudo chpasswd
sudo iptables -F

# Install packages
sudo yum install -y epel-release
sudo yum install -y ntp git
sudo yum install -y python-urllib3 git ansible-2.4.2.0 pciutils wget tcpdump net-tools python-pip

# Configure NTP
sudo rm -rf /etc/ntp.conf
sudo touch /etc/ntp.conf
sudo echo "driftfile /var/lib/ntp/drift" >> /etc/ntp.conf
sudo echo "server 10.84.5.100" >> /etc/ntp.conf
sudo echo "restrict 127.0.0.1" >> /etc/ntp.conf
sudo echo "restrict -6 ::1" >> /etc/ntp.conf 
sudo echo "includefile /etc/ntp/crypto/pw" >> /etc/ntp.conf 
sudo echo "keys /etc/ntp/keys" >> /etc/ntp.conf 
sudo systemctl start ntpd
sudo systemctl enable ntpd

systemctl disable NetworkManager
systemctl enable network 
systemctl stop NetworkManager
systemctl start network
