#!/bin/bash

# 正序
HADOOP_CMD="/opt/hadoop-2.6.5/bin/hadoop"
STREAM_JAR_PATH="/opt/hadoop-2.6.5/share/hadoop/tools/lib/hadoop-streaming-2.6.5.jar"

INPUT_FILE_PATH_A="/a.txt"
INPUT_FILE_PATH_B="/b.txt"
OUT_FILE_PATH="/output_sort"

hdfs dfs -rm -r $OUT_FILE_PATH

$HADOOP_CMD jar $STREAM_JAR_PATH \
  -input $INPUT_FILE_PATH_A,$INPUT_FILE_PATH_B \
  -output $OUT_FILE_PATH \
  -mapper "python map.py" \
  -reducer "python red.py" \
  -jobconf "mapred.reduce.tasks=1" \
  -file ./map.py \
  -file ./red.py