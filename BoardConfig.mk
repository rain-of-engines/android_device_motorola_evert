#
# Copyright (C) 2017 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

DEVICE_PATH := device/motorola/evert

# Inherit from motorola sdm660-common
-include device/motorola/sdm660-common/BoardConfigCommon.mk

# A/B updater
AB_OTA_UPDATER := true

AB_OTA_PARTITIONS += \
    boot \
    system \
    vendor

# Assertions
TARGET_BOARD_INFO_FILE := device/motorola/evert/configs/board-info.txt
TARGET_OTA_ASSERT_DEVICE := evert

# Display
TARGET_SCREEN_DENSITY := 420

# HIDL
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/configs/vintf/evert_manifest.xml

# Kernel
TARGET_KERNEL_CONFIG := evert_defconfig
BOARD_KERNEL_CMDLINE += androidboot.boot_devices=soc/c0c4000.sdhci

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864 # 64 MB

# Partitions dynamic
BOARD_SUPER_PARTITION_GROUPS := moto_dynamic_partitions
BOARD_SUPER_PARTITION_BLOCK_DEVICES := system vendor
BOARD_SUPER_PARTITION_SYSTEM_DEVICE_SIZE := 2885681152 # 2752 MB
BOARD_SUPER_PARTITION_VENDOR_DEVICE_SIZE := 956301312 # 912 MB
BOARD_MOTO_DYNAMIC_PARTITIONS_PARTITION_LIST := system vendor
BOARD_SUPER_PARTITION_SIZE := 3841982464 # 3664 MB
BOARD_SUPER_PARTITION_METADATA_DEVICE := system
BOARD_MOTO_DYNAMIC_PARTITIONS_SIZE := 3837758164 # 3660 MB

# Power
TARGET_HAS_NO_WLAN_STATS := true

# Properties
TARGET_SYSTEM_EXT_PROP += $(DEVICE_PATH)/properties/system_ext.prop
TARGET_VENDOR_PROP += $(DEVICE_PATH)/properties/vendor.prop

# RIL
ENABLE_VENDOR_RIL_SERVICE := true

# SELinux
BOARD_VENDOR_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/vendor

# inherit from the proprietary version
include vendor/motorola/evert/BoardConfigVendor.mk
