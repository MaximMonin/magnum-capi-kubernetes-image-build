# Kubernetes image build for Magnum ClusterApi driver

Auto build ubuntu kubernetes images for Openstack Magnum Service with a docker.   
Ubuntu 24.04 + k8s 1.30+ as base image, tested with Magnum Capi driver.

### Notes
* https://github.com/vexxhost/magnum-cluster-api - new Magnum driver supporting ClusterApi.
* https://github.com/vexxhost/capo-image-elements - project to build Kubernetes images.

### Fixes
* Make sure the /etc/kubernetes/manifests directory exists for static pods (reduce logs on worker nodes).
* Added initialization of KUBECONFIG environment variable.
* cloud-init uses default Openstack datasources (Openstack, ConfigDrive)

### Patches
* qemu-ga - added qemu guest agent to image.
* allow-root - allow root user and ssh root access with a key to kubernetes nodes.
* block-device-efi - make sure image works under Legacy and Uefi Bios (secure boot is not supported).
* prepull-images - pre pull openstack/cni container images.
