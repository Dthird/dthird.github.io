---
title: 'leetcode442: Find All Duplicates in an Array'
date: 2016-11-17 10:21:23
categories: Programming
tags: [OJ, hash]
---
# 1. Question
[Link](https://leetcode.com/problems/find-all-duplicates-in-an-array/)

Given an array of integers, 1 ≤ a[i] ≤ n (n = size of array), some elements appear **twice** and others appear once.

Find all the elements that appear **twice** in this array.

Could you do it without extra space and in $O(n)$ runtime?

## Example:
```
Input:
[4,3,2,7,8,2,3,1]

Output:
[2,3]
```

# 2. Analysis
# 3. Solution(s)
```python
class Solution(object):
    def findDuplicates(self, nums):
        """
        :type nums: List[int]
        :rtype: List[int]
        """

        res = list()
        for i in xrange(len(nums)):
            if nums[abs(nums[i])-1] > 0:
                nums[abs(nums[i])-1] *= -1
            else:
                res.append(abs(nums[i])) # difference with res.append(i+1) test case: [1,1]
        return res
```
