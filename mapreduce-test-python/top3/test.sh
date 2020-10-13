#!/bin/sh
../../start.sh
/usr/local/hadoop/bin/hdfs dfs -rm -r /top3/input/
/usr/local/hadoop/bin/hdfs dfs -rm -r /top3/output/
/usr/local/hadoop/bin/hdfs dfs -mkdir -p /top3/input/
/usr/local/hadoop/bin/hdfs dfs -mkdir -p /top3/output/
/usr/local/hadoop/bin/hdfs dfs -copyFromLocal ../../mapreduce-test-data/access.log /top3/input/
/usr/local/hadoop/bin/hadoop jar /usr/local/hadoop/share/hadoop/tools/lib/hadoop-streaming-2.9.2.jar \
-file ../../mapreduce-test-python/top3/mapper.py -mapper ../../mapreduce-test-python/top3/mapper.py \
-file ../../mapreduce-test-python/top3/reducer.py -reducer ../../mapreduce-test-python/top3/reducer.py \
-input /top3/input/* -output /top3/output/
/usr/local/hadoop/bin/hdfs dfs -cat /top3/output/part-00000
/usr/local/hadoop/bin/hdfs dfs -rm -r /top3/input/
/usr/local/hadoop/bin/hdfs dfs -rm -r /top3/output/
../../stop.sh
