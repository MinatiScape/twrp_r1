#
# Copyright (C) 2025 The Android Open Source Project
# Copyright (C) 2025 Rabbit Inc.
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common twrp stuff.
$(call inherit-product, vendor/twrp/config/common.mk)

# Inherit from r1 device
$(call inherit-product, device/rabbit/r1/device.mk)

PRODUCT_DEVICE := r1
PRODUCT_NAME := twrp_r1
PRODUCT_BRAND := rabbit
PRODUCT_MODEL := r1
PRODUCT_MANUFACTURER := rabbit

PRODUCT_GMS_CLIENTID_BASE := android-rabbit

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="r1-user 13 TP1A.230812.016 204 release-keys"

BUILD_FINGERPRINT := rabbit/r1/r1:13/TP1A.230812.016/20240509094513:user/release-keys
