FROM centos:7-curl

RUN yum -y install \
		bzr \
		git \
		mercurial \
		openssh-clients \
		subversion \
	&& yum clean all && rm -rf /var/cache/yum
