FROM docker.elastic.co/kibana/kibana:7.5.1

MAINTAINER Justin Henderson justin@hasecuritysolutions.com

USER root
RUN cd /tmp \
    && yum install wget -y \
    && wget https://hasecuritysolutions.com/elastalert-kibana-plugin-1.1.0-7.5.1.zip -O /tmp/elastalert-plugin.zip \
    && chmod 777 /tmp/elastalert-plugin.zip \
    && chown kibana:kibana /tmp/elastalert-plugin.zip \
    && yum remove wget -y \
    && yum clean all -y
USER kibana
RUN cd /usr/share/kibana \
    && bin/kibana-plugin install -q file:///tmp/elastalert-plugin.zip \
    && rm -f /tmp/elastalert-plugin.zip

STOPSIGNAL SIGTERM
