#
# Copyright 2013 The Android Open-Source Project
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

TARGET_ARCH := x86
TARGET_ARCH_VARIANT := atom
TARGET_CPU_ABI := x86
TARGET_CPU_ABI2 := armeabi-v7a
TARGET_CPU_ABI_LIST := x86,armeabi-v7a,armeabi
TARGET_CPU_ABI_LIST_32_BIT := x86,armeabi-v7a,armeabi
TARGET_BOARD_PLATFORM := clovertrail
TARGET_BOOTLOADER_BOARD_NAME := clovertrail

# Audio
BOARD_USES_ALSA_AUDIO := true
BOARD_USES_TINY_ALSA_AUDIO := true
TARGET_TINY_ALSA_IGNORE_SILENCE_SIZE := true

# Binder API version
TARGET_USES_64_BIT_BINDER := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/asus/Z00D/bluetooth

# Camera
INTEL_VIDEO_XPROC_SHARING := true
BOARD_GLOBAL_CFLAGS += -DCAMERA_VENDOR_L_COMPAT
TARGET_PROVIDES_CAMERA_HAL := true
TARGET_HAS_LEGACY_CAMERA_HAL1 := true
TARGET_NEEDS_PLATFORM_TEXT_RELOCATIONS := true

# Charger
WITH_CM_CHARGER := false
BOARD_CHARGER_ENABLE_SUSPEND := true
BOARD_HEALTHD_CUSTOM_CHARGER_RES := device/asus/Z00D/charger/images

# Dex-preoptimization: Speeds up initial boot (if we ever o a user build, which we don't)
ifeq ($(HOST_OS),linux)
  ifeq ($(TARGET_BUILD_VARIANT),user)
    ifeq ($(WITH_DEXPREOPT),)
      WITH_DEXPREOPT := true
    endif
  endif
endif

# DT2W
TARGET_TAP_TO_WAKE_NODE := "/sys/bus/i2c/devices/i2c-0/0-0038/dclick_mode"

# Hardware
BOARD_HARDWARE_CLASS := device/asus/Z00D/cmhw

# Healthd
BOARD_HAL_STATIC_LIBRARIES := libhealthd.clovertrail

# Inline kernel building
TARGET_KERNEL_CROSS_COMPILE_PREFIX := x86_64-linux-android-
TARGET_KERNEL_SOURCE := kernel/asus/Z00D
TARGET_KERNEL_ARCH := x86
BOARD_KERNEL_IMAGE_NAME := bzImage
TARGET_KERNEL_CONFIG := lineageos_Z00D_defconfig
BOARD_KERNEL_CMDLINE := init=/init pci=noearly console=ttyS0 console=logk0 earlyprintk=nologger bootup.uart=0 loglevel=8 kmemleak=off androidboot.bootmedia=sdcard androidboot.hardware=redhookbay watchdog.watchdog_thresh=60 androidboot.spid=xxxx:xxxx:xxxx:xxxx:xxxx:xxxx androidboot.serialno=01234567890123456789 ip=50.0.0.2:50.0.0.1::255.255.255.0::usb0:on 
vmalloc=172M

# IMG graphics
BOARD_GLOBAL_CFLAGS += -DASUS_ZENFONE2_LP_BLOBS
ENABLE_IMG_GRAPHICS := true
HWUI_IMG_FBO_CACHE_OPTIM := true

# IMG Graphics: System's VSYNC phase offsets in nanoseconds
VSYNC_EVENT_PHASE_OFFSET_NS := 7500000
SF_VSYNC_EVENT_PHASE_OFFSET_NS := 5000000

# enabled to carry out all drawing operations performed on a View's canvas with GPU for 2D rendering pipeline.
USE_OPENGL_RENDERER := true

# Init
TARGET_INIT_VENDOR_LIB := libinit_ctp
TARGET_LIBINIT_DEFINES_FILE := device/asus/Z00D/init/init_ctp.cpp
TARGET_INIT_UMOUNT_AND_FSCK_IS_UNSAFE := true

# Lights
TARGET_PROVIDES_LIBLIGHT := true

# Media
BOARD_USES_WRS_OMXIL_CORE := true
BOARD_USES_MRST_OMX := true
INTEL_VA := true
BUILD_WITH_FULL_STAGEFRIGHT := true

# OTA assert
TARGET_OTA_ASSERT_DEVICE := Z00D,ASUS_Z00D

# OTA Packaging / Bootimg creation
BOARD_CUSTOM_MKBOOTIMG := pack_intel
BOARD_CUSTOM_BOOTIMG_MK := device/asus/Z00D/mkbootimg.mk
DEVICE_BASE_BOOT_IMAGE := device/asus/Z00D/base_images/boot.img
DEVICE_BASE_RECOVERY_IMAGE := device/asus/Z00D/base_images/recovery.img
TARGET_RELEASETOOL_MAKE_RECOVERY_PATCH_SCRIPT := ./device/asus/Z00D/make_recovery_patch

# Partitions
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 1677721600
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_USERDATAIMAGE_PARTITION_SIZE := 59261286400
BOARD_CACHEIMAGE_PARTITION_SIZE := 268435456
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2415919104
BOARD_FLASH_BLOCK_SIZE := 2048
T
# PowerHAL
TARGET_POWERHAL_VARIANT := redhookbay

# Recovery
TARGET_NO_TWO_STEP_RECOVERY := true
TARGET_RECOVERY_PIXEL_FORMAT := "BGRA_8888"
BOARD_GLOBAL_CFLAGS += -DNO_SECURE_DISCARD
TARGET_RECOVERY_FSTAB := device/asus/Z00D/rootdir/etc/fstab.redhookbay
TARGET_RECOVERY_UPDATER_LIBS += libosip_updater
TARGET_RECOVERY_UPDATER_EXTRA_LIBS += libintel_updater liboempartitioning_static
TARGET_RECOVERY_DEVICE_MODULES := libinit_ctp librecovery_updater_ctp thermald upi_ug31xx

# SELinux
BOARD_SEPOLICY_DIRS += device/asus/Z00D/sepolicy

# Specific headers
TARGET_SPECIFIC_HEADER_PATH := device/asus/Z00D/include

# Wifi
BOARD_WLAN_DEVICE           := bcmdhd
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_HOSTAPD_PRIVATE_LIB   := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WPA_SUPPLICANT_VERSION      := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_HOSTAPD_DRIVER        := NL80211
WIFI_DRIVER_FW_PATH_PARAM   := "/sys/module/bcmdhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_AP      := "/asusfw/wifi/fw_bcmdhd_apsta.bin"
WIFI_DRIVER_FW_PATH_STA     := "/asusfw/wifi/fw_bcmdhd.bin"

# Use the non-open-source parts, if they're present
-include vendor/asus/Z00D/BoardConfigVendor.mk

