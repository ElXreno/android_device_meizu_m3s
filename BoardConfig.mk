USE_CAMERA_STUB := true

# inherit from the proprietary version
-include vendor/meizu/meilan3/BoardConfigVendor.mk
#64 bit
TARGET_ARCH := arm64
TARGET_NO_BOOTLOADER := true
TARGET_BOARD_PLATFORM := mt6750
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 := 
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_VARIANT := generic
TARGET_CPU_CORTEX_A53 := true

#32 bit
TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53

TARGET_CPU_SMP := true
ARCH_ARM_HAVE_TLS_REGISTER := true
ARCH_ARM_HAVE_NEON := true
ARCH_ARM_HAVE_VFP := true

TARGET_GLOBAL_CFLAGS   += -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon -mfloat-abi=softfp
TARGET_USERIMAGES_USE_EXT4:=true

TARGET_BOOTLOADER_BOARD_NAME := mt6750

BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,64N2 androidboot.selinux=permissive
BOARD_KERNEL_BASE := 0x40078000
#extracted from stock recovery
BOARD_KERNEL_PAGESIZE := 2048
BOARD_RAMDISK_OFFSET := 0x04f88000

#extracted from /proc/partinfo
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216 # 0x1000000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 22020096 # 0x3000000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2684354560 # 0x60000000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 11683216896 # 0x2fcd80000
BOARD_CACHEIMAGE_PARTITION_SIZE := 452984832 # 0x19000000
#pagesize * 64
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_MKBOOTIMG_ARGS := --kernel_offset 0x00008000 --ramdisk_offset 0x04f88000 --tags_offset 0x03f88000 --board 1552631950 

#in case you want to build kernel from prebuilt image
# comment out the following 4 lines
#TARGET_KERNEL_SOURCE := kernel/meizu/meilan2
#TARGET_KERNEL_CONFIG := ginr6735_65c_l1_defconfig
#TARGET_KERNEL_CROSS_COMPILE_PREFIX := aarch64-linux-android-
#BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb
# end of commented lines

#prebuilt kernel image
TARGET_PREBUILT_KERNEL := device/meizu/meilan3/prebuilt/Image.gz-dtb
BOARD_HAS_NO_SELECT_BUTTON := true
#recovery
#TARGET_RECOVERY_INITRC := device/meizu/meilan2/recovery/init.mt6753.rc
TARGET_RECOVERY_FSTAB := device/meizu/meilan3/recovery/root/fstab.mt6735
TARGET_RECOVERY_LCD_BACKLIGHT_PATH := \"/sys/devices/platform/leds-mt65xx/leds/lcd-backlight/brightness\"

#system.prop
TARGET_SYSTEM_PROP := device/meizu/meilan3/system.prop

# WiFi
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_mt66xx
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_mt66xx
WIFI_DRIVER_FW_PATH_PARAM:="/dev/wmtWifi"
WIFI_DRIVER_FW_PATH_STA:=STA
WIFI_DRIVER_FW_PATH_AP:=AP
WIFI_DRIVER_FW_PATH_P2P:=P2P

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_MTK := true
BOARD_BLUETOOTH_DOES_NOT_USE_RFKILL := true

#twrp ( WIP do not use!!! see comments )

#tw_theme is essential flag
TW_THEME := portrait_hdpi

#brightness settings (needs verification)
TW_BRIGHTNESS_PATH := /sys/devices/platform/leds-mt65xx/leds/lcd-backlight/brightness/
TW_MAX_BRIGHTNESS := 255

#may be usefull if we get graphical glitches
#RECOVERY_GRAPHICS_USE_LINELENGTH := true

#in case of wrong color this needs modification
#TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"

#if sdcard0 is a /data/media emulated one
#RECOVERY_SDCARD_ON_DATA := true

#ntfs support? (needs much space..)
#TW_INCLUDE_NTFS_3G := true

#we may need that if sdcard0 dont work
#TW_FLASH_FROM_STORAGE := true
#TW_EXTERNAL_STORAGE_PATH := "/external_sd"
#TW_EXTERNAL_STORAGE_MOUNT_POINT := "external_sd"
#TW_DEFAULT_EXTERNAL_STORAGE := true

#only add if kernel supports
#TW_INCLUDE_FUSE_EXFAT := true

#F2FS support (only activate if kernel supports)
#TARGET_USERIMAGES_USE_F2FS:=true


#Mediatek flags
BOARD_HAS_MTK_HARDWARE := true
MTK_HARDWARE := true
COMMON_GLOBAL_CFLAGS += -DMTK_HARDWARE -DMTK_AOSP_ENHANCEMENT
COMMON_GLOBAL_CPPFLAGS += -DMTK_HARDWARE -DMTK_AOSP_ENHANCEMENT

#EGL settings
USE_OPENGL_RENDERER := true
BOARD_EGL_CFG := device/meizu/meilan3/egl.cfg

# CyanogenMod Hardware Hooks
BOARD_HARDWARE_CLASS := device/meizu/meilan3/cmhw/
