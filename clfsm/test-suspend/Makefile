#
#	$Id$
#
# Makefile for pre- and cross-compiling .machine files
#
MACHINES=Suspend Suspend_is_Accepting
MODULE=TEST_SUSPEND

ALL_TARGETS?=test

all: all-real

CLFSM_DIR=${MODULE_DIR}/..
CLFSM=${CLFSM_DIR}/build.host/clfsm

test: ${OUTFILE}
	$E[ -x ${CLFSM:Q} ] || ( cd ${CLFSM_DIR:Q} && ${MAKE} ${MAKEFLAGS} host )
	$E${CLFSM} -vs Suspend Suspend &&				\
		( cd /tmp && rm test_suspend_ok )
	$E${CLFSM} -vs Suspend_is_Accepting &&				\
		( cd /tmp && rm test_suspend_is_accepting_ok )

.include "../../../../mk/fsm.mk"	# comes first: required for fsms
.include "../../../../mk/mipal.mk"	# comes last!

