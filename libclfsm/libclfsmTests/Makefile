# Makefile for libclfsm tests

.include "../../../../mk/c++11.mk"	# use C++11

SPECIFIC_LDFLAGS+=-Wl,-rpath -Wl,/usr/local/lib
SPECIFIC_LIBS+=-lclfsm -lgtest -lgtest_main -ldl # Link CLFSM and GTest + dlopen()
SPECIFIC_CPPFLAGS+= -I.. -I${GUNAO_DIR}/Common
CC_SRCS=VectorFactory_tests.cc ReflectAPI_Init_Tests.cc

run-test: host
	${SAY} "------------------------"
	${SAY} "Running libclfsmTests..."
	cd build.host && ./libclfsmTests
	${SAY} "------------------------"

.include "../../../../mk/mipal.mk"		# comes last!
