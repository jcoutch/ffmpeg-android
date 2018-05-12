#!/bin/bash

. abi_settings.sh $1 $2 $3

pushd fribidi

# Do a git clean as a precaution
make clean

autoreconf -ivf

./configure \
  --with-pic \
  --with-sysroot="$NDK_SYSROOT" \
  --host="$NDK_TOOLCHAIN_ABI" \
  --enable-static \
  --disable-shared \
  --with-glib=no \
  --prefix="${TOOLCHAIN_PREFIX}" || exit 1

make -j${NUMBER_OF_CORES} -C lib install || exit 1

# Since '-C lib' doesn't install the pkg-config file, do it manually
cp fribidi.pc

popd
