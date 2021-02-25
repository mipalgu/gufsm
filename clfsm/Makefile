#
#	$Id$
#
# clfsm Makefile
#
ALL_TARGETS=build-host analyse xc doc

SKIP_TESTS=yes	## test target is defined below
TEST_MACHINES=SpeedTest			## machines to run for testing
CI_SERVER_DOC_SUBDIR=utils
XCODE_USE_WORKSPACE=yes

all: all-real

host: build-host

robot: build-robot

atom1: build-atom1

.include "clfsm_hdrs.mk"                # include the clfsm HDRS here so they are put in HDRS when the documentation target comes looking. 
IGNORED_HDRS=${HDRS}
HDRS=
#also add additional HDRS that the doc target should see
HDRS+= CLAction.h
HDRS+= CLMachine.h
HDRS+= CLMacros.h
HDRS+= CLState.h
HDRS+= CLTransition.h
HDRS+= CLWhiteboard.h

.include "../../../mk/c++11.mk"         # use C++11
.include "../../../mk/whiteboard.mk"	# not really, but for catkin

copy-stuff:
	mkdir -p ${BUILDDIR}
	rm -rf ${BUILDDIR}/${BUILDDIR}
	cp -p clfsm_hdrs.mk ${BUILDDIR}
	cp -p ../gufsm/*.c*  ../gufsm/*.h ${BUILDDIR}
	cp -p *.c* *.h *.1 ${BUILDDIR}
	cp -p Makefile.in ${BUILDDIR}/Makefile
	cd ${BUILDDIR} && ln -s . ${BUILDDIR}

build-host: copy-stuff
	cd ${BUILDDIR} && ${MAKE} host WANT_FSM_REFLECTION=${WANT_FSM_REFLECTION}

build-robot:
	mkdir -p ${DEFAULT_TARGET_BUILDDIR}
	rm -rf ${DEFAULT_TARGET_BUILDDIR}/${DEFAULT_TARGET_BUILDDIR}
	cp -p clfsm_hdrs.mk ${DEFAULT_TARGET_BUILDDIR}
	cp -p ../gufsm/*.c*  ../gufsm/*.h ${DEFAULT_TARGET_BUILDDIR}
	cp -p *.c* *.h ${DEFAULT_TARGET_BUILDDIR}
	cp -p Makefile.in ${DEFAULT_TARGET_BUILDDIR}/Makefile
	cd ${DEFAULT_TARGET_BUILDDIR} && ln -s . ${DEFAULT_TARGET_BUILDDIR}
	cd ${DEFAULT_TARGET_BUILDDIR} && ${MAKE} robot WANT_FSM_REFLECTION=${WANT_FSM_REFLECTION}
	mkdir -p ${DEFAULT_TARGET_BUILDDIR_${RMODEL}:Q}
	cp -p ${DEFAULT_TARGET_BUILDDIR}/${DEFAULT_TARGET_BUILDDIR_${RMODEL}:Q}/clfsm ${DEFAULT_TARGET_BUILDDIR_${RMODEL}:Q}/clfsm

build-atom1:
	mkdir -p ${DEFAULT_TARGET_BUILDDIR}
	rm -rf ${DEFAULT_TARGET_BUILDDIR}/${DEFAULT_TARGET_BUILDDIR}
	cp -p clfsm_hdrs.mk ${DEFAULT_TARGET_BUILDDIR}
	cp -p ../gufsm/*.c*  ../gufsm/*.h ${DEFAULT_TARGET_BUILDDIR}
	cp -p *.c* *.h ${DEFAULT_TARGET_BUILDDIR}
	cp -p Makefile.in ${DEFAULT_TARGET_BUILDDIR}/Makefile
	cd ${DEFAULT_TARGET_BUILDDIR} && ln -s . ${DEFAULT_TARGET_BUILDDIR}
	cd ${DEFAULT_TARGET_BUILDDIR} && ${MAKE} atom1 WANT_FSM_REFLECTION=${WANT_FSM_REFLECTION}


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
