FROM aursu/centos:tomcat

ARG APP_NAME=answerhub
ARG APP_VERSION=1.6.6
ENV APP_ROOT=/var/www/answerhub
ENV APP_WAR=/var/www/answerhub/teamhub.war
ENV APP_CONFIG_PROPERTIES=/var/www/answerhub/teamhub.war/WEB-INF/classes/META-INF/config.properties

USER root

# setup settings according to
# http://docs.dzonesoftware.com/articles/13577/verify-and-configure-tomcat-settings-2.html
# and teamhub.home and teamhub.forceSetup acording to
# http://docs.dzonesoftware.com/articles/13569/install-and-configure-mysql-database-support-2.html
COPY system/etc/tomcat/conf.d/answerhub.conf /etc/tomcat/conf.d/answerhub.conf

# create default Context
RUN mkdir -p /var/www/answerhub \
    && ln -s /var/www/answerhub/teamhub.war $CATALINA_BASE/webapps/ROOT

COPY answerhub-${APP_VERSION} /var/www/answerhub
RUN chown -R tomcat:tomcat /var/www/answerhub

USER tomcat
WORKDIR $CATALINA_HOME
