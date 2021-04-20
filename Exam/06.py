#!/usr/bin/env python3
from sys import stdin

counter = {}
for line in stdin:
    if line not in counter:
        counter[line] = 1
    else:
        counter[line] += 1
print(counter)
for line, count in counter.items():
    if count > 2:
        print(line, end='')