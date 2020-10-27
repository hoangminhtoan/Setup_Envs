# If you install TensorRT by *.deb file => you should install cuda toolkit and cudnn in *.deb file to solve mismatch version problem

#!/bin/bash

CUDA_VERSION="10.2.89"
TRT_VERSION="7.2.1-1+cuda10.2"
OS="ubuntu1804"
TAG="cuda10.2-trt7.2.1.6-ga-20201006"

set -e

# purge existing CUDA first
#if [ -e /usr/local/cuda ]; then
#    read -p "Existing CUDA will be purged and reinstalled. Do you wish to proceed?" yn
#    case $yn in
#        [Yy]* ) sudo apt --purge remove "*cuda*"; break;;
#        [Nn]* ) exit;;
#        * ) echo "Please answer yes or no.";;
#    esac
#fi

# install cuda 10.2 by using .deb file
#wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/cuda-ubuntu1804.pin
#sudo mv cuda-ubuntu1804.pin /etc/apt/preferences.d/cuda-repository-pin-600
#wget https://developer.download.nvidia.com/compute/cuda/repos/${OS}/x86_64/cuda-repo-${OS}_${CUDA_VERSION}-1_amd64.deb
#sudo apt-key adv --fetch-keys http://developer.download.nvidia.com/compute/cuda/repos/${OS}/x86_64/7fa2af80.pub
#sudo bash -c 'echo "deb http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64 /" > /etc/apt/sources.list.d/cuda.list'
#sudo dpkg -i cuda-repo-${OS}_${CUDA_VERSION}*.deb
#sudo apt-get update
#sudo apt-get -y install cuda=${CUDA_VERSION}-1

# install cuda 10.2 by using *.run file
#wget http://developer.download.nvidia.com/compute/cuda/10.2/Prod/local_installers/cuda_10.2.89_440.33.01_linux.run
#sudo sh cuda_10.2.89_440.33.01_linux.run
#run patch file
#sudo sh cuda_10.2.1_linux.run

# install tensorrt
sudo dpkg -i nv-tensorrt-repo-${OS}-${TAG}_1-1_amd64.deb
sudo apt-key add /var/nv-tensorrt-repo-${TAG}/7fa2af80.pub
sudo apt-get update
sudo apt-get install -f # force install tensorrt packages
sudo apt-get install tensorrt

# install NVIDIA Machine learning network
wget https://developer.download.nvidia.com/compute/machine-learning/repos/${OS}/x86_64/nvidia-machine-learning-repo-${OS}_1.0.0-1_amd64.deb
sudo bash -c 'echo "deb http://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1804/x86_64 /" > /etc/apt/sources.list.d/cuda-machine-learning.list'
sudo dpkg -i nvidia-machine-learning-repo-*.deb
sudo apt-get update


# install cuda, cudnn, and tensorrt
#sudo apt-get install -y cuda=${CUDA_VERSION}-1
sudo apt-get install -y libcudnn7 libcudnn7-dev
sudo apt-get install libnvinfer7=${TRT_VERSION} libnvonnxparsers7=${TRT_VERSION} libnvparsers7=${TRT_VERSION} \
                     libnvinfer-plugin7=${TRT_VERSION} libnvinfer-dev=${TRT_VERSION} libnvonnxparsers-dev=${TRT_VERSION} \
                     libnvparsers-dev=${TRT_VERSION} libnvinfer-plugin-dev=${TRT_VERSION} python-libnvinfer=${TRT_VERSION} \
                     python3-libnvinfer=${TRT_VERSION} uff-converter-tf=${TRT_VERSION}
sudo apt-mark hold libnvinfer7 libnvonnxparsers7 libnvparsers7 libnvinfer-plugin7 libnvinfer-dev libnvonnxparsers-dev \
                   libnvparsers-dev libnvinfer-plugin-dev python-libnvinfer python3-libnvinfer uff-converter-tf

echo 'If everything worked fine, reboot now.'

