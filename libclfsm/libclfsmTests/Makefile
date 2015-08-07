# Makefile for libclfsm tests

.include "../../../../mk/c++11.mk"	# use C++11

SPECIFIC_LDFLAGS+=-Wl,-rpath -Wl,/usr/local/lib
SPECIFIC_LIBS+=-lclfsm -lgtest -lgtest_main -ldl # Link CLFSM and GTest + dlopen()
SPECIFIC_CPPFLAGS+= -I.. -I${GUNAO_DIR}/Common
CC_SRCS=VectorFactory_tests.cc ReflectAPI_Init_Tests.cc ReflectAPI_MetaMachine_Tests.cc ReflectAPI_MetaState_Tests.cc ReflectAPI_MetaAction_Tests.cc ReflectAPI_StateMethod_Tests.cc

run-test:  host
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

.include "../../../../mk/mipal.mk"		# comes last!
