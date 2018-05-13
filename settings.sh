#!/bin/bash

SUPPORTED_ARCHITECTURES=(armeabi-v7a-neon)
ANDROID_NDK_ROOT_PATH=${ANDROID_NDK}
if [[ -z "$ANDROID_NDK_ROOT_PATH" ]]; then
  echo "You need to set the ANDROID_NDK environment variable to the where you extracted the NDK"
  exit
fi
ANDROID_API_VERSION=14
NDK_TOOLCHAIN_ABI_VERSION=4.9

NUMBER_OF_CORES=$(nproc)
HOST_UNAME=$(uname -m)
TARGET_OS=linux

CFLAGS='-U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=2 -fno-strict-overflow -fstack-protector-all'
LDFLAGS='-Wl,-z,relro -Wl,-z,now -pie'

FFMPEG_PKG_CONFIG="$(pwd)/ffmpeg-pkg-config"

NEWTEK_NDI_ENABLED=yes
NEWTEK_NDI_SDK_ROOT_PATH=${NEWTEK_NDI_SDK}
if [[ -z "$NEWTEK_NDI_SDK_ROOT_PATH" ]]; then
  NEWTEK_NDI_ENABLED=no
fi
