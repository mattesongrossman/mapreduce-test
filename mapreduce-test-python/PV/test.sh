#!/bin/sh
../../start.sh
/usr/local/hadoop/bin/hdfs dfs -rm -r /PV/input/
/usr/local/hadoop/bin/hdfs dfs -rm -r /PV/output/
/usr/local/hadoop/bin/hdfs dfs -mkdir -p /PV/input/
/usr/local/hadoop/bin/hdfs dfs -copyFromLocal ../../mapreduce-test-data/PV_Data.csv /PV/input/
/usr/local/hadoop/bin/hadoop jar /usr/local/hadoop/share/hadoop/tools/lib/hadoop-streaming-2.9.2.jar \
-file ../../mapreduce-test-python/PV/mapper.py -mapper ../../mapreduce-test-python/PV/mapper.py \
-file ../../mapreduce-test-python/PV/reducer.py -reducer ../../mapreduce-test-python/PV/reducer.py \
-input /PV/input/* -output /PV/output/
/usr/local/hadoop/bin/hdfs dfs -cat /PV/output/part-00000
/usr/local/hadoop/bin/hdfs dfs -rm -r /PV/input/
/usr/local/hadoop/bin/hdfs dfs -rm -r /PV/output/
../../stop.sh
