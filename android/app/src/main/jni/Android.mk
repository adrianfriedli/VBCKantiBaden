LOCAL_PATH := $(call my-dir)

LOCAL_LDLIBS := -L$(SYSROOT)/usr/lib -llog

include $(CLEAR_VARS)

LOCAL_MODULE    := core
LOCAL_SRC_FILES := swig/core_wrap.cpp core/core_resource_manager.cpp
                   swig/models/models_wrap.cpp core/models/core_player.cpp

include $(BUILD_SHARED_LIBRARY)
