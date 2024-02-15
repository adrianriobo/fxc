#!/bin/sh

# Verbosity
DEBUG="${DEBUG:-"false"}"
if [[ ${DEBUG} == "true" ]]; then
    set -xuo 
fi

# VNC connection string
vnc() {
    echo "VNC_USERNAME=${USER} VNC_PASSWORD=${PASSWORD} vncviewer ${HOST}"
}

# RDP connection string
rdp() {
    c="xfreerdp /v:${HOST} /u:${USER} /p:${PASSWORD} +auto-reconnect "
    INSECURE="${INSECURE:-"true"}"
    if [[ ${INSECURE} == 'true' ]]; then c="${c} /cert:tofu "; fi
    echo "${c}"
}

# Create buffered x server
DISPLAY_SEQ=$RANDOM
Xvfb :${DISPLAY_SEQ} &
while ! xdpyinfo -display :${DISPLAY_SEQ} >/dev/null 2>&1; do 
    sleep 0.5s; 
    echo "waiting for xvfb"; 
done
# Connection string by protocol
[[ -z "${PROTOCOL+x}" ]] \
        && echo "PROTOCOL is mandatory" \
        && exit 1
CONNECT_STRING=""
case "${PROTOCOL}" in
  vnc)
    CONNECT_STRING=$(vnc)
    ;;

  rdp)
    CONNECT_STRING=$(rdp)
    ;;
  *)
    echo "${PROTOCOL} is not supported. Valid values are rdp or vnc"
    exit 1 
    ;;
esac
# Connect
CONNECT="DISPLAY=:${DISPLAY_SEQ} ${CONNECT_STRING}"
eval "${CONNECT}"   
exit 0
