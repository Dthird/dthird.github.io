---
title: 'hihoCoder1399:Shortening Sequence'
date: 2016-10-12 19:07:55
categories: Programming
tags: [OJ, compress]
---
# 1. Question

## Description
[Link](http://hihocoder.com/problemset/problem/1399?sid=942054)

There is an integer array A1, A2 ...AN. Each round you may choose two adjacent integers. If their sum is an odd number, the two adjacent integers can be deleted.

Can you work out the minimum length of the final array after elaborate deletions?

## Input
The first line contains one integer N, indicating the length of the initial array.

The second line contains N integers, indicating A1, A2 ...AN.

For 30% of the data：1 ≤ N ≤ 10

For 60% of the data：1 ≤ N ≤ 1000

For 100% of the data：1 ≤ N ≤ 1000000, 0 ≤ Ai ≤ 1000000000

## Output
One line with an integer indicating the minimum length of the final array.

## Sample Hint
(1,2) (3,4) (4,5) are deleted.

## Sample Input
    7
    1 1 2 3 4 4 5
## Sample Output
    1

# 2. Analysis
观察到只要有一个奇数，这个奇数和之前的所有连续偶数都可以一同消去。

# 3. Solution(s)
Brute-Force solution:
```python
N = int(raw_input())
a = [int(x) for x in raw_input().split()]
a_last = []

while True:
    if len(a) == 0 or len(a) == 1:
        break
    if len(a) == len(a_last):
        break
    a_last = [x for x in a]
    tmp = []
    i = 1
    while i < len(a):
        if (a[i] + a[i-1]) % 2 == 1:
            tmp.append(i-1)
            tmp.append(i)
            i += 2
        else:
            i += 1
    #print tmp
    for j in range(len(tmp)-1, -1, -1):
        del a[tmp[j]]
    #print a
    #print a_last

print len(a)
```

A better one:
```python
N = int(raw_input())
a = [int(x) for x in raw_input().split()]
s = ""

for i in a:
    if i % 2 == 0:
        s += '0'
    else:
        s += '1'
x = s.split('0')

if len(x) == len(s):
    print len(x)
else:
    x = [value for value in x if (value != '1' and value != '')]
    print len(x)

```
