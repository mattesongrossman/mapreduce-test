#!/usr/bin/python
from operator import itemgetter
import sys

dict_ip_count = {}
top_ip = {}

file_object = open("log-format.txt","r")


for line in file_object:
    line = line.strip()
    ip, num = line.split('\t')
    try:
        num = int(num)
        ip
        dict_ip_count[ip] = dict_ip_count.get(ip, 0) + num

    except ValueError:
        pass



sorted_dict_ip_count = sorted(dict_ip_count.items(), key=itemgetter(0))
print(sorted_dict_ip_count)
for ip, count in sorted_dict_ip_count:
    print (ip, count)
    # hour_ip  = ip.strip().split('\t')
#     hour = ip[1:3]
#     ip = hour_ip[7:]
#     hour = int(hour)
#     count = int(count)
#     if hour not in top_ip.keys():
#         top_ip[hour] = [[ip, count]]
#     else:
#         top_ip[hour].append([ip, count])
#
# for hour in range(24):
#     if hour not in top_ip.keys():
#         print("no key = " + str(hour))
#         pass
#     else:
#         top_ip_three = sorted(top_ip[hour], key=itemgetter(1), reverse=True)[0:3]
#         print (hour, top_ip_three)
#
# for hour, ip, count in top_ip_three:
#     print '%s\t%s' % (hour, ip, count)















# --------------------------------------


#!/usr/bin/python

# from operator import itemgetter
# import sys
#
# # file_object = open("log-format.txt","r")
#
# top_ip = {}
#
#
# # print(file_object.readline())
#
# for line in sys.stdin:
#     # print(line)
#     line = line.strip().split('\t')
#     hour_ip, count = line
#     hour = hour_ip[1:3]
#     ip = hour_ip[7:]
#     hour = int(hour)
#     count = int(count)
#     if hour not in top_ip.keys():
#         top_ip[hour] = [[ip, count]]
#     else:
#         top_ip[hour].append([ip, count])
#
#
# for index in range(24):
#     if index not in top_ip.keys():
#         print("no key = " + str(index))
#     else:
#         top_ip_three = sorted(top_ip[index], key=itemgetter(1), reverse=True)[0:3]
#         print (index, top_ip_three)
