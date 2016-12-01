---
title: 'leetcode221: Maximal Square'
date: 2016-12-01 12:30:30
categories: Programming
tags: [OJ, dp]
---
# 1. Question
[Link](https://leetcode.com/problems/maximal-square/)

Given a 2D binary matrix filled with 0's and 1's, find the largest square containing only 1's and return its area.

For example, given the following matrix:
```
1 0 1 0 0
1 0 1 1 1
1 1 1 1 1
1 0 0 1 0
```
Return 4.
# 2. Analysis
# 3. Solution(s)
```python
class Solution(object):
    def maximalSquare(self, matrix):
        """
        :type matrix: List[List[str]]
        :rtype: int
        """
        if not matrix: return 0
        row, col = len(matrix), len(matrix[0])
        for i in xrange(1, row):
            for j in xrange(1, col):
                if matrix[i][j] == "1" and matrix[i-1][j]!="0" and matrix[i][j-1]!="0" and matrix[i-1][j-1]!="0":
                    matrix[i][j] = str(min(int(matrix[i-1][j-1]),int(matrix[i-1][j]),int(matrix[i][j-1]))+1)
        # display
        for i in xrange(row):
            for j in xrange(col):
                print matrix[i][j],
            print ""

        x = 0
        for i in xrange(row):
            for j in xrange(col):
                if x < int(matrix[i][j]):
                    x = int(matrix[i][j])
        return x*x
```
