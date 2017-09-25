MACHINES=VariableTests MachineControlTest WhiteboardVariableTest
MODULE=ReflectTestMachines

ALL_TARGETS?=host-local tests
CLFSM_WFLAGS= -Wno-double-promotion -Wno-format-pedantic -Werror -Wall -Wno-unknown-pragmas -Wno-padded -Wno-unused-variable -Wno-unknown-warning-option -Wno-reserved-id-macro

all: all-real

tests: host-local

.include "../../../../../mk/fsm.mk"	# comes first: required for fsms
.include "../../../../../mk/mipal.mk"	# comes last!
