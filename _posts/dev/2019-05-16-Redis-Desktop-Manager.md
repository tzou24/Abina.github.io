---
published: true
author: YaoBin Zou
layout: post
title: Redis Desktop Manager 安装
categories: 开发
summary:
comment: true
tags:
  - dev
---
`文/邹耀斌`

![https://s2.ax1x.com/2019/04/29/E1lVQP.png](https://s2.ax1x.com/2019/04/29/E1lVQP.png)

### Redis Desktop Manager
是一款 Redis 数据库可视化管理工具, 目前官网最新的已经开始收费, 但是在旧版本中还是没有收费的.这样我们可以先下载旧版本,不升级就可以使用了.

### 旧版本
可以在 Github 中找到已发布的版本,可以选择 [0.9.3](https://github.com/uglide/RedisDesktopManager/releases) , windows 下载 exe文件.

###  0xc000007b 程序错误
在安装失败或者安装成功后出现程序错误,错误码为`0xc000007b`, 这里需要你下载 Visual C++ Redistributabl, C++ 语言运行环境. [官网](https://www.microsoft.com/zh-CN/download/details.aspx?id=48145) 中有提供,选择 `vc_redist.x86.exe` ,运行安装, 然后再打开 `Redis Desktop Manager.exe`  就正常了。
