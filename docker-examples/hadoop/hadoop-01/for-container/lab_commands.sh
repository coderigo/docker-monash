#!/bin/bash

HDFS="/usr/local/hadoop/bin/hdfs dfs"

# Make hduser user in HDFS
$HDFS -mkdir /user/hduser

# Copy a file from /tmp/from-container-host into HDFS
echo "Copying file into HDFS"
$HDFS -put /tmp/from-container-host/somefile_for_hdfs.txt /user/hduser/somefile_for_hdfs.txt

# What's inside hadoop root direcotry?
echo "Listing hadoop root recursively"
$HDFS -ls -R

# Make a directory within HDFS
echo "Make directory within HDFS"
$HDFS -mkdir /user/hduser/lab_example_directory

# Copy a local file to the directory created above
echo "Copy a local file to the directory created above"
$HDFS -put /tmp/from-container-host/somefile_for_hdfs.txt /user/hduser/lab_example_directory/somefile_for_hdfs.txt

# Copy an HDFS file to the local directory
echo "Copy from HDFS to local"
$HDFS -get /user/hduser/lab_example_directory/somefile_for_hdfs.txt /tmp/from-container-host/somefile_from_hdfs.txt

# Display contents of file within HDFS
echo "Show contents of file in HDFS"
$HDFS -cat /user/hduser/lab_example_directory/somefile_for_hdfs.txt

# Delete all files within a directory
echo "Delete all files within an HDFS directory"
$HDFS -rm /user/hduser/lab_example_directory/*

# Delete a directory
echo "Delete a directory within HDFS"
$HDFS -rmdir /user/hduser/lab_example_directory