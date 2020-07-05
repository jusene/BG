#!/usr/bin/env python
# -*- coding=utf-8 -*-

import sys

base_count = 10000

for line in sys.stdin:
    key, val = line.strip().split()
    new_key = base_count + int(key)

    red_idx = 1
    if new_key < (10020 + 10000) / 2:
        red_idx = 0

    print("%s\t%s\t%s" % (red_idx, new_key, val))
