FROM centos:7-jdk-8

ARG MYSQL_CONN_RPM=mysql-connector-java-8.0.11-1.el7.noarch.rpm
ARG MYSQL_CONN_URL=https://cdn.mysql.com//Downloads/Connector-J/${MYSQL_CONN_RPM}
ARG MYSQL_CONN_PATH=/tmp/${MYSQL_CONN_RPM}
ARG MYSQL_PUBKEY=5072E1F5

ENV TOMCATS_BASE=/var/lib/tomcats/
ENV JAVA_HOME=/usr/lib/jvm/jre
ENV CATALINA_HOME=/usr/share/tomcat
ENV CATALINA_TMPDIR=/var/cache/tomcat/temp
ENV JAVA_LIBDIR=/usr/share/java
ENV JNI_LIBDIR=/usr/lib/java
ENV JVM_ROOT=/usr/lib/jvm
ENV CATALINA_BASE $CATALINA_HOME
ENV JAVACMD ${JAVA_HOME}/bin/java
ENV CLASSPATH ${CLASSPATH}${CLASSPATH:+:}${CATALINA_HOME}/bin/bootstrap.jar:${CATALINA_HOME}/bin/tomcat-juli.jar:${JAVA_LIBDIR}/commons-daemon.jar
ENV LOGGING_PROPERTIES ${CATALINA_BASE}/conf/logging.properties

ENV MAIN_CLASS=org.apache.catalina.startup.Bootstrap
ENV OPTIONS -Dcatalina.base=${CATALINA_BASE} -Dcatalina.home=${CATALINA_HOME} \
    -Djava.endorsed.dirs=${JAVA_ENDORSED_DIRS} -Djava.io.tmpdir=${CATALINA_TMPDIR} \
    -Djava.util.logging.config.file=${LOGGING_PROPERTIES} \
    -Djava.util.logging.manager=org.apache.juli.ClassLoaderLogManager

RUN yum -y install \
        tomcat \
        tomcat-lib \
        apache-commons-daemon \
    && yum clean all && rm -rf /var/cache/yum

RUN set -e; \
    curl -L ${MYSQL_CONN_URL} -o ${MYSQL_CONN_PATH}; \
    gpg --recv-keys --keyserver keys.gnupg.net ${MYSQL_PUBKEY}; \
    gpg --export -a ${MYSQL_PUBKEY} > ${MYSQL_PUBKEY}.asc; \
    rpm --import ${MYSQL_PUBKEY}.asc; \
    rpm -ivh ${MYSQL_CONN_PATH}; \
    rm -f ${MYSQL_CONN_PATH}; \
    rm -rf /root/.gnupg

RUN mkdir -p $CATALINA_BASE/webapps

USER tomcat
WORKDIR $CATALINA_HOME
CMD "${JAVACMD}" ${JAVA_OPTS} ${CATALINA_OPTS} -classpath "${CLASSPATH}" ${OPTIONS} "${MAIN_CLASS}" start
