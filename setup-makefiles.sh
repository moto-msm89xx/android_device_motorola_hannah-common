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

source "./../../${VENDOR}/${DEVICE_COMMON}/setup-makefiles.sh" "$@"

# Reinitialize the helper for device
DEVICE_COMMON=hannah-common
INITIAL_COPYRIGHT_YEAR="$DEVICE_BRINGUP_YEAR"
setup_vendor "${DEVICE}" "${VENDOR}" "${LINEAGE_ROOT}" true

# Copyright headers and guards
write_headers "ahannah hannah rhannah"

# The standard device blobs
write_makefiles "${MY_DIR}/../${DEVICE_COMMON}/proprietary-files.txt" true

# Finish
write_footers

# Fixup soong namespace
sed -i "s|vendor/motorola/hannah-common|vendor/motorola/hannah|g" "${MY_DIR}/../../../vendor/${VENDOR}/${DEVICE}/${DEVICE}-vendor.mk"
