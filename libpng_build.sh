#!/bin/bash

. abi_settings.sh $1 $2 $3

pushd libpng

# Since there's no 'clean' target for libpng, just do a git clean
git clean -fdx

ARM_NEON="no"
case $1 in
  armeabi-v7a-neon)
    ARM_NEON="yes"
    ;;
esac

./autogen.sh

./configure \
  --with-pic \
  --with-sysroot="$NDK_SYSROOT" \
  --host="$NDK_TOOLCHAIN_ABI" \
  --enable-static \
  --disable-shared \
  --prefix="${TOOLCHAIN_PREFIX}" \
  --enable-arm-neon="$ARM_NEON" \
  --disable-shared || exit 1

make -j${NUMBER_OF_CORES} install || exit 1

popd
