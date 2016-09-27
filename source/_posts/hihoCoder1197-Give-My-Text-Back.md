---
title: 'hihoCoder1197: Give My Text Back'
date: 2016-09-27 21:06:02
categories: Programming
tags: [OJ, string]
---

# 1. Question
## Description
[Link](http://hihocoder.com/problemset/problem/1197?sid=895505)

To prepare for the English exam Little Ho collected many digital reading materials. Unfortunately the materials are messed up by a malware.

It is known that the original text contains only English letters (a-zA-Z), spaces, commas, periods and newlines, conforming to the following format:

1. Each sentence contains at least one word, begins with a letter and ends with a period.

2. In a sentence the only capitalized letter is the first letter.

3. In a sentence the words are separated by a single space or a comma and a space.

4. The sentences are separated by a single space or a single newline.

It is also known the malware changes the text in the following ways:

1. Changing the cases of letters.

2. Adding spaces between words and punctuations.

Given the messed text, can you help Little Ho restore the original text?

## Input
A string containing no more than 8192 English letters (a-zA-Z), spaces, commas, periods and newlines which is the messed text.

## Output
The original text.

## Sample Input
    my Name  is Little   Hi.
    His   name IS Little ho  ,  We are   friends.
## Sample Output
    My name is little hi.
    His name is little ho, we are friends.
# 2. Analysis
# 3. Solution(s)
```python
while True:
    try:
        data = [x.lower() for x in raw_input().split()]
        data[0] = data[0][0].upper() + data[0][1:]
        # data[0][0] = data[0][0].upper() is wrong, because string cannot be modified in python
        result = ""
        for i in data:
            if i == "," or i == ".":
                result = result[:-1] + i + " "
            else:
                result += (i + " ")
        print result
    except:
        break
```
