---
title: 'leetcode49: Group Anagrams'
date: 2016-11-21 11:05:33
categories: Programming
tags: [OJ, string, hash]
---
# 1. Question
[Link](https://leetcode.com/problems/anagrams/)

Given an array of strings, group anagrams together.

## For example:

Given: ```["eat", "tea", "tan", "ate", "nat", "bat"]```,

Return:
```
[
  ["ate", "eat","tea"],
  ["nat","tan"],
  ["bat"]
]
```

# 2. Analysis
# 3. Solution(s)
```python
class Solution(object):
    def groupAnagrams(self, strs):
        """
        :type strs: List[str]
        :rtype: List[List[str]]
        """
        dic = dict()
        for i in strs:
            try:
                dic[str(sorted([x for x in i]))].append(i)  # Set ans List are unhashable
            except:
                dic[str(sorted([x for x in i]))] = [i]
        res = list()
        for k,v in dic.iteritems():
            res.append(v)
        return res
```
