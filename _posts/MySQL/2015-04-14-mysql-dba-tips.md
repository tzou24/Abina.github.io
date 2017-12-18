---
published: true
author: Robin Wen
layout: post
title: "MySQL DBA Tips"
category: MySQL
comments: no
summary: "应网友邀请，写的 MySQL DBA Tips。目前 MySQL DBA 的职业现状：一线城市稀缺。想做 MySQL DBA，就不要想着去三线城市或者以下了，基本用不到。MySQL 占了互联网行业的大半壁江山，如果想从事 MySQL DBA，尽量前往一线城市，机会较多，得到锻炼的可能性也就越大。人才的分布同样符合二八原则，优秀的人永远都是少数。同 Oracle 不同，MySQL 当前发展正猛，机遇与挑战比趋近成熟的 Oracle 更多。"
tags: 
- MySQL
- MySQL DBA
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

* 安装和升级数据库服务器以及应用程序工具；
* 数据库设计系统存储方案，并制定未来的存储需求计划；
* 协助开发创建数据库对象、存储过程等；
* 协助开发优化 SQL；
* 根据开发人员的反馈信息，必要的时候，修改数据库的结构；
* 登记数据库的用户，维护数据库的安全性；
* 控制和监控用户对数据库的存取访问；
* 监控和优化数据库的性能；
* 制定数据库备份计划，灾难出现时对数据库信息进行恢复；
* 维护适当介质上的存档或者备份数据；
* 备份和恢复数据库；
* 制定或者协助制定高可用、高性能方案，评估、实施方案，并且做维护优化；
* 处理突发故障，随时待命。

以上来自 [CSDN](http://blog.csdn.net/wyzxg/article/details/894076)，略有改动。

### 职业现状 ###
***

一线城市稀缺。想做 MySQL DBA，就不要想着去三线城市或者以下了，基本用不到。MySQL 占了互联网行业的大半壁江山，如果想从事 MySQL DBA，尽量前往一线城市，机会较多，得到锻炼的可能性也就越大。人才的分布同样符合二八原则，优秀的人永远都是少数。同 Oracle 不同，MySQL 当前发展正猛，机遇与挑战比趋近成熟的 Oracle 更多。

![2015-04-14-mysql-dba-tips](http://i.imgur.com/VMb5fqF.jpg)

### 工作场景 ###
***

* MySQL DBA 需要和开发人员、运维工程师进行沟通协作；
* 需要随时待命，数据是核心，一要保证数据库平稳运行，二要保证数据的安全完整；
* 对数据库的升级、优化、备份数据通常在数据库服务器闲的时候，做好心理准备。同运维工程师一样，同样需要有一颗强大的心脏和一个强壮的身体。

### 合作对象 ###
***

* 开发工程师，SQL 优化、数据导入、修改表结构等；
* 运维工程师，协作关系；
* 其他 DBA 工程师，协作关系；
* DBA 组长、部门负责人或者部门经理，汇报工作，参与讨论。

### 技能列表 ###
***

* Linux 基础。比如操作系统基础知识、熟悉 Vi 编辑器、至少熟悉一个发行版（Ubuntu 入门，CentOS 进阶）等；4
* Linux 基础命令。这是刚需，命令都会不爱熟练运用，不用往下谈了。BTW，grep、sed、awk  这几个命令非常重要；5
* Shell 脚本，当然会 Python、Perl 更好。脚本非常重要，切记！5
* 网络。熟悉 TCP/IP 协议，熟练使用 tcpdump，对运维帮助非常大；3
* 安全。熟练掌握 iptables 配置，熟悉 SELinux。安全对运维可以说至关重要；4
* 硬件。同运维一样，经常需要和服务器打交道，熟悉硬件是必不可少的；3
* Linux 内核。这一部分可以加深内功，但需要较强的 C 语言功底。我认为每个运维人员都需要关注；3
* 数据库。掌握常见的数据库，基本安装配置，区别与联系；精通至少一种数据库；5
* MySQL。这个是重点。熟悉 MySQL 基础管理；熟悉 MySQL 体系结构、常用存储引擎；熟练掌握 MySQL 备份与恢复；掌握 MySQL 集群、复制技术；了解 MySQL 高可用及性能调优。熟悉 MySQL 线程的区别，缓冲池中缓存的数据页类型，InnoDB 的插入缓冲、自适应哈希索引，InnoDB 数据页结构等；深入理解索引、锁、事务。5
* Oracle。这个是辅助，毕竟 MySQL 有很多地方和 Oracle 相通。熟悉 Oracle 数据库体系结构；掌握 SQL 优化的规则和方法；掌握数据库的备份与恢复；熟悉 DataGuard、RAC 集群；掌握 Oracle 的性能优化技术，熟悉 AWR/ASH；熟练掌握 PL/SQL。4
* SQL Server。这个是衬托。熟悉 SQL Server 运行机制和架构 、复制、日志传送、SQL Server Cluster、性能分析和调优、备份和恢复、报表等；3
* NoSQL。NoSQL 也是一大趋势，熟悉 MongoDB 的用法、索引、复制以及故障转移、动态查询、分片等；3
* 缓存服务器。熟悉 Memcached、Redis 的用法，理解其机制；3
* 数据仓库、大数据、NewSQL 等。此部分做了解，当然，如果想往这方面发展，得深挖了。2

### 信息源 ###
***

**博客地址**

* [MySQL Performance](http://www.percona.com/blog) 这应该是每个 MySQL DBA 必上的博客；
* [Planet MySQL](http://planet.mysql.com/) MySQL 官方出品；
* [Dba Square](http://www.dbasquare.com/) 非常不错的博客；
* [High Availability MySQL](http://mysqlha.blogspot.com/) 了解 MySQL 高性能；
* [Baron Schwartz](http://www.xaprb.com/blog) 「高性能 MySQL」 作者的博客；
* [Ronald Bradford](http://ronaldbradford.com/blog/) 「Effective MySQL」 系列作者的博客；
* [Yoshinori Matsunobu](http://yoshinorimatsunobu.blogspot.com/) 博主是 Facebook 数据库工程师。
* [NoSQL Notes](http://www.nosqlnotes.net/) 阿里日照前辈的博客；
* [InsideMySQL](http://www.innomysql.net/) 「MySQL 技术内幕：InnoDB 存储引擎」、「MySQL 技术内幕：SQL 编程」、「MySQL 内核：InnoDB 存储引擎 卷1」作者姜承尧前辈博客；
* [DBA Notes](http://dbanotes.net/) 冯老师的博客，但现在的重心不是数据库了；
* [AnySQL](http://www.anysql.net/) 楼方鑫前辈的博客；
* [Sky Jian](http://isky000.com/) 「MySQL 性能优化与架构设计」作者简朝阳前辈的博客；
* [NinGoo](http://www.ningoo.net/) 阿里巴巴 DBA 宁海元前辈博客；
* [yejr](http://imysql.com/) MySQL 中文网站长叶金荣前辈博客；
* [orczhou](http://www.orczhou.com/) 淘宝 MySQL DBA 周振兴前辈博客；
* [Focus on MySQL/InnoDB kernel](http://www.gpfeng.com/) 阿里巴巴 MySQL 内核开发工程师郭鹏前辈的博客。

**其他网站**

* [MySQL 官网](http://www.mysql.com/) 这个网站再熟悉不过了吧；
* [ITPub](http://www.itpub.net/forum.php) 这个网站在国内很有名，上面孕育了一大批杰出的数据库大牛；
* [GitHub](https://github.com/) 我认为这是 IT 从业者必上的网站；
* [Stack Overflow](http://stackoverflow.com/) 相信平时遇到的问题都可以在上面找到不错的答案；
* [开源中国](http://www.oschina.net/) 国内首屈一指的网站，为开源事业做了巨大贡献；
* [InfoQ](http://www.infoq.com/cn) 很多分享，值得关注的网站；
* [WooYun](http://drops.wooyun.org/) 关注安全的好去处；
* [知乎周刊](http://zhuanlan.zhihu.com/Weekly) 充电的好网站；
* [码农周刊](http://weekly.manong.io/) 还是应该关注编程；
* [Startup News](http://news.dbanotes.net/) 冯老师做的；
* [极客头条](http://geek.csdn.net/) 关注互联网动态。

**书籍**

* [数据库系统概念](http://book.douban.com/subject/10548379/) 这本书是数据库领域的 Bible；
* [数据库原理](http://book.douban.com/subject/6976278/) 深入理解数据库，同样值得一读；
* [数据库原理、编程与性能](http://book.douban.com/subject/1094413/) 理解查询优化和查询性能的好书；
* [深入浅出 MySQL 数据库开发、优化与管理维护](http://book.douban.com/subject/3012338/) 适合初学者；
* [深入理解 MySQL](http://book.douban.com/subject/4188364/) MySQL 经典书籍；
* [深入理解 MySQL 核心技术](http://book.douban.com/subject/4022870/) MySQL DBA 必读书籍之一；
* [MySQL 性能调优与架构设计](http://book.douban.com/subject/3729677/) 国人写的书，值得一读；
* [高可用 MySQL——构建健壮的数据中心](http://book.douban.com/subject/6847455/) 同样是经典之作；
* [高性能 MySQL](http://book.douban.com/subject/4241826/) 一本高可用，一本高性能，经典无需言语；
* [MySQL 技术内幕：InnoDB 存储引擎](http://book.douban.com/subject/24708143/) 国人所著，现在已经是第二版了；
* [MySQL 技术内幕：SQL 编程](http://book.douban.com/subject/10569620/) 说实话，这本书质量乏善可陈；
* [MySQL 内核：InnoDB 存储引擎 卷1](http://book.douban.com/subject/25872763/) 与上两本出自同一作者，阅读 MySQL 内核不可多得得指导书；
* [MySQL技术内幕：性能调优与架构设计](#) 未发行，但值得期待；
* [Expert Mysql](http://book.douban.com/subject/2751144/) 好书一本；
* [Microsoft SQL Server 2005 技术内幕：T-SQL 程序设计](http://book.douban.com/subject/2208539/) MSSQL 2005 技术内幕之一；
* [Microsoft SQL Server 2005 技术内幕：T-SQL 查询](http://book.douban.com/subject/2980249/) MSSQL 2005 技术内幕之二；
* [Microsoft SQL Server 2005 技术内幕：存储引擎](http://book.douban.com/subject/2295543/) MSSQL 2005 技术内幕之三；
* [Microsoft SQL Server 2005 技术内幕：查询.调整和优化](http://book.douban.com/subject/3821205/) MSSQL 2005 技术内幕之四；
* [SQL Server 2008 编程入门经典(第 3 版)](http://book.douban.com/subject/4240954/) MSSQL 入门经典书籍；
* [Microsoft SQL Server 2008 技术内幕：T-SQL 语言基础](http://book.douban.com/subject/4047293/) MSSQL 2008 技术内幕之一；
* [Microsoft SQL Server 2008 技术内幕：T-SQL查询](http://book.douban.com/subject/5273965/) MSSQL 2008 技术内幕之二；
* [Microsoft SQL Server 企业级平台管理实践](http://book.douban.com/subject/4240257/) MSSQL 进阶经典书籍；
* [SQL Server 2008 管理员必备指南](http://book.douban.com/subject/3576026/) MSSQL 管理员参考书；
* [SQL Server 2008 查询性能优化](http://book.douban.com/subject/4935284/) SQL 优化经典书籍；
* [MongoDB 权威指南](http://book.douban.com/subject/6068947/) MongoDB 经典书籍；
* [深入学习 MongoDB](http://book.douban.com/subject/10439364/) MongoDB 深入好帮手；
* [MongoDB 实战](http://book.douban.com/subject/19977785/) 实战教程；
* [Oracle 相关书籍](http://www.eygle.com/archives/my_life/books/) Oracle 的书籍就不额外推荐了，相信你找得到好书的；
* [计算机科学丛书](http://book.douban.com/series/1163) 这应该是计算机领域的权威书籍了。

说明：

* 上述大部分书都看过，打算把其余的补齐，并且再温新经典；
* Linux、Python、Perl、操作系统、算法等相关书籍，请参考：[运维工程师指北](http://dbarobin.com/2015/04/14/operation-and-maintenance-engineer-tips/)；
* 好书难免遗漏，还忘见谅，如有补充，欢迎留言；

**资源**

* [数据库书籍及相关资料-GitHub](https://github.com/dbarobin/db-books)
* [推荐 15 个有价值的 MySQL 教程网站](http://blog.jobbole.com/1093/)
* [我的知乎回答](http://www.zhihu.com/people/wentasy/answers?order_by=vote_num)

–EOF–

版权声明：自由转载-非商用-非衍生-保持署名<a href="http://creativecommons.org/licenses/by-nc-nd/4.0/deed.zh" target="_blank">（创意共享4.0许可证）</a>

题图来自：<a href="http://www.create-hub.com/comment/quotes-about-technology/" target="_blank"><img src="http://i.imgur.com/rNdmBXL.png" title="MySQL DBA Tips" height="16px" width="16px" border="0" alt="MySQL DBA Tips" /></a>
