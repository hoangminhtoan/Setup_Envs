echo "********** Update System **********"
sudo apt update
sudo apt upgrade

# !! You should install cuda driver in Software&Update -> Additional Driver -> NVIDIA driver...
# Some project run on old CUDA 9

# Step 1.
# Install gcc and g++ version 6 because ubuntu 18.04 and laters
# use gcc/g++ version 7++

sudo apt install gcc-6
sudo apt install g++-6

# Step 2.
# Update gcc/g++ mode
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-7 1
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-7 1
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-6 2
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-6 2

# switch version of gcc/g++
sudo update-alternatives --config gcc
# select mode for gcc

sudo update-alternatives --config g++
# select mode for g++

# Optional
# Remove gcc/g++
# Here <$Lib> is gcc or g++
# <$Version> is version of lib (i.e. 6, 7, 8, etc.)
# sudo update-alternatives --remove <$Lib> /us/bin/g<$Lib>-<$Version>


# Step 3.
# Install CUDA 9
# Must switch gcc/g++ to version 6 before installing CUDA 9

# Step 3.1
# Move to destination folder
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <Install Folder>"
    exit
fi
folder="$1"

# Step 3.2. Verify your gpu is cuda enable check
lspci | grep -i nvidia

# Step 3.3. Get the PPA repository driver
sudo add-apt-repository ppa:graphics-drivers/ppa

# Step 3.4. Install pre-requisites packages
# install other import packages
sudo apt-get install g++ freeglut3-dev build-essential libx11-dev libxmu-dev libxi-dev libglu1-mesa libglu1-mesa-dev

# Step 3.5. Download installation packages
cd $folder
echo "********** Dowloading CUDA 9 **********"
wget https://developer.nvidia.com/compute/cuda/9.0/Prod/local_installers/cuda_9.0.176_384.81_linux-run
wget https://developer.nvidia.com/compute/cuda/9.0/Prod/patches/1/cuda_9.0.176.1_linux-run
wget https://developer.nvidia.com/compute/cuda/9.0/Prod/patches/2/cuda_9.0.176.2_linux-run
wget https://developer.nvidia.com/compute/cuda/9.0/Prod/patches/3/cuda_9.0.176.3_linux-run
wget https://developer.nvidia.com/compute/cuda/9.0/Prod/patches/4/cuda_9.0.176.4_linux-run

sudo chmod a+x *.run
./cuda_9.0.176_384.81_linux.run
./cuda_9.0.176.1_linux.run
./cuda_9.0.176.2_linux.run
./cuda_9.0.176.3_linux.run
./cuda_9.0.176.4_linux.run

echo "********** Download Cuda Toolkit **********"
wget https://developer.nvidia.com/compute/machine-learning/cudnn/secure/7.6.4.38/Production/9.0_20190923/cudnn-9.0-linux-x64-v7.6.4.38.tgz
tar -xzvf
cd cudnn-9.0-linux-x64-v7.6.4.38/cuda
sudo mv lib64/* /usr/local/cuda-9.0/lib64/
sudo mv include/* /usr/local/cuda-9.0/include/

echo "********** Installation Complete **********"
echo "Reopen this terminal and check nvcc --version"