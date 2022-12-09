PIP 国内镜像源
------
first release: Dec.14, 2015
last update: Dec.09,2022
## Description
PIP 国内镜像源
## Usage
mkdir ~/.pip
touch ~/.pip/pip.conf

## Content

阿里源

```sh
[global]
index-url = http://mirrors.aliyun.com/pypi/simple/
[install]
trusted-host = mirrors.aliyun.com
```

清华源
```sh
[global]
index-url = https://pypi.tuna.tsinghua.edu.cn/simple
[install]
trusted-host = pypi.tuna.tsinghua.edu.cn
```


豆瓣源
```sh
[global]
index-url = http://pypi.douban.com/simple
[install]
trusted-host = pypi.douban.com
```

