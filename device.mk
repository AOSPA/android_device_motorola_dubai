# Directories of dependent local repositories
DEVICE_PATH := device/motorola/dubai
HARDWARE_PATH := hardware/motorola
QCOM_COMMON_PATH := device/qcom/common

# Enable virtual A/B compression
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota/compression.mk)

# A/B related packages
PRODUCT_PACKAGES += \
    update_engine \
    update_engine_client \
    update_engine_sideload \
    update_verifier \
    android.hardware.boot@1.2-impl-qti \
    android.hardware.boot@1.2-impl-qti.recovery \
    android.hardware.boot@1.2-service \
    checkpoint_gc \
    otapreopt_script

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_vendor=true \
    POSTINSTALL_PATH_vendor=bin/checkpoint_gc \
    FILESYSTEM_TYPE_vendor=ext4 \
    POSTINSTALL_OPTIONAL_vendor=true

# AAPT
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := 400dpi
PRODUCT_AAPT_PREBUILT_DPI := xxxhdpi xxhdpi xhdpi hdpi

# API
BOARD_SHIPPING_API_LEVEL := 30
BOARD_API_LEVEL := 30
PRODUCT_SHIPPING_API_LEVEL := 30

# Additional native libraries
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/libraries/public.libraries.txt:$(TARGET_COPY_OUT_VENDOR)/etc/public.libraries.txt \
    $(DEVICE_PATH)/configs/libraries/public.libraries-qti.txt:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/public.libraries-qti.txt

# Android Verified Boot
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.verified_boot.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.verified_boot.xml

# Ant
PRODUCT_PACKAGES += \
    AntHalService-Soong

# Architecture
TARGET_BOARD_PLATFORM := lahaina
TARGET_BOOTLOADER_BOARD_NAME := dubai

# Atrace
PRODUCT_PACKAGES += \
    android.hardware.atrace@1.0-service

# Audio
PRODUCT_COPY_FILES += \
    frameworks/av/services/audiopolicy/config/a2dp_in_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/a2dp_in_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/bluetooth_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth_audio_policy_configuration.xml

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.audio.pro.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.audio.pro.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.sip.voip.xml

PRODUCT_PACKAGES += \
    android.hardware.audio.service \
    libaudiopreprocessing \
    libbundlewrapper \
    libdownmix \
    libdynproc \
    libeffectproxy \
    libldnhncr \
    libreverbwrapper \
    libvisualizer

# Authsecret
PRODUCT_PACKAGES += \
    android.hardware.authsecret@1.0.vendor

# AVB
BOARD_AVB_ENABLE := true

# Camera
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.full.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.full.xml \
    frameworks/native/data/etc/android.hardware.camera.raw.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.raw.xml

PRODUCT_PACKAGES += \
    android.hardware.camera.provider@2.4-impl \
    android.hardware.camera.provider@2.4-service_64 \
    libcamera2ndk_vendor \
    libgui_shim_vendor \
    vendor.qti.hardware.camera.postproc@1.0.vendor \
    DubaiCameraService

# Dalvik
$(call inherit-product, frameworks/native/build/phone-xhdpi-6144-dalvik-heap.mk)

# Data Services
$(call inherit-product, vendor/qcom/opensource/dataservices/dataservices_vendor_product.mk)

# Display
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/display/display_id_4630947043778501762.xml:$(TARGET_COPY_OUT_VENDOR)/etc/displayconfig/display_id_4630947043778501762.xml

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.se.omapi.uicc.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.se.omapi.uicc.xml

PRODUCT_PACKAGES += \
    gralloc.default \
    libdisplayconfig.system.qti \
    libsdmcore \
    libsdmutils \
    libtinyxml \
    libvulkan \
    memtrack.default \
    vendor.qti.hardware.display.mapper@1.0.vendor \
    vendor.qti.hardware.display.mapper@1.1.vendor

# DRM
PRODUCT_PACKAGES += \
    android.hardware.drm@1.4.vendor \
    android.hardware.drm@1.4-service.clearkey

# Emulated Storage
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

# Filesystem
PRODUCT_PACKAGES += \
    fs_config_files

TARGET_FS_CONFIG_GEN += $(DEVICE_PATH)/configs/mot_aids.fs

# Fingerprint
TARGET_BUILDS_OSS_BIOMETRICS := true
TARGET_USES_FOD_ZPOS := true

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.fingerprint.xml

PRODUCT_PACKAGES += \
    android.hardware.biometrics.fingerprint@2.3.so.vendor

# Firmware
$(call inherit-product-if-exists, vendor/motorola/firmware/dubai/config.mk)

# FM
BOARD_HAVE_QCOM_FM := false

# Gatekeeper
PRODUCT_PACKAGES += \
    android.hardware.gatekeeper@1.0 \
    android.hardware.gatekeeper@1.0.vendor

# Generic Kernel Headers
TARGET_HAS_GENERIC_KERNEL_HEADERS := true

# GPS
PRODUCT_PACKAGES += \
    libgnsspps \
    libsynergy_loc_api

# Health
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl-qti \
    android.hardware.health@2.1-impl.recovery \
    android.hardware.health@2.1-service

# HIDL
PRODUCT_PACKAGES += \
    android.hidl.memory.block@1.0.vendor \
    libhidltransport.vendor \
    libhwbinder.vendor

# Hotword
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/hotword/product_privapp-permissions-hotword.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-hotword.xml \
    $(DEVICE_PATH)/configs/hotword/hotword-hiddenapi-package-whitelist.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/sysconfig/hotword-hiddenapi-package-whitelist.xml

# Init
PRODUCT_PACKAGES += \
    charger_fstab.qti \
    charger_fw_fstab.qti \
    fstab.default \
    init.dubai.perf.rc \
    init.mmi.charge_only.rc \
    init.mmi.chipset.rc \
    init.mmi.overlay.rc \
    init.mmi.rc \
    init.qti.qcv.rc \
    init.target.rc \
    init.vendor.st21nfc.rc \
    ueventd.dubai.rc

PRODUCT_PACKAGES += \
    init.mmi.boot.sh \
    init.mmi.touch.sh \
    init.oem.hw.sh \
    init.qcom.sensors.sh \
    init.qti.chg_policy.sh \
    init.qti.qcv.sh

# IPACM
PRODUCT_SOONG_NAMESPACES += vendor/qcom/opensource/data-ipa-cfg-mgr-legacy
$(call inherit-product, vendor/qcom/opensource/data-ipa-cfg-mgr-legacy/ipacm_vendor_product.mk)

PRODUCT_PACKAGES += \
    ipacm \
    IPACM_cfg.xml \
    libipanat \
    liboffloadhal

# Keymaster
PRODUCT_PACKAGES += \
   android.hardware.keymaster@4.1 \
   android.hardware.keymaster@4.1.vendor

# Manifests
DEVICE_MANIFEST_FILE := $(DEVICE_PATH)/configs/vintf/manifest_yupik.xml
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE += \
    $(DEVICE_PATH)/configs/vintf/dubai_vendor_framework_compatibility_matrix.xml

# Moto Actions
PRODUCT_PACKAGES += \
    MotoActions

# Namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(DEVICE_PATH)

# Net
PRODUCT_PACKAGES += \
    netutils-wrapper-1.0

# NFC
TARGET_USES_ST_AIDL_NFC := true
$(call inherit-product, hardware/st/nfc/nfc_vendor_product.mk)

PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/nfc/libnfc-hal-st.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-hal-st.conf

PRODUCT_PACKAGES += \
    android.hardware.secure_element@1.2.vendor \
    com.android.nfc_extras \
    libchrome.vendor \
    NfcNci \
    SecureElement \
    Tag

# Overlays
PRODUCT_PACKAGES += \
    CarrierConfigResDubai \
    FrameworksResDubai \
    FrameworksResDubaiAOSPA \
    SettingsResDubai \
    SettingsProviderResDubai \
    SystemUIResDubai \
    TelephonyResDubai \
    WifiResTargetDubai

# Partitions - Dynamic
PRODUCT_BUILD_ODM_IMAGE := true
PRODUCT_USE_DYNAMIC_PARTITIONS := true

PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.0-impl-mock \
    fastbootd

PRODUCT_COPY_FILES += $(DEVICE_PATH)/init/fstab.default:$(TARGET_COPY_OUT_VENDOR_RAMDISK)/first_stage_ramdisk/fstab.default

# Partitions - Super
PRODUCT_BUILD_SUPER_PARTITION := false

# Perf
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/perf/msm_irqbalance.conf:$(TARGET_COPY_OUT_VENDOR)/etc/msm_irqbalance.conf

# QMI
PRODUCT_PACKAGES += \
    libjson

# QTI Components
TARGET_COMMON_QTI_COMPONENTS += \
    adreno \
    audio \
    av \
    bt \
    display \
    gps \
    init \
    media \
    overlay \
    perf \
    qseecomd \
    usb \
    vibrator \
    wfd \
    wlan

# RIL
ENABLE_VENDOR_RIL_SERVICE := true

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.ipsec_tunnels.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.ipsec_tunnels.xml

PRODUCT_PACKAGES += \
    android.hardware.radio@1.5.vendor \
    android.hardware.radio.config@1.2.vendor \
    android.hardware.radio.deprecated@1.0.vendor \
    android.hardware.wifi.hostapd@1.0.vendor \
    android.system.net.netd@1.1.vendor \
    libprotobuf-cpp-full \
    librmnetctl \
    libxml2

# Screen
TARGET_SCREEN_DENSITY := 400

# Sensors
TARGET_BUILDS_OSS_SENSORS_SUBHAL := true

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.barometer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.barometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepdetector.xml

PRODUCT_PACKAGES += \
    android.hardware.sensors@2.0-service.multihal \
    android.hardware.sensors@2.0-ScopedWakelock \
    libsensorndkbridge

# Storage
PRODUCT_CHARACTERISTICS := nosdcard

# System Helper
PRODUCT_PACKAGES += \
    vendor.qti.hardware.systemhelper@1.0.vendor

# Telephony
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.telephony.cdma.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.telephony.ims.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.ims.xml

# Thermal
PRODUCT_PACKAGES += \
    android.hardware.thermal@2.0-service.qti

# Treble
PRODUCT_FULL_TREBLE_OVERRIDE := true
PRODUCT_COMPATIBLE_PROPERTY_OVERRIDE := true

# VNDK
PRODUCT_EXTRA_VNDK_VERSIONS := 30
PRODUCT_ENFORCE_ARTIFACT_PATH_REQUIREMENTS := strict

# WiFi Display
PRODUCT_PACKAGES += \
    libwfdaac_vendor

# WLAN
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/wifi/WCNSS_qcom_cfg.ini:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/WCNSS_qcom_cfg.ini \
    $(DEVICE_PATH)/configs/wifi/WCNSS_qcom_cfg.ini:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/qca6750/WCNSS_qcom_cfg.ini \
    $(DEVICE_PATH)/configs/wifi/p2p_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/p2p_supplicant_overlay.conf \
    $(DEVICE_PATH)/configs/wifi/wpa_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wpa_supplicant_overlay.conf

# Hardware Motorola
$(call inherit-product, $(HARDWARE_PATH)/common.mk)

# Proprietary Vendor
$(call inherit-product, vendor/motorola/dubai/dubai-vendor.mk)
