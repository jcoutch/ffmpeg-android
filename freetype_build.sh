#!/bin/bash

. abi_settings.sh $1 $2 $3

pushd freetype2

make clean

./autogen.sh

export ZLIB_CFLAGS="-I${TOOLCHAIN_PREFIX}/include"
export ZLIB_LIBS="-L${TOOLCHAIN_PREFIX}/lib"

export LIBPNG_CFLAGS="-I${TOOLCHAIN_PREFIX}/include"
export LIBPNG_LIBS="-L${TOOLCHAIN_PREFIX}/lib"

./configure \
  --with-pic \
  --with-sysroot="$NDK_SYSROOT" \
  --host="$NDK_TOOLCHAIN_ABI" \
  --enable-static \
  --disable-shared \
  --with-png=yes \
  --with-zlib=yes \
  --prefix="${TOOLCHAIN_PREFIX}" || exit 1

make -j${NUMBER_OF_CORES} && make install || exit 1
