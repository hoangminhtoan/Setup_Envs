## Some useful linux commands

1. Add architecture with dpkg (E.g. "armhf")
```
sudo dpkg --add-architecture armhf
sudo apt update
```

2. Remove architecture with dpkg (E.g. "armhf")
```
sudo apt-get remove --purge `dpkg --get-selections | grep armhf | awk '{print $1}'`
sudo dpkg --remove-architecture armhf
sudo apt update
```

!Important

JetsonPakc 4.4.1 shiped with
* Opencv 4.1.1 (/usr/local/python3.6/dist-packages/cv2/python3.6...
* Opencv 4.1.1 or Pytorch only work well with numpy 1.16.1 (Upgrade numpy version will cause "Illegal instruction (core dumped)"

## References
* [JKJung's Blog](https://jkjung-avt.github.io/)
* [official tensorflow for jetson nano](https://forums.developer.nvidia.com/t/official-tensorflow-for-jetson-nano/71770)
