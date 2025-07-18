#!/bin/sh
set -euo pipefail

# start auth helper
/usr/local/bin/openvpn-auth-oauth2 --config "/etc/openvpn/openvpn-auth-oauth2.yaml" &
oauth_pid=$!

# forward SIGTERM/SIGINT to both processes and reap properly
term_handler() {
  kill -TERM "$oauth_pid" 2>/dev/null || true
  kill -TERM "$openvpn_pid" 2>/dev/null || true
  wait "$oauth_pid" "$openvpn_pid"
}
trap term_handler INT TERM

# start OpenVPN in foreground
"$@" &
openvpn_pid=$!

# wait on foreground process(es)
wait "$openvpn_pid"