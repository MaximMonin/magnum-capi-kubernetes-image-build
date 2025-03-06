#!/bin/bash
# SPDX-License-Identifier: Apache-2.0

if [ ${DIB_DEBUG_TRACE:-1} -gt 0 ]; then
    set -x
fi

set -eu
set -o pipefail

# make sure /etc/kubernetes/manifests dir for static pods exists
mkdir -p /etc/kubernetes/manifests
