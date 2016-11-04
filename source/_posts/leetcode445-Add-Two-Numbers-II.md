---
title: 'leetcode445: Add Two Numbers II'
date: 2016-11-04 10:40:55
categories: Programming
tags: [OJ, linked_list]
---

# 1. Question
[Link](https://leetcode.com/problems/add-two-numbers-ii/)

You are given two linked lists representing two non-negative numbers. The most significant digit comes first and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.

You may assume the two numbers do not contain any leading zero, except the number 0 itself.

## Follow up:
What if you cannot modify the input lists? In other words, reversing the lists is not allowed.

## Example:

    Input: (7 -> 2 -> 4 -> 3) + (5 -> 6 -> 4)
    Output: 7 -> 8 -> 0 -> 7
# 2. Analysis
# 3. Solution(s)
```python
# Definition for singly-linked list.
# class ListNode(object):
#     def __init__(self, x):
#         self.val = x
#         self.next = None

class Solution(object):
    def addTwoNumbers(self, l1, l2):
        """
        :type l1: ListNode
        :type l2: ListNode
        :rtype: ListNode
        """
        return self.intToNode(self.nodeToInt(l1) + self.nodeToInt(l2))


    def nodeToInt(self, l):
        """
        :type l: ListNode
        :rtype: int
        """
        res = l.val
        p = l.next
        while p != None:
            res = res * 10 + p.val
            p = p.next
        print res
        return res

    def intToNode(self, i):
        """
        :type i: int
        :rtpye: ListNode
        """
        res = ListNode(i%10)
        i /= 10
        while i != 0:
            tmp = ListNode(i%10)
            tmp.next = res
            res = tmp
            i /= 10
        return res




```
