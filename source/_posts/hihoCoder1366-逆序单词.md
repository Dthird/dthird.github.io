---
title: 'hihoCoder1366: 逆序单词'
date: 2016-10-14 15:47:39
categories: Programming
tags: [OJ, string, hash]
---

# 1. Question
## Description
[Link](http://hihocoder.com/problemset/problem/1366?sid=943293)
在英文中有很多逆序的单词，比如dog和god，evil和live等等。

现在给出一份包含N个单词的单词表，其中每个单词只出现一次，请你找出其中有多少对逆序单词。

## Input
第1行：1个整数，N，表示单词数量。2≤N≤50,000。

第2..N+1行：每行1个单词，只包含小写字母，每个单词长度不超过16个字母。保证每个单词只出现一次，且不会出现回文单词（即一个单词倒序还是它自己，比如eye）。

## Output
第1行：1个整数，表示单词表中逆序单词的对数。

## Sample Input
    6
    dog
    live
    hiho
    evil
    coder
    god
## Sample Output
    2
# 2. Analysis
# 3. Solution(s)
Brute-Force solution:
```python
N = int(raw_input())
words = []
for i in range(N):
    words.append(raw_input())

count = 0
for i in range(len(words)):
    for j in range(i+1, len(words)):
        if words[j] == words[i][::-1]:
            count += 1

print count
```
Hash solution:
```python
N = int(raw_input())
words = {}
for i in range(N):
    word = raw_input()
    if word not in words:
        words[word] = 1
        words[word[::-1]] = 1
    else:
        words[word] += 1
        words[word[::-1]] += 1
count = 0
for word in words.keys():
    if words[word] == 2:
        count += 1

print count/2
```
