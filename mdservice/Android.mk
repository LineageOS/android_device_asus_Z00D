LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_SRC_FILES:= \
    main_mdservice.cpp

LOCAL_SHARED_LIBRARIES := \
    libutils \
    libbinder

LOCAL_CFLAGS := -Wall -Werror -Wextra
LOCAL_LDFLAGS := -L vendor/$(PRODUCT_BRAND)/$(PRODUCT_MODEL)/proprietary/lib/
LOCAL_LDLIBS := -lmultidisplay

LOCAL_MODULE_TAGS := optional

LOCAL_MODULE:= mdservice

include $(BUILD_EXECUTABLE)
