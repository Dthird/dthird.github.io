---
title: 'hohoCoder1014: Trie树'
date: 2016-09-26 13:15:50
categories: Programming
tags: [OJ, tree]
---
# 1. Question



## 描述
[Link](http://hihocoder.com/problemset/problem/1014?sid=894314)

小Hi和小Ho是一对好朋友，出生在信息化社会的他们对编程产生了莫大的兴趣，他们约定好互相帮助，在编程的学习道路上一同前进。

这一天，他们遇到了一本词典，于是小Hi就向小Ho提出了那个经典的问题：“小Ho，你能不能**对于每一个我给出的字符串，都在这个词典里面找到以这个字符串开头的所有单词呢**？”

身经百战的小Ho答道：“怎么会不能呢！你每给我一个字符串，我就依次遍历词典里的所有单词，检查你给我的字符串是不是这个单词的前缀不就是了？”

小Hi笑道：“你啊，还是太年轻了！~假设这本词典里有10万个单词，我询问你一万次，你得要算到哪年哪月去？”

小Ho低头算了一算，看着那一堆堆的0，顿时感觉自己这辈子都要花在上面了...

小Hi看着小Ho的囧样，也是继续笑道：“让我来提高一下你的知识水平吧~你知道树这样一种数据结构么？”

小Ho想了想，说道：“知道~它是一种基础的数据结构，就像这里说的一样！”

小Hi满意的点了点头，说道：“那你知道我怎么样用一棵树来表示整个词典么？”

小Ho摇摇头表示自己不清楚。



“你看，我们现在得到了这样一棵树，那么你看，如果我给你一个字符串ap，你要怎么找到所有以ap开头的单词呢？”小Hi又开始考校小Ho。

“唔...一个个遍历所有的单词？”小Ho还是不忘自己最开始提出来的算法。

“笨！这棵树难道就白构建了！”小Hi教训完小Ho，继续道：“看好了！”


“那么现在！赶紧去用代码实现吧！”小Hi如是说道
## 输入

输入的第一行为一个正整数n，表示词典的大小，其后n行，每一行一个单词（不保证是英文单词，也有可能是火星文单词哦），单词由不超过10个的小写英文字母组成，可能存在相同的单词，此时应将其视作不同的单词。接下来的一行为一个正整数m，表示小Hi询问的次数，其后m行，每一行一个字符串，该字符串由不超过10个的小写英文字母组成，表示小Hi的一个询问。

在20%的数据中n, m<=10，词典的字母表大小<=2.

在60%的数据中n, m<=1000，词典的字母表大小<=5.

在100%的数据中n, m<=100000，词典的字母表大小<=26.

## 输出

对于小Hi的每一个询问，输出一个整数Ans,表示词典中以小Hi给出的字符串为前缀的单词的个数。
## Sample Input

    5
    babaab
    babbbaaaa
    abba
    aaaaabaa
    babaababb
    5
    babb
    baabaaa
    bab
    bb
    bbabbaab

## Sample Output

    1
    0
    3
    0
    0


# 2. Analysis
1. Hint1：Trie树的建立
![](/img/14051554971354.jpg)
2. Hint2：如何使用Trie树
![](/img/14051555414053.jpg)
![](/img/14051555696936.jpg)
3. Hint3：在建立Trie树时同时进行统计


    “小Ho你有没有想过这样一个问题？不妨称以T为根的子树中标记节点的个数为L[T]，既然我要统计某个L[T1]，，而这个结点是不确定的，我有没有办法一次性把所有结点的L[T]求出来呢？”小Hi整理了下思绪，问道。

    “似乎是有的，老师以前说过，递归什么的。。”小Ho答道。

    “递归太复杂了！我们可以之后再说，你这么想，在你构建Trie树的时候，当你经过一个结点的时候，说明了什么？”小Hi撇了撇头，继续问道。

    “我想想，经过一个结点……标记结点……说明了以这个结点为根的子树中将要多出来一个标记结点？”

    “没错！那你有没有什么办法来记录这个改变呢？”

    “我想想，我在最开始置所有L[T]=0，然后每次添加一个新的单词的时候，都将它经过的所有结点的L[T]全部+1，这样我构建完这棵Trie树的时候，我也就能够同时统计到所有L[T]了，对么？”小Ho开心道。

# 3. Solution(s)
```python
class Tree(object):
    def __init__(self, node):
        self.node = node
        self.children = []
        self.L = 0 #num of subtree = num of words(prefix is "**")
        self.isTerminal = False

class TrieTree(object):
    def __init__(self):
        self.trieRoot = Tree(None)


    def addWord(self, word):
        self.trieRoot.L += 1
        tmp = self.trieRoot
        for i in word:
            if i in [x.node for x in tmp.children]:
                tmp = tmp.children[[x.node for x in tmp.children].index(i)]
                tmp.L += 1
            else:
                tmp.children.append(Tree(i))
                tmp = tmp.children[len(tmp.children)-1]
                tmp.L += 1
        tmp.isTerminal = True

    def search(self, prefix):
        tmp = self.trieRoot
        for i in prefix:
            if i in [x.node for x in tmp.children]:
                tmp = tmp.children[[x.node for x in tmp.children].index(i)]
            else:
                return 0
        return tmp.L



if __name__ == '__main__':
    trie = TrieTree()
    n = int(raw_input())
    for i in range(n):
        trie.addWord(raw_input())

    m = int(raw_input())
    for i in range(m):
        print trie.search(raw_input())
```
