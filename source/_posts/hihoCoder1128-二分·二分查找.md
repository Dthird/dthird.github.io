---
title: 'hihoCoder1128: 二分·二分查找'
date: 2016-09-25 10:31:24
categories: Programming
tags: [OJ, binary_search]
---

# 1. Question

## 描述
[Link](http://hihocoder.com/problemset/problem/1128)

Nettle最近在玩《艦これ》，因此Nettle收集了很多很多的船(这里我们假设Nettle氪了很多金，开了无数个船位)。去除掉重复的船之后，还剩下N(1≤N≤1,000,000)种不同的船。每一艘船有一个稀有值，任意两艘船的稀有值都不相同，稀有值越小的船越稀有，价值也就越高。
Nettle现在通过大建又造出了一艘船，他想知道这艘船是不是重复的。如果是重复的，那么这艘船在Nettle所有的船里面稀有值排多少位。

### 问题一
Nettle已经先把自己所有船按照稀有值从小到大排列好了(a[1..N])，我们要做的是看看新得到的船(假设稀有值为K)是否在这个序列中，且有对应的a[i]=K时，i为多少？

>提示一：有序数组的二分查找

### 问题二
因为Nettle的船太多了，他不愿意去给所有船按照稀有值排序，而是直接告诉了我们每一艘船的稀有值。在这种情况下我们该如何解决这个问题呢？

> 提示二：非有序数组的二分查找

## 输入

第1行：2个整数N,K。N表示数组长度，K表示需要查找的数；
第2行：N个整数，表示a[1..N]，保证不会出现重复的数，1≤a[i]≤2,000,000,000。
## 输出

第1行：一个整数t，表示K在数组中是第t小的数，若K不在数组中，输出-1。
Sample Input

    10 5180
    2970 663 5480 4192 4949 1 1387 4428 5180 2761

Sample Output

    9


# 2. Analysis
非有序数组的二分查找？可以仅遍历一遍记录小于Ｋ的元素的个数，时间复杂度为O(N),空间复杂度为in place。但这与二分查找就没有什么关系了啊...
# 3. Solution(s)
```python
(N, K) = (int(x) for x in raw_input().split())
a = [int(x) for x in raw_input().split()]
a.sort()  # distinguish sort() from sorted(): return value and their advance functions

low = 0
high = N - 1
while low <= high:
    mid = (low + high) / 2
    if a[mid] == K:
        print mid + 1
        break
    elif a[mid] > K:
        high = mid - 1
    else:
        low = mid + 1

if low > high:
    print -1
```
