export TARGET = iphone:clang:11.2:11.0
export ARCHS = arm64

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = MoveUpCydia
MoveUpCydia_FILES = Tweak.xm

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
