# Makefile for libclfsm tests

MODULE_BASE=clfsm
CI_NAME=libclfsm

.include "../../../mk/c++11.mk"	# use C++11

CPPFLAGS+=-g -O0
SPECIFIC_LDFLAGS+=-Wl,-rpath -Wl,/usr/local/lib -lclfsm -lgtest -lgtest_main

HDRS=libclfsm_tests

test:

.include "../../../mk/mipal.mk"		# comes last!
