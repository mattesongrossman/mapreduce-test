#!/bin/sh
../../start.sh
/usr/local/hadoop/bin/hdfs dfs -rm -r /logstat3/input/
/usr/local/hadoop/bin/hdfs dfs -rm -r /logstat3/output/
/usr/local/hadoop/bin/hdfs dfs -mkdir -p /logstat3/input/
/usr/local/hadoop/bin/hdfs dfs -copyFromLocal ../../mapreduce-test-data/access.log /logstat3/input/
/usr/local/hadoop/bin/hadoop jar /usr/local/hadoop/share/hadoop/tools/lib/hadoop-streaming-2.9.2.jar \
-file ../../mapreduce-test-python/logstat3/mapper.py -mapper ../../mapreduce-test-python/logstat3/mapper.py \
-file ../../mapreduce-test-python/logstat3/reducer.py -reducer ../../mapreduce-test-python/logstat3/reducer.py \
-input /logstat3/input/* -output /logstat3/output/
/usr/local/hadoop/bin/hdfs dfs -cat /logstat3/output/part-00000
/usr/local/hadoop/bin/hdfs dfs -rm -r /logstat3/input/
/usr/local/hadoop/bin/hdfs dfs -rm -r /logstat3/output/
../../stop.sh
