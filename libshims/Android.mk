LOCAL_PATH := $(call my-dir)

# Audio

include $(CLEAR_VARS)

LOCAL_SRC_FILES := icu53.c
LOCAL_SHARED_LIBRARIES := libicuuc libicui18n
LOCAL_MODULE := libshim_audio
LOCAL_MODULE_TAGS := optional

include $(BUILD_SHARED_LIBRARY)

# Camera

include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
    gui/SensorManager.cpp \
    ui/GraphicBufferAllocator.cpp \
    ui/GraphicBuffer.cpp \
    ui/GraphicBufferMapper.cpp \
    atomic.cpp

LOCAL_SHARED_LIBRARIES := liblog libcutils libhardware libui libgui libbinder libsensor libutils libsync
LOCAL_MODULE := libshim_camera
LOCAL_MODULE_CLASS := SHARED_LIBRARIES

include $(BUILD_SHARED_LIBRARY)

# hwcomposer

include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
    gbf.cpp

LOCAL_SHARED_LIBRARIES := libui
LOCAL_MODULE := libgbf
LOCAL_MODULE_CLASS := SHARED_LIBRARIES

include $(BUILD_SHARED_LIBRARY)

# GPSD

include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
    gui/SensorManager.cpp \
    crypto_malloc.c \
    icu53.c \
    ssl_lib.c

LOCAL_SHARED_LIBRARIES := liblog libcutils libgui libbinder libsensor libutils libicuuc libicui18n libcrypto
LOCAL_MODULE := libshim_gps
LOCAL_MODULE_CLASS := SHARED_LIBRARIES

include $(BUILD_SHARED_LIBRARY)

# MMGR

include $(CLEAR_VARS)

LOCAL_SRC_FILES := icu53.c
LOCAL_SHARED_LIBRARIES := libicuuc libicui18n
LOCAL_MODULE := libshim_mmgr
LOCAL_MODULE_TAGS := optional

include $(BUILD_SHARED_LIBRARY)

# sensors

include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
     icu53.c

LOCAL_SHARED_LIBRARIES := libicuuc libicui18n
LOCAL_MODULE := libshim_sensors
LOCAL_MODULE_TAGS := optional

include $(BUILD_SHARED_LIBRARY)

# tcs

include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
     icu53.c

LOCAL_SHARED_LIBRARIES := libicuuc libicui18n
LOCAL_MODULE := libshim_tcs
LOCAL_MODULE_TAGS := optional

include $(BUILD_SHARED_LIBRARY)
