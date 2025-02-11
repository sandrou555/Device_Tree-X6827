#
# Copyright (C) 2022 The Android Open Source Project
# Copyright (C) 2022 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#
# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)



# Inherit from X6812 device
$(call inherit-product, device/infinix/X6827/device.mk)

# Inherit some common TWRP stuff.
$(call inherit-product, vendor/pb/config/common.mk)

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := X6827
PRODUCT_NAME := pbrp_X6827
PRODUCT_BRAND := Infinix
PRODUCT_MODEL := Infinix HOT 20S
PRODUCT_MANUFACTURER := infinix

