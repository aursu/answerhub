FROM centos:7-answerhub

USER root

# setup database.engine property into CATALINA_OPTS with mysql engine predefined
COPY centos/system/etc/tomcat/conf.d/answerhub-mysql.conf /etc/tomcat/conf.d/answerhub-mysql.conf
RUN echo -n > $APP_CONFIG_PROPERTIES

# license installation
COPY custom/teamhub.home/sites $APP_ROOT/teamhub.home/sites
RUN chown -R tomcat:tomcat $APP_ROOT/teamhub.home/sites

# custom themes installation
COPY custom/teamhub.home/themes $APP_ROOT/teamhub.home/themes
RUN chown -R tomcat:tomcat $APP_ROOT/teamhub.home/themes

USER tomcat
WORKDIR $CATALINA_HOME
