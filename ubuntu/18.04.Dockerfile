FROM ubuntu:18.04

ENV TZ Asia/Shanghai

RUN  sed -i "s/archive.ubuntu.com/mirrors.aliyun.com/g" /etc/apt/sources.list \
     && sed -i "s/security.ubuntu.com/mirrors.aliyun.com/g" /etc/apt/sources.list \
     && apt update && apt upgrade -y \
     && apt -y install language-pack-zh-hans tzdata \
     && ln -snf /usr/share/zoneinfo/TZ /etc/localtime && echo TZ > /etc/timezone \
     && dpkg-reconfigure -f noninteractive tzdata \
     && apt clean \
     && rm -rf /tmp/* /var/cache/* /usr/share/doc/* /usr/share/man/* /var/lib/apt/lists/*

ENV LANG zh_CN.UTF-8
ENV LANGUAGE zh_CN:zh
ENV LC_ALL zh_CN.UTF-8

# docker build . -t fastjrun/ubuntu:18.04 -f 18.04.Dockerfile