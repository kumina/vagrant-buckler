FROM elasticsearch
MAINTAINER Adrian van Dongen adrian@kumina.nl

ENV REFRESHED_AT 2015-09-12

# Add custom config to enable http
ADD ./config/elasticsearch.yml /elasticsearch/config/elasticsearch.yml

# Add kopf plugin for management.
RUN plugin --install lmenezes/elasticsearch-kopf/v1.5.7
