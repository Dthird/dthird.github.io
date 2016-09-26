---
title: 'hexo: 插入图片'
date: 2016-09-26 17:46:33
categories: Configuration
tags: [hexo]
---

# 1. Problem(s)
hexo 插入本地图片时会很麻烦，不是本地编辑器无法正常显示就是生成的静态网页无法正常显示。
# 2. Solution(s)
解决方法是使用：
>CodeFalling/hexo-asset-image

## 安装过程：

* 首先确认 `_config.yml` 中有 `post_asset_folder:true`；
* 在hexo目录，执行：
```shell
npm install https://github.com/CodeFalling/hexo-asset-image --save
```

## 使用过程
通过执行命令：
```shell
hexo n "hexo: 插入图片"
```
后，在`_posts`目录下，不仅会生成`hexo-插入图片.md`文件，还会生成一个同名的文件夹。如图所示：
![](/hexo-插入图片/Screenshot from 2016-09-26 17-49-08.png)

这样在本地编辑器可以正常预览，而且deploy之后网页也能正常显示了。
