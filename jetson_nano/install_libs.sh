# From now on I will install all packages on virtual envs
# You should activate your envs before running following commands

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <Install Folder> <Virtual Env>"
    exit
fi
folder="$1"
env_name="$2"

echo "********** Create Virtual Environment **********"
echo "Create virtual environment"
source `which virtualenvwrapper.sh`
mkvirtualenv $env_name -p python3
source $HOME/.virtualenvs/$env_name/bin/activate
workon $env_name

echo "********* Install essential python packages **********"
pip install -U pip numpy scipy matplotlib scikit-learn scikit-image pandas ipython jupyter
pip install Cython PyQt5

echo "********** Install OpenCV **********"

./install_opencv.sh $folder $env_name

echo "********* Installing Pytorch ***********"
cd $folder
# For Python 2.7
#wget https://nvidia.box.com/shared/static/1v2cc4ro6zvsbu0p8h6qcuaqco1qcsif.whl -O torch-1.4.0-cp27-cp27mu-linux_aarch64.whl
#sudo apt-get install libopenblas-base libopenmpi-dev 
#pip install future torch-1.4.0-cp27-cp27mu-linux_aarch64.whl

# For Python 3.6
# Check pytorch and torchversion in README
wget https://nvidia.box.com/shared/static/ncgzus5o23uck9i5oth2n8n06k340l6k.whl -O torch-1.1.0-cp36-cp36m-linux_aarch64.whl
pip apt-get install python3-pip libopenblas-base libopenmpi-dev 
pip install Cython
pip install numpy torch-1.1.0-cp36-cp36m-linux_aarch64.whl

echo "********* Installing TorchVision ***********"
sudo apt-get install libjpeg-dev zlib1g-dev
git clone --branch v0.8.1 https://github.com/pytorch/vision torchvision   # see below for version of torchvision to download
cd torchvision
python setup.py install
cd ../  # attempting to load torchvision from build dir will result in import error
pip install 'pillow<7' # always needed for Python 2.7, not needed torchvision v0.5.0+ with Python 3.6


echo "********* Installing Tensorflow ***********"
sudo apt-get update
sudo apt-get install libhdf5-serial-dev hdf5-tools libhdf5-dev zlib1g-dev zip libjpeg8-dev liblapack-dev libblas-dev gfortran
pip install -U numpy grpcio absl-py py-cpuinfo psutil portpicker six mock requests gast h5py astor termcolor protobuf keras-applications keras-preprocessing wrapt google-pasta setuptools testresources
pip install --extra-index-url https://developer.download.nvidia.com/compute/redist/jp/v43 tensorflow-gpu==2.0.2+nv20.1
