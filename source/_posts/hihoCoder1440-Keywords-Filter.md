---
title: 'hihoCoder1440 : Keywords Filter'
date: 2016-12-21 14:29:25
categories: Programming
tags: [OJ, string]
---

# 1. Question
## Description
You are given a string S which consists of only lower case letters and N keyword W1, W2, ... WN which also consists of only lower case letters. For each appearance of a keyword in S you need to change the letters matching the keyword into '\*'.

Assume ```S = "abcxyzabcd"``` and keywords are {"abc", "cd"}, the filtered S' will be ```"***xyz****"```.

## Input
The first line contains an integer N. (1 <= N <= 1000)

The following N lines each contains a keyword. The total length of the keywords is no more than 100000.

The last line contains the string S. The length of S is no more than 100000.

## Output
The filtered string.

## Sample Input
```
2  
abc  
cd  
abcxyzabcd
```
##Sample Output
```
***xyz****
```
# 2. Analysis
# 3. Solution(s)
```python
N  = int(raw_input())
keywords = list()
for i in xrange(N):
    keywords.append(raw_input())
S = raw_input()

flag = [0] * len(S)

for word in keywords:
    tmp = 0
    while S.count(word, tmp) != 0:
        index = S.find(word, tmp)
        for i in xrange(len(word)):
            flag[index + i] = 1
        tmp = index + 1
res = ""
for i in xrange(len(flag)):
    if flag[i]:
        res += S[i]
    else:
        res += "*"
print res
```
