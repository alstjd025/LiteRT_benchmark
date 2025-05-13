LOCAL_PATH := $(call my-dir)

# cl_main 모듈 설정
include $(CLEAR_VARS)

LOCAL_MODULE    := cl_main
LOCAL_SRC_FILES := cl_main.cpp  # 경로 수정!
LOCAL_CFLAGS    += -std=c++17
LOCAL_SHARED_LIBRARIES := libOpenCL

include $(BUILD_EXECUTABLE)

# libOpenCL.so 설정
include $(CLEAR_VARS)

LOCAL_MODULE := libOpenCL
LOCAL_SRC_FILES := libOpenCL.so  # 경로 수정!
LOCAL_EXPORT_CFLAGS := -DLIBOPENCL_INCLUDED
include $(PREBUILT_SHARED_LIBRARY)

