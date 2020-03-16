#!/usr/bin/python
# --*-- coding:utf-8 --*--
import re
import sys

# pat = re.compile('(?P<ip>\d+\.\d+\.\d+\.\d+).*?\d{4}:(?P<hour>\d{2}:\d{2}).*? ')

for line in sys.stdin:
    line = line.strip()
    words = line.split(",") # 6 for type and 35 for vehicle year
    if words[6] == '':
        pass
    elif words[35] == '0':
        pass
    else:
        # print(words[6] + "-" + words[35])
        print '%s\t%s' % (words[6] + "-" + words[35])
