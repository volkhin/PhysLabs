#!/usr/bin/env python
#-*- coding: utf-8 -*-

import math

def data1():
    n0 = 42
    denom = 0.25
    data = ((0.35, 19.8, 25.5, 49.5),
            (0.85, 65.3, 77.8, 163),
            (1.4, 115, 136.7, 287),
            (2, 164, 196, 411),
            (2.3, 184, 219, 460))

    with open("1.data", "w") as writer:
        for val in data:
            print >>writer, ' '.join(map(str, val))

def main():
    data1()

if __name__ == "__main__":
    main()

