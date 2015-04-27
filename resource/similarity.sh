#!/bin/bash

JAR_NAME=/home/hdfs/sifarish/target/sifarish-1.0-jar-with-dependencies.jar
#JAR_NAME=/home/hdfs/sifarish/target/sifarish-1.0.jar
CLASS_NAME=org.sifarish.feature.SameTypeSimilarity
#CLASS_NAME=org.sifarish.common.ItemDynamicAttributeSimilarity

echo "running mr"
IN_PATH=/user/ani/beymani/customer_transactions
OUT_PATH=/user/ani/beymani/simi
echo "input $IN_PATH output $OUT_PATH"
hdfs dfs -rmr $OUT_PATH
echo "removed output dir"

#hadoop jar $JAR_NAME  $CLASS_NAME  $IN_PATH  $OUT_PATH
hadoop jar $JAR_NAME  $CLASS_NAME -Dmapreduce.job.queuename=bench -Dconf.path=/home/hdfs/beymani/bin/cct.properties  $IN_PATH  $OUT_PATH
