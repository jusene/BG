#!/bin/bash

HADOOP_CMD="/opt/hadoop-2.6.5/bin/hadoop"
STREAM_JAR_PATH="/opt/hadoop-2.6.5/share/hadoop/tools/lib/hadoop-streaming-2.6.5.jar"

INPUT_FILE_PATH="/1.data"
OUT_FILE_PATH="/output"

hdfs dfs -rm -r $OUT_FILE_PATH

$HADOOP_CMD jar $STREAM_JAR_PATH \
  -input $INPUT_FILE_PATH \
  -output $OUT_FILE_PATH \
  -mapper "python map.py" \
  -reducer "python red.py" \
  -file ./map.py \
  -file ./red.py