#!/bin/bash

HADOOP_CMD="/opt/hadoop-2.6.5/bin/hadoop"
STREAM_JAR_PATH="/opt/hadoop-2.6.5/share/hadoop/tools/lib/hadoop-streaming-2.6.5.jar"

INPUT_FILE_PATH_A="/a.txt"
INPUT_FILE_PATH_B="/b.txt"
OUT_FILE_PATH_A="/output_A"
OUT_FILE_PATH_B="/output_B"
OUT_FILE_PATH_JOIN="/output_join"

hdfs dfs -rm -r $OUT_FILE_PATH_A
hdfs dfs -rm -r $OUT_FILE_PATH_B
hdfs dfs -rm -r $OUT_FILE_PATH_JOIN

# step 1
$HADOOP_CMD jar $STREAM_JAR_PATH \
  -input $INPUT_FILE_PATH_A \
  -output $OUT_FILE_PATH_A \
  -mapper "python map_a.py" \
  -file ./map_a.py

# step 2
$HADOOP_CMD jar $STREAM_JAR_PATH \
  -input $INPUT_FILE_PATH_B \
  -output $OUT_FILE_PATH_B \
  -mapper "python map_b.py" \
  -file ./map_b.py

# step 3
$HADOOP_CMD jar $STREAM_JAR_PATH \
  -input $OUT_FILE_PATH_A,$OUT_FILE_PATH_B \
  -output $OUT_FILE_PATH_JOIN \
  -mapper "cat" \
  -reducer "python red_join.py" \
  -file ./red_join.py \
  -jobconf "stream.num.map.output.key.fields=2" \
  -jobconf "num.key.fields.for.partition=1"

