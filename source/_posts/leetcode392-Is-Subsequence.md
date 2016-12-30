---
title: 'leetcode392: Is Subsequence'
date: 2016-12-30 10:17:54
categories: Programming
tags: [OJ, greedy, string]
---
# 1. Question
[Link](https://leetcode.com/problems/is-subsequence/)

Given a string **s** and a string **t**, check if **s** is *subsequence* of **t**.

You may assume that there is only lower case English letters in both **s** and **t**. **t** is potentially a very long (length ~= 500,000) string, and **s** is a short string (<=100).

A subsequence of a string is a new string which is formed from the original string by deleting some (can be none) of the characters without disturbing the relative positions of the remaining characters. (ie, "ace" is a subsequence of "abcde" while "aec" is not).

```python
Example 1:
s = "abc", t = "ahbgdc"

Return True.
```
```python
Example 2:
s = "axc", t = "ahbgdc"

Return False.
```

# 2. Analysis
## python ```all(iterable)``` function
Return True if all elements of the iterable are true (or if the iterable is empty). Equivalent to:
```python
def all(iterable):
    for element in iterable:
        if not element:
            return False
    return True
```

## python ```iter(o[, sentinel])``` function
Return an iterator object. The first argument is interpreted very differently depending on the presence of the second argument. Without a second argument, o must be a collection object which supports the iteration protocol (the ```__iter__()``` method), or it must support the sequence protocol (the ```__getitem__()``` method with integer arguments starting at 0). If it does not support either of those protocols, TypeError is raised. If the second argument, sentinel, is given, then o must be a callable object. The iterator created in this case will call o with no arguments for each call to its next() method; if the value returned is equal to sentinel, StopIteration will be raised, otherwise the value will be returned.

One useful application of the second form of iter() is to read lines of a file until a certain line is reached. The following example reads a file until the readline() method returns an empty string:
```python
with open('mydata.txt') as fp:
    for line in iter(fp.readline, ''):
        process_line(line)
```
# 3. Solution(s)
A Memory Limit Exceeded solution:
```python
class Solution(object):
    def isSubsequence(self, s, t):
        """
        :type s: str
        :type t: str
        :rtype: bool
        """
        if len(s) == 0:
            return True
        elif t.find(s[0]) == -1:
            return False
        elif len(s) == 1:
            return True
        else:

            return self.isSubsequence(s[1:], t[t.find(s[0])+1:])
```

A two line solution:
```python
class Solution(object):
    def isSubsequence(self, s, t):
        """
        :type s: str
        :type t: str
        :rtype: bool
        """
        t = iter(t)
        return all(c in t for c in s)
```
