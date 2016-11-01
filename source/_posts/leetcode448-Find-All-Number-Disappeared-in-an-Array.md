---
title: 'leetcode448: Find All Number Disappeared in an Array'
date: 2016-11-01 09:46:55
categories: Programming
tags: [OJ, hash]
---
# 1. Question
[Link](https://leetcode.com/problems/find-all-numbers-disappeared-in-an-array/)

Given an array of integers where 1 ≤ a[i] ≤ n (n = size of array), some elements appear twice and others appear once.

Find all the elements of [1, n] inclusive that do not appear in this array.

Could you do it without extra space and in $O(n)$ runtime? You may assume the returned list does not count as extra space.

Example:

    Input:
    [4,3,2,7,8,2,3,1]

    Output:
    [5,6]
# 2. Analysis
Mark the according index with negative flag. Similar to hash solution.
# 3. Solution(s)
One line solution:
```python
class Solution(object):
    def findDisappearedNumbers(self, nums):
        """
        :type nums: List[int]
        :rtype: List[int]
        """
        return list(set([x for x in range(1,len(nums)+1)]) - set(nums))
```
Without extra space and in $O(n)$ runtime:
```python
class Solution(object):
    def findDisappearedNumbers(self, nums):
        """
        :type nums: List[int]
        :rtype: List[int]
        """
        res = []
        for i in range(len(nums)):
            index = abs(nums[i]) - 1
            if nums[index] > 0:
                nums[index] *= -1

        for i in range(len(nums)):
            if nums[i] > 0:
                res.append(i+1)
        return res
```
