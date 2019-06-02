LOCAL_PATH := device/meizu/m3s

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/meizu/m3s/m3s-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/meizu/m3s/overlay

ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := device/meizu/m3s/prebuilt/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

TARGET_OTA_ASSERT_DEVICE := m3s,m3,meizu_m3_mini,meilan3

TARGET_PROVIDES_INIT_RC := true

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/rootdir/init.rc:root/init.rc \
	$(LOCAL_PATH)/rootdir/enableswap.sh:root/enableswap.sh \
	$(LOCAL_PATH)/rootdir/init.mt6755.rc:root/init.mt6755.rc \
	$(LOCAL_PATH)/rootdir/init.ssd.rc:root/init.ssd.rc \
	$(LOCAL_PATH)/rootdir/init.volte.rc:root/init.volte.rc \
	$(LOCAL_PATH)/rootdir/init.xlog.rc:root/init.xlog.rc \
	$(LOCAL_PATH)/rootdir/init.usb.rc:root/init.usb.rc \
	$(LOCAL_PATH)/rootdir/init.mt6755.usb.rc:root/init.mt6755.usb.rc \
	$(LOCAL_PATH)/rootdir/init.aee.rc:root/init.aee.rc \
	$(LOCAL_PATH)/rootdir/init.project.rc:root/init.project.rc \
	$(LOCAL_PATH)/rootdir/init.modem.rc:root/init.modem.rc \
	$(LOCAL_PATH)/rootdir/init.trace.rc:root/init.trace.rc \
	$(LOCAL_PATH)/rootdir/fstab.mt6755:root/fstab.mt6755 \
	$(LOCAL_PATH)/rootdir/ueventd.rc:root/ueventd.rc \
	$(LOCAL_PATH)/etc/media/media_codecs.xml:system/etc/media_codecs.xml \
	$(LOCAL_PATH)/etc/media/media_profiles.xml:system/etc/media_profiles.xml \
	frameworks/native/data/etc/android.software.app_widgets.xml:system/etc/permissions/android.software.app_widgets.xml \
	frameworks/native/data/etc/android.hardware.audio.output.xml:system/etc/permissions/android.hardware.audio.output.xml \
	frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
	frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
	frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
	frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
	frameworks/native/data/etc/android.hardware.faketouch.xml:system/etc/permissions/android.hardware.faketouch.xml \
	frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
	frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
	frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
	frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
	frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
	frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
	frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
	frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
	frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
	frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \

# Telephony
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/etc/telephony/ecc_list.xml:system/etc/ecc_list.xml \
	$(LOCAL_PATH)/etc/telephony/spn-conf.xml:system/etc/spn-conf.xml

# RIL
PRODUCT_PACKAGES += \
	gsm0710muxd

PRODUCT_PACKAGES += \
	Torch

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/etc/hostapd/hostapd_default.conf:system/etc/hostapd/hostapd_default.conf \
	$(LOCAL_PATH)/etc/hostapd/hostapd.accept:system/etc/hostapd/hostapd.accept \
	$(LOCAL_PATH)/etc/hostapd/hostapd.deny:system/etc/hostapd/hostapd.deny

# Audio componets from source
PRODUCT_PACKAGES += \
	audio.usb.default \
	audio.r_submix.default

# BT A2DP
PRODUCT_COPY_FILES += \
	vendor/meizu/m3s/proprietary/vendor/lib/hw/audio.a2dp.blueangel.so:system/vendor/lib/hw/audio.a2dp.mt6750.so

# Audio componets from source
PRODUCT_PACKAGES += \
	EngineerMode \
	MtkCamera libDocVfbEngineLib_m81 libpanorama

PRODUCT_EXTRA_RECOVERY_KEYS += $(LOCAL_PATH)/meizu

#$(call inherit-product, build/target/product/full.mk)
$(call inherit-product, build/target/product/aosp_arm64.mk)

#PRODUCT_NAME := cm_meilan2
#PRODUCT_DEVICE := meilan2
#PRODUCT_BRAND := CyaniogenMod
#PRODUCT_MODEL := CyaniogenMod on Meizu Meilan2

ADDITIONAL_DEFAULT_PROPERTIES += ro.secure=0 \
	ro.allow.mock.location=1 \
	ro.debuggable=1 \
	ro.adb.secure=0 \
	persist.service.acm.enable=0 \
	ro.mount.fs=EXT4 \
	debug.hwui.render_dirty_regions=false \
	ro.sf.lcd_density=320 \
	ro.hardware.bluetooth=blueangel \
	ro.mtk_gps_support=1 \
	ro.mtk_agps_app=1 \
	persist.debug.xlog.enable=1 \
	persist.mtk.wcn.combo.chipid=-1

# Radio
ADDITIONAL_DEFAULT_PROPERTIES += persist.multisim.config=dsds \
	persist.radio.multisim.config=dsds \
	persist.md.perm.checked=to_upgrade \
	persist.gemini.sim_num=2 \
	ro.mtk_c2k_support=1 \
	ro.mtk_lte_support=1 \
	ro.gemini.smart_sim_switch=true \
	ro.telephony.ril_class=MediaTekRIL \
	ro.telephony.ril.config=signalstrength \
	ro.telephony.sim.count=2 \
	ril.current.share_modem=2 \
	ril.specific.sm_cause=0 \
	ril.external.md=0 \
	ril.first.md=1 \
	ril.flightmode.poweroffMD=1 \
	ril.telephony.mode=0 \
	ril.radiooff.poweroffMD=0 \
	ril.active.md=0 \

# These additionals go to /system/build.prop
# ADDITIONAL_BUILD_PROPERTIES += \
# cm.updater.type=plain \
# cm.updater.uri=https://raw.githubusercontent.com/divis1969/update-site/master/updates-12.1.json \

