#!/bin/bash

. abi_settings.sh $1 $2 $3

pushd zlib

make clean

./configure \
  --prefix="${TOOLCHAIN_PREFIX}" || exit 1

make -j${NUMBER_OF_CORES} install || exit 1
