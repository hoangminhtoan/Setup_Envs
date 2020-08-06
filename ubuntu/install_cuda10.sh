# !! Tensorflow 2.x.x now only supports until cuda 10.1
# Check README file
# Move to destination folder
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <Install Folder>"
    exit
fi
folder="$1"

echo "************* Installing Cuda 10.1 *************"
cd $folder

wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/cuda-ubuntu1804.pin
sudo mv cuda-ubuntu1804.pin /etc/apt/preferences.d/cuda-repository-pin-600
wget http://developer.download.nvidia.com/compute/cuda/10.1/Prod/local_installers/cuda-repo-ubuntu1804-10-1-local-10.1.243-418.87.00_1.0-1_amd64.deb
sudo apt-get install build-essential dkms
sudo apt-get install freeglut3 freeglut3-dev libxi-dev libxmu-dev
sudo dpkg -i cuda-repo-ubuntu1804-10-1-local-10.1.243-418.87.00_1.0-1_amd64.deb
sudo apt-key add /var/cuda-repo-10-1-local-10.1.243-418.87.00/7fa2af80.pub
sudo apt-get update
sudo apt-get install cuda

echo "************* Copy CuDNN libs to Cuda10.1 *************"
wget https://developer.nvidia.com/compute/machine-learning/cudnn/secure/7.6.5.32/Production/10.0_20191031/cudnn-10.0-linux-x64-v7.6.5.32.tgz
tar -xvf
cd cudnn-10.1-linux-x64-v7.6.5.32/cuda
sudo cp include/* /usr/local/cuda-10.1/include/
sudo cp lib64/* /user/local/cuda-10.1/lib64/

echo "************* Configuring CUDA libs *************"
sudo ln -sf /usr/local/cuda-10.1/targets/x86_64-linux/lib/libcudnn.so.7.0.5 /usr/local/cuda-10.1/targets/x86_64-linux/lib/libcudnn.so.7
sudo ldconfig

echo "************* Adding CUDA Path *************"
echo "# Add CUDA Path" >> ~/.bashrc
echo "export PATH=$PATH:/usr/local/cuda/bin" >> ~/.bashrc
echo "export CUDADIR=/usr/local/cuda" >> ~/.bashrc
echo "export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda/lib64:/usr/local/cuda/extras/CUPTI/lib64" >> ~/.bashrc
source ~/.bashrc

