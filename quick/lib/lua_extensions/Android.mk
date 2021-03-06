
LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

LOCAL_MODULE := lua_extensions_static
LOCAL_MODULE_FILENAME := libluaextensions

LOCAL_SRC_FILES := \
                        $(LOCAL_PATH)/zlib/lua_zlib.c \
                        $(LOCAL_PATH)/filesystem/lfs.c \
                        $(LOCAL_PATH)/lpack/lpack.c \
                        $(LOCAL_PATH)/socket/auxiliar.c \
                        $(LOCAL_PATH)/socket/except.c \
                        $(LOCAL_PATH)/socket/inet.c \
                        $(LOCAL_PATH)/socket/luasocket.c \
                        $(LOCAL_PATH)/socket/luasocket_buffer.c \
                        $(LOCAL_PATH)/socket/luasocket_io.c \
                        $(LOCAL_PATH)/socket/mime.c \
                        $(LOCAL_PATH)/socket/options.c \
                        $(LOCAL_PATH)/socket/select.c \
                        $(LOCAL_PATH)/socket/serial.c \
                        $(LOCAL_PATH)/socket/socket_scripts.c \
                        $(LOCAL_PATH)/socket/tcp.c \
                        $(LOCAL_PATH)/socket/timeout.c \
                        $(LOCAL_PATH)/socket/udp.c \
                        $(LOCAL_PATH)/socket/unix.c \
                        $(LOCAL_PATH)/socket/usocket.c \
                        $(LOCAL_PATH)/lua_extensions.c \
                        $(LOCAL_PATH)/talkingdata/lua_cocos2dx_TDGAAccount_auto.cpp \
                        $(LOCAL_PATH)/talkingdata/lua_cocos2dx_TDGAItem_auto.cpp \
                        $(LOCAL_PATH)/talkingdata/lua_cocos2dx_TDGAMission_auto.cpp \
                        $(LOCAL_PATH)/talkingdata/lua_cocos2dx_TDGAVirtualCurrency_auto.cpp \
                        $(LOCAL_PATH)/talkingdata/lua_cocos2dx_TalkingDataGA_auto.cpp \
                        $(LOCAL_PATH)/sproto/lsproto.c \
                        $(LOCAL_PATH)/sproto/sproto.c \
                        $(LOCAL_PATH)/lpeg/lpcap.c\
                        $(LOCAL_PATH)/lpeg/lpcode.c\
                        $(LOCAL_PATH)/lpeg/lpprint.c\
                        $(LOCAL_PATH)/lpeg/lptree.c\
                        $(LOCAL_PATH)/lpeg/lpvm.c\

ifeq ($(CC_USE_SQLITE),1)
LOCAL_SRC_FILES += \
                        $(LOCAL_PATH)/lsqlite3/sqlite3.c \
                        $(LOCAL_PATH)/lsqlite3/lsqlite3.c
endif

ifeq ($(CC_USE_JSON),1)
LOCAL_SRC_FILES += \
                        $(LOCAL_PATH)/cjson/fpconv.c \
                        $(LOCAL_PATH)/cjson/lua_cjson.c \
                        $(LOCAL_PATH)/cjson/strbuf.c
endif

LOCAL_EXPORT_C_INCLUDES := $(QUICK_V3_LIB)/lua_bindings/luajit/include \
                           $(QUICK_V3_LIB)/lua_bindings/tolua \
                           $(QUICK_V3_LIB)/lua_bindings/manual \
                           $(LOCAL_PATH)/ \
                           $(LOCAL_PATH)/cjson \
                           $(LOCAL_PATH)/zlib \
                           $(LOCAL_PATH)/debugger \
                           $(LOCAL_PATH)/filesystem \
                           $(LOCAL_PATH)/lpack \
                           $(LOCAL_PATH)/socket \
                           $(LOCAL_PATH)/lsqlite3 \
                           $(LOCAL_PATH)/sproto \
                           $(LOCAL_PATH)/talkingdata \

LOCAL_C_INCLUDES := $(LOCAL_PATH)/ \
                    $(QUICK_V3_LIB)/lua_bindings/luajit/include \
                    $(QUICK_V3_LIB)/lua_bindings/tolua \
                    $(QUICK_V3_LIB)/lua_bindings/manual \
                    $(LOCAL_PATH)/cjson \
                    $(LOCAL_PATH)/zlib \
                    $(LOCAL_PATH)/debugger \
                    $(LOCAL_PATH)/filesystem \
                    $(LOCAL_PATH)/lpack \
                    $(LOCAL_PATH)/socket \
                    $(LOCAL_PATH)/lsqlite3 \
                    $(LOCAL_PATH)/talkingdata \
                    $(LOCAL_PATH)/sproto \
                    $(LOCAL_PATH)/lpeg \
                    $(COCOS2DX_CORE) \
                    $(COCOS2DX_CORE)/platform \
                    $(COCOS2DX_CORE)/platform/android \
                    $(COCOS2DX_CORE)/kazmath/include \
                    $(COCOS2DX_ROOT)/extensions \
                    $(COCOS2DX_ROOT)/external \
                    $(COCOS2DX_ROOT)/external/TalkingDataGameAnalytics/include \
                    $(QUICK_V3_LIB) \

LOCAL_WHOLE_STATIC_LIBRARIES := luajit_static

LOCAL_CFLAGS += -Wno-psabi -DCC_LUA_ENGINE_ENABLED=1 $(ANDROID_COCOS2D_BUILD_FLAGS)

include $(BUILD_STATIC_LIBRARY)

$(call import-module,lua_bindings/luajit)
$(call import-module,TalkingDataGameAnalytics/android)
