#!/usr/bin/env python
# -*- coding=utf-8 -*-

import sys

for line in sys.stdin:
    key, val = line.strip().split()

    print("%s\t1\t%s" % (key, val))