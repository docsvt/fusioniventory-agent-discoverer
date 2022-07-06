# Project to deply FusionInventory agent with dicovery modules

# Table of Contents


# Intruduction 

Install and run FusionInventory Agent with netwok discovery modules

# Deploy FusionInventory Agent

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
