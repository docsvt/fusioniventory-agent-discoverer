#!/usr/bin/env bash

RUN_OPTIONS="--server ${SERVER} --daemon --no-fork --logger=Stderr ${OPTIONS}"

case "${DEBUG}" in
   true|1)
      RUN_OPTIONS="${RUN_OPTIONS} --debug"
   ;;
esac

/usr/bin/fusioninventory-agent ${RUN_OPTIONS}

