#!usr/bin/python

from operator import itemgetter
import sys

# file_object = open("log-format.txt","r")

top_ip = {}


# print(file_object.readline())

for line in sys.stdin:
    # print(line)
    line = line.strip().split('\t')
    hour_ip, count = line
    hour = hour_ip[1:3]
    ip = hour_ip[7:]
    hour = int(hour)
    count = int(count)
    if hour not in top_ip.keys():
        top_ip[hour] = [[ip, count]]
    else:
        top_ip[hour].append([ip, count])


for index in range(24):
    if index not in top_ip.keys():
        print("no key = " + str(index))
    else:
        top_ip_three = sorted(top_ip[index], key=itemgetter(1), reverse=True)[0:3]
        print (index, top_ip_three)
