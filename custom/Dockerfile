FROM answerhub:base

USER root

COPY system/etc/tomcat/server.xml /etc/tomcat/server.xml

# setup database.engine property into CATALINA_OPTS with mysql engine predefined
COPY system/etc/tomcat/conf.d/answerhub-mysql.conf /etc/tomcat/conf.d/answerhub-mysql.conf
RUN echo -n > $APP_CONFIG_PROPERTIES

# license installation
COPY update/sites $APP_ROOT/teamhub.home/sites

# custom themes installation
COPY update/themes $APP_ROOT/teamhub.home/themes

# additional plugins installation
COPY update/plugins $APP_ROOT/teamhub.home/plugins
RUN chown -R tomcat:tomcat $APP_ROOT/teamhub.home/themes \
    $APP_ROOT/teamhub.home/sites \
    $APP_ROOT/teamhub.home/plugins

VOLUME $APP_ROOT/teamhub.home/sites

USER tomcat
WORKDIR $CATALINA_HOME
