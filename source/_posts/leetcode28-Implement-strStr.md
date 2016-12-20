---
title: 'leetcode28: Implement strStr()'
date: 2016-12-20 16:33:41
categories: Programming
tags: [OJ, string]
---
# 1. Question
[Link](https://leetcode.com/problems/implement-strstr/)

Implement strStr().

Returns the index of the first occurrence of needle in haystack, or -1 if needle is not part of haystack.
# 2. Analysis
# 3. Solution(s)
```python
class Solution(object):
    def strStr(self, haystack, needle):
        """
        :type haystack: str
        :type needle: str
        :rtype: int
        """
        if needle == "":
            return 0
        i = 0
        while i <= len(haystack)-len(needle):
            if haystack[i] == needle[0]:
                j = 0
                while j < len(needle):
                    if needle[j] != haystack[i+j]:
                        break
                    else:
                        j += 1
                if j == len(needle):
                    return i
            i += 1
        return -1

```
