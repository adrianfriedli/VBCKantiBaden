LOCAL_PATH := $(call my-dir)

LOCAL_LDLIBS := -L$(SYSROOT)/usr/lib -llog

include $(CLEAR_VARS)

LOCAL_MODULE    := models
LOCAL_SRC_FILES := models_wrap.cpp models/player.cpp

include $(BUILD_SHARED_LIBRARY)
