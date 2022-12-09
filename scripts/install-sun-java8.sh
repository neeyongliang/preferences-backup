#!/bin/sh
#maybe you are using bash,fix the first line.
# Program:
#    install java sun, chmod +x install_sun_java.sh
#    shoud use root run this shellscript after download sunjdk already!
#History:
#2016/09/01  yongliang First release
#last update

mkdir -p /usr/lib/jvm

cd ~/Downloads

mv jdk*.tar.gz java-8-sun.tar.gz
tar -xvzf java-8-sun.tar.gz -C $HOME/Downloads
mv jdk* java-8-sun

sudo mv java-8-sun /usr/lib/jvm

# maybe need edit bash_rc, add follow contents:
# export JAVA_HOME=/usr/lib/jvm/java-8-sun
# export JRE_HOME=${JAVA_HOME}/jre
# export CLASSPATH=.:${JAVA_HOME}/lib:${JRE_HOME}/lib
# export PATH=${JAVA_HOME}/bin:$PATH
# source ./bash_rc

sudo update-alternatives --install /usr/bin/java java /usr/lib/jvm/java-8-sun/bin/java 300
sudo update-alternatives --install /usr/bin/javac javac /usr/lib/jvm/java-8-sun/bin/javac 300
sudo update-alternatives --install /usr/bin/jar jar /usr/lib/jvm/java-8-sun/bin/jar 300
sudo update-alternatives --install /usr/bin/javah javah /usr/lib/jvm/java-8-sun/bin/javah 300
sudo update-alternatives --install /usr/bin/javap javap /usr/lib/jvm/java-8-sun/bin/javap 300
sudo update-alternatives --config java

# test
java -version
