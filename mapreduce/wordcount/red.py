#!/usr/bin/env python
# -*- coding=utf-8 -*-

import sys

current_word = None
current_count = 0

for line in sys.stdin:
    word, count = line.strip().split("\t")

    try:
        count = int(count)
    except ValueError:
        continue

    if current_word == word:
        current_count += count
    else:
        if current_word:
            print("{}\t{}".format(current_word, current_count))
        current_word = word
        current_count = count

if current_word == word:
    print("{}\t{}".format(current_word, current_count))