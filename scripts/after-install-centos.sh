#!/bin/sh
# Program:
#	Run this shell script after Install Ubuntu.
# History:
# 2019/10/30  yongliang First release
# may be should install from source if you frequent install system：
#  sublime, vscode
echo "Now, install some package..."
sudo yum install -y vim git make
sudo yum install -y gcc rpm-build rpm-devel \
rpmlint make python2 bash coreutils diffutils \
patch rpmdevtools meson cmake3 python3 zsh\
epel-rpm-macros devhelp meld gitk

if [ ! -f "$HOME/.rpmmacros" ];then
	echo "Now, add ~/.rpmmacros example"
	echo "%_topdir %(echo \`pwd\`)" >> ~/.rpmmacros
	echo "%packager Ni Yongliang<yongliang@cpu-os.ac.cn>" >> ~/.rpmmacros
else
	cat ~/.rpmmacros
fi

echo "Add for Sublime Text"
sudo rpm -v --import https://download.sublimetext.com/sublimehq-rpm-pub.gpg

echo "Add for Sublime Merge"
sudo rpm -v --import https://download.sublimetext.com/sublimehq-rpm-pub.gpg

echo "Add for Sublime Repo"
sudo yum-config-manager --add-repo https://download.sublimetext.com/rpm/stable/x86_64/sublime-text.repo

echo "Addo for VSCode"
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'

sudo yum makecache
sudo yum install sublime-text sublime-merge code
