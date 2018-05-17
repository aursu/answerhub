FROM centos:7-tomcat

ARG APP_NAME=answerhub
ARG APP_VERSION=1.6.6
ARG APP_ROOT=/var/www/answerhub

ENV JAVA_OPTS -Xmx1300M -Xms784M -XX:MaxPermSize=512m

USER root

RUN mkdir $APP_ROOT \
    && chown -R tomcat $APP_ROOT \
    && ln -s ${APP_ROOT}/teamhub.war $CATALINA_BASE/webapps/ROOT

COPY answerhub-${AH_VERSION} /var/www/answerhub

RUN chown -R tomcat /var/www/answerhub \
    && find

WORKDIR $CATALINA_HOME