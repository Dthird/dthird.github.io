---
title: Android system.img镜像文件的解压和压缩
date: 2016-11-22 16:18:24
categories: Android
tags: [android]
---

# 判断文件类型
Android 中的 system.img可能有是**yaffs2**或者**ext**的文件系统。可以通过```file```命令识别：
```
~$file system.img
```
得到的结果可能有两种：
1. ```system.img: Linux rev 1.0 ext4 filesystem data, UUID=...```

2. ```system.img: VMS Alpha executable```

第一种为ext文件系统，第二种为yaffs2文件系统。

# ext文件系统
通过mount和unmount挂载和卸载。
* 挂载：```mount```
* 卸载：```unmount```
# yaffs2文件系统(?with some problems)
通过安装[yaffs2utils](https://code.google.com/archive/p/yaffs2utils/downloads)进行解压和压缩。
* 解压：```unyaffs2```
* 压缩：```mkyaffs2```，注意参数```--yaffs-ecclayout```
