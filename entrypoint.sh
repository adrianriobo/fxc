#!/bin/sh

if [ "${DEBUG:-}" = "true" ]; then
    set -xuo 
fi

# connection string
INSECURE="${INSECURE:-"true"}"
CONNECT_STRING="xfreerdp /v:${RDP_HOST} /u:${RDP_USER} /p:${RDP_PASSWORD} "
if [[ ${INSECURE} == 'true' ]]; then CONNECT_STRING="${CONNECT_STRING} /cert:tofu"; fi

# Create buffered x server
DISPLAY_SEQ=$RANDOM
Xvfb :${DISPLAY_SEQ} &

# Run fake rdp within buffered x server
exec env DISPLAY=:${DISPLAY_SEQ} ${CONNECT_STRING}