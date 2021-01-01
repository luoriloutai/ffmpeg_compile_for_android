#!/bin/bash

ARCH=$1

source config.sh $ARCH
LIBS_DIR=$(cd `dirname $0`; pwd)/libs/liblame
echo "LIBS_DIR="$LIBS_DIR

#注意修改为正确位置
cd lame

PREFIX=$LIBS_DIR/$AOSP_ABI

export CC="$CC"
export CXX="$CXX"
export CFLAGS="$FF_CFLAGS"
export CXXFLAGS="$FF_EXTRA_CFLAGS"
# x86架构源码中使用了math库所以必须链接
export LDFLAGS="-lm"
export AR="${CROSS_PREFIX}ar"
export LD="${CROSS_PREFIX}ld"
export AS="${CROSS_PREFIX}as"


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

cd ..