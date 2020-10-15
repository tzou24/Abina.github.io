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

VSCode 编辑器 java 开发
### 下载
进入官方网站进行下载
> code.visualstudio.com
> java tutorial

### 下载默认英文， 修改为中文字体
1、安装插件：ctrl+shift+p
2、选择：Confirgure Display Language
3、选择点击：Install additional languales
4、install -> Chinese(Simplified)
5、重新启动 -> Restart Now

### 下载安装插件(Installing extension)
- Auto Close Tag --开关闭代码块 
- Beautify  --文件夹图标美化
- Language Support for java(TM) by Red Hat --红帽子 Java 语言支持
- Debugger for Java --调试 Java 插件
- Java Test Reuner --支持单元测试插件
- Maven for Java --支持 Maven 插件
- Project Manager for Java 
- Lombok --支持注解
- *Project Manager 项目管理工具，配置多个可切换的文件夹
- Markdown Preview Github Styling --Github 预览样式
- Markdown All in One --Markdown 语法助手
- SQLTools --连接数据库工具
- SQLTools MySQL/MariaDB --支持 mysql 数据库

### Settings.json Configure
• settings.json ->
• Maven Path : like :D:\Java\apache-maven-3.5.2\conf\settings.xml
• "java.home": "C:\Program Files\Java\jre1.8.0_31\bin",
"java.configuration.maven.userSettings": "D:\Java\apache-maven-3.5.2\conf\settings.xml"
• 终端接管：terminal.integrated.shell.windows ->  "C:\Program Files\Git\bin\bash.exe"  (注意：需要配置 bin 文件夹下 bash.exe, 配置成 git-bash.exe 会单独打开窗口)
• 解决 git bash 控制台打印没有中文问题
• 搜索链接：https://www.php.cn/tool/vscode/442294.html
• 解决 GIT 时间 log 出现中文乱码， 依次执行下面命令
• git config --global i18n.commitencoding utf-8
• git config --global i18n.logoutputencoding utf-8
• export LESSCHARSET=utf-8
• 解决打开文件时不保留窗口，会被新打开文件覆盖：在设置中找到 Enable Preview 取消勾选即可

### java 8 使用注意
• 由于版本问题，默认安装的 Language Support for java(TM) by Red Hat 版本 0.67 ，vscode 会建议使用 jdk 11， 所以需要将 Language Support for java(TM) by Red Hat 降版本至 0.64 一下，已支持 java 8 的使用
• 包含 Debugger for Java 版本也需要降几个版本，不然启动时会有警告
• 包含 Java Test Reuner 也需要降几个版本，否则在测试工具栏中找不到单元测试内容，另外需要注意的是 java test 包命名需要按照：
test.java.*
这个格式包名路径才能被检测
• 在更新另一个版本后，需要打开扩展，进行修改为不自动更新插件。
"extensions.autoUpdate": false
• 启动 main 方法出现，无法加载 main 方法时，需要执行：java:force java compilation 快捷键： shift+alt+b, 然后选择 [Incremental(新增部分)/Full(全量)]
• 在 Springboot 项目中， 执行 shift+alt+b, 选择 Incremental 后，会自动重启。

### 快捷键
• ctrl+shift+r  同 IDEA 查询文件
在弹出的输入中，输入 > 进入功能项选择，: 进入文件具体行数， 清空则转到文件
• 打开输入框，输入：Reload Window 重载编辑器
• Ctrl+k   预览 Markdown 文本
• Shift+Alt+R 打卡文件资源管理器

### 配置启动 java
{
    // 使用 IntelliSense 了解相关属性。 
    // 悬停以查看现有属性的描述。
    // 欲了解更多信息，请访问: https://go.microsoft.com/fwlink/?linkid=830387
    "version": "0.2.0",
    "configurations": [
        {
            "type": "java",
            "name": "代码生成器",
            "request": "launch",
            "mainClass": "io.renren.RenrenApplication",
            "projectName": "renren-generator"
        }
    ]
}