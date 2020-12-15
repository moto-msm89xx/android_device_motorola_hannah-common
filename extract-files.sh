#!/bin/bash
#
# Copyright (C) 2019 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# If we're being sourced by the common script that we called,
# stop right here. No need to go down the rabbit hole.
if [ "${BASH_SOURCE[0]}" != "${0}" ]; then
    return
fi

set -e

# Required!
export DEVICE=hannah
export DEVICE_COMMON=msm8937-common
export VENDOR=motorola

export DEVICE_BRINGUP_YEAR=2019

"./../../${VENDOR}/${DEVICE_COMMON}/extract-files.sh" "$@"

# Reinitialize the helper for device
setup_vendor "${DEVICE}" "${VENDOR}" "${LINEAGE_ROOT}" false "${CLEAN_VENDOR}"

extract "${MY_DIR}/../${DEVICE}/proprietary-files.txt" "${SRC}" \
        "${KANG}" --section "${SECTION}"

"${MY_DIR}/../${DEVICE}/setup-makefiles.sh"
