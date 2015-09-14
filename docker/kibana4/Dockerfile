FROM debian:wheezy
MAINTAINER Adrian van Dongen adrian@kumina.nl

ENV REFRESHED_AT 2015-09-10

ENV KIBANA_VERSION 4.1.2-linux-x64

## Install curl
RUN apt-get update -q \
&& DEBIAN_FRONTEND=noninteractive apt-get install -y curl

## Install kibana
RUN curl -s https://download.elastic.co/kibana/kibana/kibana-$KIBANA_VERSION.tar.gz | tar xz -C /tmp
RUN mv /tmp/kibana-* /opt/kibana

# init solution
WORKDIR /opt
ADD start.sh /start.sh
RUN chmod +x /start.sh
CMD '/start.sh'

# Expose ports.
EXPOSE 5601
