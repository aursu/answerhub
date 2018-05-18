FROM centos:7-answerhub

USER root

COPY centos/system/etc/tomcat/conf.d/answerhub-mysql.conf /etc/tomcat/conf.d/answerhub-mysql.conf

# create default context
RUN mkdir -p $APP_ROOT \
    && chown -R tomcat $APP_ROOT \
    && ln -s ${APP_WAR} $CATALINA_BASE/webapps/ROOT

USER tomcat

# license installation
COPY custom/teamhub.home/sites/network6/AH.license \
    $APP_ROOT/teamhub.home/sites/network6/AH.license

# custom themes installation
COPY custom/teamhub.home/themes \
    $APP_ROOT/teamhub.home/themes

WORKDIR $CATALINA_HOME