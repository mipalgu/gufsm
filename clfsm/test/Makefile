#
#	$Id$
#
# Makefile for pre- and cross-compiling .machine files
#
MACHINES=SpeedTest

ALL_TARGETS?=host-local test

all: all-real

CLFSM_DIR=${MODULE_DIR}/..
CLFSM=${CLFSM_DIR}/build.host/clfsm

SPECIFIC_CPPFLAGS+=-fblocks

host-local: ${CLFSM}
${CLFSM}:
	$E[ -x ${CLFSM:Q} ] || ( cd ${CLFSM_DIR:Q} && ${MAKE} build-host )

test:
.for machine in ${MACHINES}
	$E${CLFSM} ${machine}
.endfor

.include "../../../../mk/fsm.mk"	# comes first: required for fsms
.include "../../../../mk/mipal.mk"	# comes last!

