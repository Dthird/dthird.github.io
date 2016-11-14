---
title: 'leetcode173: Binary Search Tree Iterator'
date: 2016-11-14 11:12:17
categories: Programming
tags: [OJ, tree, binary_search]
---

# 1. Question
[Link](https://leetcode.com/problems/binary-search-tree-iterator/)

Implement an iterator over a binary search tree (**BST**). Your iterator will be initialized with the root node of a BST.

Calling ```next()``` will return the next smallest number in the BST.

Note: ```next()``` and ```hasNext()``` should run in average $O(1)$ time and uses $O(h)$ memory, where $h$ is the height of the tree.
# 2. Analysis
**Key:** Using two pointers.
# 3. Solution(s)
```python
# Definition for a  binary tree node
# class TreeNode(object):
#     def __init__(self, x):
#         self.val = x
#         self.left = None
#         self.right = None

class BSTIterator(object):
    def __init__(self, root):
        """
        :type root: TreeNode
        """
        self.root = root

    def hasNext(self):
        """
        :rtype: bool
        """
        return True if self.root else False
    def next(self):
        """
        :rtype: int
        """
        res = self.root.val
        p = self.root
        if not p.left:
            self.root = p.right
            return res
        cur = p.left
        while cur.left:
            cur = cur.left
            p = p.left
        res = cur.val
        if cur.right:
            p.left = cur.right
        else:
            p.left = None  # diff with "cur = None"
        return res

# Your BSTIterator will be called like this:
# i, v = BSTIterator(root), []
# while i.hasNext(): v.append(i.next())
```
