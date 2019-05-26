#
#	$Id$
#
# Makefile for pre- and cross-compiling .machine files
#
MACHINES=Suspend Suspend_is_Accepting Suspend_Resume_Restart Schedule_Suspend TestOnSuspend TestOnResume
MODULE=TEST_SUSPEND

ALL_TARGETS?=host-local test

all: all-real

CLFSM_DIR=${MODULE_DIR}/..
CLFSM=${CLFSM_DIR}/build.host/clfsm

host-local: ${CLFSM}
${CLFSM}:
	$E[ -x ${CLFSM:Q} ] || ( cd ${CLFSM_DIR:Q} && ${MAKE} build-host )

test: ${OUTFILE}
	$E${CLFSM} -vs Suspend Suspend &&				\
		( cd /tmp && rm test_suspend_ok )
	$E${CLFSM} -vs Suspend_is_Accepting &&				\
		( cd /tmp && rm test_suspend_is_accepting_ok )
	$E${CLFSM} -vs Suspend_Resume_Restart Suspend_Resume_Restart &&	\
		( cd /tmp && rm test_concurrent_suspend_resume_ok )
	$E${CLFSM} -vs Schedule_Suspend Schedule_Suspend &&	\
		( cd /tmp && rm test_schedule_suspend_accepting_ok )
	$E${CLFSM} -vs TestOnSuspend &&				\
		( cd /tmp && rm test_on_suspend_ok )

.include "../../../../mk/fsm.mk"	# comes first: required for fsms
.include "../../../../mk/mipal.mk"	# comes last!

