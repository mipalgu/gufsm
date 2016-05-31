MACHINES=VariableTests SupportedTypesTest MachineControlTest WhiteboardVariableTest
MODULE=ReflectTestMachines

ALL_TARGETS?=host-local tests
MAKEFLAGS+="WANT_FSM_REFLECTION=yes" ## so we get reflection by default
CLFSM_WFLAGS= -Wno-double-promotion -Wno-format-pedantic -Werror -Wall -Wno-unknown-pragmas -Wno-padded -Wno-unused-variable -Wno-unknown-warning-option -Wno-reserved-id-macro

all: all-real

tests: host-local
	(cd CPingPong.machine && ${MAKE} host-local)
	(cd CPingPongKripke.machine && ${MAKE} host-local)

.include "../../../../../mk/fsm.mk"	# comes first: required for fsms
.include "../../../../../mk/mipal.mk"	# comes last!
