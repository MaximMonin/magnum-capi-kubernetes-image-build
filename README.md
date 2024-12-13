# Kubernetes image build for Magnum ClusterApi driver

Auto build ubuntu kubernetes images for Openstack Magnum Service with a docker.
Ubuntu 24.04 + k8s 1.30+ as base image, tested with Magnum Capi driver.

### Notes
* https://github.com/vexxhost/magnum-cluster-api - new magnum driver supporting ClusterApi.
* https://github.com/vexxhost/capo-image-elements - project to build Kubernetes images.

### Fixes
* Fixed build error where systemctl enable containerd/kubelet would throw exception - service does not exist. Fixed by adding element_deps.
* Make sure the /etc/kubernetes/manifests directory exists for static pods (reduce logs on worker nodes).
* cloud-init uses default Openstack datasources (Openstack, ConfigDrive)

### Patches
* qemu-ga - added qemu guest agent to image.
* allow-root - allowed root user and ssh root access to kubernetes nodes.
* block-device-efi - make sure image works under Legacy and Uefi Bios (secure boot not supported).
