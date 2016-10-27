FROM ubuntu

MAINTAINER Nikita Romashkin <romashkin.nikita@gmail.com>

# Locale
RUN locale-gen en_US.UTF-8
ENV LANG=en_US.UTF-8 \
    LANGUAGE=en_US:en \
    LC_ALL=en_US.UTF-8

ENV HADOOP_VERSION=2.7.3 \
    JAVA_URL=http://download.oracle.com/otn-pub/java/jdk/8u112-b15/jdk-8u112-linux-x64.tar.gz \
    JAVA_VERSION=1.8.0_112

RUN apt-get update && apt-get install -y \
    curl

RUN mkdir /app \
    && curl -L -b "oraclelicense=accept-securebackup-cookie" ${JAVA_URL} | tar -xz -C /app \
    && ln -s /app/jdk${JAVA_VERSION} /app/java

RUN curl http://apache-mirror.rbc.ru/pub/apache/hadoop/common/hadoop-${HADOOP_VERSION}/hadoop-${HADOOP_VERSION}.tar.gz | tar -xz -C /app \
    && ln -s /app/hadoop-${HADOOP_VERSION} /app/hadoop

ENV JAVA_HOME=/app/java
ENV HADOOP_PREFIX=/app/hadoop
ENV HADOOP_CONF_DIR=$HADOOP_PREFIX/etc/hadoop

COPY *-site.xml $HADOOP_CONF_DIR/

VOLUME ["/data"]

RUN adduser --disabled-password --gecos "Hadoop User" hadoop \
    && chown -R hadoop:hadoop /data

USER hadoop

ENV HADOOP_NAMENODE_HOST="hadoop-dfs-namenode"
ENV HADOOP_OPTS="-Dhadoop.namenode.host=$HADOOP_NAMENODE_HOST"

ENV YARN_RESOURCEMANAGER_HOSTNAME="hadoop-yarn-resourcemanager"
ENV YARN_OPTS="-Dyarn.resourcemanager.hostname=$YARN_RESOURCEMANAGER_HOSTNAME"