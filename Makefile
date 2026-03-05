TARGET := iphone:clang:latest:14.0
ARCHS = arm64 arm64e
INSTALL_TARGET_PROCESSES = Twitch

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = LuminousProxy

LuminousProxy_FILES = Tweak.x
LuminousProxy_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
