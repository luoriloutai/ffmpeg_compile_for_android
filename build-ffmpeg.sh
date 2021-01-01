#!/bin/bash

# 编译ffmpeg，链接x264和fdkaac
ARCH=$1

source config.sh $ARCH
NOW_DIR=$(cd `dirname $0`; pwd)
LIBS_DIR=$NOW_DIR/libs

# 源码目录，自行更改
cd ffmpeg


# 输出路径
PREFIX=$LIBS_DIR/ffmpeg/$AOSP_ABI

# 头文件目录
FDK_INCLUDE=$LIBS_DIR/libfdk-aac/$AOSP_ABI/include
# 库文件目录
FDK_LIB=$LIBS_DIR/libfdk-aac/$AOSP_ABI/lib
X264_INCLUDE=$LIBS_DIR/libx264/$AOSP_ABI/include
X264_LIB=$LIBS_DIR/libx264/$AOSP_ABI/lib
OPENSSL_INCLUDE=$LIBS_DIR/openssl/$AOSP_ABI/include
OPENSSL_LIB=$LIBS_DIR/openssl/$AOSP_ABI/lib
LAME_INCLUDE=$LIBS_DIR/liblame/$AOSP_ABI/include
LAME_LIB=$LIBS_DIR/liblame/$AOSP_ABI/lib

./configure \
--target-os=android \
--prefix=$PREFIX \
--enable-cross-compile \
--disable-runtime-cpudetect \
--disable-asm \
--arch=$AOSP_ARCH \
--cc=$CC \
--cxx=$CXX \
--cross-prefix=$CROSS_PREFIX \
--extra-cflags="-I$X264_INCLUDE  -I$FDK_INCLUDE -I$OPENSSL_INCLUDE -I$LAME_INCLUDE $FF_CFLAGS" \
--extra-cxxflags="$FF_EXTRA_CFLAGS" \
--extra-ldflags="-L$X264_LIB -L$FDK_LIB -L$OPENSSL_LIB -L$LAME_LIB" \
--extra-libs=-lm \
--sysroot=$SYS_ROOT \
--disable-static \
--enable-shared \
--enable-jni \
--enable-mediacodec \
--enable-pthreads \
--enable-pic \
--disable-iconv \
--enable-libx264 \
--enable-libfdk_aac \
--enable-openssl \
--enable-libmp3lame \
--enable-gpl \
--enable-nonfree \
--enable-dct \
--enable-dwt \
--enable-lsp \
--enable-mdct \
--enable-rdft \
--enable-fft \
--enable-version3 \
--disable-muxers \
--enable-muxer=mov \
--enable-muxer=mp4 \
--enable-muxer=h264 \
--enable-muxer=avi \
--enable-muxer=flv \
--enable-muxer=hls \
--enable-muxer=rtp \
--enable-muxer=rtsp \
--enable-muxer=mp3 \
--enable-muxer=wav \
--enable-muxer=adts \
--disable-demuxers \
--enable-demuxer=mov \
--enable-demuxer=h264 \
--enable-demuxer=avi \
--enable-demuxer=flv \
--enable-demuxer=hls \
--enable-demuxer=rtp \
--enable-demuxer=rtsp \
--enable-demuxer=wav \
--enable-demuxer=aac \
--disable-encoders \
--enable-encoder=aac \
--enable-encoder=libfdk_aac \
--enable-encoder=libx264 \
--enable-encoder=mpeg4 \
--enable-encoder=mjpeg \
--enable-encoder=png \
--enable-encoder=libmp3lame \
--enable-encoder=pcm_s16le \
--disable-decoders \
--enable-decoder=aac \
--enable-decoder=mp3 \
--enable-decoder=aac_latm \
--enable-decoder=libfdk_aac \
--enable-decoder=h264 \
--enable-decoder=h264_mediacodec \
--enable-decoder=mpeg4 \
--enable-decoder=mjpeg \
--enable-decoder=png \
--enable-decoder=pcm_s16le \
--disable-parsers \
--enable-parser=aac \
--enable-parser=aac_latm \
--enable-parser=h264 \
--enable-parser=mjpeg \
--enable-parser=png \
--disable-protocols \
--enable-protocol=file \
--enable-protocol=crypto \
--enable-protocol=http \
--enable-protocol=https \
--enable-protocol=tls \
--enable-protocol=tcp \
--enable-protocol=udp \
--enable-protocol=rtp \
--enable-protocol=rtmp \
--enable-protocol=rtmps \
--enable-protocol=hls \
--disable-bsfs \
--enable-bsf=aac_adtstoasc \
--enable-bsf=h264_mp4toannexb \
--enable-zlib \
--enable-small \
--enable-postproc \
--disable-outdevs \
--disable-indevs \
--disable-ffprobe \
--disable-ffplay \
--disable-ffmpeg \
--disable-debug \
--disable-symver 
make clean
make -j8
make install

cd ..