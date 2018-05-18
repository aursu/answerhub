FROM centos:7-answerhub

USER root

COPY centos/system/etc/tomcat/conf.d/answerhub-mysql.conf /etc/tomcat/conf.d/answerhub-mysql.conf

# license installation
COPY custom/teamhub.home/sites/network6/AH.license \
    $APP_ROOT/teamhub.home/sites/network6/AH.license

# custom themes installation
COPY custom/teamhub.home/themes \
    $APP_ROOT/teamhub.home/themes

# cleanup default application settings
RUN echo -n > ${APP_WAR}/WEB-INF/classes/META-INF/config.properties \
    && chown -R tomcat:tomcat $APP_ROOT/teamhub.home/sites/network6/AH.license \
    $APP_ROOT/teamhub.home/themes

USER tomcat
WORKDIR $CATALINA_HOME
