#!/bin/bash

source .env-1.30

docker build -f Dockerfile --rm --network host -t magnum-kubernetes:latest .

imagedir=`pwd`/image
mkdir -p $imagedir
chmod 666 $imagedir

docker run --rm --privileged --network host -v $imagedir:/image magnum-kubernetes \
    sh -c 'export DIB_KUBERNETES_VERSION="'$DIB_KUBERNETES_VERSION'" && \
    export DIB_RELEASE="'$DISTR'" && \
    export DIB_CNI_PLUGINS_VERSION="'$DIB_CNI_PLUGINS_VERSION'" && \
    export DIB_CONTAINERD_VERSION="'$DIB_CONTAINERD_VERSION'" && \
    export DIB_CRI_TOOLS_VERSION="'$DIB_CRI_TOOLS_VERSION'" && \
    export DIB_NPD_VERSION="'$DIB_NPD_VERSION'" && \
    export DIB_RUNC_VERSION="'$DIB_RUNC_VERSION'" && \
    export DIB_CLOUD_PROVIDER_TAG="'$DIB_CLOUD_PROVIDER_TAG'" && \
    export DIB_CILIUM_TAG="'$DIB_CILIUM_TAG'" && \
    export DIB_CALICO_TAG="'$DIB_CALICO_TAG'" && \
    disk-image-create -x -t qcow2 \
     --no-tmpfs --image-size 5 \
     -o /image/k8s-v$DIB_KUBERNETES_VERSION-$DIB_RELEASE.qcow2 \
     -n block-device-efi vm ubuntu kubernetes qemu-ga allow-root prepull-images npd'
