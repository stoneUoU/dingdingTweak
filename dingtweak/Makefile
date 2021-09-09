export THEOS_DEVICE_IP = 127.0.0.1
export THEOS_DEVICE_PORT = 10010

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = dingdingtweak

dingdingtweak_FRAMEWORKS = UIKit CoreLocation

dingdingtweak_FILES = Tweak.xm src/*.m
dingdingtweak_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"