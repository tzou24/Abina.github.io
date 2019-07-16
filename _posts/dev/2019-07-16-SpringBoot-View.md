---
published: true
author: YaoBin Zou
layout: post
title: SpringBoot 视图层整合
categories: 开发
summary:
comment: true
tags:
  - dev
---

![https://s2.ax1x.com/2019/07/04/ZN50qP.png](https://s2.ax1x.com/2019/07/04/ZN50qP.png)
### 前言

目前许多企业都采用了前后端分离来进行项目开发， 例如 springboot + vue， 但是 spring 自身的视图层也还有部分在使用，对于前端较弱的后端开发，这也是一个构建完整项目的一种选择。本文介绍两种模板视图技术：
> - [Thymeleaf](https://www.thymeleaf.org/) 
> - [FreeMarker](https://freemarker.apache.org/)


### Thymeleaf 整合
Thymeleaf 是新一代的 Java 模板引擎，并且它支持 HTML 原型，对于熟悉 HTML 知识的开发者，就可以很快上手。

#### 添加依赖
```xml
 <dependency>
   <groupId>org.springframework.boot</groupId>
   <artifactId>spring-boot-starter-thymeleaf</artifactId>
 </dependency>
```
#### 配置
在 springboot 中的配置文件 application.yml 文件中进行配置， 其前缀定义为`spring.thymeleaf`, 其默认存放的文件地址为`classpath:/templates/`,文件后缀为`.html`，常用的一些配置如下：
```yml
#
spring
  thymeleaf
    cache:true #是否开启缓存
    check-template:true #检查模板是否存在
    check-template-location:true #检查模板位置是否存在
    encoding:UTF-8 #模板文件编码
    prefix:classpath:/templates/ #模板文件位置
    servlet
      content-type:text/html #Content-Type 配置
    suffix:.html # 模板文件后缀
```
#### 使用
```java
@Controller
public class UserController {
  
  @GetMapping('/users')
  public ModelAndView list() {
    List<User> users = new ArrayList<>();
    ModelAndView mv = new ModelAndView();
    mv.addObject("user", users);
    mv.setViewName("users");
    return mv;
  }
}
```
约定优于配置，在 template 文件夹下创建 viewName 相同的文件，即`users.html`
```html
<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
<head>
  <meta charset="UTF-8">
  <title>用户<title>
</head>  
<body>
  <table border="1">
    <tr th:each="user:${users}">
      <td th:text="${user.id}"></td>
      <td th:text="${user.name}"></td>
    </tr>
  </table>
</body>
</html>
```  

### FreeMarker 整合
与 Thymeleaf 不同的是，FreeMarker 需要经过解析之后才能在浏览器中显示出来，另外它不仅考验配置 HTML 页面，也可以作为其他模板，对数据进行动态替换使用。以下是整合需要的步骤：

#### 添加依赖
```xml
 <dependency>
   <groupId>org.springframework.boot</groupId>
   <artifactId>spring-boot-starter-freemarker</artifactId>
 </dependency>
```
#### 配置
在 springboot 中的配置文件 application.yml 文件中进行配置， 其前缀定义为`spring.freemarker`, 其默认存放的文件地址为`classpath:/templates/`,文件后缀为`.ftl`，常用的一些配置如下：
```yml
spring
  freemarker
    allow-request-override:false # HttpServletRequest 属性是否覆盖 controller 中的 model 
    allow-session-override:false # HttpSession 属性是否可以覆盖 controller 中的 model
    cache:false #是否开启缓存
    charset:UTF-8 #文件编码
    check-template-location:true #是否检查模板位置
    content-type:text/html #Content-Type的值
    expose-session-attributes:false #是否将 HttpServletRequest 属性添加到 model 中
    expose-session-attributes:false #是否将 HttpSession 属性添加到 model 中
    suffix:.ftl #模板文件后缀
    template-loader-path:classpath:/templates/ #模板文件位置
```
#### 使用
在 templates 文件夹中常见 users.ftl 文件，内容如下：
```html
<!DOTTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>用户信息</title>
</head>
<body>
  <table border="1">
    <#list users as user>
    <tr>
      <td>${user.id}</td>
      <td>${user.name}</td>
    </tr>
    </#list>
  </table>
</body>
</html>
```
以上就是一个简单视图层配置。

(全文完)
