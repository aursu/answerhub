FROM centos:7-jdk-8

RUN yum -y install tomcat \
    && yum clean all && rm -rf /var/cache/yum