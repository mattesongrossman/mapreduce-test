#!/bin/sh
/usr/local/hadoop/sbin/start-dfs.sh
/usr/local/hadoop/sbin/start-yarn.sh
/usr/local/hadoop/sbin/mr-jobhistory-daemon.sh start historyserver
/usr/local/hadoop/bin/hdfs dfsadmin -safemode leave
/usr/local/hadoop/bin/hdfs dfs -rm -r /PV/input/
/usr/local/hadoop/bin/hdfs dfs -rm -r /PV/output/
/usr/local/hadoop/bin/hdfs dfs -mkdir -p /PV/input/
/usr/local/hadoop/bin/hdfs dfs -copyFromLocal /mapreduce-test/mapreduce-test-data/PV_Data.csv* /PV/input/
/usr/local/hadoop/bin/hadoop jar /usr/local/hadoop/share/hadoop/tools/lib/hadoop-streaming-2.9.2.jar \
-file /project1/part1/PV/mapper.py -mapper /mapreduce-test/mapreduce-test-python/PV/mapper.py \
-file /project1/part1/PV/reducer.py -reducer /mapreduce-test/mapreduce-test-python/PV/reducer.py \
-input /PV/input/* -output /PV/output/
/usr/local/hadoop/bin/hdfs dfs -cat /PV/output/part-00000
/usr/local/hadoop/bin/hdfs dfs -rm -r /PV/input/
/usr/local/hadoop/bin/hdfs dfs -rm -r /PV/output/
/usr/local/hadoop/sbin/stop-dfs.sh
/usr/local/hadoop/sbin/stop-yarn.sh
/usr/local/hadoop/sbin/mr-jobhistory-daemon.sh stop historyserver
