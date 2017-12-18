---
published: true
author: Robin Wen
layout: post
title: "SSDB 复制故障"
category: NoSQL
summary: "SSDB 底层采用 Google 的 LevelDB，并支持 Redis 协议。一些用于支持 Redis 集群的中间件，比如 Twitter 的 Twemproxy，豌豆荚的 Codis，都可以无缝关联 SSDB。对于开发而言，从 Redis 迁移到 SSDB 的成本可以忽略不计。官方宣称 SSDB 具有高性能，但实际使用过程中还是有不少坑，本文分享一个由于 SSDB 配置引起的故障。"
tags:
- NoSQL
- SSDB
- 故障排查
---

## 目录 ##

* Table of Contents
{:toc}

`文/温国兵`

## 一 引子 ##
***

SSDB 是什么？我们可以看下官方的介绍：

> SSDB 是一个 C/C++ 语言开发的高性能 NoSQL 数据库, 支持 KV, list, map(hash), zset(sorted set) 等数据结构, 用来替代或者与 Redis 配合存储十亿级别列表的数据。SSDB 是稳定的, 生产环境使用的, 已经在许多互联网公司得到广泛使用, 如奇虎 360, TOPGAME。

SSDB 底层采用 Google 的 LevelDB，并支持 Redis 协议。一些用于支持 Redis 集群的中间件，比如 Twitter 的 Twemproxy，豌豆荚的 Codis，都可以无缝关联 SSDB。对于开发而言，从 Redis 迁移到 SSDB 的成本可以忽略不计。官方宣称 SSDB 具有高性能，但实际使用过程中还是有不少坑，本文分享一个由于 SSDB 配置引起的故障。

## 二 SSDB 架构 ##
***

![SSDB Architecture](http://i.imgur.com/TgfTd14.png)

首先说明下环境（为了保护隐私，每台 SSDB 服务器，只用 IP 的 D 段做标识）。最开始 SSDB 部署在 233，没有开启压缩参数，由于容量等问题，迁移到了 173 和 174。173 和 174 之间做了双主，然后 173 和 233 之间做了主从。173 首先从 233 上同步数据，然后 173 的数据再和 174 之间同步。173 同步完成后，业务连接到 173 上。另外，需要说明的是，压缩参数已经在 173 和 174 打开，至此，配置没有更改，服务运行稳定，但内存占用过高。

## 三 故障起因 ##
***

以下是压缩参数关闭之前 173 和 174 的配置：

173 服务器：

``` bash
server:
 ip: xxx.xxx.xxx.173
 port: xxxx

replication:
 binlog: yes
 slaveof:
 id: sync_173
 ip: xxx.xxx.xxx.233
 port: xxxx
 slaveof:
 id: mirror_1
 type: mirror
 ip: xxx.xxx.xxx.174
 port: xxxx
```

174 服务器：

``` bash
server:
 ip: xxx.xxx.xxx.174
 port: xxxx

replication:
 binlog: yes
 slaveof:
 id: mirror_2
 type: mirror
 ip: xxx.xxx.xxx.xxx.173
 port: xxxx
```

经过调研以及讨论，决定尝试关闭压缩参数，以改善内存占用情况。首先去掉 174 的压缩参数，重启，一切正常。然后把 173 上的业务切换到 174。晚上，更改 173 的配置，去掉压缩参数。但重启之后，日志中发现了 copy_count，并且从 0 开始，这就已经出现了问题。然后立即把 173 中连接到 233 的配置去掉，重启后仍然从 0 开始 copy，不过是从 174 拷贝，这也是个问题。

整个故障过程，好在有惊无险，最后的数据没有问题。在没有实施备份与恢复的前提下，数据被搞没了，那就糟糕了。

## 四 故障分析 #
***

我们通过阅读 SSDB 源码，逐步发现了问题所在。

首先，搞明白 compression 参数是怎么读取的。在 **ssdb/options.cpp** 源文件中，有 load 函数，里面定义了 compression 参数，源码如下：

``` cpp
void Options::load(const Config &conf){
    cache_size = (size_t)conf.get_num("leveldb.cache_size");
    max_open_files = (size_t)conf.get_num("leveldb.max_open_files");
    write_buffer_size = (size_t)conf.get_num("leveldb.write_buffer_size");
    block_size = (size_t)conf.get_num("leveldb.block_size");
    compaction_speed = conf.get_num("leveldb.compaction_speed");
    compression = conf.get_str("leveldb.compression");
    std::string binlog = conf.get_str("replication.binlog");

    strtolower(&compression);
    if(compression != "no"){
        compression = "yes";
    }
    strtolower(&binlog);
    if(binlog != "yes"){
        this->binlog = false;
    }else{
        this->binlog = true;
    }

    if(cache_size <= 0){
        cache_size = 8;
    }
    if(write_buffer_size <= 0){
        write_buffer_size = 4;
    }
    if(block_size <= 0){
        block_size = 4;
    }
    if(max_open_files <= 0){
        max_open_files = cache_size / 1024 * 300;
        if(max_open_files < 500){
            max_open_files = 500;
        }
        if(max_open_files > 1000){
            max_open_files = 1000;
        }
    }
}
```

客户端和服务端建立连接，这是我们已知的，具体可以参考 slave.cpp 和 serv.cpp。由于我们的故障是发生 copy，因此可以定位到 **slave.cpp** 中的 proc_copy 函数，源码如下：

``` cpp
int Slave::proc_copy(const Binlog &log, const std::vector<Bytes> &req){
    switch(log.cmd()){
        case BinlogCommand::BEGIN:
            log_info("copy begin");
            break;
        case BinlogCommand::END:
            log_info("copy end, copy_count: %" PRIu64 ", last_seq: %" PRIu64 ", seq: %" PRIu64,
                copy_count, this->last_seq, log.seq());
            this->status = SYNC;
            this->last_key = "";
            this->save_status();
            break;
        default:
            if(++copy_count % 1000 == 1){
                log_info("copy_count: %" PRIu64 ", last_seq: %" PRIu64 ", seq: %" PRIu64 "",
                    copy_count, this->last_seq, log.seq());
            }
            return proc_sync(log, req);
            break;
    }
    return 0;
}
```

至于日志是怎么写入文件的，可以参考 **util/log.cpp**。在该源文件中，通过 rotate 函数轮询写入日志文件，源码如下：

``` cpp
void Logger::rotate(){
    fclose(fp);
    char newpath[PATH_MAX];
    time_t time;
    struct timeval tv;
    struct tm *tm;
    gettimeofday(&tv, NULL);
    time = tv.tv_sec;
    tm = localtime(&time);
    sprintf(newpath, "%s.%04d%02d%02d-%02d%02d%02d",
        this->filename,
        tm->tm_year + 1900, tm->tm_mon + 1, tm->tm_mday,
        tm->tm_hour, tm->tm_min, tm->tm_sec);

    //printf("rename %s => %s\n", this->filename, newpath);
    int ret = rename(this->filename, newpath);
    if(ret == -1){
        return;
    }
    fp = fopen(this->filename, "a");
    if(fp == NULL){
        return;
    }
    stats.w_curr = 0;
}
```

接着我们可以查看 **util/config.cpp** 文件，其中的 load 函数负责加载参数文件中的配置。在 serv.cpp 中，可以看到和 slave 的交互，源码如下：

``` cpp
SSDBServer::SSDBServer(SSDB *ssdb, SSDB *meta, const Config &conf, NetworkServer *net){
    this->ssdb = (SSDBImpl *)ssdb;
    this->meta = meta;

    net->data = this;
    this->reg_procs(net);

    int sync_speed = conf.get_num("replication.sync_speed");

    backend_dump = new BackendDump(this->ssdb);
    backend_sync = new BackendSync(this->ssdb, sync_speed);
    expiration = new ExpirationHandler(this->ssdb);

    cluster = new Cluster(this->ssdb);
    if(cluster->init() == -1){
        log_fatal("cluster init failed!");
        exit(1);
    }

    { // slaves
        const Config *repl_conf = conf.get("replication");
        if(repl_conf != NULL){
            std::vector<Config *> children = repl_conf->children;
            for(std::vector<Config *>::iterator it = children.begin(); it != children.end(); it++){
                Config *c = *it;
                if(c->key != "slaveof"){
                    continue;
                }
                std::string ip = c->get_str("ip");
                int port = c->get_num("port");
                if(ip == "" || port <= 0 || port > 65535){
                    continue;
                }
                bool is_mirror = false;
                std::string type = c->get_str("type");
                if(type == "mirror"){
                    is_mirror = true;
                }else{
                    type = "sync";
                    is_mirror = false;
                }

                std::string id = c->get_str("id");

                log_info("slaveof: %s:%d, type: %s", ip.c_str(), port, type.c_str());
                Slave *slave = new Slave(ssdb, meta, ip.c_str(), port, is_mirror);
                if(!id.empty()){
                    slave->set_id(id);
                }
                slave->auth = c->get_str("auth");
                slave->start();
                slaves.push_back(slave);
            }
        }
    }

    // load kv_range
    int ret = this->get_kv_range(&this->kv_range_s, &this->kv_range_e);
    if(ret == -1){
        log_fatal("load key_range failed!");
        exit(1);
    }
    log_info("key_range.kv: \"%s\", \"%s\"",
        str_escape(this->kv_range_s).c_str(),
        str_escape(this->kv_range_e).c_str()
        );
}
```

至此，我们可以知道，replication 中 slaveof 的配置跟顺序有关，比如 173 上有两个 slaveof，和 233 之间是 sync，174 之间是 mirror，意味着和 233 之间的 sync 比和 174 之间的 mirror 先生效。发生故障时，只有去 233 同步数据，而不是 174。正确的做法是，在同步完 233 的数据之后，应该断掉它们的关系，从而让 173 和 173 之间的双主关系稳健。

## 五 尾声 ##
***

文末，说点题外话，SSDB 的作者现在是懒投资的 CTO，不知道懒投资的，出门左转，自行 Google。做技术能做到 CTO 级别，也算是触到天花板了吧。技术人的出路，这又是一个值得思考的问题。

Enjoy!

–EOF–

插图来自：By Robin, Created via Visio 2013 Pro.

版权声明：自由转载-非商用-非衍生-保持署名<a href="http://creativecommons.org/licenses/by-nc-nd/4.0/deed.zh" target="_blank">（创意共享4.0许可证）</a>
