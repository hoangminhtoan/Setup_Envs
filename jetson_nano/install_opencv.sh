# run from terminal
# bash install_opencv4.3.sh <destination folder>

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <Install Folder> <Virtual Env>"
    exit
fi
folder="$1"
env_name="$2"

# put your username & password here
#user=""
#passwd=""


echo " Remove other OpenCV first"
sudo apt-get purge *libopencv*
sudo apt autoremove


echo " Install requirement packages"
sudo apt-get update
sudo apt-get install -y build-essential cmake git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev
sudo apt-get install -y libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev
sudo apt-get install -y python2.7-dev python3.6-dev python-dev python-numpy python3-numpy
sudo apt-get install -y libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libdc1394-22-dev
sudo apt-get install -y libv4l-dev v4l-utils qv4l2 v4l2ucp libxvidcore-dev libavresample-dev
sudo apt-get install -y libgtk-3-dev libcanberra-gtk3-module libatlas-base-dev gfortran
sudo apt-get install -y curl
sudo apt-get update


echo "** Download opencv-4.3.0 to" $folder
cd $folder
curl -L https://github.com/opencv/opencv/archive/4.3.0.zip -o opencv-4.3.0.zip
curl -L https://github.com/opencv/opencv_contrib/archive/4.3.0.zip -o opencv_contrib-4.3.0.zip
unzip opencv-4.3.0.zip
unzip opencv_contrib-4.3.0.zip
cd opencv-4.3.0/


echo " Apply patch"
sed -i 's/include <Eigen\/Core>/include <eigen3\/Eigen\/Core>/g' modules/core/include/opencv2/core/private.hpp
sed -i 's/{CUDNN_INCLUDE_DIR}\/cudnn.h/{CUDNN_INCLUDE_DIR}\/cudnn_version.h/g' cmake/FindCUDNN.cmake


echo " Building OpenCV ..."
mkdir build
cd build/
cmake -D CMAKE_BUILD_TYPE=RELEASE \
> -D WITH_CUDA=ON \
> -D CUDA_ARCH_PTX="" \
> -D CUDA_ARCH_BIN="5.3,6.2,7.2" \
> -D WITH_CUBLAS=ON \
> -D WITH_LIBV4L=ON \
> -D BUILD_opencv_python3=ON \
> -D BUILD_opencv_python2=ON \
> -D BUILD_opencv_java=OFF \
> -D WITH_GSTREAMER=OFF \
> -D WITH_GTK=ON \
> -D BUILD_TESTS=OFF \
> -D BUILD_PERF_TESTS=OFF \
> -D BUILD_EXAMPLES=OFF \
> -D OPENCV_ENABLE_NONFREE=ON \
> -D OPENCV_EXTRA_MODULES_PATH=../../opencv_contrib-4.3.0/modules \
> -D OPENCV_GENERATE_PKGCONFIG=YES ..
make -j$(nproc)
sudo make install
echo 'export PYTHONPATH=$PYTHONPATH:'$PWD'/python_loader/' >> ~/.bashrc
source ~/.bashrc


echo "** Install opencv-4.3.0 successfully"
echo "** Bye :)"