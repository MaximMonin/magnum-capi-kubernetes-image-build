#!/bin/bash
# SPDX-License-Identifier: Apache-2.0

if [ ${DIB_DEBUG_TRACE:-1} -gt 0 ]; then
    set -x
fi

set -eu
set -o pipefail

# upgrade packages in image
apt update
apt upgrade -y
