## Setup Working Environments
 * [Create Python Virtual Env](*create-python-virtual-env)
 * [Ubuntu](#ubuntu)
 * [Jetson Nano](#jetson-nano)
 

### Create Python Virtual Env
 Add the following code at the beginning of bash shell script
 ```
 env_name="<your env name>"
 echo "Create virtual environment"
 source `which virtualenvwrapper.sh`
 mkvirtualenv $env_name -p python3
 source $HOME/.virtualenvs/$env_name/bin/activate
 workon $env_name
 ```
 then run ```source <$your_file>.sh```

### Ubuntu
 * **OS info**
   ``` bash
   Version: 18.04
   Default Python2: 2.7
   Default Python3: 3.6.9
   ```
 * **Package requirements**

   | Packages         | Support            |
   |------------------|--------------------|
   | Tensorflow-GPU 2 | Cuda-Toolkit 10.1  |
   |                  | Python < 3.8       |
   | Miniconda-3      | Python >= 3.7      |
   |------------------|--------------------|
   |PyTorch v1.0      | torchvision v0.2.2 |
   |PyTorch v1.1      | torchvision v0.3.0 |
   |PyTorch v1.2      | torchvision v0.4.0 |
   |PyTorch v1.3      | torchvision v0.4.2 |
   |PyTorch v1.4      | torchvision v0.5.0 |
   |PyTorch v1.5      | torchvision v0.6.0 |
   |PyTorch v1.6      | torchvision v0.7.0 |

 * **Pip vs Conda**

   **1. Pip**

   **2. Conda**
     
     Require python >= 3.7

     **2.1. Install Python & switch python version**
      ```
      sudo add-apt-repository ppa:deadsnakes/ppa
      sudo apt update
      sudo apt install python<$version>
      ```
     **2.2. Swith python version by using <i>update-alternatives</i>**
      ```
      sudo update-alternatives --install /usr/bin/python python /usr/bin/python<version>  <priority order>
      ```

      For example, if you installed 5 python versions: 2.7, 3.5, 3.6, 3.7, and 3.8

      ```
      sudo update-alternatives --install /usr/bin/python python /usr/bin/python2.7 1
      sudo update-alternatives --install /usr/bin/python python /usr/bin/python3.5 2
      sudo update-alternatives --install /usr/bin/python python /usr/bin/python3.6 3
      sudo update-alternatives --install /usr/bin/python python /usr/bin/python3.7 4
      sudo update-alternatives --install /usr/bin/python python /usr/bin/python3.8 5
     ```
     then select python version you want to use
     ```
     sudo update-alternatives --config python
     ```

     **2.3 Install Miniconda-3**
      Follow instruction from offical webpage

### Jetson Nano
 * **OS info**
   ```
   Jetpack Version 4.3
   ```

   Jetson Nano use 4GB for swap file => you may need to increase swap file in order to run programms faster.

   run ```1.install_jetson.sh``` to increase swap memory

 * Install PyTorch
   Select the version of torchvision to download depending on the version of PyTorch that you have installed:

   ```
   under the 'vision' directory
   python -c "import torchvision" produced import err.
   However, uder the other directory, it doesn't
   ```
   

### References
 * [Installing OpenCV 4.1 on Ubuntu](https://cv-tricks.com/installation/opencv-4-1-ubuntu18-04/)
 * [Install Tensorflow-GPU on Ubuntu](https://www.tensorflow.org/install/source#tested_build_configurations)
 * [Installing Pytorch on JetsonNano](https://forums.developer.nvidia.com/t/pytorch-for-jetson-nano-version-1-6-0-now-available/72048)
 * [Installing Tensorflow on JetsonNano](https://docs.nvidia.com/deeplearning/frameworks/install-tf-jetson-platform-release-notes/tf-jetson-rel.html#tf-jetson-rel)