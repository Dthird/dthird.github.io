---
title: 'leetcode387: First Unique Character in a String'
date: 2016-11-15 09:41:20
categories: Programming
tags: [OJ, hash, string]
---
# 1. Question
[Link](https://leetcode.com/contest/warm-up-contest/problems/first-unique-character-in-a-string/)

Given a string, find the first non-repeating character in it and return it's index. If it doesn't exist, return -1.

**Examples:**
```python
s = "leetcode"
return 0

s = "loveleetcode"
return 2
```
**Note:** You may assume the string contain only lowercase letters.
# 2. Analysis
# 3. Solution(s)
```python
class Solution(object):
    def firstUniqChar(self, s):
        """
        :type s: str
        :rtype: int
        """
        dic = dict()
        for i in s:
            try:
                dic[i] += 1
            except:
                dic[i] = 1

        for index, element in enumerate(s):
            if dic[element] == 1:
                return index
        return -1
```
