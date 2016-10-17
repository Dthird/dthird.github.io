---
title: 'hihoCoder1144: 01-string'
date: 2016-10-17 09:54:08
categories: Programming
tags: [OJ, string]
---
# 1. Question
## Description
[Link](http://hihocoder.com/problemset/problem/1144?sid=944469)
Given two integers n and m, is there a string containing exactly n "0"s and m "1"s while it doesn't contain any substring of "001" or "11"?

If such strings exist output the lexicographically smallest one. Otherwise output NO.

## Input
One line with two integers, determining n and m (0<=n,m<=100000,0<n+m)

## Output
One line with the lexicographically smallest string which is the answer or NO.

## Sample Input
    2 3
## Sample Output
    10101
# 2. Analysis

# 3. Solution(s)
```python
(n, m) = (int(x) for x in raw_input().split())

if n < m-1:
    print "NO"
else:
    res = ""
    if n >= m:
        for i in range(m):
            res += "01"
        for i in range(n-m):
            res += "0"
    elif n == m-1:
        for i in range(n):
            res += "10"
        res += "1"

    print res
```
