echo "********** Update System **********"
sudo apt-get update
sudo apt-get upgrade

echo "********** Create Swap File **********"
sudo fallocate -l 8G /var/swapfile
sudo chmod 600 /var/swapfile
sudo mkswap /var/swapfile
sudo swapon /var/swapfile
sudo bash -c 'echo "/var/swapfile swap swap defaults 0 0" >> /etc/fstab'
sudo apt-get update
sudo apt-get upgrade

echo "********** Reboot to take effect **********"
sudo reboot