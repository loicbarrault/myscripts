#!/usr/bin/env python3

import sys

REVERSE=False
SPACE='⁜'

def convert_char(char):
    if char is ' ':
        return SPACE
    return char

def string2char(word):
    return [convert_char(char) for char in word]

def char2string(seq):
    return seq.replace(' ', '').replace(SPACE, ' ')

def read_stdin():
    return [x.strip() for x in sys.stdin]

if __name__ == "__main__":

    if len(sys.argv) > 2 :
        print('Usage: {} [--reverse]')
        sys.exit(0)

    if len(sys.argv) == 2 and sys.argv[1] == '--reverse':
        REVERSE=True

    lines = read_stdin()
    #print("LINES:", lines);
    for line in lines:
        if REVERSE is False:
            pline = ' '.join(string2char(line))
        else:
            pline = char2string(line)
        print(pline)





