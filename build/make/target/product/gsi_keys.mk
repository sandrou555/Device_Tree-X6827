# gsi_keys.mk TWRP Manifest 14

# Inherit common GSI keys
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)

# Including GSI Keys for authentication
PRODUCT_PACKAGES += \
    qemu-gsi.avbpubkey

# Path to GSI key
GSI_KEY_PATH := external/avb/test/data

# Add a special AVB key
PRODUCT_AVB_PUBLIC_KEY := $(GSI_KEY_PATH)/testkey_rsa2048.pem
PRODUCT_AVB_ALGORITHM := SHA256_RSA2048

# Enable GSI-specific flags
PRODUCT_PROPERTY_OVERRIDES += \
    ro.gsi.image=true \
    ro.treble.enabled=true

# Copy GSI keys ke partisi system
PRODUCT_COPY_FILES += \
    $(GSI_KEY_PATH)/testkey_rsa2048.pem:$(TARGET_COPY_OUT_SYSTEM)/etc/security/avb/gsi_public_key.pem

# Workaround for dynamic partitions
PRODUCT_PROPERTY_OVERRIDES += \
    ro.boot.dynamic_partitions=true

#  Dummy Security Patch
PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.version.security_patch=$(PLATFORM_SECURITY_PATCH)
