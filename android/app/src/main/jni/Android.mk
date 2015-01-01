LOCAL_PATH := $(call my-dir)

LOCAL_LDLIBS := -L$(SYSROOT)/usr/lib -llog

include $(CLEAR_VARS)

LOCAL_MODULE    := models
LOCAL_SRC_FILES := swig/models/player_wrap.cpp core/models/core_player.cpp

include $(BUILD_SHARED_LIBRARY)
