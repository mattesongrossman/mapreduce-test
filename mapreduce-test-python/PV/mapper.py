#!/usr/bin/python

import sys

for line in sys.stdin:
    line = line.strip()
    words = line.split(",") # 6 for type and 35 for vehicle year
    if words[6] == '':
        pass
    elif words[35] == '0':
        pass
    else:
        print '%s\t%s' % (words[6] + "-" + words[35], 1)
