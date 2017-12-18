---
published: true
author: Robin Wen
layout: post
title: GitHub 加速最佳实践
category: Skill
summary: >-
  GitHub 简称 GayHub，又称世界上最大的同性交友平台，还称程序员的左右手。但由于众所周知的原因，GitHub
  在没有翻墙的前提下，访问速度就像乌龟在漫步，让追求效率的程序员痛苦不堪，恨不得肉身翻墙，享受优质互联网服务的同时晒晒太阳，吹吹海风。熟练的程序员基本上都使用
  Terminal 或者命令行访问 GitHub。那么问题来了，怎么优雅地使用 GitHub 呢？我觉得应该分享分享。终端加速 GitHub
  方法的前置条件，一是购买了加速服务或者租用 VPS 搭建加速服务，二是系统是 macOS，三是终端是 iTerm，四是 Shell 是 zsh。终端加速
  GitHub，需要明确的是，http_proxy 和 https_proxy 的方法是无效的。最佳实践有两种方法，一是使用 proxychains，二是为
  Git 配置代理。终端可以呼呼地使用 GitHub，那网页呢，也很简单，且听。网页加速 GitHub 方法的前置条件，一是购买了加速服务或者租用 VPS
  搭建加速服务，二是系统是 macOS 或者 Win，三是浏览器是 Chrome。最后，为自由付费是值得的。最近工信部颁文：未经批准不得自建或租用
  VPN，以后的墙只会越来越高，自由的成本也会越来越高，珍重！
tags:
  - 生产力
  - 效率
comments:
  - author:
      type: twitter
      displayName: yxjxx
      url: 'https://twitter.com/yxjxx'
      picture: >-
        https://pbs.twimg.com/profile_images/680719979092692992/rQF8oyZD_bigger.png
    content: ' ProxyCommand /usr/bin/nc -X connect -x 127.0.0.1:1235 %h %p doesn&apos;t work for me.'
    date: 2017-02-12T17:25:37.944Z
  - author:
      type: github
      displayName: heaventear
      url: 'https://github.com/heaventear'
      picture: 'https://avatars1.githubusercontent.com/u/2443840?v=3&s=73'
    content: >-
      &#x5176;&#x5B9E;&#x4E0D;&#x7528;&#x8FD9;&#x4E48;&#x9EBB;&#x70E6;&#xFF0C;&#x6302;&#x4E2A;&#x5916;&#x7F51;&#x52A0;&#x901F;&#x5668;&#x5C31;&#x884C;&#x4E86;&#xFF0C;&#x6211;&#x7528;&#x7684;&#x662F;&#x5929;&#x8DEF;&#x52A0;&#x901F;&#x5668;&#xFF0C;&#x6548;&#x679C;&#x633A;&#x597D;&#x7684;,
      https://91tianlu.com
    date: 2017-03-29T07:47:08.527Z
  - author:
      type: github
      displayName: heaventear
      url: 'https://github.com/heaventear'
      picture: 'https://avatars1.githubusercontent.com/u/2443840?v=3&s=73'
    content: >-
      &#x5176;&#x5B9E;&#x4E0D;&#x7528;&#x8FD9;&#x4E48;&#x9EBB;&#x70E6;&#xFF0C;&#x6302;&#x4E2A;&#x5916;&#x7F51;&#x52A0;&#x901F;&#x5668;&#x5C31;&#x884C;&#x4E86;&#xFF0C;&#x6211;&#x7528;&#x7684;&#x662F;&#x5929;&#x8DEF;&#x52A0;&#x901F;&#x5668;&#xFF0C;&#x6548;&#x679C;&#x633A;&#x597D;&#x7684;,
      https://91tianlu.cn
    date: 2017-04-08T15:37:30.986Z
  - author:
      type: github
      displayName: holyen
      url: 'https://github.com/holyen'
      picture: 'https://avatars3.githubusercontent.com/u/2010669?v=4&s=73'
    content: >-
      &#x5176;&#x5B9E;&#x4E0D;&#x7528;&#x8FD9;&#x4E48;&#x9EBB;&#x70E6;&#xFF0C;&#x6302;&#x4E2A;&#x5916;&#x7F51;&#x52A0;&#x901F;&#x5668;&#x5C31;&#x884C;&#x4E86;&#xFF0C;&#x6211;&#x7528;&#x7684;&#x662F;&#x6CB3;&#x5BF9;&#x5CB8;&#x52A0;&#x901F;&#x5668;&#xFF0C;&#x6548;&#x679C;&#x633A;&#x597D;&#x7684;,
      &#x8;http://heduian.com
    date: 2017-07-28T01:50:42.750Z
  - author:
      type: github
      displayName: holyen
      url: 'https://github.com/holyen'
      picture: 'https://avatars3.githubusercontent.com/u/2010669?v=4&s=73'
    content: >-
      &#x5176;&#x5B9E;&#x4E0D;&#x7528;&#x8FD9;&#x4E48;&#x9EBB;&#x70E6;&#xFF0C;&#x6302;&#x4E2A;&#x5916;&#x7F51;&#x52A0;&#x901F;&#x5668;&#x5C31;&#x884C;&#x4E86;&#xFF0C;&#x6211;&#x7528;&#x7684;&#x662F;&#x6CB3;&#x5BF9;&#x5CB8;&#x52A0;&#x901F;&#x5668;&#xFF0C;&#x6548;&#x679C;&#x633A;&#x597D;&#x7684;,
      &#x8;http://heduian.com
    date: 2017-07-28T01:51:15.216Z

---

`文/温国兵`

GitHub 简称 GayHub，又称世界上最大的同性交友平台，还称程序员的左右手。但由于众所周知的原因，GitHub 在没有翻墙的前提下，访问速度就像乌龟在漫步，让追求效率的程序员痛苦不堪，恨不得肉身翻墙，享受优质互联网服务的同时晒晒太阳，吹吹海风。

熟练的程序员基本上都使用 Terminal 或者命令行访问 GitHub。那么问题来了，怎么优雅地使用 GitHub 呢？我觉得应该分享分享。

![星夜 By ZanXiong Feng](http://i.imgur.com/SjmvjQm.jpg)

© ZanXiong Feng/星夜/泼辣有图

> 终端加速 GitHub 方法的前置条件，一是购买了加速服务或者租用 VPS 搭建加速服务，二是系统是 macOS，三是终端是 iTerm，四是 Shell 是 zsh。

终端加速 GitHub，需要明确的是，http_proxy 和 https_proxy 的方法是无效的。最佳实践有两种方法，一是使用 proxychains，二是为 Git 配置代理。

**终端加速 GitHub 方法一：使用 proxychains**

1、关闭 SIP

macOS 10.11 后下由于开启了 SIP 会导致命令行下 proxychains 代理的模式失效，如果你要使用 proxychains 这种简单的方法，就需要先关闭 SIP。

具体的关闭方法如下：在恢复模式下，终端里输入 `csrutil enable --without debug` 来部分关闭 SIP，完整教程可以看 [这里](https://totalfinder.binaryage.com/system-integrity-protection)。

恢复模式重启进入系统后，终端里输入 `csrutil status`，结果中如果有 **Debugging Restrictions: disabled** 则说明关闭成功。

2、安装 Proxychains

安装好 [Homebrew](http://brew.sh) 后，终端中输入 `brew install proxychains-ng`

将 `/usr/local/etc/proxychains.conf` 中的配置替换为

``` bash
strict_chain
quiet_mode
proxy_dns
remote_dns_subnet 224
tcp_read_time_out 15000
tcp_connect_time_out 8000
localnet 127.0.0.0/255.0.0.0
localnet 10.0.0.0/255.0.0.0
localnet 172.16.0.0/255.240.0.0
localnet 192.168.0.0/255.255.0.0

[ProxyList]
http 127.0.0.1 1235
```

然后在需要走代理的命令前加上 proxychains4 即可，如

``` bash
proxychains4 brew update
```

当然，你也可以像我这样做个自定义配置，在 `~/.zshrc` 末尾加入如下行：

``` bash
#   ---------------------------------------
#   14. proxychain config
#   ---------------------------------------
alias fuckgfw='proxychains4'
```

上一条命令就是这样：`fuckgfw brew update`，是的，Fuck GFW!

**终端加速 GitHub 方法二：为 Git 配置代理**

Git 比较特殊，使用环境变量的方法并没有用，只有 proxychains 有效，如果不想使用 proxychains，可以对照本教程进行配置。

对于 HTTP/HTTPS 协议，比如 `git clone https://github.com/github/hub.git`，使用下面的命令为 github.com 域名配置代理。

``` bash
git config --global http.https://github.com.proxy http://127.0.0.1:1235
```

对于 SSH 协议，比如 `git clone git@github.com:github/hub.git`，需要在文件 `~/.ssh/config` 中添加

``` bash
host github.com
    ProxyCommand /usr/bin/nc -X connect -x 127.0.0.1:1235 %h %p
```

相应的配置完成后，git clone 就会使用代理了。

终端可以呼呼地使用 GitHub，那网页呢，也很简单，且听。

> 网页加速 GitHub 方法的前置条件，一是购买了加速服务或者租用 VPS 搭建加速服务，二是系统是 macOS 或者 Win，三是浏览器是 Chrome。

**网页加速 GitHub 方法一：macOS + Chrome**

macOS 使用 Chrome 访问 GitHub，可以使用 `Surge for Mac` 或者 `GoAgentX`，具体的教程就此打住。

**网页加速 GitHub 方法二：PC + Chrome**

PC 可以使用 `Shadowsocks for Windows`，然后 Shadowsocks 设置为全局代理，接着 Chrome 安装插件 `Proxy SwitchyOmega`，新建 Proxy Profile，选择 http，输入 127.0.0.1，端口为 Shadowsocks 代理的端口，最后 Chrome 点击 Proxy SwitchyOmega 图标，切换至新建的 Proxy Profile 即可。

最后，为自由付费是值得的。最近工信部颁文：**[未经批准不得自建或租用 VPN](http://www.miit.gov.cn/n1146290/n4388791/c5471946/content.html)**，以后的墙只会越来越高，自由的成本也会越来越高，珍重！

Enjoy!

–EOF–

版权声明：自由转载-非商用-非衍生-保持署名<a href="http://creativecommons.org/licenses/by-nc-nd/4.0/deed.zh" target="_blank">（创意共享4.0许可证）</a>
