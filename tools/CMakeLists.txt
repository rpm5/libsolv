#
# CMakeLists.txt for tools
#
SET (CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/externals/sanitizers-cmake/cmake" ${CMAKE_MODULE_PATH})
FIND_PACKAGE (Sanitizers)

ADD_LIBRARY (toolstuff STATIC common_write.c)
ADD_SANITIZERS (toolstuff)

SET (tools_list mergesolv dumpsolv installcheck testsolv)

IF (ENABLE_RPMDB)
ADD_EXECUTABLE (rpmdb2solv rpmdb2solv.c)
ADD_SANITIZERS (rpmdb2solv)
TARGET_LINK_LIBRARIES (rpmdb2solv toolstuff libsolvext libsolv ${SYSTEM_LIBRARIES})

ADD_EXECUTABLE (findfileconflicts findfileconflicts.c)
ADD_SANITIZERS (findfileconflicts)
TARGET_LINK_LIBRARIES (findfileconflicts libsolvext libsolv ${SYSTEM_LIBRARIES})

SET (tools_list ${tools_list} rpmdb2solv)
ENDIF (ENABLE_RPMDB)

IF (ENABLE_RPMPKG)
ADD_EXECUTABLE (rpms2solv rpms2solv.c)
ADD_SANITIZERS (rpms2solv)
TARGET_LINK_LIBRARIES (rpms2solv toolstuff libsolvext libsolv ${SYSTEM_LIBRARIES})
SET (tools_list ${tools_list} rpms2solv)
ENDIF (ENABLE_RPMPKG)

IF (ENABLE_RPMMD)
ADD_EXECUTABLE (repomdxml2solv repomdxml2solv.c)
ADD_SANITIZERS (repomdxml2solv)
TARGET_LINK_LIBRARIES (repomdxml2solv toolstuff libsolvext libsolv ${SYSTEM_LIBRARIES})

ADD_EXECUTABLE (rpmmd2solv rpmmd2solv.c)
ADD_SANITIZERS (rpmmd2solv)
TARGET_LINK_LIBRARIES (rpmmd2solv toolstuff libsolvext libsolv ${SYSTEM_LIBRARIES})

ADD_EXECUTABLE (updateinfoxml2solv updateinfoxml2solv.c)
ADD_SANITIZERS (updateinfoxml2solv)
TARGET_LINK_LIBRARIES (updateinfoxml2solv toolstuff libsolvext libsolv ${SYSTEM_LIBRARIES})

ADD_EXECUTABLE (deltainfoxml2solv deltainfoxml2solv.c)
ADD_SANITIZERS (deltainfoxml2solv)
TARGET_LINK_LIBRARIES (deltainfoxml2solv toolstuff libsolvext libsolv ${SYSTEM_LIBRARIES})

SET (tools_list ${tools_list} repomdxml2solv rpmmd2solv updateinfoxml2solv deltainfoxml2solv)
ENDIF (ENABLE_RPMMD)

IF (ENABLE_HELIXREPO)
ADD_EXECUTABLE (helix2solv helix2solv.c)
ADD_SANITIZERS (helix2solv)
TARGET_LINK_LIBRARIES (helix2solv toolstuff libsolvext libsolv ${SYSTEM_LIBRARIES})

SET (tools_list ${tools_list} helix2solv)
ENDIF (ENABLE_HELIXREPO)

IF (ENABLE_SUSEREPO)
ADD_EXECUTABLE (susetags2solv susetags2solv.c)
ADD_SANITIZERS (susetags2solv)
TARGET_LINK_LIBRARIES (susetags2solv toolstuff libsolvext libsolv ${SYSTEM_LIBRARIES})

SET (tools_list ${tools_list} susetags2solv)
ENDIF (ENABLE_SUSEREPO)

IF (ENABLE_COMPS)
ADD_EXECUTABLE (comps2solv comps2solv.c)
ADD_SANITIZERS (comps2solv)
TARGET_LINK_LIBRARIES (comps2solv toolstuff libsolvext libsolv ${SYSTEM_LIBRARIES})

SET (tools_list ${tools_list} comps2solv)
ENDIF (ENABLE_COMPS)

IF (ENABLE_DEBIAN)
ADD_EXECUTABLE (deb2solv deb2solv.c)
ADD_SANITIZERS (deb2solv)
TARGET_LINK_LIBRARIES (deb2solv toolstuff libsolvext libsolv ${SYSTEM_LIBRARIES})

SET (tools_list ${tools_list} deb2solv)
ENDIF (ENABLE_DEBIAN)

IF (ENABLE_MDKREPO)
ADD_EXECUTABLE (mdk2solv mdk2solv.c)
ADD_SANITIZERS (mdk2solv)
TARGET_LINK_LIBRARIES (mdk2solv toolstuff libsolvext libsolv ${SYSTEM_LIBRARIES})

SET (tools_list ${tools_list} mdk2solv)
ENDIF (ENABLE_MDKREPO)

IF (ENABLE_ARCHREPO)
ADD_EXECUTABLE (archpkgs2solv archpkgs2solv.c)
ADD_SANITIZERS (archpkgs2solv)
TARGET_LINK_LIBRARIES (archpkgs2solv toolstuff libsolvext libsolv ${SYSTEM_LIBRARIES})

ADD_EXECUTABLE (archrepo2solv archrepo2solv.c)
ADD_SANITIZERS (archrepo2solv)
TARGET_LINK_LIBRARIES (archrepo2solv toolstuff libsolvext libsolv ${SYSTEM_LIBRARIES})

SET (tools_list ${tools_list} archpkgs2solv archrepo2solv)
ENDIF (ENABLE_ARCHREPO)

IF (ENABLE_CUDFREPO)
ADD_EXECUTABLE (cudftest cudftest.c)
ADD_SANITIZERS (cudftest)
TARGET_LINK_LIBRARIES (cudftest libsolvext libsolv ${SYSTEM_LIBRARIES})
ENDIF (ENABLE_CUDFREPO)

ADD_EXECUTABLE (installcheck installcheck.c)
ADD_SANITIZERS (installcheck)
TARGET_LINK_LIBRARIES (installcheck libsolvext libsolv ${SYSTEM_LIBRARIES})

IF (SUSE)
ADD_EXECUTABLE (patchcheck patchcheck.c)
ADD_SANITIZERS (patchcheck)
TARGET_LINK_LIBRARIES (patchcheck libsolvext libsolv ${SYSTEM_LIBRARIES})
ENDIF (SUSE)

IF (ENABLE_APPDATA)
ADD_EXECUTABLE (appdata2solv appdata2solv.c)
ADD_SANITIZERS (appdata2solv)
TARGET_LINK_LIBRARIES (appdata2solv toolstuff libsolvext libsolv ${SYSTEM_LIBRARIES})

SET (tools_list ${tools_list} appdata2solv)
ENDIF (ENABLE_APPDATA)

ADD_EXECUTABLE (dumpsolv dumpsolv.c )
ADD_SANITIZERS (dumpsolv)
TARGET_LINK_LIBRARIES (dumpsolv libsolv)

ADD_EXECUTABLE (mergesolv mergesolv.c )
ADD_SANITIZERS (mergesolv )
TARGET_LINK_LIBRARIES (mergesolv toolstuff libsolvext libsolv ${SYSTEM_LIBRARIES})

ADD_EXECUTABLE (testsolv testsolv.c)
ADD_SANITIZERS (testsolv)
TARGET_LINK_LIBRARIES (testsolv libsolvext libsolv ${SYSTEM_LIBRARIES})

INSTALL (TARGETS ${tools_list} DESTINATION ${BIN_INSTALL_DIR})

INSTALL (PROGRAMS repo2solv.sh DESTINATION ${BIN_INSTALL_DIR})
