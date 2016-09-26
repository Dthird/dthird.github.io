---
title: hexo MathJax
date: 2016-09-26 18:51:46
categories: Configuration
tags: hexo
---

本文引用自[Link](http://catx.me/2014/03/09/hexo-mathjax-plugin/)，版权归作者所有。

## 介绍
Hexo不支持数学公式，网上可以找到很多人肉修改theme使其支持用MathJax渲染公式的方法，主要分为两个步骤：

在theme的header中插入对MathJax CDN script的引用，并配置inline math
在文章中用inline math插入公式
这个方法有两个明显的缺点：

* 需要人肉进行的工作太多
* 遇到特殊符号需要人肉escape，否则会被markdown parser吃掉

于是开发了一个插件，实现：
* 自动部署MathJax
* 添加MathJax Tag

## 安装
```shell
npm install hexo-math --save
```
## 初始化
在blog文件夹中执行：

```shell
$ hexo math install
```
在`_config.yml`文件中添加：
```
plugins:
- hexo-math
```

## 使用

MathJax Inline:
```
Simple inline $a = b + c$.
```
效果：

Simple inline $a = b + c$.

MathJax Block:
```
$$\frac{\partial u}{\partial t}
= h^2 \left( \frac{\partial^2 u}{\partial x^2} +
\frac{\partial^2 u}{\partial y^2} +
\frac{\partial^2 u}{\partial z^2}\right)$$
```
效果：

$$\frac{\partial u}{\partial t}
= h^2 \left( \frac{\partial^2 u}{\partial x^2} +
\frac{\partial^2 u}{\partial y^2} +
\frac{\partial^2 u}{\partial z^2}\right)$$
