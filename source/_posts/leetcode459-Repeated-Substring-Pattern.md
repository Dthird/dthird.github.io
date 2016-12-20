---
title: 'leetcode459: Repeated Substring Pattern'
date: 2016-12-20 17:00:14
categories: Programming
tags: [OJ, string]
---
# 1. Question
[Link](https://leetcode.com/problems/repeated-substring-pattern/)

Given a non-empty string check if it can be constructed by taking a substring of it and appending multiple copies of the substring together. You may assume the given string consists of lowercase English letters only and its length will not exceed 10000.

* Example 1:

```
Input: "abab"

Output: True

Explanation: It's the substring "ab" twice.
```
* Example 2:

```
Input: "aba"

Output: False
```
* Example 3:

```
Input: "abcabcabcabc"

Output: True

Explanation: It's the substring "abc" four times. (And the substring "abcabc" twice.)
```
# 2. Analysis
# 3. Solution(s)
```python
class Solution(object):
    def repeatedSubstringPattern(self, str1):
        """
        :type str: str1
        :rtype: bool
        """
        tmp = None
        if str1 == "": return False
        for i in xrange(len(str1)/2):
            tmp = str1[:i+1]
            #print tmp
            j = 0
            while j < len(str1)-(i+1):
                try:
                    if tmp != str1[j:j+i+1]:
                        break
                    else:
                        j += i+1
                except:
                    break
            if j == len(str1)-(i+1) and tmp == str1[len(str1)-len(tmp):]:
                return True
        return False
        
```
