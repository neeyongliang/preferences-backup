#!/bin/bash
# Program:
#	Run this shell script after Install Ubuntu.
#History:
# 2016/10/29  yongliang First release
# 2018/10/18  update
# 2022/12/04  rewrite

echo " Now, Init my workspace..."

createDir() {
    if [ ! -d "$1" ]; then
        mkdir "$1"
    fi
}

echo "################# Create folders #################"
cd ~ || exit 1
createDir Github
createDir Workspace
createDir Softare

echo "################# Custom choose #################"
isUpdate=0
read -r -p "Do you want run apt update?[N/Y]" ch
case $ch in
Y|y)
    isUpdate="1"
;;
esac

isRemoveOld="0"
read -r -p "Do you want remove useless package?[N/Y]" ch
case $ch in
Y|y)
    isRemoveOld="1"
;;
esac

isSublime="1"
read -r -p "Do you want install sublime text?[N/Y]" ch
case $ch in
N|n)
isSublime="0"
;;
esac

isQemu="0"
read -r -p "Do you want install qemu?[N/Y]" ch
case $ch in
Y|y)
isQemu="1"
;;
esac

isOhmyzsh="1"
read -r -p "Do you want install oh my zsh?[N/Y]" ch
case $ch in
N|n)
isOhmyzsh="0"
;;
esac

isQt5="1"
read -r -p "Do you want install Qt5?[N/Y]" ch
case $ch in
N|n)
isQt5="0"
;;
esac

isRust="0"
read -r -p "Do you want install rust?[N/Y]" ch
case $ch in
y|Y)
isRust="1"
;;
esac

# echo "DEBUG: $isUpdate, $isRust, $isQt5, $isSublime, $isQemu, $isOhmyzsh"

echo "################# Install packages #################"
if [[ "$isUpdate" == "1" ]]; then
    sudo apt update
    echo "Instal wget, curl, apt-transport-https, gpg2..."
    sudo apt install -y wget curl apt-transport-https gpg2 > /dev/null
    echo "Add vscode repo..."
    wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
    echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vs-code.list
    if [[ "$isSublime" == "1" ]]; then
        echo "Add sublime repo..."
        wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/sublimehq-archive.gpg > /dev/null
        echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
    fi
    sudo apt update > /dev/null
else
    echo "skip update..."
    sudo apt install -y wget curl apt-transport-https gpg2 > /dev/null
fi

if [[ "$isRemoveOld" == "1" ]]; then
    echo "remove old..."
    sudo apt remove -y libreoffice-common unity-webapps-common thunderbird \
    totem rhythmbox empathy brasero simple-scan gnome-mahjongg aisleriot \
    gnome-mines cheese transmission-common gnome-orca webbrowser-app gnome-sudoku \
    deja-dup > /dev/null
else
    echo "skip remove old..."
fi

sudo apt install -y git meld devhelp autojump \
zsh unrar-free exuberant-ctags fonts-noto-cjk \
screenfetch gitk unrar vim cmake lnav ttf-mscorefonts-installer \
shellcheck fonts-firacode fonts-cascadia-code code \
dpkg-dev gcc g++ build-essential d-feet dconf-editor meson > /dev/null

rm /etc/apt/sources.list.d/vs-code.list

if [[ "$isSublime" == "1" ]]; then
    echo "Install sublime text..."
    sudo apt install -y sublime-text
fi

if [[ "$isOhmyzsh" == "1" ]]; then
    echo "Install ohmyzsh..."
    sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
fi

if [[ "$isQemu" == "1" ]]; then
    echo "Install qemu..."
    sudo apt install -y qemu qemu-user-static qeum-system-x86
fi

if [[ "$isQt5" == "1" ]]; then
    echo "Install Qt5..."
    sudo apt install -y qtcreator qt5-doc-html qt5-assistant qt5-doc \
    qttools5-dev-tools qt5-default > /dev/null
fi

if [[ "$isRust" == "1" ]]; then
    echo "Install rust..."
    sudo apt install -y cargo
fi

echo "################### Clone backups ###################"
cd ~/Github || exit 2
git clone git@gitee.com:neeyongliang/perferences-fonts.git
git clone git@gitee.com:neeyongliang/perferences-backup.git

echo "################### Install scripts ###################"
sudo apt install -y python3-pip python3-dev python3-setuptools \
python-setuptools python2-pip python2-dev python3-doc python2-doc > /dev/null
echo "pip3..."
sudo pip3 install thefuck flake8
# echo "pip2..."
# sudo pip install --upgrade pip==20.3
