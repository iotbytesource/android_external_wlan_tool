ifneq ($(TARGET_SIMULATOR),true)

LOCAL_PATH:= $(call my-dir)
define include-wlan-prebuilt
    include $$(CLEAR_VARS)
    LOCAL_MODULE := $(4)
    LOCAL_MODULE_STEM := $(3)
    LOCAL_MODULE_TAGS := debug eng optional
    LOCAL_MODULE_CLASS := ETC
    LOCAL_MODULE_PATH := $(2)
    LOCAL_SRC_FILES := $(1)
    include $$(BUILD_PREBUILT)
endef

define add-wlan-prebuilt-file
    $(eval $(include-wlan-prebuilt))
endef
# HW2.1.1 firmware

wlan_tool_dir := $(TARGET_OUT)/bin
$(call add-wlan-prebuilt-file,wlan_tool,$(wlan_tool_dir),wlan_tool,wlan_tool)
wlan_tool_dir :=

wifi_loader_dir := $(TARGET_OUT)/bin
$(call add-wlan-prebuilt-file,wifi_loader,$(wifi_loader_dir),wifi_loader,wifi_loader)
wifi_loader_dir :=
endif
