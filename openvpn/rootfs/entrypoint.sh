#!/bin/sh

/usr/local/bin/openvpn-auth-oauth2 --config "/etc/openvpn/openvpn-auth-oauth2.yaml" &

exec "$@"