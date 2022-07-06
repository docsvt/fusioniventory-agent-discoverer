FROM debian:stable as debian_updated

LABEL org.opencontainers.image.authors="docsvt@gmail.com"

RUN apt-get update && apt-get -y -q upgrade && \
   DEBIAN_FRONTEND=noninteractive apt-get install -y -q \
    nmap \
    fusioninventory-agent \
    fusioninventory-agent-task-network

FROM debian_updated
COPY ./docker-entrypoint.sh /
EXPOSE  62354/tcp

ENV SERVER http://glpi/plugins/fusioninventory/
ENV DEBUG false
ENV OPTIONS ''

ENTRYPOINT ["/bin/sh", "/docker-entrypoint.sh"]
