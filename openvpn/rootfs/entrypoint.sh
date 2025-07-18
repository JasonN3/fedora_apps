#!/usr/bin/dumb-init

# start auth helper
/usr/local/bin/openvpn-auth-oauth2 --config "/etc/openvpn/openvpn-auth-oauth2.yaml" &

# start OpenVPN
"$@"
