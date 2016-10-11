---
title: 'leetcode6: ZigZag Conversion'
date: 2016-10-11 10:20:00
categories: Programming
tags: [OJ, math]
---

# 1. Question
[Link](https://leetcode.com/problems/zigzag-conversion/)

The string "PAYPALISHIRING" is written in a zigzag pattern on a given number of rows like this: (you may want to display this pattern in a fixed font for better legibility)

    P   A   H   N
    A P L S I I G
    Y   I   R
And then read line by line: "PAHNAPLSIIGYIR"
Write the code that will take a string and make this conversion given a number of rows:
```
string convert(string text, int nRows);
```

convert("PAYPALISHIRING", 3) should return "PAHNAPLSIIGYIR".
# 2. Analysis
ZigZag 即循环对角结构：

    nRows = 2
    0 2 4 6 8
    1 3 5 7 9

    nRows = 3
    0   4   8
    1 3 5 7 9
    2   6

    nRows = 4
    0     6
    1   5 7
    2 4   8
    3     9


# 3. Solution(s)
```python
class Solution(object):
    def convert(self, s, numRows):
        """
        :type s: str
        :type numRows: int
        :rtype: str
        """
        if numRows == 1:
            return s
        rows = [""] * numRows
        k= 2 * numRows - 2
        for i, ch in enumerate(s):
            r = min(i%k, k-i%k)   # key
            rows[r] += ch

        res = ""
        for row in rows:
            res +=''.join(row)

        return res
```
