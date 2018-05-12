#!/bin/bash

echo "============================================"
echo "Updating submodules"
git submodule update --init

rm -rf lame-*
svn checkout https://svn.code.sf.net/p/lame/svn/trunk/lame lame-svn
echo "============================================"
