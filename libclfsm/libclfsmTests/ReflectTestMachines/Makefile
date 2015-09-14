MACHINES=VariableTests SupportedTypesTest MachineControlTest
MODULE=ReflectTestMachines

ALL_TARGETS?=tests
MAKEFLAGS+="WANT_FSM_REFLECTION=yes" ## so we get reflection by default

all: all-real

tests: host-local
	(cd CPingPong.machine && ${MAKE} host-local)

.include "../../../../../mk/fsm.mk"	# comes first: required for fsms
.include "../../../../../mk/mipal.mk"	# comes last!
