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

# call dalvik heap config
$(call inherit-product-if-exists, frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk)

DEVICE_PACKAGE_OVERLAYS := \
    device/asus/Z00D/overlay

# Art
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.dex2oat-swap=false

# Asus properties
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.build.asus.sku=WW

# Audio
PRODUCT_PACKAGES += \
    android.hardware.audio@2.0-impl \
    android.hardware.audio.effect@2.0-impl \
    libshim_audio \
    libtinycompress \
    libtinyalsa \
    audio.a2dp.default \
    audio.r_submix.default \
    audio.usb.default

PRODUCT_COPY_FILES += \
    device/asus/Z00D/audio/asound.conf:system/etc/asound.conf \
    device/asus/Z00D/audio/audio_policy.conf:system/etc/audio_policy.conf \
    device/asus/Z00D/audio/route_criteria.conf:system/etc/route_criteria.conf

# Bluetooth
PRODUCT_COPY_FILES += \
    device/asus/Z00D/bluetooth/bt_vendor.conf:system/etc/bluetooth/bt_vendor.conf

# Bluetooth HAL
PRODUCT_PACKAGES += \
    libbt-vendor \
    android.hardware.bluetooth@1.0-impl

PRODUCT_PROPERTY_OVERRIDES += \
    bt.hfp.WideBandSpeechEnabled=true

# Camera
PRODUCT_PACKAGES += \
    bspcapability \
#    camera.redhookbay \
    libshim_camera \
    Snap

# Charger
PRODUCT_PACKAGES += \
    charger \
    charger_res_images

# Dalvik
PRODUCT_PROPERTY_OVERRIDES += \
    ro.dalvik.vm.isa.arm=x86 \
    dalvik.vm.implicit_checks=none

# Display
PRODUCT_PACKAGES += \
    pvr_drv_video \
    libgbf

PRODUCT_PACKAGES += \
    android.hardware.graphics.allocator@2.0-impl \
    android.hardware.graphics.composer@2.1-impl \
    android.hardware.graphics.mapper@2.0-impl \
    android.hardware.memtrack@1.0-impl

# GPS
#PRODUCT_PACKAGES += \
#    libshim_gps

PRODUCT_COPY_FILES += \
    device/asus/Z00D/configs/gps.conf:system/etc/gps.conf \
    device/asus/Z00D/configs/gps.xml:system/etc/gps.xml \
    device/asus/Z00D/configs/gps_logcat.xml:system/etc/gps_logcat.xml \
    device/asus/Z00D/configs/gps_rs.xml:system/etc/gps_rs.xml \
    device/asus/Z00D/configs/gps_spirent.xml:system/etc/gps_spirent.xml \
    device/asus/Z00D/configs/gps_spirent_areaid.xml:system/etc/gps_spirent_areaid.xml \
    device/asus/Z00D/configs/gps_spirent_hslp.xml:system/etc/gps_spirent_hslp.xml

PRODUCT_PROPERTY_OVERRIDES += \
    ro.spid.gps.pmm=disabled \
    ro.spid.gps.tty=ttyMFD3 \
    ro.spid.gps.FrqPlan=FRQ_PLAN_26MHZ_2PPM \
    ro.spid.gps.RfType=GL_RF_4752_BRCM_EXT_LNA

# Houdini (arm native bridge)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.enable.native.bridge.exec=1

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.dalvik.vm.native.bridge=libhoudini.so

# Key layout files
PRODUCT_COPY_FILES += \
    device/asus/Z00D/keylayout/cloverview_audio_Intel_MID_Audio_Jack.kl:system/usr/keylayout/cloverview_audio_Intel_MID_Audio_Jack.kl \
    device/asus/Z00D/keylayout/ASUS_TransKeyboard.kl:system/usr/keylayout/ASUS_TransKeyboard.kl \
    device/asus/Z00D/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
    device/asus/Z00D/keylayout/focal-touchscreen.kl:system/usr/keylayout/focal-touchscreen.kl 

# Keymaster
PRODUCT_PACKAGES += \
    android.hardware.keymaster@3.0-impl

# Keystore
PRODUCT_PACKAGES += \
    keystore.clovertrail

# Lights
PRODUCT_PACKAGES += \
    android.hardware.light@2.0-impl \
    lights.clovertrail

# Media
PRODUCT_PROPERTY_OVERRIDES += \
    drm.service.enabled=true \
    ro.com.widevine.cachesize=16777216

PRODUCT_COPY_FILES += \
    device/asus/Z00D/media/media_codecs.xml:system/etc/media_codecs.xml \
    device/asus/Z00D/media/media_profiles.xml:system/etc/media_profiles.xml \
    device/asus/Z00D/media/wrs_omxil_components.list:system/etc/wrs_omxil_components.list \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml

# Media: SDK and OMX IL components
PRODUCT_PACKAGES += \
    msvdx_bin \
    topaz_bin

# Media: libva
PRODUCT_PACKAGES += \
    libva \
    libva-android \
    libva-tpi \
    vainfo

# Media: libstagefrighthw
PRODUCT_PACKAGES += \
    libstagefrighthw

# libmix
PRODUCT_PACKAGES += \
    libmixvbp_mpeg4 \
    libmixvbp_h264 \
    libmixvbp_h264secure \
    libmixvbp_vc1 \
    libva_videodecoder \
    libva_videoencoder

PRODUCT_PACKAGES += \
    libwrs_omxil_common \
    libwrs_omxil_core_pvwrapped \
    libOMXVideoDecoderH263 \
    libOMXVideoDecoderMPEG4 \
    libOMXVideoEncoderAVC \
    libOMXVideoDecoderWMV \
    libOMXVideoEncoderH263 \
    libOMXVideoEncoderMPEG4

# PowerHAL
PRODUCT_PACKAGES += \
    android.hardware.power@1.0-impl \
    power.redhookbay

# Radio
PRODUCT_PACKAGES += \
    libshim_mmgr \
    libshim_tcs

PRODUCT_PROPERTY_OVERRIDES += \
    ro.ril.status.polling.enable=0 \
    rild.libpath=/system/lib/librapid-ril-core.so \
    ro.telephony.default_network=9 \
    ro.ril.telephony.mqanelements=5

# Ramdisk
PRODUCT_PACKAGES += \
    fstab.redhookbay \
    init.avc.rc \
    init.asus.rc \
    init.bt.rc \
    init.bt.vendor.rc \
    init.class_main.sh \
    init.common.rc \
    init.debug.rc \
    init.diag.rc \
    init.gps.rc \
    init.logtool.rc \
    init.modem.rc \
    init.redhookbay.rc \
    init.platform.usb.rc \
    init.power.redhookbay.rc \
    init.product.rc \
    init.recovery.redhookbay.rc \
    init.watchdog.rc \
    init.wifi.rc \
    init.wifi.vendor.rc \
    init.zram.rc \
    thermald \
    ueventd.redhookbay.rc \
    init.compass.rc \
    init.wireless.rc

# Stlport
PRODUCT_PACKAGES += \
    libstlport

# Sensors
PRODUCT_PACKAGES += \
    libshim_sensors

PRODUCT_COPY_FILES += \
    device/asus/Z00D/configs/sensor_hal_config_default.xml:system/etc/sensor_hal_config_default.xml \
    device/asus/Z00D/configs/sensor_hal_config_general_default.xml:system/etc/sensor_hal_config_general_default.xml \
    device/asus/Z00D/configs/sensor_hal_config_general_scale-pr1.xml:system/etc/sensor_hal_config_general_scale-pr1.xml \
    device/asus/Z00D/configs/sensor_hal_config_scale-pr1.xml:system/etc/sensor_hal_config_scale-pr1.xml 

# Vibrator
PRODUCT_PACKAGES += \
    android.hardware.vibrator@1.0-impl

# pvr
PRODUCT_PACKAGES += \
    libpvr2d

# libdrm
PRODUCT_PACKAGES += \
    libdrm \
    dristat \
    drmstat

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.ethernet.xml:system/etc/permissions/android.hardware.ethernet.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:system/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:system/etc/permissions/android.hardware.sensor.stepdetector.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml

# Wifi
PRODUCT_PACKAGES += \
    libwpa_client \
    lib_driver_cmd_bcmdhd \
    hostapd \
    dhcpcd.conf \
    wificond \
    wpa_supplicant \
    wpa_supplicant.conf

PRODUCT_COPY_FILES += \
    device/asus/Z00D/configs/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf

$(call inherit-product-if-exists, vendor/asus/Z00D/Z00D-vendor.mk)

# Intel_updater
PRODUCT_PACKAGES += \
    liboempartitioning_static \
    libcgpt_static \
    libintel_updater

PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xhdpi

PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=320

# Alsa
PRODUCT_PACKAGES += \
    tinyplay \
    tinycap \
    tinymix

PRODUCT_COPY_FILES += \
    device/asus/Z00D/audio/silence.wav:system/etc/silence.wav

# Add WiFi Firmware
$(call inherit-product-if-exists, hardware/broadcom/wlan/bcmdhd/firmware/bcm4339/device-bcm.mk)

# Vendor Interface Manifest
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/manifest.xml:system/vendor/manifest.xml

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.opengles.version = 131072

# hardware optimizations
#PRODUCT_PROPERTY_OVERRIDES += \
#    dalvik.vm.isa.x86.features=sse4_2,aes_in,popcnt,movbe
