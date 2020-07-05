#!/usr/bin/env python
# -*- coding=utf-8 -*-

import sys

base_count = 9999

for line in sys.stdin:
    ss = line.strip().split()
    key, val = ss

    new_key = base_count - int(key)
    print("%s\t%s" % (new_key, val))