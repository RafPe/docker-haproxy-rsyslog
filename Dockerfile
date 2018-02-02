FROM haproxy:latest
MAINTAINER RafPe

RUN apt-get update && apt-get install rsyslog wget -y && \
    sed -i 's/#$ModLoad imudp/$ModLoad imudp/g' /etc/rsyslog.conf && \
    sed -i 's/#$UDPServerRun 514/$UDPServerRun 514/g' /etc/rsyslog.conf

RUN wget -O /usr/local/bin/dumb-init https://github.com/Yelp/dumb-init/releases/download/v1.2.1/dumb-init_1.2.1_amd64
RUN chmod +x /usr/local/bin/dumb-init

ADD haproxy.conf /etc/rsyslog.d
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

ENTRYPOINT ["/usr/local/bin/dumb-init"]
CMD ["/docker-entrypoint.sh"]
