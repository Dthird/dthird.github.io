---
title: 'github+hexo: 如何从已有的github仓库进行配置'
date: 2016-09-22 21:11:36
categories: Configuration
tags: [github, hexo]
---

# 如何从已有的github仓库进行配置继续生成hexo静态网页

## 出处
* 作者：CrazyMilk
* [链接](https://www.zhihu.com/question/21193762/answer/79109280)
* 来源：知乎
* 著作权归作者所有。

**本人对原作做了一些简化和修改，并附上了简单的初始化和日常更新脚本。**

## 搭建和使用过程
### 关于搭建的流程

1. 创建仓库，http://CrazyMilk.github.io；
2. 创建两个分支：master 与 hexo；
3. 设置hexo为默认分支（因为我们只需要手动管理这个分支上的Hexo网站文件）；
4. 使用git clone git@github.com:CrazyMilk/CrazyMilk.github.io.git拷贝仓库；
5. 在本地http://CrazyMilk.github.io 文件夹下通过Git bash依次执行npm install hexo、~~hexo init、~~npm install 和 npm install hexo-deployer-git（此时当前分支应显示为hexo）;
6. 修改_config.yml中的deploy参数，分支应为master；
7. 依次执行git add .、git commit -m "..."、git push origin hexo提交网站相关的文件；
8. 执行hexo g -d生成网站并部署到GitHub上。

这样一来，在GitHub上的http://CrazyMilk.github.io 仓库就有两个分支，一个hexo分支用来存放网站的原始文件，一个master分支用来存放生成的静态网页。完美( •̀ ω •́ )y！
```shell
#!/bin/bash

echo "npm install hexo --save"
npm install hexo --save
echo "npm install"
npm install
echo "npm install hexo-deployer-git --save"
npm install hexo-deployer-git --save
```

### 关于日常的改动流程
在本地对博客进行修改（添加新博文、修改样式等等）后，通过下面的流程进行管理。

1. 依次执行git add .、git commit -m "..."、git push origin hexo指令将改动推送到GitHub（此时当前分支应为hexo）；
2. 然后才执行hexo g -d发布网站到master分支上。

```shell
#!/bin/bash

echo "git add ."
git add .
echo "git commit"
git commit -m "Add articles"
echo "git push origin hexo"
git push origin hexo

echo "hexo g -d"
hexo g -d

```

~~虽然两个过程顺序调转一般不会有问题，不过逻辑上这样的顺序是绝对没问题的（例如突然死机要重装了，悲催....的情况，调转顺序就有问题了）。~~

**郑重说明：两个过程的顺序绝对不能调换！调换将导致仅将hexo g新生成的css等文件push至master分支并删去原有的index.html等文件，导致页面无法显示。**
