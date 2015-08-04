#
#	$Id$
#
# Makefile for pre- and cross-compiling .machine files
#
MACHINES=MultiMachine
MODULE=TEST_MULTIMACHINES

ALL_TARGETS?=host-local test

all: all-real

CLFSM_DIR=${MODULE_DIR}/..
CLFSM=${CLFSM_DIR}/build.host/clfsm
COUNT=1 2 3 4 5 6 7 8 9 10 11

.for i in ${COUNT}
.for machine in ${MACHINES}
args     := ${machine} ${args}
args${i} := ${args}
.endfor
.endfor

host-local: ${CLFSM}
${CLFSM}:
	$E[ -x ${CLFSM:Q} ] || ( cd ${CLFSM_DIR:Q} && ${MAKE} build-host )

test:
.for i in ${COUNT}
	$E${CLFSM} ${args$i}
.endfor

.include "../../../../mk/fsm.mk"	# comes first: required for fsms
.include "../../../../mk/mipal.mk"	# comes last!

