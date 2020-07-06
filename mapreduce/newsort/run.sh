#!/bin/bash

HADOOP_CMD="/opt/hadoop-2.6.5/bin/hadoop"
STREAM_JAR_PATH="/opt/hadoop-2.6.5/share/hadoop/tools/lib/hadoop-streaming-2.6.5.jar"

INPUT_FILE_PATH_A="/aaa.txt"
INPUT_FILE_PATH_B="/bbb.txt"
OUT_FILE_PATH="/output_sort"

hdfs dfs -rm -r $OUT_FILE_PATH

$HADOOP_CMD jar $STREAM_JAR_PATH \
  -input $INPUT_FILE_PATH_A,$INPUT_FILE_PATH_B \
  -output $OUT_FILE_PATH \
  -mapper "cat" \
  -reducer "cat" \
  -jobconf stream.num.map.output.key.fields=3 \  # 前三为key
  -jobconf stream.map.output.field.separator=. \  # map分隔符为.
  -jobconf map.output.key.field.separator=. \  # 输出分隔符为.
  -jobconf mapred.text.key.partitioner.options=-k2,3 \ # 以2和3为key作为partition
  -jobconf mapred.reduce.tasks=3