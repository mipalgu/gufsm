# Makefile for libclfsm tests

.include "../../../../mk/c++11.mk"	# use C++11

SPECIFIC_LDFLAGS+=-Wl,-rpath -Wl,/usr/local/lib
SPECIFIC_LIBS+=-lclfsm -lgtest -lgtest_main -ldl # Link CLFSM and GTest + dlopen()
SPECIFIC_CPPFLAGS+= -I.. -I${GUNAO_DIR}/Common -I${GUNAO_DIR}/Common/Whiteboard.Classes -I${POSIX_DIR}/gufsm/libclfsm/libclfsmTests/ReflectTestMachines/VariableTests.machine
SPECIFIC_CPPFLAGS+= -I${POSIX_DIR}/gufsm/libclfsm/libclfsmTests/ReflectTestMachines/SupportedTypesTest.machine
SPECIFIC_CPPFLAGS+= -I${POSIX_DIR}/gufsm/libclfsm/libclfsmTests/ReflectTestMachines/MachineControlTest.machine
SPECIFIC_CPPFLAGS+= -I${POSIX_DIR}/gufsm/libclfsm/libclfsmTests/ReflectTestMachines/WhiteboardVariableTest.machine
CC_SRCS!=echo *.cc

HDRS+=DummyMachines.h

run-test:  host
	(cd ReflectTestMachines && ${MAKE} tests)
	${SAY} "------------------------"
	${SAY} "Running libclfsmTests..."
	cd ${POSIX_DIR}/gufsm/libclfsm/libclfsmTests/build.host && ./libclfsmTests
	${SAY} "------------------------"

tests:
	${SAY} "Checking that GTest is installed..."
	if [ -e /usr/local/lib/libgtest.* ]; \
	then \
		${MAKE} run-test; \
	else \
		echo "Couldn't find gtest"; \
	fi

coverage:
	(cd .. && ${MAKE} host-local CODE_COVERAGE=yes && sudo ${MAKE} install)
	-${MAKE} run-test CODE_COVERAGE=yes # Segfaults at end but still seems to work
	(cd ../build.host-local &&  \
		lcov --quiet --directory . --base-directory . --gcov-tool gcov-4.4 --capture -o cov.info && \
		genhtml --quiet cov.info -o ${HOME}/html_output)

.include "../../../../mk/mipal.mk"		# comes last!
