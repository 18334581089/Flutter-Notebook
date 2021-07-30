# githubappflutter

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


#### 7/23
1. 目前制定了新的计划，github_client_app 由于版本问题暂时先不看，尝试flutter2的实战项目
2. 需要从头写，所以日志会很长，
3. [文档地址](https://mp.weixin.qq.com/mp/homepage?__biz=Mzg3NTA3MDIxOA==&hid=2&sn=679ad0212470f5155c4412e678411374&scene=18#wechat_redirect)
4. 需要重新搭建环境，所以要有很多准备

- **环境搭建**
1. 前言
> 兼容性无疑最好
> HotLoad 比 RN 和 Weex好更多
2. 安装flutter sdk
> a：镜像
> b：Flutter SDK，另外：[flutter 更新地址](https://flutterchina.club/upgrading/)
> c：更新环境变量[详情](https://flutterchina.club/setup-windows/)
> d: flutter doctor 
3. Android Studio
> a： 下载
> b:  [Android设备上运行您的flutter](https://flutterchina.club/setup-windows/)
> c:  [配置Android模拟器](https://flutterchina.club/setup-windows/)

**执行 flutter doctor 问题**
> Android Studio (not installed)
> Android toolchain - develop for Android devices (Android SDK version 31.0.0)
    X No Java Development Kit (JDK) found; You must have the environment variable JAVA_HOME set and the java binary in
      your PATH. You can download the JDK from https://www.oracle.com/technetwork/java/javase/downloads/.

- 降低jdk版本重新尝试

#### 7/26
- 尝试降低版本
1. 删除之前下载jdk
2. 下载jdk 8.0版本 （安装完成）
3. flutter doctor 
> 报错1

**VersionCheckError Command exited with code 128: git fetch __flutter_version_check__ stable
Standard error: fatal: unable to access 'https://github.com/flutter/flutter.git/': OpenSSL SSL_connect: SSL_ERROR_SYSCALL in
connection to github.com:443**

> 报错2，还是之前的

**Android toolchain - develop for Android devices (Android SDK version 31.0.0)
    X No Java Development Kit (JDK) found; You must have the environment variable JAVA_HOME set and the java binary in your
      PATH. You can download the JDK from https://www.oracle.com/technetwork/java/javase/downloads/.**

- 解决报错
1. 关于报错1，在flutter console中执行flutter doctor 没有报错
> 第一个问题暂时解决
2. 之前的报错还在提示
> 不一样的是，这次，提示了要配置环境变量
> **转折** 在flutter console中执行的时候，现时以下提示

**Android toolchain - develop for Android devices (Android SDK version 31.0.0)
    ! Some Android licenses not accepted.  To resolve this, run: flutter doctor --android-licenses**
> 所以直接执行提示的命令
> 执行结果： All SDK package licenses accepted

- 再次执行doctor
> 报错:

**Android Studio (not installed)**

> 通过查看[博客解决](https://blog.csdn.net/Tymt_tt/article/details/117710044)


- 再次执行doctor
> 报错1:

**Android toolchain - develop for Android devices (Android SDK version 31.0.0)
    X Android license status unknown.
      Run `flutter doctor --android-licenses` to accept the SDK licenses.
      See https://flutter.dev/docs/get-started/install/windows#android-setup for more details.**

> 还是和之前一样的报错
> 执行 flutter doctor --android-licenses
> 报错:

**NoClassDefFoundError: javax/xml/bind/annotation/XmlSchema**
> 又回到了之前的问题,
> 我查看java 版本已经下载的是1.8(重启也没有作用)

#### 7/27
- 解决上次的报错问题
**NoClassDefFoundError**
> 导致这个问题是因为,版本高导致的没有找到对应类
> 如果版本是1.8还有这个问题就是可能没有配置环境变量

- 重新执行 flutter doctor,没有问题

- Android studio 之前的报错
> 解决
> [博客: 因为之前配置的jdk路径有问题导致](https://blog.csdn.net/hubojing/article/details/106688617)

**配置路径没有解决问题**

> 感觉应该是: android sdk 没有配置路径(而不是jdk)

**解决问题**
> 还是博客里面讲的, 下拉选择的不是jdk  而是  sdk ,选择后,重新启动项目就好了

- 开始看语法

- 初始化一个flutter项目

#### 7/28

**通过模拟器启动项目时报错**

```Exception in thread "main" java.net.ConnectException: Connection timed out```

#### 7/29

- 解决报错

1. 目前网上大部分写的是: 因为网络问题导致下载包失败,需要自己手动下载本地,然后在引入就好了

2. 但是,我的报错内容中并没有提是版本下载失败,和他们控制台打印的有些出入

3. 既然,chrome 端可以打开,就先这样用吧(半个小时没解决)

#### 7/30

1. 新的报错,使用模拟器打开flutter项目异常