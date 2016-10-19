---
title: 'Error: Android emulator problem'
date: 2016-10-19 19:42:32
categories: Configuration
tags: android
---

# 1. Problem
Get error while running Android emulator in [Android studio]().

Error msg:
```shell
libGL error: unable to load driver: r600_dri.so
libGL error: driver pointer missing
libGL error: failed to load driver: r600
libGL error: unable to load driver: swrast_dri.so
libGL error: failed to load driver: swrast
```

# 2. Solution

Verify that you have installed in your system lib64stdc++6

With a 32 bits operating system :
```shell
apt-get install lib64stdc++6
```
With a 64 bits operating system with multiarch enabled :
```shell
apt-get install lib64stdc++6:i386
```
Then link the new installed libraries to the android sdk tools path
```shell
$ cd $ANDROID_HOME/Sdk/tools/lib64/libstdc++
$ mv libstdc++.so.6 libstdc++.so.6.bak
$ ln -s /usr/lib64/libstdc++.so.6 $ANDROID_HOME/Sdk/tools/lib64/libstdc++
```
