#!/usr/bin/env python
# -*- coding=utf-8 -*-

import sys

base_count = 9999

for line in sys.stdin:
    key, val = line.strip().split()
    print(str(base_count - int(key))+"\t"+val)