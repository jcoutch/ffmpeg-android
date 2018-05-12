#!/bin/bash

. abi_settings.sh $1 $2 $3

pushd fontconfig

export EXPAT_CFLAGS="-I${TOOLCHAIN_PREFIX}/include"
export EXPAT_LIBS="-L${TOOLCHAIN_PREFIX}/lib -lexpat"

export FREETYPE_CFLAGS="-I${TOOLCHAIN_PREFIX}/include/freetype2"
export FREETYPE_LIBS="-L${TOOLCHAIN_PREFIX}/lib -lfreetype -lz -lpng"

make clean

autoreconf -ivf

./configure \
  --with-pic \
  --host="$NDK_TOOLCHAIN_ABI" \
  --disable-shared \
  --enable-static \
  --disable-libxml2 \
  --prefix="${TOOLCHAIN_PREFIX}" \
  --disable-iconv || exit 1

make -j${NUMBER_OF_CORES} install || exit 1

popd
