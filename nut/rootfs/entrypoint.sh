#!/bin/bash

if [[ -f /etc/ups/nut.conf ]]
then
  source /etc/ups/nut.conf
fi

mkdir -p /run/nut/upssched
chmod -R 0770 /run/nut
chown -R root:dialout /run/nut

/usr/bin/upsdrvctl -B start

exec "$@"
