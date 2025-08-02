#!/bin/sh

echo '{"command": "status-get"}' | socat - UNIX-CONNECT:/run/kea/kea4-ctrl-socket | jq -e '.result == 0' > /dev/null
