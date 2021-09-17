# frdp

Container allowing create fake rdp connections

[![Container Repository on Quay](https://quay.io/repository/ariobolo/frdp/status "Container Repository on Quay")](https://quay.io/repository/ariobolo/frdp)

## Run container

Container should be run with mandatory envs: *RDP_HOST*, *RDP_USER*, *RDP_PASSWORD*  

Env *INSECURE* allows to force certificate validation on connection. Default value is true, so no certificate validation  

```bash
podman run -d --rm --name frdp \
    -e RDP_HOST=x.x.x.x \
    -e RDP_USER=fake \
    -e RDP_PASSWORDs=fake \
    quay.io/ariobolo/frdp:latest
```
