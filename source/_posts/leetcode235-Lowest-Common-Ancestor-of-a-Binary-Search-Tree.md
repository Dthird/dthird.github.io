---
title: 'leetcode235: Lowest Common Ancestor of a Binary Search Tree'
date: 2016-11-14 13:54:33
categories: Programming
tags: [OJ, recursion, binary_search, tree]
---
# 1. Question
[Link](https://leetcode.com/problems/lowest-common-ancestor-of-a-binary-search-tree/)

Given a binary search tree (**BST**), find the lowest common ancestor (**LCA**) of two given nodes in the BST.

According to [the definition of LCA on Wikipedia](https://en.wikipedia.org/wiki/Lowest_common_ancestor): “The lowest common ancestor is defined between two nodes v and w as the lowest node in T that has both v and w as descendants (**where we allow a node to be a descendant of itself**).”
```
````````______6______
```````/             \
````___2__          __8__
```/      \        /     \
``0       _4      7       9
`````````/  \
````````3    5
```
For example, the lowest common ancestor (LCA) of nodes 2 and 8 is 6. Another example is LCA of nodes 2 and 4 is 2, since a node can be a descendant of itself according to the LCA definition.

# 2. Analysis
# 3. Solution(s)
```python
# Definition for a binary tree node.
# class TreeNode(object):
#     def __init__(self, x):
#         self.val = x
#         self.left = None
#         self.right = None

class Solution(object):
    def lowestCommonAncestor(self, root, p, q):
        """
        :type root: TreeNode
        :type p: TreeNode
        :type q: TreeNode
        :rtype: TreeNode
        """
        if p.val > q.val:
            p, q = q, p
        if root.val > p.val and root.val < q.val or root.val == p.val or root.val == q.val:
            return root
        elif root.val > q.val:
            return self.lowestCommonAncestor(root.left, p, q)
        elif root.val < p.val:
            return self.lowestCommonAncestor(root.right, p, q)


```
