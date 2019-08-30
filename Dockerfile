# ベース
FROM centos:7

# java適用
RUN set -x && \
    yum update -y  && \
    yum install -y java-1.8.0-openjdk && \
    yum install -y java-1.8.0-openjdk-devel && \
    yum clean all

# 環境設定
ENV JAVA_HOME="/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.144-0.b01.el7_4.x86_64" \
    PATH="$PATH:\${JAVA_HOME}/bin" \
    CLASSPATH=".:\${JAVA_HOME}/jre/lib:\${JAVA_HOME}/lib:\${JAVA_HOME}/lib/tools.jar"

# セットアップ
RUN mkdir /var/java
WORKDIR /var/java
COPY ./ /var/java/
