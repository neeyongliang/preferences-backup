#! /bin/bash
# Program:
# 	Run this shell script after install oh-my-zsh
# History:
# 	2019/01/14 yongliang first release

echo "Check oh-my-zsh installed..."
if [ ! -d "$HOME/.oh-my-zsh" ]; then
	echo "oh-my-zsh not installed."
	exit 2
fi

echo "First, git clone some plugins."
cd ~/.oh-my-zsh/custom/plugins
git clone https://github.com/zsh-users/zsh-autosuggestions.git
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
git clone https://github.com/zsh-users/zsh-completions.git

echo "Second, install some package"
sudo apt install autojump

echo "Now, change .zshrc, add following line to .zshrc plugins=(git XXX)\n"
echo "zsh-autosuggestions zsh-syntax-highlighting zsh-completions"

echo "Don't forget source ~/.zshrc after all done."

