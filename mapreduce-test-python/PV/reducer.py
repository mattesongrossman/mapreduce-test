#!/usr/bin/python
from operator import itemgetter
import sys

dict_id_count = {}

for line in sys.stdin:
    line = line.strip()
    id, num = line.split('\t')
    try:
        num = int(num)
        dict_id_count[id] = dict_id_count.get(id, 0) + num

    except ValueError:
        pass

sorted_dict_id_count = sorted(dict_id_count.items(), key=itemgetter(1), reverse = True)
for id, count in sorted_dict_id_count:
    print '%s\t%s' % (id, count)

# sorted_dict_id_count = sorted(dict_id_count.items(), key=itemgetter(0))
# # print(sorted_dict_id_count)
# for id, count in sorted_dict_id_count:
#     hour_id  = id.strip().split('\t')
#     hour = hour_id[0][1:3]
#     id = hour_id[0][10:]
#     hour = int(hour)
#     count = int(count)
#     if hour not in top_id.keys():
#         top_id[hour] = [[id, count]]
#     else:
#         top_id[hour].append([id, count])
#
#
# for hour in top_id:
#         top_id_three[hour] = sorted(top_id[hour], key=itemgetter(1), reverse=True)[0:3]
#
# for hour in top_id_three:
#     print ("Hour = " + str(hour) + ", Top 3 IP's and Count = " + str(top_id_three[hour][0])+ str(top_id_three[hour][1])+ str(top_id_three[hour][2]))
