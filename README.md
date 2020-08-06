## Setup Working Environments
 * [Ubuntu](#ubuntu)
 * [Jetson Nano](#jetson-nano)



### Ubuntu
 * OS info:
   ```
   Version: 18.04
   Default Python2: 2.7
   Default Python3: 3.6.9
   ```
  * Package requirements

  | Package          | Support          |
  |------------------|------------------|
  | Tensorflow-GPU 2 | Cuda-Toolkit 10.1|
  |                  | Python < 3.8     |
  | Miniconda-3      | Python >= 3.7    |

  * Pip vs Conda
   1. Pip

   2. Conda

    Require python >= 3.7

    2.1. Install Python & switch python version
    ```
    sudo add-apt-repository ppa:deadsnakes/ppa
    sudo apt update
    sudo apt install python<$version>
    ```
    2.2. Swith python version by using **update-alternatives**
    ```
    sudo update-alternatives --install /usr/bin/python python /usr/bin/python<version> <priority order>
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

   2.3 Install Miniconda-3
    Follow instruction from offical webpage

### Jetson Nano
 * OS info:
   ```
   Jetpack Version 4.3
   ```


### References
 * [Installing OpenCV 4.1 on Ubuntu](https://cv-tricks.com/installation/opencv-4-1-ubuntu18-04/)
 * 