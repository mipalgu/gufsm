#
#	$Id$
#
# clfsm Makefile
#
ALL_TARGETS=build-host do-catkin analyse xc doc

DONT_COMPLAIN_ABOUT_TEST_TARGET=yes	## test target is defined below
TEST_MACHINES=SpeedTest			## machines to run for testing
CI_SERVER_DOC_SUBDIR=utils
XCODE_USE_WORKSPACE=yes

all: all-real

host: build-host

robot: build-robot

.include "../../../mk/c++11.mk"         # use C++11
.include "../../../mk/whiteboard.mk"	# not really, but for catkin

CPPFLAGS+=-g -O0

copy-stuff:
	mkdir -p ${BUILDDIR}
	rm -rf ${BUILDDIR}/${BUILDDIR}
	cp -p ../gufsm/*.c*  ../gufsm/*.h ${BUILDDIR}
	cp -p *.c* *.h ${BUILDDIR}
	cp -p CLReflect/*.c* CLReflect/*.h ${BUILDDIR}
	cp -p Makefile.in ${BUILDDIR}/Makefile
	cd ${BUILDDIR} && ln -s . ${BUILDDIR}

build-host: copy-stuff
	cd ${BUILDDIR} && ${MAKE} host

build-robot:
	mkdir -p ${DEFAULT_TARGET_BUILDDIR}
	rm -rf ${DEFAULT_TARGET_BUILDDIR}/${DEFAULT_TARGET_BUILDDIR}
	cp -p ../gufsm/*.c*  ../gufsm/*.h ${DEFAULT_TARGET_BUILDDIR}
	cp -p *.c* *.h ${DEFAULT_TARGET_BUILDDIR}
	cp -p CLReflect/*.c* CLReflect/*.h ${DEFAULT_TARGET_BUILDDIR}
	cp -p Makefile.in ${DEFAULT_TARGET_BUILDDIR}/Makefile
	cd ${DEFAULT_TARGET_BUILDDIR} && ln -s . ${DEFAULT_TARGET_BUILDDIR}
	cd ${DEFAULT_TARGET_BUILDDIR} && ${MAKE} robot

do-catkin: copy-stuff
	cd ${BUILDDIR} && ln -fs ${CATKIN_TEMPLATE} ${BUILDDIR}
	cd ${BUILDDIR} && ${MAKE} catkin

test: build-host
.for test in test test-multimachines test-suspend
	cd ${MODULE_DIR}/${test} && ${MAKE} ${MAKEFLAGS}
.endfor
.for machine in ${TEST_MACHINES}
#	$Ecd ${PWD:Q}/test && ${MAKE} host-local MACHINES=${machine} && \
	${PWD:Q}/${BUILDDIR}/clfsm ${machine}
.endfor

clean: clean-test

clean-test:
.for machine in ${TEST_MACHINES}
	$Ecd ${PWD:Q}/test && ${MAKE} clean
.endfor

.include "../../../mk/mipal.mk"		# comes last!
