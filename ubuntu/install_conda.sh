echo "********** Installing python 3.8 **********"
sudo apt update
sudo apt install software-properties-common
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt update
sudo apt install python3.8

# Check python version
python --version
python3 --version
python3.8 --version

# Update python
sudo update-alternatives --install /usr/bin/python python /usr/bin/python2 1
sudo update-alternatives --install /usr/bin/python python /usr/bin/python3 2
sudo update-alternatives --install /usr/bin/python python /usr/bin/python3.8 3

sudo update-alternatives --config python

sudo ./Miniconda3-latest-Linux-x86_64.sh

#You have chosen to not have conda modify your shell scripts at all.
#To activate conda's base environment in your current shell session:

#eval "$(/home/toanmh/miniconda3/bin/conda shell.YOUR_SHELL_NAME hook)" 

#To install conda's shell functions for easier access, first activate, then:

#conda init

#If you'd prefer that conda's base environment not be activated on startup, 
#   set the auto_activate_base parameter to false: 

#conda config --set auto_activate_base false

#Thank you for installing Miniconda3!
