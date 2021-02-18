echo "********** Start Installing Docker **********"
# url: https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-18-04

# remove old docker
sudo apt-get remove docker docker-engine docker.io containerd runc

# update your existing list of packages
sudo apt update

# install a few prerequisite packages which let apt use packages over HTTPS
sudo apt install apt-transport-https ca-certificates curl gnupg-agent software-properties-common

# add the GPG key for the official Docker repository to your system:
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88

# add the Docker repository to APT sources then update
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt update

# install Docker
sudo apt install docker-ce docker-ce-cli containerd.io

# check status
apt-cache policy docker-ce # show version number for docker
sudo systemctl status docker # Check Docker status
