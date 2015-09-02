MACHINES=VariableTests
MODULE=TEST_SUSPEND

ALL_TARGETS?=host-local test
MAKEFLAGS+="WANT_FSM_REFLECTION=yes" ## so we get reflection by default

all: all-real


.include "../../../../../mk/fsm.mk"	# comes first: required for fsms
.include "../../../../../mk/mipal.mk"	# comes last!
