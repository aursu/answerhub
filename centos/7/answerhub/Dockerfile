FROM centos:7-tomcat

ARG APP_NAME=answerhub
ARG APP_VERSION=1.6.6
ENV APP_ROOT=/var/www/answerhub
ENV APP_WAR=$APP_ROOT/teamhub.war

USER root

COPY centos/system/etc/tomcat/conf.d/answerhub.conf /etc/tomcat/conf.d/answerhub.conf

# create default context
RUN mkdir -p $APP_ROOT \
    && ln -s ${APP_WAR} $CATALINA_BASE/webapps/ROOT

COPY ${APP_NAME}-${APP_VERSION} ${APP_ROOT}

RUN chown -R tomcat:tomcat ${APP_ROOT}

USER tomcat
WORKDIR $CATALINA_HOME
