#pragma clang diagnostic ignored "-Wunused-parameter"

#include "CLReflectAPI.h"
#include "CLReflectDemo.h"
#include "State_INITIAL.h"
#include "State_Names.h"
#include "State_States.h"
#include "State_MethodInvocation.h"

using namespace FSM;
using namespace CLM;
using namespace FSMCLReflectDemo;
using namespace State;

extern "C"
{
	refl_metaMachine Create_MetaMachine();
}

// Method Declarations
void INITIAL_OnEntry(refl_machine_t machine, refl_userData_t data);
void INITIAL_Internal(refl_machine_t machine, refl_userData_t data);
void INITIAL_OnExit(refl_machine_t machine, refl_userData_t data);
void Names_OnEntry(refl_machine_t machine, refl_userData_t data);
void Names_Internal(refl_machine_t machine, refl_userData_t data);
void Names_OnExit(refl_machine_t machine, refl_userData_t data);
void States_OnEntry(refl_machine_t machine, refl_userData_t data);
void States_Internal(refl_machine_t machine, refl_userData_t data);
void States_OnExit(refl_machine_t machine, refl_userData_t data);
void MethodInvocation_OnEntry(refl_machine_t machine, refl_userData_t data);
void MethodInvocation_Internal(refl_machine_t machine, refl_userData_t data);
void MethodInvocation_OnExit(refl_machine_t machine, refl_userData_t data);

// Method Implementations
void INITIAL_OnEntry(refl_machine_t machine, refl_userData_t data)
{
	CLReflectDemo* thisMachine = static_cast<CLReflectDemo*>(machine);
	INITIAL* thisState = static_cast<INITIAL*>(thisMachine->states()[0]);
	thisState->performOnEntry(thisMachine);
}
void INITIAL_Internal(refl_machine_t machine, refl_userData_t data)
{
	CLReflectDemo* thisMachine = static_cast<CLReflectDemo*>(machine);
	INITIAL* thisState = static_cast<INITIAL*>(thisMachine->states()[0]);
	thisState->performInternal(thisMachine);
}
void INITIAL_OnExit(refl_machine_t machine, refl_userData_t data)
{
	CLReflectDemo* thisMachine = static_cast<CLReflectDemo*>(machine);
	INITIAL* thisState = static_cast<INITIAL*>(thisMachine->states()[0]);
	thisState->performOnExit(thisMachine);
}
void Names_OnEntry(refl_machine_t machine, refl_userData_t data)
{
	CLReflectDemo* thisMachine = static_cast<CLReflectDemo*>(machine);
	Names* thisState = static_cast<Names*>(thisMachine->states()[1]);
	thisState->performOnEntry(thisMachine);
}
void Names_Internal(refl_machine_t machine, refl_userData_t data)
{
	CLReflectDemo* thisMachine = static_cast<CLReflectDemo*>(machine);
	Names* thisState = static_cast<Names*>(thisMachine->states()[1]);
	thisState->performInternal(thisMachine);
}
void Names_OnExit(refl_machine_t machine, refl_userData_t data)
{
	CLReflectDemo* thisMachine = static_cast<CLReflectDemo*>(machine);
	Names* thisState = static_cast<Names*>(thisMachine->states()[1]);
	thisState->performOnExit(thisMachine);
}
void States_OnEntry(refl_machine_t machine, refl_userData_t data)
{
	CLReflectDemo* thisMachine = static_cast<CLReflectDemo*>(machine);
	States* thisState = static_cast<States*>(thisMachine->states()[2]);
	thisState->performOnEntry(thisMachine);
}
void States_Internal(refl_machine_t machine, refl_userData_t data)
{
	CLReflectDemo* thisMachine = static_cast<CLReflectDemo*>(machine);
	States* thisState = static_cast<States*>(thisMachine->states()[2]);
	thisState->performInternal(thisMachine);
}
void States_OnExit(refl_machine_t machine, refl_userData_t data)
{
	CLReflectDemo* thisMachine = static_cast<CLReflectDemo*>(machine);
	States* thisState = static_cast<States*>(thisMachine->states()[2]);
	thisState->performOnExit(thisMachine);
}
void MethodInvocation_OnEntry(refl_machine_t machine, refl_userData_t data)
{
	CLReflectDemo* thisMachine = static_cast<CLReflectDemo*>(machine);
	MethodInvocation* thisState = static_cast<MethodInvocation*>(thisMachine->states()[3]);
	thisState->performOnEntry(thisMachine);
}
void MethodInvocation_Internal(refl_machine_t machine, refl_userData_t data)
{
	CLReflectDemo* thisMachine = static_cast<CLReflectDemo*>(machine);
	MethodInvocation* thisState = static_cast<MethodInvocation*>(thisMachine->states()[3]);
	thisState->performInternal(thisMachine);
}
void MethodInvocation_OnExit(refl_machine_t machine, refl_userData_t data)
{
	CLReflectDemo* thisMachine = static_cast<CLReflectDemo*>(machine);
	MethodInvocation* thisState = static_cast<MethodInvocation*>(thisMachine->states()[3]);
	thisState->performOnExit(thisMachine);
}
#pragma clang diagnostic pop
