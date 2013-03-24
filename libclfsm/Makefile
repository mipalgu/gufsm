#
#	$Id$
#
# Makefile for libclfsm
#
MODULE_BASE=clfsm

ALL_TARGETS=host-local robot-local

C_SRCS=stringConstants.c
CC_SRCS=CLActionAction.cc CLTransitionExpression.cc FSMAction.cc FSMActivity.cc FSMExpression.cc FSMFactory.cc FSMState.cc FSMSuspensibleMachine.cc FSMTransition.cc FSMWBContext.cc FSMWBPredicate.cc FSMWBQueryPredicate.cc FSMWBSubMachine.cc FSMachine.cc FSMachineVector.cc clfsm_factory.cc clfsm_vector_factory.cc
HDRS=CLAction.h CLActionAction.h CLTransitionExpression.h FSMAction.h FSMActivity.h FSMExpression.h FSMFactory.h FSMState.h FSMSuspensibleMachine.h FSMTransition.h FSMWBContext.h FSMWBPredicate.h FSMWBQueryPredicate.h FSMWBSubMachine.h FSMachine.h FSMachineVector.h clfsm_factory.h CLTransition.h clfsm_vector_factory.h stringConstants.h
INSTHDRS=CLMacros.h CLWhiteboard.h

.include "../../../mk/whiteboard.mk"	# required for whiteboard clients
.include "../../../mk/util.mk"		# required for GU utility functions

install:
	mkdir -p -m 0755 /usr/local/include/clfsm
	mkdir -p -m 0755 /usr/local/lib
	cd ${BUILDDIR}-local && \
	install -m 0755 *${SOEXT}* /usr/local/lib
.for hdr in ${INSTHDRS}
	cd ${SRCDIR}/../clfsm && \
	install -m 0644 ${hdr} /usr/local/include/clfsm
.endfor

.include "../../../mk/mipal.mk"		# comes last!
