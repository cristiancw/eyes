FROM centos
LABEL name="Eyes GUI - container test" \
	maintainer="Cristian C. Wolfram"
RUN yum install -y xeyes
CMD ["/usr/bin/xeyes"]
