#!/bin/bash

source .env-build

docker build -f Dockerfile --rm --network host -t magnum-kubernetes:latest .

imagedir=`pwd`/image
mkdir -p $imagedir
chmod 666 $imagedir

docker run --rm --privileged --network host -v $imagedir:/image magnum-kubernetes \
    sh -c 'export DIB_KUBERNETES_VERSION="'$DIB_KUBERNETES_VERSION'" && \
    export DIB_RELEASE="'$DISTR'" && \
    disk-image-create -x -t qcow2 \
     --no-tmpfs \
     -o /image/k8s-$DIB_KUBERNETES_VERSION-$DIB_RELEASE.qcow2 \
     -n block-device-efi vm ubuntu kubernetes qemu-ga allow-root'
