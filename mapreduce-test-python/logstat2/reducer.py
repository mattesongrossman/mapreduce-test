#!/usr/bin/python
from operator import itemgetter
import sys

dict_ip_count = {}
top_ip = {}


for line in sys.stdin:
    line = line.strip()
    ip, num = line.split(' ')
    try:
        num = int(num)
        ip
        dict_ip_count[ip] = dict_ip_count.get(ip, 0) + num

    except ValueError:
        pass



sorted_dict_ip_count = sorted(dict_ip_count.items(), key=itemgetter(0))
# print(sorted_dict_ip_count)
for ip, count in sorted_dict_ip_count:
    hour_ip  = ip.strip().split('\t')
    hour = hour_ip[0][1:3]
    ip = hour_ip[0][10:]
    hour = int(hour)
    count = int(count)
    if hour not in top_ip.keys():
        top_ip[hour] = [[ip, count]]
    else:
        top_ip[hour].append([ip, count])


for hour in range(24):
    if hour not in top_ip.keys():
        print '%s\t%s' % ("no key = " + str(hour))
        pass
    else:
        top_ip_three = sorted(top_ip[hour], key=itemgetter(1), reverse=True)[0:3]
        print '%s\t%s' % (hour, top_ip_three)
