# fxc

Container allowing create fake connections to emulate X sessions. 

[![Container Repository on Quay](https://quay.io/repository/rhqp/fxc/status "Container Repository on Quay")](https://quay.io/repository/rhqp/fxc)

## Run container

Container should be run with mandatory envs: *HOST*, *USER*, *PASSWORD*  

Env *INSECURE* allows to force certificate validation on connection. Default value is true, so no certificate validation  

```bash
podman run -d --rm --name fxc \
    -e HOST=x.x.x.x \
    -e USER=fake \
    -e PASSWORDs=fake \
    quay.io/rhqp/fxc:latest
```
