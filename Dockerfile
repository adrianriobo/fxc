FROM registry.hub.docker.com/library/alpine@sha256:234cb88d3020898631af0ccbbcca9a66ae7306ecd30c9720690858c1b007d2a0

LABEL org.opencontainers.image.authors="Adrian Riobo <ariobolo@redhat.com>"

RUN apk add --no-cache freerdp freerdp-plugins xvfb xdpyinfo

COPY entrypoint.sh /usr/local/bin

ENTRYPOINT entrypoint.sh
