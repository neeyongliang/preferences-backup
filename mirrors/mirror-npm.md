TAOBAO NPM
------
### 使用方法

你可以使用我们定制的 cnpm (gzip 压缩支持) 命令行工具代替默认的 npm:

> $ sudo npm install -g cnpm --registry=https://registry.npm.taobao.org

或者你直接通过添加 npm 参数 alias 一个新命令:
```
alias cnpm="npm --registry=https://registry.npm.taobao.org \
--cache=$HOME/.npm/.cache/cnpm \
--disturl=https://npm.taobao.org/dist \
--userconfig=$HOME/.cnpmrc"
# Or alias it in .bashrc or .zshrc
$ echo -e '\n#alias for cnpm\nalias cnpm="npm --registry=https://registry.npm.taobao.org \
  --cache=$HOME/.npm/.cache/cnpm \
  --disturl=https://npm.taobao.org/dist \
  --userconfig=$HOME/.cnpmrc"' >> ~/.zshrc
 $ source ~/.zshrc
```

对于超级用户：
> $ sudo ln -s /usr/local/node/bin/cnpm /usr/local/bin/cnpm

或者直接把 `/usr/local/node/bin` 加入系统 PATH 环境变量里去。



### 安装模块

从 `registry.npm.taobao.org` 安装所有模块，当安装的时候发现安装的模块还没有同步过来。

淘宝 NPM 会自动在后台进行同步, 并且会让你从官方NPM源`registry.npmjs.org`进行安装。

下次你再安装这个模块的时候, 就会直接从淘宝NPM安装了。

> $ cnpm install [name]

### 同步模块

直接通过 sync 命令马上同步一个模块, 只有 cnpm 命令行才有此功能:

> $ cnpm sync connect

当然, 你可以直接通过 web 方式来同步: /sync/connect

> $ open https://npm.taobao.org/sync/connect

### 其它命令

支持 npm 除了 publish 之外的所有命令, 如:

> $ cnpm info connect

### 超级用户支持