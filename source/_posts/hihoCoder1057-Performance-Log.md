---
title: 'hihoCoder1057: Performance Log'
date: 2016-09-22 15:19:56
categories: Programming
tags: [OJ, dfs]
---

# 1.Question

## Description
[题目链接]()

You are given a txt file, which is performance logs of a single-threaded program.Each line has three columns as follow:

>[Function Name] [TimeStamp] [Action]
* [FunctionName] is a string of length between 1~255
* [TimeStamp] format is hh:mm:ss
* Valid values for "Action" column are START or END, marking the start or end of a function call.

Each function will only be called once.

Output the depth-first traversal result of the call graph with the total time of each function call. However, sometimes the performance log isn't correct and at that time you just need to output "Incorrect performance log".
## Input

The input only contains 1 case, first line is a positive number N representing the number of logs(1 <= N <= 20000), then there are N lines in next, each line is the log info containing [Function Name] [TimeStamp] [Action], [Function Name] is a string, you can assume the [Function Name] is distinct and the length between 1~255.
## Output

Output the depth-first traversal result of the call graph with the total time of each function call for the correct performance, or output "Incorrect performance log".

A call graph is a directed graph that represents calling relationships between subroutines in a computer program.

Call graph for the sample input is shown as below:

![](/home/jason/Pictures/14136920697494.png)

Another sample test case.
Sample Input

    8
    FuncA 00:00:01 START
    FuncB 00:00:02 START
    FuncC 00:00:03 START
    FuncA 00:00:04 END
    FuncB 00:00:05 END
    FuncD 00:00:06 START
    FuncD 00:00:07 END
    FuncC 00:00:08 END

Sample Output

    Incorrect performance log


Sample Input

    8
    FuncA 00:00:01 START
    FuncB 00:00:02 START
    FuncC 00:00:03 START
    FuncC 00:00:04 END
    FuncB 00:00:05 END
    FuncD 00:00:06 START
    FuncD 00:00:07 END
    FuncA 00:00:08 END

Sample Output

    FuncA 00:00:07
    FuncB 00:00:03
    FuncC 00:00:01
    FuncD 00:00:01

# 2. Analysis
Use stack to implement dfs. Push when "START" and pop when "END".(Dealing with the boundary conditions)
# 3. Solution(s)
优化输出格式即可AC。
```python
N = int(raw_input())
funStack = list()
res = list()
i = 0
while i < N:
    data = raw_input().split()
    if data[2] == "START":
        funStack.append(data)
        i += 1
    elif data[2] == "END":
        if len(funStack) == 0:
            break
        else:
            tmp = funStack.pop()
            if tmp[0] != data[0]:
                break
            else:
                startData = [int(x) for x in tmp[1].split(":")]
                startTime = startData[0]*3600 + startData[1]*60 + startData[2]
                endData = [int(x) for x in data[1].split(":")]
                endTime = endData[0]*3600 + endData[1]*60 + endData[2]
                if endTime < startTime:
                    break
                else:
                    resTime = list()
                    seconds = endTime - startTime
                    resTime.append(str(seconds%60))
                    mins = seconds/60
                    resTime.append(str(mins%60))
                    hours = mins/60
                    resTime.append(str(hours))
                    res.append([data[0], resTime[2]+":"+resTime[1]+":"+resTime[0]])
                    i += 1

    else:
        break

if i == N:
    print res
else:
    print "Incorrect performance log"

```
