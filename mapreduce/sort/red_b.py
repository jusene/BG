#!/usr/bin/env python
# -*- coding=utf-8 -*-

import sys

base_count = 10000

for line in sys.stdin:
    red_idx, key, val = line.strip().split()
    print(str(int(key) - base_count)+"\t"+val)