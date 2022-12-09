vim install
------

### About VIM

[Project](http://www.vim.org/)

[Github](https://github.com/vim/vim)

### VIM install

|types\OS|windows|Ubuntu|Mac|
|:-------------:|:-------------:|:-------------:|:-------------:|
|gVIM|√|√|√|
|Source Code|√|√|√|
|binary packages|√|√|×|
|macVim|×|×|√|

### Compile

- in Mac

```shell
    brew install vim --with-lua --with-override-system-vi \
    --with-python --with-python@2 --with-termguicolors
```

- use Source code

    1. 卸载系统自带的vim.
    ```
    sudo apt-get remove vim vim-runtime  vim-tiny vim-common vim-gui-common
    sudo apt-get purge vim vim-runtime  vim-tiny vim-common vim-gui-common
    或
    sudo apt-get autoremove vim vim-runtime  vim-tiny vim-common vim-gui-common --purge
    ```
    2. 安装依赖文件。
    
    ```
    sudo apt-get install luajit libluajit-5.1 libncurses5-dev libgnome2-dev \
    libgnomeui-dev libgtk2.0-dev libatk1.0-dev libbonoboui2-dev libcairo2-dev \
    libx11-dev libxpm-dev libxt-dev python-dev ruby-dev mercurial python3-dev
    ```
    3. 下载vim代码。
    ```
    Ubunu/Debian:apt-get source vim
    Other:https://github.com/vim/vim
    ```

    4. 编译安装。
    ```
    cd vim/src/

    ./configure --prefix=/usr/local \
                --with-features=huge \
                --enable-fail-if-missing \
                --enable-fontset \
                --enable-gui=auto \
                --enable-gnome-check \
                --enable-multibyte \
                --enable-pythoninterp=yes \
                --enable-python3interp=yes \
                --enable-xim \
                --with-x \
                --with-vim-name=vi \
                --with-compiledby=$USER
           

    make VIMRUNTIMEDIR=/usr/local/share/vim/vim80 && sudo make install

    sudo ln -s /usr/local/bin/vi /usr/bin/vi
    sudo ln -s /usr/local/bin/vi /usr/bin/vim

    sudo update-alternatives --install /usr/bin/editor editor /usr/bin/vim 1
    sudo update-alternatives --set editor /usr/bin/vim
    sudo update-alternatives --install /usr/bin/vi vi /usr/bin/vim 1
    sudo update-alternatives --set vi /usr/bin/vim

    ```

需要重新配置可 输入 `# make distclean `清理一下上一次编译生成的所有文件

### Q & A

**Q**: error while loading shared libraries: libgnomeui-2.so.0: cannot open shared object file: No such file or directory

**A**: sudo apt-get install libgnomeui-0

