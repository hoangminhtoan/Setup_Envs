echo "*********** Installing JAVA ***********"
VERSION="jdk15.0.1" # Change to your jdk version here

cd Libs
tar zxf jdk-15.0.1_linux-x64_bin.tar.gz
sudo mkdir -p /usr/lib/jvm/$VERSION
sudo mv $VERSION/* /usr/lib/jvm/$VERSION/
rm -rf $VERSION
sudo update-alternatives --install "/usr/bin/java" "java" "/usr/lib/jvm/$VERSION/bin/java" 1
sudo update-alternatives --install "/usr/bin/javac" "javac" "/usr/lib/jvm/$VERSION/bin/javac" 1
#sudo update-alternatives --install "/usr/bin/javaws" "javaws" "/usr/lib/jvm/jdk15/bin/javaws" 1

echo "********** Add JDK Path to .bashrc **********"
echo "# Add Java Path"  >> ~/.bashrc
echo "export JAVA_HOME=/usr/lib/jvm/$VERSION" >> ~/.bashrc
echo "export PATH=$PATH:$HOME/bin:$JAVA_HOME/bin" >> ~/.bashrc
