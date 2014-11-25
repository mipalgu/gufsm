#
#	$Id$
#
USE_CDL_BRIDGE=yes

CPP_SRCS=main.cpp ActivityFactory.cpp TransitionFactory.cpp
CC_SRCS= FSMANTLRAction.cc
CC_SRCS+=FSMANTLRContext.cc
CC_SRCS+=FSMANTLRExpression.cc
CC_SRCS+=FSMAction.cc
CC_SRCS+=FSMActivity.cc
CC_SRCS+=FSMExpression.cc
CC_SRCS+=FSMState.cc
CC_SRCS+=FSMSuspensibleMachine.cc
CC_SRCS+=FSMTransition.cc
CC_SRCS+=FSMANTLRVectorFactory.cc
CC_SRCS+=FSMWBContext.cc
CC_SRCS+=FSMWBPredicate.cc
CC_SRCS+=FSMWBQueryPredicate.cc
CC_SRCS+=FSMWBSubMachine.cc
CC_SRCS+=FSMAsynchronousSuspensibleMachine.cc
CC_SRCS+=FSMachine.cc
CC_SRCS+=FSMachineVector.cc
CC_SRCS+=FSMANTLRMachineVector.cc
CC_SRCS+=FSMANTLRMachineFactory.cc
CC_SRCS+=FSMVectorRunner.cc
CC_SRCS+=FSMFactory.cc
C_SRCS=parser_walk.c stringConstants.c
HDRS+=ActivityFactory.h
HDRS+=FSM.h
HDRS+=FSMANTLRAction.h
HDRS+=FSMANTLRContext.h
HDRS+=FSMANTLRExpression.h
HDRS+=FSMANTLRMaths.h
HDRS+=FSMAction.h
HDRS+=FSMActivity.h
HDRS+=FSMExpression.h
HDRS+=FSMState.h
HDRS+=FSMSuspensibleMachine.h
HDRS+=FSMTransition.h
HDRS+=FSMANTLRVectorFactory.h
HDRS+=FSMANTLRMachineVector.h
HDRS+=FSMANTLRMachineFactory.h
HDRS+=FSMWB.h
HDRS+=FSMWBContext.h
HDRS+=FSMWBPostAction.h
HDRS+=FSMWBPredicate.h
HDRS+=FSMWBQueryPredicate.h
HDRS+=FSMWBSubMachine.h
HDRS+=FSMAsynchronousSuspensibleMachine.h
HDRS+=FSMachine.h
HDRS+=FSMachineVector.h
HDRS+=FSMVectorRunner.h
HDRS+=FSMFactory.h
HDRS+=TransitionFactory.h
HDRS+=parser_walk.h
HDRS+=stringConstants.h


ANTLR_COMBINED=TransitionContainer.g ActionsContainer.g
ANTLR_INCLUDES=SimpleCParser.g
ANTLR_GRAMMARS=SimpleCLexer.g

#CLANG_CXXFLAGS=-std=c++0x
#TARGET_USE_CLANG=YES

.include "../../../mk/c++11.mk"	# needs to come first
.include "../../../mk/antlr.mk"		# required for grammar parsing
USE_OLD_WHITEBOARD=yes
.include "../../../mk/whiteboard.mk"	# required for the whiteboard
.include "../../../mk/cdlengine.mk"	# required for the whiteboard
.include "../../../mk/util.mk"		# required for gu_util

SPECIFIC_CPPFLAGS+=${CDL_CPPFLAGS} 	# for CDL includes
SPECIFIC_CPPFLAGS+=-DMONITORING_MODE_ON

.include "../../../mk/mipal.mk"

analyse: ${ANTLR_OBJS}
