---
title: 'hihoCoder1058: Combination Lock'
date: 2016-09-23 09:42:28
categories: Programming
tags: [OJ, string]
---

# 1. Question

## Description
[Link](http://hihocoder.com/problemset/problem/1058?sid=877039)

Finally, you come to the interview room. You know that a Microsoft interviewer is in the room though the door is locked. There is a combination lock on the door. There are N rotators on the lock, each consists of 26 alphabetic characters, namely, 'A'-'Z'. You need to unlock the door to meet the interviewer inside. There is a note besides the lock, which shows the steps to unlock it.

Note: There are M steps totally; each step is one of the four kinds of operations shown below:

Type1: CMD 1 i j X: (i and j are integers, 1 <= i <= j <= N; X is a character, within 'A'-'Z')

    This is a sequence operation: turn the ith to the jth rotators to character X (the left most rotator is defined as the 1st rotator)

    For example: ABCDEFG => CMD 1 2 3 Z => AZZDEFG

Type2: CMD 2 i j K: (i, j, and K are all integers, 1 <= i <= j <= N)

    This is a sequence operation: turn the ith to the jth rotators up K times ( if character A is turned up once, it is B; if Z is turned up once, it is A now. )

    For example: ABCDEFG => CMD 2 2 3 1 => ACDDEFG

Type3: CMD 3 K: (K is an integer, 1 <= K <= N)

    This is a concatenation operation: move the K leftmost rotators to the rightmost end.

    For example: ABCDEFG => CMD 3 3 => DEFGABC

Type4: CMD 4 i j(i, j are integers, 1 <= i <= j <= N):

    This is a recursive operation, which means:

    If i > j:
    	Do Nothing
    Else:
    	CMD 4 i+1 j
    	CMD 2 i j 1

    For example: ABCDEFG => CMD 4 2 3 => ACEDEFG

## Input

1st line:  2 integers, N, M ( 1 <= N <= 50000, 1 <= M <= 50000 )

2nd line: a string of N characters, standing for the original status of the lock.

3rd ~ (3+M-1)th lines: each line contains a string, representing one step.
Output

One line of N characters, showing the final status of the lock.


    7 4
    ABCDEFG
    CMD 1 2 5 C
    CMD 2 3 7 4
    CMD 3 3
    CMD 4 1 7

## Sample Output

    HIMOFIN


# 2. Analysis
Just need to implement four CMD functions.
# 3. Solution(s)
```python
def CMD1(lock, i, j, X):
    for it in range(i-1, j):
        lock[it] = X

def CMD2(lock, i, j, K):
    dictionary = list("ABCDEFGHIJKLMNOPQRSTUVWXYZ")
    for it in range(i-1, j):
        new = (dictionary.index(lock[it]) + K) % 26
        lock[it] = dictionary[new]
    return lock

def CMD3(lock, K):
    # ABCDEF => CDEFAB: 1. AB => BA; 2. CDEF => FEDC; 3. BAFEDC => CDEFAB
    left = lock[:K]
    right = lock[K:]
    lock_re = left[::-1] + right[::-1]
    lock_re = lock_re[::-1]
    for it in range(len(lock)): # modify lock in its address
        lock[it] = lock_re[it]

def CMD4(lock, i, j):
    if i > j:
        pass
    else:
        CMD4(lock, i+1, j)
        CMD2(lock, i, j, 1)

(N, M) = (int(x) for x in raw_input().split())
lock = list(raw_input())
for i in range(M):
    data = raw_input().split()
    if data[1] == "1":
        CMD1(lock, int(data[2]), int(data[3]), data[4])
    elif data[1] == "2":
        CMD2(lock, int(data[2]), int(data[3]), int(data[4]))
    elif data[1] == "3":
        CMD3(lock, int(data[2]))
    elif data[1] == "4":
        CMD4(lock, int(data[2]), int(data[3]))
print "".join(lock)


```
