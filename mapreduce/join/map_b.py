#!/usr/bin/env python
# -*- coding=utf-8 -*-

import sys

for line in sys.stdin:
    key, val = line.strip().split()

    print("%s\t2\t%s" % (key, val))