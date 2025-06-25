#!/bin/bash

sed -i 's/^#?frr_global_options=.*/frr_global_options="-f /etc/frr/frr.${ROUTER}.conf

exec /usr/lib/frr/docker-start $@