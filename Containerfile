FROM registry.hub.docker.com/library/alpine:3.19.1

LABEL org.opencontainers.image.authors="Adrian Riobo <ariobolo@redhat.com>"

RUN apk add --no-cache freerdp freerdp-plugins xvfb xdpyinfo tigervnc-client

COPY entrypoint.sh /usr/local/bin

ENTRYPOINT entrypoint.sh
