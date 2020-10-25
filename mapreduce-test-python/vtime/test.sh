# -*- coding: utf-8 -*-
"""
Created on Sun Oct 25 01:12:44 2020

@author: Cher
"""

../../start.sh
/usr/local/hadoop/bin/hdfs dfs -rm -r /vtime/input/
/usr/local/hadoop/bin/hdfs dfs -rm -r /vtime/output/
/usr/local/hadoop/bin/hdfs dfs -mkdir -p /vtime/input/
/usr/local/hadoop/bin/hdfs dfs -copyFromLocal ../../Parking_Violations_Issued_-_Fiscal_Year_2021.csv /vtime/input/
/usr/local/hadoop/bin/hadoop jar /usr/local/hadoop/share/hadoop/tools/lib/hadoop-streaming-2.9.2.jar \
-file ../../vtime/mapper.py -mapper ../../vtime/mapper.py \
-file ../../vtime/reducer.py -reducer ../../vtimereducer.py \
-input /vtime/input/* -output /vtime/output/
/usr/local/hadoop/bin/hdfs dfs -cat /vtime/output/part-00000
/usr/local/hadoop/bin/hdfs dfs -rm -r /vtime/input/
/usr/local/hadoop/bin/hdfs dfs -rm -r /vtime/output/
../../stop.sh