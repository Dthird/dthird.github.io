---
title: 'hihoCoder1361: Playfair密码表'
date: 2016-10-15 10:56:57
categories: Programming
tags: [OJ, string]
---
# 1. Question
## Description
[Link](http://hihocoder.com/problemset/problem/1361?sid=943634)

小Hi和小Ho经常用Playfair密码表加密自己的代码。 密码表是按以下步骤生成的。

1. 随机选择一个只包含大写字母的单词S作为密钥。  

2. 将S中的所有字母J替换为字母I。  

3. 将S中的字母依次填写进一个5x5的矩阵，按照从上到下、从左到右的顺序填充格子。填充过程中略过已经在密码表中的字母。  

4. 将'A'-'I', 'K'-'Z'(除去J之外的所有大写字母)中没有出现在密码表中的大写字母按照字母表顺序填入矩阵剩余的格子中。

举个例子：单词DIJSTRA，替换字母得到DIISTRA；将DIISTRA填入矩阵得到的密码表为(注意第二个I被略过了)：

    DISTR
    A....
    .....
    .....
    .....
最后将剩余字母填入，得到密码表：

    DISTR
    ABCEF
    GHKLM
    NOPQU
    VWXYZ
给定作为密钥的单词，你能求出密码表吗？

## Input
第1行：一行字符串，只包含大写字母，长度不超过200

## Output
共5行，每行5个字母，表示密码表。

##Sample Input
    HIHOCODER
##Sample Output
    HIOCD
    ERABF
    GKLMN
    PQSTU
    VWXYZ
# 2. Analysis
# 3. Solution(s)
```python
word = list(raw_input())
part1 = [chr(i).upper() for i in range(97,106)]
part2 = [chr(i).upper() for i in range(107,123)]
in_list = []
res = [""] * 5
i = 0

for j in range(len(word)):
    if word[j] == 'J':
        word[j] = 'I'

print word

for j in word:
    if i >= 25: break
    if j not in in_list:
        in_list.append(j)
        res[i/5] += j
        i += 1

for j in part1:
    if i >= 25: break
    if j not in in_list:
        in_list.append(j)
        res[i/5] += j
        i += 1

for j in part2:
    if i >= 25: break
    if j not in in_list:
        in_list.append(j)
        res[i/5] += j
        i += 1

for j in res:
    print j


```
