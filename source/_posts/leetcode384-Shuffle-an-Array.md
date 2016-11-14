---
title: 'leetcode384: Shuffle an Array'
date: 2016-11-14 14:35:19
categories: Programming
tags: [OJ, permutations_and_combinations]
---
# 1. Question
[Link](https://leetcode.com/problems/shuffle-an-array/)

Shuffle a set of numbers without duplicates.

Example:
```java
// Init an array with set 1, 2, and 3.
int[] nums = {1,2,3};
Solution solution = new Solution(nums);

// Shuffle the array [1,2,3] and return its result. Any permutation of [1,2,3] must equally likely to be returned.
solution.shuffle();

// Resets the array back to its original configuration [1,2,3].
solution.reset();

// Returns the random shuffling of array [1,2,3].
solution.shuffle();
```
# 2. Analysis
Using python permutations and combinations package([itertools](https://docs.python.org/2/library/itertools.html)) or random package([shuffle](https://docs.python.org/2/library/random.html))

# 3. Solution(s)
Permutations:
```python
import itertools
import random

class Solution(object):

    def __init__(self, nums):
        """

        :type nums: List[int]
        :type size: int
        """
        self.array = nums


    def reset(self):
        """
        Resets the array to its original configuration and return it.
        :rtype: List[int]
        """
        return self.array


    def shuffle(self):
        """
        Returns a random shuffling of the array.
        :rtype: List[int]
        """
        reslist = list(itertools.permutations(self.array, len(self.array)))
        print reslist
        return reslist[random.randint(0, len(reslist)-1)]



# Your Solution object will be instantiated and called as such:
# obj = Solution(nums)
# param_1 = obj.reset()
# param_2 = obj.shuffle()
```

random shuffle:
```python
import random

class Solution(object):

    def __init__(self, nums):
        """

        :type nums: List[int]
        :type size: int
        """
        self.array_original = self.array = nums

    def reset(self):
        """
        Resets the array to its original configuration and return it.
        :rtype: List[int]
        """
        self.array = self.array_original
        return self.array


    def shuffle(self):
        """
        Returns a random shuffling of the array.
        :rtype: List[int]
        """
        random.shuffle(self.array)
        return self.array


# Your Solution object will be instantiated and called as such:
# obj = Solution(nums)
# param_1 = obj.reset()
# param_2 = obj.shuffle()
```
