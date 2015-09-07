#
#	$Id$
#
# Makefile for libclfsm
#
MODULE_BASE=clfsm
XCTSCHEME=libclfsm
CI_NAME=${XCTSCHEME}

ALL_TARGETS=host-local robot-local analyse xc tests

CATKIN_BASE=libclfsm
CATKIN_COMPILE_UTIL=YES

XCODE_USE_WORKSPACE=yes

.include "../../../mk/c++11.mk"	# use C++11

#CPPFLAGS+=-g -O0
SPECIFIC_LDFLAGS+=-Wl,-rpath -Wl,/usr/local/lib

C_SRCS=stringConstants.c API_MetaMachine.c API_MetaState.c API_MetaAction.c API_MetaTransition.c API_Util.c API_MetaProperty.c API_MetaMachine_Properties.c API_MetaState_Properties.c API_MetaProperty_Access.c
CC_SRCS=CLActionAction.cc CLTransitionExpression.cc FSMAction.cc FSMActivity.cc FSMExpression.cc FSMFactory.cc FSMState.cc FSMSuspensibleMachine.cc FSMTransition.cc FSMAsynchronousSuspensibleMachine.cc FSMachine.cc FSMachineVector.cc clfsm_factory.cc clfsm_vector_factory.cc clfsm_wb_vector_factory.cc clfsm_cc.cc clfsm_machine.cc clfsm_machine_loader.cc API_Interface.cc
HDRS=CLAction.h CLActionAction.h CLTransitionExpression.h FSMAction.h FSMActivity.h FSMExpression.h FSMFactory.h FSMState.h FSMSuspensibleMachine.h FSMTransition.h FSMAsynchronousSuspensibleMachine.h FSMachine.h FSMachineVector.h clfsm_factory.h CLTransition.h CLMachine.h CLState.h clfsm_vector_factory.h clfsm_wb_vector_factory.h clfsm_cc.h clfsm_cc_delegate.h clfsm_machine.h clfsm_machine_loader.h  CLReflectIncludes.h stringConstants.h
HDRS+=API_Result.h API_Type.h API_Util.h CLReflectFunctionPointerTypes.h API_Interface.h API_MetaMachine.h API_MetaMachine_Properties.h API_MetaState.h API_MetaState_Properties.h API_MetaTransition.h API_MetaAction.h API_MetaProperty.h API_MetaMachine_Internal.h API_MetaProperty_Access.h CLMetaRegister.h CLReflectAPI.h
HDRS+=CLMacros.h CLWhiteboard.h ExecComStruct.h FSMWBContext.h FSMWBPredicate.h FSMWBQueryPredicate.h FSMWBSubMachine.h
INSTHDRS=CLMacros.h CLWhiteboard.h

.include "../../../mk/whiteboard.mk"	# required for whiteboard clients
.include "../../../mk/util.mk"		# required for GU utility functions

.for hdr in WBFunctor.h WBMsg.h
CATKIN_HDRS+=${WB_DIR}/${hdr}
.endfor

CATKIN_HDRS+=${INSTHDRS}

.if ${LOCAL} != _LOCAL
host: host-local
	echo "Use 'make host-local' instead of 'make host'"

upload-robot:
	mkdir -p -m 0755 ${DESTDIR}${PREFIX:Q}/include/clfsm
	mkdir -p -m 0755 ${DESTDIR}${PREFIX:Q}/lib
	[ ! -e /usr/bin/install_name_tool ] || \
	  /usr/bin/install_name_tool -id ${PREFIX:Q}/lib/${OUTFILE_LOCAL:Q} ${BUILDDIR}-local/*${SOEXT}*
	cd ${BUILDDIR}-local && \
	install -m 0755 *${SOEXT}* ${DESTDIR}${PREFIX:Q}/lib
.for hdr in ${INSTHDRS}
	cd ${SRCDIR}/../clfsm && \
	install -m 0644 ${hdr} /usr/local/include/clfsm
.endfor
.endif

tests:
	${MAKE} -C libclfsmTests tests


install: host-local
	mkdir -p -m 0755 /usr/local/include/clfsm
	mkdir -p -m 0755 /usr/local/lib
	cd ${BUILDDIR}-local && \
	install -m 0755 *${SOEXT}* /usr/local/lib
.for hdr in ${INSTHDRS}
	cd ${SRCDIR} && \
	if [ -d ${hdr:Q} ]; then \
	  cp -pR ${hdr:Q} /usr/local/include/clfsm;\
	else \
	  install -m 0644 ${hdr} /usr/local/include/clfsm;\
	fi
.endfor


pre-catkin:
	$Emkdir -p ${CATKIN_DIR}/include/typeClassDefs
.for hfile in FSM_Control.h FSMControlStatus.h wb_fsm_control_status.h wb_fsm_state_status.h
	$Ecp -p ${WB_DIR}/typeClassDefs/${hfile} ${CATKIN_DIR}/include/typeClassDefs
.endfor

.include "../../../mk/mipal.mk"		# comes last!
