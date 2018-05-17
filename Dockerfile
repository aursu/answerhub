FROM centos:7-tomcat

ARG APP_NAME=answerhub
ARG APP_VERSION=1.6.6
ARG APP_ROOT=/var/www/${APP_NAME}
ARG APP_WAR=$APP_ROOT/teamhub.war

ENV JAVA_OPTS -Xmx1300M -Xms784M -XX:MaxPermSize=512m

USER root

# create default context
RUN mkdir -p $APP_ROOT \
    && chown -R tomcat $APP_ROOT \
    && ln -s ${APP_WAR} $CATALINA_BASE/webapps/ROOT

COPY ${APP_NAME}-${APP_VERSION} ${APP_ROOT}

RUN chown -R tomcat ${APP_ROOT}

USER tomcat
WORKDIR $CATALINA_HOME