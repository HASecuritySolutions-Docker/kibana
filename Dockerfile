FROM docker.elastic.co/kibana/kibana:7.2.0

MAINTAINER Justin Henderson justin@hasecuritysolutions.com

RUN cd /usr/share/kibana \
    && bin/kibana-plugin install -q https://github.com/bitsensor/elastalert-kibana-plugin/releases/download/1.1.0/elastalert-kibana-plugin-1.1.0-7.2.0.zip

STOPSIGNAL SIGTERM
