#
# Copyright 2014 The Android Open Source Project
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

# Inherit the msm7x27a-common definitions
$(call inherit-product, device/huawei/msm7x27a-common/msm7x27a.mk)

DEVICE_PACKAGE_OVERLAYS += device/huawei/c8813q/overlay

# Files
PRODUCT_COPY_FILES += \
    device/huawei/c8813q/rootdir/fstab.huawei:root/fstab.huawei \
    device/huawei/c8813q/rootdir/init.device.rc:root/init.device.rc \
    device/huawei/c8813q/rootdir/1191601.img:root/tp/1191601.img

PRODUCT_COPY_FILES += \
    device/huawei/c8813q/configs/AudioFilter.csv:system/etc/AudioFilter.csv \
    device/huawei/c8813q/configs/thermald.conf:system/etc/thermald.conf

PRODUCT_COPY_FILES += \
    device/huawei/c8813q/keylayout/7k_handset.kl:system/usr/keylayout/7k_handset.kl \
    device/huawei/c8813q/keylayout/atmel_mxt_ts.kl:system/usr/keylayout/atmel_mxt_ts.kl \
    device/huawei/c8813q/keylayout/AVRCP.kl:system/usr/keylayout/AVRCP.kl \
    device/huawei/c8813q/keylayout/ft5x06_ts.kl:system/usr/keylayout/ft5x06_ts.kl \
    device/huawei/c8813q/keylayout/Generic.kl:system/usr/keylayout/Generic.kl

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml

# Properties
PRODUCT_PROPERTY_OVERRIDES += \
    ro.confg.hw_appfsversion=C8813QV5_1_SYSIMG \
    ro.confg.hw_appsbootversion=C8813QV5_1_APPSBOOT \
    ro.confg.hw_appversion=C8813QV5_1_KERNEL

PRODUCT_PROPERTY_OVERRIDES += \
    gsm.version.baseband=3110 \
    rild.libpath=/system/lib/libril-qc-qmi-1.so \
    ro.telephony.ril.config=qcomdsds,skippinpukcount,signalstrength \
    ro.telephony.ril_class=HuaweiRIL


$(call inherit-product, $(SRC_TARGET_DIR)/product/full.mk)

$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)

$(call inherit-product-if-exists, vendor/huawei/c8813q/c8813q-vendor.mk)

$(call inherit-product-if-exists, vendor/dianlujitao/blobs.mk)
