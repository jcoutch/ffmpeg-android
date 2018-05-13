#!/bin/bash

. abi_settings.sh $1 $2 $3

pushd ffmpeg

case $1 in
  armeabi-v7a | armeabi-v7a-neon)
    CPU='cortex-a8'
  ;;
  x86)
    CPU='i686'
  ;;
esac

# Inject the Newtek NDI includes if enabled
if [ "$NEWTEK_NDI_ENABLED" = "yes" ]; then
 CFLAGS="$CFLAGS -I${NEWTEK_NDI_SDK_ROOT_PATH}/include -Wl,-Bstatic -l:libndi.so.3"
 LDFLAGS="$LDFLAGS -L${NEWTEK_NDI_SDK_ROOT_PATH}/lib/arm-linux-gnueabi"
fi

make clean

PKG_CONFIG_PATH=${TOOLCHAIN_PREFIX}/lib/pkgconfig

./configure \
--target-os="$TARGET_OS" \
--cross-prefix="$CROSS_PREFIX" \
--arch="$NDK_ABI" \
--cpu="$CPU" \
--enable-runtime-cpudetect \
--sysroot="$NDK_SYSROOT" \
--enable-pic \
--enable-libx264 \
--enable-libass \
--enable-libfreetype \
--enable-libfribidi \
--enable-libmp3lame \
--enable-fontconfig \
--enable-pthreads \
--disable-debug \
--enable-version3 \
--enable-hardcoded-tables \
--disable-ffplay \
--disable-ffprobe \
--enable-gpl \
--enable-yasm \
--disable-doc \
--disable-shared \
--enable-static \
--pkg-config="${2}/ffmpeg-pkg-config" \
--prefix="${2}/build/${1}" \
--extra-cflags="-I${TOOLCHAIN_PREFIX}/include $CFLAGS" \
--extra-ldflags="-L${TOOLCHAIN_PREFIX}/lib $LDFLAGS" \
--extra-libs="-lpng -lexpat -lm -lz" \
--extra-cxxflags="$CXX_FLAGS" \
$([ "$NEWTEK_NDI_ENABLED" = "yes" ] && echo "--enable-libndi_newtek --enable-nonfree") || exit 1

#--enable-outdev="libndi_newtek" \

make -j${NUMBER_OF_CORES} && make install || exit 1

popd
