#
#	$Id$
#
# Makefile for libclfsm
#
MODULE_BASE=clfsm

ALL_TARGETS=host-local robot-local

.include "../../../mk/libcxx.mk"	# use C++11 and libc++

SPECIFIC_LDFLAGS+=-Wl,-rpath -Wl,/usr/local/lib

C_SRCS=stringConstants.c
CC_SRCS=CLActionAction.cc CLTransitionExpression.cc FSMAction.cc FSMActivity.cc FSMExpression.cc FSMFactory.cc FSMState.cc FSMSuspensibleMachine.cc FSMTransition.cc FSMAsynchronousSuspensibleMachine.cc FSMachine.cc FSMachineVector.cc clfsm_factory.cc clfsm_vector_factory.cc clfsm_wb_vector_factory.cc
HDRS=CLAction.h CLActionAction.h CLTransitionExpression.h FSMAction.h FSMActivity.h FSMExpression.h FSMFactory.h FSMState.h FSMSuspensibleMachine.h FSMTransition.h FSMAsynchronousSuspensibleMachine.h FSMachine.h FSMachineVector.h clfsm_factory.h CLTransition.h CLMachine.h CLState.h clfsm_vector_factory.h clfsm_wb_vector_factory.h stringConstants.h
INSTHDRS=CLMacros.h CLWhiteboard.h

.include "../../../mk/whiteboard.mk"	# required for whiteboard clients
.include "../../../mk/util.mk"		# required for GU utility functions

.if ${LOCAL} != _LOCAL
host: host-local
	echo "Use 'make host-local' instead of 'make host'"

install:
	mkdir -p -m 0755 /usr/local/include/clfsm
	mkdir -p -m 0755 /usr/local/lib
	cd ${BUILDDIR}-local && \
	install -m 0755 *${SOEXT}* /usr/local/lib
.for hdr in ${INSTHDRS}
	cd ${SRCDIR}/../clfsm && \
	install -m 0644 ${hdr} /usr/local/include/clfsm
.endfor
.endif

CATKIN_WS=${SRCDIR}/catkin_ws
CATKIN_DIR=${CATKIN_WS}/src/${SOPREFIX}${BIN_BASE}

clean: catkin-clean

catkin:
	$Emkdir -p ${CATKIN_DIR}/src
	$Emkdir -p ${CATKIN_DIR}/include/typeClassDefs
.for src in ${C_SRCS} ${CC_SRCS}
	$Ecp -p ${SRCDIR}/${src} ${CATKIN_DIR}/src
.endfor
.for hdr in ${HDRS} ${INSTHDRS}
	$Ecp -p ${SRCDIR}/${hdr} ${CATKIN_DIR}/include
.endfor
	$Ecp -p ${WB_DIR}/typeClassDefs/FSM_Control.h ${CATKIN_DIR}/include/typeClassDefs
.for hdr in ${NEW_WHITEBOARD_HDRS} ${WHITEBOARD_PRIVATE_HDRS} WBFunctor.h WBMsg.h
	$Ecp -p ${WB_DIR}/${hdr} ${CATKIN_DIR}/include
.endfor
	$Ecp -p ${COMMON_DIR}/gu_util.h ${CATKIN_DIR}/include
	$Ecp -p ${COMMON_DIR}/gu_util.cpp ${CATKIN_DIR}/src
	$Eecho done.

catkin-clean:
	rm -rf ${CATKIN_DIR}/src
	rm -rf ${CATKIN_DIR}/include
	rm -rf ${CATKIN_WS}/build
	rm -rf ${CATKIN_WS}/devel
	rm -rf ${CATKIN_WS}/src/CMakeLists.txt

.include "../../../mk/mipal.mk"		# comes last!
