#!/bin/sh
# Program:
#   Run this shell script after install gnome-shell.
# History:
#   2019/01/30  yongliang First release
echo "Install packages..."
sudo apt install arc-theme git gnome-tweaks
echo "Install packages end"

echo "Clone icons"
if [ ! -e "$HOME/Github" ];then
	echo "no category, make it."
	mkdir -p $HOME/Github
fi

cd $HOME/Github
git clone https://gitlab.com/LinxGem33/Arc-X-Icons
echo "Clone end"
