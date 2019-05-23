FROM haproxy:latest
MAINTAINER RafPe

RUN apt-get update && apt-get install rsyslog -y

ADD haproxy.conf /etc/rsyslog.d/haproxy.conf
ADD rsyslog.conf /etc/rsyslog.conf

COPY docker-entrypoint.sh /

LABEL org.label-schema.build-date="2016-06-20T10:23:04Z" \
            org.label-schema.docker.dockerfile="/Dockerfile" \
            org.label-schema.license="MIT" \
            org.label-schema.name="HAproxy-syslog" \
            org.label-schema.url="https://rafpe.ninja" \
            org.label-schema.vcs-ref="e9cfd52" \
            org.label-schema.vcs-type="Git" \
            org.label-schema.vcs-url="https://github.com/RafPe/docker-haproxy-rsyslog.git"

EXPOSE 80 443

ENTRYPOINT ["/docker-entrypoint.sh"]
