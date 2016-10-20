---
title: 'leetcode257: Binary Tree Paths'
date: 2016-10-20 19:39:00
categories: Programming
tags: [OJ, dfs, tree]
---

# 1. Question
Given a binary tree, return all root-to-leaf paths.

For example, given the following binary tree:

    ###1
    #/   \
    2     3
    #\
    ##5
All root-to-leaf paths are:

    ["1->2->5", "1->3"]
# 2. Analysis
# 3. Solution(s)
Recursive implementation:
```python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, x):
#         self.val = x
#         self.left = None
#         self.right = None

class Solution:
    # @param {TreeNode} root
    # @return {string[]}


    def binaryTreePaths(self, root):
        if not root: return list()
        result = [ str(root.val)+"->" + path for path in self.binaryTreePaths(root.left)]
        result += [ str(root.val)+"->" + path for path in self.binaryTreePaths(root.right)]
        return result or [str(root.val)]  # if empty return leaf itself
```
Iterative implementation:
```python
# unfinished: record the path of root to leaf

def binaryTreePaths(self, root):
        if not root: return list()
        res = []
        stack = []
        path_stack = []
        stack.append(root)
        while len(stack)>0:
            tmp = stack.pop()
            if(tmp.left):
                print "D:", tmp.val
                stack.append(tmp.left)
            if(tmp.right):
                print "D:", tmp.val
                stack.append(tmp.right)
            if(not tmp.left and not tmp.right):
                print "leaf:", tmp.val

        return res
```
