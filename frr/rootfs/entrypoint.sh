#!/bin/bash


ln -sf /etc/frr/frr.${ROUTER}.conf /etc/frr/frr.conf
ln -sf /etc/frr/daemons.${ROUTER} /etc/frr/daemons

exec /usr/lib/frr/docker-start "$@"