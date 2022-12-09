#!/usr/bash
# This script is for change ruby gem source to taobao in China.
# Dec.17, 2015 first release by https://github.com/yongliang
echo "===================Atten Before=============================="
echo "Install Progress will you openssl, and wget,please use homebrew install it"
echo "try finished command: brew install openssl wget"
echo "===================Ruby Version Manager======================"
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3

curl -L get.rvm.io | bash -s stable

# source bash
# source $HOME/.bashrc
# source $HOME/.bash_profile
# zsh
source $HOME/.zshrc

rvm pkg install zlib --verify-downloads 1
echo "Use the Ruby china rvm and rubygems repalced default? Enter yes or input other skip"
read use_ruby_china
if [ "use_ruby_china" == "" ]; then
    echo "===================Ruby Version Manager Mirror==================="
    echo "Try to use ruby china rvm mirrors..."
    os_type=`uname -a | awk '{print $1}'`
    export rvm_path=$HOME/.rvm
    echo "ruby_url=https://cache.ruby-china.org/pub/ruby" > ~/.rvm/user/db
    echo "Input you want get Ruby Version, check list and q to quit; default 2.5.1(Enter) or like x.x.x you like: "
    rvm list known
    read ruby_version

    rvm install ${ruby_version:-2.5.1}
    rvm use ${ruby_version:-2.5.1} --default
    echo "===================RubyGems Mirror==========================="
    gem sources --remove https://ruby.taobao.org
    gem sources --remove https://gems.ruby-china.org
    gem sources --add https://gems.ruby-china.com/ --remove https://rubygems.org/
    echo "please make sure only have ruby.ruby-china.org"
fi
gem sources -l
echo "usage like this: $ gem install rails"
echo "==================Ruby Develop Finished======================"
echo "Leave now? Enter quit or input other to install jekyll: "
read want_jekyll
if [ "$want_jekyll" == "" ]; then
    echo "END, HAVE FUN."
    exit 0
else
    echo "===================Jekyll on github=========================="
    gem install jekyll jekyll-paginate github-pages
    jekyll -v
    echo "if show jekyll not a command, add 'PATH=~/.rvm/gems/ruby-You_ruby_version/bin:\$PATH#for jekyll'\
 in .bashrc last and donnot forget source it"
    echo "cd you github.io dirctory, try run to 'jekyll server' "
echo "END, HAVE FUN."
fi
exit 0
