VERSION ?= 2.0.0-dev
CONTAINER_MANAGER ?= podman
# Image URL to use all building/pushing image targets
IMG ?= quay.io/rhqp/fxc:v${VERSION}

# Build the container image
.PHONY: oci-build
oci-build: 
	${CONTAINER_MANAGER} build -t ${IMG} -f Containerfile .

# Push the docker image
.PHONY: oci-push
oci-push:
	${CONTAINER_MANAGER} push ${IMG}