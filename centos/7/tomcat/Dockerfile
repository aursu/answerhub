FROM centos:7-jdk-8

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
ENV FLAGS $JAVA_OPTS $CATALINA_OPTS
ENV OPTIONS -Dcatalina.base=${CATALINA_BASE} -Dcatalina.home=${CATALINA_HOME} \
    -Djava.endorsed.dirs=${JAVA_ENDORSED_DIRS} -Djava.io.tmpdir=${CATALINA_TMPDIR} \
    -Djava.util.logging.config.file=${LOGGING_PROPERTIES} \
    -Djava.util.logging.manager=org.apache.juli.ClassLoaderLogManager

RUN yum -y install \
        tomcat \
        tomcat-lib \
        apache-commons-daemon \
    && yum clean all && rm -rf /var/cache/yum

USER tomcat
WORKDIR $CATALINA_HOME
CMD "${JAVACMD}" ${FLAGS} -classpath "${CLASSPATH}" ${OPTIONS} "${MAIN_CLASS}" start
