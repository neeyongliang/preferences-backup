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
isSublime=0
isVScode=0
read -r -p "Do you want run apt update?[N/Y]" ch
case $ch in
Y|y)
    isUpdate="1"
    read -r -p "Do you want install vscode?[N/Y]" ch
    case $ch in
    Y|y)
    isVScode="1"
    ;;
    esac

    read -r -p "Do you want install sublime text?[N/Y]" ch
    case $ch in
    Y|y)
    isSublime="1"
    ;;
    esac
;;
esac

isRemoveOld="0"
read -r -p "Do you want remove useless package?[N/Y]" ch
case $ch in
Y|y)
    isRemoveOld="1"
;;
esac

isQemu="0"
read -r -p "Do you want install qemu?[N/Y]" ch
case $ch in
Y|y)
isQemu="1"
;;
esac

isQt5="0"
read -r -p "Do you want install Qt5?[N/Y]" ch
case $ch in
Y|y)
isQt5="1"
;;
esac

isRust="0"
read -r -p "Do you want install rust?[N/Y]" ch
case $ch in
y|Y)
isRust="1"
;;
esac

# echo "DEBUG: $isUpdate, $isRust, $isQt5, $isSublime, $isQemu, $isVScode"

echo "################# Install packages #################"
if [[ "$isUpdate" == "1" ]]; then
    apt update
    echo "Instal wget, curl, apt-transport-https, gpg2..."
    apt install -y wget curl apt-transport-https gnupg2
    if [[ "$isVScode" == "1" ]]; then
        echo "Add vscode repo..."
        wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | apt-key add -
        echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vs-code.list
    fi

    if [[ "$isSublime" == "1" ]]; then
        echo "Add sublime repo..."
        wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | gpg --dearmor | tee /etc/apt/trusted.gpg.d/sublimehq-archive.gpg
        echo "deb https://download.sublimetext.com/ apt/stable/" | tee /etc/apt/sources.list.d/sublime-text.list
    fi
    apt update
else
    echo "skip update..."
    apt install -y wget curl apt-transport-https gnupg2
fi

if [[ "$isRemoveOld" == "1" ]]; then
    echo "remove old..."
    apt remove -y unity-webapps-common \
    totem rhythmbox empathy simple-scan gnome-mahjongg aisleriot \
    gnome-mines cheese transmission-common gnome-orca webbrowser-app gnome-sudoku \
    deja-dup
else
    echo "skip remove old..."
fi

apt install -y git meld devhelp autojump \
zsh unrar-free exuberant-ctags fonts-noto-cjk \
screenfetch gitk unrar vim cmake lnav ttf-mscorefonts-installer \
shellcheck fonts-firacode fonts-cascadia-code code \
dpkg-dev gcc g++ build-essential d-feet dconf-editor meson

rm /etc/apt/sources.list.d/vs-code.list

if [[ "$isSublime" == "1" ]]; then
    echo "Install sublime text..."
    apt install -y sublime-text sublime-merge
fi

if [[ "$isQemu" == "1" ]]; then
    echo "Install qemu..."
    apt install -y qemu qemu-user-static
fi

if [[ "$isQt5" == "1" ]]; then
    echo "Install Qt5..."
    apt install -y qtcreator qt5-doc-html qt5-assistant qt5-doc \
    qttools5-dev-tools qt5-default
fi

if [[ "$isRust" == "1" ]]; then
    echo "Install rust..."
    apt install -y cargo
fi

echo "################### Clone backups ###################"
cd ~/Github || exit 2
git clone https://gitee.com/neeyongliang/perferences-fonts.git
git clone https://gitee.com/neeyongliang/perferences-backup.git

echo "################### Install scripts ###################"
apt install -y python3-pip python3-dev python3-setuptools \
python-setuptools python2-pip python2-dev python3-doc python2-doc
echo "pip3..."
pip3 install thefuck flake8
# echo "pip2..."
# pip install --upgrade pip==20.3


