#
# Copyright (C) 2011 The Android Open-Source Project
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

# This file includes all definitions that apply to ALL blade devices, and
# are also specific to blade devices
#
# Everything in this directory will become public

ifeq ($(TARGET_PREBUILT_KERNEL),)
LOCAL_KERNEL := device/zte/blade/prebuilt/kernel
else
LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

DEVICE_PACKAGE_OVERLAYS := device/zte/blade/overlay

# ZTE devices use high-density artwork where available
PRODUCT_AAPT_PREF_CONFIG := hdpi
PRODUCT_AAPT_CONFIG := normal hdpi
PRODUCT_LOCALES += hdpi

PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.baseband_version=P729BB01


# Graphics
PRODUCT_PACKAGES := \
        gralloc.msm7x27 \
        copybit.msm7x27 \
        hwcomposer.msm7x27 \
        libgenlock \
        liboverlay \
        libtilerenderer \
#        libqdutil

# QCOM OPENSOURCE OMX
PRODUCT_PACKAGES += \
        libmm-omxcore \
        libOmxCore \
        libstagefrighthw \
        libI420colorconvert \

# Blade HAL
PRODUCT_PACKAGES += \
        lights.blade \
        sensors.blade \
        gps.blade \
        librpc \
        BladeParts

# Audio
PRODUCT_PACKAGES += \
        audio.primary.blade \
        audio_policy.blade \
        audio.usb.default \
        audio.a2dp.default \
        libaudioutils

# Camera
PRODUCT_PACKAGES += \
        camera.msm7x27 \
        libcamera \
        Camera

# Live Wallpapers
PRODUCT_PACKAGES += \
        Superuser \
        LiveWallpapersPicker \
        librs_jni

# Other
PRODUCT_PACKAGES += \
        dexpreopt \
        make_ext4fs \
        setup_fs

# Custom Package
PRODUCT_PACKAGES += \
        AppWidgetPicker \
		ApexLauncher \
        CMFileManager \
		RootExplorer

# Custom Package for AOKP REMIX
PRODUCT_PACKAGES += \
      ROMControl \
      SwagPapers \
      Stk

# Support Libs
PRODUCT_PACKAGES += \
    libril \
    abtfilt \
    prox_cal

DISABLE_DEXPREOPT := false

PRODUCT_TAGS += dalvik.gc.type-precise

# Enable repeatable keys in CWM
PRODUCT_PROPERTY_OVERRIDES += \
        ro.cwm.enable_key_repeat=true

PRODUCT_COPY_FILES := \
        device/zte/blade/prebuilt/root/init.blade.rc:root/init.blade.rc \
        device/zte/blade/prebuilt/root/init.blade.usb.rc:root/init.blade.usb.rc \
        device/zte/blade/prebuilt/root/ueventd.blade.rc:root/ueventd.blade.rc \
        device/zte/blade/prebuilt/root/fstab.blade:root/fstab.blade \
        device/zte/blade/prebuilt/system/etc/vold.fstab:system/etc/vold.fstab \
        device/zte/blade/prebuilt/system/usr/keylayout/blade_keypad.kl:/system/usr/keylayout/blade_keypad.kl \
        device/zte/blade/prebuilt/system/etc/AudioFilter.csv:system/etc/AudioFilter.csv \
        device/zte/blade/prebuilt/system/etc/AutoVolumeControl.txt:system/etc/AutoVolumeControl.txt \
        device/zte/blade/prebuilt/system/etc/audio_policy.conf:system/etc/audio_policy.conf \
        device/zte/blade/prebuilt/system/etc/media_profiles.xml:system/etc/media_profiles.xml \
        device/zte/blade/prebuilt/system/etc/gps.conf:system/etc/gps.conf \
#        device/zte/blade/prebuilt/system/etc/start_usb0.sh:system/etc/start_usb0.sh \

# Touchscreen IDC
PRODUCT_COPY_FILES += \
        device/zte/blade/prebuilt/system/usr/idc/qwerty.idc:system/usr/idc/qwerty.idc \
        device/zte/blade/prebuilt/system/usr/idc/qwerty2.idc:system/usr/idc/qwerty2.idc \
        device/zte/blade/prebuilt/system/usr/idc/cypress-rmi-touchscreen.idc:system/usr/idc/cypress_touch.idc \
        device/zte/blade/prebuilt/system/usr/idc/cypress-rmi-touchscreen.idc:system/usr/idc/cypress-rmi-touchscreen.idc \
        device/zte/blade/prebuilt/system/usr/idc/ft5x-ts.idc:system/usr/idc/ft5x0x-ts.idc \
        device/zte/blade/prebuilt/system/usr/idc/fts-touchscreen.idc:system/usr/idc/Fts-touchscreen.idc \
        device/zte/blade/prebuilt/system/usr/idc/synaptics-rmi-touchscreen.idc:system/usr/idc/synaptics-rmi-touchscreen.idc \
        device/zte/blade/prebuilt/system/usr/idc/synaptics-rmi4-ts.idc:system/usr/idc/synaptics-rmi4-ts.idc

# Bluetooth configuration files
PRODUCT_COPY_FILES += \
        device/zte/blade/prebuilt/system/etc/init.bt.sh:system/etc/init.bt.sh \
        system/bluetooth/data/main.le.conf:system/etc/bluetooth/main.conf

# WiFi
PRODUCT_COPY_FILES += \
        device/zte/blade/prebuilt/system/etc/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
        device/zte/blade/prebuilt/system/etc/dhcpcd/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf \
        device/zte/blade/prebuilt/system/bin/hostapd:system/bin/hostapd \
        device/zte/blade/prebuilt/system/etc/wifi/hostapd.conf:system/etc/wifi/hostapd.conf \
        device/zte/blade/prebuilt/system/wifi/ar6000.ko:system/wifi/ar6000.ko \
        device/zte/blade/prebuilt/system/wifi/regcode:system/wifi/regcode \
        device/zte/blade/prebuilt/system/wifi/data.patch.hw2_0.bin:system/wifi/data.patch.hw2_0.bin \
        device/zte/blade/prebuilt/system/wifi/athwlan.bin.z77:system/wifi/athwlan.bin.z77 \
        device/zte/blade/prebuilt/system/wifi/athtcmd_ram.bin:system/wifi/athtcmd_ram.bin \
        device/zte/blade/prebuilt/system/wifi/device.bin:system/wifi/device.bin \
        device/zte/blade/prebuilt/system/wifi/eeprom.bin:system/wifi/eeprom.bin \
        device/zte/blade/prebuilt/system/wifi/eeprom.data:system/wifi/eeprom.data

# Kernel Modules
PRODUCT_COPY_FILES += \
        device/zte/blade/prebuilt/system/lib/modules/cifs.ko:system/lib/modules/2.6.35.7-perf+/cifs.ko \
#        device/zte/blade/prebuilt/system/lib/modules/zram.ko:system/lib/modules/2.6.35.7-perf+/zram.ko \
#        device/zte/blade/prebuilt/system/lib/modules/lzo_compress.ko:system/lib/modules/2.6.35.7-perf+/lzo_compress.ko \
#        device/zte/blade/prebuilt/system/lib/modules/lzo_decompress.ko:system/lib/modules/2.6.35.7-perf+/lzo_decompress.ko \

# INIT.D
PRODUCT_COPY_FILES += \
        device/zte/blade/prebuilt/system/etc/init.d/02zram:system/etc/init.d/02zram \
        device/zte/blade/prebuilt/system/etc/init.d/03firstboot:system/etc/init.d/03firstboot \
        device/zte/blade/prebuilt/system/etc/init.d/05mntsdcard:system/etc/init.d/05mntsd \
        device/zte/blade/prebuilt/system/etc/init.d/06mountdl:system/etc/init.d/06mountdl \
        device/zte/blade/prebuilt/system/etc/init.d/80swapon:system/etc/init.d/80swapon \
        device/zte/blade/prebuilt/system/etc/init.d/88tweaks:system/etc/init.d/88tweaks \

# Prebuilts APPS
PRODUCT_COPY_FILES += \
        device/zte/blade/prebuilt/bootanimation.zip:system/media/bootanimation.zip \
        device/zte/blade/prebuilt/system/app/S2E_zh.apk:system/app/S2E_zh.apk \


PRODUCT_COPY_FILES += \
        device/zte/blade/prebuilt/system/etc/media_codecs.xml:system/etc/media_codecs.xml \

# Hardware-specific features
PRODUCT_COPY_FILES += \
        frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
        frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
        frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
        frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
        frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
        frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
        frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
        frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
        frameworks/native/data/etc/android.hardware.touchscreen.xml:system/etc/permissions/android.hardware.touchscreen.xml \
        frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
        frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
        frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
        packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:/system/etc/permissions/android.software.live_wallpaper.xml

$(call inherit-product, device/zte/blade/device.mk)
$(call inherit-product, frameworks/native/build/phone-hdpi-512-dalvik-heap.mk)
$(call inherit-product-if-exists, vendor/zte/blade/blade-vendor.mk)
