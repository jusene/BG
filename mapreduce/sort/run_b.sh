#!/bin/bash

# 分桶排序
HADOOP_CMD="/opt/hadoop-2.6.5/bin/hadoop"
STREAM_JAR_PATH="/opt/hadoop-2.6.5/share/hadoop/tools/lib/hadoop-streaming-2.6.5.jar"

INPUT_FILE_PATH_A="/a.txt"
INPUT_FILE_PATH_B="/b.txt"
OUT_FILE_PATH="/output_sort"

hdfs dfs -rm -r $OUT_FILE_PATH

$HADOOP_CMD jar $STREAM_JAR_PATH \
  -input $INPUT_FILE_PATH_A,$INPUT_FILE_PATH_B \
  -output $OUT_FILE_PATH \
  -mapper "python map_b.py" \
  -reducer "python red_b.py" \
  -jobconf "mapred.reduce.tasks=2" \
  -jobconf "stream.num.map.output.key.fields=2" \
  -jobconf "num.key.fields.for.partition=1" \
  -partitioner "org.apache.hadoop.mapred.lib.KeyFieldBasedPartitioner" \
  -file ./map_b.py \
  -file ./red_b.py