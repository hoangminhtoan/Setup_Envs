echo "********** Setup Environment for fresh Ubuntu **********"
sudo apt update && sudo apt upgrade

echo "********** Upgrade CMake **********"
sudo apt remove --purge cmake
hash -r
sudo snap install cmake --classic

echo "********** Install Desktop Sharing **********"
sudo apt update
sudo apt install remmina

echo "********** Install Essential Packages **********"
sudo apt-get install build-essential dkms
sudo apt-get install freeglut3 freeglut3-dev libxi-dev libxmu-dev
sudo apt-get update -y # Update the list of packages
sudo apt-get remove -y x264 libx264-dev # Remove the older version of libx264-dev and x264
sudo apt-get install -y build-essential checkinstall cmake pkg-config yasm
sudo apt-get install -y git gfortran

# The following command will add the link of the repository to install the libraries which does not support 
# Ubuntu 18.04
sudo add-apt-repository -y "deb http://security.ubuntu.com/ubuntu xenial-security main"
sudo apt-get install -y libjpeg8-dev libjasper-dev libpng12-dev
sudo apt-get install -y libtiff5-dev
sudo apt-get install -y libavcodec-dev libavformat-dev libswscale-dev libdc1394-22-dev
sudo apt-get install -y libxine2-dev libv4l-dev
sudo apt-get install -y libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev
sudo apt-get install -y qt5-default libgtk2.0-dev libtbb-dev
sudo apt-get install -y libatlas-base-dev
sudo apt-get install -y libfaac-dev libmp3lame-dev libtheora-dev
sudo apt-get install -y libvorbis-dev libxvidcore-dev
sudo apt-get install -y libopencore-amrnb-dev libopencore-amrwb-dev
sudo apt-get install -y x264 v4l-utils ffmpeg
sudo apt-get install -y libprotobuf-dev protobuf-compiler
sudo apt-get install -y libgoogle-glog-dev libgflags-dev
sudo apt-get install -y libgphoto2-dev libeigen3-dev libhdf5-dev doxygen

echo "************* Installing Python2-3 *************"
sudo apt update
sudo apt install software-properties-common
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt update
sudo apt install -y python-dev python-pip python3-dev python3-pip
#sudo apt install -y python-dev python-pip python3-dev python3-pip python3.8

sudo -H pip2 install -U pip numpy
sudo -H pip3 install -U pip numpy
#sudo python3.8 -m pip install -U pip numpy

echo "************* Installing Virtual Environment *************"
sudo pip2 install virtualenv virtualenvwrapper
sudo pip3 install virtualenv virtualenvwrapper
#sudo python3.8 -m pip install -U virtualenv virtualenvwrapper

echo "************* Create Virtual Environment *************"
echo "# Virtual Environment Wrapper"  >> ~/.bashrc
echo "source /usr/local/bin/virtualenvwrapper.sh" >> ~/.bashrc
source ~/.bashrc

echo "************* Create Python2 Virutal Environment *************"
mkvirtualenv py2 -p python2
workon py2
pip install -U pip numpy

echo "************* Create Python3 Virutal Environment *************"
mkvirtualenv py3 -p python3
workon py3
pip install -U pip numpy scipy


echo "Do you want to install multiple gcc & g++? [y\N]:"
read -p "" choice

if [ "$choice" == "y" ] | [ "$choice" == "Y" ]; then
 sudo apt install software-properties-common
 sudo add-apt-repository ppa:ubuntu-toolchain-r/test
 sudo apt update
 sudo apt install gcc-9 g++-9
 sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-9 90 --slave /usr/bin/g++ g++ /usr/bin/g++-9 --slave /usr/bin/gcov gcov /usr/bin/gcov-9
 sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-7 70 --slave /usr/bin/g++ g++ /usr/bin/g++-7 --slave /usr/bin/gcov gcov /usr/bin/gcov-7
 sudo update-alternatives --config gcc
 sudo update-alternatives --config g++
fi
#echo "********** Start Installing Miniconda 3 **********"
#sudo ./Miniconda3-latest-Linux-x86_64.sh

echo "************* Add CUDA Path *************"
echo "# Add CUDA Path" >> ~/.bashrc
echo "export PATH=$PATH:/usr/local/cuda/bin" >> ~/.bashrc
echo "export CUDADIR=/usr/local/cuda" >> ~/.bashrc
echo "export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda/lib64:/usr/local/cuda/extras/CUPTI/lib64" >> ~/.bashrc
