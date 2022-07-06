# Project to deply FusionInventory agent with dicovery modules

# Table of Contents


# Introduction 

Install and run FusionInventory Agent with netwok discovery modules

# Deploy FusionInventory agent with docker-compose
**docker-compose.yml**
```
version: "3.9"

services:
  fusioninventory-agent-discoverer:
    image: "docsvt/fusioninventory-agent-discoverer:latest"
    container_name: "fusioninventory-agent-discoverer"
    hostname: "fa-discoverer"
    ports:
      - "62354"
    volumes:
      - "/volume1/docker/fusioninventory-agent-discoverer/data/conf.d/:/etc/fusioninventory/conf.d/:ro"
    environment:
      - DEBUG=true
      - SERVER=https://glpi.local.lab:8443/plugins/fusioninventory/
      - OPTIONS=--no-ssl-check
    restart: unless-stopped
```
# Ports
Agent include embedded HTTP server on port 62354.
Exposing port from command line 
```sh
docker run --name fusioninventory-agent-discoverer --port 62345:62345/tcp
```
Exposing port from docker-compose
```sh
ports:
  - 62345:62345
```

# Enviroment variables
## OPTIONS

Add additional FusionInventory Agent option. See [manual page](https://documentation.fusioninventory.org/%20FusionInventory_agent/%20Manpage/fusioninventory-agent/)

From command line
```sh
docker run --name fusioninventory-agent-discoverer --env "OPTIONS=--no-ssl-check"
```

From docker-compose

```sh
enviroment:
  - OPTIONS=--no-ssl-check
```

## SERVER

Point agent to remote server URL (e.g. glpi). Default value http://glpi/plugins/fusioninventory/

From command line
```sh
docker run --name fusioninventory-agent-discoverer --env "SERVER=https://glpi.local.lab/plugins/fusioninventory/"
```

From docker-compose

```sh
enviroment:
  - SERVER=https://glpi.local.lab/plugins/fusioninventory/
```

## DEBUG

Run agent in debug mode. 

From command line
```sh
docker run --name fusioninventory-agent-discoverer --env "DEBUG=true"
```

From docker-compose

```sh
enviroment:
  - DEBUG=true
```
