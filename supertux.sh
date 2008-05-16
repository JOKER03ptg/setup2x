#!/bin/bash

. `dirname "$0"`/common || exit 1

SUPERTUX_DIR="$BASEDIR/../supertux"

export CC="$COMPILER_PREFIX/bin/$TARGET-gcc"
export CXX="$COMPILER_PREFIX/bin/$TARGET-g++"
#export GCC_EXEC_PREFIX="$TARGET"
export PKG_CONFIG_PATH="$COMPILER_PREFIX/lib/pkgconfig:$PREFIX/lib/pkgconfig:$PKG_CONFIG_PATH"

CMAKE_FLAGS="-DDEBUG=on"
INCLUDE2X="$PREFIX/include"
INCLUDEL2X="$COMPILER_PREFIX/include"
LIB2X="$PREFIX/lib"
LIBL2X="$COMPILER_PREFIX/lib"
CMAKE_FLAGS=""
CMAKE_FLAGS="$CMAKE_FLAGS -DGENERATE_MESSAGESPOT=off"
CMAKE_FLAGS="$CMAKE_FLAGS -DGENERATE_WRAPPER=off"
CMAKE_FLAGS="$CMAKE_FLAGS -DPHYSFS_INCLUDE_DIR=$INCLUDE2X"
CMAKE_FLAGS="$CMAKE_FLAGS -DPHYSFS_LIBRARY=$LIB2X/libphysfs.so"
CMAKE_FLAGS="$CMAKE_FLAGS -DOPENAL_INCLUDE_DIR=$INCLUDE2X/AL"
CMAKE_FLAGS="$CMAKE_FLAGS -DOPENAL_LIBRARY=$LIB2X/libopenal.so"
CMAKE_FLAGS="$CMAKE_FLAGS -DSDL_INCLUDE_DIR=$INCLUDEL2X/SDL"
CMAKE_FLAGS="$CMAKE_FLAGS -DSDL_LIBRARY=$LIBL2X/libSDL.so"
CMAKE_FLAGS="$CMAKE_FLAGS -DSDLIMAGE_INCLUDE_DIR=$INCLUDEL2X/SDL"
CMAKE_FLAGS="$CMAKE_FLAGS -DSDLIMAGE_LIBRARY=$LIBL2X/libSDL_image.so"
CMAKE_FLAGS="$CMAKE_FLAGS -DVORBISENC_LIBRARY=$LIBL2X/libvorbisenc.so"
CMAKE_FLAGS="$CMAKE_FLAGS -DVORBISFILE_LIBRARY=$LIBL2X/libvorbisfile.so"
CMAKE_FLAGS="$CMAKE_FLAGS -DVORBIS_LIBRARY=$LIBL2X/libvorbis.so"
CMAKE_FLAGS="$CMAKE_FLAGS -DVORBIS_INCLUDE_DIR=$INCLUDEL2X"
CMAKE_FLAGS="$CMAKE_FLAGS -DCMAKE_CXX_COMPILER=$CXX"
CMAKE_FLAGS="$CMAKE_FLAGS -DCMAKE_C_COMPILER=$CC"
CMAKE_FLAGS="$CMAKE_FLAGS -DVORBIS_INCLUDE_DIR=$INCLUDEL2X"
CFLAGS="-I$INCLUDEL2X -I$INCLUDEL2X"
CMAKE_FLAGS="$CMAKE_FLAGS -DCMAKE_CXX_FLAGS=$CFLAGS"
CMAKE_FLAGS="$CMAKE_FLAGS -DCMAKE_C_FLAGS=$CFLAGS"

execute mkdir -p supertux
execute pushd supertux
execute cmake $CMAKE_FLAGS "$SUPERTUX_DIR"
execute make VERBOSE=1
execute popd supertux