#
# Copyright (C) 2025 The Android Open Source Project
# Copyright (C) 2025 Rabbit Inc.
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := device/rabbit/r1

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += ro.adb.secure=0
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += ro.secure=0
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += ro.debuggable=1

# Dynamic Partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Virtual A/B
ENABLE_VIRTUAL_AB := true
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)

# Project ID Quota
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

# A/B

AB_OTA_UPDATER := true

AB_OTA_PARTITIONS += \
    boot \
    product \
    system \
    system_ext \
    vendor \
    vbmeta \
    vbmeta_system

PRODUCT_PACKAGES += \
    otapreopt_script

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true


# Bootctrl
PRODUCT_PACKAGES += \
    android.hardware.boot@1.2-service \
    android.hardware.boot@1.2-mtkimpl \
    android.hardware.boot@1.2-mtkimpl.recovery

PRODUCT_PACKAGES_DEBUG += \
    bootctrl


PRODUCT_PACKAGES += \
    bootctrl.mt6765 \
    bootctrl.mt6765.recovery

# Health
PRODUCT_PACKAGES += \
   android.hardware.health@2.1-impl \
   android.hardware.health@2.1-service \
    libhealthd.$(PRODUCT_PLATFORM)

PRODUCT_PACKAGES_DEBUG += \
    update_engine_client

# Update Engine
PRODUCT_PACKAGES += \
    otapreopt_script \
    cppreopts.sh \
    update_engine \
    update_engine_sideload \
    update_verifier

# Fastbootd
PRODUCT_PACKAGES += \
    fastbootd \
    android.hardware.fastboot@1.0-impl-mock


# Shipping API level
PRODUCT_SHIPPING_API_LEVEL := 31

# VNDK
PRODUCT_TARGET_VNDK_VERSION := 31



# Keymaster
PRODUCT_PACKAGES += \
    android.hardware.keymaster@4.1

# Additional Libraries
TARGET_RECOVERY_DEVICE_MODULES += \
    android.hardware.keymaster@4.1 \

RECOVERY_LIBRARY_SOURCE_FILES += \
    $(TARGET_OUT_SHARED_LIBRARIES)/android.hardware.keymaster@4.1

# Keystore2
PRODUCT_PACKAGES += \
    android.system.keystore2



# MTK PlPath Utils
PRODUCT_PACKAGES += \
    mtk_plpath_utils.recovery


# libion & libxml2
TARGET_RECOVERY_DEVICE_MODULES += \
    libion \
    libxml2

RECOVERY_LIBRARY_SOURCE_FILES += \
    $(TARGET_OUT_SHARED_LIBRARIES)/libion.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libxml2.so
