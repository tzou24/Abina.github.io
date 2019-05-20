---
published: true
author: YaoBin Zou
layout: post
title: 继承 PropertyPlaceholderConfigurer 对配置文件进行加密
categories: 开发
summary:
comment: true
tags:
  - dev
---
`文/邹耀斌`

![https://s2.ax1x.com/2019/05/19/EvVkAP.jpg](https://s2.ax1x.com/2019/05/19/EvVkAP.jpg)

### 背景
一般在开发中，常常用到配置文件，对数据源账号和密码进行管理，在配置时都是以明文的方式。这里 Spring 对配置属性有一个处理操作，我们可以继承然后重写其方法，将配置属性进行加解密操作，从而提高安全性。

### 实现
只需要重写其 `convertProperty` 方法即可

``` java
public class EncryptPropertyPlaceholderConfigurer extends PropertyPlaceHolderConfigurer {

  @Override
  protected String convertProperty(String propertyName, Stirng propertyValue) {
    String decryptValue = AESUtil.getDecryptString(propertyValue, "1234567890#@!"); //解密盐值
    return decryptValue;
  }
}
```

### 说明
`AESUtil`  是一个 AES 加解密工具类，上面是一个解密过程，所以在配置文件中，可以进行密文配置。

(全文完)
