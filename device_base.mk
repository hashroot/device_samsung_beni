# Copyright (C) 2009 The Android Open Source Project
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
# This file is the build configuration for a full Android
# build for sapphire hardware. This cleanly combines a set of
# device-specific aspects (drivers) with a device-agnostic
# product configuration (apps).
#

# Inherit from those products. Most specific first.

$(call inherit-product, device/common/gps/gps_eu_supl.mk)

ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := device/samsung/beni/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

## Inherit vendor proprietary files
$(call inherit-product, vendor/samsung/beni/vendor_blobs.mk)

## Device specific overlay
DEVICE_PACKAGE_OVERLAYS := device/samsung/beni/overlay

## Media
PRODUCT_PACKAGES += \
    libOmxCore \
    libmm-omxcore \
    libstagefrighthw

## Camera
PRODUCT_PACKAGES += \
    camera.beni

## Display
PRODUCT_PACKAGES += \
    gralloc.msm7x27 \
    hwcomposer.msm7x27 \
    copybit.msm7x27 \
    libgenlock \
    liboverlay \
    libtilerenderer

## Audio
PRODUCT_PACKAGES += \
    audio.a2dp.default \
    libaudioutils \
    audio.primary.beni \
    audio_policy.beni

## GPS
PRODUCT_PACKAGES += \
    librpc

## Other
PRODUCT_PACKAGES += \
    Stk \
    make_ext4fs \
    brcm_patchram_plus \
    bdaddr_read \
    GalaxyICS-FileManager \
    MusicFX \
    setup_fs

## Included Packages
PRODUCT_PACKAGES += \
    audio.primary.beni \
    audio_policy.beni \
    hwcomposer.default \
    DSPManager 

#Mike Gapinski Change
PRODUCT_PACKAGES += \
	libOmxVidEnc \
	libQcomUI

## Vold config
PRODUCT_COPY_FILES += \
    device/samsung/beni/prebuilt/etc/vold.fstab:system/etc/vold.fstab

## BT config
PRODUCT_COPY_FILES += \
    system/bluetooth/data/main.conf:system/etc/bluetooth/main.conf

## CM9 MDPI bootanimation
PRODUCT_COPY_FILES += \
    device/samsung/beni/prebuilt/bootanimation.zip:system/media/bootanimation.zip

## Binaries
PRODUCT_COPY_FILES += \
    device/samsung/beni/prebuilt/bin/brcm_patchram_plus:system/bin/brcm_patchram_plus \
    device/samsung/beni/prebuilt/bin/chmod:system/bin/chmod \
    device/samsung/beni/prebuilt/bin/mount:system/bin/mount \
    device/samsung/beni/prebuilt/bin/run_drm:system/bin/run_drm \
    device/samsung/beni/prebuilt/bin/run_usb:system/bin/run_usb \
    device/samsung/beni/prebuilt/bin/su:system/bin/su \
    device/samsung/beni/prebuilt/bin/copybit.msm7x27.so:system/lib \
    device/samsung/beni/prebuilt/etc/init.local.rc:system/etc/init.local.rc \
    device/samsung/beni/prebuilt/etc/usb.fix:system/etc/usb.fix

## Hardware properties 
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.location.xml:system/etc/permissions/android.hardware.location.xml \
    frameworks/base/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/base/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/base/data/etc/platform.xml:system/etc/permissions/platform.xml \
    frameworks/base/data/etc/android.software.sip.xml:system/etc/permissions/android.software.sip.xml \
    frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml

## Board-specific init
PRODUCT_COPY_FILES += \
    device/samsung/beni/ramdisk/ueventd.gt-s5670.rc:root/ueventd.gt-s5670.rc \
    device/samsung/beni/ramdisk/default.prop:root/default.prop \
    device/samsung/beni/ramdisk/fsr.ko:root/lib/modules/fsr.ko \
    device/samsung/beni/ramdisk/fsr_stl.ko:root/lib/modules/fsr_stl.ko \
    device/samsung/beni/ramdisk/rfs_fat.ko:root/lib/modules/rfs_fat.ko \
    device/samsung/beni/ramdisk/rfs_glue.ko:root/lib/modules/rfs_glue.ko \
    device/samsung/beni/ramdisk/sec_param.ko:root/lib/modules/sec_param.ko \
    device/samsung/beni/ramdisk/cifs.ko:system/lib/modules/cifs.ko \
    device/samsung/beni/ramdisk/tun.ko:system/lib/modules/tun.ko \
    device/samsung/beni/ramdisk/init.gt-s5670.rc:root/init.gt-s5670.rc \
    device/samsung/beni/ramdisk/zram.ko:system/lib/modules/zram.ko 

## Wi-Fi & networking
PRODUCT_COPY_FILES += \
    device/samsung/beni/prebuilt/etc/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    device/samsung/beni/prebuilt/etc/wifi/hostapd.conf:system/etc/wifi/hostapd.conf \
    device/samsung/beni/prebuilt/bin/get_macaddrs:system/bin/get_macaddrs

## Media
PRODUCT_COPY_FILES += \
    device/samsung/beni/prebuilt/media/AutoVolumeControl.txt:system/etc/AutoVolumeControl.txt \
    device/samsung/beni/prebuilt/media/AudioFilter.csv:system/etc/AudioFilter.csv \
    device/samsung/beni/prebuilt/media/audio_effects.conf:system/etc/audio_effects.conf \
    device/samsung/beni/prebuilt/media/hosts:system/etc/hosts \
    device/samsung/beni/prebuilt/media/sysctl.conf:system/etc/sysctl.conf \
    device/samsung/beni/prebuilt/media/media_profiles.xml:system/etc/media_profiles.xml 

## keymap
PRODUCT_COPY_FILES += \
    device/samsung/beni/prebuilt/keymap/qwerty.kl:system/usr/keylayout/qwerty.kl \
    device/samsung/beni/prebuilt/keymap/sec_jack.kl:system/usr/keylayout/sec_jack.kl \
    device/samsung/beni/prebuilt/keymap/Generic.kl:system/usr/keylayout/Generic.kl \
    device/samsung/beni/prebuilt/keymap/AVRCP.kl:system/usr/keylayout/AVRCP.kl \
    device/samsung/beni/prebuilt/keymap/sec_key.kl:system/usr/keylayout/sec_key.kl 

## keychar
PRODUCT_COPY_FILES += \
    device/samsung/beni/prebuilt/keychar/qwerty.kcm:system/usr/keylayout/qwerty.kcm \
    device/samsung/beni/prebuilt/keychar/qwerty2.kcm:system/usr/keylayout/qwerty2.kcm \
    device/samsung/beni/prebuilt/keychar/Virtual.kcm:system/usr/keylayout/Virtual.kcm \
    device/samsung/beni/prebuilt/keychar/Generic.kcm:system/usr/keylayout/Generic.kcm

## Touchscreen
PRODUCT_COPY_FILES += \
    device/samsung/beni/prebuilt/sec_touchscreen.idc:system/usr/idc/sec_touchscreen.idc

## GPS configuration
PRODUCT_COPY_FILES += \
    device/samsung/beni/prebuilt/etc/gps.conf:system/etc/gps.conf


PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    ro.com.android.dateformat=dd-MM-yyyy \

# LDPI assets
PRODUCT_LOCALES += en
PRODUCT_AAPT_CONFIG := ldpi mdpi normal
PRODUCT_AAPT_PREF_CONFIG := ldpi
$(call inherit-product, build/target/product/full_base_telephony.mk)

PRODUCT_PROPERTY_OVERRIDES += \
    hwui.render_dirty_rebenins=false

PRODUCT_PROPERTY_OVERRIDES += \
    pm.sleep_mode=1
