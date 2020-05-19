FROM fastjrun/ubuntu:18.04

ARG JDK_VERSION=8u201

RUN cd /opt && apt update && apt install -y wget \
    && wget -q "https://github.com/fastjrun/soft/releases/download/oraclejdk-$JDK_VERSION/jdk-$JDK_VERSION-linux-x64.tar.gz" \
    && tar -zxf "jdk-$JDK_VERSION-linux-x64.tar.gz" \
    && rm -rf "jdk-$JDK_VERSION-linux-x64.tar.gz" \
    && mv /opt/jdk* /opt/jdk \
    && apt remove -y --purge wget && apt clean \
    && rm -rf /tmp/* /var/cache/* /usr/share/doc/* /usr/share/man/* /var/lib/apt/lists/*

ENV JAVA_HOME=/opt/jdk
ENV PATH=$JAVA_HOME/bin:$PATH

#docker build . -t fastjrun/oraclejdk:8u201-jdk-ubuntu-18-04