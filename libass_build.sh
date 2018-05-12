#!/bin/bash

. abi_settings.sh $1 $2 $3

pushd libass

export FREETYPE_CFLAGS="-I${TOOLCHAIN_PREFIX}/include/freetype2"
export FREETYPE_LIBS="-L${TOOLCHAIN_PREFIX}/lib -lfreetype"

export FRIBIDI_CFLAGS="-I${TOOLCHAIN_PREFIX}/include/fribidi"
export FRIBIDI_LIBS="-L${TOOLCHAIN_PREFIX}/lib -lfribidi"

export FONTCONFIG_CFLAGS="-I${TOOLCHAIN_PREFIX}/include"
export FONTCONFIG_LIBS="-L${TOOLCHAIN_PREFIX}/lib -lfontconfig"

export LIBPNG_CFLAGS="-I${TOOLCHAIN_PREFIX}/include"
export LIBPNG_LIBS="-L${TOOLCHAIN_PREFIX}/lib -lpng"

make clean

./autogen.sh

./configure \
  --disable-dependency-tracking \
  --with-pic \
  --host="$NDK_TOOLCHAIN_ABI" \
  --disable-enca \
  --disable-asm \
  --enable-fontconfig \
  --disable-harfbuzz \
  --enable-static \
  --disable-shared \
  --prefix="${TOOLCHAIN_PREFIX}" || exit 1

make -j${NUMBER_OF_CORES} install || exit 1

popd
