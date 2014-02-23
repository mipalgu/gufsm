//
// State_MOTOR_NXT_ON.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "MotorNXT_Includes.h"
#include "MotorNXT.h"
#include "State_MOTOR_NXT_ON.h"

#include "State_MOTOR_NXT_ON_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMMotorNXT;
using namespace State;

MOTOR_NXT_ON::MOTOR_NXT_ON(const char *name): CLState(name, *new MOTOR_NXT_ON::OnEntry, *new MOTOR_NXT_ON::OnExit, *new MOTOR_NXT_ON::Internal)
{
}

MOTOR_NXT_ON::~MOTOR_NXT_ON()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

}

void MOTOR_NXT_ON::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "MotorNXT_VarRefs.mm"
#	include "State_MOTOR_NXT_ON_VarRefs.mm"
#	include "State_MOTOR_NXT_ON_OnEntry.mm"
}

void MOTOR_NXT_ON::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "MotorNXT_VarRefs.mm"
#	include "State_MOTOR_NXT_ON_VarRefs.mm"
#	include "State_MOTOR_NXT_ON_OnExit.mm"
}

void MOTOR_NXT_ON::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "MotorNXT_VarRefs.mm"
#	include "State_MOTOR_NXT_ON_VarRefs.mm"
#	include "State_MOTOR_NXT_ON_Internal.mm"
}
