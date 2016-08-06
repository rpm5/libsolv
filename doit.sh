#!/bin/sh

rm -rf build

mkdir build
cd build && cmake \
        -DCMAKE_C_FLAGS_RELEASE:STRING="-DNDEBUG" \
        -DCMAKE_CXX_FLAGS_RELEASE:STRING="-DNDEBUG" \
        -DCMAKE_Fortran_FLAGS_RELEASE:STRING="-DNDEBUG" \
        -DCMAKE_VERBOSE_MAKEFILE:BOOL=ON \
        -DCMAKE_INSTALL_PREFIX:PATH=/usr \
        -DINCLUDE_INSTALL_DIR:PATH=/usr/include \
        -DLIB_INSTALL_DIR:PATH=/usr/lib64 \
        -DSYSCONF_INSTALL_DIR:PATH=/etc \
        -DSHARE_INSTALL_PREFIX:PATH=/usr/share \
        -DLIB_SUFFIX=64 \
        -DBUILD_SHARED_LIBS:BOOL=ON \
    -DRPM5=1                                    \
    -DFEDORA=1                                    \
    -DENABLE_RPMDB=ON                             \
    -DENABLE_RPMDB_BYRPMHEADER=ON                 \
    -DENABLE_RPMMD=ON                             \
    -DENABLE_COMPS=ON              \
    -DENABLE_APPDATA=ON          \
    -DUSE_VENDORDIRS=ON                           \
    -DENABLE_LZMA_COMPRESSION=ON                  \
    -DENABLE_BZIP2_COMPRESSION=ON                 \
    -DENABLE_DEBIAN=ON       \
    -DENABLE_ARCHREPO=ON       \
    -DENABLE_HELIXREPO=ON     \
    -DMULTI_SYMANTICS=ON \
    -DENABLE_COMPLEX_DEPS=1 \
    -DENABLE_PERL=ON \
    -DENABLE_RUBY=ON \
	../
