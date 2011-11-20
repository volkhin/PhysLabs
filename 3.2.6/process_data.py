#!/usr/bin/env python
#-*- coding: utf-8 -*-

import math

def data1():
    U0 = 1.38
    div = 1. / 2000
    R0 = 280

    with open("1_raw.data") as reader:
        with open("1.data", "w") as writer:
            for line in reader:
                line = line.strip()
                if not line: continue
                R, x = map(float, line.split())
                print >>writer, 10*x, U0 * div / (1000 * R + R0)


def data2():
    div = 1. / 2000
    R0 = 280

    with open("2_raw.data") as reader:
        with open("2.data", "w") as writer:
            for line in reader:
                line = line.strip()
                if not line: continue
                R, x0, x1 = map(float, line.split())
                Theta = math.log(x0 / x1)
                x_val = (1000 * R + R0) ** 2
                print >>writer, x_val / 10 ** 6, 1 / Theta ** 2


def main():
    data1()
    data2()

if __name__ == "__main__":
    main()

