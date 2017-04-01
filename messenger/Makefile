export THEOS=/var/theos
ARCHS = armv7 arm64 

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = Messenger
Messenger_FILES = Messenger.mm MessengerHeader.mm
Messenger_INSTALL_PATH = /Library/PreferenceBundles
Messenger_FRAMEWORKS = UIKit
Messenger_PRIVATE_FRAMEWORKS = Preferences

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/Messenger.plist$(ECHO_END)


