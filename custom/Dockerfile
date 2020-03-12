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
RUN mkdir -p /var/lib/answerhub/search_index \
    && chown -R tomcat:tomcat $APP_ROOT/teamhub.home/themes \
    $APP_ROOT/teamhub.home/sites \
    $APP_ROOT/teamhub.home/plugins \
    /var/lib/answerhub/search_index

VOLUME $APP_ROOT/teamhub.home/sites /var/lib/answerhub/search_index

USER tomcat
WORKDIR $CATALINA_HOME
