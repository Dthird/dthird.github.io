---
title: 'leetcode447: Number of Boomerangs'
date: 2016-12-08 10:53:43
categories: Programming
tags: [OJ, hash]
---
# 1. Question
[Link](https://leetcode.com/problems/number-of-boomerangs/)

Given $n$ points in the plane that are all pairwise distinct, a "boomerang" is a tuple of points $(i, j, k)$ such that the distance between $i$ and $j$ equals the distance between $i$ and $k$ **(the order of the tuple matters).**

Find the number of boomerangs. You may assume that $n$ will be at most 500 and coordinates of points are all in the range [-10000, 10000] (inclusive).

## Example:
Input:
```
[[0,0],[1,0],[2,0]]
```

Output:
```
2
```

Explanation:
The two boomerangs are [[1,0],[0,0],[2,0]] and [[1,0],[2,0],[0,0]]
# 2. Analysis
# 3. Solution(s)
```python
class Solution(object):
    def numberOfBoomerangs(self, points):
        """
        :type points: List[List[int]]
        :rtype: int
        """
        count = 0
        table = dict()
        for i in xrange(len(points)):
            for j in xrange(i+1, len(points)):
                try:
                    table[self.distanceSquare(points[i], points[j])].append([points[i], points[j]])
                except:
                    table[self.distanceSquare(points[i], points[j])] = [[points[i], points[j]]]

        for k,v in table.items():
            for i in xrange(len(v)):
                for j in xrange(i+1, len(v)):
                    if self.isIExists(v[i], v[j]):
                        count += 2
        return count

    def distanceSquare(self, point1, point2):
        # the result of Square is int, and can be hashed.
        return (point1[0]-point2[0])*(point1[0]-point2[0]) + (point1[1]-point2[1])*(point1[1]-point2[1])

    def isIExists(self, pointsPair1, pointsPair2):
        if pointsPair1[0] == pointsPair2[0] or pointsPair1[0] == pointsPair2[1]:
            return True
        if pointsPair1[1] == pointsPair2[0] or pointsPair1[1] == pointsPair2[1]:
            return True
        return False
```
