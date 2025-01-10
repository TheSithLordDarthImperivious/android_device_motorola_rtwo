#
# Copyright (C) 2023 The Android Open Source Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Release name
PRODUCT_RELEASE_NAME := rtwo

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Enable project quotas and casefolding for emulated storage without sdcardfs
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

# Inherit some common TWRP stuff.
$(call inherit-product, vendor/twrp/config/common.mk)

# Inherit device configuration
$(call inherit-product, device/motorola/rtwo/device.mk)

PRODUCT_COPY_FILES += $(call find-copy-subdir-files,*,device/motorola/rtwo/recovery/root,recovery/root)

PRODUCT_DEVICE := rtwo
PRODUCT_NAME := twrp_rtwo
PRODUCT_BRAND := motorola
PRODUCT_MODEL := Motorola Edge 40 Pro
PRODUCT_MANUFACTURER := motorola
