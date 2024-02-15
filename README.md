# fxc

Container allowing create fake connections to emulate X sessions. 

[![Container Repository on Quay](https://quay.io/repository/rhqp/fxc/status "Container Repository on Quay")](https://quay.io/repository/rhqp/fxc)

## Run container

Container should be run with mandatory envs: *HOST*, *USER*, *PASSWORD*  

Env *INSECURE* allows to force certificate validation on connection (only for RDP connections). Default value is true, so no certificate validation  

```bash
# vnc fake connection
podman run -d --rm --name fxc-vnc \
    -e PROTOCOL=vnc \
    -e HOST=x.x.x.x \
    -e USER=fake \
    -e PASSWORDs=fake \
    quay.io/rhqp/fxc:v1.0.0-dev

# rdp fake connection
podman run -d --rm --name fxc-rdp \
    -e PROTOCOL=rdp \
    -e HOST=x.x.x.x \
    -e USER=fake \
    -e PASSWORDs=fake \
    quay.io/rhqp/fxc:v1.0.0-dev
```
