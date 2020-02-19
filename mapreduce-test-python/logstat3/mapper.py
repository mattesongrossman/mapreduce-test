#!usr/bin/python

from operator import itemgetter
import sys

top_ip = {}

for line in sys.stdin:
	line = line.strip().split('\t')
	hour_ip, count = line
	hour, ip = hour_ip.split(' ')

	try:
		hour = int(hour)
	    count = int(count)
	    top_ip[hour].append([ip, count])

	except ValueError:
		pass

for hour in range(24):
    top_ip_three = sorted(top_ip[hour], key=lambda key:key[1], reverse=True)[0:3]
    print '%s\t%s' % (hour, top_ip_three)
