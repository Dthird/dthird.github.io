---
title: 'hihoCoder1051: 补提交卡'
date: 2016-09-21 15:44:17
categories: Programming
tags: [hihoCoder, greedy, enumeration]
---

# 1. Question
## Description
[题目链接](http://hihocoder.com/problemset/problem/1051)

小Ho给自己定了一个宏伟的目标：连续100天每天坚持在hihoCoder上提交一个程序。100天过去了，小Ho查看自己的提交记录发现有N天因为贪玩忘记提交了。于是小Ho软磨硬泡、强忍着小Hi鄙视的眼神从小Hi那里要来M张"补提交卡"。每张"补提交卡"都可以补回一天的提交，将原本没有提交程序的一天变成有提交程序的一天。小Ho想知道通过利用这M张补提交卡，可以使自己的"最长连续提交天数"最多变成多少天。
## Input

第一行是一个整数T(1 <= T <= 10)，代表测试数据的组数。

每个测试数据第一行是2个整数N和M(0 <= N, M <= 100)。第二行包含N个整数a1, a2, ... aN(1 <= a1 < a2 < ... < aN <= 100)，表示第a1, a2, ...  aN天小Ho没有提交程序。
## Output

对于每组数据，输出通过使用补提交卡小Ho的最长连续提交天数最多变成多少。

Sample Input

    3  
    5 1  
    34 77 82 83 84  
    5 2  
    10 30 55 56 90  
    5 10  
    10 30 55 56 90

Sample Output

    76  
    59
    100
***
## 2. Analysis
要消除连续的m才能使收益最大，每个区间的a[i + m ] - a[ i - 1] - 1的最大值即所求。
***
## 3. Solution(s)
```python
T = int(raw_input())
for i in range(T):
    (N, M) = (int(x) for x in raw_input().split())
    days = [int(x) for x in raw_input().split()]
    if N <= M:
        print 100
        continue
    maxSeq = days[0+M] - 1
    for j in range(1, N-M):
        maxSeq = max(maxSeq, days[j+M] - days[j-1] - 1) # key point
    print maxSeq

```
