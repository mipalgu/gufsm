# Makefile for libclfsm tests

.include "../../../../mk/c++11.mk"	# use C++11

SPECIFIC_LDFLAGS+=-Wl,-rpath -Wl,/usr/local/lib
SPECIFIC_LIBS+=-lclfsm -lgtest -lgtest_main -ldl
SPECIFIC_CPPFLAGS+= -I.. -I${GUNAO_DIR}/Common
CC_SRCS=libclfsm_tests.cc

ALL_TARGETS=host

.include "../../../../mk/mipal.mk"		# comes last!
