---
title: 'hihoCoder1086: Browser Caching'
date: 2016-09-23 20:08:09
categories: Programming
tags: [OJ, hash]
---

# 1. Question

## Description

When you browse the Internet, browser usually caches some documents to reduce the time cost of fetching them from remote servers. Let's consider a simplified caching problem. Assume the size of browser's cache can store M pages. When user visits some URL, browser will search it in the cache first. If the page is already cached browser will fetch it from the cache, otherwise browser will fetch it from the Internet and store it in the cache. When the cache is full and browser need to store a new page, the least recently visited page will be discarded.

Now, given a user's browsing history please tell us where did browser fetch the pages, from the cache or the Internet? At the beginning browser's cache is empty.
## Input

Line 1: Two integers N(1 <= N <= 20000) and M(1 <= M <= 5000). N is the number of pages visited and M is the cache size.

Line 2~N+1: Each line contains a string consisting of no more than 30 lower letters, digits and dots('.') which is the URL of the page. Different URLs always lead to different pages. For example www.bing.com and bing.com are considered as different pages by browser.
## Output

Line 1~N: For each URL in the input, output "Cache" or "Internet".

## Sample Input

    5 2
    www.bing.com
    www.microsoft.com
    www.microsoft.com
    windows.microsoft.com
    www.bing.com

## Sample Output

    Internet
    Internet
    Cache
    Internet
    Internet


# 2. Analysis
## Hint

Pages in the cache before visiting 1st URL [null, null]

Pages in the cache before visiting 2nd URL [www.bing.com(1), null]

Pages in the cache before visiting 3rd URL [www.bing.com(1), www.microsoft.com(2)]

Pages in the cache before visiting 4th URL [www.bing.com(1), www.microsoft.com(3)]

Pages in the cache before visiting 5th URL [windows.microsoft.com(4), www.microsoft.com(3)]

The number in parentheses is the last visiting **timestamp** of the page.
# 3. Solution(s)
```python
(N, M) = (int(x) for x in raw_input().split())
cache = list()

for i in range(N):
    url = raw_input()
    if len(cache) != M:
        cache.append([url, i])
        print "Internet"
    else:
        least_recently_visited_index = 0
        least_recently_visited_timestamp = cache[0][1]
        j = 0
        while j < M:
            if cache[j][0] == url:
                cache[j][1] = i
                print "Cache"
                break
            if least_recently_visited_timestamp > cache[j][1]:
                least_recently_visited_timestamp = cache[j][1]
                least_recently_visited_index = j
            j += 1
        if j == M:
            cache[least_recently_visited_index] = [url, i]
            print "Internet"


```
