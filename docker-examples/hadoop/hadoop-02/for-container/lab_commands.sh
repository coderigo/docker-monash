#!/bin/bash

export HDFS="/usr/local/hadoop/bin/hdfs dfs"
export HADOOP="/usr/local/hadoop/bin/hadoop"
export HADOOP_CLASSPATH="/usr/java/default/lib/tools.jar"

# Make hduser user in HDFS
$HDFS -mkdir /user/hduser

# Make HDFS dir for this example
$HDFS -mkdir -p /user/hduser/lab2/wordcount

# cd into the directory holding the wordcount-java example
cd /home/wordcount-java/

# Compile WordCount.java into a jar
$HADOOP com.sun.tools.javac.Main WordCount.java
jar cf wc.jar WordCount*.class

# Copy the example files into hdfs
$HDFS -mkdir /user/hduser/lab2/wordcount/input
$HDFS -put file* /user/hduser/lab2/wordcount/input

# Run the application
$HADOOP jar wc.jar WordCount \
    /user/hduser/lab2/wordcount/input \
    /user/hduser/lab2/wordcount/output

# Inspect the output
$HDFS -cat /user/hduser/lab2/wordcount/output/part-r-00000
