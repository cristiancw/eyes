FROM almalinux:8

LABEL name="Eyes GUI - container test" \
	maintainer="Cristian C. Wolfram"

RUN dnf install -y dnf-utils && \
	dnf config-manager --set-enabled powertools && \
	dnf install -y xeyes

CMD ["xeyes"]
