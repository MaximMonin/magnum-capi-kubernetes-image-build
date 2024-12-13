FROM ubuntu:noble

ENV DEBIAN_FRONTEND=noninteractive
ENV ELEMENTS_PATH=/capo-image-elements/elements
ENV DIB_CLOUD_INIT_DATASOURCES="OpenStack, ConfigDrive"

RUN apt update && \
    apt install -y python3-pip python3-virtualenv kpartx qemu-utils git debootstrap sudo lsb-release curl gdisk dosfstools squashfs-tools && \
    pip install diskimage-builder --break-system-packages

RUN git clone https://github.com/vexxhost/capo-image-elements.git
COPY /patch /capo-image-elements/elements
