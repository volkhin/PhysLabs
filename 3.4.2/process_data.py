#!/usr/bin/env python
#-*- coding: utf-8 -*-

import math

def data1():
    thau0 = 7.896
    data = ((9.41, 16),
        (9.38, 17.5),
        (9.17, 19.5),
        (8.89, 21.5),
        (8.54, 23),
        (8.31, 25),
        (8.21, 27),
        (8.14, 29),
        (8.11, 31),
        (8.09, 33),
        (8.06, 35),
        (8.05, 37),
        (8.04, 38),
        (8.02, 40))

    with open("1.data", "w") as writer:
        for x, y in data:
            print >>writer, y, 1 / (x ** 2 - thau0 ** 2)

def main():
    data1()

if __name__ == "__main__":
    main()

