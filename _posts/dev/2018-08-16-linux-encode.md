---
published: true
author: Ybin
layout: post
title: Linux 系统中的编码问题
categories: 开发
summary:
comment: true
tags:
  - dev
---
`文/邹耀斌`

#### 问题

刚刚在 Linux 部署的时候出现了，查看系统日志文件的时候，发现打印日志中的中文全部都是乱码，然后打开其他非部署的文件，打开也是会出现乱码，从 ftp 工具下载下来查看，结果是正常的。

#### 解决

不是项目部署的编码问题，而是 Linux 环境全局编码问题。

通过搜索，网上给出了几种设置方法。通过修改配置文件进行设置。本文以 CentOS release 6.4 为例。

如果不知道 Linux 版本，可以输入命令查询：

```shell
lsb_release -a
```

首先确定系统中是否包含中文编码包，可以输入命令查询：

```shell
locale -a
```

如果其中包含了`zh_CN.UTF-8`或`zh_CN.utf8` 就是已经安装好了，如果没有找到，你需要进行安装，输入命令：

```shell
yum groupinstall chinese-support
```

---

修改系统配置文件`/etc/sysconfig/i18n`，以下为中文环境和英文环境配置。

中文：

```java
LANG="zh_CN.GB18030"    
LANGUAGE="zh_CN.GB18030:zh_CN.GB2312:zh_CN"    
SUPPORTED="zh_CN.GB18030:zh_CN:zh:en_US.UTF-8:en_US:en"    
SYSFONT="lat0-sun16
```

英文：

```
LANG="en_US"    
LANGUAGE="en_US"    
SUPPORTED="zh_CN.GB18030:zh_CN:zh:en_US.UTF-8:en_US:en"    
SYSFONT="lat0-sun16"    
SYSFONTACM="8859-15" 
```

修改完了，网上有的说需要重新启动，其实可以使用`source` 命令来进行生效：

```shell
source /etc/sysconfig/i18n
```

然后你可以打开文件看一下，是否乱码。或者你直接输入`ll`命令测试查看是否有变化。

如果你成功修改了，那就恭喜你了。



但是我这边就没有生效，反而是乱码更乱了，通过大量的查询，发现问题可能不是 Linux 环境编码问题，而是我的连接工具编码显示问题，当我输入中文在命令行时，中文会被解析成 ...  

终于在一篇文章中找到，修改连接工具的编码格式。我是用的连接工具是「Putty」，你可以登录进去之后，点击窗口左上方 logo，依次选择：

```
Change Settings -> Window -> Translation -> Remote character set
```

在下拉选项中选择 UFT-8 ，或者你配置的编码格式，然后再登录进去看一看，结果中文显示正常了，你高兴的打了个响指。

#### 写在后面

解决问题的关键点是分析问题，从而定位问题，当然我在环境配置那里折腾了不少时间，但是最终找到了问题，心情还是些许愉悦的，最近听到一句励志语分享下：

```
你付出十倍努力得到的结果，对于别人来说都是轻而易举的，你还那么努力干什么？
因为你付出了十倍的努力，最终收获的也将是十倍的快乐。：）
```



成都 - 多云











