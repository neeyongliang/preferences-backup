使用 homebrew &替换国内源
------

#### 为何使用

homebrew 来时 linux 里的 apt-get 或者 yum, 是包管理机制.

#### 安装卸载

安装

`/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`

这步骤网络可能比较困难...耐心 ing

卸载

```
cd `brew --prefix`
rm -rf Cellar
brew prune
rm `git ls-files`
rm -r Library/Homebrew Library/Aliases Library/Formula Library/Contributions
rm -rf .git
rm -rf ~/Library/Caches/Homebrew
```

#### 使用方法

以[阿里源](https://opsx.alibaba.com/mirror) 为例, 我修改了部分路径

```shell
cd "$(brew --repo)"

git remote set-url origin https://mirrors.aliyun.com/homebrew/brew.git

cd "$(brew --repo)/Library/Taps/homebrew/homebrew-core"

git remote set-url origin https://mirrors.aliyun.com/homebrew/homebrew-core.git

brew tap homebrew/python

brew top homebrew/science

brew upgrade $FORMULA

brew update
```

#### 其他镜像
- 清华源：https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git
- 中科大源: http://mirrors.ustc.edu.cn/homebrew.git
- Coding 源: https://git.coding.net/homebrew/homebrew.git

替换 homebrew bottles 默认源(homebrew二进制包的源)

```shell
echo 'export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.aliyun.com\
/homebrew/homebrew-bottles' >> ~/.bashrc

sourch ~/.bashrc
```
除了上面的, 这里再提供两个:

[七牛源](http://ban.ninja/)

`http://7xkcej.dl1.z0.glb.clouddn.com`

[中科大源](https://lug.ustc.edu.cn/wiki/mirrors/help/homebrew-bottles)

`https://mirrors.ustc.edu.cn/homebrew-bottles`

#### 出现问题

问题 `/usr/local must be writable`

解决方法

```
sudo chown -R $(whoami) /usr/local
sudo chmod g+w /usr/local
```
这里 whoami 就是你主目录的名字

#### 还原设置
```
$ cd "$(brew --repo)"
$ git remote set-url origin https://github.com/Homebrew/brew.git
$ cd "$(brew --repo)/Library/Taps/homebrew/homebrew-core"
$ git remote set-url origin https://github.com/Homebrew/homebrew-core.git
```