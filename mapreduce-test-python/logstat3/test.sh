# #!/bin/sh
# ../../start.sh
# /usr/local/hadoop/bin/hdfs dfs -rm -r /logstat3/input/
# /usr/local/hadoop/bin/hdfs dfs -rm -r /logstat3/output/
# /usr/local/hadoop/bin/hdfs dfs -mkdir -p /logstat3/input/
# # /usr/local/hadoop/bin/hdfs dfs -mkdir -p /logstat3/output/
# /usr/local/hadoop/bin/hdfs dfs -copyFromLocal ../../mapreduce-test-data/access.log /logstat3/input/
# /usr/local/hadoop/bin/hadoop jar /usr/local/hadoop/share/hadoop/tools/lib/hadoop-streaming-2.9.2.jar \
# -file ../../mapreduce-test-python/logstat3/mapper.py -mapper ../../mapreduce-test-python/logstat3/mapper.py \
# -file ../../mapreduce-test-python/logstat3/reducer.py -reducer ../../mapreduce-test-python/logstat3/reducer.py \
# -input /logstat3/input/* -output /logstat3/output/
# /usr/local/hadoop/bin/hdfs dfs -cat /logstat3/output/part-00000
# # /usr/local/hadoop/bin/hdfs dfs -copyFromLocal /logstat3/output/part-00000 /logstat3/input/
# # /usr/local/hadoop/bin/hadoop jar /usr/local/hadoop/share/hadoop/tools/lib/hadoop-streaming-2.9.2.jar \
# # -file ../../mapreduce-test-python/logstat3/mapper2.py -mapper ../../mapreduce-test-python/logstat3/mapper2.py \
# # -file ../../mapreduce-test-python/logstat3/reducer2.py -reducer ../../mapreduce-test-python/logstat3/reducer2.py \
# # -input /logstat3/input/* -output /logstat3/output2/
# /usr/local/hadoop/bin/hdfs dfs -rm -r /logstat3/input/
# /usr/local/hadoop/bin/hdfs dfs -rm -r /logstat3/output/
# # /usr/local/hadoop/bin/hdfs dfs -rm -r /logstat3/output2/
# ../../stop.sh




#!/bin/sh
../../start.sh
/usr/local/hadoop/bin/hdfs dfs -rm -r /logstat3/input/
/usr/local/hadoop/bin/hdfs dfs -rm -r /logstat3/output/
/usr/local/hadoop/bin/hdfs dfs -mkdir -p /logstat3/input/
/usr/local/hadoop/bin/hdfs dfs -copyFromLocal ../../mapreduce-test-data/access.log /logstat3/input/
/usr/local/hadoop/bin/hadoop jar /usr/local/hadoop/share/hadoop/tools/lib/hadoop-streaming-2.9.2.jar \
-input /input/* \
-output /output/count_by_hour \
-file mapper.py -mapper mapper.py \
-file reducer.py -reducer reducer.py
/usr/local/hadoop/bin/hadoop jar /usr/local/hadoop/share/hadoop/tools/lib/hadoop-streaming-2.9.2.jar \
-input /output/count_by_hour \
-output /output/top_count_by_hour \
-file mapper2.py -mapper mapper2.py \
-file reducer2.py -reducer reducer2.py
/usr/local/hadoop/bin/hdfs dfs -cat /logstat3/output/count_by_hour
/usr/local/hadoop/bin/hdfs dfs -rm -r /logstat3/input/
/usr/local/hadoop/bin/hdfs dfs -rm -r /logstat3/output/
../../stop.sh


# /usr/local/hadoop/bin/hadoop jar /usr/local/hadoop/share/hadoop/tools/lib/hadoop-streaming-2.9.2.jar \
# -input transactions
# -output transactions_and_users_output
# -file /path/to/joinMapperTU.py
# -file /path/to/joinReducerTU.py
# -mapper joinMapperTU.py
# -reducer joinReducerTU.py
#
# bin/hadoop jar ./contrib/streaming/hadoop-0.20.2-streaming.jar -Dmapred.reduce.tasks=1 -Dstream.num.map.output.key.fields=2 -input transactions_and_users_output -output transactions_and_users_output_final -file /path/to/joinMapperTU1.py -file /path/to/joinReducerTU1.py -mapper joinMapperTU1.py -reducer joinReducerTU1.py


# bin/hadoop jar ./contrib/streaming/hadoop-0.20.2-streaming.jar -Dmapred.reduce.tasks=1 -Dstream.num.map.output.key.fields=2 -input transactions -input users -output transactions_and_users_output -file /path/to/joinMapperTU.py -file /path/to/joinReducerTU.py -mapper joinMapperTU.py -reducer joinReducerTU.py
#
# bin/hadoop jar ./contrib/streaming/hadoop-0.20.2-streaming.jar -Dmapred.reduce.tasks=1 -Dstream.num.map.output.key.fields=2 -input transactions_and_users_output -output transactions_and_users_output_final -file /path/to/joinMapperTU1.py -file /path/to/joinReducerTU1.py -mapper joinMapperTU1.py -reducer joinReducerTU1.py
