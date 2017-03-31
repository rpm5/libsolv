#!/bin/sh

rm -rf build

mkdir build
cd build

cmake \
	-DCMAKE_BUILD_TYPE:STRING=DEBUG \
        -DCMAKE_C_FLAGS:STRING="-I/opt/local/include -I/opt/local/rpm -I/usr/include/db62"\
        -DCMAKE_C_FLAGS_RELEASE:STRING="-DNDEBUG" \
        -DCMAKE_VERBOSE_MAKEFILE:BOOL=ON \
        -DCMAKE_INSTALL_PREFIX:PATH=/opt/local \
	-DCMAKE_INSTALL_RPATH:PATH=/opt/local/lib \
        -DINCLUDE_INSTALL_DIR:PATH=/opt/local/include \
        -DLIB_INSTALL_DIR:PATH=/opt/local/lib \
	-DSYSCONF_INSTALL_DIR:PATH=/opt/local/etc \
        -DBUILD_SHARED_LIBS:BOOL=ON \
    -DSANITIZE_ADDRESS:BOOL=ON \
    -DSANITIZE_MEMORY:BOOL=OFF \
    -DSANITIZE_THREAD:BOOL=OFF \
    -DSANITIZE_UNDEFINED:BOOL=OFF \
    -DRPM5=1 \
    -DMACOSX=0 \
    -DFEDORA=1 \
    -DENABLE_RPMDB=ON \
    -DENABLE_RPMDB_BYRPMHEADER=ON \
    -DENABLE_RPMMD=ON \
    -DENABLE_COMPS=ON \
    -DENABLE_APPDATA=ON \
    -DUSE_VENDORDIRS=ON \
    -DENABLE_LZMA_COMPRESSION=ON \
    -DENABLE_BZIP2_COMPRESSION=ON \
    -DENABLE_DEBIAN=ON \
    -DENABLE_ARCHREPO=ON \
    -DENABLE_HELIXREPO=ON \
    -DMULTI_SEMANTICS=ON \
    -DENABLE_COMPLEX_DEPS=1 \
    -DENABLE_PERL=OFF \
    -DENABLE_RUBY=OFF \
    -DENABLE_PYTHON=OFF \
    -DPythonLibs_FIND_VERSION=2       \
    -DPythonLibs_FIND_VERSION_MAJOR=2 \
	../

make -O -j8 && make ARGS="-VV --debug" test && sudo make install

#otool -L /opt/local/lib/libsolv.0.dylib
