LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_SRC_FILES:= \
    main_mdservice.cpp

LOCAL_SHARED_LIBRARIES := \
    libutils \
    libbinder \
    libmultidisplay

LOCAL_CFLAGS := -Wall -Werror -Wextra

LOCAL_MODULE_TAGS := optional

LOCAL_MODULE:= mdservice

include $(BUILD_EXECUTABLE)
