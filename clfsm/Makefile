#
#	$Id$
#
# clfsm Makefile
#
ALL_TARGETS=host robot

all: all-real

host: build-host

robot: build-robot

.include "../../../mk/libcxx.mk"	# use C++11 and libc++

build-host:
	mkdir -p ${BUILDDIR}
	rm -rf ${BUILDDIR}/${BUILDDIR}
	cp -p ../gufsm/*.c*  ../gufsm/*.h ${BUILDDIR}
	cp -p *.c* *.h ${BUILDDIR}
	cp -p Makefile.in ${BUILDDIR}/Makefile
	cd ${BUILDDIR} && ln -s . ${BUILDDIR}
	cd ${BUILDDIR} && ${MAKE} host

build-robot:
	mkdir -p ${DEFAULT_TARGET_BUILDDIR}
	rm -rf ${DEFAULT_TARGET_BUILDDIR}/${DEFAULT_TARGET_BUILDDIR}
	cp -p ../gufsm/*.c*  ../gufsm/*.h ${DEFAULT_TARGET_BUILDDIR}
	cp -p *.c* *.h ${DEFAULT_TARGET_BUILDDIR}
	cp -p Makefile.in ${DEFAULT_TARGET_BUILDDIR}/Makefile
	cd ${DEFAULT_TARGET_BUILDDIR} && ln -s . ${DEFAULT_TARGET_BUILDDIR}
	cd ${DEFAULT_TARGET_BUILDDIR} && ${MAKE} robot

CATKIN_WS=${SRCDIR}/catkin_ws
CATKIN_DIR=${CATKIN_WS}/src/${BIN_BASE}

clean: catkin-clean

catkin:
	$Emkdir -p ${CATKIN_DIR}/src
	$Emkdir -p ${CATKIN_DIR}/include
	$Ecp -p ../gufsm/*.c* ${CATKIN_DIR}/src
	$Ecp -p ../gufsm/*.h ${CATKIN_DIR}/include
	$Ecp -p *.c* *.h ${CATKIN_DIR}/src
	$Ecp -p *.h ${CATKIN_DIR}/include
	#$Ecp -p ${WB_DIR}/typeClassDefs/FSM_Control.h ${CATKIN_DIR}/include/typeClassDefs
#.for hdr in ${NEW_WHITEBOARD_HDRS} ${WHITEBOARD_PRIVATE_HDRS} WBFunctor.h WBMsg.h
	#$Ecp -p ${WB_DIR}/${hdr} ${CATKIN_DIR}/include
#.endfor
	$Ecp -p ${COMMON_DIR}/gu_util.h ${CATKIN_DIR}/include
	$Eecho done.

catkin-clean:
	rm -rf ${CATKIN_DIR}/src
	rm -rf ${CATKIN_DIR}/include
	rm -rf ${CATKIN_WS}/build
	rm -rf ${CATKIN_WS}/devel
	rm -rf ${CATKIN_WS}/src/CMakeLists.txt

.include "../../../mk/mipal.mk"		# comes last!
