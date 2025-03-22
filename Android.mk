#
# Copyright (C) 2025 The Android Open Source Project
# Copyright (C) 2025 Rabbit Inc.
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE),r1)
include $(call all-subdir-makefiles,$(LOCAL_PATH))
endif
