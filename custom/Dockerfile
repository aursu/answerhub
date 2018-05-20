FROM answerhub:base

USER root

# setup database.engine property into CATALINA_OPTS with mysql engine predefined
COPY system/etc/tomcat/conf.d/answerhub-mysql.conf /etc/tomcat/conf.d/answerhub-mysql.conf
RUN echo -n > $APP_CONFIG_PROPERTIES

# license installation
COPY update/sites $APP_ROOT/teamhub.home/sites
RUN chown -R tomcat:tomcat $APP_ROOT/teamhub.home/sites

# custom themes installation
COPY update/themes $APP_ROOT/teamhub.home/themes
RUN chown -R tomcat:tomcat $APP_ROOT/teamhub.home/themes

USER tomcat
WORKDIR $CATALINA_HOME
