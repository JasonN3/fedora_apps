#!/bin/sh

set -e

iface="${1:-wg0}"

wg-quick up "$iface"

trap 'wg-quick down "$iface"' INT TERM EXIT

tail -f /dev/null