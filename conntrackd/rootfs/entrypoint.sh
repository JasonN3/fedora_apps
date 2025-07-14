#!/bin/bash

[[ -d /run/lock ]] || mkdir /run/lock
[[ -f /var/lock/conntrack.lock ]] && rm -f /var/lock/conntrack.lock

exec "$@"