#!/usr/bin/env python3
import sys

opening = {
    ')' : '(',
    ']' : '[',
    '}' : '{',
    '>' : '<'
}
opens = opening.values()
closes = opening.keys()

def max_nesting(sequence):
    stack = []
    maxNesting = 0
    for s in sequence:
        if s in opens:
            stack.append(s)
            maxNesting = max(maxNesting, len(stack))
        elif s in closes:
            if len(stack) == 0: return -1
            if opening[s] != stack.pop(): return -1
        else:
            return -1
    if len(stack) != 0: return -1
    return maxNesting

if __name__ == '__main__':
    print(max_nesting(input()))