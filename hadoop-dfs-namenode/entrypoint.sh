#!/usr/bin/env bash

$HADOOP_PREFIX/bin/hdfs namenode -format -nonInteractive
$HADOOP_PREFIX/bin/hdfs namenode