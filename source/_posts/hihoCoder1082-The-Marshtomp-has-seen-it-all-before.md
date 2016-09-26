---
title: 'hihoCoder1082: The Marshtomp has seen it all before'
date: 2016-09-23 18:56:45
categories: Programming
tags: [OJ, string, regular_expression]
---

# 1. Question

## Description
[Link](http://hihocoder.com/problemset/problem/1082?sid=877409)

![](/hihoCoder1082-The-Marshtomp-has-seen-it-all-before/14184646038225.jpg)

fjxmlhx is fed up with endless marshtomps on the internet. So he turns to you to write a program to change all occurrence of “marshtomp” ( the name is **not case-sensitive**)  to “fjxmlhx”.
## Input

The input contains multiple lines.

Each line is a string which length is no more than 200.

The end of one line don’t connect with the head of the next line.
## Output

The output contains multiple lines which are the result after the changes in the description.
## Sample Input

    The Marshtomp has seen it all before.
    marshTomp is beaten by fjxmlhx!
    AmarshtompB

## Sample Output

    The fjxmlhx has seen it all before.
    fjxmlhx is beaten by fjxmlhx!
    AfjxmlhxB


# 2. Analysis
Regular expression to solve the **not case-sensitive** problem. Then just replace strings match the regular expression with fjxmlhx.
# 3. Solution(s)
```python
import re
while True:
    try:
        print re.sub(r"[mM][aA][rR][sS][hH][tT][oO][mM][pP]", "fjxmlhx", raw_input())
    except:
        break

```
