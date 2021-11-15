#!/bin/bash
if [ $(ls /geneweb/bases/*.gwb 2>/dev/null|wc -l) -eq 0 ]; then
  echo No existing databases detected so starting setup server...
  /sbin/ip route|awk '/default/ { print $3 }' > /geneweb/gw/only.txt
  /geneweb/gwsetup -lang ${LANGUAGE} -daemon
  sleep 1
  echo
fi

/geneweb/gwd -lang ${LANGUAGE}
