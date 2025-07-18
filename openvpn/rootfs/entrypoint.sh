#!/usr/bin/dumb-init /bin/sh

# start OpenVPN
"$@" &

# start auth helper
/usr/local/bin/openvpn-auth-oauth2 --config "/etc/openvpn/openvpn-auth-oauth2.yaml" &

fg %1