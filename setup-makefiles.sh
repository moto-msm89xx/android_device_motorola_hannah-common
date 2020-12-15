#!/bin/bash
#
# Copyright (C) 2019 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

set -e

# Required!
export DEVICE=hannah
export DEVICE_COMMON=msm8937-common
export VENDOR=motorola

export DEVICE_BRINGUP_YEAR=2019

"./../../${VENDOR}/${DEVICE_COMMON}/setup-makefiles.sh" "$@"

# Reinitialize the helper for device
INITIAL_COPYRIGHT_YEAR="$DEVICE_BRINGUP_YEAR"
setup_vendor "${DEVICE}" "${VENDOR}" "${LINEAGE_ROOT}" false

# Copyright headers and guards
write_headers "ahannah hannah rhannah"

# The standard device blobs
write_makefiles "${MY_DIR}/../${DEVICE}/proprietary-files.txt" true

# Finish
write_footers
