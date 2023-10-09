#!/bin/bash
if [ $(ls /geneweb/bases/*.gwb 2>/dev/null|wc -l) -eq 0 ]; then
  echo No existing databases detected so starting setup server...
  if [[ -z "$SETUP_ACCESS_ALLOWED_IP" ]]; then
    SETUP_ACCESS_ALLOWED_IP=$(/sbin/ip route|awk '/default/ { print $3 }')
  fi
  echo $SETUP_ACCESS_ALLOWED_IP > /geneweb/gw/only.txt
  /geneweb/gwsetup -lang ${LANGUAGE} -daemon
  sleep 1
  echo
fi

/geneweb/gwd -lang ${LANGUAGE}
