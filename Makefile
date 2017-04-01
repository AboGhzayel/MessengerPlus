export THEOS =/var/theos
ARCHS = armv7 arm64 
export ADDITIONAL_LDFLAGS = -Wl,-segalign,4000
DEBUG=1

include $(THEOS)/makefiles/common.mk
TWEAK_NAME = Messenger+
Messenger+_FILES = Tweak.xm Messenger.xm jailbreak.xm
include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 com.facebook.Messenger"
SUBPROJECTS += messenger
include $(THEOS_MAKE_PATH)/aggregate.mk
