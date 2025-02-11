#
# Copyright (C) 2022 The Android Open Source Project
# Copyright (C) 2022 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/infinix/X6827

# For building with minimal manifest
ALLOW_MISSING_DEPENDENCIES := true
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := cortex-a53

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-2a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a55
TARGET_BOARD_SUFFIX := _64
TARGET_SUPPORTS_64_BIT_APPS := true

# Assert
TARGET_OTA_ASSERT_DEVICE := Infinix-X6827,X6827

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := Infinix-X6827
TARGET_NO_BOOTLOADER := true

# Platform
TARGET_BOARD_PLATFORM := mt6781
PRODUCT_PLATFORM := mt6781
PLATFORM_VERSION := 11.0.0
BOARD_API_LEVEL := 30
PB_DISABLE_DEFAULT_TREBLE_COMP := true

# A/B
AB_OTA_UPDATER := true

# Kernel
BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,64N2
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/kernel
TARGET_KERNEL_CONFIG := X6827_defconfig
TARGET_PREBUILT_DTB := $(DEVICE_PATH)/prebuilt/dtb.img
BOARD_BOOTIMG_HEADER_VERSION := 2
BOARD_KERNEL_BASE := 0x40078000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_RAMDISK_OFFSET := 0x07c08000
BOARD_KERNEL_TAGS_OFFSET := 0x0bc08000
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
BOARD_MKBOOTIMG_ARGS += --dtb $(TARGET_PREBUILT_DTB)
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOTIMG_HEADER_VERSION)
BOARD_KERNEL_IMAGE_NAME := Image

# AVB
# Verified Boot
BOARD_AVB_ENABLE := true
BOARD_AVB_VBMETA_SYSTEM := system system_ext product
BOARD_AVB_VBMETA_SYSTEM_KEY_PATH := external/avb/test/data/testkey_rsa2048.pem
BOARD_AVB_VBMETA_SYSTEM_ALGORITHM := SHA256_RSA2048
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX_LOCATION := 1
BOARD_AVB_VBMETA_VENDOR := vendor
BOARD_AVB_VBMETA_VENDOR_KEY_PATH := external/avb/test/data/testkey_rsa2048.pem
BOARD_AVB_VBMETA_VENDOR_ALGORITHM := SHA256_RSA2048
BOARD_AVB_VBMETA_VENDOR_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_VBMETA_VENDOR_ROLLBACK_INDEX_LOCATION := 2
BOARD_AVB_RECOVERY_KEY_PATH := external/avb/test/data/testkey_rsa2048.pem
BOARD_AVB_RECOVERY_ALGORITHM := SHA256_RSA2048
BOARD_AVB_RECOVERY_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_RECOVERY_ROLLBACK_INDEX_LOCATION := 3

# Dynamic Partitions
BOARD_SUPER_PARTITION_SIZE := 11201392640
BOARD_SUPER_PARTITION_GROUPS := main
BOARD_MAIN_SIZE := 11201392640 # (BOARD_SUPER_PARTITION_SIZE - 4MB)
BOARD_MAIN_PARTITION_LIST :=  \
    system \
    system_ext \
    vendor \
    product

# Partitions size
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_USES_METADATA_PARTITION := true
BOARD_USES_PRODUCTIMAGE := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 41943040
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# File systems
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := f2fs
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := erofs
BOARD_SYSTEM_EXTIMAGE_FILE_SYSTEM_TYPE := erofs
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := erofs
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := erofs

# System as root
BOARD_SUPPRESS_SECURE_ERASE := true
BOARD_BUILD_SYSTEM_ROOT_IMAGE := false

# Workaround for copying error vendor files to recovery ramdisk
TARGET_COPY_OUT_PRODUCT := product
TARGET_COPY_OUT_VENDOR := vendor
TARGET_COPY_OUT_SYSTEM_EXT = system_ext

# Crypto
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_CRYPTO_FBE := true
TW_INCLUDE_FBE_METADATA_DECRYPT := true
BOARD_ROOT_EXTRA_FOLDERS += metadata

# Properties
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop

# Encryption
PLATFORM_SECURITY_PATCH := 2099-12-31
VENDOR_SECURITY_PATCH := $(PLATFORM_SECURITY_PATCH)
PLATFORM_VERSION := 11.0.0
PLATFORM_VERSION_LAST_STABLE := $(PLATFORM_VERSION)

# Recovery
BOARD_HAS_LARGE_FILESYSTEM := true
TW_NO_FASTBOOT_BOOT := true
TW_INCLUDE_FASTBOOTD := true
TW_INCLUDE_INJECTTWRP := false
TW_HAS_NO_RECOVERY_PARTITION := true
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
RECOVERY_VARIANT := pbrp

# MTK
BOARD_HAS_MTK_HARDWARE := true
BOARD_USES_MTK_HARDWARE := true
#MTK_HARDWARE := true

TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery/root/system/etc/recovery.fstab

## Theme
TW_THEME := portrait_hdpi
RECOVERY_SDCARD_ON_DATA := true
BOARD_HAS_NO_REAL_SDCARD := true
TARGET_USES_MKE2FS := true
# Brightness
TW_BRIGHTNESS_PATH := "/sys/class/leds/lcd-backlight/brightness"
TW_DEFAULT_BRIGHTNESS := 1200
TW_MAX_BRIGHTNESS := 2047
# Excludes
TW_EXCLUDE_DEFAULT_USB_INIT := true
TW_EXCLUDE_APEX := true
TW_EXCLUDE_BASH := true
TW_EXCLUDE_NANO := true
TW_EXCLUDE_TWRPAPP := true
TW_EXCLUDE_SUPERSU := true
# Includes
TW_INCLUDE_RESETPROP := true
TW_INCLUDE_LPTOOLS := true
TW_INCLUDE_NTFS_3G := true
#Tweaks
TW_NO_SCREEN_BLANK := true
TW_SCREEN_BLANK_ON_BOOT := true
TW_FRAMERATE := 60
TW_HAS_MTP := true
TW_NO_FLASH_CURRENT_TWRP := true

# Status bar alignment
TW_STATUS_ICONS_ALIGN := center
TW_CUSTOM_CPU_POS := 580
TW_CUSTOM_CLOCK_POS := 60
# Version
TW_DEVICE_VERSION := ${shell git -C $(DEVICE_PATH) rev-parse --short HEAD}-TegarXLu
# Debug
TWRP_INCLUDE_LOGCAT := true
TARGET_USES_LOGD := true
#PBRP_FLAGS
TW_USE_TOOLBOX := true
TW_OVERRIDE_SYSTEM_PROPS := "ro.build.version.sdk"
PB_TORCH_PATH := "/sys/class/leds/lcd-backlight/brightness"
PB_TORCH_MAX_BRIGHTNESS := 1
