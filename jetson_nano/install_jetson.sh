if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <Virtual Env Name>"
    exit
fi

env_name="$1"

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


echo "********** Install Python Packages **********"
sudo apt-get install -y build-essential checkinstall cmake pkg-config yasm
sudo apt-get install -y git gfortran
sudo apt-get install -y python-dev python-pip python3-dev python3-pip
sudo -H pip2 install -U pip numpy
sudo -H pip3 install -U pip numpy
sudo pip2 install virtualenv virtualenvwrapper
sudo pip3 install virtualenv virtualenvwrapper
echo "# Virtual Environment Wrapper"  >> ~/.bashrc
echo "source /usr/local/bin/virtualenvwrapper.sh" >> ~/.bashrc
source ~/.bashrc

echo "********** Create Virtual Environment **********"

source `which virtualenvwrapper.sh`
mkvirtualenv $env_name -p python3
source $HOME/.virtualenvs/$env_name/bin/activate
workon $env_name

echo "********** Reboot to take effect **********"
sudo reboot