FROM centos:7
LABEL maintainer="borosgergo00@gmail.com"

ENV ORACLE_SERVER_JRE11_URL="http://download.oracle.com/otn/java/jdk/11.0.10%2B8/020c4a6d33b74f6a9d2bc6fbf189da81/jdk-11.0.10_linux-x64_bin.tar.gz" \
    JAVA_HOME=/opt/jre \
    JAVA=/opt/jre/bin \
    PATH=${PATH}:/opt/jre/bin

RUN yum install curl unzip -y \
    && cd /tmp \
    && curl -jk#SLH "Cookie: oraclelicense=accept-securebackup-cookie" -o jre.tar.gz ${ORACLE_SERVER_JRE11_URL} \
    && mkdir ${JAVA_HOME} \
    && tar xzf /tmp/jre.tar.gz -C /opt/jre --strip-components=1 \
    && rm -rf /tmp/*

CMD ["/bin/bash"]
