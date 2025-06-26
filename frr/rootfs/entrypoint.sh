#!/bin/bash

# Validate ROUTER environment variable
if [[ -z "${ROUTER:-}" ]]; then
  echo "ERROR: ROUTER environment variable must be set" >&2
  exit 1
fi

# Verify the configuration files exist
if [[ ! -f "/etc/frr/frr.${ROUTER}.conf" ]]; then
  echo "ERROR: Configuration file /etc/frr/frr.${ROUTER}.conf not found" >&2
  exit 2
fi

if [[ ! -f "/etc/frr/daemons.${ROUTER}" ]]; then
  echo "ERROR: Daemons file /etc/frr/daemons.${ROUTER} not found" >&2
  exit 3
fi

ln -sf /etc/frr/frr.${ROUTER}.conf /etc/frr/frr.conf
ln -sf /etc/frr/daemons.${ROUTER} /etc/frr/daemons

exec /usr/lib/frr/docker-start "$@"