#!/bin/sh

if [ ${DEBUG:-} = 'true' ]; then
    set -xuo 
fi

# connection string
INSECURE=${INSECURE:-'true'}
CONNECT_STRING="xfreerdp /v:${RDP_HOST} /u:${RDP_USER} /p:${RDP_PASSWORD} "
if [[ ${INSECURE} == 'true' ]]; then CONNECT_STRING="${CONNECT_STRING} /cert:tofu"; fi

Xvfb :1 &
exec env DISPLAY=:1 ${CONNECT_STRING}