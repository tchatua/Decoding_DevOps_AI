#!/bin/bash
sudo dnf install memcached -y # Install Memcached
sudo systemctl start memcached # Start Memcached service
sudo systemctl enable memcached # Enable Memcached to start on boot
sudo systemctl status memcached # Check the status of Memcached service
sed -i 's/127.0.0.1/0.0.0.0/g' /etc/sysconfig/memcached # Allow Memcached to listen on all network interfaces
sudo systemctl restart memcached # Restart Memcached service to apply changes
sudo memcached -p 11211 -U 11111 -u memcached -d # Run Memcached with specified ports and user in daemon mode
