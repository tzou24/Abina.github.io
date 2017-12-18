---
published: true
author: Robin Wen
layout: post
title: "运维工程师指北"
category: Linux
comments: no
summary: "应网友邀请，写的运维工程师参考。目前运维工程师现状：国内一线城市紧缺，特别是互联网公司。小公司的运维工程师负责事情较多，基本上服务器沾边的工作都是你在做。大公司的运维人才要求较高。当然，国内的运维人才很难符合企业的实际要求，人才分布符合二八原则，大多数的人技术平庸，很多都源自培训机构。还有一个不争的事实，那大部分的人期望的工资远远高于他能为公司创造的价值。可以这样说，国内大多数的运维人才都处于一个较低的层次，他们会写脚本，会做一些基础工作，但基本上都是照葫芦画瓢，看文档，找参考，而没有去挖掘底层或者更上层的东西。"
tags:
- Linux
- 运维工程师
- 技能
- 博客
- 书籍
---

## 目录 ##
***

* Table of Contents
{:toc}

`文/温国兵`

### 工作内容 ###
***

**基础运维工程师**

* 负责日常网络及各子系统管理维护;
* 负责设计并部署相关应用平台，并提出平台的实施、运行报告;
* 负责配合开发搭建测试平台，协助开发设计、推行、实施和持续改进;
* 负责相关故障、疑难问题排查处理，编制汇总故障、问题，定期提交汇总报告;
* 负责网络监控和应急反应，以确保网络系统有 7*24 小时的持续运作能力;
* 负责日常系统维护，及监控，提供IT软硬件方面的服务和支持，保证系统的稳定。

**高级运维工程师**

* 参与设计、审核、优化公司IT系统以及各应用系统的体系架构;
* 全面负责公司运维项目的系统升级、扩容需求与资源落实，配合开发需求，测试、调整运维平台;
* 负责网络以及服务器的网络设置、维护和优化、网络的安全监控 、系统性能管理和优化、网络性能管理和优化;
* 建立面向开发部门，业务部门的服务流程和服务标准;
* 负责IT运维相关流程的规划、设计、推行、实施和持续改进;
* 负责内部分派下发，对实施结果负责。

**运维部门经理**

* 负责部门规划和管理，包括完善内部运维团队，技术规划，团队建设等;
* 负责运维制度的制定，包括运维制度的细化和监督执行;
* 根据公司及部门总体目标，制定团队发展的中长期计划;
* 负责公司的IT资源管理：分配、实施、采购、成本控制;
* 负责各个系统及网络架构的规划、管理和维护;
* 安排并实施相关业务的第三方技术服务合作;
* 负责整体把握运维服务质量，数据分析质量，资源规划等。

以上摘自 [百度百科](http://t.cn/RAoieDx) 。

### 职业现状 ###
***

国内一线城市紧缺，特别是互联网公司。小公司的运维工程师负责事情较多，基本上服务器沾边的工作都是你在做。大公司的运维人才要求较高。当然，国内的运维人才很难符合企业的实际要求，人才分布符合二八原则，大多数的人技术平庸，很多都源自培训机构。还有一个不争的事实，那大部分的人期望的工资远远高于他能为公司创造的价值。可以这样说，国内大多数的运维人才都处于一个较低的层次，他们会写脚本，会做一些基础工作，但基本上都是照葫芦画瓢，看文档，找参考，而没有去挖掘底层或者更上层的东西。

之前的发展路线不太准确，请教了某互联网大牛，现更正如下：

总体上运维分四条线：应用运维，运维开发，系统运维和 DBA。每条线都有自己深度，架构师是深度加广度。有的大公司，每条线都有架构师，最后有总架构或者首席。事实上，系统运维、运维开发和应用运维都有初级、中级、高级和资深的进阶过程，架构是比较大的概念。系统运维、应用运维和运维开发之间不存在进阶概念，只是方向不同。可以说应用运维做好了，想去做运维开发，算是个转岗，但不是晋升。架构一般是高级别层次，要求广度和深度，资深开发深度很深，但广度差点，如果广度有，也能向架构进阶。

基础的运维实际上相对简单，做好的前提下应该考虑更长远的发展。

![2015-04-14-operation-and-maintenance-engineer-tips](http://i.imgur.com/2EpIX7H.jpg)

### 工作场景 ###
***

* 基础运维工程师需要和开发工程师沟通协作，需要听取部门经理的指导，必要时指出合理的建议；
* 需要随时待命，有故障需要立马解决，服务器宕机带来的损失是非常巨大的，能在越短的时间修复越好；
* 项目上线、维护、更新基本上会选择凌晨，要有心理准备。可见，运维需要有一颗强大的心脏和一个强壮的身体。

### 合作对象 ###
***

* 开发工程师，应用的发布、故障的处理；
* 其他运维工程师，协作关系；
* DBA 工程师，协作关系；
* 运维组长、部门负责人或者部门经理，汇报工作，参与讨论。

### 技能列表 ###
***

* Linux 基础。比如操作系统基础知识、熟悉 Vi 编辑器、至少熟悉一个发行版（Ubuntu 入门，CentOS 进阶）等；4
* Linux 基础命令。这是刚需，命令都会不爱熟练运用，不用往下谈了。BTW，grep、sed、awk 这几个命令非常重要；5
* 基础服务，如 DNS、Samba、Postfix、DHCP、FTP、NTP、 LAMP/LNMP…… 这一部分需要达到熟练，最好能够理解原理；4
* Shell 脚本，当然会 Python、Perl 更好。脚本非常重要，切记！5
* 运维平台工具，比如 Nagios、Zabbix、Puppet 等。这一部分可以提高不少效率和便利；3
* 网络。熟悉 TCP/IP 协议，熟练使用 tcpdump，对运维帮助非常大；3
* 安全。熟练掌握 iptables 配置，熟悉 SELinux。安全对运维可以说至关重要；4
* 硬件。毕竟做运维，经常需要和服务器打交道，熟悉硬件是必不可少的；3
* Linux 内核。这一部分可以加深内功，但需要较强的 C 语言功底。我认为每个运维人员都需要关注；3
* 数据库。熟悉常见的数据库，基本安装配置，区别与联系；3
* 大数据、虚拟化、云计算、分布式等。此部分做了解，当然，如果想往这方面发展，得深挖了。另外提一下，可以关注下 Docker。2

### 信息源 ###
***

**博客地址**

* [张宴](http://zyan.cc/) Nginx 顶级牛人；
* [系统技术非业余研究](http://blog.yufeng.info/) 淘宝褚霸，专注高性能、容错和分布式服务器的研究和实现，国内顶尖的牛人；
* [运维进行时](http://blog.liuts.com/index.php) 刘天斯，腾讯架构师、高级系统工程师；
* [运维和开发](http://www.hoterran.info/) ID：hoterran，目前就职于阿里云计算系统产品部；
* [Coding is fun](http://www.kissuki.com/) 许立剑前辈，关注开源、分布式和云计算，值得一读；
* [NoOps-小米运维](http://noops.me/) 小米官方运维博客；
* [运维人生](http://opkeep.com/) 游戏运维；

PS：博客就分享那么多，其他的博客需要您发现了。

**其他网站**

* [The Linux Kernel Archives](https://kernel.org/) Linux 内核官网；
* [GitHub](https://github.com/) 我认为这是 IT 从业者必上的网站；
* [Stack Overflow](http://stackoverflow.com/) 相信平时遇到的问题都可以在上面找到不错的答案；
* [开源中国](http://www.oschina.net/) 国内首屈一指的网站，为开源事业做了巨大贡献；
* [nixCraft](http://www.cyberciti.biz/) 关于 Linux/Unix 的在线社区，很多干货。
* [InfoQ](http://www.infoq.com/cn) 很多分享，值得关注的网站；
* [WooYun](http://drops.wooyun.org/) 关注安全的好去处；
* [知乎周刊](http://zhuanlan.zhihu.com/Weekly) 充电的好网站；
* [码农周刊](http://weekly.manong.io/) 还是应该关注编程；
* [Startup News](http://news.dbanotes.net/) 冯老师做的；
* [极客头条](http://geek.csdn.net/) 关注互联网动态。

**书籍**

* [鸟哥的 Linux 私房菜.基础学习篇（第三版）](http://book.douban.com/subject/4889838/) 这本书堪称 Linux 入门经典；
* [鸟哥的 Linux 私房菜.服务器架设篇](http://book.douban.com/subject/2338464/) 入门以后可以参考此书；
* [The Linux Command Line](http://book.douban.com/subject/6806862/) 学习 Linux 命令，适合新手；
* [Linux 命令行与 shell 脚本编程大全](http://book.douban.com/subject/11589828/) 学习 Shell 不可多得的书；
* [Linux Shell 脚本攻略（第 2 版）](http://book.douban.com/subject/25791952/) Shell 好帮手；
* [Shell 脚本学习指南](http://book.douban.com/subject/3519360/) O'Reilly 出品，经典之作；
* [Linux 命令、编辑器与 Shell 编程](http://book.douban.com/subject/2029866/) 同样是学习 Shell 的好书；
* [Unix/Linux 编程实践教程](http://book.douban.com/subject/1219329/) Linux/Unix 编程经典书籍；
* [UNIX/Linux 系统管理技术手册](http://book.douban.com/subject/10747453/) 进阶经典教程，可以当作参考书；
* [Linux 系统管理技术手册](http://book.douban.com/subject/1230123/) 运维参考书；
* [Python 基础教程](http://book.douban.com/subject/4866934/) Python 入门好帮手；
* [A Byte of Python：简明 Python 教程](http://book.douban.com/subject/5948760/) 确实够简明；
* [Python学习手册（第4版）](http://book.douban.com/subject/6049132/) Python 参考书；
* [Head First Python（中文版）](http://book.douban.com/subject/10561367/) 适合初学者；
* [Python 核心编程（第二版）](http://book.douban.com/subject/3112503/) Python 进阶；
* [Python 语言入门](http://book.douban.com/subject/1239501/) 冯老师参与翻译；
* [编写高质量代码：改善 Python 程序的91个建议](http://book.douban.com/subject/25910544/) 不仅仅适合 Python 程序员，运维同样适合；
* [Python Cookbook](http://book.douban.com/subject/4828875/) 又一本 Python 参考书；
* [Python UNIX 和 Linux 系统管理指南](http://book.douban.com/subject/4031965/) 这本书强烈推荐，对运维工程师而言意义重大；
* [Perl 语言入门：第五版](http://book.douban.com/subject/4088038/) Perl 入门经典；
* [Perl 语言编程](http://book.douban.com/subject/1231697/) Perl 参考书；
* [高级 Perl 编程](http://book.douban.com/subject/1230430/) Perl 进阶好书；
* [精通 Perl](http://book.douban.com/subject/3413859/) 同样是不可多得得好书；
* [Perl 最佳实践（中文版）](http://book.douban.com/subject/3063982/) 优化好你的 Perl 代码吧；
* [精通 Puppet 配置管理工具](http://book.douban.com/subject/10736908/) Puppet 参考书；
* [Puppet 实战](http://book.douban.com/subject/25790720/) 国人写的书，推荐下；
* [Puppet 权威指南](http://www.douban.com/note/475252743/) 腾讯高级运维工程师王冬生前辈所著；
* [TCP/IP 详解 卷1：协议](http://book.douban.com/subject/1088054/) 修炼内功，经典不需解释；
* [TCP/IP 详解 卷2：实现](http://book.douban.com/subject/1087767/) 经典之作；
* [TCP/IP 详解 卷3：TCP 事务协议、HTTP、NNTP 和 UNIX 域协议](http://book.douban.com/subject/1058634/) 传世经典；
* [操作系统：精髓与设计原理（原书第 6 版](http://book.douban.com/subject/5064311/) 修炼内功的好书；
* [深入理解计算机系统](http://book.douban.com/subject/1230413/) 计算机系统经典之作；
* [算法导论（原书第 2 版）](http://book.douban.com/subject/1885170/) 传世经典，学习算法的好书，运维工程师同样需要；
* [白帽子讲 Web 安全](http://book.douban.com/subject/10546925/) 道哥所著，了解 Web 安全；
* [深入 Linux 内核架构](http://book.douban.com/subject/4843567/) 学习 Linux 内核的好书；
* [深入理解 LINUX 内核（第二版）](http://book.douban.com/subject/1230516/) 学习 Linux 内核的经典书籍；
* [Linux/Unix 设计思想](http://book.douban.com/subject/7564417/) 深入理解 Linux/Unix 的核心，领略技术之美；
* [Linux 程序设计](http://book.douban.com/subject/4831448/) 深入理解 Linux 系统；
* [UNIX 操作系统设计](http://book.douban.com/subject/1035710/) 理解操作系统；
* [UNIX 编程艺术](http://book.douban.com/subject/1467587/) 绝对的经典；
* [UNIX 环境高级编程](http://book.douban.com/subject/1788421/) 权威，经典；
* [代码大全（第2版）](http://book.douban.com/subject/1477390/) 深入理解软件的好书；
* [一个合格的程序员应该读过哪些书](http://justjavac.iteye.com/blog/1530097) justjavac 所作；
* [其他经典书籍](http://book.douban.com/series/6628) 和上述略有重合。

说明：

* 以上书籍没有全部看完，有些在看，有些在规划中，且当做个列表吧；
* 关于数据库的书籍，参考 [MySQL DBA Tips](http://dbarobin.com/2015/04/14/mysql-dba-tips/) ，在此不赘述。

**资源**

* [免费的编程中文书籍索引-GitHub](https://github.com/justjavac/free-programming-books-zh_CN)

–EOF–

版权声明：自由转载-非商用-非衍生-保持署名<a href="http://creativecommons.org/licenses/by-nc-nd/4.0/deed.zh" target="_blank">（创意共享4.0许可证）</a>

题图来自 [ardentpartners.com](http://payablesplace.ardentpartners.com/2014/06/ap-skill-sets-must-evolve-with-automation/) , By Andrew Bartolini.
