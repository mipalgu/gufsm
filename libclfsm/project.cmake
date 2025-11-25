# Sources for the libclfsm library.
# This library provides the runtime support for C-Like FSMs (clfsm).

set(LIBCLFSM_SOURCES
    ${CMAKE_CURRENT_SOURCE_DIR}/../gufsm/stringConstants.c
    ${CMAKE_CURRENT_SOURCE_DIR}/../clfsm/CLActionAction.cc
    ${CMAKE_CURRENT_SOURCE_DIR}/../clfsm/CLTransitionExpression.cc
    ${CMAKE_CURRENT_SOURCE_DIR}/../gufsm/FSMAction.cc
    ${CMAKE_CURRENT_SOURCE_DIR}/../gufsm/FSMActivity.cc
    ${CMAKE_CURRENT_SOURCE_DIR}/../gufsm/FSMExpression.cc
    ${CMAKE_CURRENT_SOURCE_DIR}/../gufsm/FSMFactory.cc
    ${CMAKE_CURRENT_SOURCE_DIR}/../gufsm/FSMState.cc
    ${CMAKE_CURRENT_SOURCE_DIR}/../gufsm/FSMSuspensibleMachine.cc
    ${CMAKE_CURRENT_SOURCE_DIR}/../gufsm/FSMTransition.cc
    ${CMAKE_CURRENT_SOURCE_DIR}/../gufsm/FSMAsynchronousSuspensibleMachine.cc
    ${CMAKE_CURRENT_SOURCE_DIR}/../gufsm/FSMachine.cc
    ${CMAKE_CURRENT_SOURCE_DIR}/../gufsm/FSMachineVector.cc
    ${CMAKE_CURRENT_SOURCE_DIR}/../clfsm/clfsm_factory.cc
    ${CMAKE_CURRENT_SOURCE_DIR}/../clfsm/clfsm_vector_factory.cc
    ${CMAKE_CURRENT_SOURCE_DIR}/../../Common/gu_util.cpp
)

# Headers to install
set(LIBCLFSM_HEADERS
    CLAction.h
    CLActionAction.h
    CLMachine.h
    CLMacros.h
    CLState.h
    CLTransition.h
    CLTransitionExpression.h
    FSMachine.h
    FSMachineVector.h
    FSMAction.h
    FSMActivity.h
    FSMAsynchronousSuspensibleMachine.h
    FSMExpression.h
    FSMFactory.h
    FSMState.h
    FSMSuspensibleMachine.h
    FSMTransition.h
    clfsm_factory.h
    clfsm_vector_factory.h
    stringConstants.h
)

# CLReflect API sources (optional reflection API)
set(LIBCLFSM_REFLECT_SOURCES
    ${CMAKE_CURRENT_SOURCE_DIR}/../clfsm/CLReflect/API_Interface.cc
    ${CMAKE_CURRENT_SOURCE_DIR}/../clfsm/CLReflect/API_MachineControl.c
    ${CMAKE_CURRENT_SOURCE_DIR}/../clfsm/CLReflect/API_MetaAction.c
    ${CMAKE_CURRENT_SOURCE_DIR}/../clfsm/CLReflect/API_MetaMachine.c
    ${CMAKE_CURRENT_SOURCE_DIR}/../clfsm/CLReflect/API_MetaMachine_Properties.c
    ${CMAKE_CURRENT_SOURCE_DIR}/../clfsm/CLReflect/API_MetaProperty.c
    ${CMAKE_CURRENT_SOURCE_DIR}/../clfsm/CLReflect/API_MetaProperty_Access.c
    ${CMAKE_CURRENT_SOURCE_DIR}/../clfsm/CLReflect/API_MetaState.c
    ${CMAKE_CURRENT_SOURCE_DIR}/../clfsm/CLReflect/API_MetaState_Properties.c
    ${CMAKE_CURRENT_SOURCE_DIR}/../clfsm/CLReflect/API_MetaTransition.c
    ${CMAKE_CURRENT_SOURCE_DIR}/../clfsm/CLReflect/API_TypeConversion.c
    ${CMAKE_CURRENT_SOURCE_DIR}/../clfsm/CLReflect/API_Util.c
)

# CLReflect API headers
set(LIBCLFSM_REFLECT_HEADERS
    CLReflect/API_Interface.h
    CLReflect/API_MachineControl.h
    CLReflect/API_MetaAction.h
    CLReflect/API_MetaMachine.h
    CLReflect/API_MetaMachine_Internal.h
    CLReflect/API_MetaMachine_Properties.h
    CLReflect/API_MetaProperty.h
    CLReflect/API_MetaProperty_Access.h
    CLReflect/API_MetaState.h
    CLReflect/API_MetaState_Properties.h
    CLReflect/API_MetaTransition.h
    CLReflect/API_Result.h
    CLReflect/API_Type.h
    CLReflect/API_TypeConversion.h
    CLReflect/API_TypeConversion_Vector.h
    CLReflect/API_Util.h
    CLReflect/CLMetaRegister.h
    CLReflect/CLReflectAPI.h
    CLReflect/CLReflectFunctionPointerTypes.h
    CLReflect/CLReflectIncludes.h
)
