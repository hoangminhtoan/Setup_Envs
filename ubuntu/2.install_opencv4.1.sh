echo "************* Installing OpenCV 4.1.0 *************"

sudo apt-get update -y # Update the list of packages
sudo apt-get remove -y x264 libx264-dev # Remove the older version of libx264-dev and x264

sudo apt-get install -y build-essential checkinstall cmake pkg-config yasm


sudo apt-get install -y git gfortran curl

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
sudo apt-get install -y python-dev python-pip python3-dev python3-pip

sudo -H pip2 install -U pip numpy

sudo -H pip3 install -U pip numpy

echo "************* Installing Virtual Environment *************"
sudo pip2 install virtualenv virtualenvwrapper
sudo pip3 install virtualenv virtualenvwrapper


echo "************* Create Virtual Environment *************"
echo "# Virtual Environment Wrapper"  >> ~/.bashrc
echo "source /usr/local/bin/virtualenvwrapper.sh" >> ~/.bashrc
source ~/.bashrc

echo "************* Create Python3 Virutal Environment *************"
mkvirtualenv py3 -p python3

echo "************* Installing OpenCV 4.1.0 *************"
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <Install Folder>"
    exit
fi
folder="$1"

echo "************* Download OpenCV from Github *************"
cd $folder
git clone https://github.com/opencv/opencv.git
cd opencv
git checkout 4.1.0
cd ..

git clone https://github.com/opencv/opencv_contrib.git
cd opencv_contrib
git checkout 4.1.0
cd ..

cd opencv
mkdir build && cd build
cmake -D CMAKE_BUILD_TYPE=RELEASE \
      -D CMAKE_INSTALL_PREFIX=/usr/local \
      -D INSTALL_C_EXAMPLES=ON \
      -D INSTALL_PYTHON_EXAMPLES=ON \
      -D WITH_TBB=ON \
      -D WITH_V4L=ON \
      -D WITH_QT=ON \
      -D WITH_OPENGL=ON \
      -D OPENCV_EXTRA_MODULES_PATH=../../opencv_contrib/modules \
      -D BUILD_EXAMPLES=ON \
      -D OPENCV_ENABLE_NONFREE=ON \
      -D OPENCV_GENERATE_PKGCONFIG=YES ..

make -j8
sudo make install
sudo sh -c 'echo "/usr/local/lib" >> /etc/ld.so.conf.d/opencv.conf'
sudo ldconfig

echo "************* Show Installed OpenCV location *************"
find /usr/local/lib/ -type f -name "cv2*.so"

########### For Python 2 ############
#cd ~/.virtualenvs/facecourse-py2/lib/python2.7/site-packages
#ln -s /usr/local/lib/python2.7/dist-packages/cv2.so cv2.so
 
############ For Python 3 ############
#cd ~/.virtualenvs/facecourse-py3/lib/python3.6/site-packages
#ln -s /usr/local/lib/python3.6/dist-packages/cv2.cpython-36m-x86_64-linux-gnu.so cv2.so