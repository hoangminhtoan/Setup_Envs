echo "************* Installing OpenCV 4.1.0 *************"

echo "********** Dowloading Packages **********"
# Download OpenCV from Github
git clone https://github.com/opencv/opencv.git
cd opencv
git checkout 4.1.0
cd ..
 
# Download OpenCV_contrib from Github
git clone https://github.com/opencv/opencv_contrib.git
cd opencv_contrib
git checkout 4.1.0
cd ..

# Activate python virtual environments
workon py2     # For Python 2
workon py3     # For Python 3

cd opencv
sudo rm -rf build
mkdir build && cd build
cmake -D CMAKE_BUILD_TYPE=RELEASE \
      -D CMAKE_INSTALL_PREFIX=/usr/local \
      -D INSTALL_C_EXAMPLES=OcN \
      -D INSTALL_PYTHON_EXAMPLES=ON \
      -D WITH_TBB=ON \
      -D WITH_V4L=ON \
      -D WITH_QT=ON \
      -D WITH_OPENGL=ON \
      -D WITH_CUDA=ON \
      -D ENABLE_FAST_MATH=1 \
      -D CUDA_FAST_MATH=1 \
      -D WITH_CUBLAS=1 \
      -D WITH_GTK=ON \
      -D CUDA_TOOLKIT_ROOT_DIR=/usr/local/cuda \
      -D CUDA_ARCH_BIN='3.0 3.5 5.0 6.0 6.2 7.0 7.5' \
      -D OPENCV_EXTRA_MODULES_PATH=../../opencv_contrib/modules \
      -D BUILD_EXAMPLES=ON \
      -D OPENCV_ENABLE_NONFREE=ON \
      -D OPENCV_GENERATE_PKGCONFIG=YES ..

cmake --build . --parallel 12
make -j$(nproc)
sudo make install
sudo sh -c 'echo "/usr/local/lib" >> /etc/ld.so.conf.d/opencv.conf'
sudo ldconfig

echo "************* Show Installed OpenCV location *************"
# Add the following 2 lines at the end of the file i.e. copy the following lines at the end of .bashrc file.
echo "# OpenCV"  >> ~/.bashrc
echo " export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/local/lib/pkgconfig"  >> ~/.bashrc
#source ~/.bashrc

find /usr/local/lib/ -type f -name "cv2*.so"
