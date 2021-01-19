#!/bin/bash

ARCH=$1

source config.sh $ARCH
LIBS_DIR=$(cd `dirname $0`; pwd)/libs/liblame
echo "LIBS_DIR="$LIBS_DIR

#lame source dir
cd lame

PREFIX=$LIBS_DIR/$AOSP_ABI

export CC="$CC"
export CXX="$CXX"
export CFLAGS="$FF_CFLAGS"
export CXXFLAGS="$FF_EXTRA_CFLAGS"
export CPPFLAGS="-fPIC"
export LDFLAGS="-lm"
export AR="${CROSS_PREFIX}ar"
export LD="${CROSS_PREFIX}ld"
export AS="${CROSS_PREFIX}as"
export RANLIB="${CROSS_PREFIX}ranlib"
export STRIP="${CROSS_PREFIX}strip"


./configure \
--enable-static \
--enable-shared \
--host=$HOST \
--target=android \
--disable-frontend \
--prefix=$PREFIX

make clean
make -j8
make install
echo "build for android $AOSP_ABI completed"

cd ..
