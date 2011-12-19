#
#	$Id$
#
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
CC_SRCS+=FSMVectorFactory.cc
CC_SRCS+=FSMWBContext.cc
CC_SRCS+=FSMWBPredicate.cc
CC_SRCS+=FSMWBQueryPredicate.cc
CC_SRCS+=FSMWBSubMachine.cc
CC_SRCS+=FSMWBSubMachineFactory.cc
CC_SRCS+=FSMachine.cc
CC_SRCS+=FSMachineVector.cc
C_SRCS=parser_walk.c stringConstants.c
HDRS+=ActivityFactory.h
HDRS+=FSM.h
HDRS+=FSMANTLRAction.h
HDRS+=FSMANTLRContext.h
HDRS+=FSMANTLRExpression.h
HDRS+=FSMAction.h
HDRS+=FSMActivity.h
HDRS+=FSMExpression.h
HDRS+=FSMState.h
HDRS+=FSMSuspensibleMachine.h
HDRS+=FSMTransition.h
HDRS+=FSMVectorFactory.h
HDRS+=FSMWB.h
HDRS+=FSMWBContext.h
HDRS+=FSMWBPostAction.h
HDRS+=FSMWBPredicate.h
HDRS+=FSMWBQueryPredicate.h
HDRS+=FSMWBSubMachine.h
HDRS+=FSMWBSubMachineFactory.h
HDRS+=FSMachine.h
HDRS+=FSMachineVector.h
HDRS+=TransitionFactory.h
HDRS+=parser_walk.h
HDRS+=stringConstants.h

ANTLR_COMBINED=TransitionContainer.g ActionsContainer.g
ANTLR_INCLUDES=SimpleCParser.g
ANTLR_GRAMMARS=SimpleCLexer.g

#CLANG_CXXFLAGS=-std=c++0x
#TARGET_USE_CLANG=YES

#.include "../../../mk/boost.mk"		# required for boost
.include "../../../mk/antlr.mk"		# required for grammar parsing
.include "../../../mk/whiteboard.mk"	# required for the whiteboard
.include "../../../mk/util.mk"		# required for gu_util
.include "../../../mk/mipal.mk"
