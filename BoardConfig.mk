#
# Copyright 2017 The Android Open Source Project
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

# This contains the module build definitions for the hardware-specific
# components for this device.
#
# As much as possible, those components should be built unconditionally,
# with device-specific names to avoid collisions, to avoid device-specific
# bitrot and build breakages. Building a component unconditionally does
# *not* include it on all devices, so it is safe even with hardware-specific
# components.

DEVICE_PATH := device/xiaomi/sagit

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a9

ENABLE_CPUSETS := true
ENABLE_SCHEDBOOST := true

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := msm8998
TARGET_NO_BOOTLOADER := true

# Kernel
BOARD_KERNEL_CMDLINE := console=ttyMSM0,115200,n8 androidboot.console=ttyMSM0 earlycon=msm_serial_dm,0xc1b0000
BOARD_KERNEL_CMDLINE += androidboot.hardware=qcom user_debug=31 msm_rtb.filter=0x237 ehci-hcd.park=3
BOARD_KERNEL_CMDLINE += lpm_levels.sleep_disabled=1 sched_enable_hmp=1 sched_enable_power_aware=1
BOARD_KERNEL_CMDLINE += service_locator.enable=1 swiotlb=2048 androidboot.usbcontroller=a800000.dwc3
BOARD_KERNEL_CMDLINE += androidboot.configfs=true
BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE := 4096
BOARD_KERNEL_TAGS_OFFSET := 0x01E00000
BOARD_RAMDISK_OFFSET := 0x02000000
TARGET_PREBUILT_KERNEL := device/xiaomi/sagit/prebuilt/Image.gz-dtb

# Platform
TARGET_BOARD_PLATFORM := msm8998
TARGET_BOARD_PLATFORM_GPU := qcom-adreno540

# Partitions
BOARD_FLASH_BLOCK_SIZE := 262144 # (BOARD_KERNEL_PAGESIZE * 64)

BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_CACHEIMAGE_PARTITION_SIZE := 268435456
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 67108864
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 5368709120
BOARD_USERDATAIMAGE_PARTITION_SIZE := 120426835968
BOARD_VENDORIMAGE_PARTITION_SIZE := 872415232
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4

TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# Workaround for error copying vendor files to recovery ramdisk
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_VENDOR := vendor

# Recovery
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_HAS_NO_SELECT_BUTTON := true
TARGET_COPY_OUT_VENDOR := vendor
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"

# --------------------------------------
# TWRP recovery specific setting - start
# --------------------------------------

TW_THEME := portrait_hdpi
TARGET_RECOVERY_QCOM_RTC_FIX := true

# Bootloader
TARGET_USES_UEFI := true

# Encryption
TW_INCLUDE_CRYPTO := true

# Recovery
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_HAS_NO_SELECT_BUTTON := true
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"

# Workaround for error copying vendor files to recovery ramdisk
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_VENDOR := vendor

# additional filesystem support
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
TW_INCLUDE_NTFS_3G := true
TW_NO_EXFAT := false
TW_NO_EXFAT_FUSE := false
BOARD_SUPPRESS_SECURE_ERASE := true
TW_IGNORE_MISC_WIPE_DATA := true

# Other TWRP Configuration
BOARD_HAS_NO_REAL_SDCARD := true
RECOVERY_SDCARD_ON_DATA := true
TW_EXCLUDE_DEFAULT_USB_INIT := true
TW_SCREEN_BLANK_ON_BOOT := true
TW_EXTRA_LANGUAGES := true
TW_DEFAULT_LANGUAGE := en
TW_EXCLUDE_SUPERSU := true

# Disable Mouse Cursor
TW_INPUT_BLACKLIST := "hbtp_vm"

# Display Brightness
TW_DEFAULT_BRIGHTNESS := 2047
TW_MAX_BRIGHTNESS := 4095
TW_BRIGHTNESS_PATH := "/sys/class/leds/lcd-backlight/brightness"

# Disable Flashlight
OF_FLASHLIGHT_ENABLE := 0

# --------------------------------------
# TWRP recovery specific setting - end
# --------------------------------------

